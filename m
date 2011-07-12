Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QgoKu-0002Be-IA
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 03:34:00 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2011 18:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,523,1304319600"; d="scan'208";a="26983693"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2011 18:29:59 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 12:02:41 -0700
Message-Id: <5fc1498aa6920e8d07e831d10ef1efd656fbfa8b.1310497097.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <af851424130d145cef560c4bfaf2ba88ea4c3da6.1310497097.git.nitin.a.kamble@intel.com>
References: <af851424130d145cef560c4bfaf2ba88ea4c3da6.1310497097.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1310497097.git.nitin.a.kamble@intel.com>
References: <cover.1310497097.git.nitin.a.kamble@intel.com>
Subject: [PATCH 5/5] glibc: fix false failure
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
X-List-Received-Date: Wed, 13 Jul 2011 01:34:00 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

do not just fail if grep does not match the locale name in the list

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-core/glibc/glibc.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index b16ebd3..57d693c 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -48,7 +48,7 @@ do_rig_locales() {
 		head -n 3 $INFILE > $OUTFILE
 		for i in ${LIMIT_BUILT_LOCALES}; do
 			echo 
-			grep $i $INFILE >> $OUTFILE
+			grep $i $INFILE >> $OUTFILE || true
 		done
 		head --lines=-1 $OUTFILE > $INFILE
 		tail --lines=1 $OUTFILE | sed 's#\\##' >> $INFILE
-- 
1.7.5.4



