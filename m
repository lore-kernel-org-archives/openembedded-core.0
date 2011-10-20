Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1RGlfN-0007CD-TY
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 07:59:46 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9K5rrHJ001940
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2011 22:53:53 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 19 Oct 2011 22:53:53 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Oct 2011 13:59:59 +0800
Message-ID: <79447d2d8514eb75a5cda1a32d7b25d7fc66e50c.1319090166.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1319090166.git.wenzong.fan@windriver.com>
References: <cover.1319090166.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3 v2] distro_tracking_fields: update packages tracking fields
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
X-List-Received-Date: Thu, 20 Oct 2011 05:59:46 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Update packages tracking fields including ccache, chkconfig.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index abc2cbf..a7c2db5 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5914,6 +5914,18 @@ RECIPE_LATEST_RELEASE_DATE_pn-gettext = "Jun 06, 2010"
 RECIPE_LAST_UPDATE_pn-gettext = "May 24, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-gettext = "Sep 29, 2011" 
 
+RECIPE_STATUS_pn-ccache = "green"
+RECIPE_MAINTAINER_pn-ccache = "Wenzong Fan <wenzong.fan@windriver.com>"
+RECIPE_LATEST_VERSION_pn-ccache = "3.1.6"
+RECIPE_LAST_UPDATE_pn-ccache = "June 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-ccache = "October 11, 2011"
+
+RECIPE_STATUS_pn-chkconfig = "green"
+RECIPE_MAINTAINER_pn-chkconfig = "Wenzong Fan <wenzong.fan@windriver.com>"
+RECIPE_LATEST_VERSION_pn-chkconfig = "1.3.55"
+RECIPE_LAST_UPDATE_pn-chkconfig = "May 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-chkconfig = "October 11, 2011"
+
 RECIPE_STATUS_pn-pseudo = "green"
 RECIPE_LATEST_VERSION_pn-pseudo = "1.1.1"
 RECIPE_LAST_UPDATE_pn-pseudo = "Jun 06, 2011"
-- 
1.7.0.4



