Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AC0BD6FFCE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 09:40:42 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 24 Mar 2016 02:40:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,384,1455004800"; d="scan'208";a="72386626"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.171.221])
	by fmsmga004.fm.intel.com with ESMTP; 24 Mar 2016 02:40:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Mar 2016 22:40:08 +1300
Message-Id: <8e0ffbf34a0bafc81a79c6caa83e39b7620f8967.1458812385.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1458812385.git.paul.eggleton@linux.intel.com>
References: <cover.1458812385.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1458812385.git.paul.eggleton@linux.intel.com>
References: <cover.1458812385.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/sanity: use proper multi-line string literals
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
X-List-Received-Date: Thu, 24 Mar 2016 09:40:42 -0000

A python string literal isn't meant to be split over multiple lines
unless it is explicitly multi-line. Use three quotes to indicate that.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sanity.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index e72a007..d34605f 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -42,7 +42,7 @@ python oecore_update_localconf() {
     current_conf  = d.getVar('CONF_VERSION', True)
     conf_version =  d.getVar('LOCALCONF_VERSION', True)
 
-    failmsg = "Your version of local.conf was generated from an older/newer version of 
+    failmsg = """Your version of local.conf was generated from an older/newer version of 
 local.conf.sample and there have been updates made to this file. Please compare the two 
 files and merge any changes before continuing.
 
@@ -50,7 +50,7 @@ Matching the version numbers will remove this message.
 
 \"${SANITY_DIFF_TOOL} conf/local.conf ${SANITY_LOCALCONF_SAMPLE}\" 
 
-is a good way to visualise the changes."
+is a good way to visualise the changes."""
     failmsg = d.expand(failmsg)
 
     raise NotImplementedError(failmsg)
@@ -62,7 +62,7 @@ python oecore_update_siteconf() {
     current_sconf = d.getVar('SCONF_VERSION', True)
     sconf_version = d.getVar('SITE_CONF_VERSION', True)
 
-    failmsg = "Your version of site.conf was generated from an older version of 
+    failmsg = """Your version of site.conf was generated from an older version of 
 site.conf.sample and there have been updates made to this file. Please compare the two 
 files and merge any changes before continuing.
 
@@ -70,7 +70,7 @@ Matching the version numbers will remove this message.
 
 \"${SANITY_DIFF_TOOL} conf/site.conf ${SANITY_SITECONF_SAMPLE}\" 
 
-is a good way to visualise the changes."
+is a good way to visualise the changes."""
     failmsg = d.expand(failmsg)
 
     raise NotImplementedError(failmsg)
-- 
2.5.5


