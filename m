Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1RIX4K-0003en-Ev
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Oct 2011 04:48:48 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9P2goFZ020159
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 19:42:50 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 24 Oct 2011 19:42:50 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Oct 2011 10:49:26 +0800
Message-ID: <1848a21e3972096a5169697c16abf2dd9edd17ba.1319510805.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1319510805.git.wenzong.fan@windriver.com>
References: <cover.1319510805.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] distro_tracking_fields: update packages tracking fields
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
X-List-Received-Date: Tue, 25 Oct 2011 02:48:48 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Update packages tracking fields including ccache, chkconfig.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 1f3540e..f053f87 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5976,6 +5976,18 @@ RECIPE_MANUAL_CHECK_DATE_pn-libsdl = "Jul 28, 2011"
 RECIPE_MAINTAINER_pn-libsdl = "Kai Kang <kai.kang@windriver.com>"
 DISTRO_PN_ALIAS_pn-libsdl = "Fedora=SDL Opensuse=SDL"
 
+RECIPE_STATUS_pn-ccache = "green"
+RECIPE_MAINTAINER_pn-ccache = "Wenzong Fan <wenzong.fan@windriver.com>"
+RECIPE_LATEST_VERSION_pn-ccache = "3.1.6"
+RECIPE_LAST_UPDATE_pn-ccache = "October 19, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-ccache = "October 25, 2011"
+
+RECIPE_STATUS_pn-chkconfig = "green"
+RECIPE_MAINTAINER_pn-chkconfig = "Wenzong Fan <wenzong.fan@windriver.com>"
+RECIPE_LATEST_VERSION_pn-chkconfig = "1.3.55"
+RECIPE_LAST_UPDATE_pn-chkconfig = "October 19, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-chkconfig = "October 25, 2011"
+
 DISTRO_PN_ALIAS_pn-lame = "Debian=lame Ubuntu=lame"
 DISTRO_PN_ALIAS_pn-libiconv = "Fedora=mingw-libiconv Opensuse=cross-mingw-libiconv"
 DISTRO_PN_ALIAS_pn-qt4-native = "Fedora=qt4 Debian=qt4-dev-tools"
-- 
1.7.0.4



