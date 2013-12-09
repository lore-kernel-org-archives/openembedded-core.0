Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 37B436E24F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2013 19:07:01 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Dec 2013 11:03:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,859,1378882800"; d="scan'208";a="421821781"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.25])
	by orsmga001.jf.intel.com with ESMTP; 09 Dec 2013 11:06:59 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Dec 2013 19:06:53 +0000
Message-Id: <cover.1386615914.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/3] Toaster improvements (OE-Core part)
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
X-List-Received-Date: Mon, 09 Dec 2013 19:07:01 -0000

Note: this should be merged into OE-Core at the same time that the
corresponding changes to BitBake are merged.


The following changes since commit 9f69e00200cdbd5ba2e46a54f33c29797816e43f:

  runqemu: remove core-image-* whitelist (2013-12-09 18:01:39 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/toaster-oecore
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/toaster-oecore

Alexandru DAMIAN (3):
  toaster.bbclass: read layer information
  toaster.bbclass: read build stats
  toaster.bbclass: read package and image information

 meta/classes/toaster.bbclass | 230 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 213 insertions(+), 17 deletions(-)

-- 
1.8.1.2


