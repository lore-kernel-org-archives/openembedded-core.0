Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3B9D4610DC;
	Wed, 30 Oct 2013 08:08:50 +0000 (UTC)
Received: by mail-la0-f52.google.com with SMTP id eh20so755678lab.25
	for <multiple recipients>; Wed, 30 Oct 2013 01:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=AkVM/gtHA+qODT77olpIZ5aXTPLwvsL/KrRusgTPzb0=;
	b=HsO5nIf3FLsv41U+j7TdF7WzOhSrnKdM4ukxd2UujTnHkWUgNrE3Yi06FlhHcdSfop
	oYwQgQ1Ml3VeYSAKLRKIoD22cZ9tIy+7zZao5VnyzaBqKR0vqOOQDDGU/tAdX8r2qVOD
	pOOkXrSFcLpXGjgCU6BCGrgvE/MNrnkAm1k7Pw3BT20ZFwNweHgJpzGijvRygkZAgWG3
	aJriIIuz1Vh1ZyYLSmTMwk48ZvpIW3Uc1xSS9tuMwB9OQbMGgyQgFHjfiRz0iMip6wCg
	TzY+wEh9adl0vADkP12NIgI0CSc+u4zE8i70938+eM0M205ZqwPdnjsjgFau8vgPGcus
	S8+Q==
MIME-Version: 1.0
X-Received: by 10.112.158.225 with SMTP id wx1mr517155lbb.37.1383120531330;
	Wed, 30 Oct 2013 01:08:51 -0700 (PDT)
Received: by 10.112.52.74 with HTTP; Wed, 30 Oct 2013 01:08:51 -0700 (PDT)
In-Reply-To: <20131027112740.5FC1D50317@opal>
References: <20131027112740.5FC1D50317@opal>
Date: Wed, 30 Oct 2013 09:08:51 +0100
Message-ID: <CAAQYJAsn6i10jVbwSYV8Y+5ZhEiwOMa3RpoSHokZq1v2ormfNg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	Openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Laurentiu Palcu : m4: upgrade to 1.4.17
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
X-List-Received-Date: Wed, 30 Oct 2013 08:08:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Oct 27, 2013 at 12:27 PM,  <git@git.openembedded.org> wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: b7505d7c279888bd1675c1a8387edcf87cae8aac
> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=b7505d7c279888bd1675c1a8387edcf87cae8aac
>
> Author: Laurentiu Palcu <laurentiu.palcu@intel.com>
> Date:   Wed Oct 16 14:59:35 2013 +0300
>
> m4: upgrade to 1.4.17
>
> Refreshed remove-gets.patch to apply correctly and changed license
> checksum since some years were added to the license file.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>
> ---
>
>  meta/recipes-devtools/m4/m4-1.4.16.inc             |   16 ----------------
>  meta/recipes-devtools/m4/m4-1.4.17.inc             |   13 +++++++++++++
>  .../{m4-native_1.4.16.bb => m4-native_1.4.17.bb}   |    0
>  meta/recipes-devtools/m4/m4/remove-gets.patch      |   18 ++++++++++--------
>  .../m4/{m4_1.4.16.bb => m4_1.4.17.bb}              |    0
>  5 files changed, 23 insertions(+), 24 deletions(-)
>
> diff --git a/meta/recipes-devtools/m4/m4-1.4.16.inc b/meta/recipes-devtools/m4/m4-1.4.16.inc
> deleted file mode 100644
> index 01016d6..0000000
> --- a/meta/recipes-devtools/m4/m4-1.4.16.inc
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -require m4.inc
> -
> -LICENSE = "GPLv3"
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
> -                   file://examples/COPYING;md5=fbc986d45b3dae6725c29870dd6b669d"
> -
> -PR = "r4"
> -SRC_URI += "file://ac_config_links.patch \
> -            file://remove-gets.patch \
> -           "
> -
> -SRC_URI[md5sum] = "a5dfb4f2b7370e9d34293d23fd09b280"
> -SRC_URI[sha256sum] = "e9176a35bb13a1b08482359aa554ee8072794f58f00e4827bf0e06b570c827da"
> -
> -
> diff --git a/meta/recipes-devtools/m4/m4-1.4.17.inc b/meta/recipes-devtools/m4/m4-1.4.17.inc
> new file mode 100644
> index 0000000..790678e
> --- /dev/null
> +++ b/meta/recipes-devtools/m4/m4-1.4.17.inc
> @@ -0,0 +1,13 @@
> +require m4.inc
> +
> +LICENSE = "GPLv3"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
> +                   file://examples/COPYING;md5=4031593b2166d6c47cae282d944a7ede"
> +
> +SRC_URI += "file://ac_config_links.patch \
> +            file://remove-gets.patch \
> +           "
> +
> +SRC_URI[md5sum] = "a5e9954b1dae036762f7b13673a2cf76"
> +SRC_URI[sha256sum] = "3ce725133ee552b8b4baca7837fb772940b25e81b2a9dc92537aeaf733538c9e"
> diff --git a/meta/recipes-devtools/m4/m4-native_1.4.16.bb b/meta/recipes-devtools/m4/m4-native_1.4.17.bb
> similarity index 100%
> rename from meta/recipes-devtools/m4/m4-native_1.4.16.bb
> rename to meta/recipes-devtools/m4/m4-native_1.4.17.bb
> diff --git a/meta/recipes-devtools/m4/m4/remove-gets.patch b/meta/recipes-devtools/m4/m4/remove-gets.patch
> index 9c396d9..effb353 100644
> --- a/meta/recipes-devtools/m4/m4/remove-gets.patch
> +++ b/meta/recipes-devtools/m4/m4/remove-gets.patch
> @@ -4,18 +4,20 @@ undefining it.
>
>  Upstream-Status: Pending
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Index: m4-1.4.16/lib/stdio.in.h
> +Index: m4-1.4.17/lib/stdio.in.h
>  ===================================================================
> ---- m4-1.4.16.orig/lib/stdio.in.h      2011-03-01 08:39:29.000000000 -0800
> -+++ m4-1.4.16/lib/stdio.in.h   2012-07-03 08:32:08.145935928 -0700
> -@@ -161,8 +161,10 @@
> +--- m4-1.4.17.orig/lib/stdio.in.h      2013-10-16 14:41:01.678496227 +0300
> ++++ m4-1.4.17/lib/stdio.in.h   2013-10-16 14:41:48.849427839 +0300
> +@@ -717,10 +717,12 @@
>   /* It is very rare that the developer ever has full control of stdin,
> -    so any use of gets warrants an unconditional warning.  Assume it is
> -    always declared, since it is required by C89.  */
> +    so any use of gets warrants an unconditional warning; besides, C11
> +    removed it.  */
>  +#if defined gets
>   #undef gets
> + #if HAVE_RAW_DECL_GETS
>   _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
> + #endif
>  +#endif
>
> - #if @GNULIB_FOPEN@
> - # if @REPLACE_FOPEN@
> +
> + #if @GNULIB_OBSTACK_PRINTF@ || @GNULIB_OBSTACK_PRINTF_POSIX@
> diff --git a/meta/recipes-devtools/m4/m4_1.4.16.bb b/meta/recipes-devtools/m4/m4_1.4.17.bb
> similarity index 100%
> rename from meta/recipes-devtools/m4/m4_1.4.16.bb
> rename to meta/recipes-devtools/m4/m4_1.4.17.bb
>
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

This patch breaks the build of m4-native on Gentoo, it stalls on do_configure:

 checking whether sigaltstack...


Cheers

Andrea

