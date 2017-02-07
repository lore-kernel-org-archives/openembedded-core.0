Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B2A1571A36
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 19:12:39 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP; 07 Feb 2017 11:12:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="62973834"
Received: from gowdasan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.169.208])
	by fmsmga006.fm.intel.com with ESMTP; 07 Feb 2017 11:12:38 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2017 08:12:29 +1300
Message-Id: <9dc16cd420bc79d688d2798c4396e3ccb4f0a80a.1486494725.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1486494725.git.paul.eggleton@linux.intel.com>
References: <cover.1486494725.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/copyleft_filter: include AGPL in default included list
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
X-List-Received-Date: Tue, 07 Feb 2017 19:12:39 -0000

If we're including all GPL licenses then we should include AGPL in
the default COPYLEFT_LICENSE_INCLUDE since it has similar terms (and
currently we do have one AGPL-licensed recipe in OE-Core, namely db).

(Note that the default list isn't meant to be a guaranteed complete
safe list - seek legal advice based on what you're distributing if
unsure.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/copyleft_filter.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/copyleft_filter.bbclass b/meta/classes/copyleft_filter.bbclass
index 426956f..5867bb9 100644
--- a/meta/classes/copyleft_filter.bbclass
+++ b/meta/classes/copyleft_filter.bbclass
@@ -6,7 +6,7 @@
 #
 # vi:sts=4:sw=4:et
 
-COPYLEFT_LICENSE_INCLUDE ?= 'GPL* LGPL*'
+COPYLEFT_LICENSE_INCLUDE ?= 'GPL* LGPL* AGPL*'
 COPYLEFT_LICENSE_INCLUDE[type] = 'list'
 COPYLEFT_LICENSE_INCLUDE[doc] = 'Space separated list of globs which include licenses'
 
-- 
2.9.3


