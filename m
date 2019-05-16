Return-Path: <timothy.t.orling@linux.intel.com>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 16 May 2019 00:36:28 UTC
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 252357D771
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 00:36:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2019 17:29:23 -0700
X-ExtLoop1: 1
Received: from chiron.jf.intel.com ([10.54.74.38])
	by fmsmga008.fm.intel.com with ESMTP; 15 May 2019 17:29:23 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 May 2019 17:29:19 -0700
Message-Id: <20190516002919.54583-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] libtest-needs-perl: upgrade 0.002005 -> 0.002006
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
X-List-Received-Date: Thu, 16 May 2019 00:36:28 -0000
Content-Transfer-Encoding: 8bit

Change SRC_URI to https://cpan.metacpan.org

License-Update: Lines moved further down in README.

Upstream release notes:
0.002006 - 2019-04-04
  - added additional references to related modules in pod
  - various internal cleanups
  - fix backwards compatibility with earlier versions of version.pm
  - fix output from test script when tests fail
  - added note about RELEASE_TESTING to test message on forced failures

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...ds-perl_0.002005.bb => libtest-needs-perl_0.002006.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/perl/{libtest-needs-perl_0.002005.bb => libtest-needs-perl_0.002006.bb} (72%)

diff --git a/meta/recipes-devtools/perl/libtest-needs-perl_0.002005.bb b/meta/recipes-devtools/perl/libtest-needs-perl_0.002006.bb
similarity index 72%
rename from meta/recipes-devtools/perl/libtest-needs-perl_0.002005.bb
rename to meta/recipes-devtools/perl/libtest-needs-perl_0.002006.bb
index e5ab7a33c7..3abb9aa8e4 100644
--- a/meta/recipes-devtools/perl/libtest-needs-perl_0.002005.bb
+++ b/meta/recipes-devtools/perl/libtest-needs-perl_0.002006.bb
@@ -11,14 +11,14 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 CPAN_NAME = "Test-Needs"
 CPAN_AUTHOR = "HAARG"
 
-LIC_FILES_CHKSUM = "file://README;md5=3f3ccd21a0a48aa313db212cc3b1bc09;beginline=81;endline=82"
+LIC_FILES_CHKSUM = "file://README;md5=3f3ccd21a0a48aa313db212cc3b1bc09;beginline=88;endline=89"
 
 DEPENDS += "perl"
 
-SRC_URI = "http://www.cpan.org/authors/id/H/HA/${CPAN_AUTHOR}/${CPAN_NAME}-${PV}.tar.gz"
+SRC_URI = "https://cpan.metacpan.org/authors/id/H/HA/${CPAN_AUTHOR}/${CPAN_NAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "356634a56c99282e8059f290f5d534c8"
-SRC_URI[sha256sum] = "5a4f33983586edacdbe00a3b429a9834190140190dab28d0f873c394eb7df399"
+SRC_URI[md5sum] = "d5c96d51d8d5510f7c0b7f354c49af1c"
+SRC_URI[sha256sum] = "77f9fff0c96c5e09f34d0416b3533c3319f7cd0bb1f7fe8f8072ad59f433f0e5"
 
 S = "${WORKDIR}/${CPAN_NAME}-${PV}"
 
-- 
2.20.1


