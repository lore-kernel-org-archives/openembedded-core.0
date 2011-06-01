Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QRlNS-0007Bi-Cs
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 15:22:26 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 01 Jun 2011 06:19:17 -0700
X-ExtLoop1: 1
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by orsmga002.jf.intel.com with ESMTP; 01 Jun 2011 06:19:17 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2011 21:18:39 +0800
Message-Id: <d934a1bc53ee45cdaa2a81b79433d836ffb438aa.1306931849.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <cover.1306931844.git.dexuan.cui@intel.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1306931844.git.dexuan.cui@intel.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
Subject: [RFC v1 PATCH 08/16] coreutils: remove unnecessary dependency on perl
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
X-List-Received-Date: Wed, 01 Jun 2011 13:22:26 -0000

OE's coreutils doesn't depend on perl, either.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-core/coreutils/coreutils_6.9.bb |    6 +++---
 meta/recipes-core/coreutils/coreutils_8.9.bb |    6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index f837a22..c9aea38 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -8,9 +8,9 @@ BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://src/ls.c;startline=4;endline=16;md5=482a96d4f25010a4e13f8743e0c3685e"
-PR = "r1"
-DEPENDS = "perl-native coreutils-native-${PV}"
-DEPENDS_virtclass-native = "perl-native gettext-native"
+PR = "r2"
+DEPENDS = "coreutils-native-${PV}"
+DEPENDS_virtclass-native = "gettext-native"
 
 inherit autotools gettext
 
diff --git a/meta/recipes-core/coreutils/coreutils_8.9.bb b/meta/recipes-core/coreutils/coreutils_8.9.bb
index 955aaf5..7f96c6e 100644
--- a/meta/recipes-core/coreutils/coreutils_8.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.9.bb
@@ -7,9 +7,9 @@ BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
                     file://src/ls.c;startline=5;endline=16;md5=e1a509558876db58fb6667ba140137ad"
-PR = "r1"
-DEPENDS = "perl-native gmp"
-DEPENDS_virtclass-native = "perl-native"
+PR = "r2"
+DEPENDS = "gmp"
+DEPENDS_virtclass-native = ""
 
 inherit autotools gettext
 
-- 
1.7.2



