Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E025B7718B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 15:01:36 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 22 Feb 2016 07:01:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,484,1449561600"; d="scan'208";a="657171971"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.35])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Feb 2016 07:01:12 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Feb 2016 09:03:25 -0600
Message-Id: <cover.1456153260.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 0/4] Add extensible SDK update test
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
X-List-Received-Date: Mon, 22 Feb 2016 15:01:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 8c0ba8d9aff6dec6e458739aafb79b185e951afd:

  bitbake: toaster: toastergui Fix invalid char test and implementation (2016-02-19 15:38:49 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/esdk_update
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/esdk_update

Aníbal Limón (4):
  classes/testsdk: Move code for avoid PATHs to oeqa.utils
  classes/testsdk: Move the removal of bitbake PATH to eSDK context only
  classes/testsdk: Pass tcname to SDK and SDKExt contexts
  oeqa/sdkext: Add sdk_update.SDKUpdateTest class.

 meta/classes/testsdk.bbclass       | 29 +++++++++-------------------
 meta/lib/oeqa/oetest.py            | 29 ++++++++++++++++++++++++----
 meta/lib/oeqa/sdkext/sdk_update.py | 39 ++++++++++++++++++++++++++++++++++++++
 meta/lib/oeqa/utils/__init__.py    | 17 +++++++++++++++++
 4 files changed, 90 insertions(+), 24 deletions(-)
 create mode 100644 meta/lib/oeqa/sdkext/sdk_update.py

-- 
2.1.4


