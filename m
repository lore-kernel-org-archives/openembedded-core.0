Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTTbD-0005lt-El
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 08:47:44 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jun 2011 23:44:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,325,1304319600"; 
   d="scan'208";a="7608963"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.187])
	by azsmga001.ch.intel.com with ESMTP; 05 Jun 2011 23:44:26 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Jun 2011 23:44:04 -0700
Message-Id: <cover.1307342214.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [CONSOLIDATED PULL 00/20] 05-June-2011
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
X-List-Received-Date: Mon, 06 Jun 2011 06:47:44 -0000

Richard,

This pulls together a set of changes from the later
part of last week, these have been built. I have updated
Nitin's comment about the License change (which was adding
years).

This also includes Scott's User Addition code.

I did not pull Bruce's change due to a known build issue
with x86-64, I am expecting an update from him.

Thanks
	Sau!


The following changes since commit 2a52f806f3789f717219651b97dc64fec3881f7f:

  qmake_base.bbclass: fix lrelease/lupdate binary names (2011-06-02 18:26:19 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Khem Raj (2):
  allarch.bbclass: Define BASE_PACKAGE_ARCH = "all"
  util-linux_2.19.1.bb: Fix compliation on uclibc

Martin Jansa (1):
  base.bbclass: add cleansstate task between clean and cleanall

Nitin A Kamble (3):
  m4: upgrade from 1.4.15 to 1.4.16
  autoconf: upgrade from 2.65 to 2.68
  bison: upgrade from 2.4.3 to 2.5

Otavio Salvador (4):
  gnutls: use INC_PR on 2.12.5 version recipe
  gnutls: add p11tool into gnutls-bin
  package.bbclass: add support to split Qt translation files
  xf86-driver-common.inc: remove .la files to avoid unpackaged warning

Phil Blundell (1):
  gcc-package-cross: also install the symlinks in libexec with target
    prefix

Saul Wold (2):
  bitbake.conf: Create staticlibs pacakge for static libraries
  tzcode: Update to 2011g

Scott Garman (7):
  shadow: recipe and patch cleanup
  shadow: add a -native recipe with customized utilities
  base-passwd: populate the target sysroot with passwd/group/login.defs
  useradd.bbclass: new class for managing user/group permissions
  useradd-example: example recipe for using inherit useradd
  bitbake.conf: set PSEUDO_PASSWD within FAKEROOTENV
  package_rpm.bbclass: make RPM use on-disk permissions

 .../recipes-skeleton/useradd/useradd-example.bb    |   72 ++
 meta/classes/allarch.bbclass                       |    1 +
 meta/classes/base.bbclass                          |    7 +-
 meta/classes/package.bbclass                       |   41 +-
 meta/classes/package_rpm.bbclass                   |    2 +
 meta/classes/useradd.bbclass                       |  163 +++
 meta/conf/bitbake.conf                             |   14 +-
 .../base-passwd/base-passwd-3.5.22/login.defs      |  386 ++++++
 .../recipes-core/base-passwd/base-passwd_3.5.22.bb |   27 +-
 .../uclibc-__progname-conflict.patch               |   31 +
 meta/recipes-core/util-linux/util-linux_2.19.1.bb  |    4 +-
 .../{autoconf-2.65 => autoconf}/autoconf-x.patch   |    0
 .../autoheader-nonfatal-warnings.patch             |    0
 .../autoreconf-exclude.patch                       |    0
 .../autoreconf-foreign.patch                       |    0
 .../autoreconf-gnuconfigize.patch                  |    0
 .../autoreconf-include.patch                       |    0
 .../{autoconf-2.65 => autoconf}/config_site.patch  |   19 +-
 .../fix_path_xtra.patch                            |   14 +-
 .../path_prog_fixes.patch                          |    0
 .../program_prefix.patch                           |    0
 .../{autoconf_2.65.bb => autoconf_2.68.bb}         |    6 +-
 meta/recipes-devtools/bison/bison/m4.patch         |  131 --
 .../bison/bison/uclibc-sched_param-def.patch       |   21 -
 .../bison/{bison_2.4.3.bb => bison_2.5.bb}         |    7 +-
 meta/recipes-devtools/gcc/gcc-package-cross.inc    |    1 +
 .../{m4-native_1.4.15.bb => m4-native_1.4.16.bb}   |    0
 .../m4/{m4_1.4.15.bb => m4_1.4.16.bb}              |    6 +-
 .../shadow/files/add_root_cmd_options.patch        | 1296 ++++++++++++++++++++
 .../files/shadow-4.1.3-dots-in-usernames.patch     |    4 +
 .../shadow-4.1.4.2-env-reset-keep-locale.patch     |    4 +
 .../files/shadow-4.1.4.2-groupmod-pam-check.patch  |    4 +
 .../files/shadow-4.1.4.2-su_no_sanitize_env.patch  |    4 +
 .../shadow/files/shadow.automake-1.11.patch        |    4 +
 .../shadow/shadow-native_4.1.4.3.bb                |   66 +
 meta/recipes-extended/shadow/shadow.inc            |  123 --
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |  139 ++-
 .../recipes-extended/tzcode/tzcode-native_2009r.bb |   19 -
 .../recipes-extended/tzcode/tzcode-native_2011g.bb |   25 +
 .../xorg-driver/xf86-driver-common.inc             |    6 +-
 meta/recipes-support/gnutls/gnutls.inc             |    3 +-
 meta/recipes-support/gnutls/gnutls_2.12.5.bb       |    2 +-
 42 files changed, 2313 insertions(+), 339 deletions(-)
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example/file1
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example/file2
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example/file3
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example/file4
 create mode 100644 meta/classes/useradd.bbclass
 create mode 100644 meta/recipes-core/base-passwd/base-passwd-3.5.22/login.defs
 create mode 100644 meta/recipes-core/util-linux/util-linux-2.19.1/uclibc-__progname-conflict.patch
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/autoconf-x.patch (100%)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/autoheader-nonfatal-warnings.patch (100%)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/autoreconf-exclude.patch (100%)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/autoreconf-foreign.patch (100%)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/autoreconf-gnuconfigize.patch (100%)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/autoreconf-include.patch (100%)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/config_site.patch (60%)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/fix_path_xtra.patch (90%)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/path_prog_fixes.patch (100%)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/program_prefix.patch (100%)
 rename meta/recipes-devtools/autoconf/{autoconf_2.65.bb => autoconf_2.68.bb} (85%)
 delete mode 100644 meta/recipes-devtools/bison/bison/uclibc-sched_param-def.patch
 rename meta/recipes-devtools/bison/{bison_2.4.3.bb => bison_2.5.bb} (85%)
 rename meta/recipes-devtools/m4/{m4-native_1.4.15.bb => m4-native_1.4.16.bb} (100%)
 rename meta/recipes-devtools/m4/{m4_1.4.15.bb => m4_1.4.16.bb} (75%)
 create mode 100644 meta/recipes-extended/shadow/files/add_root_cmd_options.patch
 create mode 100644 meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
 delete mode 100644 meta/recipes-extended/shadow/shadow.inc
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2009r.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2011g.bb

-- 
1.7.3.4



