Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id CB7A260557
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 01:03:10 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id u27so7624401pgn.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 18:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=yrDuMneaIX6YqV5f5sqP/ucOHXZPiwhGzOcAkXSZ+C0=;
	b=YwBjmkOGVujO4gFgv8cEo6RHbYcvOi+a+/eLbIifk9fnaTsJCqhlf4wNxwd6VtDU3S
	RzIeQcornPmuNUlANY14w5uCt/CSFc/iXcuPb0QnPGE8C3IUeNHY8/QgnyJAFFTh/QYh
	SpaG/tc+qbpzMkEqncZDckX0Kk9R6OOc4+ejhLG4lWnoXghP11FWd84fQ0lbYk+S+JCg
	PGTN6ZR6PkqcMJjrK/VL64QKQnL8I2A7YMRvcsTNLaVZ8PncDM3a2GNda2y7lAdGKsnA
	ZCYwCJECeCNQiIzYLSQ2gjd4ldMH3SDDYluzGm+DS3Iw4ZnVa4A0ftTSTTZ6gRzQqXw0
	I3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yrDuMneaIX6YqV5f5sqP/ucOHXZPiwhGzOcAkXSZ+C0=;
	b=Ti7Gst73J+npP/Me27h4ovS9xMNAacG6rdzyDImBCau5hhiJg7ItSWiwxg9NFZfdmR
	64uNKpnIhM2hHdxyyy4AEzNmj8yHY5+W89G1ZWsoIUxpFy/hQhd05GZFk1qqQLtDKK9V
	ZE5wedueKYrKh7K+rElvSJxHNOCkQyKwXkMqbh4jec6iBPIjsoJraolXiCc3WlXLGePf
	ylxUPRIQmWMlhgRUi7huGcfx/e6A/AxCJiLLcO+B5x1Fo5b35mN9aIAELjLYUpopR2MK
	mOBo9AcZkxcL0OzNb2j+xe8y7zO/73rRCoW1FcFllLLMAJIQGfxXpe89qMkSrBnPsZ6j
	rh5A==
X-Gm-Message-State: AHPjjUgzXCg9Myx+tAaYRaCVIhL2UXQt/FghGIP1OBeTin7nW4gt/K81
	EnVXr5aqg3xKCtzE679XGCvdNw==
X-Google-Smtp-Source: AOwi7QAa06Abw47NHYwNyCWeLQTD5Ea5NPZMtjAagCFB9UXxdnlDoHczL14JBl+aYU/KwAkyddg4Fg==
X-Received: by 10.101.82.8 with SMTP id o8mr13969126pgp.404.1506992591659;
	Mon, 02 Oct 2017 18:03:11 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	w82sm18895711pfa.69.2017.10.02.18.03.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 Oct 2017 18:03:10 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Oct 2017 18:03:04 -0700
Message-Id: <1506992584-15564-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] systemd: drop uclibc specific exp10 support patch
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
X-List-Received-Date: Tue, 03 Oct 2017 01:03:11 -0000

This patch is clearly uclibc specific and appears to have been
inadvertently left behind during the recent purging of uclibc
specific patches from oe-core:

  http://git.openembedded.org/openembedded-core/commit/?id=e01e7c543a559c8926d72159b5cd55db0c661434

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../systemd/0003-define-exp10-if-missing.patch     | 35 ----------------------
 meta/recipes-core/systemd/systemd_234.bb           |  1 -
 2 files changed, 36 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0003-define-exp10-if-missing.patch

diff --git a/meta/recipes-core/systemd/systemd/0003-define-exp10-if-missing.patch b/meta/recipes-core/systemd/systemd/0003-define-exp10-if-missing.patch
deleted file mode 100644
index 5ba4b9a..0000000
--- a/meta/recipes-core/systemd/systemd/0003-define-exp10-if-missing.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 96baee0e1962e559f4ea025024ebc337cb5d50c5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 9 Nov 2016 19:25:45 -0800
-Subject: [PATCH 01/14] define exp10 if missing
-
-Inspired by: http://peter.korsgaard.com/patches/alsa-utils/alsamixer-fix-build-on-uClibc-exp10.patch
-
-exp10 extension is not part of uClibc, so compute it.
-
-Upstream-Status: Pending
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/basic/missing.h | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/basic/missing.h b/src/basic/missing.h
-index 7830a4f41..177c0eb8a 100644
---- a/src/basic/missing.h
-+++ b/src/basic/missing.h
-@@ -1227,4 +1227,9 @@ struct ethtool_link_settings {
- #define AF_VSOCK 40
- #endif
- 
-+#ifdef __UCLIBC__
-+/* 10^x = 10^(log e^x) = (e^x)^log10 = e^(x * log 10) */
-+#define exp10(x) (exp((x) * log(10)))
-+#endif /* __UCLIBC__ */
-+
- #include "missing_syscall.h"
--- 
-2.13.2
-
diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index 881896b..4e7e3ab 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -15,7 +15,6 @@ SRC_URI += " \
            file://00-create-volatile.conf \
            file://init \
            file://run-ptest \
-           file://0003-define-exp10-if-missing.patch \
            file://0004-Use-getenv-when-secure-versions-are-not-available.patch \
            file://0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch \
-- 
1.9.1


