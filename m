Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Q4Lwb-0004VK-95
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Mar 2011 01:33:57 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Mar 2011 16:31:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,258,1299484800"; d="scan'208";a="672587512"
Received: from unknown (HELO localhost) ([10.255.16.103])
	by fmsmga002.fm.intel.com with ESMTP; 28 Mar 2011 16:31:58 -0700
Message-Id: <cover.1301354978.git.josh@linux.intel.com>
Old-Date: Tue, 29 Mar 2011 00:29:38 +0100
Date: Tue, 29 Mar 2011  0:31:52 +0100
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Joshua Lock <josh@linux.intel.com>
Subject: [PATCH 0/4] Recipes for Clutter 1.6 v2
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
X-List-Received-Date: Mon, 28 Mar 2011 23:33:57 -0000

From: Joshua Lock <josh@linux.intel.com>

v2 of a series series of patches adds recipes for Clutter 1.6 and versions of
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
 meta/recipes-graphics/clutter/clutter-gst.inc      |    2 +-
 .../clutter/clutter-gtk-1.4_git.bb                 |    2 +-
 8 files changed, 94 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-box2d-1.6_0.10.0.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-box2d/fix-disable-introspection.patch
 create mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.6_1.3.6.bb

-- 
1.7.4.1



