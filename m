Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 066B874C83
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 13:40:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 06:40:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,406,1517904000"; d="scan'208";a="217573577"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 04 Apr 2018 06:40:21 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 7F80F5801FC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 06:40:20 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 16:40:34 +0300
Message-Id: <1522849238-7472-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/5] documentation.conf: remove obsolete variable
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
X-List-Received-Date: Wed, 04 Apr 2018 13:40:21 -0000

PRINC is no longer used and removed from documentation:

commit 7baadd86ee1386756e3bc3ef7fd02d5d1367068f
Author: Scott Rifenbark <scott.m.rifenbark@intel.com>
Date:   Mon May 18 09:25:51 2015 -0600

 ref-manual: Removed PRINC entry from the glossary

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/conf/documentation.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 7834898..254f8f1 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -332,7 +332,6 @@ PR[doc] = "The revision of the recipe. The default value for this variable is 'r
 PREFERRED_PROVIDER[doc] = "If multiple recipes provide an item, this variable determines which recipe should be given preference."
 PREFERRED_VERSION[doc] = "If there are multiple versions of recipes available, this variable determines which recipe should be given preference."
 PREMIRRORS[doc] = "Specifies additional paths from which the OpenEmbedded build system gets source code."
-PRINC[doc] = "Causes the PR variable of .bbappend files to dynamically increment. This increment minimizes the impact of layer ordering. This variable defaults to '0'."
 PRIORITY[doc] = "Indicates the importance of a package.  The default value is 'optional'.  Other standard values are 'required', 'standard' and 'extra'."
 PROVIDES[doc] = "A list of aliases that a recipe also provides. These aliases are useful for satisfying dependencies of other recipes during the build as specified by DEPENDS."
 PRSERV_HOST[doc] = "The network based PR service host and port."
-- 
2.4.0


