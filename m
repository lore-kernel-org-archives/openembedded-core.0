Return-Path: <net147@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5730873CF7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 03:52:12 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id bj10so34725579pad.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 19:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+r+2PHb+pOxa/54anYjZNWNadHpJYAbNrREil4VKYOM=;
	b=DyO7PAkC6ylvD2BiF2PmVQnKmeibgt4aywxiAMrP31mICWmyiaSYOtnqVQAjlMlRGp
	dj6r2Yr+UY/4N3RDu7KFBRZe0NRHDKjHfgCAFe96FBYlD6xTNJh4gmmfBGm4Xb+088lf
	BxHcv77m75tL7TvtaWQTNqCRPGsgn2D7IfMtDIPFrLc7Ax3o42ftO9bC5mnrsPIXqVnE
	qILhmczv5Jw3OCMCAnSzn9S6hqDD14P6kneMzfT0eiGlhpXY3bDbHWxoYl5RDJgPfHGW
	K6fY0cOu40+yXAvIT23o0ABtx3Ra+pN5+uPpz7FX96DG2wdTSu6VHkAzZKT6AXN044DQ
	/FiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+r+2PHb+pOxa/54anYjZNWNadHpJYAbNrREil4VKYOM=;
	b=VpPDivvih+AXdri+B+Ok/gnRCge2B+c+1mbBQViD9TL/ZjmINf0pxuCpAL8pmo901x
	zhNYb59kAdv6XFbmiUXowt8skcQkz+J54rft9LDKTQEenZLPjfpA73lJi7B9ytSgB6di
	loka/pNB3djqeUIv4+dm0F59O54yt2DFo5wp4N+ca2L+96gqOO3qg07FgVQ9XtQT3W1+
	qz5bC6EHlhqnDHNjqUL8wVMxHDupqdKetzNXVBVX5iy2Pv8qUQuX5bXGJUYNsvBF+MUI
	soZAmIHej8izlVxSQo1YW6a59eY5LTQCbAfmyQ0EXQMs9t9dLAhsQqyCdXzibo4YIg7Z
	dnlA==
X-Gm-Message-State: AD7BkJJ2t2hzaynZCYqIupoQeS63gbGYQ/h49sZs03LLuisNIupt5Ujxn6pfSN/2EaUe7g==
X-Received: by 10.66.62.134 with SMTP id y6mr27163055par.43.1456804333711;
	Mon, 29 Feb 2016 19:52:13 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	n68sm41256287pfj.46.2016.02.29.19.52.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Feb 2016 19:52:12 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Mar 2016 14:51:50 +1100
Message-Id: <1456804310-12340-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH] e2fsprogs: do not enable non-stable features by default
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
X-List-Received-Date: Tue, 01 Mar 2016 03:52:13 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 ...fs-enable-the-metadata_csum-and-64bit-fea.patch | 34 ++++++++++++++++++++++
 meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch
new file mode 100644
index 0000000..656fb6e
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch
@@ -0,0 +1,34 @@
+From 0a392baf1874964651115d9f77b0daa6851d1daa Mon Sep 17 00:00:00 2001
+From: Jonathan Liu <net147@gmail.com>
+Date: Tue, 1 Mar 2016 14:28:01 +1100
+Subject: [PATCH] Revert "mke2fs: enable the metadata_csum and 64bit features
+ by default"
+
+This reverts commit cd27af3ecb83e8fd1e3eaa14994284a1818c7c15 as we
+don't want to enable features by default that are not supported by
+the latest stable e2fsprogs release.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ misc/mke2fs.conf.in | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/misc/mke2fs.conf.in b/misc/mke2fs.conf.in
+index a049d61..106ee80 100644
+--- a/misc/mke2fs.conf.in
++++ b/misc/mke2fs.conf.in
+@@ -11,7 +11,8 @@
+ 		features = has_journal
+ 	}
+ 	ext4 = {
+-		features = has_journal,extent,huge_file,flex_bg,metadata_csum,64bit,dir_nlink,extra_isize
++		features = has_journal,extent,huge_file,flex_bg,uninit_bg,dir_nlink,extra_isize
++		auto_64-bit_support = 1
+ 		inode_size = 256
+ 	}
+ 	ext4dev = {
+-- 
+2.7.2
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
index d4a19f9..9cde8e4 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://acinclude.m4 \
             file://ptest.patch \
             file://mkdir.patch \
             file://xattr_ordering.patch \
+            file://Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch \
 "
 
 SRCREV = "0f26747167cc9d82df849b0aad387bf824f04544"
-- 
2.7.1


