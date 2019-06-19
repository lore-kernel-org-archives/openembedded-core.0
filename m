Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 11C8D7E95B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 13:25:05 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c2so3388976wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 06:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kNlwvn0NpMjb1LtLkH7GUtyDlfBGWREszbIrUsB/zMc=;
	b=amLhgva8khEiTqcMGPlCM3XGab9Dgqgapv77NzfG8R/OrVESuOpNZJfJ3xcGFbHJNR
	hIFtzEX8cpfKpcFK/QKm45m35YYKe5vLZ9RgBCgpPaSq2R23MTNXk7RcEo4GxBDJIkBA
	FXxKHGYTA0qeRCH5TZbGDAg7syNBlyuxA++mA4fHVwtZBAlNS4KeVVN+bTwB75UD3yej
	NKG/8cg88dbNa4wpL3KblyVCrsXdfl9fi2s2s//kJ3KBqE5FMQMu0H1MzpluiEMH3d7S
	4/WBVaR8e8I2UAGOYq4XU8qU25fzMyo4/cuoX7c7HBc4P+vAmoKp4vjILsKBYaPkukiw
	HAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kNlwvn0NpMjb1LtLkH7GUtyDlfBGWREszbIrUsB/zMc=;
	b=b+0Xvsi8HwgXWgeHr8cu46PRdZLGaPx/NlQ1p3FQOorimbt/qjZGtG2Q7HJDjc71K0
	/TN9X25ircLroh9WOe+DKvqn+FfYaGM3rVrbST+LsVIwBVqBFfgKAFxU7cQjyI5c5+xB
	JlPIKlBH6wh4wN22CesQxn9cPSeL3/VefRpTc6O9Gpui9pofLAn/4EtSCufos3X9Tn4N
	uHlKyIN6v9aw4zAbDYxkrV9otUwxtUIyrsAfNRXEzFikuCrJt2EZlgEZUzjq2/Re/97C
	tKCCIFK5GkPRrbR1EMTGTxVg9WjVkb7lY41190wMi0/aGyZSifEHHRePdr3lj4iO789f
	zxrQ==
X-Gm-Message-State: APjAAAUhi/RQFrbX10Rdu/yNhtxZbTVjmZYo/c5fTJ8IJcJRGMFcDnx3
	kHVy9ShXD/0bSX/ebTFdJFAuK5dyZ0Q=
X-Google-Smtp-Source: APXvYqxtORy2g0rZITkP/mUF3cpOERNKQMFMjVdvIdAInCze/Rz0JH7x1mNufK2Z8iZ6VFsqT+YNYg==
X-Received: by 2002:a5d:4d84:: with SMTP id b4mr5329331wru.242.1560950706405; 
	Wed, 19 Jun 2019 06:25:06 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id q1sm1588953wmq.25.2019.06.19.06.25.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Jun 2019 06:25:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 15:24:49 +0200
Message-Id: <20190619132450.130226-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190619132450.130226-1-alex.kanavin@gmail.com>
References: <20190619132450.130226-1-alex.kanavin@gmail.com>
Subject: [PATCH 8/9] btrfs-tools: update to 5.1.1
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
X-List-Received-Date: Wed, 19 Jun 2019 13:25:06 -0000

Drop backported patch, and a patch where upstream took care of the issue.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...DFLAGS-when-building-libbtrfsutil.so.patch | 26 -----------
 ...gs-Pass-CFLAGS-and-LDFLAGS-to-Python.patch | 43 -------------------
 ...trfs-tools_5.1.bb => btrfs-tools_5.1.1.bb} |  4 +-
 3 files changed, 1 insertion(+), 72 deletions(-)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0003-btrfs-progs-Pass-CFLAGS-and-LDFLAGS-to-Python.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.1.bb => btrfs-tools_5.1.1.bb} (89%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch
deleted file mode 100644
index e23be32599b..00000000000
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From c384fa875c5128009ac8b6ba11a54a6bd4de575a Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 17 May 2018 12:21:31 +0300
-Subject: [PATCH] Add LDFLAGS when building libbtrfsutil.so and python
- bindings.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index e25e256f..6df00186 100644
---- a/Makefile
-+++ b/Makefile
-@@ -424,7 +424,7 @@ libbtrfsutil/%.o: libbtrfsutil/%.c
- 
- libbtrfsutil.so.$(libbtrfsutil_version): $(libbtrfsutil_objects)
- 	@echo "    [LD]     $@"
--	$(Q)$(CC) $(LIBBTRFSUTIL_CFLAGS) $(libbtrfsutil_objects) \
-+	$(Q)$(CC) $(LIBBTRFSUTIL_CFLAGS) $(LDFLAGS) $(libbtrfsutil_objects) \
- 		-shared -Wl,-soname,libbtrfsutil.so.$(libbtrfsutil_major) -o $@
- 
- libbtrfsutil.a: $(libbtrfsutil_objects)
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0003-btrfs-progs-Pass-CFLAGS-and-LDFLAGS-to-Python.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0003-btrfs-progs-Pass-CFLAGS-and-LDFLAGS-to-Python.patch
deleted file mode 100644
index f69507164c6..00000000000
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0003-btrfs-progs-Pass-CFLAGS-and-LDFLAGS-to-Python.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 730fe2ee2fb9e08cbe885f370afe83fecb18d048 Mon Sep 17 00:00:00 2001
-From: Joshua Watt <JPEWhacker@gmail.com>
-Date: Sun, 26 May 2019 21:26:04 -0500
-Subject: [PATCH] btrfs-progs: Pass CFLAGS and LDFLAGS to Python
-
-Adds Make variables EXTRA_PYTHON_CFLAGS and EXTRA_PYTHON_LDFLAGS which
-can be used to pass CFLAGS and LDFLAGS respectively when building the
-Python library.
-
-This is required to support reproducible builds, as there are often
-compiler and linker flags that must be passed in order to generate
-reproducible output (e.g. -fdebug-prefix-map)
-
-Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
-Upstream-Status: Accepted [https://github.com/kdave/btrfs-progs/pull/176]
----
- Makefile | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 505bd9c1..814767a8 100644
---- a/Makefile
-+++ b/Makefile
-@@ -24,6 +24,10 @@
- #   DEBUG_CFLAGS   additional compiler flags for debugging build
- #   EXTRA_CFLAGS   additional compiler flags
- #   EXTRA_LDFLAGS  additional linker flags
-+#   EXTRA_PYTHON_CFLAGS  additional compiler flags to pass when building Python
-+#                        library
-+#   EXTRA_PYTHON_LDFLAGS additional linker flags to pass when building Python
-+#                        library
- #
- # Testing-specific options (see also tests/README.md):
- #   TEST=GLOB      run test(s) from directories matching GLOB
-@@ -439,7 +443,7 @@ ifeq ($(PYTHON_BINDINGS),1)
- libbtrfsutil_python: libbtrfsutil.so.$(libbtrfsutil_major) libbtrfsutil.so libbtrfsutil/btrfsutil.h
- 	@echo "    [PY]     libbtrfsutil"
- 	$(Q)cd libbtrfsutil/python; \
--		CFLAGS= LDFLAGS= $(PYTHON) setup.py $(SETUP_PY_Q) build_ext -i build
-+		CFLAGS="$(EXTRA_PYTHON_CFLAGS)" LDFLAGS="$(EXTRA_PYTHON_LDFLAGS)" $(PYTHON) setup.py $(SETUP_PY_Q) build_ext -i build
- 
- .PHONY: libbtrfsutil_python
- endif
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.1.1.bb
similarity index 89%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.1.1.bb
index 89cc1bfe20b..2cd99706b43 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.1.1.bb
@@ -14,11 +14,9 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl python3-setuptools-native"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "43013422dbce4bcc9ed77cfe65b294caa0985ec8"
+SRCREV = "781e36a784faa58a4f0515eef124af860d59e2c0"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
-           file://0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
-           file://0003-btrfs-progs-Pass-CFLAGS-and-LDFLAGS-to-Python.patch \
            "
 
 inherit autotools-brokensep pkgconfig manpages distutils3-base
-- 
2.17.1


