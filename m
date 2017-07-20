Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id E045F782E7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=ZnRXOGiBAjUGeGyKh6vtz/heHXumnNGpfz7eSb8qz4I=; 
	b=c6mX6EjU+ISN/MsmQEWuIJrdXW+/22/X0JaB5TXGG3E3BJVRAG7bMY0ZqKPlcWNjnHqhbfvVHRMgzZivoMt4boB479hyqzsj07lVnm9lL4e0q9HIcehHwKD+V8Klj3Vf++Mi2HqrNiNKaOIBD6k+tWe+3xr+R2mxhKMZchdtZSA+jMmNhpqNiC4B1Q4642b/zskM9UjnnLTJoB93lXbZry4vxAblP7vLcahQ6wKJmp4thxoZoKnkMJGevQgrrEtGEuGYMmwp2uFGvO9vkXP8HxMU8Whs6ILlt85SSNQvdzKqQc0msAFAy9hUaAcX5joPeUG2px0W1q7i+BgXOnArSQ==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dYBQN-0005Mk-03; Thu, 20 Jul 2017 16:23:27 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dYBQM-0003S1-UQ; Thu, 20 Jul 2017 16:23:26 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:22:58 +0300
Message-Id: <1500556991-11471-11-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
References: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 10/23] icu.inc: set CVE_PRODUCT to international_components_for_unicode
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

NVD uses it for CVE's like:

https://nvd.nist.gov/vuln/detail/CVE-2014-8146

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-support/icu/icu.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
index 5286274..a1ef9ec 100644
--- a/meta/recipes-support/icu/icu.inc
+++ b/meta/recipes-support/icu/icu.inc
@@ -9,6 +9,8 @@ LICENSE = "ICU"
 DEPENDS = "icu-native"
 DEPENDS_class-native = ""
 
+CVE_PRODUCT = "international_components_for_unicode"
+
 S = "${WORKDIR}/icu/source"
 SPDX_S = "${WORKDIR}/icu"
 STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
-- 
1.9.1


