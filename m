Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QWOcw-0001K6-Qu
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 10:05:35 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jun 2011 01:02:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,363,1304319600"; d="scan'208";a="14283877"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by orsmga001.jf.intel.com with ESMTP; 14 Jun 2011 01:02:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2011 01:01:17 -0700
Message-Id: <e853b7f2783abfdce6bad91d20471d3d4daa86c8.1308037753.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/51] perl-native: fix download url
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
X-List-Received-Date: Tue, 14 Jun 2011 08:05:35 -0000

From: Anders Darander <anders@chargestorm.se>

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-devtools/perl/perl-native_5.12.3.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-native_5.12.3.bb b/meta/recipes-devtools/perl/perl-native_5.12.3.bb
index cbb4e78..50fa1c9 100644
--- a/meta/recipes-devtools/perl/perl-native_5.12.3.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.12.3.bb
@@ -9,7 +9,7 @@ PR = "r2"
 LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
                     file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
 
-SRC_URI = "http://ftp.funet.fi/pub/CPAN/src/perl-${PV}.tar.gz \
+SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
            file://Configure-multilib.patch \
            file://perl-configpm-switch.patch \
            file://parallel_build_fix_1.patch \
-- 
1.7.3.4



