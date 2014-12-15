Return-Path: <nitin.a.kamble@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 468DB7249B
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 18:43:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Dec 2014 10:43:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,581,1413270000"; d="scan'208";a="647959814"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by fmsmga002.fm.intel.com with ESMTP; 15 Dec 2014 10:43:47 -0800
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org, meta-intel@yoctoproject.org,
	richard.purdie@linuxfoundation.org, saul.wold@intel.com,
	ross.burton@intel.com, paul.eggleton@linux.intel.com,
	tom.zanussi@intel.com, dvhart@linux.intel.com
Date: Mon, 15 Dec 2014 10:47:04 -0800
Message-Id: <cover.1418667266.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/2] commits for machine setup tool
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
X-List-Received-Date: Mon, 15 Dec 2014 18:43:51 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This pull request introduces a new feature called machine-setup-tool, which
can be used by the BSP. With the use of the tool, BSPs for different boards
which mainly differ in the text configuration for the target board, can be
consolidated to use a common BSP.

The tool provides ability to configure the target image at runtime. It also
provides ability to detect the target boards for automatic configuration of
the image. The tool can handle any text configuration for the target image.
All the configuration manipulation needed for the meta-intel BSP boards is
already supported in the tool.

The tool's configuration is BSP specific and need to be specified separately
in the BSP layer.  For example, for the meta-intel layer, the complementary
commits can be seen here:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-contrib/log/?h=nitin/machinesetuptool

These commits are enabling the meta-intel layer to support 6 boards with 2
common BSPs.

Thanks,
Nitin



The following changes since commit 8657c2fd57600e0b0eaf2a14692de7453c78e1bb:

  serf: readded md5sum (2014-12-11 11:34:57 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib nitin/machinesetuptool
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=nitin/machinesetuptool

Nitin A Kamble (2):
  alsa-plugins: a new recipe
  machinesetuptool: a new recipe for setup of a machine

 .../machinesetuptool/machinesetuptool_git.bb       | 55 ++++++++++++++++++++++
 .../recipes-multimedia/alsa/alsa-plugins_1.0.28.bb | 49 +++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-bsp/machinesetuptool/machinesetuptool_git.bb
 create mode 100644 meta/recipes-multimedia/alsa/alsa-plugins_1.0.28.bb

-- 
1.8.1.4


