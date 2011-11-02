Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1RLTjM-0006nF-IL
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 06:51:20 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pA25jDMe024840
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Nov 2011 22:45:13 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 1 Nov 2011 22:45:13 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Nov 2011 13:52:36 +0800
Message-ID: <4c7397ee42cd9d2afaba68ac634d1376edb886b0.1320212931.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1320212931.git.wenzong.fan@windriver.com>
References: <cover.1320212931.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] distro_tracking_fields: Update the Month to 'MMM'
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
X-List-Received-Date: Wed, 02 Nov 2011 05:51:21 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Use format 'MMM' instead of spell out a Month.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 10835dd..998eabf 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5979,14 +5979,14 @@ DISTRO_PN_ALIAS_pn-libsdl = "Fedora=SDL Opensuse=SDL"
 RECIPE_STATUS_pn-ccache = "green"
 RECIPE_MAINTAINER_pn-ccache = "Wenzong Fan <wenzong.fan@windriver.com>"
 RECIPE_LATEST_VERSION_pn-ccache = "3.1.6"
-RECIPE_LAST_UPDATE_pn-ccache = "October 19, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-ccache = "October 25, 2011"
+RECIPE_LAST_UPDATE_pn-ccache = "Oct 19, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-ccache = "Oct 25, 2011"
 
 RECIPE_STATUS_pn-chkconfig = "green"
 RECIPE_MAINTAINER_pn-chkconfig = "Wenzong Fan <wenzong.fan@windriver.com>"
 RECIPE_LATEST_VERSION_pn-chkconfig = "1.3.55"
-RECIPE_LAST_UPDATE_pn-chkconfig = "October 19, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-chkconfig = "October 25, 2011"
+RECIPE_LAST_UPDATE_pn-chkconfig = "Oct 19, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-chkconfig = "Oct 25, 2011"
 
 DISTRO_PN_ALIAS_pn-lame = "Debian=lame Ubuntu=lame"
 DISTRO_PN_ALIAS_pn-libiconv = "Fedora=mingw-libiconv Opensuse=cross-mingw-libiconv"
-- 
1.7.0.4



