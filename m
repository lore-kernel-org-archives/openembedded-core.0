Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yi.Zhao@windriver.com>) id 1S0pJ1-0001e9-Um
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 08:11:04 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q1O72fdR026457
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 23:02:41 -0800 (PST)
Received: from localhost (128.224.162.249) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 23 Feb 2012 23:02:41 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Feb 2012 15:02:27 +0800
Message-ID: <efea3ceb14aaa5ad3a63ae74a5ee114d87cd2a80.1330066564.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1330066564.git.yi.zhao@windriver.com>
References: <cover.1330066564.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.249]
Subject: [PATCH V2 2/3] distro_tracking_fields: add information for lsbtest
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
X-List-Received-Date: Fri, 24 Feb 2012 07:11:04 -0000
Content-Type: text/plain

Add information for recipe lsbtest.
---
 .../conf/distro/include/distro_tracking_fields.inc |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 686bdf7..91c36d9 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5891,6 +5891,10 @@ RECIPE_MANUAL_CHECK_DATE_pn-lsbsetup = "Nov 28, 2011"
 DISTRO_PN_ALIAS_pn-lsbsetup = "Windriver"
 RECIPE_MAINTAINER_pn-lsbsetup = "Saul Wold <sgw@linux.intel.com>"
 
+RECIPE_LATEST_VERSION_pn-lsbtest = "1.0"
+RECIPE_LAST_UPDATE_pn-lsbtest = "Feb 17, 2012"
+RECIPE_MAINTAINER_pn-lsbtest = "Yi Zhao <yi.zhao@windriver.com>"
+
 RECIPE_LATEST_VERSION_pn-libxml-simple-perl = "2.18"
 RECIPE_LATEST_VERSION_pn-talloc = "2.0.5"
 
-- 
1.7.1



