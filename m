Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id AE8D0782B0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=tCSW6WA3YqxCtf9wDMxvJcrwIMlc9b6Ev3t02INMMS4=; 
	b=KshOg9mvVnas9X50D/M7FE+A1im0Ie7DmDZ2dwxiBYoCYKL2N/GMzBCuIVooLIwe5wejbZ+DDOlhMGUttgNsUQf20wnFVkr3hMU1LBl7IS9sivEAG2iaiKM4ipfzb0hE49WEhd4Bsd3WRt7M8TJ03tSJ8lLuhrepecYbtF1U68AzGwHEWhR2IZ+KFLUb37gyvzKXaF7CIT7SGsYrh/0c5+ixrNmR+GDV8vSV6l/hxjM88WnpLSN56WTgJkamvGgevYyjIihmtUX7dJhjYWPZpvEDe57ds97VE+LQmDvYJLtrOligiDtXRARpgCmvbNZ3YUzXvKQahGoRa/OybZCclw==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dYBQM-0005M2-R1; Thu, 20 Jul 2017 16:23:26 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dYBQM-0003Qe-PR; Thu, 20 Jul 2017 16:23:26 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:22:52 +0300
Message-Id: <1500556991-11471-5-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
References: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 04/23] bluez5.inc: set CVE_PRODUCT to bluez
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
X-List-Received-Date: Thu, 20 Jul 2017 13:23:26 -0000

bluez is the product name in NVD database for CVE's like:

https://nvd.nist.gov/vuln/detail/CVE-2016-7837

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index bf1b1ca..527e403 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -53,6 +53,8 @@ SRC_URI = "\
 "
 S = "${WORKDIR}/bluez-${PV}"
 
+CVE_PRODUCT = "bluez"
+
 inherit autotools pkgconfig systemd update-rc.d distro_features_check ptest
 
 EXTRA_OECONF = "\
-- 
1.9.1


