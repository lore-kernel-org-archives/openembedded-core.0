Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1RUwEg-0000nj-Sw
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Nov 2011 09:06:47 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAS808Ew023072
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2011 00:00:08 -0800 (PST)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 28 Nov 2011 00:00:08 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Nov 2011 15:57:15 +0800
Message-ID: <7edbc8ee33ddd7e93f1eb741efe8f0f1d0f8d51b.1322466046.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1322466046.git.wenzong.fan@windriver.com>
References: <cover.1322466046.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] distro_tracking: update tracking fields for gettext and eds-tools
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
X-List-Received-Date: Mon, 28 Nov 2011 08:06:47 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Add maintainer and update manual_check_date, status fields.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index d84b1b3..2ce9f40 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5697,10 +5697,10 @@ DISTRO_PN_ALIAS_pn-table = "Intel"
 
 RECIPE_STATUS_pn-eds-tools = "red"
 DISTRO_PN_ALIAS_pn-eds-tools = "OpenedHand"
-RECIPE_LATEST_VERSION_pn-eds-tools = "bzr"
+RECIPE_LATEST_VERSION_pn-eds-tools = "git"
 RECIPE_LAST_UPDATE_pn-eds-tools = "Sep 12, 2007"
-RECIPE_MANUAL_CHECK_DATE_pn-eds-tools = "Nov 08, 2011"
-RECIPE_NO_UPDATE_REASON_pn-eds-tools = "Possibly convert to GIT based fetch"
+RECIPE_MANUAL_CHECK_DATE_pn-eds-tools = "Nov 25, 2011"
+RECIPE_MAINTAINER_pn-eds-tools = "Wenzong Fan <wenzong.fan@windriver.com>"
 
 RECIPE_STATUS_pn-abiword-embedded = "red"
 DISTRO_PN_ALIAS_pn-abiword-embedded = "Fedora=abiword Ubuntu=abiword"
@@ -6007,11 +6007,12 @@ RECIPE_LATEST_VERSION_pn-mesa-demos = "8.0.1"
 RECIPE_LAST_UPDATE_pn-mesa-demos = "Jul 13, 2010"
 RECIPE_MANUAL_CHECK_DATE_pn-mesa-demos = "Jun 7, 2011" 
 
-RECIPE_STATUS_pn-gettext = "red"
+RECIPE_STATUS_pn-gettext = "green"
 RECIPE_LATEST_VERSION_pn-gettext = "0.18.1.1"
 RECIPE_LATEST_RELEASE_DATE_pn-gettext = "Jun 06, 2010"
 RECIPE_LAST_UPDATE_pn-gettext = "May 24, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-gettext = "Sep 29, 2011" 
+RECIPE_MANUAL_CHECK_DATE_pn-gettext = "Nov 25, 2011"
+RECIPE_MAINTAINER_pn-gettext = "Wenzong Fan <wenzong.fan@windriver.com>"
 
 RECIPE_STATUS_pn-pseudo = "green"
 RECIPE_LATEST_VERSION_pn-pseudo = "1.2"
-- 
1.7.0.4



