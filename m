Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1S7hiG-00005D-It
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 07:29:32 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2E6KjPn024896
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 23:20:46 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 13 Mar 2012 23:20:45 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Mar 2012 14:25:00 +0800
Message-ID: <d5b53d845516542d6ff7faf25a789f65d8575605.1331705212.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1331705212.git.wenzong.fan@windriver.com>
References: <cover.1331705212.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] ccache: update it from 3.1.6 to 3.1.7
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
X-List-Received-Date: Wed, 14 Mar 2012 06:29:33 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Update ccache and related distro tracking fields.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    6 +++---
 .../ccache/{ccache_3.1.6.bb => ccache_3.1.7.bb}    |    4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_3.1.6.bb => ccache_3.1.7.bb} (47%)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index d8cb150..d82ab04 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -6197,9 +6197,9 @@ DISTRO_PN_ALIAS_pn-libsdl = "Fedora=SDL Opensuse=SDL"
 
 RECIPE_STATUS_pn-ccache = "green"
 RECIPE_MAINTAINER_pn-ccache = "Wenzong Fan <wenzong.fan@windriver.com>"
-RECIPE_LATEST_VERSION_pn-ccache = "3.1.6"
-RECIPE_LAST_UPDATE_pn-ccache = "Oct 19, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-ccache = "Oct 25, 2011"
+RECIPE_LATEST_VERSION_pn-ccache = "3.1.7"
+RECIPE_LAST_UPDATE_pn-ccache = "Mar 14, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-ccache = "Mar 14, 2012"
 
 RECIPE_STATUS_pn-chkconfig = "green"
 RECIPE_MAINTAINER_pn-chkconfig = "Wenzong Fan <wenzong.fan@windriver.com>"
diff --git a/meta/recipes-devtools/ccache/ccache_3.1.6.bb b/meta/recipes-devtools/ccache/ccache_3.1.7.bb
similarity index 47%
rename from meta/recipes-devtools/ccache/ccache_3.1.6.bb
rename to meta/recipes-devtools/ccache/ccache_3.1.7.bb
index e87468a..40a7056 100644
--- a/meta/recipes-devtools/ccache/ccache_3.1.6.bb
+++ b/meta/recipes-devtools/ccache/ccache_3.1.7.bb
@@ -4,5 +4,5 @@ PR = "r0"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=80e92ec45d4fca91f127864fb9e5d932"
 
-SRC_URI[md5sum] = "e6565e7d6c95d1e35b7a0d67e39901e8"
-SRC_URI[sha256sum] = "59f58bb73f00db5bbff36b8eb530d3000c86b3110e34cf8dba9e2a5d19eb684f"
+SRC_URI[md5sum] = "bf49574730fabd666fc7ec3f8b203f41"
+SRC_URI[sha256sum] = "278f4d1d38fc530221c7ce73606f34bc3a5df7e269930e4fb1d9ac44f4345d11"
-- 
1.7.0.4



