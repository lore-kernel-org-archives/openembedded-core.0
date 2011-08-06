Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpabJ-0000Nc-Su
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Aug 2011 08:43:14 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Aug 2011 23:38:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,327,1309762800"; d="scan'208";a="35941155"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.173])
	by orsmga001.jf.intel.com with ESMTP; 05 Aug 2011 23:38:46 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 23:38:36 -0700
Message-Id: <cover.1312612601.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [CONSOLIDATED PULL 0/9] Roll-up some missed requests
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
X-List-Received-Date: Sat, 06 Aug 2011 06:43:14 -0000

Richard,

This rolls up some missed pulls and includes upgrades to lttng 
and gdb to address a bug fixed upstream.

Sau!

The following changes since commit 7a278238d9b08e0315e92d386282cb488cc0c7b4:

  bitbake.conf/powerpc64: Set baselib to 'lib64' for ppc64 (2011-08-05 17:48:23 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Koen Kooi (2):
  gst-plugins: partially sync packaging with OE .dev
  gtk-icon-cache bbclass: don't assing to global RDEPENDS

Kumar Gala (1):
  gcc: use ${base_lib} to match gcc default configuration

Mei Lei (2):
  python-native: Fix a compiler finding issue
  apr-util: disable pqsql support to avoid configure error

Saul Wold (4):
  gdb: Update to 7.3
  liburcu: Update to 0.6.4
  lttng-ust: Update to 0.15
  lttng-control: Update to 0.89

 meta/classes/gtk-icon-cache.bbclass                |    4 +-
 .../gcc/gcc-cross-intermediate.inc                 |    2 +-
 meta/recipes-devtools/gdb/gdb-common.inc           |    5 +-
 ...s-canadian_7.2.bb => gdb-cross-canadian_7.3.bb} |    2 +-
 .../gdb/{gdb-cross_7.2.bb => gdb-cross_7.3.bb}     |    2 +-
 meta/recipes-devtools/gdb/gdb.inc                  |    2 +-
 .../fix_for_build_error_internal_error_call.patch  |   20 --------
 .../gdb/gdb/gdbserver-cflags-last.diff             |   16 ++++---
 .../gdb/gdb/kill_arm_map_symbols.patch             |   36 +++++++-------
 .../gdb/{gdb_7.2.bb => gdb_7.3.bb}                 |    4 +-
 .../python/python-native/unixccompiler.patch       |   20 ++++++++
 .../recipes-devtools/python/python-native_2.6.6.bb |    3 +-
 ...lttng-control_0.88.bb => lttng-control_0.89.bb} |    4 +-
 .../lttng/lttng-ust/uclibc-sched_getcpu.patch      |   50 --------------------
 .../lttng/{lttng-ust_0.12.bb => lttng-ust_0.15.bb} |   11 ++---
 .../gstreamer/gst-plugins-bad_0.10.21.bb           |    2 +-
 .../gstreamer/gst-plugins-base_0.10.32.bb          |    2 +-
 .../gstreamer/gst-plugins-good_0.10.28.bb          |    2 +-
 .../gstreamer/gst-plugins-package.inc              |   34 +++++++++++++
 .../gstreamer/gst-plugins-ugly_0.10.17.bb          |    2 +-
 meta/recipes-multimedia/gstreamer/gst-plugins.inc  |   18 +------
 meta/recipes-support/apr/apr-util_1.3.12.bb        |    3 +-
 .../liburcu/{liburcu_0.5.4.bb => liburcu_0.6.4.bb} |    5 +--
 23 files changed, 107 insertions(+), 142 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.2.bb => gdb-cross-canadian_7.3.bb} (87%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.2.bb => gdb-cross_7.3.bb} (83%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/fix_for_build_error_internal_error_call.patch
 rename meta/recipes-devtools/gdb/{gdb_7.2.bb => gdb_7.3.bb} (68%)
 create mode 100644 meta/recipes-devtools/python/python-native/unixccompiler.patch
 rename meta/recipes-kernel/lttng/{lttng-control_0.88.bb => lttng-control_0.89.bb} (77%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch
 rename meta/recipes-kernel/lttng/{lttng-ust_0.12.bb => lttng-ust_0.15.bb} (74%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
 rename meta/recipes-support/liburcu/{liburcu_0.5.4.bb => liburcu_0.6.4.bb} (72%)

-- 
1.7.3.4



