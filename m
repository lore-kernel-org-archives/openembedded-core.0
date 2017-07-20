Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id 16B0271AD5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=3BCLpsntK8TzMG3fb+FkKHUXn7twOAHQ0c2UH5GzOJc=; 
	b=PbBdxYkMvbptVwDGDIIU8R/DGyQVZ5586C5D6lZggl8Ol9KnisW3+aQL5lfCWZDa740eqYWdjCOz7atk5qF3o0TdSDz0HSOtez3lzYYkOceSslE2wFUDkn0p0BXiXpFKlrM6smjYPuZlYRHacoz5F5j6JS6cHqGv1oTTj62+v9hEFFiwAk/gcOoOBumhNPPPZs7EaNW5AB3c4mDrezSba//DVJcrF5T63cRSZMoFgrWvUz7MDu6de9jiyBblSuFT0shQOi2X1cvNVQmWwZBqlDGgKNG/z+kTo53fwMKvE3QwU/cUd/rqZBhhOmOEifqw1rA5TxRkqA8OXMLb85ZF9g==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dYBQN-0005NM-7r; Thu, 20 Jul 2017 16:23:27 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dYBQN-0003Tj-6b; Thu, 20 Jul 2017 16:23:27 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:23:06 +0300
Message-Id: <1500556991-11471-19-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
References: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 18/23] quota_4.03.bb: set CVE_PRODUCT to linux_diskquota
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

It is used in NVD for CVE's like:

https://nvd.nist.gov/vuln/detail/CVE-2012-3417

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-extended/quota/quota_4.03.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/quota/quota_4.03.bb b/meta/recipes-extended/quota/quota_4.03.bb
index 22aab41..28b3854 100644
--- a/meta/recipes-extended/quota/quota_4.03.bb
+++ b/meta/recipes-extended/quota/quota_4.03.bb
@@ -22,6 +22,8 @@ SRC_URI_append_libc-musl = " file://replace_getrpcbynumber_r.patch"
 SRC_URI[md5sum] = "6b09f9c93515c25a528be5754cdfb6f5"
 SRC_URI[sha256sum] = "9c6c4d9ae7bf30506dd2aa3d8056c4ff2f8d087930d7c721616f5c093bdc674b"
 
+CVE_PRODUCT = "linux_diskquota"
+
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/linuxquota/files/quota-tools/"
 UPSTREAM_CHECK_REGEX = "/quota-tools/(?P<pver>(\d+[\.\-_]*)+)/"
 
-- 
1.9.1


