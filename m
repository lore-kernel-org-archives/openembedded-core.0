Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QRlNb-0007Jh-QA
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 15:22:36 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 01 Jun 2011 06:19:24 -0700
X-ExtLoop1: 1
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by orsmga002.jf.intel.com with ESMTP; 01 Jun 2011 06:19:23 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2011 21:18:44 +0800
Message-Id: <20e49cfad65bb39f81e36b163440896b6dbacb29.1306931849.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <cover.1306931844.git.dexuan.cui@intel.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1306931844.git.dexuan.cui@intel.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
Subject: [RFC v1 PATCH 13/16] libxml-parser-perl: inherit perlnative
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
X-List-Received-Date: Wed, 01 Jun 2011 13:22:36 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../perl/libxml-parser-perl-native_2.40.bb         |    2 +-
 .../perl/libxml-parser-perl_2.40.bb                |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/libxml-parser-perl-native_2.40.bb b/meta/recipes-devtools/perl/libxml-parser-perl-native_2.40.bb
index 6ba56b3..8c20455 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl-native_2.40.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl-native_2.40.bb
@@ -4,4 +4,4 @@ require libxml-parser-perl_${PV}.bb
 
 inherit native
 
-DEPENDS = "expat-native perl-native"
\ No newline at end of file
+DEPENDS += "expat-native"
diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.40.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.40.bb
index c2d1bdb..fac28a8 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.40.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.40.bb
@@ -3,7 +3,7 @@ LICENSE = "Artistic"
 LIC_FILES_CHKSUM = "file://README;beginline=2;endline=6;md5=c8767d7516229f07b26e42d1cf8b51f1"
 DEPENDS += "expat expat-native"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}.tar.gz"
 
-- 
1.7.2



