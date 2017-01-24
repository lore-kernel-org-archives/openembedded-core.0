Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9950C60111
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 14:06:22 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 24 Jan 2017 06:06:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,278,1477983600"; d="scan'208";a="926064997"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 24 Jan 2017 06:06:22 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 9CF116A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 06:05:25 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 15:43:48 +0200
Message-Id: <cover.1485264964.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/8] Fix for #10783 wic should not be writing out to /var/tmp/wic
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
X-List-Received-Date: Tue, 24 Jan 2017 14:06:30 -0000

Hi,

This patchset changes default output location for wic images from /var/tmp/wic/build
to the current directory. It also includes a bit of refactoring of DirectImageCreator
class.

The following changes since commit 62d7d4130202d8ede16abf9e7d779361ca70847e:

  build-appliance-image: Update to master head revision (2017-01-23 23:32:23 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/default-output-dir-10783
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/default-output-dir-10783

Ed Bartosh (8):
  wic: change default output directory
  wic: get rid of baseimager inheritance
  wic: make workdir a temporary directory
  wic: remove unused API DirectImageCreator.get_disk_names
  wic: direct.py: get rid of names with two underscores
  image_types: use correct output directory
  selftest: wic: explicitly specify output directory
  selftest: wic: test default output directory

 meta/classes/image_types.bbclass     |   2 +-
 meta/lib/oeqa/selftest/wic.py        |  94 ++++++++---------
 scripts/lib/wic/imager/baseimager.py | 191 -----------------------------------
 scripts/lib/wic/imager/direct.py     | 108 +++++++++-----------
 scripts/wic                          |   2 +-
 5 files changed, 96 insertions(+), 301 deletions(-)
 delete mode 100644 scripts/lib/wic/imager/baseimager.py

--
Regards,
Ed

