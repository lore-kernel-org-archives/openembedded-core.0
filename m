Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3B56876B7C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 15:45:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 01 Sep 2015 08:45:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,449,1437462000"; d="scan'208";a="780398367"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga001.fm.intel.com with ESMTP; 01 Sep 2015 08:45:22 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Sep 2015 07:36:28 +0000
Message-Id: <cover.1441091863.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH 0/2] Add dumps when qemurunner fails
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
X-List-Received-Date: Tue, 01 Sep 2015 15:45:23 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

These patches add dumps when qemurunner ends unexpectedly and
make runexported test compatible with HostDumper.

The previous version of this patch was more intrusive with
qemurunner, now the instance of HostDumper is created inside
qemurunner with parameters sent to the constructor.

Also, now the Dumper constructors doesn't require the datastore,
It is needed to send the commands and the dump dir as strings.

This also makes compatible the HostDumper with runexported test.

The following changes since commit 22afc047dd1b8f83e56c4a9862710776c509e3c5:

  oe-selftest: test devtool build-image plugin (2015-08-31 11:37:14 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug8118v8
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug8118v8

Mariano Lopez (2):
  qemurunner: Added host dumps when there are errors
  runexported: Make it compatible with host dump

 meta/classes/testimage.bbclass    |  6 +++++-
 meta/lib/oeqa/oetest.py           | 13 ++++++-------
 meta/lib/oeqa/runexported.py      |  8 +++++++-
 meta/lib/oeqa/targetcontrol.py    |  9 +++++++--
 meta/lib/oeqa/utils/dump.py       | 28 +++++++++-------------------
 meta/lib/oeqa/utils/qemurunner.py | 15 ++++++++++++++-
 6 files changed, 48 insertions(+), 31 deletions(-)

-- 
1.8.4.5


