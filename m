Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id ABBF87DFCC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:04 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id t5so6235761wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=c49oUUghyyBoDwXLmFTrgkR/I9A2FHCbiysqudwm/vo=;
	b=CGe0f5m+CzIJ8kbRwFNlnqmVopiqMbE7CysZS/LWChnM63E79e+ttgiCOJaFb822H7
	EYmcCuxsl2EHYD2Q3LiPSmGVHiBI47Zv0fzmcOy+wDqMKtYB99fOZ9x/BBeXfGQOSQCF
	+xDDwZoxeDNjQKyPvSbGfrTyIGagwHPsDOkStO2CJEEAP8yp89+tkUJO8Lx2PC2F+BGk
	7bYpXPii+DdgUAdvlX6m3UW6sEIaTK9/Ed/IEwad2AQVqLR99wS027//r0x7RVUc8cB1
	YXsSsl2rc8ZoGtB+Kbkp38I2RM1Fo64DHAriHZpx0FmA+y1mVrpCVvfxPamV+4J1J+ep
	+Nwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=c49oUUghyyBoDwXLmFTrgkR/I9A2FHCbiysqudwm/vo=;
	b=cqY4zyF+mKuWmZ+z7GGvilk533DblcxtyG+zH5NrIUpexmnp3bDWvbLe6VkA2rLJKK
	Pe4xoTcc/zDTtoZvaW2ggMjHc6qy/dIpBSlSH8LYrBEwy3Rb26bnI7LjO87YTEpgs7NL
	3abFHBa5i/hrd/Gp8GxDcZ0a/J4S8ZBZMXjABDqiL5y5yPbcibtLYHD1KdZLY9rHzc9T
	rlqe5fYPGXE5orLY2ymkgyLNkwSJPP3h/uFmw6IPpVWOGFVOhI7Qn4iJov9N5EqwzXQj
	bwQHjsL4U0h7VAL9GFQq8KO/NuvcT5mtgTMAba6BAhSy3EEjAjLymVoNu1pd8f8F0p8U
	VwWw==
X-Gm-Message-State: APjAAAXLoXQF+CkD6w4dutWRtrRkHzziGlYw5oTYOK9Rc2aeyb9iK612
	NRnfDr9fvMEu5ECaf7fxRkirhnHs
X-Google-Smtp-Source: APXvYqxVt7BRc05v1bor4NUqqcjpULVCo9GgtS6YHZMmGQa30qGjpdY/4DJs/6r/FCZWOZbjSQKMQw==
X-Received: by 2002:a1c:96d3:: with SMTP id y202mr3296125wmd.139.1558116725016;
	Fri, 17 May 2019 11:12:05 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:22 +0200
Message-Id: <20190517181151.44001-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 08/37] atk: upgrade 2.30.0 -> 2.32.0
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
X-List-Received-Date: Fri, 17 May 2019 18:12:05 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...001-Switch-from-filename-to-basename.patch | 38 -------------------
 ...able-introspection-for-cross-compile.patch |  7 ++--
 .../atk/{atk_2.30.0.bb => atk_2.32.0.bb}      |  9 ++---
 3 files changed, 7 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-support/atk/atk/0001-Switch-from-filename-to-basename.patch
 rename meta/recipes-support/atk/{atk_2.30.0.bb => atk_2.32.0.bb} (64%)

diff --git a/meta/recipes-support/atk/atk/0001-Switch-from-filename-to-basename.patch b/meta/recipes-support/atk/atk/0001-Switch-from-filename-to-basename.patch
deleted file mode 100644
index 047e81fb613..00000000000
--- a/meta/recipes-support/atk/atk/0001-Switch-from-filename-to-basename.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Upstream-Status: Submitted
-
-From 0330251715fee908f2f162565d4fa1df5030d0c0 Mon Sep 17 00:00:00 2001
-From: Jeremy Puhlman <jpuhlman@mvista.com>
-Date: Thu, 14 Jun 2018 17:21:49 +0000
-Subject: [PATCH] Switch from filename to basename
-
-When atk-enum-types.h is installed in to a system, the user likely has
-no access to the location where the headers were built, especially if
-the software was built in a sysroot environment. If the headers were
-built for a mulitlib environment, the build pathing may be different.
-Subsequently, if two mulitlib variants of atk are installed together the
-headers conflict for no other reason then they were built in two
-different locations. Switching from filename to basename, still should
-provide sufficient information on the providence of the enums, while not
-conflicting for really no good reason.
-
-Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
----
- atk/atk-enum-types.h.template | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/atk/atk-enum-types.h.template b/atk/atk-enum-types.h.template
-index 7b4cec4..8321c24 100644
---- a/atk/atk-enum-types.h.template
-+++ b/atk/atk-enum-types.h.template
-@@ -14,7 +14,7 @@ G_BEGIN_DECLS
- 
- /*** BEGIN file-production ***/
- 
--/* enumerations from "@filename@" */
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
- 
- /*** BEGIN value-header ***/
--- 
-2.14.1.459.g238e487
-
diff --git a/meta/recipes-support/atk/atk/0001-meson.build-enable-introspection-for-cross-compile.patch b/meta/recipes-support/atk/atk/0001-meson.build-enable-introspection-for-cross-compile.patch
index 1d814ccdb74..d1b08bc04b6 100644
--- a/meta/recipes-support/atk/atk/0001-meson.build-enable-introspection-for-cross-compile.patch
+++ b/meta/recipes-support/atk/atk/0001-meson.build-enable-introspection-for-cross-compile.patch
@@ -1,4 +1,4 @@
-From c3eb5b2e74c38bb8374bc027f84e42d7e94f62f8 Mon Sep 17 00:00:00 2001
+From 44d46baa5e1519c6c3df7e4d34fb333e247b5bc8 Mon Sep 17 00:00:00 2001
 From: Anuj Mittal <anuj.mittal@intel.com>
 Date: Fri, 6 Apr 2018 12:04:00 +0800
 Subject: [PATCH] meson.build: enable introspection for cross-compile
@@ -9,16 +9,17 @@ if it should be disabled or not.
 Upstream-Status: Pending
 
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
 ---
  atk/meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/atk/meson.build b/atk/meson.build
-index 616a3e6..941ded8 100644
+index 0ad67e5..1d2a49c 100644
 --- a/atk/meson.build
 +++ b/atk/meson.build
 @@ -137,7 +137,7 @@ libatk_dep = declare_dependency(link_with: libatk,
-                                 dependencies: gobject_dep,
+                                 dependencies: glib_dep,
                                  sources: atk_enum_h)
  
 -if not meson.is_cross_build() and get_option('introspection')
diff --git a/meta/recipes-support/atk/atk_2.30.0.bb b/meta/recipes-support/atk/atk_2.32.0.bb
similarity index 64%
rename from meta/recipes-support/atk/atk_2.30.0.bb
rename to meta/recipes-support/atk/atk_2.32.0.bb
index 4e22b3f8113..67223729e93 100644
--- a/meta/recipes-support/atk/atk_2.30.0.bb
+++ b/meta/recipes-support/atk/atk_2.32.0.bb
@@ -14,12 +14,9 @@ DEPENDS = "gettext-native glib-2.0"
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gtk-doc gettext upstream-version-is-even gobject-introspection
 
-SRC_URI_append = " \
-                   file://0001-meson.build-enable-introspection-for-cross-compile.patch \
-                   file://0001-Switch-from-filename-to-basename.patch \
-                   "
-SRC_URI[archive.md5sum] = "769c85005d392ad17ffbc063f2d26454"
-SRC_URI[archive.sha256sum] = "dd4d90d4217f2a0c1fee708a555596c2c19d26fef0952e1ead1938ab632c027b"
+SRC_URI += " file://0001-meson.build-enable-introspection-for-cross-compile.patch"
+SRC_URI[archive.md5sum] = "c10b0b2af3c199e42caa6275b845c49d"
+SRC_URI[archive.sha256sum] = "cb41feda7fe4ef0daa024471438ea0219592baf7c291347e5a858bb64e4091cc"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.17.1


