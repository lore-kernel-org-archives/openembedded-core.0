Return-Path: <timothy.t.orling@linux.intel.com>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 20 Nov 2019 05:27:20 UTC
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7B03E7F746
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 05:27:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Nov 2019 21:20:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,220,1571727600"; d="scan'208";a="204613831"
Received: from wrath.jf.intel.com ([10.54.31.24])
	by fmsmga008.fm.intel.com with ESMTP; 19 Nov 2019 21:20:10 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Nov 2019 21:20:02 -0800
Message-Id: <20191120052002.39643-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] liberror-perl: update 0.17027 -> 0.17028
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
X-List-Received-Date: Wed, 20 Nov 2019 05:27:20 -0000
Content-Transfer-Encoding: 8bit

HOMEPAGE change from bitbucket to github

Upstream release notes:
  - Moved the VCS repo to https://github.com/shlomif/perl-error.pm
  - No other significant changes.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../{liberror-perl_0.17027.bb => liberror-perl_0.17028.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/perl/{liberror-perl_0.17027.bb => liberror-perl_0.17028.bb} (85%)

diff --git a/meta/recipes-devtools/perl/liberror-perl_0.17027.bb b/meta/recipes-devtools/perl/liberror-perl_0.17028.bb
similarity index 85%
rename from meta/recipes-devtools/perl/liberror-perl_0.17027.bb
rename to meta/recipes-devtools/perl/liberror-perl_0.17028.bb
index cf1f6d685f..8c6bbcba94 100644
--- a/meta/recipes-devtools/perl/liberror-perl_0.17027.bb
+++ b/meta/recipes-devtools/perl/liberror-perl_0.17028.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "The Error package provides two interfaces. Firstly \
 Error provides a procedural interface to exception handling. \
 Secondly Error is a base class for errors/exceptions that can \
 either be thrown, for subsequent catch, or can simply be recorded."
-HOMEPAGE = "https://bitbucket.org/shlomif/perl-error.pm"
+HOMEPAGE = "https://github.com/shlomif/perl-error.pm"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 
@@ -32,8 +32,8 @@ RDEPENDS_${PN}-ptest += " \
 
 SRC_URI = "http://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/Error-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "4ef9b2890fb144d804527ba32573dd56"
-SRC_URI[sha256sum] = "07b2ac8275dfa04144745a6c1900a596280f862b97d22bab0c5ce02682ebd3be"
+SRC_URI[md5sum] = "ec3522c60a43a368f19c0f89e2205cb1"
+SRC_URI[sha256sum] = "3ad85c5e58b31c8903006298424a51bba39f1840e324f5ae612eabc8b935e960"
 
 S = "${WORKDIR}/Error-${PV}"
 
-- 
2.24.0


