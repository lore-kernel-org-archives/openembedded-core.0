Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3D2516E891
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 05:08:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1D58VoY003910
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 21:08:32 -0800 (PST)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 12 Feb 2014 21:03:19 -0800
Message-ID: <52FC524A.8010805@windriver.com>
Date: Thu, 13 Feb 2014 13:04:10 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <rongqing.li@windriver.com>
References: <1392262485-26002-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1392262485-26002-1-git-send-email-rongqing.li@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] nss: avoid to use the hardcode kernel version
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
X-List-Received-Date: Thu, 13 Feb 2014 05:08:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

please drop this one

-Roy

On 02/13/2014 11:34 AM, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> Read kernel version from ${STAGING_KERNEL_DIR}/kernel-abiversion, to avoid
> to use the hardcode kernel version.
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   meta/recipes-support/nss/nss.inc |    6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/nss.inc
> index a6aeed8..bd7352d 100644
> --- a/meta/recipes-support/nss/nss.inc
> +++ b/meta/recipes-support/nss/nss.inc
> @@ -23,7 +23,7 @@ SRC_URI_append_class-target = "\
>   "
>   inherit siteinfo
>   PR = "r0"
> -DEPENDS = "sqlite3 nspr zlib nss-native"
> +DEPENDS = "sqlite3 nspr zlib nss-native virtual/kernel"
>   DEPENDS_class-native = "sqlite3-native nspr-native zlib-native"
>   RDEPENDS_${PN} = "perl"
>
> @@ -55,7 +55,7 @@ do_compile() {
>       export NSS_USE_SYSTEM_SQLITE=1
>       export NSS_ENABLE_ECC=1
>
> -    export OS_RELEASE=3.4
> +    export OS_RELEASE=`cat ${STAGING_KERNEL_DIR}/kernel-abiversion`
>       export OS_TARGET=Linux
>       export OS_ARCH=Linux
>
> @@ -95,7 +95,7 @@ do_install() {
>       export NSS_USE_SYSTEM_SQLITE=1
>       export NSS_ENABLE_ECC=1
>
> -    export OS_RELEASE=3.4
> +    export OS_RELEASE=`cat ${STAGING_KERNEL_DIR}/kernel-abiversion`
>       export OS_TARGET=Linux
>       export OS_ARCH=Linux
>
>

-- 
Best Reagrds,
Roy | RongQing Li

