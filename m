Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B78FE7002B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Dec 2015 02:43:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Dec 2015 18:43:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,378,1444719600"; d="scan'208";a="833968230"
Received: from cquah-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.135.68])
	by orsmga001.jf.intel.com with ESMTP; 03 Dec 2015 18:43:13 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Dec 2015 15:42:49 +1300
Message-Id: <cover.1449196843.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH 0/1] Fix for buildtools install regression
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
X-List-Received-Date: Fri, 04 Dec 2015 02:43:16 -0000

The following changes since commit 687e5ef86361a16d6c411386939d4ba96a5909ea:

  libsdl: remove redundant configure_tweak patch (2015-12-01 21:31:04 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/sdk-env-fix2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/sdk-env-fix2

Paul Eggleton (1):
  toolchain-shar-extract.sh: proper fix for additional env setup scripts

 meta/files/toolchain-shar-extract.sh  | 11 +++++++++++
 meta/files/toolchain-shar-relocate.sh |  2 --
 2 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.5.0


