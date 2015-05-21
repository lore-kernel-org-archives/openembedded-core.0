Return-Path: <ismo.puustinen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 04176607BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 08:22:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 21 May 2015 01:22:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,467,1427785200"; d="scan'208";a="729483718"
Received: from ipuustin-mobl.ger.corp.intel.com (HELO
	ipuustin-mobl.fi.intel.com) ([10.237.68.151])
	by fmsmga002.fm.intel.com with ESMTP; 21 May 2015 01:22:12 -0700
From: Ismo Puustinen <ismo.puustinen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2015 11:21:33 +0300
Message-Id: <1432196500-13462-5-git-send-email-ismo.puustinen@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1432196500-13462-1-git-send-email-ismo.puustinen@intel.com>
References: <1432196500-13462-1-git-send-email-ismo.puustinen@intel.com>
Subject: [PATCH 04/11] foomatic-filters: escape quotes inside variable values.
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
X-List-Received-Date: Thu, 21 May 2015 08:22:12 -0000

---
 meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb b/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
index 790c981..db7ea35 100644
--- a/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
+++ b/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
@@ -1,7 +1,7 @@
 SUMMARY = "OpenPrinting printer support - filters"
 DESCRIPTION = "Foomatic is a printer database designed to make it easier to set up \
 common printers for use with UNIX-like operating systems.\
-It provides the "glue" between a print spooler (like CUPS or lpr) and \
+It provides the \"glue\" between a print spooler (like CUPS or lpr) and \
 the printer, by processing files sent to the printer. \
  \
 This package consists of filters used by the printer spoolers \
-- 
2.1.0


