Return-Path: <ionutx.radu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B8E606A5A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 12:40:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 May 2013 05:38:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,764,1363158000"; d="scan'208";a="344953602"
Received: from work.rb.intel.com ([10.237.105.51])
	by orsmga002.jf.intel.com with ESMTP; 29 May 2013 05:40:48 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2013 15:42:56 +0300
Message-Id: <cover.1369831109.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH v3 0/7] Package Upgrades
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
X-List-Received-Date: Wed, 29 May 2013 12:40:48 -0000

Sending only the cover letter for v3.

Changes in v3:
 * matchbox-keyboard: added LIC_FILES_CHKSUM change explaination
 * matchbox-keyboard: added png-fix.patch drop explaination

The following changes since commit fa4b1fa2577fb1a8128154c2f1417df575dbb022:

  bitbake: cooker/cookerdata: Improve configuration object handling (2013-05-24 10:34:53 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ionutx/work
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ionutx/work

Ionut Radu (7):
  apt: Updated from 0.9.7.8 to 0.9.8.1
  freetype: Updated from 2.4.11 to 2.4.12
  libtasn1: Updated from 2.14 to 3.3
  libsoup-2.4: Update from 2.42.1 to 2.43.1
  matchbox-keyboard: Update to git HEAD
    135daab9eb4cd3647c02e82687f96d93619
  matchbox-terminal: Update to git HEAD
    452bca253492a97a587f440289b9ab27d217353e
  settings-daemon: Update to git HEAD
    9a99528b02255450db81176abd9bbcc1dab9a4c1

 .../disable-configure-in-makefile.patch            |    0
 .../fix-gcc-4.6-null-not-defined.patch             |    0
 .../{apt-0.9.7.8 => apt-0.9.8.1}/makerace.patch    |    0
 .../no-ko-translation.patch                        |    0
 .../{apt-0.9.7.8 => apt-0.9.8.1}/no-nls-dpkg.patch |    0
 .../{apt-0.9.7.8 => apt-0.9.8.1}/noconfigure.patch |    0
 .../apt/{apt-0.9.7.8 => apt-0.9.8.1}/nodoc.patch   |    0
 .../truncate-filename.patch                        |    0
 .../{apt-0.9.7.8 => apt-0.9.8.1}/use-host.patch    |    0
 ...apt-native_0.9.7.8.bb => apt-native_0.9.8.1.bb} |    0
 .../apt/{apt_0.9.7.8.bb => apt_0.9.8.1.bb}         |    4 ++--
 .../no-hardcode.patch                              |    0
 .../{freetype_2.4.11.bb => freetype_2.4.12.bb}     |   11 ++++------
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |   21 ++++++++++----------
 .../matchbox-terminal/matchbox-terminal_git.bb     |    3 +--
 .../settings-daemon/settings-daemon_git.bb         |    2 +-
 .../gnutls/{libtasn1_2.14.bb => libtasn1_3.3.bb}   |    6 ++----
 ...libsoup-2.4_2.42.1.bb => libsoup-2.4_2.43.1.bb} |    4 ++--
 18 files changed, 22 insertions(+), 29 deletions(-)
 rename meta/recipes-devtools/apt/{apt-0.9.7.8 => apt-0.9.8.1}/disable-configure-in-makefile.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.7.8 => apt-0.9.8.1}/fix-gcc-4.6-null-not-defined.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.7.8 => apt-0.9.8.1}/makerace.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.7.8 => apt-0.9.8.1}/no-ko-translation.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.7.8 => apt-0.9.8.1}/no-nls-dpkg.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.7.8 => apt-0.9.8.1}/noconfigure.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.7.8 => apt-0.9.8.1}/nodoc.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.7.8 => apt-0.9.8.1}/truncate-filename.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.7.8 => apt-0.9.8.1}/use-host.patch (100%)
 rename meta/recipes-devtools/apt/{apt-native_0.9.7.8.bb => apt-native_0.9.8.1.bb} (100%)
 rename meta/recipes-devtools/apt/{apt_0.9.7.8.bb => apt_0.9.8.1.bb} (74%)
 rename meta/recipes-graphics/freetype/{freetype-2.4.11 => freetype-2.4.12}/no-hardcode.patch (100%)
 rename meta/recipes-graphics/freetype/{freetype_2.4.11.bb => freetype_2.4.12.bb} (83%)
 rename meta/recipes-support/gnutls/{libtasn1_2.14.bb => libtasn1_3.3.bb} (81%)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.42.1.bb => libsoup-2.4_2.43.1.bb} (85%)

-- 
1.7.10.4


