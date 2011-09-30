Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1R9YMj-0007IC-0E
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 10:22:41 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 30 Sep 2011 01:16:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,465,1312182000"; d="scan'208";a="57288664"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by azsmga001.ch.intel.com with ESMTP; 30 Sep 2011 01:16:06 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 16:16:04 +0800
Message-Id: <cover.1317370299.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/4]Recipe upgrades
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
X-List-Received-Date: Fri, 30 Sep 2011 08:22:41 -0000

This commit includes some recipes upgrade: curl,diffutils,dropbear.
And update the distro_tracking_fields.inc

Thanks,
Lei

The following changes since commit 96241de59fdf548ae0f80cc9e4668f9ba11924ef:
  Matthew McClintock (1):
        Fix flac build on e500mc cores

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib lmei3/upgrade-0928
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/upgrade-0928

Mei Lei (4):
  curl: Upgrade from 7.21.7 to 7.22.0
  diffutils: Upgrade from 3.0 to 3.2.
  dropbear: Upgrade from 0.52 to 0.53.1
  distro_tracking_fields.inc: Update upgrade information

 .../conf/distro/include/distro_tracking_fields.inc |   25 +++++++++--------
 .../configure.patch                                |    0
 meta/recipes-core/dropbear/dropbear.inc            |    1 +
 .../dropbear/dropbear/allow-nopw.patch             |   14 +++++-----
 .../dropbear-0.53.1-static_build_fix.patch         |   29 ++++++++++++++++++++
 .../urandom-xauth-changes-to-options.h.patch       |   11 ++++---
 meta/recipes-core/dropbear/dropbear_0.52.bb        |    6 ----
 meta/recipes-core/dropbear/dropbear_0.53.1.bb      |    6 ++++
 .../{diffutils_3.0.bb => diffutils_3.2.bb}         |    4 +-
 .../curl/{curl_7.21.7.bb => curl_7.22.0.bb}        |    4 +-
 10 files changed, 66 insertions(+), 34 deletions(-)
 rename meta/recipes-core/dropbear/{dropbear-0.52 => dropbear-0.53.1}/configure.patch (100%)
 create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear-0.53.1-static_build_fix.patch
 delete mode 100644 meta/recipes-core/dropbear/dropbear_0.52.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_0.53.1.bb
 rename meta/recipes-extended/diffutils/{diffutils_3.0.bb => diffutils_3.2.bb} (84%)
 rename meta/recipes-support/curl/{curl_7.21.7.bb => curl_7.22.0.bb} (92%)



