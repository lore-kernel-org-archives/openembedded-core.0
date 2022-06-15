Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 772F1C433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 10:04:24 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web09.2759.1655287462153937540
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 03:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=XrXEmqf6;
 spf=pass (domain: linaro.org, ip: 209.85.208.176,
 mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f176.google.com with SMTP id d18so12686584ljc.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 03:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nujwTmTxGcBXgxJ7wCDTnPI9gyRupYnrhNifPcA/zN0=;
        b=XrXEmqf6LiJdZ67x40DFDzcnz47QzPJvsWn4Z6iHQ6uQiolVJtXla9rOPy6w+DOeDQ
         3wiDMmF6wOIgD0XqAATcimgIDC45f0LNdtzs6YzIdHSCCSqKMwkNvMEDAO13bFoNULlk
         OQyvQo7mC2N+CBAJlUN7c6JJLW1g9UgyRa74WKQtiGgwlJfc+8B+7pEZhLf2FgcD50tx
         A8w2e1o1P36o0wk3ZEWBynH3zxXR9ReTeA00k4lsqXqDWPXPd3MnvU7YTXv8+Es9e1oX
         nZb/h0piPYdOLhmY7QFKfI/LWXumtsiIezE7wX3rD5PmBOq4d+jICzWEOlojzNNpSXQH
         oy5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nujwTmTxGcBXgxJ7wCDTnPI9gyRupYnrhNifPcA/zN0=;
        b=iOdLqPuaArPiRoyC9LoZhQjoc8wTycJCUfIS6Biq9+1HN++CNz09vWYax+/CqigxY5
         R70WLUMf8lyuFB5w6AStKMYebEQioLfqIXhKQeKyrE2DASJ/FIMmD3lGtbJcIiZUfPqW
         Qf4jb5GPCGQXzcSKPBsSnXHQBBOGM1QzJbSluDYa6dgKXFamXMY4JaZ/s6xRGN04sEbc
         reFTxFLmFSExfvwVNdTr5y/vQyhsKoZEziX1AQ0NHg9hRIUCf3jdhw4sY/u6y8PlMQiZ
         er3GBz0THBhAwqSq2ui0XuB7wOMyjlJ0+LJhffshK/HvlaMG2JvZKdp8jVhsERacN2mv
         yCjg==
X-Gm-Message-State: AJIora8twUhUFdFQThgsg8Z8sfj2eoUg7H6J1BocIyzi7AkFGxpovFIl
	9z2NmwdbPMCayvG1Tx8hLbLBnojXz0mOkmDu
X-Google-Smtp-Source: 
 AGRyM1tSBdCo40YrzHpOtHBpeuHfoktVYCho+Cjz8sgLeMb68DZu9qTgaPymyXW7BB1L+bP9rhOp6Q==
X-Received: by 2002:a2e:b895:0:b0:255:c257:5b3 with SMTP id
 r21-20020a2eb895000000b00255c25705b3mr4771779ljp.247.1655287459838;
        Wed, 15 Jun 2022 03:04:19 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id
 c21-20020ac25f75000000b0047255d210e0sm1745611lfc.15.2022.06.15.03.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 03:04:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: dmitry.baryshkov@linaro.org,
	Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: [PATCH] linux-firmware: upgrade 20220509 -> 20220610
Date: Wed, 15 Jun 2022 13:04:15 +0300
Message-Id: <20220615100415.2282407-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 10:04:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166927

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Drop 0001-Makefile-replace-mkdir-by-install.patch merged upstream.

License-Update: additional files
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 ...01-Makefile-replace-mkdir-by-install.patch | 84 -------------------
 ...20220509.bb => linux-firmware_20220610.bb} |  5 +-
 2 files changed, 2 insertions(+), 87 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-firmware/files/0001-Makefile-replace-mkdir-by-install.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220509.bb => linux-firmware_20220610.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/files/0001-Makefile-replace-mkdir-by-install.patch b/meta/recipes-kernel/linux-firmware/files/0001-Makefile-replace-mkdir-by-install.patch
deleted file mode 100644
index b1ac5a16abac..000000000000
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
index 10a7036a1938..78b38df461a8 100644
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
2.30.2


