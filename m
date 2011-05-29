Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QQWci-0003uU-Oe
	for openembedded-core@lists.openembedded.org;
	Sun, 29 May 2011 05:25:05 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 May 2011 20:21:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,288,1304319600"; 
   d="scan'208";a="6337152"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 28 May 2011 20:21:39 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 May 2011 20:22:05 -0700
Message-Id: <cover.1306545413.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [upgrades 0/4] devel/toolchain recipe upgrades
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
X-List-Received-Date: Sun, 29 May 2011 03:25:05 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

I could build meta-toolchain & sato-sdk image for qemuppc with these commits.

I had to fix the autoconf's config-site patch to avoid lots of errors as site
files were not getting parsed earlier.

The following changes since commit 1169f1b066d0028bd2ef7915440450bd42ef165e:

  license.bbclass: Sane Parsing of licenses (2011-05-27 23:36:24 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/upgrades
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/upgrades

Nitin A Kamble (4):
  m4: upgrade from 1.4.15 to 1.4.16
  autoconf: upgrade from 2.65 to 2.68
  bison: upgrade from 2.4.3 to 2.5
  genttext-0.16.1: mark upstream status for gplv2 recipe's patches

 .../gettext/gettext-0.16.1/disable_java.patch      |    2 +
 .../gettext-0.16.1/fix_aclocal_version.patch       |    2 +
 .../gettext-0.16.1/fix_gnu_source_circular.patch   |    2 +
 .../gettext/gettext-0.16.1/fixchicken.patch        |    2 +
 .../gettext/gettext-0.16.1/getline.m4.patch        |    2 +
 .../gettext-autoconf-lib-link-no-L.patch           |    2 +
 .../gettext-error_print_progname.patch             |    2 +
 .../gettext/gettext-0.16.1/gettext-vpath.patch     |    2 +
 .../gettext-0.16.1/hardcode_macro_version.patch    |    2 +
 .../gettext/gettext-0.16.1/linklib_from_0.17.patch |    2 +
 .../{autoconf-2.65 => autoconf}/autoconf-x.patch   |    0
 .../autoheader-nonfatal-warnings.patch             |    0
 .../autoreconf-exclude.patch                       |    0
 .../autoreconf-foreign.patch                       |    0
 .../autoreconf-gnuconfigize.patch                  |    0
 .../autoreconf-include.patch                       |    0
 .../{autoconf-2.65 => autoconf}/config_site.patch  |   19 ++-
 .../fix_path_xtra.patch                            |   14 +-
 .../path_prog_fixes.patch                          |    0
 .../program_prefix.patch                           |    0
 .../{autoconf_2.65.bb => autoconf_2.68.bb}         |    6 +-
 meta/recipes-devtools/bison/bison/m4.patch         |  131 --------------------
 .../bison/bison/uclibc-sched_param-def.patch       |   21 ---
 .../bison/{bison_2.4.3.bb => bison_2.5.bb}         |    7 +-
 .../{m4-native_1.4.15.bb => m4-native_1.4.16.bb}   |    0
 .../m4/{m4_1.4.15.bb => m4_1.4.16.bb}              |    6 +-
 26 files changed, 50 insertions(+), 174 deletions(-)
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

-- 
1.7.2.2



