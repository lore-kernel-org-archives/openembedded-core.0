Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id AB3317D577
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 14:27:36 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id s7so9108689ljh.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2019 07:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=BY1R4bMow0/+cmygnMxu+xILFX+5aqg7DxtItsd3Vm0=;
	b=OVB1UTyemwleXKcdlR7otwz2fwQvj6MF0bX21F7sfX6xNKGHMdoI/k6eqwnbWQTFiY
	b+c0aHmYp/EnwqmOLVTaRACPBYO1TwRPjflRuN6LM+J4Sx2IUEWxP/603V5z5PgjqJs8
	wJHPNGYHt7K3hwDikAFKl/ybMZQVvGycS8p70SjmI/cZraSWTlosr4HmmPYS5agHJRPM
	kzqWsALEXcnk0L+qkB5oIzZCB9cpJojIWWjmx/F19V2vR/mVPABK8yrdj2EjcyTMDy9F
	u1/L4MMeSQr8+LprTfGeacRrMSK68/4HmN8sRrxn3UOBas6lcCJoR0iRiyfsw2vR11PV
	utnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BY1R4bMow0/+cmygnMxu+xILFX+5aqg7DxtItsd3Vm0=;
	b=Caw+G2AG9YTLMs/um/S3b5YURe1j5KvOYmeGlZHhSHQjC6YOGeQfi1+VROykKJUWD5
	yPIyDd+/QzG9HM83zmocuxhWYMmMg0i7He3X9MZ2dbFZM79Lz8cLMAW4tPv6B2Xpky1+
	5uR9W0hpcU0cOfKo+yzTRLw5SX3rJgumX5zIHaLDjq0JnmSqdJHkT1yUmqyldV3dllFR
	/u0MhzFR58fRi8BaKhQc8iFzYCiZjJNWb70C4HQnCrlXwjwXHa24KmSNTFD8b/F3vwY2
	d7MAT3v3CUomQ/YJwkaIZgXoeiW4aSx1Z4xACB5DyMBLeN8RfCT6iwddhGMz+w/XC3R5
	L3oA==
X-Gm-Message-State: APjAAAVTGIsah2wJr7PMtvFjwj82NnJtGSAtIc7HVNb+GnahBmChNDzV
	j+V6nm67xxyMGd76zAEpZfdP1AvpHQQ=
X-Google-Smtp-Source: APXvYqzauXijE8zCQx8xFDNs0JDDx70iSGqmWKzDea1U+v63qf562w7rFoTWinrZr47vU+KYL/IJdg==
X-Received: by 2002:a2e:98c6:: with SMTP id s6mr3916655ljj.161.1557239256605; 
	Tue, 07 May 2019 07:27:36 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	v11sm3422422lfb.68.2019.05.07.07.27.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 07:27:35 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2019 16:27:29 +0200
Message-Id: <20190507142729.8794-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ofono: update to 1.29
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
X-List-Received-Date: Tue, 07 May 2019 14:27:39 -0000

Deleted patch has been mainstremaed.

Changelog:

ver 1.29:
- Fix issue with QMI and SIM initialized notification.
- Add support for multiple PDP contexts and xmm7xxx modems.
- Add support for handling Dual SIM Single Active feature
- Add support for SIM PIN caching feature.

ver 1.28:
- Fix issue with SIM initialization and Gemalto modems.

ver 1.27:
- Add support for handling SIMCom based SIM800 modems.
- Add support for SIM lock state with xmm7xxx modems.
- Add support for coexistence feature with xmm7xxx modems.

ver 1.26:
- Fix issue with AT callback handler and GPRS.
- Fix issue with handling EUTRAN SMS only states.
- Fix issue with handling MBIM strings on big endian.
- Fix issue with missing char and SMS national language.
- Fix issue with unsolicited notifications of +CGAUTH/+CGDCONT.
- Add support for setting "none" authentication method.
- Add support for SMS and phonebook with xmm7xxx modems.
- Add support for voice features and Gemalto modems.
- Add support for Bengali and Gujrati SMS alphabets.
- Add support for 8 additional languages for GSM 7 bit
- Add support for using internal Embedded Linux library.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-connectivity/ofono/ofono.inc     |  7 ++---
 .../ofono/ofono/use-python3.patch             | 27 -------------------
 meta/recipes-connectivity/ofono/ofono_1.25.bb |  9 -------
 meta/recipes-connectivity/ofono/ofono_1.29.bb |  8 ++++++
 4 files changed, 12 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono/use-python3.patch
 delete mode 100644 meta/recipes-connectivity/ofono/ofono_1.25.bb
 create mode 100644 meta/recipes-connectivity/ofono/ofono_1.29.bb

diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
index 0472414b19..37772121f8 100644
--- a/meta/recipes-connectivity/ofono/ofono.inc
+++ b/meta/recipes-connectivity/ofono/ofono.inc
@@ -1,13 +1,14 @@
 HOMEPAGE = "http://www.ofono.org"
-SUMMARY  = "open source telephony"
-DESCRIPTION = "oFono is a stack for mobile telephony devices on Linux. oFono supports speaking to telephony devices through specific drivers, or with generic AT commands."
+SUMMARY  = "Open Source Telephony"
+DESCRIPTION = "oFono is a stack for mobile telephony devices on Linux. \
+oFono supports speaking to telephony devices through specific drivers, or with generic AT commands."
 LICENSE  = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://src/ofono.h;beginline=1;endline=20;md5=3ce17d5978ef3445def265b98899c2ee"
 
 inherit autotools pkgconfig update-rc.d systemd bluetooth gobject-introspection-data
 
-DEPENDS  = "dbus glib-2.0 udev mobile-broadband-provider-info"
+DEPENDS  = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
 
 INITSCRIPT_NAME = "ofono"
 INITSCRIPT_PARAMS = "defaults 22"
diff --git a/meta/recipes-connectivity/ofono/ofono/use-python3.patch b/meta/recipes-connectivity/ofono/ofono/use-python3.patch
deleted file mode 100644
index 7b84075257..0000000000
--- a/meta/recipes-connectivity/ofono/ofono/use-python3.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-set-ddr should use Python3 like all the other tests.
-
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 17b69cd1da4c5c5f732acb38ca1602446c567ee7 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Mon, 29 Jan 2018 11:31:25 +0000
-Subject: [PATCH] test/setddr: use Python 3
-
-All the other tests use Python 3, so this should to.
----
- test/set-ddr | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/test/set-ddr b/test/set-ddr
-index 5d061b95..33631f31 100755
---- a/test/set-ddr
-+++ b/test/set-ddr
-@@ -1,4 +1,4 @@
--#!/usr/bin/python
-+#!/usr/bin/python3
- 
- import sys
- import dbus
--- 
-2.11.0
diff --git a/meta/recipes-connectivity/ofono/ofono_1.25.bb b/meta/recipes-connectivity/ofono/ofono_1.25.bb
deleted file mode 100644
index 3688b9d2fc..0000000000
--- a/meta/recipes-connectivity/ofono/ofono_1.25.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require ofono.inc
-
-SRC_URI  = "\
-  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
-  file://ofono \
-  file://use-python3.patch \
-"
-SRC_URI[md5sum] = "31450cabdd8dbbf3f808ea2f2f066863"
-SRC_URI[sha256sum] = "eb011fcd3080e93f3a56f96be60350b6595a8b5f36b61646312ba41b0bcb0d75"
diff --git a/meta/recipes-connectivity/ofono/ofono_1.29.bb b/meta/recipes-connectivity/ofono/ofono_1.29.bb
new file mode 100644
index 0000000000..db35e12e35
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono_1.29.bb
@@ -0,0 +1,8 @@
+require ofono.inc
+
+SRC_URI  = "\
+    ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
+    file://ofono \
+"
+SRC_URI[md5sum] = "4fa0372630ff03f223452e4d05efa8f8"
+SRC_URI[sha256sum] = "67f0f8e5740dea5b46309e40667d1e560be39c90ef08dd01ff9e9ce8e61f0679"
-- 
2.17.1


