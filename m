Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C44C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 15:09:07 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.32613.1641827346135092041
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 07:09:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zk0/B/UI;
 spf=pass (domain: gmail.com, ip: 209.85.216.48,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so23197355pjf.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 07:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=QqFUkvpLiLobM0RReNxmqVj3NA2Egz4UP6NQdZelsZg=;
        b=Zk0/B/UIBiw+Jc22wqorHlt/79qFvL08a+Qih82D6cyDO6/h9o8+Leo1RhKWj9a7a3
         gCTSirBAd3CaZ3UwiOslsXBg0M8epZC/4Ak2nI3idoy+pOuIa639MflEq1kiH4C7u5ip
         pHtNUVIG0kbao2CAxBRm/IkclKYfFdxekJgyIU1tboyaVNtk+y4EgLVCt0ZQqV2t4J9I
         SjdTzRrmQu+UC7pkDkYvKYz6ZjZxrfTnBEmgxKyx5s4EBrkfXX2+djld00lQajFUiJo6
         eJoJFt2dKWbfoZmR62JxVyh3FdgyaC67bZmBLv+JjyQuojLApg7NqT8V4rYjIqY5D7dM
         qz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=QqFUkvpLiLobM0RReNxmqVj3NA2Egz4UP6NQdZelsZg=;
        b=OCd2salDdSFXqF8drqanunqIRCH9K6dI7AyVgi5NQQf+KVlyrIQ2RcZapUGd5alMyg
         L4enYlV+rz7GB9peyt17eHELVwRD0YL7aW+ww7NIpitmzdnlmj94geKdlZFZEtRd49xM
         cD6U7ClxcWd8lTBAaj7sXGfjEoM53VQ6TA0UYzxoEL0EVPN8G+S26RoLZjUTK5Sn/3lu
         Ml/zr+mNKbIB8igwNN2P4/yvllcF7Md9yptUUpxtJ4vuh7F0r06Rnn8sbBdpYjHm7AIy
         //8wvi2luh85oF7lNsweZYGZLPIhgA0If+SSaTGDjrdMRpufaUlwvqvt66yn6tmzO/vK
         lsQw==
X-Gm-Message-State: AOAM531vajSLgRBRL2X9QuuBeo+JhrPN+16o7CAFfflKUcZi6nw390kQ
	xAyrBWZWNo8NlcMEwaukgf0=
X-Google-Smtp-Source: 
 ABdhPJz/3YNxxJxDshTtCLb9RGRRDeRg5mEcH8unhrjVIyVHiuxmDi8lnigLhYVSslMdAdjxTY8YiQ==
X-Received: by 2002:a17:902:8f8f:b0:14a:766:67f1 with SMTP id
 z15-20020a1709028f8f00b0014a076667f1mr15029303plo.34.1641827345457;
        Mon, 10 Jan 2022 07:09:05 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:27a2:6de:97d4:82a2?
 ([2601:202:4180:a5c0:27a2:6de:97d4:82a2])
        by smtp.gmail.com with ESMTPSA id
 z12sm7673795pfe.110.2022.01.10.07.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 07:09:04 -0800 (PST)
Subject: Re: [OE-core] [PATCH 04/14] busybox: update 1.34.1 -> 1.35.0
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
 Andrej Valek <andrej.valek@siemens.com>,
 Peter Marko <peter.marko@siemens.com>
References: <20220109222732.2252416-1-alex@linutronix.de>
 <20220109222732.2252416-4-alex@linutronix.de>
From: akuster808 <akuster808@gmail.com>
Message-ID: <dc859a14-4954-743b-dcb1-3b703e6b887b@gmail.com>
Date: Mon, 10 Jan 2022 07:09:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220109222732.2252416-4-alex@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 15:09:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160367



On 1/9/22 2:27 PM, Alexander Kanavin wrote:
> Drop upstreamed patch.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../0001-mktemp-add-tmpdir-option.patch       | 81 -------------------
>  .../busybox/busybox/fail_on_no_media.patch    | 28 ++++---
>  .../{busybox_1.34.1.bb => busybox_1.35.0.bb}  |  3 +-
>  3 files changed, 19 insertions(+), 93 deletions(-)
>  delete mode 100644 meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patch
>  rename meta/recipes-core/busybox/{busybox_1.34.1.bb => busybox_1.35.0.bb} (93%)
>
> diff --git a/meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patch b/meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patch
> deleted file mode 100644
> index 4a1960dff2..0000000000
> --- a/meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patch
> +++ /dev/null
> @@ -1,81 +0,0 @@
> -From ceb378209f953ea745ed93a8645567196380ce3c Mon Sep 17 00:00:00 2001
> -From: Andrej Valek <andrej.valek@siemens.com>
> -Date: Thu, 24 Jun 2021 19:13:22 +0200
> -Subject: [PATCH] mktemp: add tmpdir option
> -
> -Make mktemp more compatible with coreutils.
> -- add "--tmpdir" option
> -- add long variants for "d,q,u" options

Is adding new feature in the scope of Yocto/OE LTS?

-armin
> -
> -Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2021-June/088932.html]
> -
> -Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> -Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ----
> - coreutils/mktemp.c | 26 ++++++++++++++++++--------
> - 1 file changed, 18 insertions(+), 8 deletions(-)
> -
> -diff --git a/coreutils/mktemp.c b/coreutils/mktemp.c
> -index 5393320a5..05c6d98c6 100644
> ---- a/coreutils/mktemp.c
> -+++ b/coreutils/mktemp.c
> -@@ -39,16 +39,17 @@
> - //kbuild:lib-$(CONFIG_MKTEMP) += mktemp.o
> - 
> - //usage:#define mktemp_trivial_usage
> --//usage:       "[-dt] [-p DIR] [TEMPLATE]"
> -+//usage:       "[-dt] [-p DIR, --tmpdir[=DIR]] [TEMPLATE]"
> - //usage:#define mktemp_full_usage "\n\n"
> - //usage:       "Create a temporary file with name based on TEMPLATE and print its name.\n"
> - //usage:       "TEMPLATE must end with XXXXXX (e.g. [/dir/]nameXXXXXX).\n"
> - //usage:       "Without TEMPLATE, -t tmp.XXXXXX is assumed.\n"
> --//usage:     "\n	-d	Make directory, not file"
> --//usage:     "\n	-q	Fail silently on errors"
> --//usage:     "\n	-t	Prepend base directory name to TEMPLATE"
> --//usage:     "\n	-p DIR	Use DIR as a base directory (implies -t)"
> --//usage:     "\n	-u	Do not create anything; print a name"
> -+//usage:     "\n	-d			Make directory, not file"
> -+//usage:     "\n	-q			Fail silently on errors"
> -+//usage:     "\n	-t			Prepend base directory name to TEMPLATE"
> -+//usage:     "\n	-p DIR, --tmpdir[=DIR]	Use DIR as a base directory (implies -t)"
> -+//usage:     "\n				For --tmpdir is a optional one."
> -+//usage:     "\n	-u			Do not create anything; print a name"
> - //usage:     "\n"
> - //usage:     "\nBase directory is: -p DIR, else $TMPDIR, else /tmp"
> - //usage:
> -@@ -72,13 +73,22 @@ int mktemp_main(int argc UNUSED_PARAM, char **argv)
> - 		OPT_t = 1 << 2,
> - 		OPT_p = 1 << 3,
> - 		OPT_u = 1 << 4,
> -+		OPT_td = 1 << 5,
> - 	};
> - 
> - 	path = getenv("TMPDIR");
> - 	if (!path || path[0] == '\0')
> - 		path = "/tmp";
> - 
> --	opts = getopt32(argv, "^" "dqtp:u" "\0" "?1"/*1 arg max*/, &path);
> -+	opts = getopt32long(argv, "^"
> -+	       "dqtp:u\0"
> -+	       "?1" /* 1 arg max */,
> -+	       "directory\0" No_argument       "d"
> -+	       "quiet\0"     No_argument       "q"
> -+	       "dry-run\0"   No_argument       "u"
> -+	       "tmpdir\0"    Optional_argument "\xff"
> -+	       , &path, &path
> -+	);
> - 
> - 	chp = argv[optind];
> - 	if (!chp) {
> -@@ -95,7 +105,7 @@ int mktemp_main(int argc UNUSED_PARAM, char **argv)
> - 		goto error;
> - 	}
> - #endif
> --	if (opts & (OPT_t|OPT_p))
> -+	if (opts & (OPT_t|OPT_p|OPT_td))
> - 		chp = concat_path_file(path, chp);
> - 
> - 	if (opts & OPT_u) {
> --- 
> -2.11.0
> -
> diff --git a/meta/recipes-core/busybox/busybox/fail_on_no_media.patch b/meta/recipes-core/busybox/busybox/fail_on_no_media.patch
> index 820acc2684..38db52538e 100644
> --- a/meta/recipes-core/busybox/busybox/fail_on_no_media.patch
> +++ b/meta/recipes-core/busybox/busybox/fail_on_no_media.patch
> @@ -1,3 +1,8 @@
> +From a35e79002d36cca3c272ba5625aec86d6b7a38a8 Mon Sep 17 00:00:00 2001
> +From: Saul Wold <sgw@linux.intel.com>
> +Date: Tue, 9 Apr 2013 23:25:54 -0700
> +Subject: [PATCH] busybox: fail on no media
> +
>  Upstream-Status: Denied
>  [https://www.mail-archive.com/busybox@busybox.net/msg22354.html]
>  
> @@ -10,16 +15,18 @@ removed, but that would be harder to accomplish.
>  
>  Signed-off-by: Saul Wold <sgw@linux.intel.com>
>  
> +---
> + util-linux/mount.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
>  
> -Index: busybox-1.20.2/util-linux/mount.c
> -===================================================================
> ---- busybox-1.20.2.orig/util-linux/mount.c
> -+++ busybox-1.20.2/util-linux/mount.c
> -@@ -598,7 +598,13 @@ static int mount_it_now(struct mntent *m
> - 				break;
> +diff --git a/util-linux/mount.c b/util-linux/mount.c
> +index 4e65b6b..9d7a566 100644
> +--- a/util-linux/mount.c
> ++++ b/util-linux/mount.c
> +@@ -746,6 +746,14 @@ static int mount_it_now(struct mntent *mp, unsigned long vfsflags, char *filtero
>   			errno = errno_save;
>   		}
> --
> + 
>  +		/*
>  +		 * Break if there is no media, no point retrying for all
>  +		 * fs types since there is no media available
> @@ -27,6 +34,7 @@ Index: busybox-1.20.2/util-linux/mount.c
>  +		if (rc == -1 && errno == ENOMEDIUM) {
>  +			bb_perror_msg_and_die("mounting %s on %s failed", mp->mnt_fsname, mp->mnt_dir);
>  +		}
> - 		if (!rc || (vfsflags & MS_RDONLY) || (errno != EACCES && errno != EROFS))
> - 			break;
> - 		if (!(vfsflags & MS_SILENT))
> ++
> + 		// Should we retry read-only mount?
> + 		if (vfsflags & MS_RDONLY)
> + 			break;		// no, already was tried
> diff --git a/meta/recipes-core/busybox/busybox_1.34.1.bb b/meta/recipes-core/busybox/busybox_1.35.0.bb
> similarity index 93%
> rename from meta/recipes-core/busybox/busybox_1.34.1.bb
> rename to meta/recipes-core/busybox/busybox_1.35.0.bb
> index 3651c06126..7ce1717046 100644
> --- a/meta/recipes-core/busybox/busybox_1.34.1.bb
> +++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
> @@ -46,8 +46,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>             file://0001-testsuite-use-www.example.org-for-wget-test-cases.patch \
>             file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
>             file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
> -           file://0001-mktemp-add-tmpdir-option.patch \
>             "
>  SRC_URI:append:libc-musl = " file://musl.cfg "
>  
> -SRC_URI[tarball.sha256sum] = "415fbd89e5344c96acf449d94a6f956dbed62e18e835fc83e064db33a34bd549"
> +SRC_URI[tarball.sha256sum] = "faeeb244c35a348a334f4a59e44626ee870fb07b6884d68c10ae8bc19f83a694"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160307): https://lists.openembedded.org/g/openembedded-core/message/160307
> Mute This Topic: https://lists.openembedded.org/mt/88311436/3616698
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


