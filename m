Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TlMKx-0004ZM-NG
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 17:17:40 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Dec 2012 08:02:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,318,1355126400"; d="scan'208";a="264490047"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2012 08:02:52 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2012 18:02:47 +0200
Message-Id: <1355932969-25071-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] have input method modules cached at do-rootfs time
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
X-List-Received-Date: Wed, 19 Dec 2012 16:17:40 -0000

Hi,

This patchset will change the postinstall routine in gtk-immodules-cache.bbclass,
so it can run at do_rootfs time, and changes matchbox-keyboard recipe to use
the class.

Thanks,
Laurentiu

Laurentiu Palcu (2):
  gtk-immodules-cache.bbclass: allow for offline cache generation
  matchbox-keyboard: use the gtk-immodules-cache.bbclass

 meta/classes/gtk-immodules-cache.bbclass           |   22 +++++++++++++++++++-
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |   18 ++--------------
 2 files changed, 23 insertions(+), 17 deletions(-)

-- 
1.7.9.5



