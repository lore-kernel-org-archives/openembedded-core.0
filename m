Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0605E60FF1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 10:02:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 025A2xYM003166
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Mar 2020 02:02:59 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.487.0; Thu, 5 Mar 2020 02:02:59 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Mar 2020 18:02:57 +0800
Message-ID: <1583402577-350047-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] netbase: Upgrade to 6.1
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
X-List-Received-Date: Thu, 05 Mar 2020 10:02:59 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-core/netbase/{netbase_6.0.bb => netbase_6.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/netbase/{netbase_6.0.bb => netbase_6.1.bb} (82%)

diff --git a/meta/recipes-core/netbase/netbase_6.0.bb b/meta/recipes-core/netbase/netbase_6.1.bb
similarity index 82%
rename from meta/recipes-core/netbase/netbase_6.0.bb
rename to meta/recipes-core/netbase/netbase_6.1.bb
index 2fb5762..bc0049c 100644
--- a/meta/recipes-core/netbase/netbase_6.0.bb
+++ b/meta/recipes-core/netbase/netbase_6.1.bb
@@ -8,8 +8,8 @@ PE = "1"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz"
 
-SRC_URI[md5sum] = "3417b0487161f1a2b070a3308cd7f957"
-SRC_URI[sha256sum] = "692baeb7b76eba5580c7edbc97ce1784a06b5aa4b367c5ed0b39e0ce7a97d594"
+SRC_URI[md5sum] = "e5871a3a5c8390557b8033cf19316a55"
+SRC_URI[sha256sum] = "084d743bd84d4d9380bac4c71c51e57406dce44f5a69289bb823c903e9b035d8"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netbase/"
 do_install () {
-- 
2.7.4


