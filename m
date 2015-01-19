Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D677D72A83
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 01:26:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0J1QV41000341
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Jan 2015 17:26:31 -0800 (PST)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 18 Jan 2015 17:26:31 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 18 Jan 2015 19:26:30 -0600
Message-ID: <1421630790-112450-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH] feature-arm-thumb.inc: Remove extra space on thumb override
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
X-List-Received-Date: Mon, 19 Jan 2015 01:26:33 -0000
Content-Type: text/plain

The extra space makes the overrides look like "foo:bar: thumb:foobar".

This may prevent thumb from working properly, and the space was never
intended in the original fix.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/conf/machine/include/arm/feature-arm-thumb.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index 8e6619d..0db5ec1 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -42,7 +42,7 @@ TUNEVALID[no-thumb-interwork] = "Disable mixing of thumb and ARM functions"
 THUMB_TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'no-thumb-interwork', ' -mno-thumb-interwork', ' -mthumb-interwork', d)}"
 THUMB_OVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'no-thumb-interwork', ':thumb-interwork', '', d)}"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' ${THUMB_TUNE_CCARGS}', '', d)}"
-OVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' ${THUMB_OVERRIDES}', '', d)}"
+OVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '${THUMB_OVERRIDES}', '', d)}"
 
 # what about armv7m devices which don't support -marm (e.g. Cortex-M3)?
 TARGET_CC_KERNEL_ARCH += "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '-mno-thumb-interwork -marm', '', d)}"
-- 
1.9.3


