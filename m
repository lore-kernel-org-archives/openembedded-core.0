Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A50C776536
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 16:08:50 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 30 Aug 2015 09:08:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,435,1437462000"; d="scan'208";a="794064901"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 30 Aug 2015 09:08:50 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 9B0F96A4005
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 09:07:59 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Aug 2015 19:08:33 +0300
Message-Id: <cover.1440950164.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/11] Improve build-image plugin
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
X-List-Received-Date: Sun, 30 Aug 2015 16:08:52 -0000

This set of improvements for build-image plugin hopefully addresses
Paul's review comments and suggestions.

Paul, thank you for review!

The following changes since commit 6b17c3831897ee1d46a763d807c5bd863d426bc1:

  linux-yocto-3.14: Update to latest revisions (2015-08-30 12:47:51 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/devtool/8135
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/devtool/8135

Ed Bartosh (11):
  devtool: make 2 functions public
  devtool: build-image: stop using add_md5
  Revert "devtool: make add_md5 a public API"
  devtool: build-image: rename LOG -> logger
  devtool: build-image: improve help and description
  devtool: build-image: filter out recipes
  devtool: build-image: generate notification callback
  devtool: build-image: add extra logging
  devtool: build-image: remove <image>.bbappend
  devtool: build-image: add comments
  oe-selftest: test devtool build-image plugin

 meta/lib/oeqa/selftest/devtool.py  | 26 ++++++++++++++++
 scripts/lib/devtool/__init__.py    | 32 ++++++++++++++++----
 scripts/lib/devtool/build-image.py | 61 +++++++++++++++++++++++++++++++-------
 scripts/lib/devtool/standard.py    | 49 +++++++++---------------------
 4 files changed, 116 insertions(+), 52 deletions(-)

--
Regards,
Ed


