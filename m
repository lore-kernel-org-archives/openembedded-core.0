Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RkWaB-0007LG-KV
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 08:57:23 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jan 2012 23:49:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="110561710"
Received: from dongxiao-desktop.sh.intel.com (HELO localhost) ([10.239.36.108])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jan 2012 23:49:54 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2012 15:52:06 +0800
Message-Id: <d3d9ba1a5582d4d62e728a866ccafd2ae7c2da23.1326181827.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1326181827.git.dongxiao.xu@intel.com>
References: <cover.1326181827.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1326181827.git.dongxiao.xu@intel.com>
References: <cover.1326181827.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/1] distro_tracking: update manual check info
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
X-List-Received-Date: Tue, 10 Jan 2012 07:57:23 -0000

updated kexec-tools manual check information

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index cc87d5c..6a8463f 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -2384,6 +2384,7 @@ RECIPE_NO_OF_PATCHES_pn-kexec-tools="1"
 RECIPE_LATEST_RELEASE_DATE_pn-kexec-tools="Jul 29, 2010"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-kexec-tools="1 year"
 RECIPE_LAST_UPDATE_pn-kexec-tools = "Nov 16, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-kexec-tools = "Jan 10, 2012"
 RECIPE_MAINTAINER_pn-kexec-tools = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-hostap-conf = "red"
-- 
1.7.0.4



