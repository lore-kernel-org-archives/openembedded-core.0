Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 671977D8EC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 11:05:09 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id r7so1657322otn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 04:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xsXO7UdAIyH0nn71r4Gf7H9A8O6ddXGKqJbNP7CnmQY=;
	b=FFaL05cwckKRcz0qbqJpxuzf9iFKLTsQGFYr+gXW3OtIOCY8uHo038F79zzA3FISd+
	mm/HY9xeCFOc17K/+wbKAOwJRYiGIG994Sh0cIuAxi/noa/MqJhCodtwJOty0BjmmdEz
	l81vm61JorBctIiO7JqiUGCbKzdins7X5ebwICZp+LKaH4EfmL2rn4l1VFa049DFFBwd
	8TkiJfSyR7UgjdP4GJjS7kdlPVnkFJC9A1Oc/cF9KbBOP3cDvKClZq2eWR/A8lBlMbb6
	N+jmlmiZaf9x+4AbyipJ7YfBvjuai+WdkY63ZtPMhd/6BHChgyWaI6BBfk5Df/LZ4fae
	xkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xsXO7UdAIyH0nn71r4Gf7H9A8O6ddXGKqJbNP7CnmQY=;
	b=EVWe9/zUxnGQ7sCSkys5l8y4So283BI5P9E0t4N2Sacu8haVSJwAwYNbKGCgywqktn
	c0U2kUH5SUsZkSvEx9YP+oHnQtrW1sNNhpOYsaMAJtg9nK2XN9Vw/dga60seqvLeSTbZ
	GmyVZN9lrAkjHx+8Hvy1KxCjKtySlwG6CmxQ7KPFDjNCJmCtD5eQt162mmuFaHFw+V1R
	cF6xvUUTD9/orkLG9j2v8Al9tnxrEEiRp5Jhq64Ch7KT2pMqB5IdNrrApwZx1UtV7NJh
	MKE3Kfn+Dkq5vde6EiVf6NnMJQWiz5S/BHECUBeK2mTnp+zTcTl0g/4R+j2BeB4c1lZg
	cg6Q==
X-Gm-Message-State: APjAAAWqWX1Uq2mILV8Np2ZghpauALmR7PXVk/Gm2CJIbG9leQWJ+jOF
	UR7ySnxW1LobGhShgYh1nYKn+uE31aGukNu3PxwuGY+K
X-Google-Smtp-Source: APXvYqwEjDngURoQrEuESILSw5zF7YUqwPkOH0N5EJfzbmKR1IREkRo5BpxOXPOU0RtLBE4HSZmirZiqDzpKhhL5Xxs=
X-Received: by 2002:a9d:6a15:: with SMTP id g21mr8956otn.28.1558523110405;
	Wed, 22 May 2019 04:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190522105847.6512-1-bunk@stusta.de>
In-Reply-To: <20190522105847.6512-1-bunk@stusta.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 May 2019 13:04:59 +0200
Message-ID: <CANNYZj-W+yN+28kSPUiMvoF_U6H80iDPhVLpYaKfH6RW+aLnmA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] apt: Remove workaround patches for no longer supported host distributions
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
X-List-Received-Date: Wed, 22 May 2019 11:05:09 -0000
Content-Type: text/plain; charset="UTF-8"

Our apt version is badly out of date; would you be able to work on an update?

As a starting point, you can take this:
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=akanavin/package-version-updates-later&id=e27b40c022654302e4846e47cc7da498a68d9666

Alex

On Wed, 22 May 2019 at 12:59, Adrian Bunk <bunk@stusta.de> wrote:
>
> All still supported host distributions have gcc >= 4.8.
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta/recipes-devtools/apt/apt-native.inc      |  2 -
>  .../apt/0001-fix-the-gcc-version-check.patch  | 74 -------------------
>  ...emove-Wsuggest-attribute-from-CFLAGS.patch | 43 -----------
>  3 files changed, 119 deletions(-)
>  delete mode 100644 meta/recipes-devtools/apt/apt/0001-fix-the-gcc-version-check.patch
>  delete mode 100644 meta/recipes-devtools/apt/apt/0001-remove-Wsuggest-attribute-from-CFLAGS.patch
>
> diff --git a/meta/recipes-devtools/apt/apt-native.inc b/meta/recipes-devtools/apt/apt-native.inc
> index ef232c1eb6..d826786329 100644
> --- a/meta/recipes-devtools/apt/apt-native.inc
> +++ b/meta/recipes-devtools/apt/apt-native.inc
> @@ -7,8 +7,6 @@ USE_NLS = "yes"
>
>  SRC_URI += "file://db_linking_hack.patch \
>              file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
> -            file://0001-remove-Wsuggest-attribute-from-CFLAGS.patch \
> -            file://0001-fix-the-gcc-version-check.patch \
>  "
>
>  python do_install () {
> diff --git a/meta/recipes-devtools/apt/apt/0001-fix-the-gcc-version-check.patch b/meta/recipes-devtools/apt/apt/0001-fix-the-gcc-version-check.patch
> deleted file mode 100644
> index 3ac92462c5..0000000000
> --- a/meta/recipes-devtools/apt/apt/0001-fix-the-gcc-version-check.patch
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -From 53c5d0982f03fd0e24c4195d6e1e42b9ade9d500 Mon Sep 17 00:00:00 2001
> -From: Roy Li <rongqing.li@windriver.com>
> -Date: Wed, 27 May 2015 14:30:28 +0800
> -Subject: [PATCH] fix the gcc version check
> -
> -Upstream-Status: pending
> -
> -"GCC diagnostic push" is gcc 4.6 feature, gcc 4.4.7 on centos did not know it
> -
> -Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ----
> - apt-pkg/contrib/macros.h     | 2 +-
> - apt-pkg/deb/debsrcrecords.cc | 4 ++--
> - apt-pkg/srcrecords.cc        | 4 ++--
> - 3 files changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/apt-pkg/contrib/macros.h b/apt-pkg/contrib/macros.h
> -index 2727fd8..0ecae50 100644
> ---- a/apt-pkg/contrib/macros.h
> -+++ b/apt-pkg/contrib/macros.h
> -@@ -136,7 +136,7 @@
> - #endif
> - #endif
> -
> --#if __GNUC__ >= 4
> -+#if __GNUC__ >= 4 + (6 >= __GNUC_MINOR__)
> -       #define APT_IGNORE_DEPRECATED_PUSH \
> -               _Pragma("GCC diagnostic push") \
> -               _Pragma("GCC diagnostic ignored \"-Wdeprecated-declarations\"")
> -diff --git a/apt-pkg/deb/debsrcrecords.cc b/apt-pkg/deb/debsrcrecords.cc
> -index e8295de..40160b2 100644
> ---- a/apt-pkg/deb/debsrcrecords.cc
> -+++ b/apt-pkg/deb/debsrcrecords.cc
> -@@ -139,13 +139,13 @@ bool debSrcRecordParser::Files(std::vector<pkgSrcRecords::File> &F)
> -    for (std::vector<pkgSrcRecords::File2>::const_iterator f2 = F2.begin(); f2 != F2.end(); ++f2)
> -    {
> -       pkgSrcRecords::File2 f;
> --#if __GNUC__ >= 4
> -+#if __GNUC__ >= 4 + (6 >= __GNUC_MINOR__)
> -       #pragma GCC diagnostic push
> -       #pragma GCC diagnostic ignored "-Wdeprecated-declarations"
> - #endif
> -       f.MD5Hash = f2->MD5Hash;
> -       f.Size = f2->Size;
> --#if __GNUC__ >= 4
> -+#if __GNUC__ >= 4 + (6 >= __GNUC_MINOR__)
> -       #pragma GCC diagnostic pop
> - #endif
> -       f.Path = f2->Path;
> -diff --git a/apt-pkg/srcrecords.cc b/apt-pkg/srcrecords.cc
> -index 53d7e60..1484828 100644
> ---- a/apt-pkg/srcrecords.cc
> -+++ b/apt-pkg/srcrecords.cc
> -@@ -157,7 +157,7 @@ bool pkgSrcRecords::Parser::Files2(std::vector<pkgSrcRecords::File2> &F2)/*{{{*/
> -    for (std::vector<pkgSrcRecords::File>::const_iterator f = F.begin(); f != F.end(); ++f)
> -    {
> -       pkgSrcRecords::File2 f2;
> --#if __GNUC__ >= 4
> -+#if __GNUC__ >= 4 + (6 >= __GNUC_MINOR__)
> -       #pragma GCC diagnostic push
> -       #pragma GCC diagnostic ignored "-Wdeprecated-declarations"
> - #endif
> -@@ -165,7 +165,7 @@ bool pkgSrcRecords::Parser::Files2(std::vector<pkgSrcRecords::File2> &F2)/*{{{*/
> -       f2.Size = f->Size;
> -       f2.Hashes.push_back(HashString("MD5Sum", f->MD5Hash));
> -       f2.FileSize = f->Size;
> --#if __GNUC__ >= 4
> -+#if __GNUC__ >= 4 + (6 >= __GNUC_MINOR__)
> -       #pragma GCC diagnostic pop
> - #endif
> -       f2.Path = f->Path;
> ---
> -2.1.4
> -
> diff --git a/meta/recipes-devtools/apt/apt/0001-remove-Wsuggest-attribute-from-CFLAGS.patch b/meta/recipes-devtools/apt/apt/0001-remove-Wsuggest-attribute-from-CFLAGS.patch
> deleted file mode 100644
> index 47870e3c8b..0000000000
> --- a/meta/recipes-devtools/apt/apt/0001-remove-Wsuggest-attribute-from-CFLAGS.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 9fdf50d63df08ee65e7d8e62c35f19ac4841bca9 Mon Sep 17 00:00:00 2001
> -From: Roy Li <rongqing.li@windriver.com>
> -Date: Wed, 27 May 2015 09:48:45 +0800
> -Subject: [PATCH] remove Wsuggest-attribute from CXXFLAGS
> -
> -Upstream-Status: Inappropriate
> -
> -Wsuggest-attribute is GCC 4.6 feature, centos6 is using GCC
> -4.4.7 which unknown this flag, so remove it from CXXFLAGS
> -
> -Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ----
> - buildlib/environment.mak.in | 1 -
> - test/libapt/makefile        | 1 -
> - 2 files changed, 2 deletions(-)
> -
> -diff --git a/buildlib/environment.mak.in b/buildlib/environment.mak.in
> -index 9620722..c344d01 100644
> ---- a/buildlib/environment.mak.in
> -+++ b/buildlib/environment.mak.in
> -@@ -14,7 +14,6 @@ CXXFLAGS+= @CXXFLAGS@ -Wall -Wextra
> - CXXFLAGS+= -Wcast-align -Wlogical-op -Wredundant-decls -Wmissing-declarations -Wunsafe-loop-optimizations
> - CXXFLAGS+= -Wctor-dtor-privacy -Wdisabled-optimization -Winit-self -Wmissing-include-dirs -Wnoexcept -Wsign-promo -Wundef
> - # suggests methods which already have such an attribute
> --#CXXFLAGS+= -Wsuggest-attribute=pure -Wsuggest-attribute=const -Wsuggest-attribute=noreturn
> - # sanitize options to be enabled for testing
> - #CXXFLAGS+= -fsanitize=address -fsanitize=undefined -fno-sanitize=vptr
> - # a bit too pedantic to be run by default
> -diff --git a/test/libapt/makefile b/test/libapt/makefile
> -index 5ff9cf6..c5b5190 100644
> ---- a/test/libapt/makefile
> -+++ b/test/libapt/makefile
> -@@ -40,7 +40,6 @@ CXXFLAGS += -pthread
> - # disable some flags for gtest again
> - CXXFLAGS+= -Wno-missing-declarations
> - CXXFLAGS+= -Wno-missing-field-initializers
> --CXXFLAGS+= -Wno-suggest-attribute=pure -Wno-suggest-attribute=const -Wno-suggest-attribute=noreturn
> - CXXFLAGS+= -Wno-undef
> -
> - # All Google Test headers.  Usually you shouldn't change this definition.
> ---
> -2.1.4
> -
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

