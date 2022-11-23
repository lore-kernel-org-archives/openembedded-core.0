Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B584C433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 19:42:25 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.6144.1669232537634389321
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Nov 2022 11:42:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=flvtBd7q;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id y14-20020a17090a2b4e00b002189a1b84d4so2747561pjc.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 11:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7+ZwXCcvXd+AwW2rRCkTotqP6KzoIZVF/kscQd/Znlw=;
        b=flvtBd7qASlqkG2fota7i7q9ga56Gf2INUzlfgRJ+/Vv8wS5GvqBUK1mEoWZG3Xc8/
         66tlUx+llKp/YSYR7ofvx4t1Ww3tYeJBgM1YUc+sucDQwhoFBjj9YXXZc/0el1/GyC9Y
         tMMT3WMrzubIh67ZeY7tyZPcIuGABEmwIBKsHEsoi5VtjbOg3/PJaqgmIP2RKmJT5oaJ
         OR8ylCW+Ti6LwzyvuA5GUp1ViqW5AEoeLZ/fYuXKXtwZ7L0C/D74aQCozwlIM0E4C01w
         U3jOAQtfpOISoAlmwHBmvYbSYtt7bpGBMU9Ti2JNw+ZEuB5TuX5F6FvF3GqQ/Ir77Y5X
         gTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+ZwXCcvXd+AwW2rRCkTotqP6KzoIZVF/kscQd/Znlw=;
        b=Q+Zx3qpx4zogURekemWaPdx5iAq8C+w3EpMI+4Ra3xi5/Mv5lggBSaJf+thwNj7I2c
         nQNbNe7BBcQl9VjIwa6UBhVilZd+Ashh3sIJoLHEVe/ChXfPtiMVMID1dge/tQ+/UJ7U
         Et1qVWPGBpDnNLeCdZaSc7LSZyCotP5uyMwypTsenNVkYDcfNei2FAiuiU/YEl1DVYZl
         jD0KV6RabQ4EPOI2z/Bzwc1BAZBiKW1y/rRLiNqr4GYzGPR5zDx5GNvj2FT90A2bbFfT
         0NQxYxpDhuJHLqd8yjtO893WAP01Ipt1DjTqjST7yIWB1GSBSTvQs8TmydzdUgtg82BX
         jocQ==
X-Gm-Message-State: ANoB5pl00+CmwLE2HyU/FzpkonPg6TUwHuox+83RMjX1+Y2gNuqUbE01
	BwDDUVunj4eSIfWTSz3D1qeAVbQlKSc=
X-Google-Smtp-Source: AA0mqf413horJt40+QZj+pWJzRMf1J7uEgD9nYJaDrbLhbcSVzmfCifNUH0TkF7fBnjR4Sble+950w==
X-Received: by 2002:a17:902:7006:b0:181:b55a:f987 with SMTP id y6-20020a170902700600b00181b55af987mr10144436plk.67.1669232536729;
        Wed, 23 Nov 2022 11:42:16 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::a42c])
        by smtp.gmail.com with ESMTPSA id b12-20020aa78ecc000000b0056b2e70c2f5sm11796416pfr.25.2022.11.23.11.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 11:42:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] rsync: Delete upstreamed patch
Date: Wed, 23 Nov 2022 11:42:14 -0800
Message-Id: <20221123194214.2317638-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 19:42:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173725

It has been applied upstream see
https://github.com/WayneD/rsync/commit/9a3449a3980421f84ac55498ba565bc112b20d6c

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...antic-errors-at-the-end-of-configure.patch | 44 -------------------
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |  1 -
 2 files changed, 45 deletions(-)
 delete mode 100644 meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch

diff --git a/meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch b/meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch
deleted file mode 100644
index f11f13dd48..0000000000
--- a/meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From e6321b0b456fca987b48d5ec7aba7e2826128e5f Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Thu, 18 Aug 2022 07:46:28 -0700
-Subject: [PATCH] Turn on -pedantic-errors at the end of 'configure'
-
-Problem reported by Khem Raj in:
-https://lists.gnu.org/r/autoconf-patches/2022-08/msg00009.html
-Upstream-Status: Submitted [https://lists.samba.org/archive/rsync/2022-August/032862.html]
-
----
- configure.ac | 20 ++++++++++++++++++++
- 1 file changed, 20 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index a2c9955..afabef0 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1437,6 +1437,26 @@ case "$CC" in
-     ;;
- esac
- 
-+# Enable -pedantic-errors last, so that it doesn't mess up other
-+# 'configure' tests.  For example, Autoconf uses empty function
-+# prototypes like 'int main () {}' which Clang 15's -pedantic-errors
-+# would reject.  Generally it's not a good idea to try to run
-+# 'configure' itself with strict compiler checking.
-+if test x"$GCC" = x"yes"; then
-+    if test x"$with_included_popt" != x"yes"; then
-+	# Turn pedantic warnings into errors to ensure an array-init overflow is an error.
-+	CFLAGS="$CFLAGS -pedantic-errors"
-+    else
-+	# Our internal popt code cannot be compiled with pedantic warnings as errors, so try to
-+	# turn off pedantic warnings (which will not lose the error for array-init overflow).
-+	# Older gcc versions don't understand -Wno-pedantic, so check if --help=warnings lists
-+	# -Wpedantic and use that as a flag.
-+	case `$CC --help=warnings 2>/dev/null | grep Wpedantic` in
-+	    *-Wpedantic*) CFLAGS="$CFLAGS -pedantic-errors -Wno-pedantic" ;;
-+	esac
-+    fi
-+fi
-+
- AC_CONFIG_FILES([Makefile lib/dummy zlib/dummy popt/dummy shconfig])
- AC_OUTPUT
- 
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
index e52699d24f..19574bcb1c 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -15,7 +15,6 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://makefile-no-rebuild.patch \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
-           file://0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch \
            "
 SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
 
-- 
2.38.1


