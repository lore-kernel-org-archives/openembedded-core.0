Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PyDSD-0006fq-8r
	for openembedded-core@lists.openembedded.org;
	Sat, 12 Mar 2011 02:17:13 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Mar 2011 17:15:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,306,1297065600"; d="scan'208";a="719311020"
Received: from unknown (HELO localhost) ([10.255.12.195])
	by orsmga001.jf.intel.com with ESMTP; 11 Mar 2011 17:15:29 -0800
Message-Id: <950d36603b0b0cbb3ca58f2cb3abe0a3bd6e2bb4.1299891748.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299891748.git.sgw@linux.intel.com>
References: <cover.1299891748.git.sgw@linux.intel.com>
Old-Date: Fri, 11 Mar 2011 17:00:38 -0800
Date: Fri, 11 Mar 2011 17:15:28 -0800
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 1/1] gnu-config: Ensure that we use perl-native to avoid version mis-matches
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
X-List-Received-Date: Sat, 12 Mar 2011 01:17:13 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gnu-config/gnu-config_20080123.bb              |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb b/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb
index 2629ecb..af34cee 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb
@@ -26,9 +26,7 @@ do_install () {
 		sed -e 's,@gnu-configdir@,${datadir}/gnu-config,g' \
 		    -e 's,@autom4te_perllibdir@,${datadir}/autoconf,g' > ${D}${bindir}/gnu-configize
 	# In the native case we want the system perl as perl-native can't have built yet
-	if [ "${BUILD_ARCH}" != "${TARGET_ARCH}" ]; then
-		sed -i -e 's,/usr/bin/perl,${bindir}/perl,g' ${D}${bindir}/gnu-configize
-	fi
+	sed -i -e 's,/usr/bin/perl,${bindir}/perl,g' ${D}${bindir}/gnu-configize
 	chmod 755 ${D}${bindir}/gnu-configize
 	install -m 0644 config.guess config.sub ${D}${datadir}/gnu-config/
 }
-- 
1.7.1



