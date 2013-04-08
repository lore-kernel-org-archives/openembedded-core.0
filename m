Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UPDvo-0000fw-69
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 17:24:29 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Apr 2013 08:07:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,432,1363158000"; d="scan'208";a="291767408"
Received: from lpalcu-linux.rb.intel.com (HELO localhost.localdomain)
	([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 08 Apr 2013 08:06:43 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Apr 2013 18:06:39 +0300
Message-Id: <1365433601-24194-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] Fix postinstall fallback and create gtk-update-icon-cache wrapper script
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
X-List-Received-Date: Mon, 08 Apr 2013 15:24:30 -0000

Laurentiu Palcu (2):
  image.bbclass: fix postinstall intercepts fallback
  gtk-update-icon-cache-native: create wrapper script

 meta/classes/image.bbclass                         |    2 +-
 .../gtk+/gtk-update-icon-cache-native_3.4.4.bb     |    4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
1.7.9.5



