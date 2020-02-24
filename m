Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id B6E0060F43
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 10:23:50 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z15so1369143wrl.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 02:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=IbbVJCkkAp+hCMyDB5kXYa6B/Ijjn2PCVZKfwSZQImM=;
	b=hkNRwkl9SRFZMppJsGxl0D+LUbwXr2J8X9R7z8taa1m0fxB96Mt2WHfn1KIgchd2+J
	+BxumOOkq+ghq6B3ryqDmBlnk3TfsU50P798lMcmb6ktJYeAdajsv98B6n+qwNsyoaPw
	bDUdeSQ1rXzgYij1R/pESG/GN6dn2KSHqY2bY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=IbbVJCkkAp+hCMyDB5kXYa6B/Ijjn2PCVZKfwSZQImM=;
	b=udETWOsMUYHDwH0rmN0uEufEh2cNfVsZA5ThMT+1les5+gAIt4D2aSvAilo6o7Zesp
	C1WsyFdhbTST7+HU9+g9QCKSjrMx0LYopUYQDvFrd7mQgap0MYiW4y/ESIkctwySxHPx
	ORvw2juVjOBegRzZhtKNr6qWgFDQFB8xu3KBQmIvot1sDE+oOuZikK179AL1fnpKs9QZ
	HZTq+Sn8vSMi0y7tqagd+Jpdi2vzI8vp9Pm5rnveIHSNXqaPmjlFKkEUf4tWkmj7dOl4
	pMNr89iLiPmCqkOafPSyIT0fDdGiIodkmTwf64jNdm9aJSPCt36Aj0YtdH1h23m7HF7w
	5xlQ==
X-Gm-Message-State: APjAAAUNL8iDdR+/dHrUgo/UotTDplKlkUmf5vdnLaS06rOKdGlDBhBI
	zSk0FA8Is0uX53OHvFZOBpKAsA==
X-Google-Smtp-Source: APXvYqybYRLRiUYQzeALNaOUP4bzhTs3k5TZXWlyK54aRzOFqVSxgt28csTQQJKNnzHIieHNuUA6DA==
X-Received: by 2002:a5d:63c9:: with SMTP id c9mr62766264wrw.281.1582539831213; 
	Mon, 24 Feb 2020 02:23:51 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s1sm17794038wro.66.2020.02.24.02.23.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 02:23:50 -0800 (PST)
Message-ID: <1f5759550013cdb49ebfb34194863af3d9dbcf6c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2020 10:23:49 +0000
In-Reply-To: <20200224031226.6965-1-akuster808@gmail.com>
References: <20200224031226.6965-1-akuster808@gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH] e2fsprogs: update to 1.45.5
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
X-List-Received-Date: Mon, 24 Feb 2020 10:23:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-02-23 at 19:12 -0800, Armin Kuster wrote:
> Dropping patch 0001-misc-create_inode.c-set-dir-s-mode-
> correctly.patch as upstream has not been accepted for over 2 years
> and we should not carry it if upstream has not taking it after all
> that time.

Looking at the patch, this worries me a lot. Why have upstream not
taken it? Did they say it was incorrect?

We wrote the original code to handle offline root here so its entirely
possible this is a value issue and we'll break filesystems if we don't
have that patch :(

I can't take a change like this without more info, CVE or not.

Cheers,

Richard


> Includes: CVE-2019-5188
> 
> see http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.45.5
> for more information.
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  ...ate_inode.c-set-dir-s-mode-correctly.patch | 41 ---------------
> ----
>  ...2fsprogs_1.45.4.bb => e2fsprogs_1.45.5.bb} |  3 +-
>  2 files changed, 1 insertion(+), 43 deletions(-)
>  delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-
> misc-create_inode.c-set-dir-s-mode-correctly.patch
>  rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.45.4.bb =>
> e2fsprogs_1.45.5.bb} (97%)
> 
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-
> create_inode.c-set-dir-s-mode-correctly.patch b/meta/recipes-
> devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-set-dir-s-mode-
> correctly.patch
> deleted file mode 100644
> index fc4a5409860..00000000000
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-
> create_inode.c-set-dir-s-mode-correctly.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From f6d188580c2c9599319076fee22f2424652c711c Mon Sep 17 00:00:00
> 2001
> -From: Robert Yang <liezhi.yang@windriver.com>
> -Date: Wed, 13 Sep 2017 19:55:35 -0700
> -Subject: [PATCH] misc/create_inode.c: set dir's mode correctly
> -
> -The dir's mode has been set by ext2fs_mkdir() with umask, so
> -reset it to the source's mode in set_inode_extra().
> -
> -Fixed when source dir's mode is 521, but tarball would be 721, this
> was
> -incorrect.
> -
> -Upstream-Status: Submitted
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ----
> - misc/create_inode.c | 9 ++++++++-
> - 1 file changed, 8 insertions(+), 1 deletion(-)
> -
> -diff --git a/misc/create_inode.c b/misc/create_inode.c
> -index 8ce3faf..50fbaa8 100644
> ---- a/misc/create_inode.c
> -+++ b/misc/create_inode.c
> -@@ -116,7 +116,14 @@ static errcode_t set_inode_extra(ext2_filsys
> fs, ext2_ino_t ino,
> - 
> - 	inode.i_uid = st->st_uid;
> - 	inode.i_gid = st->st_gid;
> --	inode.i_mode |= st->st_mode;
> -+	/*
> -+	 * The dir's mode has been set by ext2fs_mkdir() with umask, so
> -+	 * reset it to the source's mode
> -+	 */
> -+	if S_ISDIR(st->st_mode)
> -+		inode.i_mode = LINUX_S_IFDIR | st->st_mode;
> -+	else
> -+		inode.i_mode |= st->st_mode;
> - 	inode.i_atime = st->st_atime;
> - 	inode.i_mtime = st->st_mtime;
> - 	inode.i_ctime = st->st_ctime;
> --- 
> -2.10.2
> -
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
> b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.5.bb
> similarity index 97%
> rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
> rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.5.bb
> index 6e69eea21c3..7cd42b8137a 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.5.bb
> @@ -4,7 +4,6 @@ SRC_URI += "file://remove.ldconfig.call.patch \
>             file://run-ptest \
>             file://ptest.patch \
>             file://mkdir_p.patch \
> -           file://0001-misc-create_inode.c-set-dir-s-mode-
> correctly.patch \
>             file://0001-configure.ac-correct-AM_GNU_GETTEXT.patch \
>             file://0001-intl-do-not-try-to-use-gettext-defines-that-
> no-longe.patch \
>             "
> @@ -13,7 +12,7 @@ SRC_URI_append_class-native = " 
> file://e2fsprogs-fix-missing-check-for-permissio
>                                  file://quiet-debugfs.patch \
>  "
>  
> -SRCREV = "984ff8d6a0a1d5dc300505f67b38ed5047d51dac"
> +SRCREV = "c2b1ec5fbc99ab8a2b71dae45d486b3ea004f618"
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
>  
>  EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
> -- 
> 2.17.1
> 


