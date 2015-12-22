Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 17D906FFCC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 02:41:50 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 21 Dec 2015 18:41:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="712450045"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by orsmga003.jf.intel.com with ESMTP; 21 Dec 2015 18:41:49 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 15:41:26 +1300
Message-Id: <cover.1450751834.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/2] SDK-related fixes for buildhistory
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
X-List-Received-Date: Tue, 22 Dec 2015 02:41:51 -0000

Fix a general regression in recording SDK information that happened
during the jethro timeframe, and improve what we record for the
extensible SDK.


The following changes since commit 2a1edfd9cfa16ec334c0758b47677d4fee5e79a8:

  bitbake.conf: Add filename and lineno to BB_SIGNATURE_EXCLUDE_FLAGS (2015-12-22 00:01:31 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-sdk-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-sdk-fix

Paul Eggleton (2):
  buildhistory: fix not recording SDK information
  buildhistory: improve support for extensible SDK

 meta/classes/buildhistory.bbclass     | 41 ++++++++++++++++++++++++++++++++---
 meta/classes/populate_sdk_ext.bbclass |  3 +++
 2 files changed, 41 insertions(+), 3 deletions(-)

-- 
2.5.0


