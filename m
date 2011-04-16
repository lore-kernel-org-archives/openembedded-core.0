Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzQa-0006CH-2A
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:56:20 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Apr 2011 23:54:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="910410635"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by fmsmga001.fm.intel.com with ESMTP; 15 Apr 2011 23:54:00 -0700
Message-Id: <a9a970cd0829b00a43e255590b006d370eff9b76.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Wed, 13 Apr 2011 13:29:53 +0800
Date: Fri, 15 Apr 2011 23:53:59 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 19/58] polkit-gnome: Upgrade to 0.101 (from 0.99)
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
X-List-Received-Date: Sat, 16 Apr 2011 06:56:20 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 ...{polkit-gnome_0.99.bb => polkit-gnome_0.101.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/polkit/{polkit-gnome_0.99.bb => polkit-gnome_0.101.bb} (86%)

diff --git a/meta/recipes-extended/polkit/polkit-gnome_0.99.bb b/meta/recipes-extended/polkit/polkit-gnome_0.101.bb
similarity index 86%
rename from meta/recipes-extended/polkit/polkit-gnome_0.99.bb
rename to meta/recipes-extended/polkit/polkit-gnome_0.101.bb
index f4fb337..e619090 100644
--- a/meta/recipes-extended/polkit/polkit-gnome_0.99.bb
+++ b/meta/recipes-extended/polkit/polkit-gnome_0.101.bb
@@ -23,5 +23,5 @@ inherit autotools pkgconfig
 FILES_${PN} += " ${datadir}/dbus-1 \
                  ${datadir}/PolicyKit \
                "
-SRC_URI[md5sum] = "f1a2565083266bc8c05c60aa7d8a0f6a"
-SRC_URI[sha256sum] = "73c4d04aa89d9a9687f3650327c0ec1cba704e9d5b7fc193958fa81d621208ba"
+SRC_URI[md5sum] = "da6aaff473ed80f8958fd6f67a59defe"
+SRC_URI[sha256sum] = "f1452e37b6681a0ade2c0cbb3734e6f78c421b958ab4d4eb6a2cd3b9f50db8d0"
-- 
1.7.1.1



