Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 371E575E80
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 10:58:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 08 Sep 2015 03:58:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,489,1437462000"; d="scan'208";a="764592801"
Received: from unknown (HELO marquiz.fi.intel.com) ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 08 Sep 2015 03:58:16 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 13:58:11 +0300
Message-Id: <1441709895-1304-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/4] devtool: better support for kernel
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
X-List-Received-Date: Tue, 08 Sep 2015 10:58:20 -0000

This patchset contains few patches to improve the devtool support for kernel
recipes. With these patches it is possible build a modified kernel and also
build other packages (e.g. external modules) against it. The first three
patches are actually a bit more generic patches that make externalsrc behave
better with kernel recipes.

The following changes since commit 8402958cd2cb87b8283c8ee4e2d08e1a6717d67a:

  pseudo_1.7.3.bb: New version of pseudo (2015-09-06 15:24:28 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/devtool/kernel
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=marquiz/devtool/kernel

for you to fetch changes up to a7aeb51b63040a2783d60c45d9249daa47c2fde3:

  devtool: modify: enable do_shared_workdir for kernel (2015-09-08 13:29:39 +0300)

----------------------------------------------------------------
Markus Lehtonen (4):
  extrernalsrc.bbclass: treat kernel meta like local source
  kernel-yocto.bbclass: do_kernel_metadata depends on do_unpack
  kernel.bbclass: do not mv/link sources when externalsrc enabled
  devtool: modify: enable do_shared_workdir for kernel

 meta/classes/externalsrc.bbclass  | 12 ++++++++----
 meta/classes/kernel-yocto.bbclass |  2 +-
 meta/classes/kernel.bbclass       | 10 +++++++---
 scripts/lib/devtool/standard.py   |  2 +-
 4 files changed, 17 insertions(+), 9 deletions(-)

-- 
2.1.4


