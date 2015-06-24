Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0609975A2C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 08:55:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5O8tSTJ016058
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 01:55:28 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 24 Jun 2015 01:55:28 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Jun 2015 01:55:22 -0700
Message-ID: <ceef251e263766021ec5dc414c28e1ca170d2797.1435135356.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1435135356.git.liezhi.yang@windriver.com>
References: <cover.1435135356.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] hdparm: 9.45 -> 9.48
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
X-List-Received-Date: Wed, 24 Jun 2015 08:55:29 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../hdparm/{hdparm_9.45.bb => hdparm_9.48.bb}      |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/hdparm/{hdparm_9.45.bb => hdparm_9.48.bb} (84%)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.45.bb b/meta/recipes-extended/hdparm/hdparm_9.48.bb
similarity index 84%
rename from meta/recipes-extended/hdparm/hdparm_9.45.bb
rename to meta/recipes-extended/hdparm/hdparm_9.48.bb
index d11412d..8267fd9 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.45.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.48.bb
@@ -16,10 +16,10 @@ FILES_wiper = "${bindir}/wiper.sh"
 
 RDEPENDS_wiper = "bash gawk stat"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/hdparm-${PV}.tar.gz "
+SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz "
 
-SRC_URI[md5sum] = "1c75d0751a44928b6c4bc81fb16d7fe8"
-SRC_URI[sha256sum] = "23b01caa56a995cf0897877b6aff98ea622a5df255bc2894b1a7693387f38669"
+SRC_URI[md5sum] = "213efdbe7471fad3408198918e164354"
+SRC_URI[sha256sum] = "ce97b4a71cb04146f54cf6f69787e7f97ddfda9836dc803b459d3b3df3a4fbee"
 
 EXTRA_OEMAKE += 'STRIP="echo"'
 
-- 
1.7.9.5


