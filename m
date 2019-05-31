Return-Path: <timothy.t.orling@linux.intel.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 31 May 2019 18:39:44 UTC
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id D8C1A7E342
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 18:39:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 May 2019 11:32:38 -0700
X-ExtLoop1: 1
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga004.jf.intel.com with ESMTP; 31 May 2019 11:32:38 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 11:32:23 -0700
Message-Id: <20190531183225.7597-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] perl: install Config_git.pl
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
X-List-Received-Date: Fri, 31 May 2019 18:39:45 -0000
Content-Transfer-Encoding: 8bit

Config_git.pl is required for Test::Builder and other perl ptest
modules. It was packaged before the perl-sanity change, but
missed in the refactoring.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/perl-sanity/perl_5.28.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/perl-sanity/perl_5.28.2.bb b/meta/recipes-devtools/perl-sanity/perl_5.28.2.bb
index f175e87a12e..19555c1eba2 100644
--- a/meta/recipes-devtools/perl-sanity/perl_5.28.2.bb
+++ b/meta/recipes-devtools/perl-sanity/perl_5.28.2.bb
@@ -165,6 +165,7 @@ perl_package_preprocess () {
             ${PKGD}${libdir}/perl5/${PV}/Config.pm \
             ${PKGD}${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/Config.pm \
             ${PKGD}${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/Config.pod \
+	    ${PKGD}${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/Config_git.pl \
             ${PKGD}${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/Config_heavy.pl \
             ${PKGD}${libdir}/perl5/${PV}/ExtUtils/Liblist/Kid.pm \
             ${PKGD}${libdir}/perl5/${PV}/FileCache.pm \
@@ -177,6 +178,7 @@ require perl-ptest.inc
 FILES_${PN} = "${bindir}/perl ${bindir}/perl.real ${bindir}/perl${PV} ${libdir}/libperl.so* \
                ${libdir}/perl5/site_perl \
                ${libdir}/perl5/${PV}/Config.pm \
+	       ${libdir}/perl5/${PV}/*/Config_git.pl \
                ${libdir}/perl5/${PV}/*/Config_heavy-target.pl \
                ${libdir}/perl5/config.sh \
                ${libdir}/perl5/${PV}/strict.pm \
-- 
2.20.1


