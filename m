Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 94FDE73C8C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 16:19:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 May 2015 09:19:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,380,1427785200"; d="scan'208";a="706182345"
Received: from jashore-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.3.219])
	by fmsmga001.fm.intel.com with ESMTP; 06 May 2015 09:19:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 May 2015 17:19:24 +0100
Message-Id: <cover.1430929064.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/3] Cleanups for buildstats.bbclass
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
X-List-Received-Date: Wed, 06 May 2015 16:19:38 -0000

The following changes since commit 4563788a21fb1715920cd5056b43d85c69563c32:

  connman: upgrade to 1.29 (2015-05-05 22:14:10 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/buildstats
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildstats

Paul Eggleton (3):
  classes/buildstats: whitespace cleanup
  classes/buildstats: don't catch all errors from mkdirhier
  classes/buildstats: misc cleanups

 meta/classes/buildstats.bbclass | 215 ++++++++++++++++++----------------------
 1 file changed, 98 insertions(+), 117 deletions(-)

-- 
2.1.0


