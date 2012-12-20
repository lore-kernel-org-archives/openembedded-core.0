Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TlgCz-0005ZR-17
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 14:30:49 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Dec 2012 05:14:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,322,1355126400"; d="scan'208";a="260184592"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 20 Dec 2012 05:15:42 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2012 15:15:37 +0200
Message-Id: <1356009340-15874-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2 0/3] have input method modules cached at do-rootfs time
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Dec 2012 13:30:49 -0000

changes in v2:
 * added a new qemu.bbclass function that will return a string containing the
   command line needed to run a target binary through qemu at postinstall time;
 * use 'readelf -l' instead of 'readelf -a' for retrieving the dynamic loader
   path;

from v1:
Hi

This patchset will change the postinstall routine in gtk-immodules-cache.bbclass,
so it can run at do_rootfs time, and changes matchbox-keyboard recipe to use
the class.

Thanks,
Laurentiu

Laurentiu Palcu (3):
  qemu.bbclass: add qemu_run_binary() function
  gtk-immodules-cache.bbclass: allow for offline cache generation
  matchbox-keyboard: use the gtk-immodules-cache.bbclass

 meta/classes/gtk-immodules-cache.bbclass           |   17 ++++++++++++++++-
 meta/classes/qemu.bbclass                          |   17 +++++++++++++++++
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |   18 ++----------------
 3 files changed, 35 insertions(+), 17 deletions(-)

-- 
1.7.9.5



