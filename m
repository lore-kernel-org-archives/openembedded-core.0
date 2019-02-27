Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9B5907C85D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 09:50:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1R9o2Ci014204
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 01:50:49 -0800
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.435.0;
	Wed, 27 Feb 2019 01:50:35 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Feb 2019 04:50:32 -0500
Message-ID: <20190227095032.182301-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [PATCH] util-linux: fix multilib qa issue
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
X-List-Received-Date: Wed, 27 Feb 2019 09:50:58 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update RCONFLICTS and RREPLACES for util-linux to fix 'multilib' qa issue:

| ERROR: lib32-util-linux-2.32.1-r0 do_package: QA Issue: lib32-util-linux
  package lib32-util-linux-blkid - suspicious values 'e2fsprogs-blkid' in
  RREPLACES [multilib]
| ERROR: lib32-util-linux-2.32.1-r0 do_package: QA Issue: lib32-util-linux
  package lib32-util-linux-blkid - suspicious values 'e2fsprogs-blkid' in
  RCONFLICTS [multilib]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index e30e6331fd..cce684f280 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -133,8 +133,8 @@ FILES_${PN}-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so \
                           ${PYTHON_SITEPACKAGES_DIR}/libmount/__pycache__/*"
 
 # Util-linux' blkid replaces the e2fsprogs one
-RCONFLICTS_${PN}-blkid = "e2fsprogs-blkid"
-RREPLACES_${PN}-blkid = "e2fsprogs-blkid"
+RCONFLICTS_${PN}-blkid = "${MLPREFIX}e2fsprogs-blkid"
+RREPLACES_${PN}-blkid = "${MLPREFIX}e2fsprogs-blkid"
 
 RRECOMMENDS_${PN}_class-native = ""
 RRECOMMENDS_${PN}_class-nativesdk = ""
-- 
2.20.0


