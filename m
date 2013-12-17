Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id F085C60CDD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 14:56:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 17 Dec 2013 06:56:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,501,1384329600"; d="scan'208";a="445686089"
Received: from paulonei-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.28])
	by fmsmga001.fm.intel.com with ESMTP; 17 Dec 2013 06:56:42 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Dec 2013 14:56:20 +0000
Message-Id: <cover.1387292119.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/1] Add contrib script to find dependency chains
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
X-List-Received-Date: Tue, 17 Dec 2013 14:56:43 -0000

The following changes since commit b226ab4cf7779f4dfaa78210cb6249766ed564c1:

  insane: handle recursive configures when checking for unknown configure options (2013-12-16 12:12:40 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/graph-tool
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/graph-tool

Paul Eggleton (1):
  scripts/contrib: Add graph-tool

 scripts/contrib/graph-tool | 92 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100755 scripts/contrib/graph-tool

-- 
1.8.1.2


