Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 40B0060043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 12:37:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 27 Aug 2015 05:37:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,422,1437462000"; d="scan'208";a="791975271"
Received: from djcarton-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.50])
	by orsmga002.jf.intel.com with ESMTP; 27 Aug 2015 05:37:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2015 13:36:52 +0100
Message-Id: <cover.1440678731.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH v2 0/1] Add recipe whitelisting class
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
X-List-Received-Date: Thu, 27 Aug 2015 12:37:43 -0000

Changes since the RFC version:
* Check BPN in addition to PN for matching, to make it easier in the
  multilib case
* Use PNWHITELIST_LAYERS to specify which layers to apply whitelisting to,
  and consider an empty whitelist value to be no recipes whitelisted (so
  you can set up empty whitelists for layers not yet in your
  configuration if you wish to do so). This also makes setting
  PNWHITELIST without an override practical.
* Touch up the comments

The following changes since commit f07045fcae859c902434062d1725f1348f42d1dd:

  oeqa/oetest.py: add better package search for hasPackage() (2015-08-26 08:26:37 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/whitelist
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/whitelist

Paul Eggleton (1):
  classes/whitelist: add class to allow whitelisting recipes from a
    layer

 meta/classes/whitelist.bbclass | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta/classes/whitelist.bbclass

-- 
2.1.0


