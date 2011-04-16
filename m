Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzRO-0006H6-Sb
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:57:11 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Apr 2011 23:54:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="734220204"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by orsmga001.jf.intel.com with ESMTP; 15 Apr 2011 23:54:41 -0700
Message-Id: <eee3fb921c3e9c6439df2540a552719c9327ebd4.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Tue, 12 Apr 2011 10:39:42 +0800
Date: Fri, 15 Apr 2011 23:54:40 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 37/58] gnu-config-native: add dependency on perl-native
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
X-List-Received-Date: Sat, 16 Apr 2011 06:57:11 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Fixes [YOCTO #968]

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../gnu-config/config-guess-uclibc.patch           |    2 ++
 .../gnu-config/gnu-config_20080123.bb              |    6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config/config-guess-uclibc.patch b/meta/recipes-devtools/gnu-config/gnu-config/config-guess-uclibc.patch
index f820cef..f862c83 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config/config-guess-uclibc.patch
+++ b/meta/recipes-devtools/gnu-config/gnu-config/config-guess-uclibc.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Patch courtesy gentoo-portage/sys-devel/gnuconfig/files/automake-1.8.5-config-guess-uclibc.patch.
 
 updated to 20050516 by Marcin 'Hrw' Juszkiewicz (by hand)
diff --git a/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb b/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb
index e0a8155..897984d 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb
@@ -3,12 +3,14 @@ DESCRIPTION = "Tool that installs the GNU config.guess / config.sub into a direc
 SECTION = "devel"
 LICENSE = "GPLv1+"
 LIC_FILES_CHKSUM = "file://config.guess;endline=39;md5=a089987af4a25cb0419d1c2fd6d495e3"
-DEPENDS = ""
+
+DEPENDS_virtclass-native = "perl-native"
+
 INHIBIT_DEFAULT_DEPS = "1"
 
 FIXEDSRCDATE = "${@bb.data.getVar('FILE', d, 1).split('_')[-1].split('.')[0]}"
 PV = "0.1+cvs${FIXEDSRCDATE}"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "cvs://anonymous@cvs.sv.gnu.org/cvsroot/config;module=config;method=pserver;date=${FIXEDSRCDATE} \
 	   file://config-guess-uclibc.patch \
-- 
1.7.1.1



