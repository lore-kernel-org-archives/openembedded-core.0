Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RlHjk-0000gi-Tu
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 11:18:25 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q0CAArU2022972
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 02:10:53 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 12 Jan 2012 02:10:53 -0800
Message-ID: <1ac2d2b0c6b35e39be2cd228d74b63dfc5e0d0ac.1326361942.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1326361942.git.xiaofeng.yan@windriver.com>
References: <cover.1326361942.git.xiaofeng.yan@windriver.com>
Old-Date: Thu, 12 Jan 2012 17:42:18 +0800
Date: Thu, 12 Jan 2012 17:59:05 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] distro_tracking_fields.inc: Modify the status of eds-tools and mingetty
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
X-List-Received-Date: Thu, 12 Jan 2012 10:18:25 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Update the status of eds-tools and mingetty.
mingetty has still not been updated since 2008.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 14eff32..cf851b8 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -79,7 +79,8 @@ RECIPE_MAINTAINER_pn-meta-ide-support = "Joshua Lock <joshua.lock@intel.com>"
 
 RECIPE_STATUS_pn-mingetty = "red"
 RECIPE_LATEST_VERSION_pn-mingetty = "1.08"
-RECIPE_LAST_UPDATE_pn-mingetty = "Sep 1, 2010"
+RECIPE_LAST_UPDATE_pn-mingetty = "Jan, 2008"
+RECIPE_MANUAL_CHECK_DATE_pn-mingetty = "Jan 12, 2012"
 RECIPE_MAINTAINER_pn-mingetty = "Xiaofeng.Yan <xiaofeng@windriver.com>"
 
 RECIPE_STATUS_pn-minicom = "green"
@@ -5743,8 +5744,8 @@ DISTRO_PN_ALIAS_pn-table = "Intel"
 RECIPE_STATUS_pn-eds-tools = "red"
 DISTRO_PN_ALIAS_pn-eds-tools = "OpenedHand"
 RECIPE_LATEST_VERSION_pn-eds-tools = "git"
-RECIPE_LAST_UPDATE_pn-eds-tools = "Sep 12, 2007"
-RECIPE_MANUAL_CHECK_DATE_pn-eds-tools = "Nov 25, 2011"
+RECIPE_LAST_UPDATE_pn-eds-tools = "Oct 10, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-eds-tools = "Jan 12, 2012"
 RECIPE_MAINTAINER_pn-eds-tools = "Wenzong Fan <wenzong.fan@windriver.com>"
 
 RECIPE_STATUS_pn-abiword-embedded = "red"
-- 
1.7.7



