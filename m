Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 067D16FF9F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 13:34:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 26 Sep 2016 06:34:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,399,1470726000"; d="scan'208";a="1036622427"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 26 Sep 2016 06:34:52 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Sep 2016 16:34:48 +0300
Message-Id: <1474896889-3632-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1474896889-3632-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1474896889-3632-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 1/2] autotools.bbclass: use python3 instead of python (v2)
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
X-List-Received-Date: Mon, 26 Sep 2016 13:34:50 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/autotools.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index e5f527e..ecbba9f 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -85,7 +85,7 @@ AUTOTOOLS_AUXDIR ?= "${AUTOTOOLS_SCRIPT_PATH}"
 oe_runconf () {
 	# Use relative path to avoid buildpaths in files
 	cfgscript_name="`basename ${CONFIGURE_SCRIPT}`"
-	cfgscript=`python -c "import os; print(os.path.relpath(os.path.dirname('${CONFIGURE_SCRIPT}'), '.'))"`/$cfgscript_name
+	cfgscript=`python3 -c "import os; print(os.path.relpath(os.path.dirname('${CONFIGURE_SCRIPT}'), '.'))"`/$cfgscript_name
 	if [ -x "$cfgscript" ] ; then
 		bbnote "Running $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
 		if ! ${CACHED_CONFIGUREVARS} $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@"; then
-- 
2.6.6


