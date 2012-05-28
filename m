Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SZ3d4-0004Qk-Sp
	for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2012 19:21:15 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 May 2012 10:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157958455"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.22])
	by fmsmga001.fm.intel.com with ESMTP; 28 May 2012 10:10:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 May 2012 18:10:51 +0100
Message-Id: <7f4508aced87d4922b41414dc84012280c6ce5af.1338224754.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1338224754.git.paul.eggleton@linux.intel.com>
References: <cover.1338224754.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1338224754.git.paul.eggleton@linux.intel.com>
References: <cover.1338224754.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] classes/sanity: fix a couple of grammatical errors in messages
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
X-List-Received-Date: Mon, 28 May 2012 17:21:15 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sanity.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 8a09b6d..3ffb915 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -409,7 +409,7 @@ def check_sanity(sanity_data):
 
     if missing != "":
         missing = missing.rstrip(',')
-        messages = messages + "Please install following missing utilities: %s\n" % missing
+        messages = messages + "Please install the following missing utilities: %s\n" % missing
 
     pseudo_msg = check_pseudo_wrapper()
     if pseudo_msg != "":
@@ -431,7 +431,7 @@ def check_sanity(sanity_data):
 
     oes_bb_conf = sanity_data.getVar( 'OES_BITBAKE_CONF', True)
     if not oes_bb_conf:
-        messages = messages + 'You do not include OpenEmbeddeds version of conf/bitbake.conf. This means your environment is misconfigured, in particular check BBPATH.\n'
+        messages = messages + 'You do not include the OpenEmbedded version of conf/bitbake.conf. This means your environment is misconfigured, in particular check BBPATH.\n'
 
     nolibs = sanity_data.getVar('NO32LIBS', True)
     if not nolibs:
-- 
1.7.9.5



