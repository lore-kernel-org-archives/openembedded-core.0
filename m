Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C525B6FFD3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 03:19:41 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 21 Dec 2015 19:19:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="866907892"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2015 19:19:39 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 16:19:13 +1300
Message-Id: <cover.1450754300.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/5] Extensible SDK improvements
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
X-List-Received-Date: Tue, 22 Dec 2015 03:19:42 -0000

Some tweaks and minor fixes for the extensible SDK.


The following changes since commit 2a1edfd9cfa16ec334c0758b47677d4fee5e79a8:

  bitbake.conf: Add filename and lineno to BB_SIGNATURE_EXCLUDE_FLAGS (2015-12-22 00:01:31 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/extsdkfixes3-oe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/extsdkfixes3-oe

Paul Eggleton (5):
  classes/populate_sdk_ext: use uninative to set NATIVELSBSTRING
  classes/base: don't print header if BUILDCFG_HEADER not set
  classes/populate_sdk_ext: hide build configuration in devtool build* output
  classes/populate_sdk_ext: error out of install if buildtools install fails
  devtool: sdk-update: fix traceback without update server set

 meta/classes/base.bbclass             |  3 ++-
 meta/classes/populate_sdk_ext.bbclass | 12 ++++++------
 scripts/lib/devtool/sdk.py            |  6 +-----
 3 files changed, 9 insertions(+), 12 deletions(-)

-- 
2.5.0


