Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6F0A46B8D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 08:52:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 Mar 2014 01:52:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,763,1389772800"; d="scan'208";a="510835342"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by fmsmga002.fm.intel.com with ESMTP; 31 Mar 2014 01:52:45 -0700
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Mon, 31 Mar 2014 09:52:43 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.78]) by
	IRSMSX151.ger.corp.intel.com ([163.33.192.59]) with mapi id
	14.03.0123.003; Mon, 31 Mar 2014 09:52:43 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Jia, Hongxu (Wind River)" <hongxu.jia@windriver.com>
Thread-Topic: [OE-core] [PATCH 3/5] packagegroup-self-hosted: Use
	packagegroup-core-buildessential
Thread-Index: AQHPTLvBZNagI2JTjkSRkP6Afo0sJJr64V3w
Date: Mon, 31 Mar 2014 08:52:43 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB1CE75D4E@IRSMSX105.ger.corp.intel.com>
References: <cover.1395996410.git.hongxu.jia@windriver.com>
	<3ac712e3b9c2e6138fd34865a98a051ae16a45bf.1395996410.git.hongxu.jia@windriver.com>
	<969F26A8BAB325438E7EB80D3C3134FB1CE744B2@IRSMSX105.ger.corp.intel.com>
	<533927FA.3080600@windriver.com>
In-Reply-To: <533927FA.3080600@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] packagegroup-self-hosted: Use packagegroup-core-buildessential
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Mar 2014 08:52:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

BA is short for Build Appliance, and corresponds to build-appliance-image t=
arget.
Like I previously said, only building BA is not a proper test.
After the change that you proposed (a fine change, I might say), building i=
mages in BA is another test that needs to be performed in order to validate=
 your change.
See details here: https://www.yoctoproject.org/documentation/build-applianc=
e-manual

Regards,
Cristian Iorga
YP
Intel Corporation

-----Original Message-----
From: Hongxu Jia [mailto:hongxu.jia@windriver.com]=20
Sent: Monday, March 31, 2014 11:32 AM
To: Iorga, Cristian
Cc: openembedded-core@lists.openembedded.org; Georgescu, Alexandru C
Subject: Re: [OE-core] [PATCH 3/5] packagegroup-self-hosted: Use packagegro=
up-core-buildessential

On 03/29/2014 12:48 AM, Iorga, Cristian wrote:
> Hello all,
>
> This is an important patch, please make sure that BA still works correctl=
y after this one gets merged (including properly building an image in BA).

Hi Cristian,

I have built the build-appliance-image with this one merged, and everything=
 is ok, but I could not understand what the 'BA'
means, would you please explain that?

Thanks,
//Hongxu

> Thanks,
> Cristian Iorga
> YP
> Intel Corporation
>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org=20
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of=20
> Hongxu Jia
> Sent: Friday, March 28, 2014 11:44 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Wold, Saul
> Subject: [OE-core] [PATCH 3/5] packagegroup-self-hosted: Use=20
> packagegroup-core-buildessential
>
> From: Mark Hatle <mark.hatle@windriver.com>
>
> Instead of manually specifying build dependencies, use the packagegroup-c=
ore-buildessential.  This ensures there is only one place that needs to be =
modified when toolchain items and dependencies change.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 12 +-----=
------
>   1 file changed, 1 insertion(+), 11 deletions(-)
>
> diff --git=20
> a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb=20
> b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> index 5581d8e..fe49fb4 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> @@ -66,33 +66,23 @@ RRECOMMENDS_packagegroup-self-hosted-host-tools =3D=20
> "\
>  =20
>   # eglibc-utils: for rpcgen
>   RDEPENDS_packagegroup-self-hosted-sdk =3D "\
> -    autoconf \
> -    automake \
> -    binutils \
>       ccache \
>       coreutils \
> -    cpp \
>       distcc \
>       eglibc-utils \
>       eglibc-gconv-ibm850 \
>       file \
>       findutils \
> -    g++ \
> -    gcc \
>       intltool \
>       ldd \
>       less \
>       libssp \
>       libssp-dev \
>       libssp-staticdev \
> -    libstdc++ \
> -    libstdc++-dev \
> -    libtool \
> -    make \
>       mktemp \
> +    packagegroup-core-buildessential \
>       perl-module-re \
>       perl-module-text-wrap \
> -    pkgconfig \
>       quilt \
>       sed \
>       "
> --
> 1.8.1.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


