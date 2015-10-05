Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0887565CBC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Oct 2015 12:49:55 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 05 Oct 2015 05:49:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,638,1437462000"; d="scan'208";a="574370989"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Oct 2015 05:49:56 -0700
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 96E7A6A4083;
	Mon,  5 Oct 2015 05:48:58 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Oct 2015 11:03:21 +0300
Message-Id: <1444032201-28178-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Cc: srifenbark@gmail.com
Subject: [PATCH] ref-manual: document the strace dependency for Swabber
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
X-List-Received-Date: Mon, 05 Oct 2015 12:49:58 -0000

image-swab class depends on "strace" package to be present in the Build
Host. Document that dependency.

[YOCTO #8439]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 documentation/ref-manual/ref-classes.xml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/ref-classes.xml b/documentation/ref-manual/ref-classes.xml
index d87c9ff..fdee92a 100644
--- a/documentation/ref-manual/ref-classes.xml
+++ b/documentation/ref-manual/ref-classes.xml
@@ -1363,7 +1363,8 @@
         tool in order to detect and log accesses to the host system during
         the OpenEmbedded build process.
         <note>
-            This class is currently unmaintained.
+            We need to install strace package in the build host as a
+            dependency for this tool.This class is currently unmaintained.
         </note>
     </para>
 </section>
-- 
2.4.0


