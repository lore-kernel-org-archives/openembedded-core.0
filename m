Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0877A73E11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 13:34:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 19 Aug 2015 06:34:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,710,1432623600"; d="scan'208";a="787060584"
Received: from mclawlor-mobl5.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.12.193])
	by orsmga002.jf.intel.com with ESMTP; 19 Aug 2015 06:34:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Aug 2015 14:34:44 +0100
Message-Id: <cover.1439991144.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [RFC PATCH 0/1] Add recipe whitelisting class
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
X-List-Received-Date: Wed, 19 Aug 2015 13:34:52 -0000

This adds a class to allow whitelisting recipes from one or more layers,
working in a similar manner to blacklist.bbclass. Let me know if you
think this looks reasonable, in particular the naming and usage of the
variables (which by necessity has to be different than blacklist.bbclass).


Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

The following changes since commit 059db140885bad379534e6ec713f3ceb4e18faea:

  adt-installer: use DEPLOY_DIR in ANT_DEPLOY expansion (2015-08-16 17:28:14 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/whitelist
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/whitelist

Paul Eggleton (1):
  classes/whitelist: add class to allow whitelisting recipes from a
    layer

 meta/classes/whitelist.bbclass | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta/classes/whitelist.bbclass

-- 
2.1.0


