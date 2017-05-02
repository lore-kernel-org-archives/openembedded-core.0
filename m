Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E726672F5E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 May 2017 14:52:03 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 May 2017 07:52:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,405,1488873600"; d="scan'208";a="96292186"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 02 May 2017 07:52:04 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 8FA7E6A4080
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 May 2017 07:51:51 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 May 2017 17:38:17 +0300
Message-Id: <cover.1493735327.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] Fix for #9636: wic script should use argparse instead of optparse
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
X-List-Received-Date: Tue, 02 May 2017 14:52:05 -0000

Hi,

This patchset contains two patches from Andreas J. Reichel's patchset and
a fix for wic test case.

Description taken from the original patchset:

wic uses optparse and a rather complicated approach of its initialization.
It is much easier to switch from the deprecated optparse to the argparse library,
which also supports sub-commands, which wic heavily makes use of.

The following changes since commit 381897c64069ea43d595380a3ae913bcc79cf7e1:

  build-appliance-image: Update to master head revision (2017-05-01 08:56:47 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/wip

Andreas J. Reichel (2):
  wic: Use argparse instead of optparse
  wic: Add missing text to usage and help strings

Ed Bartosh (1):
  selftest: fix test_unsupported_subcommand test case

 meta/lib/oeqa/selftest/wic.py |   3 +-
 scripts/lib/wic/engine.py     |  11 ++-
 scripts/lib/wic/help.py       |  25 +++--
 scripts/wic                   | 213 ++++++++++++++++++++++++++----------------
 4 files changed, 156 insertions(+), 96 deletions(-)

--
Regards,
Ed


