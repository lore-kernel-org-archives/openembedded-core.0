Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1F0B26F57A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 16:57:01 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Mar 2014 08:57:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,578,1389772800"; d="scan'208";a="484921396"
Received: from dmilliga-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.25])
	by fmsmga001.fm.intel.com with ESMTP; 03 Mar 2014 08:57:00 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Mar 2014 16:56:49 +0000
Message-Id: <cover.1393865774.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH 0/2] Buildhistory rebuilds fix
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
X-List-Received-Date: Mon, 03 Mar 2014 16:57:02 -0000

The following changes since commit 82c773e88aaefd9321481ad297554d5b4a3ae0b2:

  Revert "ncurses: use ln -r to generate relative symlink" (2014-03-03 15:52:26 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-deps2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-deps2

Paul Eggleton (2):
  bitbake.conf: add new vardepvalueexclude varflag to
    BB_SIGNATURE_EXCLUDE_FLAGS
  classes/buildhistory: fix task signatures changing

 meta/classes/buildhistory.bbclass | 6 ++++--
 meta/conf/bitbake.conf            | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
1.8.5.3


