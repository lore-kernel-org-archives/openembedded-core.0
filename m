Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SirKV-0004YT-SR
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Jun 2012 20:14:36 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2012 11:03:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="161983147"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.175])
	by orsmga002.jf.intel.com with ESMTP; 24 Jun 2012 11:03:43 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Jun 2012 11:03:32 -0700
Message-Id: <4ef02801dd7dd8b3432853e6f7acaa89787177ef.1340560914.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340560914.git.sgw@linux.intel.com>
References: <cover.1340560914.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340560914.git.sgw@linux.intel.com>
References: <cover.1340560914.git.sgw@linux.intel.com>
Subject: [PATCH 07/14] libxml-simple-perl: Upgrade to 2.20
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
X-List-Received-Date: Sun, 24 Jun 2012 18:14:36 -0000

Change license file to LICENSE, which now contails both
Artistic-1.0 and GPL-1.0 License text

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...ple-perl_2.18.bb => libxml-simple-perl_2.20.bb} |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/perl/{libxml-simple-perl_2.18.bb => libxml-simple-perl_2.20.bb} (58%)

diff --git a/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb b/meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb
similarity index 58%
rename from meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb
rename to meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb
index 1e22cdd..6434ff7 100644
--- a/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb
+++ b/meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb
@@ -1,13 +1,13 @@
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0"
-LIC_FILES_CHKSUM = "file://README;beginline=70;md5=94aa5d46682b411a53a5494cfb22640e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e7dbb3e2241fac8457967053fc1a1ddb"
 DEPENDS += "libxml-parser-perl"
-PR = "r5"
+PR = "r0"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Simple-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "593aa8001e5c301cdcdb4bb3b63abc33"
-SRC_URI[sha256sum] = "a54967c188cda3e20f496c83be4de3f1740eeaa83c0380712ecd969ad8766826"
+SRC_URI[md5sum] = "4d10964e123b76eca36678464daa63cd"
+SRC_URI[sha256sum] = "5cff13d0802792da1eb45895ce1be461903d98ec97c9c953bc8406af7294434a"
 
 S = "${WORKDIR}/XML-Simple-${PV}"
 
-- 
1.7.7.6



