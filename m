Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id 3483A65CB6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=90bkddzT9Qwpl4O4eBgXS7GDY5a+XQ28rk7r8/19yRE=; 
	b=cJJwIG/giMcSX1CNm3vfof6BQTA/Pz0khWVMWRcjgHGTL6W/dBLpMGmS5n7k6fOLEMd9losNdGGbYEwwcBzFSuayuTdepYYQnWji/+0s1VOJXy6BNCHNHl/Es3WuueHO1AYk00mXV2IbAma85jEMVezpM7gvl/89f5ZQstYNHV0+zkyvyPMg4LvlzIpQzvY5KyF/6zWGrAPb38kHW+y0uIQ6FD8d+6wYcrQ5KTax1/nNIhxgc0YgNAt9Rv2KMYBUPq6o8w8105kRjs448R3TPCtnckSWMRo1b8JFWyvgqmjuErxM5GxoFjESBjoG781v1T2wPRRNPX33+u2Teeu2Fw==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dYBQN-0005Nd-9O; Thu, 20 Jul 2017 16:23:27 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dYBQN-0003U4-7s; Thu, 20 Jul 2017 16:23:27 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:23:08 +0300
Message-Id: <1500556991-11471-21-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
References: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 20/23] wpa-supplicant_2.6.bb: set CVE_PRODUCT to wpa_supplicant
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
X-List-Received-Date: Thu, 20 Jul 2017 13:23:29 -0000

It is used in NVD database CVE's like:

https://nvd.nist.gov/vuln/detail/CVE-2015-1863

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb
index 146bccf..5215b00 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb
@@ -28,6 +28,8 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
 SRC_URI[md5sum] = "091569eb4440b7d7f2b4276dbfc03c3c"
 SRC_URI[sha256sum] = "b4936d34c4e6cdd44954beba74296d964bc2c9668ecaa5255e499636fe2b1450"
 
+CVE_PRODUCT = "wpa_supplicant"
+
 S = "${WORKDIR}/wpa_supplicant-${PV}"
 
 PACKAGES_prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
-- 
1.9.1


