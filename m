Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7FA0E77CE0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 16:07:04 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l19so2659218wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Sep 2017 09:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=A/2adR0knE7n+X3X+u4MXBXgLYUPDr9NLYnh7Iy8JQA=;
	b=OCAPNr3uhZbYrGn4zZ8YK+msWR+qYa+KBSvEpIur4viqYYT6jAsOecrMDOu20mGPsn
	/yTjvh5j4J64cbeeLxJUW7xyNPw6CwbsDCew4DhhGZnmiZIXrBkGzPw4y06uMK9iedmp
	BFtz4EeK0C/q61c9XlHc6VI+QBOi6+hD92gNHKUKhu0exnwatyIuYrsfDPgZJlPaxWA2
	ZzVm83+6WMv5CIxo5teVcnrkaUcYuV9OZHKaQqbajfNfXNlNmDu5D0xDSFgafR0S19AR
	e5i1qx9Mvr+ompzOv7lE+XdepcsZ7Z2skbUnvVb8t41uJG5b/Hul54U3uOXGkds/iXMj
	++rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=A/2adR0knE7n+X3X+u4MXBXgLYUPDr9NLYnh7Iy8JQA=;
	b=rngXAutpdZrtr6djh8OnnqAGX2U2pUIJ5NEUiH8QtiT3UZ+VL0CecPucY9PNDBX0zC
	zcdCBpRYRj9WIZL01QUEMreur+vJ7jC6bTPRnwH9RsEzobmHFWmW+7jkWYqd7xcd4toq
	gHK/PyRVsJ5GwD/39P5RSgprC6dC5Uwi5hK1PLlcaJRk0boFOG7lcFzX00oQVFL03INA
	iurfadnuV/fKLeOlEmMLUk47aVu+S15r86u6nFW/5zQUDRiY2JsgVUF2Jj9WOX2lIakC
	mOOXwBdHZ2nb8YZz9ecbirr20ZMfO44lxcwt7EUyDW2lJW7nPVlQdj+f8PxckVYUaknW
	WfBg==
X-Gm-Message-State: AHPjjUhCCXoGfSMZFCnlF4fUx2jidNz9sVbJ4YCXNTmH88eTH3UglSpu
	kYp5bzSYmbmFKDlj
X-Google-Smtp-Source: ADKCNb7G4uPz7putsl1IQn8BwHPq97mOxQsYPoOTvd4vOxHL8LkqcblF7wf8pdQSBQaxQ6J0KQ9vgg==
X-Received: by 10.28.27.195 with SMTP id b186mr187650wmb.96.1504714024873;
	Wed, 06 Sep 2017 09:07:04 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	m19sm1411565wmd.16.2017.09.06.09.07.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Sep 2017 09:07:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Sep 2017 18:09:05 +0200
Message-Id: <aadd92d91ffc06a307691df254f04e00a918227a.1504713837.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1504713837.git.Martin.Jansa@gmail.com>
References: <cover.1504713837.git.Martin.Jansa@gmail.com>
Subject: [pyro][PATCH 1/3] icu: Fix build with glibc 2.26
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
X-List-Received-Date: Wed, 06 Sep 2017 16:07:05 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../icu/icu/0001-i18n-Drop-include-xlocale.h.patch | 31 ++++++++++++++++++++++
 meta/recipes-support/icu/icu_58.2.bb               |  3 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/icu/icu/0001-i18n-Drop-include-xlocale.h.patch

diff --git a/meta/recipes-support/icu/icu/0001-i18n-Drop-include-xlocale.h.patch b/meta/recipes-support/icu/icu/0001-i18n-Drop-include-xlocale.h.patch
new file mode 100644
index 0000000000..add0d765b7
--- /dev/null
+++ b/meta/recipes-support/icu/icu/0001-i18n-Drop-include-xlocale.h.patch
@@ -0,0 +1,31 @@
+From c4254fd8ff1888ca285e3242b812010357ce2b3e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 24 Jun 2017 22:52:40 -0700
+Subject: [PATCH] i18n: Drop include <xlocale.h>
+
+glibc 2.26 drops this header
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ i18n/digitlst.cpp | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+Index: source/i18n/digitlst.cpp
+===================================================================
+--- source.orig/i18n/digitlst.cpp
++++ source/i18n/digitlst.cpp
+@@ -61,11 +61,7 @@
+ #endif
+ 
+ #if U_USE_STRTOD_L
+-# if U_PLATFORM_USES_ONLY_WIN32_API || U_PLATFORM == U_PF_CYGWIN
+-#   include <locale.h>
+-# else
+-#   include <xlocale.h>
+-# endif
++# include <locale.h>
+ #endif
+ 
+ // ***************************************************************************
diff --git a/meta/recipes-support/icu/icu_58.2.bb b/meta/recipes-support/icu/icu_58.2.bb
index 4d062ebf94..47684a6c8b 100644
--- a/meta/recipes-support/icu/icu_58.2.bb
+++ b/meta/recipes-support/icu/icu_58.2.bb
@@ -16,7 +16,8 @@ BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-${ICU_PV
 SRC_URI = "${BASE_SRC_URI} \
            file://icu-pkgdata-large-cmd.patch \
            file://fix-install-manx.patch \
-          "
+           file://0001-i18n-Drop-include-xlocale.h.patch \
+           "
 
 SRC_URI_append_class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
-- 
2.14.1


