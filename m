Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0FD4C6E65F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 08:53:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 31 Mar 2016 01:53:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,421,1455004800"; d="scan'208";a="945099223"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.133.74])
	by orsmga002.jf.intel.com with ESMTP; 31 Mar 2016 01:53:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Mar 2016 21:53:30 +1300
Message-Id: <cover.1459414389.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/5] Extensible SDK fixes
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
X-List-Received-Date: Thu, 31 Mar 2016 08:53:45 -0000

The following changes since commit e3fc8ef152494e9b7cff8de110a784150295f17e:

  recipes-support/rng-tools: Change runlevel start from S to 2, 3, 4, 5. (2016-03-30 21:32:11 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/extsdkfixes10-oe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/extsdkfixes10-oe

Paul Eggleton (5):
  classes/populate_sdk_ext: support setting vars from environment at build time
  oe-publish-sdk: prevent specifying a directory for the SDK argument
  oe-publish-sdk: exclude sstate-cache if publishing minimal SDK
  toolchain-shar-extract.sh: ensure all_proxy is allowed through
  devtool: modify: call shutdown on tinfoil when done

 meta/classes/populate_sdk_ext.bbclass | 26 ++++++++++++++++++++++++++
 meta/files/toolchain-shar-extract.sh  | 13 ++++++++++---
 scripts/lib/devtool/standard.py       |  2 ++
 scripts/oe-publish-sdk                | 13 +++++++------
 4 files changed, 45 insertions(+), 9 deletions(-)

-- 
2.5.5


