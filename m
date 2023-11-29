Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C2AEC4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 20:50:07 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.50287.1701291002082211144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 12:50:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZLNEfIl3;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-32f8441dfb5so161656f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 12:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701291000; x=1701895800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qGA+Mukyu/q1jznX2UpUwwfNyhHPPLptl+96ENsYGgU=;
        b=ZLNEfIl3OVZEhWPtOSPqDG6GHWsOMNF2e3CbdxDGqz515nDibsB+N+ScHP/aDgPG6t
         iFuVls+XJTctvmp2sbwMPIWhRtmVqZ9W9RMnJ7UcISxYFQPJ3ZSE8OoQVQqQx6+FGTmy
         XKE/Rcl5t7Wb+k0DIYKqcvwS2+5DVaUfyTvJX+Q823cB8N9weGlZ+pctiCp4SRZUFc3y
         Uqh7i+vVe5rQYBOplfHK39ZASCTqfnC7w5msU5IzLpCYKC5sM5mw35yVRpwn2KkFSHDZ
         gR4LGEjp/VDMaBsZjQIVnjwwezj6nOIcRDWrOO/S7LTFpWnTX6H66n/1DSShvE6GBdWS
         9XzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701291000; x=1701895800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGA+Mukyu/q1jznX2UpUwwfNyhHPPLptl+96ENsYGgU=;
        b=mZLd5eewTkQMuqx2neumAHTra5BCqnOZjeyHIg84B3AjcrihZ/+5wHj4v+mGDvB/B9
         rBim8T8ZnNnKyoxtBi3WD1tQtE12mAsLyGhZVwdg7uAzO9syDCxMy1qONM5QnKeUxsX0
         wepDMzTb5cKi8pHF4qGYPmvL6AGxe07FN5o6lEnSFnuCi33KHJAhh9RcOe7n/Gp7JgOM
         6Dh0Mv8fhiwnQWDVfQPQMUnCD9XvJp8Tah2A9n0TaG9kszECkZFm95R50Yf+u7oVc4u0
         +s4zZ9VGqyabFthrXoG0WBxzsE/AoLgmXrLL7aeJ8MRTS6SjZZnJhlLmjVrR8wVbXFKi
         kIKg==
X-Gm-Message-State: AOJu0YwLSIbwKkJ4VRCuXYtJ5q/ykMdXfsd11TzwPT2O6QJHK1ajbtmo
	GS0dh8xT3UsWaq6uNJf1IVriE9Kdzig=
X-Google-Smtp-Source: AGHT+IFJ+g3pJsO6H83XdkU0/dfhNvjxW5aTp5kx5Di0yjy22rj42GhQ+2d6VoL1rDcaLVeP2vSF2Q==
X-Received: by 2002:a5d:4648:0:b0:333:b8a:8e9a with SMTP id j8-20020a5d4648000000b003330b8a8e9amr4820372wrs.47.1701291000007;
        Wed, 29 Nov 2023 12:50:00 -0800 (PST)
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:9801:d2b1:600e:600f])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d4402000000b003331a5b8df0sm2278588wrq.6.2023.11.29.12.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 12:49:59 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2] eudev: Upgrade 3.2.12 -> 3.2.14
Date: Wed, 29 Nov 2023 20:49:56 +0000
Message-Id: <20231129204956.17967-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 20:50:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191461

Drop merged patches:

  0001-Export-dummies-for.patch
  0002-Bump-udev-version-to-251.patch

Boian Bonev (13):
      Update as per IRC discussion
      Bump udev version to 251
      Export dummies for
      bump version to 3.2.14
      Fix := not preventing further assignments to RUN
      Add /usr/local/lib/udev/rules.d
      Move the changes from udev.7 to udev.xml
      Regenerate according to 0cf14fb and e5e4013
      Improve wording and restore lines lost in merges
      Improve wording
      Tabs to spaces
      Ensure that standard file descriptors are open
      Commit the generated man page

NaofumiHonda (1):
      Clear sysattr cache if a null pointer is passed (#255)

Vivien Kraus (6):
      Let libudev find hwdb.bin under UDEV_HWDB_BIN
      Add a generic --output argument to udevadm hwdb
      Dynamically get the udevadm hwdb files with a path variable
      fixup! Dynamically get the udevadm hwdb files with a path variable
      Remove references to /run/udev/hwdb.d
      Clarify the /etc/udev/hwdb.d file override with respect to UDEV_HWDB_PATH

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- Correct new version in commit subject (3.2.14)

 .../udev/eudev/0001-Export-dummies-for.patch  | 82 -------------------
 .../eudev/0002-Bump-udev-version-to-251.patch | 23 ------
 .../udev/{eudev_3.2.12.bb => eudev_3.2.14.bb} |  4 +-
 3 files changed, 1 insertion(+), 108 deletions(-)
 delete mode 100644 meta/recipes-core/udev/eudev/0001-Export-dummies-for.patch
 delete mode 100644 meta/recipes-core/udev/eudev/0002-Bump-udev-version-to-251.patch
 rename meta/recipes-core/udev/{eudev_3.2.12.bb => eudev_3.2.14.bb} (93%)

diff --git a/meta/recipes-core/udev/eudev/0001-Export-dummies-for.patch b/meta/recipes-core/udev/eudev/0001-Export-dummies-for.patch
deleted file mode 100644
index 21fbf0f824a1..000000000000
--- a/meta/recipes-core/udev/eudev/0001-Export-dummies-for.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 45634cc0f09ea354be7efce2ae3d3fa8ffc181ec Mon Sep 17 00:00:00 2001
-From: Boian Bonev <bbonev@ipacct.com>
-Date: Fri, 11 Aug 2023 23:14:02 +0000
-Subject: [PATCH] Export dummies for
-
- - udev_device_has_current_tag
- - udev_device_get_current_tags_list_entry
-
-since the current eudev device database does not support the concept of
-current tags
-
-Upstream-Status: Submitted [https://github.com/eudev-project/eudev/pull/253]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/libudev/libudev-device.c | 11 +++++++++++
- src/libudev/libudev.h        |  2 ++
- src/libudev/libudev.sym      |  6 ++++++
- 3 files changed, 19 insertions(+)
-
-diff --git a/src/libudev/libudev-device.c b/src/libudev/libudev-device.c
-index ac67ce8..7d7a662 100644
---- a/src/libudev/libudev-device.c
-+++ b/src/libudev/libudev-device.c
-@@ -1819,6 +1819,12 @@ _public_ struct udev_list_entry *udev_device_get_tags_list_entry(struct udev_dev
-         return udev_list_get_entry(&udev_device->tags_list);
- }
- 
-+_public_ struct udev_list_entry *udev_device_get_current_tags_list_entry(struct udev_device *udev_device)
-+{
-+        // TODO: eudev database does not support current tags
-+        return udev_device_get_tags_list_entry(udev_device);
-+}
-+
- /**
-  * udev_device_has_tag:
-  * @udev_device: udev device
-@@ -1842,6 +1848,11 @@ _public_ int udev_device_has_tag(struct udev_device *udev_device, const char *ta
-         return false;
- }
- 
-+_public_ int udev_device_has_current_tag(struct udev_device *udev_device, const char *tag) {
-+        // TODO: eudev database does not support current tags
-+        return udev_device_has_tag(udev_device, tag);
-+}
-+
- #define ENVP_SIZE                        128
- #define MONITOR_BUF_SIZE                4096
- static int update_envp_monitor_buf(struct udev_device *udev_device)
-diff --git a/src/libudev/libudev.h b/src/libudev/libudev.h
-index 8491d2b..0202964 100644
---- a/src/libudev/libudev.h
-+++ b/src/libudev/libudev.h
-@@ -100,6 +100,7 @@ int udev_device_get_is_initialized(struct udev_device *udev_device);
- struct udev_list_entry *udev_device_get_devlinks_list_entry(struct udev_device *udev_device);
- struct udev_list_entry *udev_device_get_properties_list_entry(struct udev_device *udev_device);
- struct udev_list_entry *udev_device_get_tags_list_entry(struct udev_device *udev_device);
-+struct udev_list_entry *udev_device_get_current_tags_list_entry(struct udev_device *udev_device);
- struct udev_list_entry *udev_device_get_sysattr_list_entry(struct udev_device *udev_device);
- const char *udev_device_get_property_value(struct udev_device *udev_device, const char *key);
- const char *udev_device_get_driver(struct udev_device *udev_device);
-@@ -110,6 +111,7 @@ unsigned long long int udev_device_get_usec_since_initialized(struct udev_device
- const char *udev_device_get_sysattr_value(struct udev_device *udev_device, const char *sysattr);
- int udev_device_set_sysattr_value(struct udev_device *udev_device, const char *sysattr, char *value);
- int udev_device_has_tag(struct udev_device *udev_device, const char *tag);
-+int udev_device_has_current_tag(struct udev_device *udev_device, const char *tag);
- 
- /*
-  * udev_monitor
-diff --git a/src/libudev/libudev.sym b/src/libudev/libudev.sym
-index 76726fc..d56c2ae 100644
---- a/src/libudev/libudev.sym
-+++ b/src/libudev/libudev.sym
-@@ -118,3 +118,9 @@ global:
-         udev_queue_flush;
-         udev_queue_get_fd;
- } LIBUDEV_199;
-+
-+LIBUDEV_247 {
-+global:
-+        udev_device_has_current_tag;
-+        udev_device_get_current_tags_list_entry;
-+} LIBUDEV_215;
diff --git a/meta/recipes-core/udev/eudev/0002-Bump-udev-version-to-251.patch b/meta/recipes-core/udev/eudev/0002-Bump-udev-version-to-251.patch
deleted file mode 100644
index 520cc38cda57..000000000000
--- a/meta/recipes-core/udev/eudev/0002-Bump-udev-version-to-251.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 7a66d4fe8aac8c8697c3cecb0c189e22524fbc98 Mon Sep 17 00:00:00 2001
-From: Boian Bonev <bbonev@ipacct.com>
-Date: Fri, 11 Aug 2023 22:08:27 +0000
-Subject: [PATCH] Bump udev version to 251
-
-Upstream-Status: Submitted [https://github.com/eudev-project/eudev/pull/253]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 3e31b0e..069fdfb 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1,6 +1,6 @@
- AC_PREREQ([2.68])
- AC_INIT([eudev],[3.2.12],[https://github.com/gentoo/eudev/issues])
--AC_SUBST(UDEV_VERSION, 243)
-+AC_SUBST(UDEV_VERSION, 251)
- AC_CONFIG_SRCDIR([src/udev/udevd.c])
- 
- AC_USE_SYSTEM_EXTENSIONS
diff --git a/meta/recipes-core/udev/eudev_3.2.12.bb b/meta/recipes-core/udev/eudev_3.2.14.bb
similarity index 93%
rename from meta/recipes-core/udev/eudev_3.2.12.bb
rename to meta/recipes-core/udev/eudev_3.2.14.bb
index e19c6c0faa48..d0758691bd20 100644
--- a/meta/recipes-core/udev/eudev_3.2.12.bb
+++ b/meta/recipes-core/udev/eudev_3.2.14.bb
@@ -12,11 +12,9 @@ PROVIDES = "udev"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://init \
            file://local.rules \
-           file://0001-Export-dummies-for.patch \
-           file://0002-Bump-udev-version-to-251.patch \
            "
 
-SRC_URI[sha256sum] = "ccdd64ec3c381d3c3ed0e99d2e70d1f62988c7763de89ca7bdffafa5eacb9ad8"
+SRC_URI[sha256sum] = "8da4319102f24abbf7fff5ce9c416af848df163b29590e666d334cc1927f006f"
 
 GITHUB_BASE_URI = "https://github.com/eudev-project/eudev/releases"
 
-- 
2.39.0


