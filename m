Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 4DFFF719CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 21:04:14 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 24 Nov 2016 13:04:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,543,1473145200"; d="scan'208";a="1090058342"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.149])
	by fmsmga002.fm.intel.com with ESMTP; 24 Nov 2016 13:04:15 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 15:06:03 -0600
Message-Id: <1480021564-12420-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH 1/2] perl: Fix ptest update hash of ExtUtils/Liblist/Kid.pm in customized.dat
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
X-List-Received-Date: Thu, 24 Nov 2016 21:04:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The perl ptest is failing due to a patch changes the file
ExtUtils/Liblist/Kid.pm and the customized.dat file wasn't updated.

[YOCTO #8656]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-devtools/perl/perl/perl-test-customized.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl/perl-test-customized.patch b/meta/recipes-devtools/perl/perl/perl-test-customized.patch
index 84b0b88..477be29 100644
--- a/meta/recipes-devtools/perl/perl/perl-test-customized.patch
+++ b/meta/recipes-devtools/perl/perl/perl-test-customized.patch
@@ -17,7 +17,7 @@ Index: perl-5.22.1/t/porting/customized.dat
  ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist.pm bef099988b15fb0b2a1f5ac48c01af1f7f36d329
 -ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm 8168e18f0e3ce3ece4bb7e7c72d57ec07c67c402
 -ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm 7115e97a53559cb3ec061dd6f7f344e522724c4a
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm a08ecf80c8f0a234243817713b2a5ab0dcae3c0a
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm 8c22e119b96d674f1f268a9c495bb4aa04e1100b
 +ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm 3d7abd674b15ed323f743594ef0bd09db76b1aee
  ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/Config.pm f8db8d4245bf0684b8210c811f50d7cfb1a27d78
  ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/FAQ.pod 757bffb47857521311f8f3bde43ebe165f8d5191
-- 
2.1.4


