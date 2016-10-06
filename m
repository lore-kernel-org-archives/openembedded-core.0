Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id E41DB606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 12:18:41 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 06 Oct 2016 05:18:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,453,1473145200"; d="scan'208";a="17275862"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 06 Oct 2016 05:18:42 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id CDD346A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 05:18:12 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2016 14:53:15 +0300
Message-Id: <cover.1475754658.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH 0/2] added 2 new test cases
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
X-List-Received-Date: Thu, 06 Oct 2016 12:18:43 -0000

Hi,

2 new test cases for oe-selftest wic test suite:
  test image creation for systemd-bootdisk.wks
  test image creation for sdimage-bootpart.wks

The following changes since commit f12825d4bf7091576856650123c7d7614b9089af:

  scripts: Rename 'native' to 'oe-run-native' (2016-10-06 07:53:51 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/add-2new-tests
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/add-2new-tests

Ed Bartosh (2):
  wic: selftest: add test for systemd-bootdisk
  wic: selftest: add test for sdimage-bootpart

 meta/lib/oeqa/selftest/wic.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

--
Regards,
Ed

