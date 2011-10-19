Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RGRbO-0000oj-Rg
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 10:34:19 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Oct 2011 01:28:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="64658120"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by orsmga002.jf.intel.com with ESMTP; 19 Oct 2011 01:28:25 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2011 01:28:16 -0700
Message-Id: <b70acfd794e8ba200d25bb6c610eb6fe110323c8.1319012721.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1319012721.git.sgw@linux.intel.com>
References: <cover.1319012721.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319012721.git.sgw@linux.intel.com>
References: <cover.1319012721.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 13/16] libxml-parser-perl: upgrade from 2.40 to 2.41
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
X-List-Received-Date: Wed, 19 Oct 2011 08:34:19 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 ...ser-perl_2.40.bb => libxml-parser-perl_2.41.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/perl/{libxml-parser-perl_2.40.bb => libxml-parser-perl_2.41.bb} (82%)

diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.40.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
similarity index 82%
rename from meta/recipes-devtools/perl/libxml-parser-perl_2.40.bb
rename to meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
index 1d1593b..caf5704 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.40.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
@@ -5,11 +5,11 @@ LIC_FILES_CHKSUM = "file://README;beginline=2;endline=6;md5=c8767d7516229f07b26e
 
 DEPENDS += "expat expat-native"
 
-PR = "r4"
+PR = "r0"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}.tar.gz"
-SRC_URI[md5sum] = "c66e9adba003d0667cc40115ccd837a5"
-SRC_URI[sha256sum] = "e5e433684e799ef7b6b852c0ca31b71054717628555444d3dc9fceac0df71512"
+SRC_URI[md5sum] = "c320d2ffa459e6cdc6f9f59c1185855e"
+SRC_URI[sha256sum] = "b48197cd2265a26c5f016489f11a7b450d8833cb8b3d6a46ee15975740894de9"
 
 S = "${WORKDIR}/XML-Parser-${PV}"
 
-- 
1.7.6.2



