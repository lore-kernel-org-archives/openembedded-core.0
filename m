Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1RsHtV-0002Bz-Oy
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 18:53:25 +0100
Received: by mail-iy0-f175.google.com with SMTP id y12so316610iab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2012 09:45:33 -0800 (PST)
Received: by 10.42.65.143 with SMTP id l15mr11733225ici.34.1328031933782;
	Tue, 31 Jan 2012 09:45:33 -0800 (PST)
Received: from quadra.sakoman.net
	(static-74-41-60-154.dsl1.pco.ca.frontiernet.net. [74.41.60.154])
	by mx.google.com with ESMTPS id k3sm3697062igq.1.2012.01.31.09.45.32
	(version=SSLv3 cipher=OTHER); Tue, 31 Jan 2012 09:45:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2012 09:45:18 -0800
Message-Id: <1328031918-23871-4-git-send-email-steve@sakoman.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1328031918-23871-1-git-send-email-steve@sakoman.com>
References: <1328031918-23871-1-git-send-email-steve@sakoman.com>
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH v5 3/3] libzypp: add missing runtime dependences on gzip and gnupg
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
X-List-Received-Date: Tue, 31 Jan 2012 17:53:26 -0000

gzip is required to uncompress repository files
gnupg is required for the support of signed repositories.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/libzypp/libzypp_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libzypp/libzypp_git.bb b/meta/recipes-extended/libzypp/libzypp_git.bb
index f494f1b..368cc06 100644
--- a/meta/recipes-extended/libzypp/libzypp_git.bb
+++ b/meta/recipes-extended/libzypp/libzypp_git.bb
@@ -11,7 +11,7 @@ DEPENDS  = "rpm boost curl libxml2 zlib sat-solver expat openssl udev"
 S = "${WORKDIR}/git"
 SRCREV = "15b6c52260bbc52b3d8e585e271b67e10cc7c433"
 PV = "0.0-git${SRCPV}"
-PR = "r17"
+PR = "r18"
 
 SRC_URI = "git://github.com/openSUSE/libzypp.git;protocol=git \
            file://no-doc.patch \
@@ -30,7 +30,7 @@ SRC_URI_append_mips = " file://mips-workaround-gcc-tribool-error.patch"
 SRC_URI_append_arm  = " file://arm-workaround-global-constructor.patch"
 
 # rpmdb2solv from sat-solver is run from libzypp
-RDEPENDS_${PN} = "sat-solver rpm-libs"
+RDEPENDS_${PN} = "sat-solver rpm-libs gzip gnupg"
 
 PACKAGES =+ "${PN}-pkgmgt"
 
-- 
1.7.1



