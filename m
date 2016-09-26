Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id BF7886FF80
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 13:34:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 26 Sep 2016 06:34:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,399,1470726000"; d="scan'208";a="1036622431"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 26 Sep 2016 06:34:53 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Sep 2016 16:34:49 +0300
Message-Id: <1474896889-3632-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1474896889-3632-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1474896889-3632-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/2] glibc-initial: use python3 instead of python (v2)
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
X-List-Received-Date: Mon, 26 Sep 2016 13:34:51 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-core/glibc/glibc-initial.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-initial.inc b/meta/recipes-core/glibc/glibc-initial.inc
index 0c8bd64..ec21f10 100644
--- a/meta/recipes-core/glibc/glibc-initial.inc
+++ b/meta/recipes-core/glibc/glibc-initial.inc
@@ -11,7 +11,7 @@ TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
 do_configure () {
 	(cd ${S} && gnu-configize) || die "failure in running gnu-configize"
 	find ${S} -name "configure" | xargs touch
-	cfgscript=`python -c "import os; print(os.path.relpath('${S}', '.'))"`/configure
+	cfgscript=`python3 -c "import os; print(os.path.relpath('${S}', '.'))"`/configure
 	$cfgscript --host=${TARGET_SYS} --build=${BUILD_SYS} \
 		--prefix=/usr \
 		--without-cvs --disable-sanity-checks \
-- 
2.6.6


