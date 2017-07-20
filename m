Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id E274E782EB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=mHjHwNtFh9l4hWbjfg9Yqfe7E1lP/psQ6NI+sAu07oo=; 
	b=wB++ebHVzA0rmUYvbyrx4EIGNXi+zOcMU2RQy6RNj9obnkxSZq3XJIeV+wD8qUhHuGbJc8TD3eKha1lrG9v+fezIfrKk7aNTv9T72lZ9rkL2L6yKiqDIlW5afc9AfleNogCTiF8iICustZRV67s9Q9gFG6Dr9mqfmTiYc7XJ4pF2GKSZafN35I+KeW2BkzqngoG07RJLFsYLBIfsAfH3fYpAeeuJC5pN8FAqYfYSNyTn4k6UpR7uYYgF7BJazOsCD8OM6fgKFul72t3PgxDl5XJGE4n37UhN+5pWBe+3gmPN0IbwBcLQ5VE6vCcKaslQ/22GPTnrLyraJSOnLL/z/g==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dYBQN-0005Mv-2H; Thu, 20 Jul 2017 16:23:27 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dYBQN-0003SS-07; Thu, 20 Jul 2017 16:23:27 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:23:00 +0300
Message-Id: <1500556991-11471-13-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
References: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 12/23] libpcre2_10.23.bb: set CVE_PRODUCT to pcre2
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

It is used in NVD as product name for CVE's like:

https://nvd.nist.gov/vuln/detail/CVE-2017-8786

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-support/libpcre/libpcre2_10.23.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.23.bb b/meta/recipes-support/libpcre/libpcre2_10.23.bb
index 17d397e..794d973 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.23.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.23.bb
@@ -17,6 +17,8 @@ SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre2-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "b2cd00ca7e24049040099b0a46bb3649"
 SRC_URI[sha256sum] = "dfc79b918771f02d33968bd34a749ad7487fa1014aeb787fad29dd392b78c56e"
 
+CVE_PRODUCT = "pcre2"
+
 S = "${WORKDIR}/pcre2-${PV}"
 
 PROVIDES += "pcre2"
-- 
1.9.1


