Return-Path: <ismo.puustinen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5AEB67405B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 08:22:14 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 21 May 2015 01:22:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,467,1427785200"; d="scan'208";a="729483764"
Received: from ipuustin-mobl.ger.corp.intel.com (HELO
	ipuustin-mobl.fi.intel.com) ([10.237.68.151])
	by fmsmga002.fm.intel.com with ESMTP; 21 May 2015 01:22:16 -0700
From: Ismo Puustinen <ismo.puustinen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2015 11:21:36 +0300
Message-Id: <1432196500-13462-8-git-send-email-ismo.puustinen@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1432196500-13462-1-git-send-email-ismo.puustinen@intel.com>
References: <1432196500-13462-1-git-send-email-ismo.puustinen@intel.com>
Subject: [PATCH 07/11] libclass-isa-perl: escape quotes inside variable values.
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
X-List-Received-Date: Thu, 21 May 2015 08:22:14 -0000

---
 meta/recipes-lsb4/perl/libclass-isa-perl_0.36.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-lsb4/perl/libclass-isa-perl_0.36.bb b/meta/recipes-lsb4/perl/libclass-isa-perl_0.36.bb
index f93841d..ea65cda 100644
--- a/meta/recipes-lsb4/perl/libclass-isa-perl_0.36.bb
+++ b/meta/recipes-lsb4/perl/libclass-isa-perl_0.36.bb
@@ -6,7 +6,7 @@ derived, via its @ISA, from one or more superclasses (as above).\
 \
 When, then, you call a method in that class ($fishstick->calories), Perl first searches\
 there for that method, but if it's not there, it goes searching in its superclasses, and\
-so on, in a depth-first (or maybe "height-first" is the word) search. In the above example,\
+so on, in a depth-first (or maybe \"height-first\" is the word) search. In the above example,\
 it'd first look in Food::Fish, then Food, then Matter, then Life::Fungus, then Life, then\
 Chemicals.\
 \
-- 
2.1.0


