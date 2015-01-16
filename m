Return-Path: <paul.betafive@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1E59272332
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 22:15:42 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id k14so22867679wgh.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 14:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qL0MDV4ZXTjzu9W/4lOAIcQwBNHZSmOlABBbEQ/AS7o=;
	b=Yhsps+6l84hVGIk05ZHSBlrzJRuQr9IvjLs4Edg/zAKAb/WOhJyifrBUcmyEbtHmvW
	+k2Oo4o6bonkQ8xSNtI0KNEBZaK13zWLfkwgjlHvILjSE1NHDj/WgahG5gw87qvpQCFK
	4n5imRynqejTiF84FgH0D9+F/Xostj//F4+66dxy2xoB3LezBuUzLoOc2QqjPrFzkArH
	+90Dca9AtECCNdqmOGFvkKqXnCtQ2nnnvSMvGN84z6UCtNkyDk7euGwGxqlWk8epn8FR
	hWIVf29hySPr0K90xRpXLJ993tAHZv/Lo5rSqjXlF63+nlNtqG47MGOaCa0jy5g7YbUk
	TSLQ==
X-Received: by 10.181.13.136 with SMTP id ey8mr10562479wid.50.1421446542709;
	Fri, 16 Jan 2015 14:15:42 -0800 (PST)
Received: from nuc.betafive.co.uk
	(cpc19-shep11-2-0-cust55.8-3.cable.virginm.net. [81.111.243.56])
	by mx.google.com with ESMTPSA id x6sm7664547wjf.24.2015.01.16.14.15.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Jan 2015 14:15:41 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: OE Core <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Jan 2015 22:15:23 +0000
Message-Id: <1421446529-24888-2-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1421446529-24888-1-git-send-email-paul@paulbarker.me.uk>
References: <1421446529-24888-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH V2 1/7] opkg-arch-config: Renamed from opkg-config-base
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
X-List-Received-Date: Fri, 16 Jan 2015 22:15:46 -0000

The name 'opkg-arch-config' is much more descriptive.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/conf/layer.conf                                                 | 2 +-
 .../opkg/{opkg-config-base_1.0.bb => opkg-arch-config_1.0.bb}        | 5 ++++-
 meta/recipes-devtools/opkg/opkg.inc                                  | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/opkg/{opkg-config-base_1.0.bb => opkg-arch-config_1.0.bb} (79%)

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
similarity index 79%
rename from meta/recipes-devtools/opkg/opkg-config-base_1.0.bb
rename to meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
index acbe129..4540de2 100644
--- a/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb
+++ b/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
@@ -1,4 +1,4 @@
-SUMMARY = "Base configuration files for opkg"
+SUMMARY = "Architecture-dependent configuration for opkg"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -28,3 +28,6 @@ FILES_${PN} = "${sysconfdir}/opkg/ "
 
 CONFFILES_${PN} += "${sysconfdir}/opkg/arch.conf"
 
+RREPLACES_${PN} = "opkg-config-base"
+RCONFLICTS_${PN} = "opkg-config-base"
+RPROVIDES_${PN} = "opkg-config-base"
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


