Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 472F37872E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 16:45:37 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id m15so7490257pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 09:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1dagmMLRX2rBMOIz7CPIGHteg8RbI0gZtpt6H+LkD0Y=;
	b=XDCIbPuBoSmXBro6MoIrwMkSIR1yMue4139GB0ci4dCtSU/3FawndL7XO//H21zzZ7
	lUkx6EiQg9dXe1WgyKwboEXE6BaZwZTo/9Um66NqZtLlpY26mV83WfRwHAHWLGZ+uuwB
	bp63pt1F5Et/eF0MgwD/P+OUiQCN4iqn9xfre2lH23p0U+E96z7Po9KdZc/EeGs1v/SM
	XJgM5halGf2Uc7C/osL/U9r+jYAkXyUPMN7MnlwaBK784ZSeSeuwDRUGZOE7ETwUcwk/
	uHOsLzUnF7k+2bl7Q6KXXSeIK9j3t52kaAPwJcXE3ABHFuY/6HGA33dfJY1mCye679Of
	DeFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1dagmMLRX2rBMOIz7CPIGHteg8RbI0gZtpt6H+LkD0Y=;
	b=EQ2Qcpeky6V4dM/6y+vox+3fIH7L2byoDLKhA7og8VJfjA6Oq8la09W+bbjAXx1jlB
	rlYpwEDBnxg9DSfG2/hpk8OmzvwsbHMS5yHR5k4nmHfsDeLf/to2nIk5Id9UTGtiOuHY
	YHeQEY0IxtOhELNvPC0hx9Fr8zk0zeNLGUyMmdFfRKyHnRuvZUzdKKa6JdGHwUCDFHLu
	PXtVaek7JRdzRkDu7zE0zPS9sx3NUDEVqu2Dyy2eDiO+x43kOoS0XBbHwIQkJpq9enkw
	HhJOST93g6LYrtvZCdkHlqgnnBI+e348kR853MH4ZAgTx9Wuzn+Tnqx9/UgGPAhpmii/
	AMDA==
X-Gm-Message-State: AElRT7ESB0NmEUuTreBa0gQcSxv0a+uhv2XqSVDlmYybxZ9IkqXfj1rz
	AJ6/g+/UIuqz4BISYJRvOj+w2g==
X-Google-Smtp-Source: AIpwx4/OhO9flufKXBQePkSwiR88uHIE5KK2hTZ7zHQUEoHmdyZIdFX87b+yMdEeqYYLVsku/vuEUw==
X-Received: by 10.99.37.71 with SMTP id l68mr5198512pgl.440.1522082739120;
	Mon, 26 Mar 2018 09:45:39 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:203c:a04e:87e9:791b])
	by smtp.gmail.com with ESMTPSA id b5sm28990293pgn.8.2018.03.26.09.45.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Mar 2018 09:45:38 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2018 09:45:36 -0700
Message-Id: <1522082736-7635-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Armin Kuster <akuster@mvista.com>
Subject: [V2][PATCH] libshmfence: update to 1.3
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
X-List-Received-Date: Mon, 26 Mar 2018 16:45:38 -0000

From: Armin Kuster <akuster@mvista.com>

refreshed patch

[v2]
Remove dangling space in patch

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-graphics/xorg-lib/libxshmfence/extensions.patch | 13 +++++++------
 .../xorg-lib/{libxshmfence_1.2.bb => libxshmfence_1.3.bb}   |  4 ++--
 2 files changed, 9 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxshmfence_1.2.bb => libxshmfence_1.3.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch b/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
index 4cc9e05..56e4e2d 100644
--- a/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
+++ b/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
@@ -4,12 +4,13 @@ AC_USE_SYSTEM_EXTENSIONS to get that defined.
 Upstream-Status: Submitted
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-diff --git a/configure.ac b/configure.ac
-index 0c98875..ebf4dee 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -29,4 +29,6 @@ AC_CONFIG_SRCDIR([Makefile.am])
- AC_CONFIG_HEADERS([config.h])
+Index: libxshmfence-1.3/configure.ac
+===================================================================
+--- libxshmfence-1.3.orig/configure.ac
++++ libxshmfence-1.3/configure.ac
+@@ -30,6 +30,8 @@ AC_CONFIG_HEADERS([config.h])
+ 
+ AC_USE_SYSTEM_EXTENSIONS
  
 +AC_USE_SYSTEM_EXTENSIONS
 +
diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence_1.2.bb b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-lib/libxshmfence_1.2.bb
rename to meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
index 1df068d..f6f5fb2 100644
--- a/meta/recipes-graphics/xorg-lib/libxshmfence_1.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
@@ -15,5 +15,5 @@ BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI += "file://extensions.patch"
 
-SRC_URI[md5sum] = "66662e76899112c0f99e22f2fc775a7e"
-SRC_URI[sha256sum] = "d21b2d1fd78c1efbe1f2c16dae1cb23f8fd231dcf891465b8debe636a9054b0c"
+SRC_URI[md5sum] = "42dda8016943dc12aff2c03a036e0937"
+SRC_URI[sha256sum] = "b884300d26a14961a076fbebc762a39831cb75f92bed5ccf9836345b459220c7"
-- 
2.7.4


