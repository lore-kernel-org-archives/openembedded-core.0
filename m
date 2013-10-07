Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6A6D9612D1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2013 11:49:16 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id hq15so4631146wib.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2013 04:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=9/1j50Ujl79VcGCfjw+LeXDzsgXBxY3xgb+PqW90UAE=;
	b=hKUwjomcMD8uicf6d479Ucol8Kg88CSl/HewtcLlBJLS9tLJ/Ppn3P/pRf/Z+JrgQJ
	g+jaMUTtcyIWw+1c64Z0UQUdiosTSE5Qzcl57gc5Hua6Z5HyCa13QxlVHaCWdKWxErBi
	gmWnQnuEPVfLuZztlZUgjfkEOakZoxVXkKW0hHHQOOj/mcGnvf8fDbKCoPVGV+wAyF/v
	HnLJg9H+FG4GBotysJ06uww1CIiWR1FWv52kTaS0wixuf1y2CdFVVxEGOw0A6Q/b9zYE
	owsj/wkjhhV5r7W7PS07yujO06SLVYe9TQB9v20PZye8hucvSI1GTwVINzsnD8Kkya0M
	i/2w==
X-Gm-Message-State: ALoCoQkcbLerTHkaxW8JQjn53Ovb4jM4yrBVcByM39qibPVByVMd5yagiSCuClfcCUk8qirid+vO
X-Received: by 10.180.38.36 with SMTP id d4mr18190787wik.7.1381146557624;
	Mon, 07 Oct 2013 04:49:17 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	mb7sm38608731wic.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Oct 2013 04:49:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2013 12:49:06 +0100
Message-Id: <1381146549-16693-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/4] libsm: upgrade to 1.2.2
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
X-List-Received-Date: Mon, 07 Oct 2013 11:49:18 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libsm_1.2.1.bb |   24 ------------------------
 meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb |   23 +++++++++++++++++++++++
 2 files changed, 23 insertions(+), 24 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libsm_1.2.1.bb
 create mode 100644 meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb

diff --git a/meta/recipes-graphics/xorg-lib/libsm_1.2.1.bb b/meta/recipes-graphics/xorg-lib/libsm_1.2.1.bb
deleted file mode 100644
index 1613bb9..0000000
--- a/meta/recipes-graphics/xorg-lib/libsm_1.2.1.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "SM: Session Management library"
-
-DESCRIPTION = "The Session Management Library (SMlib) is a low-level \"C\" \
-language interface to XSMP.  The purpose of the X Session Management \
-Protocol (XSMP) is to provide a uniform mechanism for users to save and \
-restore their sessions.  A session is a group of clients, each of which \
-has a particular state."
-
-require xorg-lib-common.inc
-
-LICENSE = "MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c0fb37f44e02bdbde80546024400728d"
-
-DEPENDS += "libice xproto xtrans e2fsprogs"
-
-PR = "r0"
-PE = "1"
-
-XORG_PN = "libSM"
-
-BBCLASSEXTEND = "native"
-
-SRC_URI[md5sum] = "766de9d1e1ecf8bf74cebe2111d8e2bd"
-SRC_URI[sha256sum] = "93c11d569c64f40723b93b44af1efb474a0cfe92573b0c8c330343cabb897f1d"
diff --git a/meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb b/meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb
new file mode 100644
index 0000000..180acfa
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb
@@ -0,0 +1,23 @@
+SUMMARY = "SM: Session Management library"
+
+DESCRIPTION = "The Session Management Library (SMlib) is a low-level \"C\" \
+language interface to XSMP.  The purpose of the X Session Management \
+Protocol (XSMP) is to provide a uniform mechanism for users to save and \
+restore their sessions.  A session is a group of clients, each of which \
+has a particular state."
+
+require xorg-lib-common.inc
+
+LICENSE = "MIT-style"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c0fb37f44e02bdbde80546024400728d"
+
+DEPENDS += "libice xproto xtrans e2fsprogs"
+
+PE = "1"
+
+XORG_PN = "libSM"
+
+BBCLASSEXTEND = "native"
+
+SRC_URI[md5sum] = "499a7773c65aba513609fe651853c5f3"
+SRC_URI[sha256sum] = "0baca8c9f5d934450a70896c4ad38d06475521255ca63b717a6510fdb6e287bd"
-- 
1.7.10.4


