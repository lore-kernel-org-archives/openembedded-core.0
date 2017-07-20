Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id 0C4EC6E688
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=W18tnf4XcBe7iMX+lXQNSo3BnP1aUoarCS+Srz4CxUw=; 
	b=uugv9o7rRy69CwkATjhjZEcdSSnXGGe0KO8OUK6FRS6bNMNap2uFLMMexrqj7lkSv4SzamSJQNh1FG5TG4BAkSVSvoz2oIQb4dE18PcrWhiVnEDEFnZ/k/klOmO3eZjkfsZLXzobTZdxN3ExZGFnY6e1bArg1JXZ/ShSEwXR+VjmgIrG+38pp1IjA302zcqohnMF99gcj607za0CXDMqO3EzYVeow23Ff1Faxddx1DDiP/onIzSCkFSCR84I+vatpTNo/+PmItHQ6efha/Rw+XgUJ8lDToymsY8PcJWNWg1Kqw0bClWDookOBKoC3QQyKRO+UyuGVDhdxPvEpkplpQ==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dYBQN-0005NF-6T; Thu, 20 Jul 2017 16:23:27 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dYBQN-0003TE-4Z; Thu, 20 Jul 2017 16:23:27 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:23:04 +0300
Message-Id: <1500556991-11471-17-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
References: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 16/23] python.inc: set CVE_PRODUCT to python
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

All python versions are just python in NVD like this CVE
for python 3.4.4:

https://nvd.nist.gov/vuln/detail/CVE-2016-5699

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-devtools/python/python.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index b4bce24..b40f551 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -16,6 +16,8 @@ SRC_URI[sha256sum] = "35d543986882f78261f97787fd3e06274bfa6df29fac9b4a94f73930ff
 # also, exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>2(\.\d+)+).tar"
 
+CVE_PRODUCT = "python"
+
 PYTHON_MAJMIN = "2.7"
 
 inherit autotools pkgconfig
-- 
1.9.1


