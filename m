Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJKUJ-0003lE-Uf
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 09:02:40 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 May 2011 23:59:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,339,1301900400"; d="scan'208";a="432782676"
Received: from unknown (HELO localhost) ([10.255.12.42])
	by azsmga001.ch.intel.com with ESMTP; 08 May 2011 23:59:55 -0700
Message-Id: <d7d9d5ec43a2f8c1f694432f004619e3e72ed5bf.1304924223.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304924223.git.sgw@linux.intel.com>
References: <cover.1304924223.git.sgw@linux.intel.com>
Old-Date: Wed, 4 May 2011 12:28:52 -0700
Date: Sun, 08 May 2011 23:59:54 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 17/20] sysstat.inc: Switch to inherit gettext
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
X-List-Received-Date: Mon, 09 May 2011 07:02:40 -0000

From: Tom Rini <tom_rini@mentor.com>

This needs to use both virtual/libnl as well as gettext-native in order
to build.  So we switch to using inherit gettext.

This is 4a022cf3fe3e39aab478bfc13332d358ed80348c from OE where it was tested
with qemuarm+angstrom-2010.x+eglibc and qemuarm+minimal-uclibc.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/recipes-extended/sysstat/sysstat.inc      |    4 +---
 meta/recipes-extended/sysstat/sysstat_9.1.5.bb |    2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index aeb33cf..a4cad0e 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -4,12 +4,10 @@ HOMEPAGE = "http://sebastien.godard.pagesperso-orange.fr/"
 LICENSE = "GPLv2+"
 SECTION = "console/utils"
 
-DEPENDS = "virtual/libintl"
-
 SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/sysstat-${PV}.tar.gz \
 		   file://99_sysstat"
 
-inherit autotools
+inherit autotools gettext
 
 do_install() {
 	autotools_do_install
diff --git a/meta/recipes-extended/sysstat/sysstat_9.1.5.bb b/meta/recipes-extended/sysstat/sysstat_9.1.5.bb
index a9071b3..49ac988 100644
--- a/meta/recipes-extended/sysstat/sysstat_9.1.5.bb
+++ b/meta/recipes-extended/sysstat/sysstat_9.1.5.bb
@@ -2,7 +2,7 @@ require sysstat.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-PR = "r0"
+PR = "r1"
 
 
 
-- 
1.7.1.1



