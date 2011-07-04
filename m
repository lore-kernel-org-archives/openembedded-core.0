Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QdfM7-0003VP-5d
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 11:22:15 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Mon, 4 Jul 2011
	11:18:26 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jul 2011 11:18:21 +0200
Message-ID: <1309771101-19524-1-git-send-email-anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH] resolvconf: update to version 1.58.
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
X-List-Received-Date: Mon, 04 Jul 2011 09:22:15 -0000
Content-Type: text/plain

The old version has become unavailable from the download site.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 .../{resolvconf_1.48.bb => resolvconf_1.58.bb}     |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.48.bb => resolvconf_1.58.bb} (87%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.48.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.58.bb
similarity index 87%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.48.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.58.bb
index 507a233..46040a0 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.48.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.58.bb
@@ -11,13 +11,12 @@ AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
 DEPENDS = "bash"
 RDEPENDS_${PN} = "bash"
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.gz"
 
-SRC_URI[md5sum] = "b226e02704a545238eac5ef70f6d3c4c"
-SRC_URI[sha256sum] = "4b07832680b82d401a76132cd6bbe13961231235287f2662a6604edbcac82bb1"
-
+SRC_URI[md5sum] = "6232b336e6bb05282791b5506bbbfa42"
+SRC_URI[sha256sum] = "853016a2ef16a8fdd6d1e29ac94bc6391199033235aa8e3b373345979c617431"
 
 do_compile () {
 	:
-- 
1.7.4.1



