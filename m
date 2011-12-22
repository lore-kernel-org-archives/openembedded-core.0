Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1Rdc9J-0002w5-2e
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 07:29:05 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Dec 2011 22:21:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="90281156"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by orsmga002.jf.intel.com with ESMTP; 21 Dec 2011 22:21:57 -0800
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2011 14:17:21 +0800
Message-Id: <cover.1324534102.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/2]curl:upgrade from 7.22.0 to 7.23.1 and fix some typo issues.
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
X-List-Received-Date: Thu, 22 Dec 2011 06:29:05 -0000

Hi all,
	Upgrade curl from 7.22.0 to 7.23.1.
	Some typo issues exist in distro_tracking_fields.inc reported by pkg-report system, so fix them in this patch.

Thanks,
Lei

The following changes since commit db446421933d640528328e46a29f828a36d6649b:
  Richard Purdie (1):
        multilib.conf: Enable shadow-sysroot and libffi

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib lmei3/upgrade-12222
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/upgrade-12222

Mei Lei (2):
  curl: Upgrade from 7.22.0 to 7.23.1
  distro_tracking_fields: Update curl info and fix other recipes' typo
    issues

 .../conf/distro/include/distro_tracking_fields.inc |   30 ++++++++++----------
 .../curl/{curl_7.22.0.bb => curl_7.23.1.bb}        |    4 +-
 2 files changed, 17 insertions(+), 17 deletions(-)
 rename meta/recipes-support/curl/{curl_7.22.0.bb => curl_7.23.1.bb} (92%)



