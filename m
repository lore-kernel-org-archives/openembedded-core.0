Return-Path: <patrick@stwcx.xyz>
X-Greylist: delayed 906 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 07 Mar 2016 18:04:07 UTC
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
	[74.201.84.163])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF1560053
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 18:04:07 +0000 (UTC)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
	with SMTPS id 1457372937426834.323557610453;
	Mon, 7 Mar 2016 09:48:57 -0800 (PST)
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Mar 2016 11:48:49 -0600
Message-Id: <1457372929-10407-1-git-send-email-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_2_02036_7
X-ZohoMail-Owner: <1457372929-10407-1-git-send-email-patrick@stwcx.xyz>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 32.97.110.55
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH] siteinfo: Add ppc64le support.
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
X-List-Received-Date: Mon, 07 Mar 2016 18:04:09 -0000

From: Chris Austen <austenc@us.ibm.com>

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta/classes/siteinfo.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index b715b6c..1b3906c 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -42,6 +42,7 @@ def siteinfo_data(d):
         "powerpc64": "endian-big bit-64 powerpc-common",
         "ppc": "endian-big bit-32 powerpc-common",
         "ppc64": "endian-big bit-64 powerpc-common",
+        "ppc64le" : "endian-little bit-64 powerpc-common",
         "sh3": "endian-little bit-32 sh-common",
         "sh4": "endian-little bit-32 sh-common",
         "sparc": "endian-big bit-32",
-- 
2.6.3



