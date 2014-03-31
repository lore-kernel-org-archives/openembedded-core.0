Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 788526E89C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 10:41:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 31 Mar 2014 03:41:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,764,1389772800"; d="scan'208";a="483896734"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by orsmga001.jf.intel.com with ESMTP; 31 Mar 2014 03:41:09 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.78]) by
	IRSMSX103.ger.corp.intel.com ([163.33.3.157]) with mapi id
	14.03.0123.003; Mon, 31 Mar 2014 11:40:01 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 1/1] core-image-lsb: enforce pam as a needed
	distro feature
Thread-Index: AQHPTMfUDConnTHnmUqDGSb4ueKZ0Zr6+BDggAAI5VA=
Date: Mon, 31 Mar 2014 10:40:01 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB1CE75E67@IRSMSX105.ger.corp.intel.com>
References: <cover.1396259433.git.cristian.iorga@intel.com>
	<9e2ace2e2747ecda37004ea44d2e70de0586e185.1396259433.git.cristian.iorga@intel.com>
	<1396259888.14790.58.camel@ted>
	<969F26A8BAB325438E7EB80D3C3134FB1CE75DD0@IRSMSX105.ger.corp.intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB1CE75DD0@IRSMSX105.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] core-image-lsb: enforce pam as a needed distro feature
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
X-List-Received-Date: Mon, 31 Mar 2014 10:41:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,
I have checked, on the autobuilder the right association between LSB-enable=
d images and proper distro (in our case, poky-lsb) is in place.
As such, my patch should not cause any trouble.
Regards,
Cristian

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Iorga, Cristian
Sent: Monday, March 31, 2014 1:10 PM
To: Richard Purdie
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/1] core-image-lsb: enforce pam as a needed =
distro feature

No, but I will.

But is this a negative point of the patch, or the autobuilder should be cha=
nged?
I acted upon some personal observations, a discussion with Paul (he suggest=
ed the change) and also on this guide:
https://wiki.yoctoproject.org/wiki/LSB_Result (in which distro is set to po=
ky-lsb).

Regards,
Cristian

-----Original Message-----
From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org]
Sent: Monday, March 31, 2014 12:58 PM
To: Iorga, Cristian
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/1] core-image-lsb: enforce pam as a needed =
distro feature

On Mon, 2014-03-31 at 12:51 +0300, Cristian Iorga wrote:
> core-image-lsb only gave a warning:
> "WARNING: Building libpam but 'pam' isn't in DISTRO_FEATURES, PAM=20
> won't work correctly"
> when the proper DISTRO was not set for it.
> default choice would be DISTRO =3D "poky-lsb", but not necessarily,=20
> depending on each custom distro.
>=20
> This fix will enforce the proper usage of pam as a distro feature for=20
> core-image-lsb by giving an error instead of just a warning.
>=20
> Fixes [YOCTO #6073]
>=20
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>  meta/recipes-extended/images/core-image-lsb.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-extended/images/core-image-lsb.bb
> b/meta/recipes-extended/images/core-image-lsb.bb
> index ed316a6..ab61c6e 100644
> --- a/meta/recipes-extended/images/core-image-lsb.bb
> +++ b/meta/recipes-extended/images/core-image-lsb.bb
> @@ -9,4 +9,6 @@ IMAGE_INSTALL =3D "\
>      packagegroup-core-lsb \
>      "
> =20
> -inherit core-image
> +inherit core-image distro_features_check
> +
> +REQUIRED_DISTRO_FEATURES =3D "pam"


I have a feeling the autobuilder builds core-image-lsb in situations where =
DISTRO=3Dpoky, although I could be wrong. Have you checked?

Cheers,

Richard

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

