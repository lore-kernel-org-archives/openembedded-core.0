Received: from outbound.icp-qv1-irony-out2.iinet.net.au ([203.59.1.107])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1S5Sa7-0003Sy-VK
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2012 02:55:52 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AvwEAFoPWE/LO4Se/2dsb2JhbABDtSqBB4MKKIEpiAcMuWCNTYMiBIhQkneDIIZxgnA
X-IronPort-AV: E=Sophos;i="4.73,549,1325433600"; d="scan'208";a="795394829"
Received: from unknown (HELO gentoo_vm.DMA.local) ([203.59.132.158])
	by outbound.icp-qv1-irony-out2.iinet.net.au with ESMTP;
	08 Mar 2012 09:46:48 +0800
From: James Limbouris <james@digitalmatter.com.au>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2012 09:47:08 +0800
Message-Id: <1331171228-12180-1-git-send-email-james@digitalmatter.com.au>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] gtk+: Amend upstream status of configure-nm.patch
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
X-List-Received-Date: Thu, 08 Mar 2012 01:55:52 -0000

Signed-off-by: James Limbouris <james@digitalmatter.com.au>
---
 .../gtk+/gtk+-2.24.8/configure-nm.patch            |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.8/configure-nm.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.8/configure-nm.patch
index 5aeef50..5f40508 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.24.8/configure-nm.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.24.8/configure-nm.patch
@@ -1,4 +1,6 @@
-Upstream-Status: Inappropriate [configuration]
+Upstream-Status: Pending
+https://bugzilla.gnome.org/show_bug.cgi?id=671515
+
 Signed-Off-By: Xiaofeng Yan <xiaofeng.yan@windriver.com>
 # Pick up ${NM} from the environment
 --- a/configure.in
-- 
1.7.3.4



