Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Q4DSe-0004Wd-8w
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Mar 2011 16:30:29 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Mar 2011 07:28:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,255,1299484800"; d="scan'208";a="409739184"
Received: from unknown (HELO localhost) ([10.255.16.125])
	by azsmga001.ch.intel.com with ESMTP; 28 Mar 2011 07:28:29 -0700
Message-Id: <cover.1301322225.git.josh@linux.intel.com>
Old-Date: Mon, 28 Mar 2011 15:23:45 +0100
Date: Mon, 28 Mar 2011 15:28:23 +0100
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Joshua Lock <josh@linux.intel.com>
Subject: [PATCH 0/4] Recipes for Clutter 1.6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Mar 2011 14:30:29 -0000

From: Joshua Lock <josh@linux.intel.com>

The attached series of patches adds recipes for Clutter 1.6 and versions of
clutter-box2d and clutter-gst which build against it.

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: josh/clutter
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/clutter

Thanks,
    Joshua Lock <josh@linux.intel.com>
---


Joshua Lock (4):
  clutter: add 1.6.8
  clutter-gst: add 1.3.6 for use with clutter 1.6
  clutter-box2d: add version 0.10.0 for use with clutter 1.6
  clutter-gtk: remove duplicate gtk+ DEPENDS entry

 meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb |   25 +++++++++++++++++
 .../clutter/clutter-box2d-1.6_0.10.0.bb            |   20 ++++++++++++++
 meta/recipes-graphics/clutter/clutter-box2d.inc    |    4 +-
 .../clutter-box2d/fix-disable-introspection.patch  |   28 ++++++++++++++++++++
 meta/recipes-graphics/clutter/clutter-box2d_git.bb |    2 +-
 .../clutter/clutter-gst-1.6_1.3.6.bb               |   16 +++++++++++
 meta/recipes-graphics/clutter/clutter-gst.inc      |    3 +-
 .../clutter/clutter-gtk-1.4_git.bb                 |    2 +-
 8 files changed, 95 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-box2d-1.6_0.10.0.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-box2d/fix-disable-introspection.patch
 create mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.6_1.3.6.bb

-- 
1.7.4



