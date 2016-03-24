Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A549A606D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 09:40:40 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 24 Mar 2016 02:40:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,384,1455004800"; d="scan'208";a="72386609"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.171.221])
	by fmsmga004.fm.intel.com with ESMTP; 24 Mar 2016 02:40:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Mar 2016 22:40:07 +1300
Message-Id: <cover.1458812385.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/1] Fix incorrect string literal quoting
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
X-List-Received-Date: Thu, 24 Mar 2016 09:40:41 -0000

The following changes since commit 34e7292fb40635cee1f1237ac3156530f8dfce37:

  parselogs: add new whitelist entries to address 4.4.3 issues (2016-03-22 08:53:49 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/sanityfix1
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/sanityfix1

Paul Eggleton (1):
  classes/sanity: use proper multi-line string literals

 meta/classes/sanity.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.5.5


