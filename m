Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B086C43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 23:29:48 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web08.1227.1655854181710360747
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=M9tzAXle;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id q18so2417168pld.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=iJGKayaftGnc7ERl2MGIDw2A4bUC5wYM3CF5nAEsdYI=;
        b=M9tzAXleyPdjgIt+sIVB6eaRHyw4p/WP694oluGnMPvgA9DdCRuGC/lqtnNafQkv/8
         XTpbIphdJ+PZUk3o/Msdf5o9roe7Y7FgA/oq3koCXKiX+VmjC1rFmh2bLQHcLZoP72ZA
         Cu1WsnypjtW/8ORxMOZY3aj13voGJL3cJ6bHfaehxvGfIzG5DhW3J81fhY5fhz8Zrxbw
         mlCiQGfHeU3uInpCMs7Afkgt+T1GheqPkqKk2m9hK77/OQ8Qe62tdvDDNXGPfGgf5Jod
         hrzW7h8L0fgdelp9ap+bXi1CUXAERkD3kXS1QSZmQlQixZkL+6ViCgDOy+SPU/2lFnTc
         A6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iJGKayaftGnc7ERl2MGIDw2A4bUC5wYM3CF5nAEsdYI=;
        b=ivXfZ+p8lP+0C9/fWJbBFpMNsF00DcV71CC4GgdqAnNnw5muMTdpseOOS1mZeqisWg
         WQMo8X3LCtIGmgMC8XAMCtOjj15ydh7u/6EmgKipfSt3RZ98bsc6SdM8CNZhrLHkyK3P
         ML2PaDcJ1P+sN4Yxp87frq/AieP7X1kt/S9zt4QMwiDZVbkS4f6vz6gwwU/KWcFehsUu
         OkqOaF7bpsvUoz3lM1ZiAgcgS0ZDaIZueR3uGZ4WpxDqG3WxmgA1/Xw/L8nestm+jjuX
         uJWM5fHd/SxFzLtxCS+wuTAjkR9JCe+TDnHWz6xYVeMkYLfnp7o0J7YccpeZItGW65oh
         0AHQ==
X-Gm-Message-State: AJIora+t04kcrJ2sRE1HE6wljpXshdyGODkdUUIIi4uEpXtmSHr7zjVt
	D8lHlY1TT416QEj9iLyQl8ugMSaPJLjJ3fc0
X-Google-Smtp-Source: 
 AGRyM1txI2/X1G4uaDqLcBpOsq/Ea0RA6PJ7fZ/BUZ8XNBl1q4phOBUhMPYsnR7UVLNzztE4n8aePw==
X-Received: by 2002:a17:902:ef92:b0:16a:1ef1:22db with SMTP id
 iz18-20020a170902ef9200b0016a1ef122dbmr14512623plb.2.1655854180723;
        Tue, 21 Jun 2022 16:29:40 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f25-20020a637559000000b0040cf934a1a0sm2041614pgn.28.2022.06.21.16.29.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 16:29:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/6] linux-firmware: upgrade 20220509 -> 20220610
Date: Tue, 21 Jun 2022 13:29:03 -1000
Message-Id: 
 <c6f5fb5e7545636ef7948ad1562548b7b64dac35.1655836866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655836866.git.steve@sakoman.com>
References: <cover.1655836866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 23:29:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167210

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Drop 0001-Makefile-replace-mkdir-by-install.patch merged upstream.

License-Update: additional files
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 91cd99267157e860a108282aee13e162e8c10572)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit bcc5a22cd2b25c777315fe9d677fc0338ae2ab68)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...01-Makefile-replace-mkdir-by-install.patch | 84 -------------------
 ...20220509.bb => linux-firmware_20220610.bb} |  5 +-
 2 files changed, 2 insertions(+), 87 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-firmware/files/0001-Makefile-replace-mkdir-by-install.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220509.bb => linux-firmware_20220610.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/files/0001-Makefile-replace-mkdir-by-install.patch b/meta/recipes-kernel/linux-firmware/files/0001-Makefile-replace-mkdir-by-install.patch
deleted file mode 100644
index b1ac5a16ab..0000000000
--- a/meta/recipes-kernel/linux-firmware/files/0001-Makefile-replace-mkdir-by-install.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 71514e74f35f2b51ca24062573d6d913525b30db Mon Sep 17 00:00:00 2001
-From: Konrad Weihmann <kweihmann@outlook.com>
-Date: Mon, 9 May 2022 12:57:57 +0200
-Subject: [PATCH] Makefile: replace mkdir by install
-
-mkdir -p creates paths that are bound to user's settings and therefore
-can lead to different file mode bits of the base paths accross different
-machines.
-Use install instead, as this tool is not prone to such behavior.
-
-Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
-Upstream-Status: Submitted [https://lore.kernel.org/linux-firmware/PR2PR09MB310088EA719E6D7CA5C268F1A8C69@PR2PR09MB3100.eurprd09.prod.outlook.com/]
----
- Makefile                      | 2 +-
- carl9170fw/toolchain/Makefile | 4 ++--
- copy-firmware.sh              | 6 +++---
- 3 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index e1c362f..83a0ec6 100644
---- a/Makefile
-+++ b/Makefile
-@@ -9,5 +9,5 @@ check:
- 	@./check_whence.py
- 
- install:
--	mkdir -p $(DESTDIR)$(FIRMWAREDIR)
-+	install -d $(DESTDIR)$(FIRMWAREDIR)
- 	./copy-firmware.sh $(DESTDIR)$(FIRMWAREDIR)
-diff --git a/carl9170fw/toolchain/Makefile b/carl9170fw/toolchain/Makefile
-index 2b25ffe..aaea8e8 100644
---- a/carl9170fw/toolchain/Makefile
-+++ b/carl9170fw/toolchain/Makefile
-@@ -46,14 +46,14 @@ src/gcc-$(GCC_VER): src/$(GCC_TAR) src/newlib-$(NEWLIB_VER)
- 	ln -s $(BASEDIR)/src/newlib-$(NEWLIB_VER)/libgloss $@
- 
- binutils: src/binutils-$(BINUTILS_VER)
--	mkdir -p build/binutils
-+	install -d build/binutils
- 	cd build/binutils; \
- 	$(BASEDIR)/$</configure --target=sh-elf --prefix=$(BASEDIR)/inst; \
- 	$(MAKE) -j3; \
- 	$(MAKE) install
- 
- gcc: src/gcc-$(GCC_VER) binutils
--	mkdir -p build/gcc
-+	install -d build/gcc
- 	cd build/gcc; \
- 	$(BASEDIR)/$</configure --target=sh-elf --prefix=$(BASEDIR)/inst -enable-languages=c --without-pkgversion --with-newlib; \
- 	$(MAKE) -j3; \
-diff --git a/copy-firmware.sh b/copy-firmware.sh
-index 9b46b63..bbacb92 100755
---- a/copy-firmware.sh
-+++ b/copy-firmware.sh
-@@ -34,7 +34,7 @@ done
- grep '^File:' WHENCE | sed -e's/^File: *//g' -e's/"//g' | while read f; do
-     test -f "$f" || continue
-     $verbose "copying file $f"
--    mkdir -p $destdir/$(dirname "$f")
-+    install -d $destdir/$(dirname "$f")
-     cp -d "$f" $destdir/"$f"
- done
- 
-@@ -42,7 +42,7 @@ grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; d
-     if test -L "$f"; then
-         test -f "$destdir/$f" && continue
-         $verbose "copying link $f"
--        mkdir -p $destdir/$(dirname "$f")
-+        install -d $destdir/$(dirname "$f")
-         cp -d "$f" $destdir/"$f"
- 
-         if test "x$d" != "x"; then
-@@ -63,7 +63,7 @@ grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; d
-         fi
-     else
-         $verbose "creating link $f -> $d"
--        mkdir -p $destdir/$(dirname "$f")
-+        install -d $destdir/$(dirname "$f")
-         ln -sf "$d" "$destdir/$f"
-     fi
- done
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220610.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20220610.bb
index b6b4043002..0fd9305e3c 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220610.bb
@@ -69,7 +69,7 @@ LICENSE = "\
     & WHENCE \
 "
 
-WHENCE_CHKSUM = "d3eb82686904888f8bbbe8d865371404"
+WHENCE_CHKSUM = "385947b278a6646ae4c3d39ba8c9b1bb"
 LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
@@ -206,7 +206,6 @@ PE = "1"
 
 SRC_URI = "\
   ${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz \
-  file://0001-Makefile-replace-mkdir-by-install.patch \
 "
 
 BBCLASSEXTEND = "devupstream:target"
@@ -214,7 +213,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "376e0b3d7b4f8aaa2abf7f5ab74803dcf14b06b94e3d841b1467cd9a2848255e"
+SRC_URI[sha256sum] = "faf3aedf89530e61f4fa1e8c7303dead9127cc24416945647797d079feb12837"
 
 inherit allarch
 
-- 
2.25.1


