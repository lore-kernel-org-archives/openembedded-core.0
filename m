Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id E6C55782C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=m44QTvvR1IzDW8CT3DTyMQdfdjbmo9FER3jMhn8QnRg=; 
	b=EzFxbYUHFYSTuQu8c2g8+CTU4vQFvB5Im3ngsYtiuEw3H+OqMA5l2SjnnIdnVpXDT+VcudCI79pDQb2aUlo0njX52Z6Wdq+4BWEkl3xWFFty/TAAQkv/FWrNQtzwssG4UCHc8Tq0e+8KcRV998iVuvAxTADrgUYNbeFdCBi213gceZeAhEHjhEabs3JgEEf4LY567lTn/eLZS5EHYErn5uXpDM+wzsHCa4759EB7ZwGFvgE2X2w4/5aSYPk6tu4pheJTkgbTTFrz/AZ0VaU9cdE8D/9okYfLPrEJtvfDqlVaf/qLHlhFXtaaCKJLyxd/Vb37xOiEUiQqhoYlztzcQg==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dYBQN-0005N0-3I; Thu, 20 Jul 2017 16:23:27 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dYBQN-0003SY-1S; Thu, 20 Jul 2017 16:23:27 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:23:01 +0300
Message-Id: <1500556991-11471-14-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
References: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 13/23] libsamplerate0_0.1.9.bb: set CVE_PRODUCT to libsamplerate
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
X-List-Received-Date: Thu, 20 Jul 2017 13:23:27 -0000

It is used in NVD for CVE's like:

https://nvd.nist.gov/vuln/detail/CVE-2017-7697

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
index 5473bff..ae08189 100644
--- a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
+++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
@@ -14,6 +14,8 @@ SRC_URI = "http://www.mega-nerd.com/SRC/libsamplerate-${PV}.tar.gz \
 SRC_URI[md5sum] = "2b78ae9fe63b36b9fbb6267fad93f259"
 SRC_URI[sha256sum] = "0a7eb168e2f21353fb6d84da152e4512126f7dc48ccb0be80578c565413444c1"
 
+CVE_PRODUCT = "libsamplerate"
+
 UPSTREAM_CHECK_URI = "http://www.mega-nerd.com/SRC/download.html"
 
 S = "${WORKDIR}/libsamplerate-${PV}"
-- 
1.9.1


