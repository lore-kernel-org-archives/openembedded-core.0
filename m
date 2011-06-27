Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QbHjD-0001c6-8O
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 21:44:15 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Mon, 27 Jun 2011
	21:40:34 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jun 2011 21:40:27 +0200
Message-ID: <f56a2a983173fb858b3a3ee5faaa6888d917b71e.1309203545.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1309203545.git.anders@chargestorm.se>
References: <cover.1309203545.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Subject: [RFC v2 PATCH 9/9] distro_tracking_fields: remove modutils.
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
X-List-Received-Date: Mon, 27 Jun 2011 19:44:15 -0000
Content-Type: text/plain

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 .../conf/distro/include/distro_tracking_fields.inc |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index f4aa1ea..285a371 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -1,5 +1,6 @@
 RECIPE_STATUS_pn-diffutils = "green"
 RECIPE_LATEST_VERSION_pn-diffutils = "3.0"
+
 RECIPE_LAST_UPDATE_pn-diffutils = "Dec 10, 2010"
 RECIPE_MAINTAINER_pn-diffutils = "Qing He <qing.he@intel.com>"
 
@@ -682,13 +683,6 @@ RECIPE_COMMENTS_pn-keymaps = "local scripts follow Poky's MIT license, however i
 RECIPE_LAST_UPDATE_pn-keymaps = "Jul 21, 2006"
 RECIPE_MAINTAINER_pn-keymaps = "Yu Ke <ke.yu@intel.com>"
 
-RECIPE_STATUS_pn-modutils = "red"
-RECIPE_DEPENDENCY_CHECK_pn-modutils-initscripts = "not done"
-RECIPE_LATEST_VERSION_pn-modutils = "2.4.27"
-RECIPE_LAST_UPDATE_pn-modutils = "Jul 21, 2006"
-RECIPE_MAINTAINER_pn-modutils = "Yu Ke <ke.yu@intel.com>"
-DISTRO_PN_ALIAS_pn-modutils = "Ubuntu=module-init-tools Fedora=module-init-tools"
-
 RECIPE_STATUS_pn-modutils-initscripts = "green"
 RECIPE_DEPENDENCY_CHECK_pn-modutils-initscripts = "not done"
 RECIPE_LATEST_VERSION_pn-modutils-initscripts = "1.0"
-- 
1.7.4.1



