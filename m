Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id 3496E782F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=UY1aiwwl6IddU4olbqdWQsTfRC7Z4BPzODsvvGlKFqk=; 
	b=O1zR1fEY67Vs5hvgsfKMeeCLioV5tYNebG3Icoqoz6HVZ+VPrMK2JwtgnoSQvQaLEi+gmVPyLPkCoi4mn0VbnesOkK+bHzbbu9kTHpvQBwdrul/Nyy9iY/javBT02p8Q+grGCD4LugN7l9LIJ6hcg3UcRp6/oepzWNXLknB8uynWmmehCD9KPqHSARGygDVJDOUqmSCj/BR22t7QuUuyJxw541xLQhcG26Xg6d987Th8pO3rWgqxVdWa1cZtHA80lx7TciDD+zAjD9yWHAe1Q1BATTvPjAa6vX/yQglZ6IoxTLiCoRd93Ll98yNhZXQ9UPoQCvSD86entt+kkFkPCg==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dYBQN-0005Ng-9k; Thu, 20 Jul 2017 16:23:27 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dYBQN-0003UA-8P; Thu, 20 Jul 2017 16:23:27 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:23:09 +0300
Message-Id: <1500556991-11471-22-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
References: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 21/23] cve-check.bbclass: use weak assignment for default CVE_PRODUCT
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

This way also bbclasses can override it. For example kernel.bbclass
could set CVE_PRODUCT to linux_kernel for all users of the class
which compile Linux kernels.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 6f5b0f5..8dde4a2 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -22,7 +22,7 @@
 
 # The product name that the CVE database uses.  Defaults to BPN, but may need to
 # be overriden per recipe (for example tiff.bb sets CVE_PRODUCT=libtiff).
-CVE_PRODUCT ?= "${BPN}"
+CVE_PRODUCT ??= "${BPN}"
 
 CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
 CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvd.db"
-- 
1.9.1


