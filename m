Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QRlNg-0007OU-AG
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 15:22:40 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 01 Jun 2011 06:19:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,303,1304319600"; d="scan'208";a="10343888"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by fmsmga002.fm.intel.com with ESMTP; 01 Jun 2011 06:19:27 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2011 21:18:46 +0800
Message-Id: <321197aff1c4bbef7b1740d158a6c43882fdb136.1306931849.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <cover.1306931844.git.dexuan.cui@intel.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1306931844.git.dexuan.cui@intel.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
Subject: [RFC v1 PATCH 15/16] libxml-simple-perl: fix EXTRA_PERLFLAGS due the the perlnative change
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
X-List-Received-Date: Wed, 01 Jun 2011 13:22:40 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../perl/libxml-simple-perl-native_2.18.bb         |    2 +-
 .../perl/libxml-simple-perl_2.18.bb                |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/perl/libxml-simple-perl-native_2.18.bb b/meta/recipes-devtools/perl/libxml-simple-perl-native_2.18.bb
index bfdfc3d..3877d0b 100644
--- a/meta/recipes-devtools/perl/libxml-simple-perl-native_2.18.bb
+++ b/meta/recipes-devtools/perl/libxml-simple-perl-native_2.18.bb
@@ -4,4 +4,4 @@ inherit native
 
 require libxml-simple-perl_${PV}.bb
 
-DEPENDS = "libxml-parser-perl-native perl-native"
+DEPENDS += "libxml-parser-perl-native"
diff --git a/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb b/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb
index ca57776..89b65b2 100644
--- a/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb
+++ b/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb
@@ -2,7 +2,7 @@ SECTION = "libs"
 LICENSE = "Artistic"
 LIC_FILES_CHKSUM = "file://README;beginline=70;md5=94aa5d46682b411a53a5494cfb22640e"
 DEPENDS += "libxml-parser-perl"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Simple-${PV}.tar.gz"
 
@@ -11,6 +11,6 @@ SRC_URI[sha256sum] = "a54967c188cda3e20f496c83be4de3f1740eeaa83c0380712ecd969ad8
 
 S = "${WORKDIR}/XML-Simple-${PV}"
 
-EXTRA_PERLFLAGS = "-I ${STAGING_LIBDIR_NATIVE}/perl/${@get_perl_version(d)}"
+EXTRA_PERLFLAGS = "-I ${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}"
 
 inherit cpan
-- 
1.7.2



