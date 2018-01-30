Return-Path: <juro.bystricky@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0B9F160778
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 16:50:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jan 2018 08:50:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,435,1511856000"; d="scan'208";a="13738285"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga007.jf.intel.com with ESMTP; 30 Jan 2018 08:50:55 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jan 2018 08:51:10 -0800
Message-Id: <1517331070-68463-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] sanity.bbclass: modified error message
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
X-List-Received-Date: Tue, 30 Jan 2018 16:50:54 -0000

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index d0f507e0..6716985 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -709,7 +709,7 @@ def sanity_check_locale(d):
     try:
         locale.setlocale(locale.LC_ALL, "en_US.UTF-8")
     except locale.Error:
-        raise_sanity_error("You system needs to support the en_US.UTF-8 locale.", d)
+        raise_sanity_error("Your system needs to support the en_US.UTF-8 locale.", d)
 
 def check_sanity_everybuild(status, d):
     import os, stat
-- 
2.7.4


