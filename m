Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 374A772F64
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 15:29:24 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 21 Feb 2017 07:29:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="936451760"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 21 Feb 2017 07:29:25 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 1A6636A4004
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 07:29:24 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 17:23:05 +0200
Message-Id: <cover.1487690169.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/6] wic: fix for #11017
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
X-List-Received-Date: Tue, 21 Feb 2017 15:29:25 -0000

Hi,

This patchset improves handling of wic native tool dependencies and
fixes minor bugs in the wic code.

The following changes since commit 9a0ddad5e178d16f302af2d05c32368572849fd3:

  wic: pluginbase: use global dictionary (2017-02-20 11:58:28 +0200)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/wip

Ed Bartosh (6):
  wic: use 2 sysroots to find native executable
  wic: use image recipe sysroot as default
  wic: exec_native_cmd: improve debug message
  wic: exec_native_cmd: fix undefined variable error
  wic: add WKS_FILE_DEPENDS variable
  wic: raise WicError instead of calling logger.error

 meta-selftest/recipes-test/images/wic-image-minimal.bb |  2 +-
 meta/classes/image_types_wic.bbclass                   |  2 ++
 scripts/lib/wic/plugins/source/bootimg-pcbios.py       |  4 ++--
 scripts/lib/wic/utils/misc.py                          | 13 +++++++++----
 scripts/wic                                            |  2 +-
 5 files changed, 15 insertions(+), 8 deletions(-)

--
Regards,
Ed


