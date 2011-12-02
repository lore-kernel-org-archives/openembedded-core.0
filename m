Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RWN8k-0002ay-PF
	for openembedded-core@openembedded.org; Fri, 02 Dec 2011 08:02:36 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 01 Dec 2011 22:55:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,282,1320652800"; d="scan'208";a="43189760"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Dec 2011 22:55:50 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu,  1 Dec 2011 22:55:31 -0800
Message-Id: <cover.1322808632.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 00/18] Updates & Kernel FLAG DAY
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
X-List-Received-Date: Fri, 02 Dec 2011 07:02:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard et al,

This pull requests grabs up patches and updates, along with a kernel
update from Bruce.

This kernel update will cause a bit of a "Flag Day" or sync point, 
since it will require a cooresponding change to remove any .bbappend
files for the 2.6.34 linux-yocto recipes.

There is a cooresponding pull request on the poky@yoctoproject.org for
the meta-yocto layer.  Please beaware if you are using the linux-yocto
2.6.34 recipe to copy it to your layer or uprev to a new kernel.

Thanks
	Sau!


The following changes since commit e57935dc18d576feb1003b48e7cdc72a444131b8:

  Revert "classes/buildhistory: add new output history collection class" (2011-12-01 23:00:52 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Anders Darander (1):
  busybox: update to 1.19.3

Bruce Ashfield (7):
  kern-tools: add pre_config and merge_config.sh to the list of tools
  kernel-yocto: support allnoconfig base configuration
  linux-yocto: remove 2.6.34 recipes
  linux-yocto: v3.0.9 + enhancements
  linux-yocto: v3.0.10 + rt27
  linux-yocto: prefer in-tree tools to external ones
  kern-tools: use Makefile provided install rules

Eric Bénard (1):
  base-passwd: fix race between the populate_sysroot and package

Saul Wold (8):
  resolvconf: Update to 1.62
  psmisc: Update to 22.14
  sysstat: Update to 10.0.3
  sqlite3: Update to 3.7.9
  less: Update to 444
  ubootchart: update to svn R12
  distro tracking updates
  kernel-yocto: fix extra CR in do_kernel_checkout

Stefan Schmidt (1):
  logrotate: Add dependency on popt lib.

 meta/classes/kernel-yocto.bbclass                  |   24 ++-
 .../conf/distro/include/distro_tracking_fields.inc |  100 ++++----
 .../{resolvconf_1.61.bb => resolvconf_1.62.bb}     |    6 +-
 .../recipes-core/base-passwd/base-passwd_3.5.22.bb |    4 +-
 .../B921600.patch                                  |    0
 .../busybox-1.19.3/busybox-1.19.3-getty.patch      |   17 ++
 .../busybox-appletlib-dependency.patch             |    0
 .../busybox-udhcpc-no_deconfig.patch               |   66 +++--
 .../{busybox-1.18.5 => busybox-1.19.3}/defconfig   |  265 +++++++++++++-------
 .../get_header_tar.patch                           |    0
 .../run-parts.in.usr-bin.patch                     |   16 +-
 .../udhcpc-fix-nfsroot.patch                       |    0
 .../udhcpscript.patch                              |    0
 .../{busybox_1.18.5.bb => busybox_1.19.3.bb}       |    7 +-
 meta/recipes-devtools/ubootchart/ubootchart_svn.bb |    2 +-
 .../less/{less_443.bb => less_444.bb}              |    5 +-
 meta/recipes-extended/logrotate/logrotate_3.7.9.bb |    4 +-
 .../psmisc/files/libintl-link.patch                |   22 +-
 meta/recipes-extended/psmisc/psmisc.inc            |    8 +-
 .../psmisc/{psmisc_22.13.bb => psmisc_22.14.bb}    |    6 +-
 .../{sysstat_10.0.2.bb => sysstat_10.0.3.bb}       |    6 +-
 .../kern-tools/kern-tools-native_git.bb            |   15 +-
 meta/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb |   38 ---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    8 +-
 meta/recipes-kernel/linux/linux-yocto_2.6.34.bb    |   49 ----
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   18 +-
 meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb     |   10 -
 meta/recipes-support/sqlite/sqlite3_3.7.9.bb       |   11 +
 28 files changed, 382 insertions(+), 325 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.61.bb => resolvconf_1.62.bb} (78%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/B921600.patch (100%)
 create mode 100644 meta/recipes-core/busybox/busybox-1.19.3/busybox-1.19.3-getty.patch
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/busybox-appletlib-dependency.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/busybox-udhcpc-no_deconfig.patch (62%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/defconfig (89%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/get_header_tar.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/run-parts.in.usr-bin.patch (64%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/udhcpc-fix-nfsroot.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/udhcpscript.patch (100%)
 rename meta/recipes-core/busybox/{busybox_1.18.5.bb => busybox_1.19.3.bb} (82%)
 rename meta/recipes-extended/less/{less_443.bb => less_444.bb} (87%)
 rename meta/recipes-extended/psmisc/{psmisc_22.13.bb => psmisc_22.14.bb} (42%)
 rename meta/recipes-extended/sysstat/{sysstat_10.0.2.bb => sysstat_10.0.3.bb} (42%)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_2.6.34.bb
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.9.bb

-- 
1.7.6.4



