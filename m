Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TtoGa-0008Pm-Gb
	for openembedded-core@lists.openembedded.org;
	Sat, 12 Jan 2013 00:44:05 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jan 2013 15:27:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,455,1355126400"; d="scan'208";a="245455359"
Received: from unknown (HELO localhost) ([10.255.14.242])
	by orsmga001.jf.intel.com with ESMTP; 11 Jan 2013 15:28:47 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Jan 2013 17:28:45 -0600
Message-Id: <cover.1357946582.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.11.4
Subject: [PATCH 0/3] Remove legacy lttng, v3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jan 2013 23:44:05 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

This patchset removes legacy lttng, which hasn't been operational in
Yocto for awhile now.  lttng-2.0 is the current version, which was
recently updated and now does work.

With legacy lttng gone, lttng-2.0 can be renamed back to lttng, which
this patchset also does.

Tested on crownbay (kernel and userspace).

v3 changes:

-still had some poky changes mixed in, removed now

v2 changes:

- remove the poky-specific patches from the patchset
- update the patch numbers
- added upgrade path for lttng2->lttng rename
- since the original posting, lttng-2.0 was upgraded, so the original
  patchset had to be rebased on top of that

The following changes since commit 53cc748b93e8af584557d6db5309c3e955182c5c:

  linux-libc-headers: fix headers install in long path name environments (2013-01-10 23:53:51 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/rm-legacy-lttng-v3
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/rm-legacy-lttng-v3

Tom Zanussi (3):
  lttng: remove 'legacy' lttng
  lttng2-ust: rename to lttng-ust
  recipes-kernel/lttng-2.0: rename to recipes-kernel/lttng

 .../packagegroup-core-tools-profile.bb             |  2 +-
 .../{lttng-2.0 => lttng}/babeltrace_1.0.0.bb       |  0
 meta/recipes-kernel/lttng/lttng-control_0.89.bb    | 23 ------------
 ...modules-replace-KERNELDIR-with-KERNEL_SRC.patch |  0
 .../{lttng-2.0 => lttng}/lttng-modules_2.1.0.bb    |  0
 .../{lttng-2.0 => lttng}/lttng-tools_2.1.0.bb      |  2 +-
 meta/recipes-kernel/lttng/lttng-ust_0.16.bb        | 32 -----------------
 .../lttng-ust_2.1.0.bb}                            |  5 +++
 .../lttng-viewer/add_linkage_to_lttvwindow.patch   | 42 ----------------------
 meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb  | 40 ---------------------
 10 files changed, 7 insertions(+), 139 deletions(-)
 rename meta/recipes-kernel/{lttng-2.0 => lttng}/babeltrace_1.0.0.bb (100%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-control_0.89.bb
 rename meta/recipes-kernel/{lttng-2.0 => lttng}/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch (100%)
 rename meta/recipes-kernel/{lttng-2.0 => lttng}/lttng-modules_2.1.0.bb (100%)
 rename meta/recipes-kernel/{lttng-2.0 => lttng}/lttng-tools_2.1.0.bb (97%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust_0.16.bb
 rename meta/recipes-kernel/{lttng-2.0/lttng2-ust_2.1.0.bb => lttng/lttng-ust_2.1.0.bb} (87%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-viewer/add_linkage_to_lttvwindow.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb

-- 
1.7.11.4



