Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 38A4372505
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 22:12:08 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id h11so6495865wiw.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 14:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=a9Wfi/A6AP1uAysEKOAAYtsznw7Kk7ny4xRx+BJ1ePQ=;
	b=QV3QRo0yeFIKu3RXUe/1ENfgFfsY8gDOmGot821ZYFQPz6cJ2P2MAoujX1R3G3lCdv
	e0BZEMb7EwGX+Gf95UqwuiChaOYnJNbrz/Oe3LjsUD62qcrG28Slb1efvq0T/1Oq8+l7
	YwlDFezPbZ4A3PpnFeZaBLLfH+G3/MaqhBQKh/uzgvaDnsaXk3dkysbmhUZU1uqZyLZu
	2a/2yGNYDZcEX0rgWjwTaaYAKZ5DkgRWoMZbeHVUn7aHGluMfKKqjbuf+MsEaVbM0Tsj
	OHH3cTNuE7mEVOaouwtluKc9U6HPmk08jIwyJAU6bGZ7ME9v2V5vBHWzCeoOF7rRxyRQ
	DJ+A==
X-Received: by 10.180.80.163 with SMTP id s3mr24988793wix.59.1419199929212;
	Sun, 21 Dec 2014 14:12:09 -0800 (PST)
Received: from nuc.betafive.co.uk
	(cpc19-shep11-2-0-cust55.8-3.cable.virginm.net. [81.111.243.56])
	by mx.google.com with ESMTPSA id
	kn5sm21350509wjb.48.2014.12.21.14.12.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 Dec 2014 14:12:08 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: OE Core <openembedded-core@lists.openembedded.org>
Date: Sun, 21 Dec 2014 22:11:51 +0000
Message-Id: <1419199917-27913-3-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1419199917-27913-1-git-send-email-paul@paulbarker.me.uk>
References: <1419199917-27913-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH 2/8] opkg-arch-config: Renamed from opkg-config-base
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
X-List-Received-Date: Sun, 21 Dec 2014 22:12:11 -0000

The name 'opkg-arch-config' is much more descriptive.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/conf/layer.conf                                                   | 2 +-
 .../opkg/{opkg-config-base_1.0.bb => opkg-arch-config_1.0.bb}          | 3 ++-
 meta/recipes-devtools/opkg/opkg.inc                                    | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/opkg/{opkg-config-base_1.0.bb => opkg-arch-config_1.0.bb} (87%)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index de96548..4fd3a16 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -18,7 +18,7 @@ COREBASE = '${@os.path.normpath("${LAYERDIR}/../")}'
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   sysvinit-inittab \
   shadow-securetty \
-  opkg-config-base \
+  opkg-arch-config \
   netbase \
   init-ifupdown \
   connman-conf \
diff --git a/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb b/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
similarity index 87%
rename from meta/recipes-devtools/opkg/opkg-config-base_1.0.bb
rename to meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
index acbe129..f700865 100644
--- a/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb
+++ b/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
@@ -1,4 +1,4 @@
-SUMMARY = "Base configuration files for opkg"
+SUMMARY = "Architecture-dependent configuration for opkg"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -28,3 +28,4 @@ FILES_${PN} = "${sysconfdir}/opkg/ "
 
 CONFFILES_${PN} += "${sysconfdir}/opkg/arch.conf"
 
+RREPLACES_${PN} = "opkg-config-base"
diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index 56c54b6..991c114 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -38,7 +38,7 @@ EXTRA_OECONF = "\
   --with-opkglibdir=${OPKGLIBDIR} \
 "
 
-RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-config-base run-postinsts"
+RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-arch-config run-postinsts"
 RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN}_class-nativesdk = ""
 RREPLACES_${PN} = "opkg-nogpg"
-- 
1.9.1


