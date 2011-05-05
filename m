Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QI0AY-0002VU-Eb
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 17:08:46 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QI07z-0005e8-Vp from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 08:06:08 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 5 May 2011 08:06:07 -0700
Received: from localhost.localdomain ([172.30.0.24]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 5 May 2011 09:06:06 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 May 2011 08:05:55 -0700
Message-Id: <8cb083230806f7c3584bd0adbffb8644506089c9.1304607797.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1304607797.git.tom_rini@mentor.com>
References: <cover.1304607797.git.tom_rini@mentor.com>
X-OriginalArrivalTime: 05 May 2011 15:06:06.0843 (UTC)
	FILETIME=[F597A4B0:01CC0B35]
Subject: [PATCH 3/4] sysstat.inc: Switch to inherit gettext
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
X-List-Received-Date: Thu, 05 May 2011 15:08:46 -0000

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
1.7.0.4



