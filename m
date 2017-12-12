Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5DBAE7883A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 02:27:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Dec 2017 18:27:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,393,1508828400"; d="scan'208";a="183413053"
Received: from ktan48-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.71.42])
	by orsmga005.jf.intel.com with ESMTP; 11 Dec 2017 18:27:09 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Dec 2017 15:26:18 +1300
Message-Id: <cover.1513045482.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [PATCH 0/1] oe-selftest: devtool: switch away from mkelfimage
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
X-List-Received-Date: Tue, 12 Dec 2017 02:27:12 -0000

Fix oe-selftest for Saul's impending removal of mkelfimage.


The following changes since commit a24c10b7bdab8aa960fdd3a58d2009f24344e579:

  populate_sdk_ext: Use prebuilt uninative tarball (2017-12-11 21:46:33 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/oe-selftest-mkelfimage
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/oe-selftest-mkelfimage

Paul Eggleton (1):
  oe-selftest: devtool: switch away from mkelfimage

 meta/lib/oeqa/selftest/cases/devtool.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.9.5


