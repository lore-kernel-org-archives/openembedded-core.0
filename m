Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzQR-0006CL-52
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:56:11 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Apr 2011 23:53:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="679865346"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2011 23:53:49 -0700
Message-Id: <05907f0dfc77ec008264411978dfc64885be3328.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Tue, 12 Apr 2011 15:51:49 +0800
Date: Fri, 15 Apr 2011 23:53:49 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 15/58] libsoup-2.4: Upgrade to 2.32.2 (from 2.32.1)
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
X-List-Received-Date: Sat, 16 Apr 2011 06:56:11 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 ...libsoup-2.4_2.32.1.bb => libsoup-2.4_2.32.2.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.32.1.bb => libsoup-2.4_2.32.2.bb} (76%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.32.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.32.2.bb
similarity index 76%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.32.1.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.32.2.bb
index 72d7852..59b9150 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.32.1.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.32.2.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3 libgnome-keyring"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/2.32/libsoup-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "894ca0077ec2d923286a69766d0b0b74"
-SRC_URI[sha256sum] = "8779da1b4d85f443f04ea8301f52c4a1943c10e4dc8d20dbcdb3652921de6b8e"
+SRC_URI[md5sum] = "03f37350a2a31046ebabb8470e75abcc"
+SRC_URI[sha256sum] = "96e6973c8b7459523c0f44e7aec69528ff2fbd388e8ddc415f91bcc42f50777f"
 S = "${WORKDIR}/libsoup-${PV}"
 
 inherit autotools pkgconfig
-- 
1.7.1.1



