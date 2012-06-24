Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SirKS-0004YL-9c
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Jun 2012 20:14:32 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2012 11:03:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="161983133"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.175])
	by orsmga002.jf.intel.com with ESMTP; 24 Jun 2012 11:03:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Jun 2012 11:03:25 -0700
Message-Id: <cover.1340560914.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 00/14] Package Updating
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
X-List-Received-Date: Sun, 24 Jun 2012 18:14:32 -0000

Richard,

Here is a patch of updates.

Sau!

The following changes since commit e2cc4a44d510e0d473d15f207c1c886db6a5ccf7:

  [PATCH] guile: fix compilation on MIPS/PPC (2012-06-21 13:41:12 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (14):
  sqlite3: Update to 3.7.13
  psmisc: Update to 22.19
  sysstat: Update to 10.0.5
  util-linux: Update to 2.21.2
  libxml2: Update to 2.8.0
  mx: Upgrade to 1.4.6
  libxml-simple-perl: Upgrade to 2.20
  cracklib: Upgrade to 2.8.19
  resolvconf: Upgrade to 1.67
  libtasn1: Upgrade to 2.13
  gnutls: Upgrade to 2.12.20
  foomatic-filters: Upgrade to 4.0.16
  libidn: Upgrade to 1.25
  libtiff: Upgrade to 4.0.2

 .../{resolvconf_1.65.bb => resolvconf_1.67.bb}     |    4 +-
 meta/recipes-core/libxml/libxml2.inc               |    2 +-
 .../libxml/libxml2/fix_version_info.patch          |   23 ----
 .../libxml2/libxml2_fix_for_automake_1.12.patch    |   23 ----
 meta/recipes-core/libxml/libxml2_2.7.8.bb          |    9 --
 meta/recipes-core/libxml/libxml2_2.8.0.bb          |    6 +
 .../util-linux/fix_NL_TIME_FIRST_WEEKDAY.patch     |   24 -----
 .../{util-linux_2.21.1.bb => util-linux_2.21.2.bb} |    7 +-
 ...ple-perl_2.18.bb => libxml-simple-perl_2.20.bb} |    8 +-
 .../{cracklib_2.8.18.bb => cracklib_2.8.19.bb}     |    6 +-
 ...ilters_4.0.15.bb => foomatic-filters_4.0.16.bb} |    4 +-
 .../libidn/{libidn_1.24.bb => libidn_1.25.bb}      |    6 +-
 .../psmisc/{psmisc_22.16.bb => psmisc_22.19.bb}    |    6 +-
 .../{sysstat_10.0.4.bb => sysstat_10.0.5.bb}       |    4 +-
 .../mx/files/introspection-m4.patch                |  106 --------------------
 .../mx/{mx_1.4.2.bb => mx_1.4.6.bb}                |    9 +-
 .../libtiff/{tiff_4.0.1.bb => tiff_4.0.2.bb}       |    6 +-
 .../{gnutls-2.12.19 => gnutls}/configure-fix.patch |    0
 .../correct_rpl_gettimeofday_signature.patch       |    0
 .../fix-gettext-version.patch                      |    0
 .../gnutls-openssl.patch                           |    0
 .../gnutls-texinfo-euro.patch                      |    0
 .../{gnutls_2.12.19.bb => gnutls_2.12.20.bb}       |    4 +-
 .../gnutls/{libtasn1_2.12.bb => libtasn1_2.13.bb}  |    6 +-
 meta/recipes-support/sqlite/sqlite3_3.7.11.bb      |   11 --
 meta/recipes-support/sqlite/sqlite3_3.7.13.bb      |   11 ++
 26 files changed, 52 insertions(+), 233 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.65.bb => resolvconf_1.67.bb} (88%)
 delete mode 100644 meta/recipes-core/libxml/libxml2/fix_version_info.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/libxml2_fix_for_automake_1.12.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2_2.7.8.bb
 create mode 100644 meta/recipes-core/libxml/libxml2_2.8.0.bb
 delete mode 100644 meta/recipes-core/util-linux/util-linux/fix_NL_TIME_FIRST_WEEKDAY.patch
 rename meta/recipes-core/util-linux/{util-linux_2.21.1.bb => util-linux_2.21.2.bb} (86%)
 rename meta/recipes-devtools/perl/{libxml-simple-perl_2.18.bb => libxml-simple-perl_2.20.bb} (58%)
 rename meta/recipes-extended/cracklib/{cracklib_2.8.18.bb => cracklib_2.8.19.bb} (70%)
 rename meta/recipes-extended/foomatic/{foomatic-filters_4.0.15.bb => foomatic-filters_4.0.16.bb} (90%)
 rename meta/recipes-extended/libidn/{libidn_1.24.bb => libidn_1.25.bb} (89%)
 rename meta/recipes-extended/psmisc/{psmisc_22.16.bb => psmisc_22.19.bb} (42%)
 rename meta/recipes-extended/sysstat/{sysstat_10.0.4.bb => sysstat_10.0.5.bb} (42%)
 delete mode 100644 meta/recipes-graphics/mx/files/introspection-m4.patch
 rename meta/recipes-graphics/mx/{mx_1.4.2.bb => mx_1.4.6.bb} (71%)
 rename meta/recipes-multimedia/libtiff/{tiff_4.0.1.bb => tiff_4.0.2.bb} (84%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.19 => gnutls}/configure-fix.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.19 => gnutls}/correct_rpl_gettimeofday_signature.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.19 => gnutls}/fix-gettext-version.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.19 => gnutls}/gnutls-openssl.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.19 => gnutls}/gnutls-texinfo-euro.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls_2.12.19.bb => gnutls_2.12.20.bb} (77%)
 rename meta/recipes-support/gnutls/{libtasn1_2.12.bb => libtasn1_2.13.bb} (80%)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.11.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.13.bb

-- 
1.7.7.6



