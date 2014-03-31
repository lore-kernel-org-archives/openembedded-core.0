Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E7CD6E6FA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 08:32:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2V8W9gG021232
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 31 Mar 2014 01:32:10 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 31 Mar 2014 01:32:09 -0700
Message-ID: <533927FA.3080600@windriver.com>
Date: Mon, 31 Mar 2014 16:31:54 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "Iorga, Cristian" <cristian.iorga@intel.com>
References: <cover.1395996410.git.hongxu.jia@windriver.com>
	<3ac712e3b9c2e6138fd34865a98a051ae16a45bf.1395996410.git.hongxu.jia@windriver.com>
	<969F26A8BAB325438E7EB80D3C3134FB1CE744B2@IRSMSX105.ger.corp.intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB1CE744B2@IRSMSX105.ger.corp.intel.com>
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
X-List-Received-Date: Mon, 31 Mar 2014 08:32:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/29/2014 12:48 AM, Iorga, Cristian wrote:
> Hello all,
>
> This is an important patch, please make sure that BA still works correctly after this one gets merged (including properly building an image in BA).

Hi Cristian,

I have built the build-appliance-image with this one merged,
and everything is ok, but I could not understand what the 'BA'
means, would you please explain that?

Thanks,
//Hongxu

> Thanks,
> Cristian Iorga
> YP
> Intel Corporation
>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Hongxu Jia
> Sent: Friday, March 28, 2014 11:44 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Wold, Saul
> Subject: [OE-core] [PATCH 3/5] packagegroup-self-hosted: Use packagegroup-core-buildessential
>
> From: Mark Hatle <mark.hatle@windriver.com>
>
> Instead of manually specifying build dependencies, use the packagegroup-core-buildessential.  This ensures there is only one place that needs to be modified when toolchain items and dependencies change.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 12 +-----------
>   1 file changed, 1 insertion(+), 11 deletions(-)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> index 5581d8e..fe49fb4 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> @@ -66,33 +66,23 @@ RRECOMMENDS_packagegroup-self-hosted-host-tools = "\
>   
>   # eglibc-utils: for rpcgen
>   RDEPENDS_packagegroup-self-hosted-sdk = "\
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


