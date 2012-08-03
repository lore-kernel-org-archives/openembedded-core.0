Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SxOWv-00071K-Bh
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 22:31:29 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Aug 2012 13:19:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="193014104"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by fmsmga001.fm.intel.com with ESMTP; 03 Aug 2012 13:19:46 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Aug 2012 23:19:35 +0300
Message-Id: <cover.1344022584.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/5] Run postinst scriptlets at do_rootfs time
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
X-List-Received-Date: Fri, 03 Aug 2012 20:31:29 -0000

Hi,

This first patchset is part of series that will move as many postinst operations as
possible to the do_rootfs time, hence, taking advantage of the processing power of
the host and reduce target's first boot time. This patchset, in particular, is
focused on gtk-update-icon-cache:  which can be very time consuming on
slow machines.

Thanks,
Laurentiu

The following changes since commit ed6beed4b309c5d9ccaa88e620ea27e5ee045757:

  gcc: Bump PR since there have been several gcc changes and various problems reported and this should flush anything stale out (2012-08-03 10:32:35 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/postinst
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/postinst

Laurentiu Palcu (5):
  gtk+: enable gtk+-native
  sato-icon-theme: make postinst scriplet run at do_rootfs time
  package_rpm: export the native directory to the postinst scriptlets
  gtk-icon-cache: call postinst scriplet at do_rootfs time
  gdk-pixbuf: allow postinst scriplet to be called at do_rootfs time

 meta/classes/gtk-icon-cache.bbclass                |   10 ++--------
 meta/classes/package_rpm.bbclass                   |    1 +
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |    6 ++++--
 meta/recipes-gnome/gtk+/gtk+_2.24.8.bb             |    5 ++++-
 .../sato-icon-theme/sato-icon-theme.inc            |   10 +++++-----
 5 files changed, 16 insertions(+), 16 deletions(-)

-- 
1.7.9.5



