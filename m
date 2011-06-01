Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QRlYq-0007cQ-O4
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 15:34:12 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 Jun 2011 06:19:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,303,1304319600"; 
   d="scan'208";a="7836804"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by orsmga001.jf.intel.com with ESMTP; 01 Jun 2011 06:19:25 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2011 21:18:45 +0800
Message-Id: <eb438268c0325e4a2dd375bbc97bd6f3211aa9a0.1306931849.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <cover.1306931844.git.dexuan.cui@intel.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1306931844.git.dexuan.cui@intel.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
Subject: [RFC v1 PATCH 14/16] libconvert-asn1-perl: fix EXTRA_PERLFLAGS due to the perl-native change
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
X-List-Received-Date: Wed, 01 Jun 2011 13:34:13 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../perl/libconvert-asn1-perl_0.22.bb              |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.22.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.22.bb
index e3edc18..fc77b75 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.22.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.22.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Convert::ASN1 - ASN.1 Encode/Decode library"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 LIC_FILES_CHKSUM = "file://README;beginline=10;endline=12;md5=a64b291b13ffddeef33b14f047ee8b26"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/Convert-ASN1-${PV}.tar.gz"
 
@@ -13,7 +13,7 @@ S = "${WORKDIR}/Convert-ASN1-${PV}"
 
 inherit cpan
 
-EXTRA_PERLFLAGS = "-I ${STAGING_LIBDIR_NATIVE}/perl/${@get_perl_version(d)}"
+EXTRA_PERLFLAGS = "-I ${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}"
 
 BBCLASSEXTEND="native"
 
-- 
1.7.2



