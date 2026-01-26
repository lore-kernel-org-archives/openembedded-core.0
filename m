Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E51CF65D9
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 10:28:06 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17255.1769423285699782214
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 02:28:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nesZpl/a;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8231061d234so3551963b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 02:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769423285; x=1770028085; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+5rmPxecIp7lHmX7zMg/i5bao4yOTMFkJwCduZycOE=;
        b=nesZpl/aAzLspU4kYCZB76kQIH+/dPKH55fAizU6+dys1yYF4QHcePk+ihHAnd9JdR
         gGHKAa7yaylM/DDKN7ouUFTO3vZK1DTStWDA+aRDYWJbA/T09Mk9WQY4vRU2TbWOpWDI
         Ef2NBUcgJJSmVE9nA4ZnMyOMyEfRLpoau9nTq01vt3e0HjUrrlD+lmpDYNMQ3fiReExb
         tJ7ONalALRwDlhlTp9YFETr6OZjLAwOH/gouRxofiwlzUJyGIjocGlGl4PpgdGrwB6cc
         LT41r02Yk8AJj+9uhxdDcnfP2wgy/ag6LiAfCIa55rc4pa8co8x9iWqacxsUBAtCPmCn
         FKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769423285; x=1770028085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k+5rmPxecIp7lHmX7zMg/i5bao4yOTMFkJwCduZycOE=;
        b=NvDmefDhv6gmiUgX9kF9rwg5owgz/WoyOioEPIHrYFNcT5iokaPWTN/QAoRbtf/8L5
         3ZDi0mfGnm2IkaQCQZK4HWY4Owoqbd9jrbqFO1WLSM9csyBCxC6worHDjbZzCGxXkiL2
         jN8/sIhgT5yMSOKf8HtOV7ihzc8q8lR6KnD8eNqXVo7Q4J+4z+dW5FunhNXEIFvuBiL5
         gqgOjYLw7jB89QN1XY/vyF7WhjGT8uHD9kkmJI0smrq7U5CouulEFM8zi2kdQEIQXDbf
         BYnJtR7mukrUQLw5HgN4DHKVAUk61ceAcaCqkp9fobk1G4hKGt1VHAOl6KButMWKuOKK
         2rEw==
X-Gm-Message-State: AOJu0YxZ3eu+/qgq3fCt100xhq+LmDQDHCIrFLrHe/mnLY2n0exAzBff
	4Ol+yF9JjtRCAbTEdVD/JDLvXiX9+EzVItL89zdJUQra8IYGaL8dccMwETupm2RC
X-Gm-Gg: AZuq6aKzrwdA2qdNhf8jEaQ7R805Zu+8Y+idIKpNSldAr6DaXdpt1vN/s2LItBBJMFL
	TqLFz33Ge2ztc7XrL3fILZCbYtf4ibVEkMvtL9XPleRvmUFucb1VBQathIGdr8cRW9qGubK/SBG
	Ob5mZxxqRmtvIkwFvpqesPAysr+EOnv0I0KlZaz9ude18UbzK4l2GXMsb5Na2FuT7+qxNosL4Sp
	ma+OX7OkSRQmZ2PxkDlkingaxYLmJVLbihbKBp7ja2d6cRpvD77BH40YI/tnL25uHvNLDt0YJWQ
	NnzLBWSjJh34gwjUNlwfWgx2lK4YQWaPRnBlgNlGRU4KaNM+KlfY3AISaq+OBxF9I2bs2JYUTPC
	JV45yLCUsbSqf1HdPUmpL3+V5/xrDK2DwABwU8wEh6upjDfw/C0XWfq12ZtEoeo5nQeaRwgFIJv
	53Wi+cPu5WklVdVgrxU43hlaWh
X-Received: by 2002:a05:6a00:f95:b0:823:a97:6fc9 with SMTP id d2e1a72fcca58-823411fc0f1mr3530743b3a.26.1769423284702;
        Mon, 26 Jan 2026 02:28:04 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318644989sm8880357b3a.13.2026.01.26.02.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:28:04 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 2/4] glew: update 2.2.0 -> 2.3.1
Date: Mon, 26 Jan 2026 23:27:45 +1300
Message-ID: <20260126102747.1077552-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126102747.1077552-1-ankur.tyagi85@gmail.com>
References: <20260126102747.1077552-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 10:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229980

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patches which are part of upstream version

- 0001-Fix-build-race-in-Makefile.patch [1]
- no-strip.patch [2]

[1] https://github.com/nigels-com/glew/commit/767e0316450911f1158bd4f7fd8dcd066bae5c55
[2] https://github.com/nigels-com/glew/commit/d7693eea09ac76c67f5f3aa538bb911ce2291e2c

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0001-Fix-build-race-in-Makefile.patch     | 56 -------------------
 .../recipes-graphics/glew/glew/no-strip.patch | 12 ----
 .../glew/{glew_2.2.0.bb => glew_2.3.1.bb}     |  5 +-
 3 files changed, 2 insertions(+), 71 deletions(-)
 delete mode 100644 meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makefile.patch
 delete mode 100644 meta/recipes-graphics/glew/glew/no-strip.patch
 rename meta/recipes-graphics/glew/{glew_2.2.0.bb => glew_2.3.1.bb} (90%)

diff --git a/meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makefile.patch b/meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makefile.patch
deleted file mode 100644
index 2418646689..0000000000
--- a/meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makefile.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-Upstream-Status: Backport [767e0316450911f1158bd4f7fd8dcd066bae5c55]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 0ce0a85597db48a2fca619bd95e34af091e54ae8 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Thu, 22 Jul 2021 16:31:11 +0100
-Subject: [PATCH] Fix build race in Makefile
-
-The current rule for the binaries is:
-
-glew.bin: glew.lib bin bin/$(GLEWINFO.BIN) bin/$(VISUALINFO.BIN)
-
-In parallel builds, all of those targets happen at the same time. This
-means that 'bin' can happen *after* 'bin/$(GLEWINFO.BIN)', which is a
-problem as the 'bin' target's responsibility is to create the directory
-that the other target writes into.
-
-Solve this by not having a separate 'create directory' target which is
-fundamentally racy, and simply mkdir in each target which writes into it.
----
- Makefile | 9 ++++-----
- 1 file changed, 4 insertions(+), 5 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index d0e4614..04af44c 100644
---- a/Makefile
-+++ b/Makefile
-@@ -171,21 +171,20 @@ VISUALINFO.BIN.OBJ := $(VISUALINFO.BIN.OBJ:.c=.o)
- # Don't build glewinfo or visualinfo for NaCL, yet.
- 
- ifneq ($(filter nacl%,$(SYSTEM)),)
--glew.bin: glew.lib bin
-+glew.bin: glew.lib
- else
--glew.bin: glew.lib bin bin/$(GLEWINFO.BIN) bin/$(VISUALINFO.BIN) 
-+glew.bin: glew.lib bin/$(GLEWINFO.BIN) bin/$(VISUALINFO.BIN)
- endif
- 
--bin:
--	mkdir bin
--
- bin/$(GLEWINFO.BIN): $(GLEWINFO.BIN.OBJ) $(LIB.SHARED.DIR)/$(LIB.SHARED)
-+	@mkdir -p $(dir $@)
- 	$(CC) $(CFLAGS) -o $@ $(GLEWINFO.BIN.OBJ) $(BIN.LIBS)
- ifneq ($(STRIP),)
- 	$(STRIP) -x $@
- endif
- 
- bin/$(VISUALINFO.BIN): $(VISUALINFO.BIN.OBJ) $(LIB.SHARED.DIR)/$(LIB.SHARED)
-+	@mkdir -p $(dir $@)
- 	$(CC) $(CFLAGS) -o $@ $(VISUALINFO.BIN.OBJ) $(BIN.LIBS)
- ifneq ($(STRIP),)
- 	$(STRIP) -x $@
--- 
-2.25.1
-
diff --git a/meta/recipes-graphics/glew/glew/no-strip.patch b/meta/recipes-graphics/glew/glew/no-strip.patch
deleted file mode 100644
index 5708d93082..0000000000
--- a/meta/recipes-graphics/glew/glew/no-strip.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Don't forcibly strip the binaries.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-Upstream-Status: Backport [d7693eea09ac76c67f5f3aa538bb911ce2291e2c]
-
-diff --git a/Makefile b/Makefile
-index 6a9803c..170c0ce 100644
---- a/Makefile
-+++ b/Makefile
-@@ -285 +285 @@ install.bin: glew.bin
--	$(INSTALL) -s -m 0755 bin/$(GLEWINFO.BIN) bin/$(VISUALINFO.BIN) "$(DESTDIR)$(BINDIR)/"
-+	$(INSTALL) -m 0755 bin/$(GLEWINFO.BIN) bin/$(VISUALINFO.BIN) "$(DESTDIR)$(BINDIR)/"
diff --git a/meta/recipes-graphics/glew/glew_2.2.0.bb b/meta/recipes-graphics/glew/glew_2.3.1.bb
similarity index 90%
rename from meta/recipes-graphics/glew/glew_2.2.0.bb
rename to meta/recipes-graphics/glew/glew_2.3.1.bb
index b82b25c602..fb4b866fd2 100644
--- a/meta/recipes-graphics/glew/glew_2.2.0.bb
+++ b/meta/recipes-graphics/glew/glew_2.3.1.bb
@@ -6,11 +6,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ac251558de685c6b9478d89be3149c2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
-           file://0001-Fix-build-race-in-Makefile.patch \
            file://notempdir.patch \
-           file://no-strip.patch"
+"
 
-SRC_URI[sha256sum] = "d4fc82893cfb00109578d0a1a2337fb8ca335b3ceccf97b97e5cc7f08e4353e1"
+SRC_URI[sha256sum] = "b64790f94b926acd7e8f84c5d6000a86cb43967bd1e688b03089079799c9e889"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/glew/files/glew"
 UPSTREAM_CHECK_REGEX = "/glew/(?P<pver>(\d+[\.\-_]*)+)/"

