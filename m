Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1S8Axq-0004OH-AK
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 14:43:34 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2FDYlth027475
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 06:34:47 -0700 (PDT)
Received: from build-PowerEdge-T100.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 15 Mar 2012 06:34:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Mar 2012 21:34:22 +0800
Message-ID: <eb82f374dd8152c9cf0cae53811c15afcfadf822.1331818182.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1331818182.git.liezhi.yang@windriver.com>
References: <cover.1331818182.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] upgrade logrotate: update the distro_tracking_fields.inc
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
X-List-Received-Date: Thu, 15 Mar 2012 13:43:34 -0000
Content-Type: text/plain

update the distro_tracking_fields.inc.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 8ad924b..ae758fa 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -78,10 +78,10 @@ RECIPE_LAST_UPDATE_pn-linux-firmware = "Dec 30, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-linux-firmware = "Dec 30, 2011"
 RECIPE_MAINTAINER_pn-linux-firmware = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
-RECIPE_STATUS_pn-logrotate = "red"
+RECIPE_STATUS_pn-logrotate = "green"
 RECIPE_LATEST_VERSION_pn-logrotate = "check"
-RECIPE_LAST_UPDATE_pn-logrotate = "Sep 1, 2010"
-RECIPE_MAINTAINER_pn-logrotate = "Xiaofeng.Yan <xiaofeng@windriver.com>"
+RECIPE_LAST_UPDATE_pn-logrotate = "Mar 14, 2012"
+RECIPE_MAINTAINER_pn-logrotate = "Robert Yang <liezhi.yang@windriver.com>"
 
 RECIPE_STATUS_pn-loudmouth = "red"
 RECIPE_LATEST_VERSION_pn-loudmouth = "check"
-- 
1.7.4.1



