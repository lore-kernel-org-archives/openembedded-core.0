Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7EE856059F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 11:50:13 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id BDDAAB8B287; Tue,  6 Dec 2016 12:49:54 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 12:49:48 +0100
Message-Id: <1481024991-5882-31-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 30/33] dpkg: use correct path for perl libraries
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Dec 2016 11:50:13 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/dpkg/dpkg.inc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 414ee5b..1c404fc 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -1,21 +1,19 @@
 SUMMARY = "Package maintenance system from Debian"
 SECTION = "base"
 LICENSE = "GPLv2+"
-DEPENDS = "perl"
 DEPENDS_append_class-native = " bzip2-replacement-native"
 PROVIDES = "virtual/update-alternatives"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/dpkg/"
 
-inherit autotools gettext perlnative pkgconfig systemd
+inherit autotools cpan-base gettext perlnative pkgconfig systemd
 
 SYSTEMD_SERVICE_${PN} = "dpkg-configure.service"
 
 export PERL = "${bindir}/perl"
 PERL_class-native = "${STAGING_BINDIR_NATIVE}/perl-native/perl"
 
-export PERL_LIBDIR = "${libdir}/perl"
-PERL_LIBDIR_class-native = "${libdir}/perl-native/perl"
+export PERL_LIBDIR = "${PERLLIBDIRS}/${PERLVERSION}"
 
 PACKAGECONFIG ??= "bzip2 gzip start-stop-daemon update-alternatives"
 PACKAGECONFIG[bzip2] = "--with-bz2,--without-bz2,bzip2"
-- 
2.7.4


