Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 501786FB80
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 08:32:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4S8Wfxb001539
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 May 2014 01:32:41 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 28 May 2014 01:32:40 -0700
Message-ID: <53859F25.3010905@windriver.com>
Date: Wed, 28 May 2014 16:32:37 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1401265145.git.hongxu.jia@windriver.com>
	<9e30cf78bf731ad1eb0da5e84f86d87b09dc617f.1401265145.git.hongxu.jia@windriver.com>
In-Reply-To: <9e30cf78bf731ad1eb0da5e84f86d87b09dc617f.1401265145.git.hongxu.jia@windriver.com>
Cc: saul.wold@intel.com
Subject: Re: [PATCH 2/3] elfutils: upgrade to 0.158
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
X-List-Received-Date: Wed, 28 May 2014 08:32:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/28/2014 04:27 PM, Hongxu Jia wrote:
> Add 'm4-biarch.m4-tweak-AC_RUN_IFELSE-for-cross-compiling.patch' to fix cross compiling failure;
>
> Rebase 'elf_additions.diff' for 0.158;
I am sorry to missing 
'm4-biarch.m4-tweak-AC_RUN_IFELSE-for-cross-compiling.patch'
and 'elf_additions.diff' in this patch.

V2 incoming.

//Hongxu


> Drop obsolete patches:
> - nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch
> - elfutils-ar-c-fix-num-passed-to-memset.patch
> - fix-build-gcc-4.8.patch
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   .../{elfutils_0.155.bb => elfutils_0.158.bb}        | 21 +++++++--------------
>   1 file changed, 7 insertions(+), 14 deletions(-)
>   rename meta/recipes-devtools/elfutils/{elfutils_0.155.bb => elfutils_0.158.bb} (81%)
>
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.155.bb b/meta/recipes-devtools/elfutils/elfutils_0.158.bb
> similarity index 81%
> rename from meta/recipes-devtools/elfutils/elfutils_0.155.bb
> rename to meta/recipes-devtools/elfutils/elfutils_0.158.bb
> index b1f410c..c97be74 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.155.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.158.bb
> @@ -7,23 +7,16 @@ DEPENDS = "libtool bzip2 zlib virtual/libintl"
>   
>   SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/${PV}/elfutils-${PV}.tar.bz2"
>   
> -SRC_URI[md5sum] = "163a5712b86f6bdfebdf233cc6e2192d"
> -SRC_URI[sha256sum] = "68444a4526416ffd68852ec3c6a40ceddcca46538297322405319884c5d30ed8"
> +SRC_URI[md5sum] = "050a4909e452d01ab4747fd69d4036e0"
> +SRC_URI[sha256sum] = "be27af5c21352f53e010342bf1c68e0b9e18232dbf3adec7e2f9b41f6bbe397d"
>   
> -SRC_URI += "\
> -        file://redhat-portability.diff \
> -        file://redhat-robustify.diff \
> -        file://hppa_backend.diff \
> -        file://arm_backend.diff \
> -        file://mips_backend.diff \
> -        file://m68k_backend.diff \
> -        file://elf_additions.diff \
> -        file://mempcpy.patch \
> +SRC_URI += " \
> +	file://elf_additions.diff \
> +	file://mempcpy.patch \
>   	file://dso-link-change.patch \
> -	file://nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch \
> -	file://elfutils-ar-c-fix-num-passed-to-memset.patch \
> -	file://fix-build-gcc-4.8.patch \
> +	file://m4-biarch.m4-tweak-AC_RUN_IFELSE-for-cross-compiling.patch \
>   "
> +
>   # Only apply when building uclibc based target recipe
>   SRC_URI_append_libc-uclibc = " file://uclibc-support.patch"
>   


