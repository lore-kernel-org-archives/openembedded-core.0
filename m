Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6B3926E5FC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Aug 2017 16:27:03 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id m85so24038407wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Aug 2017 09:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=n/Sujj9fLRiEevmDxo22hO9TyYuzxjmbs+SfTgfw35s=;
	b=ZLrXd73vcYKI9zcRqFVGjjmKHCLie+JmxsUe3u4OUxl3HwrDTn4o048XR0MmGiYKwO
	lDLZo5Qr9Tki3YWMqQcsaZUJI91cKfxMxuX5PnzyB1Z8Nb58MhfvXicxlXcGfWCoeHGO
	MikRZRnyfSRjCq3CxXP110HIOkF4ZE2dJOfbgqFviLgqgCFIRHIu5BR/7Y7ZKYIyiMjY
	tJIY1iHhLbBqQRDU1A94clqdDYID/QpGaQkxdp3S4PBzZwPIiRLklXIO8lWNXLV8n4qq
	oEdH1bXMPrKa9x92Wpyr3f8fkgQsdyzxjV7HvsOG5UqoANfX+I/q1Px2I1E2MCCwdeWj
	a+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=n/Sujj9fLRiEevmDxo22hO9TyYuzxjmbs+SfTgfw35s=;
	b=V2QsSspIuk7o33Y73iV1biWOknKAox5dAlBmdGJw1m+grDJjua9B0YAf9bb601Voof
	c+bpOuo8EUnri0QTg0SU63KRrmVzh+Tlu4rmSuYfOm06Msh+YHc9RK+dJ+qwPSXnA66K
	62CpGv/A9ZTN88dMUzCTe7UD3565HB0B+7QHOfuMw8UdZX2Zd6m582/d/G0OQ0ZVtl5w
	CDALsx6YwWsaiCq0QR2dd0k5ixVecyN3fVa42mzmI0Sni414G9e7ntK+eJlKo0N50sNm
	IwvlOTlrp4uGcUwEPMPdy03XKf3bef96a/QBYE45ZE+hHygsY3J0p2NtZsSJaekPUSGV
	PSXA==
X-Gm-Message-State: AHYfb5ihD1dPO2QKO+9ufD7LWy7DVMvoaIqyv42JubeJSLjlInJq4xy2
	D3v2KJFOSw3jF3/I4RY=
X-Received: by 10.28.228.134 with SMTP id b128mr1610642wmh.53.1501864023922;
	Fri, 04 Aug 2017 09:27:03 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	f80sm1275946wmh.16.2017.08.04.09.27.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Aug 2017 09:27:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Aug 2017 17:26:59 +0100
Message-Id: <20170804162700.11765-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170804162700.11765-1-ross.burton@intel.com>
References: <20170804162700.11765-1-ross.burton@intel.com>
Subject: [PATCH][morty 2/3] systemd: remove upstreamed patch
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
X-List-Received-Date: Fri, 04 Aug 2017 16:27:03 -0000

The addition of missing.h to user-utils.c was done in v230 with 0b6b45d5.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...sing.h-for-getting-secure_getenv-definiti.patch | 27 ----------------------
 meta/recipes-core/systemd/systemd_230.bb           |  1 -
 2 files changed, 28 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0021-include-missing.h-for-getting-secure_getenv-definiti.patch

diff --git a/meta/recipes-core/systemd/systemd/0021-include-missing.h-for-getting-secure_getenv-definiti.patch b/meta/recipes-core/systemd/systemd/0021-include-missing.h-for-getting-secure_getenv-definiti.patch
deleted file mode 100644
index 5797a29e60e..00000000000
--- a/meta/recipes-core/systemd/systemd/0021-include-missing.h-for-getting-secure_getenv-definiti.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 6cedbaee7964f6a6c61b9f2c8f0b87cef9370424 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 15 Dec 2015 22:51:55 +0000
-Subject: [PATCH 26/38] include missing.h for getting secure_getenv definition
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- src/basic/user-util.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/basic/user-util.c b/src/basic/user-util.c
-index 55672b3..22c4a23 100644
---- a/src/basic/user-util.c
-+++ b/src/basic/user-util.c
-@@ -38,6 +38,7 @@
- #include "path-util.h"
- #include "string-util.h"
- #include "user-util.h"
-+#include "missing.h"
- 
- bool uid_is_valid(uid_t uid) {
- 
--- 
-1.8.3.1
-
diff --git a/meta/recipes-core/systemd/systemd_230.bb b/meta/recipes-core/systemd/systemd_230.bb
index 19d144d3fa2..702e3772642 100644
--- a/meta/recipes-core/systemd/systemd_230.bb
+++ b/meta/recipes-core/systemd/systemd_230.bb
@@ -33,7 +33,6 @@ SRC_URI += " \
            file://0018-make-test-dir-configurable.patch \
            file://0019-remove-duplicate-include-uchar.h.patch \
            file://0020-check-for-uchar.h-in-configure.patch \
-           file://0021-include-missing.h-for-getting-secure_getenv-definiti.patch \
            file://0022-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch \
            file://udev-re-enable-mount-propagation-for-udevd.patch \
            file://CVE-2016-7795.patch \
-- 
2.11.0


