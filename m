Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1FC6673286
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 11:51:03 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 29 Feb 2016 03:50:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,520,1449561600"; d="scan'208";a="913458251"
Received: from gtan23-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.165.53])
	by fmsmga001.fm.intel.com with ESMTP; 29 Feb 2016 03:50:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Mar 2016 00:50:52 +1300
Message-Id: <cover.1456746626.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/1] Extensible SDK PATH fix
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
X-List-Received-Date: Mon, 29 Feb 2016 11:51:05 -0000

The following changes since commit 390bad905537820f49add855c95d726b5b55c8fa:

  sanity: Fix int verses string reference (2016-02-28 22:54:06 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/extsdkpathfix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/extsdkpathfix

Paul Eggleton (1):
  classes/populate_sdk_ext: prepend to PATH rather than appending

 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.5.0


