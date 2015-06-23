Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9BCE06AC1E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 09:53:38 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 23 Jun 2015 02:53:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,665,1427785200"; d="scan'208";a="732871057"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 23 Jun 2015 02:53:40 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 185496A4083;
	Tue, 23 Jun 2015 02:53:01 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jun 2015 12:52:56 +0300
Message-Id: <1435053182-8028-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH 0/6] Implemented image compressing: poky-contrib:ed/wic/compress-with
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
X-List-Received-Date: Tue, 23 Jun 2015 09:53:41 -0000

Hi reviewers,

This patchset adds --compress-with command line option to 'wic create'.
It supports gzip, bzip2 and xz compressors.

Test cases for this funtionality are also included.

As always I couldn't resist making small code cleanup change while working on this.
Included that as well.

Fixes [YOCTO #7593]

Note: This patchset depends on poky-contrib:ed/wic/misc

Ed Bartosh (6):
  wic: Add --compress-with command line option
  wic: Add new argument to wic_create function
  wic: Add new argument to direct plugin
  wic: Implement image compressing
  wic: Make code more pythonic
  wic: oe-selftest: Test image compressing

 meta/lib/oeqa/selftest/wic.py                   | 30 +++++++++++++++++++++++++
 scripts/lib/image/engine.py                     | 17 +++++---------
 scripts/lib/image/help.py                       |  4 ++++
 scripts/lib/wic/imager/direct.py                | 17 ++++++++++++--
 scripts/lib/wic/plugins/imager/direct_plugin.py |  4 +++-
 scripts/wic                                     |  5 ++++-
 6 files changed, 61 insertions(+), 16 deletions(-)

--
Regards,
Ed


