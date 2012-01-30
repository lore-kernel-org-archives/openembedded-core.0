Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1Rrtoh-0008T9-9q
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 17:10:51 +0100
Received: by pbaa13 with SMTP id a13so3243648pba.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 08:02:57 -0800 (PST)
Received: by 10.68.116.144 with SMTP id jw16mr43020103pbb.28.1327939377442;
	Mon, 30 Jan 2012 08:02:57 -0800 (PST)
Received: from quadra.sakoman.net
	(static-74-41-60-154.dsl1.pco.ca.frontiernet.net. [74.41.60.154])
	by mx.google.com with ESMTPS id x8sm48079461pbr.11.2012.01.30.08.02.54
	(version=SSLv3 cipher=OTHER); Mon, 30 Jan 2012 08:02:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2012 08:02:19 -0800
Message-Id: <1327939339-14971-1-git-send-email-steve@sakoman.com>
X-Mailer: git-send-email 1.7.1
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH 4/4 v2] zypper: add missing runtime dependences on gzip and gnupg
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
X-List-Received-Date: Mon, 30 Jan 2012 16:10:52 -0000

gzip is required to uncompress repository files
gnupg is required for the support of signed repositories.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
This version incorporates feedback from Koen Kooi
 - adds runtime dependencies to existing RDEPENDS_${PN}
 
 meta/recipes-extended/zypper/zypper_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/zypper/zypper_git.bb b/meta/recipes-extended/zypper/zypper_git.bb
index e5963be..bb456fe 100644
--- a/meta/recipes-extended/zypper/zypper_git.bb
+++ b/meta/recipes-extended/zypper/zypper_git.bb
@@ -5,7 +5,7 @@ LICENSE  = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3201406e350b39e05a82e28b5020f413"
 
 DEPENDS  = "libzypp augeas"
-PR = "r1"
+PR = "r2"
 SRCREV = "2c5bb6ceb99ecd950ef993e43d77bf0569ea0582"
 
 inherit cmake
@@ -20,7 +20,7 @@ S = "${WORKDIR}/git"
 
 PV = "1.5.3-git${SRCPV}"
 
-RDEPENDS_${PN} = "rpm-libs"
+RDEPENDS_${PN} = "rpm-libs gzip gnupg"
 RRECOMMENDS_${PN} = "procps util-linux-uuidgen"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.1



