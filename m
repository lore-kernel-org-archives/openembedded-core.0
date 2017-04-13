Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7B02577D88
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 12:28:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Apr 2017 05:28:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,194,1488873600"; d="scan'208";a="845454146"
Received: from tranm-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.175.125])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Apr 2017 05:28:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Apr 2017 00:28:03 +1200
Message-Id: <cover.1492086458.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH 0/3] devtool extract/modify fixes
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
X-List-Received-Date: Thu, 13 Apr 2017 12:28:10 -0000

The following changes since commit 334020a800434d20e7c3312890a2baca295c41c7:

  oe-run-native: explicitly use bash (2017-04-13 10:52:54 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool26
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/devtool26

Paul Eggleton (3):
  devtool: modify: add --keep-temp option for debugging
  devtool: extract: fix handling of failed tasks
  devtool: extract: drop erroneous bb.event.TaskSucceeded

 scripts/lib/devtool/standard.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.9.3


