Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TsaRl-0000TZ-JW
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 15:46:34 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 08 Jan 2013 06:31:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,430,1355126400"; d="scan'208";a="188863108"
Received: from unknown (HELO localhost) ([10.255.14.51])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Jan 2013 06:31:21 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 08:31:18 -0600
Message-Id: <cover.1357655073.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.11.4
Subject: [PATCH 0/5] Remove legacy lttng
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
X-List-Received-Date: Tue, 08 Jan 2013 14:46:35 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

This patchset removes legacy lttng, which hasn't been operational in
Yocto for awhile now.  lttng-2.0 is the current version, which was
recently updated and now does work.

With legacy lttng gone, lttng-2.0 can be renamed back to lttng, which
this patchset also does.

The following changes since commit 691a830b93358b78e5411bdaa694bab32166f56f:

  linux-libc-headers: make 3.7 the default and remove older libc-header recipes (2013-01-07 19:26:30 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/rm-legacy-lttng
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/rm-legacy-lttng

Tom Zanussi (5):
  lttng: remove 'legacy' lttng
  lttng2-ust: rename to lttng-ust
  recipes-kernel/lttng-2.0: rename to recipes-kernel/lttng
  lttng: remove references to legacy lttng recipes
  recipe_color.inc: add lttng recipes

 meta-yocto/conf/distro/include/distro_alias.inc    |  3 --
 meta-yocto/conf/distro/include/maintainers.inc     |  3 --
 meta-yocto/conf/distro/include/recipe_color.inc    |  5 +--
 .../packagegroup-core-tools-profile.bb             |  2 +-
 .../{lttng-2.0 => lttng}/babeltrace_1.0.0.bb       |  0
 meta/recipes-kernel/lttng/lttng-control_0.89.bb    | 23 ------------
 ...modules-replace-KERNELDIR-with-KERNEL_SRC.patch |  0
 .../{lttng-2.0 => lttng}/lttng-modules_2.0.5.bb    |  0
 .../{lttng-2.0 => lttng}/lttng-tools_2.0.4.bb      |  2 +-
 meta/recipes-kernel/lttng/lttng-ust_0.16.bb        | 32 -----------------
 .../lttng-ust_2.0.5.bb}                            |  0
 .../lttng-viewer/add_linkage_to_lttvwindow.patch   | 42 ----------------------
 meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb  | 40 ---------------------
 13 files changed, 5 insertions(+), 147 deletions(-)
 rename meta/recipes-kernel/{lttng-2.0 => lttng}/babeltrace_1.0.0.bb (100%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-control_0.89.bb
 rename meta/recipes-kernel/{lttng-2.0 => lttng}/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch (100%)
 rename meta/recipes-kernel/{lttng-2.0 => lttng}/lttng-modules_2.0.5.bb (100%)
 rename meta/recipes-kernel/{lttng-2.0 => lttng}/lttng-tools_2.0.4.bb (97%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust_0.16.bb
 rename meta/recipes-kernel/{lttng-2.0/lttng2-ust_2.0.5.bb => lttng/lttng-ust_2.0.5.bb} (100%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-viewer/add_linkage_to_lttvwindow.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb

-- 
1.7.11.4



