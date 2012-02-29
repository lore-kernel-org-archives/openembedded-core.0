Received: from outbound.icp-osb-irony-out7.iinet.net.au ([203.59.1.108])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1S2daa-00068t-Br
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 08:04:40 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AvwEAOPLTU/LO4Se/2dsb2JhbABDs1iBB4J3KIEpiAe5Jo0eVBMGAwKEfwc/GSyDHgSITZJyjH0
X-IronPort-AV: E=Sophos;i="4.73,501,1325433600"; d="scan'208";a="78903120"
Received: from unknown (HELO gentoo_vm.DMA.local) ([203.59.132.158])
	by outbound.icp-osb-irony-out7.iinet.net.au with ESMTP;
	29 Feb 2012 14:56:08 +0800
From: James Limbouris <james@digitalmatter.com.au>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Feb 2012 14:56:30 +0800
Message-Id: <1330498590-29895-1-git-send-email-james@digitalmatter.com.au>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] busybox: Enable 64 bit shell tests, and disable non-standard date format interpretation.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Feb 2012 07:04:40 -0000

Without 64 bit shell tests, the timestamp comparison in initscripts' bootmisc.sh throws 'out of range' errors.
With CONFIG_FEATURE_DATE_COMPAT, date reads the YYYYMMddhhmm string as hhmmYYYYMMdd when setting the time from the timestamp in bootmisc.sh.

Signed-off-by: James Limbouris <james@digitalmatter.com.au>
---
 meta/recipes-core/busybox/busybox-1.19.3/defconfig |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox-1.19.3/defconfig b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
index fa9c078..ca49671 100644
--- a/meta/recipes-core/busybox/busybox-1.19.3/defconfig
+++ b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
@@ -172,11 +172,11 @@ CONFIG_CAT=y
 CONFIG_DATE=y
 # CONFIG_FEATURE_DATE_ISOFMT is not set
 # CONFIG_FEATURE_DATE_NANO is not set
-CONFIG_FEATURE_DATE_COMPAT=y
+# CONFIG_FEATURE_DATE_COMPAT is not set
 CONFIG_ID=y
 CONFIG_GROUPS=y
 CONFIG_TEST=y
-# CONFIG_FEATURE_TEST_64 is not set
+CONFIG_FEATURE_TEST_64=y
 CONFIG_TOUCH=y
 CONFIG_TR=y
 CONFIG_FEATURE_TR_CLASSES=y
-- 
1.7.3.4



