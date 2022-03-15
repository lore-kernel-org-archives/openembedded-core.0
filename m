Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F63C433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 14:43:30 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.11753.1647355409270295887
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 07:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OF7vZwGO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id q20so11391412wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 07:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=kNu80xGe7SyvhZ4yg0743u2zyumGoeb4p8CgOquyjv0=;
        b=OF7vZwGOUFSWwlg8EhrfSZmlzWxVjyfh5n+rblTA0KtKmAMbLXhDoDnIFnv3htGcm0
         ledgSSSIgsNvpIp8Z5lWrKdnE3d00xJPkwX0VyVEu1DoeBOIesZgj4nsMQev0G/22/jG
         zz3HKqk6K98gxeHlGcf4smQ4iT0n5ppcUqlrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=kNu80xGe7SyvhZ4yg0743u2zyumGoeb4p8CgOquyjv0=;
        b=YaE3Y1KNJIzgiIlDEOo9JxQ/EcR7J2qrwM3SDMgVpnoRUywB14ypZnLg1psDSNPUke
         c8H+9i9YRTc9JWVy9tIwcwzCn8UoUgOtD4LCs7BIkmhkDJYdx4L+mgw14eiImdqD7mEl
         SK66bQuNfNymUlVlUZBdP/x8yyzYHR1OzHfFBr9JXn/82z+cUZ36kDrj10rbxP8ERx1h
         roK02jrw7WPtyHZXenqZ+0eEN4Y1S7rDnFWDnHAFo+DF1HmZvSRDaSesxtF7TBqcowZ0
         6KkvJYHL9fVfcP+NE/OMenIJTfG5NqrLyNPhLsrjAu+LPRMzpKyTnlVwDrqicUHnCo90
         /kqg==
X-Gm-Message-State: AOAM530qHxTX9Wv8urXjYsm5tfzA7zukjAtB6pTsHAVd4CzpInJkUOHN
	qtwep0tLm+slBeqjWJXZSvBH2hzjuAvE7/6L
X-Google-Smtp-Source: 
 ABdhPJyMhFzcOmQ6RjQPyUTXAHGIjRiQ5cohOVsGeGBmCGHy4dSkTkcJCOllTdTO6U8cueY816bBLg==
X-Received: by 2002:a05:600c:19d1:b0:389:d567:e9a0 with SMTP id
 u17-20020a05600c19d100b00389d567e9a0mr3525148wmq.137.1647355407789;
        Tue, 15 Mar 2022 07:43:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58?
 ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 d11-20020a056000186b00b00203d45bfbc7sm2113923wri.7.2022.03.15.07.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 07:43:27 -0700 (PDT)
Message-ID: 
 <ed14b1fc5792c0290a833e266cfd0ffc90074ab3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] dpkg: upgrade 1.21.1 -> 1.21.2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Tue, 15 Mar 2022 14:43:25 +0000
In-Reply-To: <1647341464-78625-3-git-send-email-wangmy@fujitsu.com>
References: <1647341464-78625-1-git-send-email-wangmy@fujitsu.com>
	 <1647341464-78625-3-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 14:43:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163294

On Tue, 2022-03-15 at 18:51 +0800, wangmy wrote:
> The following patches refreshed for new version:
> 0001-build.c-ignore-return-of-1-from-tar-cf.patch
> 0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
> 0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
> 0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
> noman.patch
> remove-tar-no-timestamp.patch
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...ild.c-ignore-return-of-1-from-tar-cf.patch |  2 +-
>  ...s-expect-D-to-be-set-when-running-in.patch | 26 +++++++++----------
>  ...tion-doesn-t-work-properly-for-all-s.patch | 14 +++++-----
>  ...c-Remove-usage-of-clamp-mtime-in-tar.patch | 18 ++++++-------
>  meta/recipes-devtools/dpkg/dpkg/noman.patch   | 19 +++++++-------
>  .../dpkg/dpkg/remove-tar-no-timestamp.patch   | 17 ++++++++----
>  .../dpkg/{dpkg_1.21.1.bb => dpkg_1.21.2.bb}   |  2 +-
>  7 files changed, 51 insertions(+), 47 deletions(-)
>  rename meta/recipes-devtools/dpkg/{dpkg_1.21.1.bb => dpkg_1.21.2.bb} (95%)
> 
> diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
> index 4d3f238012..fb99bc43ba 100644
> --- a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
> +++ b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
> @@ -1,4 +1,4 @@
> -From cb47e9cd6735fcafd231748dab8884ae991b669c Mon Sep 17 00:00:00 2001
> +From 839f228556c00739f72534e8635195935eb3752f Mon Sep 17 00:00:00 2001
>  From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
>  Date: Tue, 16 Jun 2020 03:57:25 +0000
>  Subject: [PATCH] build.c: ignore return of 1 from tar -cf
> diff --git a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch b/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
> index 9ca7262eb9..75ae848264 100644
> --- a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
> +++ b/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
> @@ -12,14 +12,14 @@ ALIMON 2016/05/26
>  ALIMON 2017/02/21
>  KKang 2019/02/20
>  ---
> - src/script.c | 53 +++-------------------------------------------------
> - 1 file changed, 3 insertions(+), 50 deletions(-)
> + src/main/script.c | 54 +++--------------------------------------------
> + 1 file changed, 3 insertions(+), 51 deletions(-)
>  
> -diff --git a/src/script.c b/src/script.c
> -index abe65b6f7..621ff9b27 100644
> ---- a/src/script.c
> -+++ b/src/script.c
> -@@ -96,58 +96,11 @@ setexecute(const char *path, struct stat *stab)
> +diff --git a/src/main/script.c b/src/main/script.c
> +index abe65b6..0edb8f1 100644
> +--- a/src/main/script.c
> ++++ b/src/main/script.c
> +@@ -96,58 +96,10 @@ setexecute(const char *path, struct stat *stab)
>   static const char *
>   maintscript_pre_exec(struct command *cmd)
>   {
> @@ -49,9 +49,7 @@ index abe65b6f7..621ff9b27 100644
>  -			         "using --force-script-chrootless?"));
>  -		else if (rc)
>  -			ohshite(_("failed to chroot to '%.250s'"), instdir);
> -+	if (*instdir) {
> -+		setenv("D", instdir, 1);
> - 	}
> +-	}
>  -	/* Switch to a known good directory to give the maintainer script
>  -	 * a saner environment, also needed after the chroot(). */
>  -	if (chdir(changedir))
> @@ -68,19 +66,21 @@ index abe65b6f7..621ff9b27 100644
>  -		debug(dbg_scripts, "fork/exec %s (%s )", cmd->filename,
>  -		      args.buf);
>  -		varbuf_destroy(&args);
> --	}
> ++        if (*instdir) {
> ++                setenv("D", instdir, 1);
> + 	}
>  -	if (instdirlen == 0 || in_force(FORCE_SCRIPT_CHROOTLESS))
>  -		return cmd->filename;
>  -
>  -	if (strlen(cmd->filename) < instdirlen)
>  -		internerr("maintscript name '%s' length < instdir length %zd",
>  -		          cmd->filename, instdirlen);
> - 
> +-
>  -	return cmd->filename + instdirlen;
>  +	return cmd->filename;
>   }
>   
>   /**
>  -- 
> -2.17.1
> +2.25.1
>  
> diff --git a/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch b/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
> index 56c85c7733..bbd5aba418 100644
> --- a/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
> +++ b/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
> @@ -8,14 +8,14 @@ Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
>  
>  Upstream-Status: Inappropriate [embedded specific]
>  ---
> - src/archives.c | 3 ++-
> + src/main/archives.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>  
> -diff --git a/src/archives.c b/src/archives.c
> -index bff5f14..b711013 100644
> ---- a/src/archives.c
> -+++ b/src/archives.c
> -@@ -449,8 +449,9 @@ tarobject_set_mtime(struct tar_entry *te, const char *path)
> +diff --git a/src/main/archives.c b/src/main/archives.c
> +index 92340b9..7a55c27 100644
> +--- a/src/main/archives.c
> ++++ b/src/main/archives.c
> +@@ -490,8 +490,9 @@ tarobject_set_mtime(struct tar_entry *te, const char *path)
>   
>     if (te->type == TAR_FILETYPE_SYMLINK) {
>   #ifdef HAVE_LUTIMES
> @@ -27,5 +27,5 @@ index bff5f14..b711013 100644
>     } else {
>       if (utimes(path, tv))
>  -- 
> -2.1.4
> +2.25.1
>  
> diff --git a/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch b/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
> index 4f79a40d8b..117f9234ad 100644
> --- a/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
> +++ b/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
> @@ -2,9 +2,6 @@ From 8659eeeeda74d71e12080121f0b13a88cbdda433 Mon Sep 17 00:00:00 2001
>  From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
>  Date: Tue, 21 Feb 2017 11:23:27 -0600
>  Subject: [PATCH] dpkg-deb/build.c: Remove usage of --clamp-mtime in tar
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
>  
>  Recently dpkg added --clamp-mtime to tar to create reproducible
>  build tarballs [1].
> @@ -23,14 +20,14 @@ Update patch context for dpkg 1.19.4.
>  
>  Signed-off-by: Kai Kang <kai.kang@windriver.com>
>  ---
> - dpkg-deb/build.c | 2 +-
> + src/deb/build.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>  
> -diff --git a/dpkg-deb/build.c b/dpkg-deb/build.c
> -index 68d1875..053fcb7 100644
> ---- a/dpkg-deb/build.c
> -+++ b/dpkg-deb/build.c
> -@@ -457,7 +457,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
> +diff --git a/src/deb/build.c b/src/deb/build.c
> +index 5c74ff3..76613ad 100644
> +--- a/src/deb/build.c
> ++++ b/src/deb/build.c
> +@@ -505,7 +505,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
>   
>       command_init(&cmd, TAR, "tar -cf");
>       command_add_args(&cmd, "tar", "-cf", "-", "--format=gnu",
> @@ -40,4 +37,5 @@ index 68d1875..053fcb7 100644
>       if (options->mode)
>         command_add_args(&cmd, "--mode", options->mode, NULL);
>  -- 
> -2.11.0
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/dpkg/dpkg/noman.patch b/meta/recipes-devtools/dpkg/dpkg/noman.patch
> index a7f3cb8f45..6900716b11 100644
> --- a/meta/recipes-devtools/dpkg/dpkg/noman.patch
> +++ b/meta/recipes-devtools/dpkg/dpkg/noman.patch
> @@ -1,22 +1,21 @@
>  Upstream-Status: Inappropriate [disable feature]
>  
>  ---
> - Makefile.am | 3 +--
> - 1 file changed, 1 insertion(+), 2 deletions(-)
> + Makefile.am | 1 -
> + 1 file changed, 1 deletion(-)
>  
>  diff --git a/Makefile.am b/Makefile.am
> -index 0da52cb16..a1f79e0a2 100644
> +index d963a10..7cef7f5 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
> -@@ -13,8 +13,7 @@ SUBDIRS = \
> +@@ -11,7 +11,6 @@ SUBDIRS = \
>   	$(MAYBE_DSELECT) \
>   	scripts \
> - 	t-func \
> --	po \
> --	man
> -+	po
> + 	po \
> +-	man \
> + 	# EOL
>   
>   ACLOCAL_AMFLAGS = -I m4
> - 
>  -- 
> -2.11.0
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch b/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
> index 4f408ff777..ebf838ffe9 100644
> --- a/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
> +++ b/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
> @@ -3,11 +3,15 @@ busybox-1.19.4 tar utility doesn't support --warning=no-timestamp
>  Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
>  
>  Upstream-Status: Inappropriate [configuration]
> -Index: dpkg-1.17.1/dpkg-deb/extract.c
> -===================================================================
> ---- dpkg-1.17.1.orig/dpkg-deb/extract.c
> -+++ dpkg-1.17.1/dpkg-deb/extract.c
> -@@ -318,7 +318,6 @@ extracthalf(const char *debar, const cha
> +---
> + src/deb/extract.c | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/src/deb/extract.c b/src/deb/extract.c
> +index a1b2dc0..95e2372 100644
> +--- a/src/deb/extract.c
> ++++ b/src/deb/extract.c
> +@@ -333,7 +333,6 @@ extracthalf(const char *debar, const char *dir,
>   
>         command_add_arg(&cmd, "-f");
>         command_add_arg(&cmd, "-");
> @@ -15,3 +19,6 @@ Index: dpkg-1.17.1/dpkg-deb/extract.c
>   
>         m_dup2(p2[0],0);
>         close(p2[0]);
> +-- 
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/dpkg/dpkg_1.21.1.bb b/meta/recipes-devtools/dpkg/dpkg_1.21.2.bb
> similarity index 95%
> rename from meta/recipes-devtools/dpkg/dpkg_1.21.1.bb
> rename to meta/recipes-devtools/dpkg/dpkg_1.21.2.bb
> index ccb4f06d32..ef2e06ee4a 100644
> --- a/meta/recipes-devtools/dpkg/dpkg_1.21.1.bb
> +++ b/meta/recipes-devtools/dpkg/dpkg_1.21.2.bb
> @@ -18,6 +18,6 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
>  
>  SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
>  
> -SRCREV = "9b52f8fa74571049d868cb2af0643ee7f89a6151"
> +SRCREV = "a9580d3aec5f487a81664a462ec70ec1993f19f8"
>  
>  S = "${WORKDIR}/git"

Seems to break for dpkg-native:

https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/5235/steps/11/logs/stdio

(and other similar build failures)

Cheers,

Richard



