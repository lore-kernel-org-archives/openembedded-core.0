Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QvcUK-0006yL-4a
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 23:56:56 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2011 14:52:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,265,1312182000"; d="scan'208";a="43970255"
Received: from unknown (HELO swold-MOBL.lan) ([10.255.13.234])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2011 14:52:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2011 14:51:50 -0700
Message-Id: <2ff37d4fda2207eb2ba99622aed8a244ec04a647.1314043945.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314043945.git.sgw@linux.intel.com>
References: <cover.1314043945.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314043945.git.sgw@linux.intel.com>
References: <cover.1314043945.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 05/19] libpcre: the generated libtool uses HOST_SYS
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
X-List-Received-Date: Mon, 22 Aug 2011 21:56:56 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/recipes-support/libpcre/libpcre_8.12.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre_8.12.bb b/meta/recipes-support/libpcre/libpcre_8.12.bb
index 2972c1a..54d1f98 100644
--- a/meta/recipes-support/libpcre/libpcre_8.12.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.12.bb
@@ -30,11 +30,11 @@ EXTRA_OECONF = " --with-link-size=2 --enable-newline-is-lf --with-match-limit=10
 do_compile () {
 	# stop libtool from trying to link with host libraries - fix from #33
 	# this resolve build problem on amd64 - #1015
-	if [ -e ${S}/${TARGET_SYS}-libtool ] ; then
-		sed -i 's:-L\$:-L${STAGING_LIBDIR} -L\$:' ${S}/${TARGET_SYS}-libtool
+	if [ -e ${S}/${HOST_SYS}-libtool ] ; then
+		sed -i 's:-L\$:-L${STAGING_LIBDIR} -L\$:' ${S}/${HOST_SYS}-libtool
 	else
-		ln -sf ${S}/libtool ${S}/${TARGET_SYS}-libtool
-		sed -i 's:-L\$:-L${STAGING_LIBDIR} -L\$:' ${S}/${TARGET_SYS}-libtool	
+		ln -sf ${S}/libtool ${S}/${HOST_SYS}-libtool
+		sed -i 's:-L\$:-L${STAGING_LIBDIR} -L\$:' ${S}/${HOST_SYS}-libtool
 	fi
 
 	# The generation of dftables can lead to timestamp problems with ccache
-- 
1.7.6



