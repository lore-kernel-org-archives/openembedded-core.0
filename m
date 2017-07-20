Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id 01DD678284
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=nNuC6+AyrhFKZ9EfoQYgj/bv6ZQTfzbO3FIO5496A3g=; 
	b=pOLhDdrN6Q+HUH0TAKiNG6NghAjz1ePRSMGk0lIDvhz2w+x5XP0hyaWdaJwit1LMtg1gZAvi3JHwzyCshAb5pyG81ich6JZSbOpSJMnm1vTwIaFNMvseQ4zoT0+PdHEGY1qY9vBx+2C9u/wkpQrr4nBzJ535n6aD/PAHjctxU2tvNr7VpL9tSfzg6odTr4iclk7RQjrOMnesycvqdfdnynC+R3kaZPlv4AFrpaq4bMQgM7uHWYSGLZ45+1GTsOAAFnRt0mhK4XNDC/o/k9wKj5J7OgR11bg5GdI+7XnGq6GNmhrCrixQaArTEf0DvZoLQwygPGHEi4T+FSl6caUS1A==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dYBQN-0005NA-5X; Thu, 20 Jul 2017 16:23:27 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dYBQN-0003T3-3J; Thu, 20 Jul 2017 16:23:27 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:23:03 +0300
Message-Id: <1500556991-11471-16-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
References: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 15/23] nspr_4.14.bb: set CVE_PRODUCT to netscape_portable_runtime
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
X-List-Received-Date: Thu, 20 Jul 2017 13:23:28 -0000

This is used in NVD database entries like CVE:

https://nvd.nist.gov/vuln/detail/CVE-2016-1951

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-support/nspr/nspr_4.14.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/nspr/nspr_4.14.bb b/meta/recipes-support/nspr/nspr_4.14.bb
index 6b47820..b0892a1 100644
--- a/meta/recipes-support/nspr/nspr_4.14.bb
+++ b/meta/recipes-support/nspr/nspr_4.14.bb
@@ -25,6 +25,8 @@ UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
 SRC_URI[md5sum] = "743f6b7888a614da9927400874054d8c"
 SRC_URI[sha256sum] = "64fc18826257403a9132240aa3c45193d577a84b08e96f7e7770a97c074d17d5"
 
+CVE_PRODUCT = "netscape_portable_runtime"
+
 S = "${WORKDIR}/nspr-${PV}/nspr"
 
 RDEPENDS_${PN}-dev += "perl"
-- 
1.9.1


