Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web09.8402.1626358131672063465
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 07:08:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=yovlyjk3;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id s18so6421313pgq.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 07:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=B4QkD5/9a+v3GBi/5p9ddPv9zHPbC4girv7N5flTSVU=;
        b=yovlyjk34KlsBW3HyFWMiD0eawgPAzwZ3V6Zy3Qqc4fgl62ABFkvnlM8sjizlfzr1i
         s56HT5qQhgEN6itnJkOA46xzRY+9xYudyDDjJAgupg6MUfugGVR7Z3CtUVFwE8ttefQ6
         GTo2tYojvQLgbxoAzMj38G3neKVowB2u3TTenlHaeCkHYzm8Bpwv9jC9p573gd2nHGh/
         WLhBr/xZezw05pieqP2glXW6CeQtbqFSSMRiXydDVhtQzn4bXJV50cQuKk8rM+EM/6XP
         Y43qAEWaK6nV4yU38oj4IbjfaUFSzAAY3+kL5YboNR1B86u/PHvKY8r3o4tCYbMNZuSV
         AgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B4QkD5/9a+v3GBi/5p9ddPv9zHPbC4girv7N5flTSVU=;
        b=mAqvrhM3zlQYEn2rjnQeuENtrW6wo9G6wX/5DgeSC3pw5UxnYXwiiBBgwEatjYJOH7
         Xlk/T8IcwKEw30pzud9zYtOiTrbVyu9PaPCpDWbSZ8U01g8yI7IVTJHan2C8QZAZ22zz
         8fnAGn7/RpanuhwaN14A/O0g9jXW1djV4ibbs0NAqr3mYJP3W8ejCfr+RhBPWTWmjdE8
         l8SF+z3y0LszvG0Y4GoNKKDEIGM2LRKB0RpVTOo4w0LufEByv9c61uo/6EQuIaoe5ZSw
         CJI3AUUp+DLbOVnskda6nnI5/Th6oS9v1UgRSRZf0Jzlm9ary5ZpLOQhvRK06LRX5rXm
         v8gw==
X-Gm-Message-State: AOAM530rFizN21qbbkjkX90nHExJFFMKYLrxm/Tpc+ntApPscMd9SF05
	XGcEPhKLKRsVZgxqFtuT7PrSoDRqZyBr03tU
X-Google-Smtp-Source: ABdhPJxokzrk9d1tks5Pi1W1N3AL9kwr/nY7VZZqn/lYm+6dBIPny9OrQuM48aTyRnTqwQNpx/5s5g==
X-Received: by 2002:a62:62c2:0:b029:2fb:af56:f1c5 with SMTP id w185-20020a6262c20000b02902fbaf56f1c5mr4987047pfb.30.1626358130645;
        Thu, 15 Jul 2021 07:08:50 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u185sm6915353pfu.49.2021.07.15.07.08.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 07:08:50 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/7] busybox: add tmpdir option into mktemp applet
Date: Thu, 15 Jul 2021 04:07:25 -1000
Message-Id: <9b83aefa9c4a21d9dc1eea4a6b00af379466a288.1626357703.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626357703.git.steve@sakoman.com>
References: <cover.1626357703.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrej Valek <andrej.valek@siemens.com>

- Make mktemp applet compatible with --tmpdir option in ca-certificate
update script.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3d969e482d29da29828d1510f106f161d2b3d3c0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-mktemp-add-tmpdir-option.patch       | 81 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.31.1.bb   |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patch b/meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patch
new file mode 100644
index 0000000000..4a1960dff2
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patch
@@ -0,0 +1,81 @@
+From ceb378209f953ea745ed93a8645567196380ce3c Mon Sep 17 00:00:00 2001
+From: Andrej Valek <andrej.valek@siemens.com>
+Date: Thu, 24 Jun 2021 19:13:22 +0200
+Subject: [PATCH] mktemp: add tmpdir option
+
+Make mktemp more compatible with coreutils.
+- add "--tmpdir" option
+- add long variants for "d,q,u" options
+
+Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2021-June/088932.html]
+
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ coreutils/mktemp.c | 26 ++++++++++++++++++--------
+ 1 file changed, 18 insertions(+), 8 deletions(-)
+
+diff --git a/coreutils/mktemp.c b/coreutils/mktemp.c
+index 5393320a5..05c6d98c6 100644
+--- a/coreutils/mktemp.c
++++ b/coreutils/mktemp.c
+@@ -39,16 +39,17 @@
+ //kbuild:lib-$(CONFIG_MKTEMP) += mktemp.o
+ 
+ //usage:#define mktemp_trivial_usage
+-//usage:       "[-dt] [-p DIR] [TEMPLATE]"
++//usage:       "[-dt] [-p DIR, --tmpdir[=DIR]] [TEMPLATE]"
+ //usage:#define mktemp_full_usage "\n\n"
+ //usage:       "Create a temporary file with name based on TEMPLATE and print its name.\n"
+ //usage:       "TEMPLATE must end with XXXXXX (e.g. [/dir/]nameXXXXXX).\n"
+ //usage:       "Without TEMPLATE, -t tmp.XXXXXX is assumed.\n"
+-//usage:     "\n	-d	Make directory, not file"
+-//usage:     "\n	-q	Fail silently on errors"
+-//usage:     "\n	-t	Prepend base directory name to TEMPLATE"
+-//usage:     "\n	-p DIR	Use DIR as a base directory (implies -t)"
+-//usage:     "\n	-u	Do not create anything; print a name"
++//usage:     "\n	-d			Make directory, not file"
++//usage:     "\n	-q			Fail silently on errors"
++//usage:     "\n	-t			Prepend base directory name to TEMPLATE"
++//usage:     "\n	-p DIR, --tmpdir[=DIR]	Use DIR as a base directory (implies -t)"
++//usage:     "\n				For --tmpdir is a optional one."
++//usage:     "\n	-u			Do not create anything; print a name"
+ //usage:     "\n"
+ //usage:     "\nBase directory is: -p DIR, else $TMPDIR, else /tmp"
+ //usage:
+@@ -72,13 +73,22 @@ int mktemp_main(int argc UNUSED_PARAM, char **argv)
+ 		OPT_t = 1 << 2,
+ 		OPT_p = 1 << 3,
+ 		OPT_u = 1 << 4,
++		OPT_td = 1 << 5,
+ 	};
+ 
+ 	path = getenv("TMPDIR");
+ 	if (!path || path[0] == '\0')
+ 		path = "/tmp";
+ 
+-	opts = getopt32(argv, "^" "dqtp:u" "\0" "?1"/*1 arg max*/, &path);
++	opts = getopt32long(argv, "^"
++	       "dqtp:u\0"
++	       "?1" /* 1 arg max */,
++	       "directory\0" No_argument       "d"
++	       "quiet\0"     No_argument       "q"
++	       "dry-run\0"   No_argument       "u"
++	       "tmpdir\0"    Optional_argument "\xff"
++	       , &path, &path
++	);
+ 
+ 	chp = argv[optind];
+ 	if (!chp) {
+@@ -95,7 +105,7 @@ int mktemp_main(int argc UNUSED_PARAM, char **argv)
+ 		goto error;
+ 	}
+ #endif
+-	if (opts & (OPT_t|OPT_p))
++	if (opts & (OPT_t|OPT_p|OPT_td))
+ 		chp = concat_path_file(path, chp);
+ 
+ 	if (opts & OPT_u) {
+-- 
+2.11.0
+
diff --git a/meta/recipes-core/busybox/busybox_1.31.1.bb b/meta/recipes-core/busybox/busybox_1.31.1.bb
index f7808f4d84..d9d5f4f96b 100644
--- a/meta/recipes-core/busybox/busybox_1.31.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.1.bb
@@ -51,6 +51,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://busybox-CVE-2018-1000500.patch \
            file://0001-hwclock-make-glibc-2.31-compatible.patch \
            file://0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch \
+           file://0001-mktemp-add-tmpdir-option.patch \
            "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.25.1

