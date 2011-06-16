Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QXGGJ-0001aC-QU
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 19:21:47 +0200
Received: from localhost.localdomain (c-76-115-40-57.hsd1.or.comcast.net
	[76.115.40.57])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 859D030520;
	Thu, 16 Jun 2011 13:18:15 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jun 2011 10:18:08 -0700
Message-Id: <ff38c6cc8cdd5b910f06437c446059e4cac1a978.1308244596.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1308244596.git.scott.a.garman@intel.com>
References: <cover.1308244596.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1308244596.git.scott.a.garman@intel.com>
References: <cover.1308244596.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 859D030520.79218
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [PATCH 2/2] distro_tracking: update mtools tracking info
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
X-List-Received-Date: Thu, 16 Jun 2011 17:21:48 -0000

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index f4aa1ea..830b5dc 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -1269,13 +1269,12 @@ DISTRO_PN_ALIAS_pn-msynctool = "OpenSuse=msynctool Mandriva=msynctool"
 
 RECIPE_STATUS_pn-mtools = "green"
 RECIPE_DEPENDENCY_CHECK_pn-mtools = "not done"
-RECIPE_LATEST_VERSION_pn-mtools = "4.0.15"
+RECIPE_LATEST_VERSION_pn-mtools = "4.0.16"
 RECIPE_INTEL_SECTION_pn-mtools = "optional"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-mtools = "1 day"
-RECIPE_LATEST_RELEASE_DATE_pn-mtools = "2010/10/17"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-mtools = "6 months"
+RECIPE_LATEST_RELEASE_DATE_pn-mtools = "2011/04/16"
 RECIPE_COMMENTS_pn-mtools = ""
-RECIPE_LATEST_VERSION_pn-mtools = "4.0.15"
-RECIPE_LAST_UPDATE_pn-mtools = "Nov 23, 2010"
+RECIPE_LAST_UPDATE_pn-mtools = "Jun 15, 2011"
 RECIPE_MAINTAINER_pn-mtools = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-pm-utils = "green"
-- 
1.7.1



