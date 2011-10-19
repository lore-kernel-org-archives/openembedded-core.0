Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RGRbN-0000ob-64
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 10:34:17 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Oct 2011 01:28:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="64658109"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by orsmga002.jf.intel.com with ESMTP; 19 Oct 2011 01:28:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2011 01:28:11 -0700
Message-Id: <bda30c4d20c660412eeedeb732da9e08f6deb3c0.1319012721.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1319012721.git.sgw@linux.intel.com>
References: <cover.1319012721.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319012721.git.sgw@linux.intel.com>
References: <cover.1319012721.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/16] insane.bbclass: print full path on invalid LICENSE_FILES_CHKSUM
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
X-List-Received-Date: Wed, 19 Oct 2011 08:34:18 -0000

From: Darren Hart <dvhart@linux.intel.com>

Currently only the basename is printed when os.path.isfile() returns a failure
for the license file. If the file is present, but in the wrong directory, this
can be non-obvious to debug. Use the full path instead.

Make a minor grammatical correction in the error message while we're at it.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/classes/insane.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index b861e85..017f7be 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -330,7 +330,7 @@ def package_qa_check_license(workdir, d):
         (type, host, path, user, pswd, parm) = bb.decodeurl(url)
         srclicfile = os.path.join(srcdir, path)
         if not os.path.isfile(srclicfile):
-            raise bb.build.FuncFailed( pn + ": LIC_FILES_CHKSUM points to invalid file: " + path)
+            raise bb.build.FuncFailed( pn + ": LIC_FILES_CHKSUM points to an invalid file: " + srclicfile)
 
         if 'md5' not in parm:
             bb.error(pn + ": md5 checksum is not specified for ", url)
-- 
1.7.6.2



