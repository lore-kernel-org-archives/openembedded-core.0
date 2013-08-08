Return-Path: <nitin.a.kamble@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 3E4FA6B0D0
	for <Openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 21:33:34 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 08 Aug 2013 14:33:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,841,1367996400"; d="scan'208";a="279620484"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Aug 2013 14:33:26 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2013 21:34:23 +0000
Message-Id: <cover.1375996888.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/3] RFC: few commits for a new machine feature: v4l2
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
X-List-Received-Date: Thu, 08 Aug 2013 21:33:34 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Here are few commits to add a new machine feature, v4l2. These commits
provide:

* A new recipe which provides tools to poke v4l2 config on the target
* a new machine feature: v4l2 which brings a set of related packages.
* modification to gst-meta-base recipe, to enable the v4l2 gstreamer
  plugins, when the v4l2 machine features is enabled.

With this, one can easily enable a v4l2 video device on any BSP. This
v4l2 support will also be used by the upcoming hardware accelerated
encoding support for BSPs.

I am sending these commits as "Request for comments" for now, but I also
see that these are complete enough to pull in the oecore layer.

Thanks,
Nitin


The following changes since commit f63e7f4323368c0d6fe7a1d44393a7e15652d4f2:

  subversion: Add patch to use neon 0.30 (2013-08-07 07:43:47 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib nitin/misc
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (3):
  v4l-utils: a new recipe
  packagegroup-base.bb: add a new machine feature: v4l2
  gst-meta-base: bring in the v4l2 related gst plugin

 .../packagegroups/packagegroup-base.bb             |  8 +++++
 .../gstreamer/gst-meta-base_0.10.bb                |  4 ++-
 meta/recipes-multimedia/v4lapps/v4l-utils_1.0.0.bb | 35 ++++++++++++++++++++++
 3 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/v4lapps/v4l-utils_1.0.0.bb

-- 
1.8.1.4


