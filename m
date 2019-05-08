Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0ED5F7DE7D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 20:01:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44znRg4Fr3z5k
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 22:01:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557345695;
	bh=KjhO555X/f4IQyGggBELyjS+sQzSNKWk90iiWg4plVQ=;
	h=From:To:Subject:Date:From;
	b=JIHA8lihoEIZ5DZGnFD8bY18YaLtPQ/Z9fqGlzm5KLI4GAWLXIBm0hbz7m5XoiTmK
	KiWmxHs7LVWMdy1EdJ1pipquuFwqD0jzB2py8bGMKjw6lBU9T4VHahyvXxCoYWVIdV
	60tERlOcL49dbCxRs0gIDpCk3d9thh4Zuh9+8us8YmKG1s9SWL2EaY7AGAIlSxpBpA
	lR4qIUn8EVNfo+v0VL6tLNZAFyjsAnhxJDrxpYnG22heNS9D3ayE/pa1xiwtG7Q8fV
	e9w58hnsZa4C27YBssoDg0StRhLgRGu0GH1JwURo4S/uYeskr3Y+Tb+41Sgqx9sOcp
	MDvRj+yRKJ/9SUhu10r0ZmlRQ/38Csh9SGG+WUgXWnCEPOckuX3rMHvI+kQuZdfDfm
	BqSKM+skmfJD3B5iwBNF/0ufAUVYgL4MP+mW8Z69luludrIiUZZVgFPnc1MdE2pup2
	37fas07CX5dshLb8FVK5/j76i28+FLlO/nYLvDSPrVSTMXc2ezffcE7TFi+55ZD6N9
	ksrDcPrcHOr1w8eITgKsQZERq+jDIx/ArCBJCKYqPdOW9KK19Dxj478sc5Wm21SqQz
	BgS6ntSfCiPlqmFt2uyx3Kv6Gj18FEBU8rzWfBZ6CA8frkQ1Ac5TUzhwUGj7cDM2sA
	2VHK1Rhc6CRikFc9Ze8E9tek=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 23:01:33 +0300
Message-Id: <20190508200134.28907-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2] sysstat: inherit upstream-version-is-even
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
X-List-Received-Date: Wed, 08 May 2019 20:01:35 -0000

Currently a development version is being used.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-extended/sysstat/sysstat.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 0bc7e14d36..9228fc29c2 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -10,12 +10,11 @@ SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/sysstat-${PV}.tar.xz \
           "
 
 UPSTREAM_CHECK_URI = "http://sebastien.godard.pagesperso-orange.fr/download.html"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 
 DEPENDS += "base-passwd"
 
 # autotools-brokensep as this package doesn't use automake
-inherit autotools-brokensep gettext systemd
+inherit autotools-brokensep gettext systemd upstream-version-is-even
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lm-sensors] = "--enable-sensors,--disable-sensors,lmsensors,lmsensors-libsensors"
-- 
2.17.1


