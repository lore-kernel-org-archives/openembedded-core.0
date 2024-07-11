Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25215C3DA45
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 19:13:56 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.244.1720725231105125667
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 12:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M/JHtEr2;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4267345e746so8312225e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 12:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720725229; x=1721330029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jERz30ga16c72H1h4a9xWa5wSQwzGVx4uzb4JLneSaY=;
        b=M/JHtEr2Fvs6beK5o1O7aLEit2VduQkLIy88HOTjAPAX5qH8Dj34hbW3tJlEWPu+Jo
         Xwa3Ehg5akqEIqU0TbBIJfoHiV3ArewwXzyVkfMGCwrbkN3iTmtKPWJLkm8Pwt4St9BH
         +VCiFN4Fjo55sFd87QoVvgJxpUPa7pyiUePl9wb8HLP0x4x05psKfTLlk2pRyPXW4OkN
         mQ886fd5XM2XQkfF+fNTppD0/p5yNAe734orKiAv9ls56667yIETdwWE/0SkLmnkLP3Y
         NKS34b9wA4ANO/IC7Z2HA1eHsiKBsODjgyn4mr2EvLE8YrtV41RQ2dCsQC1VhtYbOJBT
         QFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720725229; x=1721330029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jERz30ga16c72H1h4a9xWa5wSQwzGVx4uzb4JLneSaY=;
        b=Wpm8p5Np0kVKSW0Fcfi1c1TdcwVGDinQ6uNSQQQLp0pGfbDKoPfo+SbkecEEKkZ9pe
         WwBiM9OriwNLx+gANIF/uLnq1tjCIvV2/applAkAtrAW+QG2VeQ0nIagDadIY+7fDFSO
         MTBaFnXEBaO+PmYaQ18zQ7/d+F9YxHeBFVbIZZYK8jgnx8nnsdMVkSHrfgG0d+ZP/yV0
         +Fprl4dD2qubFmP1qTVmRO5HbVvxGSlRA8x078B7lmb4xditJR5AhVd+mgAeVhdPD/9E
         kMDtqrYSUHsc1R3hL7tDZOtDJ4lANry+1X6ayJeDniUhmSu03K3F7xlzEVkdA4gWke6B
         eneQ==
X-Gm-Message-State: AOJu0YwxAN0RbzzYJo3taGodmJpCvSxhhRKYkI6PdOwcy1wfIuBVypeU
	eNW4KQn8CmNcCyZsiUEYiterzX3l3rD3NH7cBac2TQoqysenXSFYWnvv6w==
X-Google-Smtp-Source: AGHT+IHu/fCF1B3UBLXaJi6qfUNZ3HOp7850BiLGMdGIihDITVHf9nADXpgqNIAfdhXeSKsKWQMAtQ==
X-Received: by 2002:a05:600c:534b:b0:426:6ad8:3e3c with SMTP id 5b1f17b1804b1-426707e2fa2mr60858605e9.17.1720725228806;
        Thu, 11 Jul 2024 12:13:48 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6e09fcsm128586175e9.4.2024.07.11.12.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 12:13:48 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: gudnimg <gudni.m.g@gmail.com>
Subject: [PATCH v2] bluez5: upgrade 5.72 -> 5.77
Date: Thu, 11 Jul 2024 19:12:53 +0000
Message-Id: <20240711191253.3247-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 19:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201791

From: gudnimg <gudni.m.g@gmail.com>

Changelog:
* https://github.com/bluez/bluez/releases/tag/5.77
* https://github.com/bluez/bluez/releases/tag/5.76
* https://github.com/bluez/bluez/releases/tag/5.75
* https://github.com/bluez/bluez/releases/tag/5.74
* https://github.com/bluez/bluez/releases/tag/5.73

Changes relevant to the build:
* One patch file is dropped.
* /etc/bluetooth is now installed with 555 permission bits when systemd
is not enabled. The do_install function was edited to change it back to
755. This was causing test failure when testing SDK packaging
* Added a few missing PACKAGECONFIGs which are enabled by default.
- asha-profiles: new in BlueZ 5.77
- ccp-profiles: new in BlueZ 5.73
- micp-profiles: new in BlueZ 5.70
- csip-profiles: new in BlueZ 5.67
- bass-profiles: new in BlueZ 5.67
- vcp-profiles: new in BlueZ 5.66
- mcp-profiles: new in BlueZ 5.66
- bap-profiles: new in BlueZ 5.66

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   | 22 +++++++-
 ...d-without-systemd-in-the-user-sessio.patch | 56 -------------------
 .../0001-test-gatt-Fix-hung-issue.patch       |  7 +--
 ...et-for-building-tests-without-runnin.patch |  7 +--
 ...shared-util.c-include-linux-limits.h.patch |  5 +-
 .../bluez5/{bluez5_5.72.bb => bluez5_5.77.bb} |  2 +-
 6 files changed, 30 insertions(+), 69 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.72.bb => bluez5_5.77.bb} (94%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index a1ffdeef8c..55aea1f3c7 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -18,6 +18,14 @@ PACKAGECONFIG ??= "obex-profiles \
     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
     a2dp-profiles \
     avrcp-profiles \
+    bap-profiles \
+    bass-profiles \
+    mcp-profiles \
+    ccp-profiles \
+    vcp-profiles \
+    micp-profiles \
+    csip-profiles \
+    asha-profiles \
     network-profiles \
     hid-profiles \
     hog-profiles \
@@ -39,6 +47,14 @@ PACKAGECONFIG[network-profiles] = "--enable-network,--disable-network"
 PACKAGECONFIG[hid-profiles] = "--enable-hid,--disable-hid"
 PACKAGECONFIG[hog-profiles] = "--enable-hog,--disable-hog"
 PACKAGECONFIG[health-profiles] = "--enable-health,--disable-health"
+PACKAGECONFIG[bap-profiles] = "--enable-bap,--disable-bap"
+PACKAGECONFIG[bass-profiles] = "--enable-bass,--disable-bass"
+PACKAGECONFIG[mcp-profiles] = "--enable-mcp,--disable-mcp"
+PACKAGECONFIG[ccp-profiles] = "--enable-ccp,--disable-ccp"
+PACKAGECONFIG[vcp-profiles] = "--enable-vcp,--disable-vcp"
+PACKAGECONFIG[micp-profiles] = "--enable-micp,--disable-micp"
+PACKAGECONFIG[csip-profiles] = "--enable-csip,--disable-csip"
+PACKAGECONFIG[asha-profiles] = "--enable-asha,--disable-asha"
 PACKAGECONFIG[sixaxis] = "--enable-sixaxis,--disable-sixaxis"
 PACKAGECONFIG[tools] = "--enable-tools,--disable-tools"
 PACKAGECONFIG[threads] = "--enable-threads,--disable-threads"
@@ -51,7 +67,6 @@ PACKAGECONFIG[manpages] = "--enable-manpages,--disable-manpages,python3-docutils
 SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://init \
            file://run-ptest \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
            file://0004-src-shared-util.c-include-linux-limits.h.patch \
@@ -99,6 +114,11 @@ do_install:append() {
 	# Patch python tools to use Python 3; they should be source compatible, but
 	# still refer to Python 2 in the shebang
 	sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${libdir}/bluez/test/*
+
+	# Fix the /etc/bluetooth directory permissions when systemd is disabled
+	if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'false', 'true', d)}; then
+		chmod 0755 ${D}${sysconfdir}/bluetooth
+	fi
 }
 
 PACKAGES =+ "${PN}-testtools ${PN}-obex ${PN}-noinst-tools"
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch
deleted file mode 100644
index 618ed734a9..0000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From f74eb97c9fb3c0ee2895742e773ac6a3c41c999c Mon Sep 17 00:00:00 2001
-From: Giovanni Campagna <gcampagna-cNUdlRotFMnNLxjTenLetw@public.gmane.org>
-Date: Sat, 12 Oct 2013 17:45:25 +0200
-Subject: [PATCH] Allow using obexd without systemd in the user session
-
-Not all sessions run systemd --user (actually, the majority
-doesn't), so the dbus daemon must be able to spawn obexd
-directly, and to do so it needs the full path of the daemon.
-
-Upstream-Status: Denied
-
-Not accepted by upstream maintainer for being a distro specific
-configuration. See thread:
-
-http://thread.gmane.org/gmane.linux.bluez.kernel/38725/focus=38843
-
-Signed-off-by: Javier Viguera <javier.viguera@digi.com>
-
----
- Makefile.obexd                                                | 4 ++--
- .../src/{org.bluez.obex.service => org.bluez.obex.service.in} | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
- rename obexd/src/{org.bluez.obex.service => org.bluez.obex.service.in} (76%)
-
-diff --git a/Makefile.obexd b/Makefile.obexd
-index de59d29..73004a3 100644
---- a/Makefile.obexd
-+++ b/Makefile.obexd
-@@ -1,12 +1,12 @@
- if SYSTEMD
- systemduserunitdir = $(SYSTEMD_USERUNITDIR)
- systemduserunit_DATA = obexd/src/obex.service
-+endif
- 
- dbussessionbusdir = $(DBUS_SESSIONBUSDIR)
- dbussessionbus_DATA = obexd/src/org.bluez.obex.service
--endif
- 
--EXTRA_DIST += obexd/src/obex.service.in obexd/src/org.bluez.obex.service
-+EXTRA_DIST += obexd/src/obex.service.in obexd/src/org.bluez.obex.service.in
- 
- if OBEX
- 
-diff --git a/obexd/src/org.bluez.obex.service b/obexd/src/org.bluez.obex.service.in
-similarity index 76%
-rename from obexd/src/org.bluez.obex.service
-rename to obexd/src/org.bluez.obex.service.in
-index a538088..9c815f2 100644
---- a/obexd/src/org.bluez.obex.service
-+++ b/obexd/src/org.bluez.obex.service.in
-@@ -1,4 +1,4 @@
- [D-BUS Service]
- Name=org.bluez.obex
--Exec=/bin/false
-+Exec=@libexecdir@/obexd
- SystemdService=dbus-org.bluez.obex.service
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
index b1e93dbe19..ae113a9a6d 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
@@ -1,4 +1,4 @@
-From fb583a57f9f4ab956a09e9bb96d89aa13553bf21 Mon Sep 17 00:00:00 2001
+From eeb62ab04b3789a27074236cd0bed7cc64759f4d Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Fri, 24 Aug 2018 12:04:03 +0800
 Subject: [PATCH] test-gatt: Fix hung issue
@@ -21,16 +21,15 @@ no action.
 Upstream-Status: Submitted [https://marc.info/?l=linux-bluetooth&m=153508881804635&w=2]
 
 Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
-
 ---
  unit/test-gatt.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/unit/test-gatt.c b/unit/test-gatt.c
-index 5e06d4e..4864d36 100644
+index 1613fbc..25dd614 100644
 --- a/unit/test-gatt.c
 +++ b/unit/test-gatt.c
-@@ -4546,7 +4546,7 @@ int main(int argc, char *argv[])
+@@ -4547,7 +4547,7 @@ int main(int argc, char *argv[])
  			test_server, service_db_1, NULL,
  			raw_pdu(0x03, 0x00, 0x02),
  			raw_pdu(0xbf, 0x00),
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
index 881494a354..37253b9725 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
@@ -1,20 +1,19 @@
-From 738e73b386352fd90f1f26cc1ee75427cf4dc23b Mon Sep 17 00:00:00 2001
+From c06fecbb009f4c42f01d86383d4571c96ba872f0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 1 Apr 2016 17:07:34 +0300
 Subject: [PATCH] tests: add a target for building tests without running them
 
 Upstream-Status: Inappropriate [oe specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  Makefile.am | 3 +++
  1 file changed, 3 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index e738eb3..dab17dd 100644
+index 0ae7211..c8bcaca 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -710,6 +710,9 @@ endif
+@@ -713,6 +713,9 @@ endif
  TESTS = $(unit_tests)
  AM_TESTS_ENVIRONMENT = MALLOC_CHECK_=3 MALLOC_PERTURB_=69
  
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch b/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
index 516d859069..567cf5db8c 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
@@ -1,4 +1,4 @@
-From b53df61b41088b68c127ac76cc71683ac3453b9d Mon Sep 17 00:00:00 2001
+From 705235d674f574bee08ea3138208938a086e1b53 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 12 Dec 2022 13:10:19 +0100
 Subject: [PATCH] src/shared/util.c: include linux/limits.h
@@ -8,13 +8,12 @@ systems such as those using musl.
 
 Upstream-Status: Submitted [to linux-bluetooth@vger.kernel.org,luiz.von.dentz@intel.com,frederic.danis@collabora.com]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
 ---
  src/shared/util.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/shared/util.c b/src/shared/util.c
-index c0c2c4a..036dc0d 100644
+index 6e7634a..45fcd6a 100644
 --- a/src/shared/util.c
 +++ b/src/shared/util.c
 @@ -23,6 +23,7 @@
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.72.bb b/meta/recipes-connectivity/bluez5/bluez5_5.77.bb
similarity index 94%
rename from meta/recipes-connectivity/bluez5/bluez5_5.72.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.77.bb
index 9fda960ea7..55264fd6b7 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.72.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.77.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "499d7fa345a996c1bb650f5c6749e1d929111fa6ece0be0e98687fee6124536e"
+SRC_URI[sha256sum] = "5d032fdc1d4a085813554f57591e2e1fb0ceb2b3616ee56f689bc00e1d150812"
 
 CVE_STATUS[CVE-2020-24490] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
 
-- 
2.34.1


