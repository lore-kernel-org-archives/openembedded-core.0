Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5CEBC7D07D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Mar 2019 22:49:18 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id j89so4939928ljb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Mar 2019 15:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ujRdSWrmrew8W/EXXOZTiOn9DU3sg9ZV/bHoRvLscJ8=;
	b=0Z5fDnGzJw6NJvHNYw/ZlE95QySPhMHsGdduI0snO0KXv33LPYEZzGNwgJHYKcvgoc
	KgN6EAmxtnVOCNwhtaXn+u6mIITI0iAT3kZsJhNFACvVsygTYGE1GUlBFK7HFAaNaBL0
	xwNC2rpppG1A3hp1LsrrrwnoG9HjEk7PpsJSvh3czM1CEFbiNNRjKk5uH653gc/QSak6
	TyxYD2Yce7dtffjbY+c8vcPKjspJdeGD6ZABDVO5Q8/74I+zG/h51izsYG/j+wYdwJBi
	tVr5700sUv9XYinKn4C/baiTpOEHqN+vRFTIj2COMbosVL+4lSmSYmLGbq99NLO9asHy
	AmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ujRdSWrmrew8W/EXXOZTiOn9DU3sg9ZV/bHoRvLscJ8=;
	b=mjUEfI6Em5DICIlycQDnvMChQMuw7D+H/MofnzRqGssRQQWqd3gn8LRKUFAW5lfRys
	RUlF8ozRiWrJvD9WcSmMuR1enpGOFEQuQsta/k1duRZk/3A1Ep50hrc+PbKMsKPH350o
	8OiMDRa19MOJ4UOs10Iq+IGk7qMOik41KAOuymu7nyl3QN+ks4XntU8SyvLJlhaLlIpn
	+pbpkkcYWp/g9L9aGLe5QdPrDrmJ62+BOmI4O2cj5IVQAHpM76+4k2TQaEl8upl83Ex4
	d5n9WEMBfGA9cf0zjV8U7c5ASqhxxZCV76OnkAymH/GusnZ3YQRcGOmbklpQFQI291Mq
	hQkg==
X-Gm-Message-State: APjAAAWmMyGVip4VZZ4u54XGV3pwiS3w0VkM5S+OOrhtCmldE9K4cbXt
	xS15nAyWNn+uI6NsZXKyoT+V5ZEJLRw=
X-Google-Smtp-Source: APXvYqyXZK8f07oKwvmn96TTYnt68LzYIUgdUK7ECbWL6g7iH1sivoRXvGesDQCts9Qx64Ziaxaz4A==
X-Received: by 2002:a2e:1311:: with SMTP id 17mr9383557ljt.75.1553986158650;
	Sat, 30 Mar 2019 15:49:18 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id q29sm1140248ljc.8.2019.03.30.15.49.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 30 Mar 2019 15:49:17 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 30 Mar 2019 23:49:08 +0100
Message-Id: <20190330224908.2108-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ofono: update to 1.28
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
X-List-Received-Date: Sat, 30 Mar 2019 22:49:20 -0000

Deleted patch has been mainstremaed.

Changelog:
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
 meta/recipes-connectivity/ofono/ofono_1.28.bb |  8 ++++++
 4 files changed, 12 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono/use-python3.patch
 delete mode 100644 meta/recipes-connectivity/ofono/ofono_1.25.bb
 create mode 100644 meta/recipes-connectivity/ofono/ofono_1.28.bb

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
diff --git a/meta/recipes-connectivity/ofono/ofono_1.28.bb b/meta/recipes-connectivity/ofono/ofono_1.28.bb
new file mode 100644
index 0000000000..130a902322
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono_1.28.bb
@@ -0,0 +1,8 @@
+require ofono.inc
+
+SRC_URI  = "\
+    ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
+    file://ofono \
+"
+SRC_URI[md5sum] = "3a5406565b552b16602610619b034967"
+SRC_URI[sha256sum] = "93bb2cedef54f897dd5200e22b072a6e38b5d9b44be57eebbbe8d513f0beb0e4"
-- 
2.17.1


