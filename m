Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8846D775DE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jul 2017 14:23:56 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id s66so80099308pfs.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jul 2017 07:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ESW0DW78X4R2ggMhaQLbPZXDgL0HBc4voKsGJuXCFus=;
	b=X/MAW1DzeZH37GqKfhc8a7peu8OK5LibqUhH32yTtWxl07J4IGzPYI2bhtq5BYw6+6
	EoBx0Nr68n681SLkS3WObifcD2MdZxyb+w/mIvP6r+swT6QQQCs9gd2umDUfiJCs5za/
	KUKpsPpdjqFYV1mY+D/9Ss88/POPsOB0y53TjRyUheKr0qL7dWPvpYgeuSfaBDIbgV37
	xYX4ZBBqo4q6ufCQD8imRzzUEm+L8Zxu7EJoJBlNzvIxLLhfHhQpMpO2q94/SsHe011v
	JdaLGrRjCBauV1AkXCOUcW+KvCzFfn5ZZ5z5jp+ljH+4NSiCLxX3kAL9GEmH5sfBnXBg
	1BFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ESW0DW78X4R2ggMhaQLbPZXDgL0HBc4voKsGJuXCFus=;
	b=dN7rfWFoWP6P302aC6o63camM9bNwZl7t1zeVt1JXRIbP5hMTQSFOAgRdaof9NPGw6
	+DTDgnyPdr966XFEVkJP5wdH1NiFq/4bwvJZw4Nr2GURSHK/93QkBXWWFl7ltzs6y25T
	+D2wom5o/qncbJ0ts6cswdTw/WTvVi0X6l0mSK5yyfR9JeOHobHV22WJVD0ybaUuf/Q+
	1jWCudmdBZb/jjEepBBSntzINhnHV2MDXlGd39Jm/sJrsSO8F2Ukj9H2tea0SOy5LZER
	LHvhO2c3vYwYUfFZMo8PJc3X6La3Me0wU3Fvfu6kMfMbHi0hW9hjdBldJqEF/PPh5/Z6
	Mndg==
X-Gm-Message-State: AIVw112mFO9aBq4Myj68rf7jnyyIWAl/dGa2r/faah8geA2xV6wMLJyG
	Q/0plGBmIniRPrVa
X-Received: by 10.98.96.66 with SMTP id u63mr938266pfb.13.1498919036672;
	Sat, 01 Jul 2017 07:23:56 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	17sm25026909pfn.84.2017.07.01.07.23.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jul 2017 07:23:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jul 2017 07:23:15 -0700
Message-Id: <9fe774add67d8d1e586d43be635bc419564d677a.1498893436.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1498893436.git.raj.khem@gmail.com>
References: <cover.1498893436.git.raj.khem@gmail.com>
Subject: [PATCH 12/19] icu: Fix build with glibc 2.26
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
X-List-Received-Date: Sat, 01 Jul 2017 14:23:56 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
2.13.2


