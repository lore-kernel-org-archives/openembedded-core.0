Return-Path: <andy.voltz@timesys.com>
Received: from exchange07.timesys.com (exchange07.timesys.com
	[209.114.137.116])
	by mail.openembedded.org (Postfix) with ESMTP id 7A8986A8E9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 21:57:31 +0000 (UTC)
Received: from bob-linux.timesys.com (192.168.3.27) by exchange07.timesys.com
	(192.168.1.221) with Microsoft SMTP Server id 8.1.436.0;
	Mon, 10 Jun 2013 17:57:31 -0400
From: Andy Voltz <andy.voltz@timesys.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Jun 2013 17:57:47 -0400
Message-ID: <1370901467-2201-1-git-send-email-andy.voltz@timesys.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] tune-cortexa.inc: Use -mtune not -mcpu
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
X-List-Received-Date: Mon, 10 Jun 2013 21:57:32 -0000
Content-Type: text/plain

Using -mcpu was a mistake introduced in the creation commit for this file.
This restores the previous default tuning for cortex a7,a8,a9,a15

Signed-off-by: Andy Voltz <andy.voltz@timesys.com>
---
 meta/conf/machine/include/tune-cortexa.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-cortexa.inc b/meta/conf/machine/include/tune-cortexa.inc
index 987e4d9..b6427f7 100644
--- a/meta/conf/machine/include/tune-cortexa.inc
+++ b/meta/conf/machine/include/tune-cortexa.inc
@@ -2,7 +2,7 @@ DEFAULTTUNE ?= "armv7a-neon"
 
 require conf/machine/include/arm/arch-armv7a.inc
 
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortex${CORTEX_ID}", " -mcpu=cortex-${CORTEX_ID}", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortex${CORTEX_ID}", " -mtune=cortex-${CORTEX_ID}", "", d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortex${CORTEX_ID} cortex${CORTEX_ID}t cortex${CORTEX_ID}-neon cortex${CORTEX_ID}t-neon"
-- 
1.7.9.5


