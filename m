Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1DBA76C3B6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Jan 2019 06:47:19 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id s198so18407866pgs.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Jan 2019 22:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=763j6Z1fwtemDngnG7YqIsBUihXVcJUyfX6JmVPWfW4=;
	b=OvE13yDqeGDTDMcYAV7rmYNgoJRh6Y/9qslGk1MwJucTRfZhn0tfboNMOa7AHdC5Kg
	EetpZbolS0stP0LRrxrKAvS04TMUV6HoCmFZs1XJqxsuMjzvkc8I+/0T97/lRoHlBZXa
	dOzBYbXNACUVORz3ZI6YiyWRLwn2v2cGVHhQfR5n+8i6pchPTiOqvLQsi210jBTkHCTb
	JaWH6ODHTOBHb6PZol/MZVym5WkIw0wyg1x+IRKy7gd8UGvaTZZc9CGcqG4+RmZz+P5f
	7C+xUPiG/goeQaJN3bZ9fTbfbS0dmtEMCxTnMrx3a+Df95ZP0rTuqnthFYt/S9C8Plvw
	5lMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=763j6Z1fwtemDngnG7YqIsBUihXVcJUyfX6JmVPWfW4=;
	b=J1ceEXqZqS7TGAKe2eHyhpS/C3c6k+5tcB8V308qPkOXaYTu/FZUFUm2T7V5R+Bgud
	G0nmo+c2zh0k17bANKAABi4FQGJovJseCzX6v376QAOYP7CSRfnQWPGcMtYU3XtZtizp
	mAuiFdi9/TjYFcM9AXwUh/rLOta2h9QkIReJteu1wVHJ1DbIiEyAEnUyLkG0UBvXOu6S
	FGKRAziaUzN4u8PLQAmLQBPCRj9c6Ilu6iQo5RrHg1PPFBvYF7V780zwrbvWBAVWA3Rx
	0M39LBhlRgOnF8phia9AUnUAoDTVEGBq30LQbEa96e5fzee7eCeMIskfzP6EXE/vly5f
	wQYQ==
X-Gm-Message-State: AJcUukcTJwA9VFly4U9VDvnDvJVCZ0zsKSBeav/5QbgCjTsneIcRSl3u
	VmHgcoQ9kG4DrZAzIM98HzETWDOTs/I=
X-Google-Smtp-Source: ALg8bN4gR799Yzc+jaA/vtDydUzRfo4h5U2rJAJVz4GsiyGSG2RB/0AoLzWj/vHyHb8iObAtYqV3Pw==
X-Received: by 2002:a63:c051:: with SMTP id z17mr3980128pgi.20.1546670840491; 
	Fri, 04 Jan 2019 22:47:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::6ee7])
	by smtp.gmail.com with ESMTPSA id
	u186sm90856500pfu.51.2019.01.04.22.47.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Jan 2019 22:47:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Jan 2019 22:47:10 -0800
Message-Id: <20190105064710.22911-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] util-linux: Fix build with glibc 2.29
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
X-List-Received-Date: Sat, 05 Jan 2019 06:47:20 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...check-for-_HAVE_STRUCT_TERMIOS_C_OSPEED.patch | 16 ++++++++++++++++
 .../recipes-core/util-linux/util-linux_2.32.1.bb |  1 +
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/check-for-_HAVE_STRUCT_TERMIOS_C_OSPEED.patch

diff --git a/meta/recipes-core/util-linux/util-linux/check-for-_HAVE_STRUCT_TERMIOS_C_OSPEED.patch b/meta/recipes-core/util-linux/util-linux/check-for-_HAVE_STRUCT_TERMIOS_C_OSPEED.patch
new file mode 100644
index 0000000000..c92c276ac1
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/check-for-_HAVE_STRUCT_TERMIOS_C_OSPEED.patch
@@ -0,0 +1,16 @@
+Checking for exitence of the define is not enough since
+it will be defined with 0 or 1 value
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/sys-utils/ldattach.c
++++ b/sys-utils/ldattach.c
+@@ -242,7 +242,7 @@ static int my_cfsetspeed(struct termios
+ 	 * -- we have to bypass glibc and set the speed manually (because glibc
+ 	 *    checks for speed and supports Bxxx bit rates only)...
+ 	 */
+-#ifdef _HAVE_STRUCT_TERMIOS_C_ISPEED
++#if _HAVE_STRUCT_TERMIOS_C_ISPEED
+ # define BOTHER 0010000		/* non standard rate */
+ 	dbg("using non-standard speeds");
+ 	ts->c_ospeed = ts->c_ispeed = speed;
diff --git a/meta/recipes-core/util-linux/util-linux_2.32.1.bb b/meta/recipes-core/util-linux/util-linux_2.32.1.bb
index a616d85bb2..c909836cbb 100644
--- a/meta/recipes-core/util-linux/util-linux_2.32.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.32.1.bb
@@ -14,6 +14,7 @@ SRC_URI += "file://configure-sbindir.patch \
             file://run-ptest \
             file://display_testname_for_subtest.patch \
             file://avoid_parallel_tests.patch \
+            file://check-for-_HAVE_STRUCT_TERMIOS_C_OSPEED.patch \
 "
 SRC_URI[md5sum] = "9e5b1b8c1dc99455bdb6b462cf9436d9"
 SRC_URI[sha256sum] = "86e6707a379c7ff5489c218cfaf1e3464b0b95acf7817db0bc5f179e356a67b2"
-- 
2.20.1


