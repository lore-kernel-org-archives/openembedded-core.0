Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RaZ0a-00053J-Eo
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 21:31:29 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Dec 2011 12:24:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95781357"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.215])
	by fmsmga001.fm.intel.com with ESMTP; 13 Dec 2011 12:24:28 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2011 12:24:27 -0800
Message-Id: <918142aa39296899447cc937c37451f41bb6979e.1323807692.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.4
In-Reply-To: <cover.1323807692.git.josh@linux.intel.com>
References: <cover.1323807692.git.josh@linux.intel.com>
In-Reply-To: <cover.1323807692.git.josh@linux.intel.com>
References: <cover.1323807692.git.josh@linux.intel.com>
Subject: [PATCH 5/5] distro_tracking_fields: update cogl and clutter
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
X-List-Received-Date: Tue, 13 Dec 2011 20:31:29 -0000

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 890340b..f2b7d4b 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5468,15 +5468,16 @@ RECIPE_MAINTAINER_pn-libgalago = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-cogl = "green"
 DISTRO_PN_ALIAS_pn-cogl = "Fedora=cogl OpenSuse=cogl Ubuntu=cogl Mandriva=cogl Debian=cogl"
-RECIPE_LATEST_VERSION_pn-cogl = "1.8.0"
-RECIPE_MANUAL_CHECK_DATE_pn-cogl = "Nov 9, 2011"
-RECIPE_LAST_UPDATE_pn-cogl = "Nov 9, 2011"
+RECIPE_LATEST_VERSION_pn-cogl = "1.8.2"
+RECIPE_MANUAL_CHECK_DATE_pn-cogl = "Dec 13, 2011"
+RECIPE_LAST_UPDATE_pn-cogl = "Dec 13, 2011"
+RECIPE_MAINTAINER_pn-cogl = "Joshua Lock <josh@linux.intel.com>"
 
 RECIPE_STATUS_pn-clutter-1.8 = "green"
 DISTRO_PN_ALIAS_pn-clutter-1.8 = "Fedora=clutter OpenSuse=clutter Ubuntu=clutter-1.0 Mandriva=clutter Debian=clutter"
-RECIPE_LATEST_VERSION_pn-clutter-1.8 = "1.8.0"
-RECIPE_MANUAL_CHECK_DATE_pn-clutter-1.8 = "Nov 9, 2011"
-RECIPE_LAST_UPDATE_pn-clutter-1.8 = "Nov 9, 2011"
+RECIPE_LATEST_VERSION_pn-clutter-1.8 = "1.8.2"
+RECIPE_MANUAL_CHECK_DATE_pn-clutter-1.8 = "Dec 13, 2011"
+RECIPE_LAST_UPDATE_pn-clutter-1.8 = "Dec 13, 2011"
 RECIPE_MAINTAINER_pn-clutter-1.8 = "Joshua Lock <josh@linux.intel.com>"
 
 RECIPE_STATUS_pn-clutter-gtk-1.8 = "red"
-- 
1.7.7.4



