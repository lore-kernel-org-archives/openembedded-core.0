Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30532E8383C
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 22:11:35 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5538.1771279892210517804
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 14:11:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BaW1YgSx;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-824adc96ad2so3599171b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 14:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771279891; x=1771884691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZowsIQiopWVaxrMdCeX52fQzkjrS6mkT5d42WVjRUA=;
        b=BaW1YgSxNqYgqNIJytE8qTm4ddXIroxOf7nMo+9JsRRb/vBVo7nquV4i8Gbrj1oiPJ
         5ro2LowNUf5sVv4KlM35pKgE/2ftnnrZ/Gut+9FRH6nGgVQ84X7fmQ8ZNIrWSOqyx857
         aglhPyuxFvmpph+Hi2rb5JgWNXcfSZn8M6o/IKZcg1XoLubvcsBwtS92yhzmIrJLmJrC
         ZgIaNWA7GS3zSJzkFmIw7WKs8uvpHvVms0tXCIPTIIw9acriU6kU/zaESz9xgL36RWP4
         ejHrPh7AJDtfa6DgrBhQ5vO66x56MtDWaarXOaU33On5yJlblx4bbrJs+XfqioxTAANX
         TLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771279891; x=1771884691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VZowsIQiopWVaxrMdCeX52fQzkjrS6mkT5d42WVjRUA=;
        b=FL0VLlcsh/yEZw9dwEDCzbjQA88pNMHTZ4JIoriMVog1T1kV0lMkPThJ977KIOEwov
         oUYaU5bLfHy9xHDqM/sIBWqqGRRW0vJC2LLKrMt9NiuG+3VsH18t02jgelGgVo9zS0xJ
         y9yCcJTBGVkUjHcj55lXzrs3uk2kpGtCuVtFcjaj2hiP0ufkUvbLTaKSOZWY161oTbd0
         w2i7PvJ0xpiofzd65/abkso5GZfG1h5MIZde7jJxDLGPP7/36iIfRjvq9NZdIEwjDy9w
         VHfRK0lf6TGS65qAqedggyDamNb96MoR7MCs5LdLr1dp1tGsSagpKwe5xTvLX6+iCxbr
         CJkg==
X-Gm-Message-State: AOJu0YwtV2vzZa1hGdheMLiRbu2nwWSAKH8lxiOPZyBtnqF3CJKNI2uo
	XakXZpY7m9SgcuKaA2wmt8U0CzfHwG4/HZK4VDPp7thIF0GOMidjb+pTCJL9TA==
X-Gm-Gg: AZuq6aIzklmtOZpuASnAn8xKptwglzTSZ78afKS3N0xwofvpRYZOHtfrcWoxpOhJ2wE
	LWf3F6ABs5XtjM0rt13ab+FJyJuuePDaVJKdwZdUTEGHS2eqzuHpEiXn761YQbNgrJz9QXJSEhr
	NWaqSrfTYU6Du61wgwx7m1UoX3Aw4yHSxr3bgkkdXdgPJRwbAj0Fq0Tep2WZmlpGTGSFb/YgLhx
	GLInd1qUMHMfqCIMFhVChrK6IwlRLy6XC0FjcC+T3qSuq0rfa1xdQVxEpi3YYIWYnxVSHVYQJHr
	F4zHsPgdbspBYtYZFmpPSAAZdRC1cCEJLD0GpyV9ILhbCQx602uaEdK6gdz/kIze9JGQNdPWePi
	Bk/h56MDWV2U8ddeWK+5vFErWBBdLfbL70ws+Ksne2NRfDApEYu9GMPfOOrgpaw2G9lLARgFfOD
	ytIjzpJO8FSR0ePOJ9l9sZwfAN1QxqhFoJwOc=
X-Received: by 2002:a05:6a00:1988:b0:81f:3ae9:3f71 with SMTP id d2e1a72fcca58-824c5f3a63dmr10732447b3a.28.1771279891364;
        Mon, 16 Feb 2026 14:11:31 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6bb9875sm10959923b3a.65.2026.02.16.14.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 14:11:30 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH v2 2/2] mdadm: catch sed substitution failure during install
Date: Tue, 17 Feb 2026 11:11:18 +1300
Message-ID: <20260216221118.2240588-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216221118.2240588-1-ankur.tyagi85@gmail.com>
References: <20260216221118.2240588-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 22:11:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231226

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

This patch is to validate a possible race condition theory during install.
Also fail the build if sed substitution still fails for further investigation.

Details: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16166

[YOCTO #16166]

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...1-Makefile-install-rule-improvements.patch | 64 +++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.5.bb      | 13 +++-
 2 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-Makefile-install-rule-improvements.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-Makefile-install-rule-improvements.patch b/meta/recipes-extended/mdadm/files/0001-Makefile-install-rule-improvements.patch
new file mode 100644
index 0000000000..feb4c5d926
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-Makefile-install-rule-improvements.patch
@@ -0,0 +1,64 @@
+From 21310a9249e21c3dbdb6a6b8e07e74bf0a4557bc Mon Sep 17 00:00:00 2001
+From: Ankur Tyagi <ankur.tyagi85@gmail.com>
+Date: Tue, 17 Feb 2026 08:41:48 +1300
+Subject: [PATCH] Makefile: install rule improvements
+
+- Removed double install logic
+- Use unique temp files
+
+Upstream-Status: Pending
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ Makefile | 30 ++++++++++++++----------------
+ 1 file changed, 14 insertions(+), 16 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 788ff5d9..a4d4f178 100644
+--- a/Makefile
++++ b/Makefile
+@@ -298,30 +298,28 @@ install-man: mdadm.8 md.4 mdadm.conf.5 mdmon.8
+ install-udev: udev-md-raid-arrays.rules udev-md-raid-assembly.rules udev-md-raid-creating.rules \
+ 		udev-md-clustered-confirm-device.rules 
+ 	@for file in $(UDEV_RULES); \
+-	do sed -e 's,BINDIR,$(BINDIR),g' udev-$${file#??-} > .install.tmp.1 && \
+-	   $(ECHO) $(INSTALL) -D -m 644 udev-$${file#??-} $(DESTDIR)$(UDEVDIR)/rules.d/$$file ; \
+-	   $(INSTALL) -D -m 644 .install.tmp.1 $(DESTDIR)$(UDEVDIR)/rules.d/$$file ; \
+-	   rm -f .install.tmp.1; \
++	do \
++		srcfile=udev-$${file#??-} ; \
++		sed -e 's,BINDIR,$(BINDIR),g' $$srcfile > $$srcfile.tmp && \
++		$(INSTALL) -D -m 644 $$srcfile.tmp $(DESTDIR)$(UDEVDIR)/rules.d/$$file && \
++		rm -f $$srcfile.tmp ; \
+ 	done
+ 
+ install-systemd: systemd/mdmon@.service
+ 	@for file in $(SYSTEMD_UNITS); \
+-	do sed -e 's,BINDIR,$(BINDIR),g;s,MISCDIR,$(MISCDIR),g' systemd/$$file > .install.tmp.2 && \
+-	   $(ECHO) $(INSTALL) -D -m 644 systemd/$$file $(DESTDIR)$(SYSTEMD_DIR)/$$file ; \
+-	   $(INSTALL) -D -m 644 .install.tmp.2 $(DESTDIR)$(SYSTEMD_DIR)/$$file ; \
+-	   rm -f .install.tmp.2; \
++	do sed -e 's,BINDIR,$(BINDIR),g;s,MISCDIR,$(MISCDIR),g' systemd/$$file > systemd/$$file.tmp && \
++	   $(INSTALL) -D -m 644 systemd/$$file.tmp $(DESTDIR)$(SYSTEMD_DIR)/$$file && \
++	   rm -f systemd/$$file.tmp; \
+ 	done
+ 	@for file in mdadm.shutdown ; \
+-	do sed -e 's,BINDIR,$(BINDIR),g' systemd/$$file > .install.tmp.3 && \
+-	   $(ECHO) $(INSTALL) -D -m 755  systemd/$$file $(DESTDIR)$(SYSTEMD_DIR)-shutdown/$$file ; \
+-	   $(INSTALL) -D -m 755  .install.tmp.3 $(DESTDIR)$(SYSTEMD_DIR)-shutdown/$$file ; \
+-	   rm -f .install.tmp.3; \
++	do sed -e 's,BINDIR,$(BINDIR),g' systemd/$$file > systemd/$$file.tmp && \
++	   $(INSTALL) -D -m 755  systemd/$$file.tmp $(DESTDIR)$(SYSTEMD_DIR)-shutdown/$$file && \
++	   rm -f systemd/$$file.tmp; \
+ 	done
+ 	@for file in mdcheck ; \
+-	do sed -e 's,BINDIR,$(BINDIR),g' misc/$$file > .install.tmp.4 && \
+-	   $(ECHO) $(INSTALL) -D -m 755  misc/$$file $(DESTDIR)$(MISCDIR)/$$file ; \
+-	   $(INSTALL) -D -m 755  .install.tmp.4 $(DESTDIR)$(MISCDIR)/$$file ; \
+-	   rm -f .install.tmp.4; \
++	do sed -e 's,BINDIR,$(BINDIR),g' misc/$$file > misc/$$file.tmp && \
++	   $(INSTALL) -D -m 755  misc/$$file.tmp $(DESTDIR)$(MISCDIR)/$$file && \
++	   rm -f misc/$$file.tmp; \
+ 	done
+ 
+ install-bin: mdadm mdmon
diff --git a/meta/recipes-extended/mdadm/mdadm_4.5.bb b/meta/recipes-extended/mdadm/mdadm_4.5.bb
index b30d3d776e..bca70aeaf0 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.5.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.5.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/mdadm/mdadm.git;protocol=https;bra
            file://mdadm.init \
            file://0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch \
            file://0001-raid6check.c-restripe.c-Use-64-bit-off_t-across-both.patch \
+           file://0001-Makefile-install-rule-improvements.patch \
            "
 
 SRCREV = "8f0c7692d48414ff7b3fe927ce75799c65ef24b1"
@@ -40,11 +41,21 @@ EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CWFLAGS="" CXFLAGS="${CFLAGS}" SYSTEMD_DIR=${sys
 DEBUG_OPTIMIZATION:append = " -Wno-error"
 
 do_install() {
-        oe_runmake 'DESTDIR=${D}' install install-systemd
+        install -d ${D}/${datadir}/
+
+        oe_runmake -j 1 'DESTDIR=${D}' install install-systemd
+
         install -d ${D}/${sysconfdir}/
         install -m 644 ${S}/documentation/mdadm.conf-example ${D}${sysconfdir}/mdadm.conf
         install -d ${D}/${sysconfdir}/init.d
         install -m 755 ${UNPACKDIR}/mdadm.init ${D}${sysconfdir}/init.d/mdmonitor
+        # temp change
+        install -m 644 ${S}/udev-md-raid-safe-timeouts.rules ${D}/${sysconfdir}/tmp-file
+
+        if grep -q "BINDIR" ${D}${datadir}/${BPN}/mdcheck; then
+            bberror "Build failed: 'BINDIR' placeholder found in mdcheck."
+            bbfatal_log "sed command in Makefile failed to execute correctly."
+        fi
 }
 
 do_compile_ptest() {

