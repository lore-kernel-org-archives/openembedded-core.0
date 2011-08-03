Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QodKF-0008QM-5e
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:25:39 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Aug 2011 08:21:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,310,1309762800"; d="scan'208";a="33901144"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga002.jf.intel.com with ESMTP; 03 Aug 2011 08:21:14 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 23:19:34 +0800
Message-Id: <d3516ab9dcace89460188c32b8a3c07a74a94224.1312384552.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1312384552.git.dongxiao.xu@intel.com>
References: <cover.1312384552.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1312384552.git.dongxiao.xu@intel.com>
References: <cover.1312384552.git.dongxiao.xu@intel.com>
Subject: [PATCH 2/7] libxml-simple-perl: Use BBCLASSEXTEND insteand of *-native recipe
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
X-List-Received-Date: Wed, 03 Aug 2011 15:25:39 -0000

It's not appropriate to require xxx.bb in xxx-native.bb, causing that
xxx-native depends on target recipe.

Use BBCLASSEXTEND to solve this issue.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../perl/libxml-simple-perl-native_2.18.bb         |    7 -------
 .../perl/libxml-simple-perl_2.18.bb                |    2 ++
 2 files changed, 2 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/libxml-simple-perl-native_2.18.bb

diff --git a/meta/recipes-devtools/perl/libxml-simple-perl-native_2.18.bb b/meta/recipes-devtools/perl/libxml-simple-perl-native_2.18.bb
deleted file mode 100644
index 3877d0b..0000000
--- a/meta/recipes-devtools/perl/libxml-simple-perl-native_2.18.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-SECTION = "libs"
-
-inherit native
-
-require libxml-simple-perl_${PV}.bb
-
-DEPENDS += "libxml-parser-perl-native"
diff --git a/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb b/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb
index 3a50d7f..f2abf9d 100644
--- a/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb
+++ b/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb
@@ -14,3 +14,5 @@ S = "${WORKDIR}/XML-Simple-${PV}"
 EXTRA_PERLFLAGS = "-I ${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}"
 
 inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
1.7.1



