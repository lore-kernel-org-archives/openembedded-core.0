Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1714A78421
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 19:32:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jan 2018 11:32:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,441,1511856000"; d="scan'208";a="14501276"
Received: from fungyihn-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.71.61])
	by orsmga008.jf.intel.com with ESMTP; 31 Jan 2018 11:32:40 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Feb 2018 08:32:06 +1300
Message-Id: <cover.1517427017.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [PATCH 0/1] devtool: set up git repos so that singletask.lock is ignored
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
X-List-Received-Date: Wed, 31 Jan 2018 19:32:44 -0000

The following changes since commit a0988c3374e964170d1d24fc230306b887432d31:

  tcmode-default.inc: drop preferred version of gzip-native (2018-01-31 17:01:12 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool-singletask-lock-fix
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/devtool-singletask-lock-fix

Paul Eggleton (1):
  devtool: set up git repos so that singletask.lock is ignored

 scripts/lib/devtool/__init__.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

-- 
2.9.5


