Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9540561983
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 15:24:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2020 07:24:16 -0800
X-IronPort-AV: E=Sophos;i="5.70,496,1574150400"; d="scan'208";a="232272080"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES256-SHA256;
	28 Feb 2020 07:24:14 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 23:23:33 +0800
Message-Id: <c95832dbfe4f375dadbffc8ee678052dbf7b3913.1582902875.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1582902875.git.anuj.mittal@intel.com>
References: <cover.1582902875.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1582902875.git.anuj.mittal@intel.com>
References: <cover.1582902875.git.anuj.mittal@intel.com>
Subject: [zeus][PATCH 09/22] perl: install typemap and other extutils metadata as part of perl-core
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
X-List-Received-Date: Fri, 28 Feb 2020 15:24:14 -0000

From: Alexander Kanavin <alex.kanavin@gmail.com>

Modules actually make use of these files, so they belong in perl-core
other than perl-doc (the immediate failure was ptests for
libmodule-build-perl failing).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 829e8c49833e4cb8de5db869769eb492c827e8c9)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/perl/perl_5.30.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
index c79a725..c68ffb1 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -210,6 +210,9 @@ FILES_${PN} = "${bindir}/perl ${bindir}/perl.real ${bindir}/perl${PV} ${libdir}/
                ${libdir}/perl5/${PV}/warnings \
                ${libdir}/perl5/${PV}/vars.pm \
                ${libdir}/perl5/site_perl \
+               ${libdir}/perl5/${PV}/ExtUtils/MANIFEST.SKIP \
+               ${libdir}/perl5/${PV}/ExtUtils/xsubpp \
+               ${libdir}/perl5/${PV}/ExtUtils/typemap \
                "
 RPROVIDES_${PN} += "perl-module-strict perl-module-vars perl-module-config perl-module-warnings \
                     perl-module-warnings-register"
@@ -220,9 +223,6 @@ FILES_${PN}-dev_append = " ${libdir}/perl5/${PV}/*/CORE"
 
 FILES_${PN}-doc_append = " ${libdir}/perl5/${PV}/Unicode/Collate/*.txt \
                            ${libdir}/perl5/${PV}/*/.packlist \
-                           ${libdir}/perl5/${PV}/ExtUtils/MANIFEST.SKIP \
-                           ${libdir}/perl5/${PV}/ExtUtils/xsubpp \
-                           ${libdir}/perl5/${PV}/ExtUtils/typemap \
                            ${libdir}/perl5/${PV}/Encode/encode.h \
                          "
 PACKAGES += "${PN}-misc"
-- 
2.7.4


