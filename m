Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1Rruw4-0001t2-OE
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 18:22:33 +0100
Received: by mail-pz0-f47.google.com with SMTP id f10so3111489dak.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 09:14:41 -0800 (PST)
Received: by 10.68.190.4 with SMTP id gm4mr42754746pbc.95.1327943681914;
	Mon, 30 Jan 2012 09:14:41 -0800 (PST)
Received: from quadra.sakoman.net
	(static-74-41-60-154.dsl1.pco.ca.frontiernet.net. [74.41.60.154])
	by mx.google.com with ESMTPS id z5sm48521910pbc.5.2012.01.30.09.14.39
	(version=SSLv3 cipher=OTHER); Mon, 30 Jan 2012 09:14:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2012 09:14:25 -0800
Message-Id: <1327943665-16402-4-git-send-email-steve@sakoman.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1327943665-16402-1-git-send-email-steve@sakoman.com>
References: <1327943665-16402-1-git-send-email-steve@sakoman.com>
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH v3 3/3] zypper: add missing runtime dependences on gzip and gnupg
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
X-List-Received-Date: Mon, 30 Jan 2012 17:22:33 -0000

gzip is required to uncompress repository files
gnupg is required for the support of signed repositories.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
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



