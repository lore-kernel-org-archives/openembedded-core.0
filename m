Return-Path: <brendan.le.foll@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 647EB73DF0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 21:38:24 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 20 Aug 2015 14:38:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,717,1432623600"; d="scan'208";a="545648687"
Received: from jupiter.iwi.intel.com ([172.28.33.51])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Aug 2015 14:38:24 -0700
From: brendan.le.foll@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 22:38:22 +0100
Message-Id: <1440106702-23272-4-git-send-email-brendan.le.foll@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1440106702-23272-1-git-send-email-brendan.le.foll@intel.com>
References: <1440106702-23272-1-git-send-email-brendan.le.foll@intel.com>
Subject: [PATCH V2 3/3] toolchain-shar-extract.sh: explain why we cannot use sudo in extensible SDK
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
X-List-Received-Date: Thu, 20 Aug 2015 21:38:24 -0000

From: Brendan Le Foll <brendan.le.foll@intel.com>

Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
---
 meta/files/toolchain-shar-extract.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 41b3f2c..edf26f6 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -131,7 +131,8 @@ mkdir -p $target_sdk_dir >/dev/null 2>&1
 # if don't have the right to access dir, gain by sudo 
 if [ ! -x $target_sdk_dir -o ! -w $target_sdk_dir -o ! -r $target_sdk_dir ]; then 
 	if [ "$SDK_EXTENSIBLE" = "1" ]; then
-		echo "Unable to access \"$target_sdk_dir\"."
+		echo "Unable to access \"$target_sdk_dir\", will not attempt to use" \
+		     "sudo as as extensible SDK cannot be used as root."
 		exit 1
 	fi
 
-- 
2.5.0


