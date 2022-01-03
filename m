Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19649C433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 17:42:59 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.31583.1641231777642597464
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 09:42:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=auvpAz+v;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id k18so34535924wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 09:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=0q8kNIWdVd0oabp80kEyVHLTqHIr95lHfEjHYjY/XKE=;
        b=auvpAz+v/cyWvTtB3rnle4Ej43VAowDu/f9DIe2doZYaOgXRpVTDY5cX9NT/XF28xg
         O96mnXYnJUMbPdbl8KjeutSYS8auFSUjyrp8Mc5Ega+CxTLOZl9bwtTQV/xVJjfcJd1y
         UJ2SUXiigEtGObavJPawEEvW6Ct7YanuFVlhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0q8kNIWdVd0oabp80kEyVHLTqHIr95lHfEjHYjY/XKE=;
        b=HQT60QNQ/R1iIlsnWW8VdMNScI1Ub/diwKJGOngC4kcotX41tasYuRf94ibCgBwPn7
         sONLbBYxgeHUT6Sp4/GTZirM2dix6Sx1QC3DiytgbWNIbDmnmqTTsvI8/sgSkFCqiSHn
         Ll5Iwic9p5OAoJAsd1WFPP7C0fV4B84LTiqKm+m/wdVsx1L6fCfUuLCel0BD4UgMChkg
         lGxMpuiAq+LvsMHDTHX9MfaI5z723xyq+z25tk8gdJFbCb3rwR4Y2gogKAsu9YNEQFAo
         XH+XyVZ7I+VeDxJYLSTdvzucl5b0EkJOG44QI32BTBYAafccvdnnnLD/OWouEO2SZUYK
         ILjA==
X-Gm-Message-State: AOAM533TvrDqT7o4Yw83432bTYzbgTVn0ba2cWAV6eyYO9RuW7OyZMD9
	xIu0TLrprxi5WmpTeADXKSZLZQ==
X-Google-Smtp-Source: 
 ABdhPJy4EdivZMGymMQIRR9v4n1BeSXExm5v8VcViWS9+DZiYmIlYiN4nJ56CxPrxK60zdoiZxAKhQ==
X-Received: by 2002:a05:6000:22a:: with SMTP id
 l10mr39391666wrz.534.1641231776084;
        Mon, 03 Jan 2022 09:42:56 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6e9d:9e0c:645b:fce3?
 ([2001:8b0:aba:5f3c:6e9d:9e0c:645b:fce3])
        by smtp.gmail.com with ESMTPSA id
 g18sm35879443wrv.42.2022.01.03.09.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 09:42:55 -0800 (PST)
Message-ID: 
 <751c03719644795404dcf983123f3b9ea50aec72.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 05/24] e2fsprogs: upgrade 1.46.4 -> 1.46.5
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@gmail.com>, OpenEmbedded Core Mailing
	List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Date: Mon, 03 Jan 2022 17:42:54 +0000
In-Reply-To: <20220103161854.301148-5-otavio@ossystems.com.br>
References: <20220103161854.301148-1-otavio@ossystems.com.br>
	 <20220103161854.301148-5-otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 17:42:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160142

On Mon, 2022-01-03 at 13:18 -0300, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  ...ct_io-expect-correct-expected-output.patch | 69 -------------------
>  ...-missing-check-for-permission-denied.patch |  3 +-
>  .../e2fsprogs/e2fsprogs/quiet-debugfs.patch   |  3 +-
>  ...2fsprogs_1.46.4.bb => e2fsprogs_1.46.5.bb} |  9 +--
>  4 files changed, 7 insertions(+), 77 deletions(-)
>  delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-tests-u_direct_io-expect-correct-expected-output.patch
>  rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.46.4.bb => e2fsprogs_1.46.5.bb} (94%)
> 
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-tests-u_direct_io-expect-correct-expected-output.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-tests-u_direct_io-expect-correct-expected-output.patch
> deleted file mode 100644
> index f198df83eb..0000000000
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-tests-u_direct_io-expect-correct-expected-output.patch
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -From ea5adf259e01c790f9ba69d6fe88d691de410b6f Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Sun, 22 Aug 2021 14:37:32 +0200
> -Subject: [PATCH] tests/u_direct_io/expect: correct expected output
> -
> -This is likely the right fix, but upstream needs to confirm.
> -
> -Upstream-Status: Inappropriate [issue reported https://github.com/tytso/e2fsprogs/issues/80]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - tests/u_direct_io/expect | 16 +++++++++-------
> - 1 file changed, 9 insertions(+), 7 deletions(-)
> -
> -diff --git a/tests/u_direct_io/expect b/tests/u_direct_io/expect
> -index b0cdc730..830cbd75 100644
> ---- a/tests/u_direct_io/expect
> -+++ b/tests/u_direct_io/expect
> -@@ -19,8 +19,8 @@ Filesystem OS type:       Linux
> - Inode count:              32768
> - Block count:              32768
> - Reserved block count:     1638
> --Overhead clusters:        5131
> --Free blocks:              27631
> -+Overhead clusters:        6155
> -+Free blocks:              26607
> - Free inodes:              32757
> - First block:              0
> - Block size:               4096
> -@@ -29,27 +29,29 @@ Reserved GDT blocks:      7
> - Blocks per group:         32768
> - Fragments per group:      32768
> - Inodes per group:         32768
> --Inode blocks per group:   1024
> -+Inode blocks per group:   2048
> - Flex block group size:    16
> - Mount count:              0
> - Check interval:           15552000 (6 months)
> - Reserved blocks uid:      0
> - Reserved blocks gid:      0
> - First inode:              11
> --Inode size:	          128
> -+Inode size:	          256
> -+Required extra isize:     32
> -+Desired extra isize:      32
> - Journal inode:            8
> - Default directory hash:   half_md4
> - Journal backup:           inode blocks
> - Directories:              2
> -  Group  0: block bitmap at 9, inode bitmap at 25, inode table at 41
> --           27631 free blocks, 32757 free inodes, 2 used directories
> -+           26607 free blocks, 32757 free inodes, 2 used directories
> - e2fsck -fn -N test_filesys $LOOP
> - Pass 1: Checking inodes, blocks, and sizes
> - Pass 2: Checking directory structure
> - Pass 3: Checking directory connectivity
> - Pass 4: Checking reference counts
> - Pass 5: Checking group summary information
> --test_filesys: 11/32768 files (9.1% non-contiguous), 5137/32768 blocks
> -+test_filesys: 11/32768 files (9.1% non-contiguous), 6161/32768 blocks
> - Exit status is 0
> - e2fsck -fn -N test_filesys $TMPFILE
> - Pass 1: Checking inodes, blocks, and sizes
> -@@ -57,5 +59,5 @@ Pass 2: Checking directory structure
> - Pass 3: Checking directory connectivity
> - Pass 4: Checking reference counts
> - Pass 5: Checking group summary information
> --test_filesys: 11/32768 files (9.1% non-contiguous), 5137/32768 blocks
> -+test_filesys: 11/32768 files (9.1% non-contiguous), 6161/32768 blocks
> - Exit status is 0
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
> index a4f98246bb..045ffa6086 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
> @@ -1,7 +1,8 @@
> -From f1e161a48f74b46ae3c99921971c4b5ae8d587c9 Mon Sep 17 00:00:00 2001
> +From ad7f927c0d95fd461f45f478bbe6355b8df46eac Mon Sep 17 00:00:00 2001
>  From: Jackie Huang <jackie.huang@windriver.com>
>  Date: Wed, 10 Aug 2016 11:19:44 +0800
>  Subject: [PATCH] Fix missing check for permission denied.
> +Organization: O.S. Systems Software LTDA.
>  
>  If the path to "ROOT_SYSCONFDIR/mke2fs.conf" has a permission denied problem,
>  then the get_dirlist() call will return EACCES. But the code in profile_init
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
> index 41a4047622..6f3ad342cc 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
> @@ -1,7 +1,8 @@
> -From 550b5fbece84dde16ce9910c2cad390ea4a2f5d5 Mon Sep 17 00:00:00 2001
> +From 5e5820fd214a0bc25907053ae6a76eb1ec493134 Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@intel.com>
>  Date: Mon, 23 Dec 2013 13:38:34 +0000
>  Subject: [PATCH] e2fsprogs: silence debugfs
> +Organization: O.S. Systems Software LTDA.
>  
>  When executing a script don't echo every command, as we do this for entire
>  filesystems at rootfs time.

Thanks for the upgrades!

Adding OS Systems headers to existing patch files like this with no real other
changes doesn't seem like it may have been intended?

Cheers,

Richard




