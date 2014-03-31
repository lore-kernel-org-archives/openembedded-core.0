Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 20C786E7D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 10:29:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 31 Mar 2014 03:29:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,764,1389772800"; d="scan'208";a="483892340"
Received: from williams-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.67])
	by orsmga001.jf.intel.com with ESMTP; 31 Mar 2014 03:29:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Mar 2014 11:29:35 +0100
Message-Id: <cover.1396261733.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH 0/1] Check if SDKMACHINE setting has taken effect
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
X-List-Received-Date: Mon, 31 Mar 2014 10:29:47 -0000

The following change since commit 2116e326d9d7039aac4ec6c7ae5d2a2bedfb4a74:

  linux-yocto/3.10: fix qemuarm build failure (2014-03-30 23:52:10 +0100)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/sdkmachine
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/sdkmachine

Paul Eggleton (1):
  classes/sanity: check if SDKMACHINE setting has taken effect

 meta/classes/sanity.bbclass | 2 ++
 1 file changed, 2 insertions(+)

-- 
1.9.0


