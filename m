Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 70A4A6AC1E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 07:33:31 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 24 Aug 2015 00:33:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,736,1432623600"; d="scan'208";a="631000420"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 24 Aug 2015 00:33:32 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 3439B6A4083;
	Mon, 24 Aug 2015 00:32:41 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 10:33:22 +0300
Message-Id: <cover.1440401351.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] Implement build-image plugin for devtool
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
X-List-Received-Date: Mon, 24 Aug 2015 07:33:34 -0000

Hi,

Please, review implamentation of the new plugin for devtool.
This plugins is for building an image with all workspace packages included.

The following changes since commit a3d228a484cf471e999b6537987e2897d8a7bd4e:

  bitbake: main: Handle RuntimeError exception in list_extension_modules (2015-08-20 22:04:43 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/devtool/8135
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/devtool/8135

Ed Bartosh (2):
  devtool: make add_md5 a public API
  devtool: implement build-image plugin

 scripts/lib/devtool/__init__.py    |  6 ++++
 scripts/lib/devtool/build-image.py | 56 ++++++++++++++++++++++++++++++++++++++
 scripts/lib/devtool/standard.py    | 14 +++-------
 3 files changed, 66 insertions(+), 10 deletions(-)
 create mode 100644 scripts/lib/devtool/build-image.py

--
Ed


