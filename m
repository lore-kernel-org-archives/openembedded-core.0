Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id B7445797DC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 13:31:32 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v16-v6so21930802wro.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 06:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ycAJ+fTCiVn2OIiupbPgUbZSjtoUyGOZlFu9cpH0SFY=;
	b=ogxSwEQhv+O2Sr/xjcdtm9UFYk/PoXe/K/I2sdeovRVX6U896y1okDjCzE+zHO5FC8
	hS6iMUt9/TJeA0fX18bZgUwLntW/Yx1h5PA5/J5j2H49h+73hH/DUt9rMbpvhXFzncU1
	Y02/lECcoGuWzDcYkA0DD3CFyPpIARtOj6LBrgw8tfdQj26PtGElzuaGRgUQR9auqBm8
	3GTGrO8MtXw4b5LjqGGZC/O/BAKntEiqGLyKIt+cYw2G2a9tsJy9olFE9FcJYbwgc/Hb
	hNGBj//aNVfjhHFox7M2XnJ/2OPF9bnoepf3BgCDWX8OdHxIF6Yjw1OJJsTaUT5feDW8
	HBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ycAJ+fTCiVn2OIiupbPgUbZSjtoUyGOZlFu9cpH0SFY=;
	b=CQLO1d4LcO/EpQCQU3j78bJNDvtH7OhQv38Nrn2lMNdiL9jxdyDSVdY0flTgKHmP3c
	XWURTWTWfUc9/TLtKzgkYvpZB7FbXov9bcNNf8MTDwCszDoPsnLV2KAvzVLeWq32NMw1
	B+rhTnPp0UuGh6WT3Ma32i/chp7tUuFc2btN6XXZn0iZyTfukei3L7JimSmvJB0+7Z5/
	VwZJfIkXM8YobYwE8jmrK0pSn/D9wWh8h9kYPDQofddRvleaVHP+27wTR+ekxIMLeJzO
	snwEEYPe9gyeemfBb8XKI33uJhxwBuXzNlLShLltDdpstv1t0k1S/LZeGANnA+Wjb1ua
	U8jQ==
X-Gm-Message-State: APzg51AWR8hUFDYhBB2KW6VMz8PBChFOrM1j8CiqUAz6EtWuZmWryPU6
	82OOG9R0R6FZBXH56lCm5/K4gl8amqg=
X-Google-Smtp-Source: ANB0VdbC49zHOQTAyDWy+qVIy896KjocRuRuTE9MGxn5MFZDkfILXxIFhFdFy+blyhXyp4awBC5x2A==
X-Received: by 2002:a5d:488c:: with SMTP id
	g12-v6mr15385600wrq.0.1536586292821; 
	Mon, 10 Sep 2018 06:31:32 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	p11-v6sm17695045wrd.74.2018.09.10.06.31.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Sep 2018 06:31:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Sep 2018 14:31:22 +0100
Message-Id: <20180910133123.22372-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180910133123.22372-1-ross.burton@intel.com>
References: <20180910133123.22372-1-ross.burton@intel.com>
Subject: [PATCH 3/4] python3: remove patch that inadvertently disables xattrs
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
X-List-Received-Date: Mon, 10 Sep 2018 13:31:32 -0000

This patch dates back to the addition of the Python 3 recipe to oe-core, and as
listxattr is never added to supports_follow_symlinks the extended attribute
support will never be enabled.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3-native_3.5.5.bb    |  1 -
 .../python/python3/shutil-follow-symlink-fix.patch      | 17 -----------------
 meta/recipes-devtools/python/python3_3.5.5.bb           |  1 -
 3 files changed, 19 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/shutil-follow-symlink-fix.patch

diff --git a/meta/recipes-devtools/python/python3-native_3.5.5.bb b/meta/recipes-devtools/python/python3-native_3.5.5.bb
index 7b940a16d28..b231542f46f 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.5.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.5.bb
@@ -15,7 +15,6 @@ file://150-fix-setupterm.patch \
 file://python-3.3-multilib.patch \
 file://03-fix-tkinter-detection.patch \
 file://avoid_warning_about_tkinter.patch \
-file://shutil-follow-symlink-fix.patch \
 file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
 file://sysroot-include-headers.patch \
 file://unixccompiler.patch \
diff --git a/meta/recipes-devtools/python/python3/shutil-follow-symlink-fix.patch b/meta/recipes-devtools/python/python3/shutil-follow-symlink-fix.patch
deleted file mode 100644
index 802b1c72038..00000000000
--- a/meta/recipes-devtools/python/python3/shutil-follow-symlink-fix.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-shutils should consider symlinks
-
--Khem
-
-Upstream-Status: Pending
-
---- a/Lib/shutil.py	2013-01-29 12:31:06.926555779 -0800
-+++ b/Lib/shutil.py	2013-01-29 16:31:39.097554182 -0800
-@@ -132,7 +132,7 @@ def copymode(src, dst, *, follow_symlink
-     st = stat_func(src)
-     chmod_func(dst, stat.S_IMODE(st.st_mode))
- 
--if hasattr(os, 'listxattr'):
-+if hasattr(os, 'listxattr') and os.listxattr in os.supports_follow_symlinks:
-     def _copyxattr(src, dst, *, follow_symlinks=True):
-         """Copy extended filesystem attributes from `src` to `dst`.
- 
diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb b/meta/recipes-devtools/python/python3_3.5.5.bb
index 6598b486afe..02decf470c8 100644
--- a/meta/recipes-devtools/python/python3_3.5.5.bb
+++ b/meta/recipes-devtools/python/python3_3.5.5.bb
@@ -28,7 +28,6 @@ SRC_URI += "\
             file://cgi_py.patch \
             file://host_include_contamination.patch \
             file://python-3.3-multilib.patch \
-            file://shutil-follow-symlink-fix.patch \
             file://sysroot-include-headers.patch \
             file://unixccompiler.patch \
             file://avoid-ncursesw-include-path.patch \
-- 
2.11.0


