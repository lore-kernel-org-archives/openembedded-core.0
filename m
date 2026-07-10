Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEED0C4450A
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 16:37:13 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1949.1783701426519276037
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 09:37:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QAAwlH6B;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso1099424f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 09:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783701425; x=1784306225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HZ1LqezeGrE6RoYLj+1Ype3a2wkhoeDrXG1grhqlBLc=;
        b=QAAwlH6B47L1s7kMMyEJutpO7vbARwTR12J/trCxdx25u2Bl35YePKOmjHjsByW2XJ
         I4Y8+qMgH0j0IFdkSTDOPhHhJwljEvW3xdr7CttHe5YgxZ+IIlapxiPBnXtjM+lhNZUW
         vFQYmknUlrLRGgUsOYrpNkWRZ29Zdo+nlz9Qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701425; x=1784306225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HZ1LqezeGrE6RoYLj+1Ype3a2wkhoeDrXG1grhqlBLc=;
        b=g5SBwhUZRndbAb6EqxOGP6ydda0kLnZAQMYaXPcHwLz6TIUYW3bWSmSBkDvjnlYntq
         R9vyL3O14ITdVChSxwY+MvAbg2nhYloUqSTu5ES7MfVdmeHNAwtSJ+MCbQ2CacOc+GcA
         wkl7ir2swggeOot/1XPYWZx/Tr7wkzgH7bILhZKxwYALZrLHWeqeArEu16lAZ3O28lXf
         I7EcpQiIBYo1gDHbxgTtu6hASOwv4nlzFv4DbbBuNlk0VD+gH1q4E7BnDACR6urfOXae
         a0z/TqGWlvS4jFFp1rDUrSht/51mZIwS+Qnjt3abtpvwjMLdAG1nzAFFg0NmafKHg+2b
         7Hew==
X-Gm-Message-State: AOJu0YwGfxgqYTERYyMEvAkzwLttOAGBrbLfPHMdPXCQ9d8ecak0aYac
	S2p7ldV9K35pnrkMgzAxV0c7WNQf8OkWYy3/6mykEPHnQ9LHqGSvNnWoUNNzRjPYjhduGVnfIot
	Xein37jk=
X-Gm-Gg: AfdE7cnUnBBxnmoP5DCVy/azi8ML6SdAB64jooxc7QLobSXfM6egpQ5TWjd5I8tVXAT
	Sz965pKxI5GupTxI4+iMSBJ/lUA5i83+Ib0AGgbHp3HJvYX2KCkg93VdjJUtlCr7w3VU2MCEKqn
	A7X0y1gG0DGSnYsOH0x592konUKyQyXgrO/wkTmD2aVXpzgGr07VfxQ6bxxHOqGG3yX95Uqmew4
	zWZXVvVoJ4O9ueUaX0h9UMXCcCXHBZhMHJwjYa+VR3UxNJsbuQl25esunTEQA6yR35xLKvTr05C
	HzfgjCzA5T9UhAqfLg9V0ZgLfQNdPkpwb4tw1VpJldKpdd9+wYlfd8KOjPES94B7jQkFcKzxre5
	dXBtZoeH7bPbmQUB42z3i8TfYtcQ7YPmgWJ3Ijr3v/CJZ6/1hif2Kk3NgrjsdbAQ4BIT3X+nlOV
	khQfITsSGDQ3YTWGGDtoN6NS5+HWerncOi0r94jcVi1crZOmYB5v3941HU3zwpS53E7zVXDADIU
	VdUssYd/nxw46CDQL4eEVHft7bLhQ==
X-Received: by 2002:a05:600c:c1c8:10b0:493:c3c9:218c with SMTP id 5b1f17b1804b1-493e68cebf6mr101421365e9.30.1783701424414;
        Fri, 10 Jul 2026 09:37:04 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-2608-8c5f-3a92-eb6f-dc01-ac58.rev.sfr.net. [2a02:8440:2608:8c5f:3a92:eb6f:dc01:ac58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d4f9fsm150758695e9.4.2026.07.10.09.37.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:37:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 05/18] python3: upgrade 3.14.5 -> 3.14.6
Date: Fri, 10 Jul 2026 18:36:20 +0200
Message-ID: <dec22c685f9db46804b9c532bc35c5592a664303.1783697455.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783697455.git.yoann.congal@smile.fr>
References: <cover.1783697455.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 16:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240666

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
(cherry picked from commit 8ad179c8dd8809ab8861147e5967e7d199ad0fe4)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...eadingMock-call-count-race-condition.patch | 37 -------------------
 .../{python3_3.14.5.bb => python3_3.14.6.bb}  |  7 +---
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Fix-ThreadingMock-call-count-race-condition.patch
 rename meta/recipes-devtools/python/{python3_3.14.5.bb => python3_3.14.6.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/0001-Fix-ThreadingMock-call-count-race-condition.patch b/meta/recipes-devtools/python/python3/0001-Fix-ThreadingMock-call-count-race-condition.patch
deleted file mode 100644
index aba3188a59a..00000000000
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
index fd407c96035..e7db713ded1 100644
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
@@ -531,7 +530,5 @@ py3_sysroot_cleanup () {
 	rm -rf ${SYSROOT_DESTDIR}${libdir}/python${PYTHON_MAJMIN}/test
 }
 
-CVE_STATUS[CVE-2026-4786] = "cpe-stable-backport: backported to v3.14.5"
-CVE_STATUS[CVE-2026-5713] = "cpe-stable-backport: backported to v3.14.5"
 CVE_STATUS[CVE-2026-6019] = "cpe-stable-backport: backported to v3.14.5"
-CVE_STATUS[CVE-2026-6100] = "cpe-stable-backport: backported to v3.14.5"
+CVE_STATUS[CVE-2026-7210] = "cpe-stable-backport: backported to v3.14.6"

