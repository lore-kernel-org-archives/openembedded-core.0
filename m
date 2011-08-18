Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Qtyoy-0000kQ-B9
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 11:23:28 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7I9Imxw021087
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Aug 2011 02:18:48 -0700 (PDT)
Received: from localhost (128.224.162.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 18 Aug 2011 02:18:47 -0700
Message-ID: <8a2ea140c53facf9a4bd5029c37454e19ee7c2d0.1313636030.git.kai.kang@windriver.com>
In-Reply-To: <cover.1313636030.git.kai.kang@windriver.com>
References: <cover.1313636030.git.kai.kang@windriver.com>
Old-Date: Thu, 18 Aug 2011 10:49:02 +0800
Date: Thu, 18 Aug 2011 17:18:44 +0800
To: <sgw@linux.intel.com>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.220]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] newt: update distro tracking fields
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
X-List-Received-Date: Thu, 18 Aug 2011 09:23:28 -0000
Content-Type: text/plain

From: Kang Kai <kai.kang@windriver.com>

Update newt distro tracking fields

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 9dcd3ab..da425e6 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5736,10 +5736,10 @@ RECIPE_MANUAL_CHECK_DATE_pn-slang = "Jun 28, 2011"
 RECIPE_MAINTAINER_pn-slang = "Kai Kang <kai.kang@windriver.com>"
 
 RECIPE_STATUS_pn-libnewt = "green"
-RECIPE_LATEST_VERSION_pn-libnewt = "0.52.12"
-RECIPE_LAST_UPDATE_pn-libnewt = "Aug 06, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-libnewt = "Jun 4, 2011"
-RECIPE_NO_UPDATE_REASON_pn-libnewt = ""
+RECIPE_LATEST_VERSION_pn-libnewt = "0.52.13"
+RECIPE_MAINTAINER_pn-libnewt = "Kai Kang <kai.kang@windriver.com>"
+RECIPE_LAST_UPDATE_pn-libnewt = "Jul 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libnewt = "Jul 27, 2011"
 
 RECIPE_STATUS_pn-createrepo = "green"
 RECIPE_LATEST_VERSION_pn-createrepo = "0.9.9"
-- 
1.7.5.1.300.gc565c



