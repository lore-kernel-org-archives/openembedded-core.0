Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A55C44503
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 11:00:47 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.147665.1783335638420090329
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 04:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xWi8jBwo;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 312674E40CAD;
	Mon,  6 Jul 2026 11:00:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F2866601A2;
	Mon,  6 Jul 2026 11:00:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9918411BBA04C;
	Mon,  6 Jul 2026 13:00:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783335635; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kgj735z3Figb1ZeMqJ0/uouPwywbTlrpWqF0P3gXYFE=;
	b=xWi8jBwoNNgEkliZpawPVW9AmTLl8A/2zSOw9kR7l9gm9mMCTugFMBzGXqj7Amdfs/U4Co
	dS+NQpEetg830Te3uioQBNW4EP0RLrsbx4qfNii48qfWpZHetdxkfmm+IBdryS1kiCySGX
	zX2Ui90HOuR4GG04oo62Rw6Vkfc0QZLi1Fh5GVkfZcs5G1WhcZ332120Er1HOZesgmQU6r
	lzi+p8kIgnuJHL9gXsN80NZ8G/mwcSWMiRH3Whuxtji1boQh5ALzNdq5w4jWEVdP+yeFC8
	La71q8GW37XdHjJfc5qwv5VF6iXs2oF58E+cBNWHBkYBAJSupoRt+0IYpOCC4Q==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Mon, 06 Jul 2026 13:00:24 +0200
Subject: [wrynose][PATCH 1/3] python3: upgrade 3.14.5 -> 3.14.6
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-fix-cves-python-wrynose-v1-1-b53e09c2b62a@bootlin.com>
References: <20260706-fix-cves-python-wrynose-v1-0-b53e09c2b62a@bootlin.com>
In-Reply-To: <20260706-fix-cves-python-wrynose-v1-0-b53e09c2b62a@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>, 
 Peter Marko <peter.marko@siemens.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 11:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240249

From: Peter Marko <peter.marko@siemens.com>

Release notes: [1]

Resolves following CVEs from reports:
* CVE-2026-3276
* CVE-2026-7210
* CVE-2026-7774
* CVE-2026-8328
* CVE-2026-9669

Resolves also:
* shutil.move symlink-based bypass (CVE assignment unknown)

Removed obsolete CVE_STATUS entries.
Removed patch included in this release.

[1] https://docs.python.org/3/whatsnew/changelog.html#python-3-14-6-final
[2] https://security-tracker.debian.org/tracker/CVE-2026-7210

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...x-ThreadingMock-call-count-race-condition.patch | 37 ----------------------
 .../{python3_3.14.5.bb => python3_3.14.6.bb}       |  7 ++--
 2 files changed, 2 insertions(+), 42 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/0001-Fix-ThreadingMock-call-count-race-condition.patch b/meta/recipes-devtools/python/python3/0001-Fix-ThreadingMock-call-count-race-condition.patch
deleted file mode 100644
index aba3188a59ae..000000000000
--- a/meta/recipes-devtools/python/python3/0001-Fix-ThreadingMock-call-count-race-condition.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 388e023fe1197c1ffed374520ed45df4ac72b8f5 Mon Sep 17 00:00:00 2001
-From: Sai Sneha <saisneha196@gmail.com>
-Date: Thu, 21 May 2026 13:08:07 +0530
-Subject: [PATCH] Fix ThreadingMock call_count race condition
-
-ThreadingMock._increment_mock_call() was not thread-safe.
-Multiple threads calling the mock simultaneously could lose
-increments due to race conditions on call_count and other
-attributes.
-
-Fix by overriding _increment_mock_call in ThreadingMixin
-and wrapping it with the existing _mock_calls_events_lock.
-
-Upstream-Status: Backport [https://github.com/python/cpython/pull/150176]
-
-Signed-off-by: Sai Sneha <saisneha196@gmail.com>
----
- Lib/unittest/mock.py | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/Lib/unittest/mock.py b/Lib/unittest/mock.py
-index 16f3699e89..56cdc37942 100644
---- a/Lib/unittest/mock.py
-+++ b/Lib/unittest/mock.py
-@@ -3113,6 +3113,10 @@ def _mock_call(self, *args, **kwargs):
- 
-         return ret_value
- 
-+    def _increment_mock_call(self, /, *args, **kwargs):
-+        with self._mock_calls_events_lock:
-+            super()._increment_mock_call(*args, **kwargs)
-+
-     def wait_until_called(self, *, timeout=_timeout_unset):
-         """Wait until the mock object is called.
- 
--- 
-2.34.1
diff --git a/meta/recipes-devtools/python/python3_3.14.5.bb b/meta/recipes-devtools/python/python3_3.14.6.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.14.5.bb
rename to meta/recipes-devtools/python/python3_3.14.6.bb
index ed413dc1fe93..239c966065ce 100644
--- a/meta/recipes-devtools/python/python3_3.14.5.bb
+++ b/meta/recipes-devtools/python/python3_3.14.6.bb
@@ -35,13 +35,12 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Skip-flaky-test_default_timeout-tests.patch \
            file://0001-test_only_active_thread-skip-problematic-test.patch \
            file://0001-prefer-valid-entrypoints.patch \
-           file://0001-Fix-ThreadingMock-call-count-race-condition.patch \
            "
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "7e32597b99e5d9a39abed35de4693fa169df3e5850d4c334337ffd6a19a36db6"
+SRC_URI[sha256sum] = "143b1dddefaec3bd2e21e3b839b34a2b7fb9842272883c576420d605e9f30c63"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
@@ -524,7 +523,5 @@ py3_sysroot_cleanup () {
 	rm -rf ${SYSROOT_DESTDIR}${libdir}/python${PYTHON_MAJMIN}/test
 }
 
-CVE_STATUS[CVE-2026-4786] = "cpe-stable-backport: backported to v3.14.5"
-CVE_STATUS[CVE-2026-5713] = "cpe-stable-backport: backported to v3.14.5"
 CVE_STATUS[CVE-2026-6019] = "cpe-stable-backport: backported to v3.14.5"
-CVE_STATUS[CVE-2026-6100] = "cpe-stable-backport: backported to v3.14.5"
+CVE_STATUS[CVE-2026-7210] = "cpe-stable-backport: backported to v3.14.6"

-- 
2.54.0


