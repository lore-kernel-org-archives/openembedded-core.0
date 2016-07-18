Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4AA9A6E64A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 10:17:28 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 18 Jul 2016 03:17:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,383,1464678000"; d="scan'208";a="1018912435"
Received: from bng2-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.142.131])
	by orsmga002.jf.intel.com with ESMTP; 18 Jul 2016 03:17:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2016 22:17:02 +1200
Message-Id: <cover.1468831253.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/1] Show progress when preparing eSDK (rebased)
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
X-List-Received-Date: Mon, 18 Jul 2016 10:17:31 -0000

This patch from the earlier series wasn't merged, possibly since it
conflicted - I've rebased it onto master and resolved that.


The following changes since commit da7a2c7b00b40a8759dbe9f4ab6df3e337e3d6b6:

  useradd-staticids: use map() instead of imap() (2016-07-12 23:11:57 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/startup-oe2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/startup-oe2

Paul Eggleton (1):
  classes/populate_sdk_ext: show progress when preparing build system

 meta/classes/populate_sdk_ext.bbclass |  2 +-
 meta/files/ext-sdk-prepare.py         | 67 ++++++++++++++++++++++-------------
 2 files changed, 44 insertions(+), 25 deletions(-)

-- 
2.5.5


