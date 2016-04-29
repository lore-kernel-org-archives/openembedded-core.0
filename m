Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id DB375770CD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 17:46:04 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id e201so36626858wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 10:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=qsmlugWSpfHUg4LPxqmwhu2y+/ro4PKXHHasYc2GZLQ=;
	b=mg63z0A24fGxQT+CCC7DXPLE+NzA95/IJ35/xp+vhf/FkRJxftwaHVZWXlOgYwTTQ/
	fS49VNh2nx1t2nYvFUVYIJE0Fjmg8tJzD5VzVGZrAuseZ+aFpnjKMAfosyoOObFl6fkF
	4OqCzpTRogF93/P1sFWUd7oJPg0EYTCCPQMPw6qa4tNT74KMFPxMCWjSwZqKaTbCx/wD
	oQI6AWL7jxCTxjIgnMQ2yZeK0rtTcFqFzl6FrZI7lxsf4IQeZo5CG2W0EqD4jvfKoU6M
	flgwnGQuFzDtzmqBkvoaFQ+W/O2wXmk7AbRFgOkIEt1pX7guEo8g/W3ZLZuHYm/GX4pj
	kSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qsmlugWSpfHUg4LPxqmwhu2y+/ro4PKXHHasYc2GZLQ=;
	b=dLHRDt4xqtcppq/rnnZhZ7Ri1Ex4Lm7E8Gd5AqCkqPkhGKGPcgZxHoXJoVU5ngADCG
	+rt415dhytyrDgBBDz9etccFijbiyTPg+ZyUkW/g6toLukyY1vrpRu7fK+95kq5BmPsD
	qiLnBpEKn9n3keF2IlM1EISeQR2nFRPAqHHJK0bg63UQn6O5UlxpSBUeBhisfgTEl+6/
	ZKtde834n533FguLVWjj6jSNNtOafKxnlaStKBC1igOhTGDmWRiXSSzEuoh7XCxE9CED
	iZkmKowD/NPP3lKIx+6QV0S8gpF5iNQnqA37AO9pTza4Mnvt86iEbuPSLcYzpWuzFDYs
	Znlg==
X-Gm-Message-State: AOPr4FU40OnoK6jpGop0htz7pNlGMyDbEAxDs3zlzoziUkv+p9yn/cBwHgt4zxHAp7ZruA==
X-Received: by 10.194.96.10 with SMTP id do10mr26557725wjb.113.1461951964829; 
	Fri, 29 Apr 2016 10:46:04 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	d1sm15793944wjb.47.2016.04.29.10.46.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Apr 2016 10:46:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Apr 2016 19:46:09 +0200
Message-Id: <1461951970-1225-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/2] linux-yocto-rt, core-image-rt*: Explicitly skip when PREFERRED_PROVIDER_virtual/kernel isn't set to linux-yocto-rt
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
X-List-Received-Date: Fri, 29 Apr 2016 17:46:06 -0000

* just like linux-yocto-dev is doing
* fixes following errors in world builds:
  ERROR: Nothing PROVIDES 'linux-yocto-rt' (but /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-rt/images/core-image-rt-sdk.bb DEPENDS on or otherwise requires it)
  ERROR: linux-yocto-rt was skipped: PREFERRED_PROVIDER_virtual/kernel set to linux-yocto, not linux-yocto-rt
  ERROR: linux-yocto-rt was skipped: PREFERRED_PROVIDER_virtual/kernel set to linux-yocto, not linux-yocto-rt
  ERROR: Required build target 'core-image-rt-sdk' has no buildable providers.
  Missing or unbuildable dependency chain was: ['core-image-rt-sdk', 'linux-yocto-rt']

  ERROR: Nothing PROVIDES 'linux-yocto-rt' (but /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-rt/images/core-image-rt.bb DEPENDS on or otherwise requires it)
  ERROR: linux-yocto-rt was skipped: PREFERRED_PROVIDER_virtual/kernel set to linux-yocto, not linux-yocto-rt
  ERROR: linux-yocto-rt was skipped: PREFERRED_PROVIDER_virtual/kernel set to linux-yocto, not linux-yocto-rt
  ERROR: Required build target 'core-image-rt' has no buildable providers.
  Missing or unbuildable dependency chain was: ['core-image-rt', 'linux-yocto-rt']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb | 9 +++++++++
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb | 9 +++++++++
 meta/recipes-rt/images/core-image-rt-sdk.bb     | 8 ++++++++
 meta/recipes-rt/images/core-image-rt.bb         | 8 ++++++++
 4 files changed, 34 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index a138957..7c0b453 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,6 +2,15 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
+# Skip processing of this recipe if it is not explicitly specified as the
+# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
+# to build multiple virtual/kernel providers, e.g. as dependency of
+# core-image-rt-sdk, core-image-rt.
+python () {
+    if d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) != "linux-yocto-rt":
+        raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
+}
+
 SRCREV_machine ?= "28d8cfdbcb18a6eef202099cca66430fd3b6eae0"
 SRCREV_meta ?= "a4f88c3fad887e1c559d03ae1b531ca267137b69"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index d81ca13..1723b4b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -2,6 +2,15 @@ KBRANCH ?= "standard/preempt-rt"
 
 require recipes-kernel/linux/linux-yocto.inc
 
+# Skip processing of this recipe if it is not explicitly specified as the
+# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
+# to build multiple virtual/kernel providers, e.g. as dependency of
+# core-image-rt-sdk, core-image-rt.
+python () {
+    if d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) != "linux-yocto-rt":
+        raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
+}
+
 SRCREV_machine ?= "2bc112a6ccd16800a4c45e47ccb3018a1042abdf"
 SRCREV_meta ?= "bcc65090840f51a6ac937297be5c22fe268d01ab"
 
diff --git a/meta/recipes-rt/images/core-image-rt-sdk.bb b/meta/recipes-rt/images/core-image-rt-sdk.bb
index db7d581..7ddf671 100644
--- a/meta/recipes-rt/images/core-image-rt-sdk.bb
+++ b/meta/recipes-rt/images/core-image-rt-sdk.bb
@@ -1,5 +1,13 @@
 require recipes-core/images/core-image-minimal.bb
 
+# Skip processing of this recipe if linux-yocto-rt is not explicitly specified as the
+# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
+# to build multiple virtual/kernel providers.
+python () {
+    if d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) != "linux-yocto-rt":
+        raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
+}
+
 DESCRIPTION = "Small image capable of booting a device with a test suite and \
 tools for real-time use. It includes the full meta-toolchain, development \
 headers and libraries to form a standalone SDK."
diff --git a/meta/recipes-rt/images/core-image-rt.bb b/meta/recipes-rt/images/core-image-rt.bb
index cab6f8b..9c86f25 100644
--- a/meta/recipes-rt/images/core-image-rt.bb
+++ b/meta/recipes-rt/images/core-image-rt.bb
@@ -1,5 +1,13 @@
 require recipes-core/images/core-image-minimal.bb
 
+# Skip processing of this recipe if linux-yocto-rt is not explicitly specified as the
+# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
+# to build multiple virtual/kernel providers.
+python () {
+    if d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) != "linux-yocto-rt":
+        raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
+}
+
 DESCRIPTION = "A small image just capable of allowing a device to boot plus a \
 real-time test suite and tools appropriate for real-time use."
 DEPENDS = "linux-yocto-rt"
-- 
2.8.1


