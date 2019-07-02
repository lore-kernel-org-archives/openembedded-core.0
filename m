Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 580257E963
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 04:20:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jul 2019 21:13:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,442,1557212400"; d="scan'208";a="166050085"
Received: from aradinsa-mobl1.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.181.235])
	by orsmga003.jf.intel.com with ESMTP; 01 Jul 2019 21:13:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jul 2019 16:12:44 +1200
Message-Id: <e13c9e9e04c3df56087dd8d63e144134ed9badaf.1562040724.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1562040724.git.paul.eggleton@linux.intel.com>
References: <cover.1562040724.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] scripts/contrib/ddimage: fix typo
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
X-List-Received-Date: Tue, 02 Jul 2019 04:20:06 -0000
Content-Transfer-Encoding: 8bit

UNKOWN -> UNKNOWN

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/contrib/ddimage | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/ddimage b/scripts/contrib/ddimage
index b577d1ca2ab..01ff4318514 100755
--- a/scripts/contrib/ddimage
+++ b/scripts/contrib/ddimage
@@ -49,7 +49,7 @@ device_details() {
 	if [ -f "/sys/class/block/$DEV/device/vendor" ]; then
 		echo "  vendor: $(cat /sys/class/block/$DEV/device/vendor)"
 	else
-		echo "  vendor: UNKOWN"
+		echo "  vendor: UNKNOWN"
 	fi
 	if [ -f "/sys/class/block/$DEV/device/model" ]; then
 		echo "   model: $(cat /sys/class/block/$DEV/device/model)"
-- 
2.20.1


