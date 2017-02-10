Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 591C377272
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 03:23:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1A3NKlU007861
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Feb 2017 19:23:21 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Feb 2017 19:23:20 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Feb 2017 19:23:09 -0800
Message-ID: <c1e81f5ea160100b54464c563d38996e255e0be3.1486696950.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1486696950.git.liezhi.yang@windriver.com>
References: <cover.1486696950.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 04/10] hdparm: 9.50 -> 9.51
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
X-List-Received-Date: Fri, 10 Feb 2017 03:23:20 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/hdparm/{hdparm_9.50.bb => hdparm_9.51.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/hdparm/{hdparm_9.50.bb => hdparm_9.51.bb} (89%)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.50.bb b/meta/recipes-extended/hdparm/hdparm_9.51.bb
similarity index 89%
rename from meta/recipes-extended/hdparm/hdparm_9.50.bb
rename to meta/recipes-extended/hdparm/hdparm_9.51.bb
index f89c30e4dda..fa009278b6b 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.50.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.51.bb
@@ -22,8 +22,8 @@ RDEPENDS_wiper = "bash gawk stat"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "d380062ad6c4b40076736efbb640f1f5"
-SRC_URI[sha256sum] = "0892b44bd817c251264a24f6ecbbb010958033e0395d2030f25f1c5608ac780e"
+SRC_URI[md5sum] = "8fe0a71db02f7ffc602d14a69f766cff"
+SRC_URI[sha256sum] = "1afad8891ecbe644c283f7d725157660ebf8bd5b4d9d67232afd45f83d2d5d91"
 
 EXTRA_OEMAKE = 'STRIP="echo" LDFLAGS="${LDFLAGS}"'
 
-- 
2.11.0.rc2.dirty


