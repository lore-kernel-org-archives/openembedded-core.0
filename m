Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QcXrh-0005mB-TA
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 09:10:13 +0200
Received: from localhost (193.235.91.228) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.137.0; Fri, 1 Jul 2011
	09:06:29 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Jul 2011 09:06:21 +0200
Message-ID: <dacd86ad3c2b1f5b05c84d2f92af66044fdd9fbd.1309503939.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1309503939.git.anders@chargestorm.se>
References: <cover.1309503939.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH v4 8/8] distro_tracking_fields: remove modutils.
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
X-List-Received-Date: Fri, 01 Jul 2011 07:10:14 -0000
Content-Type: text/plain

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 .../conf/distro/include/distro_tracking_fields.inc |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 2e7996b..ad64581 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -1,5 +1,6 @@
 RECIPE_STATUS_pn-diffutils = "green"
 RECIPE_LATEST_VERSION_pn-diffutils = "3.0"
+
 RECIPE_LAST_UPDATE_pn-diffutils = "Dec 10, 2010"
 RECIPE_MAINTAINER_pn-diffutils = "Mei Lei <lei.mei@intel.com>"
 
@@ -684,13 +685,6 @@ RECIPE_COMMENTS_pn-keymaps = "local scripts follow Poky's MIT license, however i
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



