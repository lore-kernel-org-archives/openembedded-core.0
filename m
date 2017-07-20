Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id AD45478216
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=EivMqltK0QlQkdQTed2CtqiuTxG0xF9NCtv4a3DhhjI=; 
	b=tGapuCaI2SmgZjgxkj6gQboCYWWWRZwF/0QZAiDz7HsrX9hRWFEoTiwr7sty60eNB/z6cQ+2PuXikt2uWAGWE+BZ/GHBAwa5nI89tsTerI8YXoAz/GsmWBzTq6FqI0C6tD564Dj6W9QC+Pfoqp1UD/tHWL+8rUd1ANvjz0yBqM5T+/Yey28mD68MInN/fCfCN/mVC3PkLZ1lXCbyo/7A3gaQysU9SZo5GXXoRGJ78IEUkt/4HDqsGJ0c9R793yPx07wckvuYMUiJiK3OmmOp0ojQhSS2CM2x1zqmQ3bx0ok1uXsScirM7OiMMGYGOeThWFg6JljqR3do8sK630cyjg==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dYBQM-0005Lr-Q9; Thu, 20 Jul 2017 16:23:26 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dYBQM-0003QU-Of; Thu, 20 Jul 2017 16:23:26 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:22:51 +0300
Message-Id: <1500556991-11471-4-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
References: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 03/23] acpid.inc: set CVE_PRODUCT to acpid2
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

It is used in NVD database for CVE's like:

https://nvd.nist.gov/vuln/detail/CVE-2011-4578

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-bsp/acpid/acpid.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/acpid/acpid.inc b/meta/recipes-bsp/acpid/acpid.inc
index 12ec19b..766ed4f 100644
--- a/meta/recipes-bsp/acpid/acpid.inc
+++ b/meta/recipes-bsp/acpid/acpid.inc
@@ -9,6 +9,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/acpid2/acpid-${PV}.tar.xz \
            file://acpid.service \
           "
 
+CVE_PRODUCT = "acpid2"
+
 inherit autotools update-rc.d systemd
 
 INITSCRIPT_NAME = "acpid"
-- 
1.9.1


