Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1RnPwO-0004Uv-Qx
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 08:28:17 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Jan 2012 23:20:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113485224"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jan 2012 23:20:37 -0800
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jan 2012 15:18:27 +0800
Message-Id: <cover.1326870966.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] install new packages in adt-installer
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
X-List-Received-Date: Wed, 18 Jan 2012 07:28:17 -0000

This pathc fixed YOCTO bug #1909 by installing autoconf-nativesdk and
automake-nativesdk packages in adt-installer.

The following changes since commit bd047935305c872b565f30b46c94b7077e5fb3a2:
  Richard Purdie (1):
        patch.bbclass: Ensure the DATE and SRCDATE variable exclusions apply to the correct function

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/bug1909
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/bug1909

Lianhao Lu (1):
  adt-installer: install autoconf(/automake)-nativesdk

 .../adt-installer/scripts/adt_installer_internal   |   18 ++++++------------
 .../installer/adt-installer_1.0.bb                 |    2 +-
 2 files changed, 7 insertions(+), 13 deletions(-)



