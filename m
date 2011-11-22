Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RSeAf-0002v9-O3
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 01:25:10 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Nov 2011 16:18:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,550,1315206000"; d="scan'208";a="87908253"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by fmsmga001.fm.intel.com with ESMTP; 21 Nov 2011 16:18:38 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Nov 2011 16:18:36 -0800
Message-Id: <41e45e78c10e657a87f149f2543e6d29e2d361a9.1321921040.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <cover.1321921040.git.nitin.a.kamble@intel.com>
References: <cover.1321921040.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] netbase.bbappend: sync up with oecore/yocto layer
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
X-List-Received-Date: Tue, 22 Nov 2011 00:25:10 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The netbase recipe from meta has upgraded to 4.47, but the netbase.bbappend
from meta-yocto was still at 4.46, causing bitbake error like this:
ERROR: No recipes available for:
  /home/nitin/prj/poky.git/meta-yocto/recipes-core/netbase/netbase_4.46.bbappend
This commit Renames netbase.bbappend and related files to match with
the 4.47 version.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../beagleboard/interfaces                         |    0
 ...netbase_4.46.bbappend => netbase_4.47.bbappend} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-yocto/recipes-core/netbase/{netbase-4.46 => netbase-4.47}/beagleboard/interfaces (100%)
 rename meta-yocto/recipes-core/netbase/{netbase_4.46.bbappend => netbase_4.47.bbappend} (100%)

diff --git a/meta-yocto/recipes-core/netbase/netbase-4.46/beagleboard/interfaces b/meta-yocto/recipes-core/netbase/netbase-4.47/beagleboard/interfaces
similarity index 100%
rename from meta-yocto/recipes-core/netbase/netbase-4.46/beagleboard/interfaces
rename to meta-yocto/recipes-core/netbase/netbase-4.47/beagleboard/interfaces
diff --git a/meta-yocto/recipes-core/netbase/netbase_4.46.bbappend b/meta-yocto/recipes-core/netbase/netbase_4.47.bbappend
similarity index 100%
rename from meta-yocto/recipes-core/netbase/netbase_4.46.bbappend
rename to meta-yocto/recipes-core/netbase/netbase_4.47.bbappend
-- 
1.7.4.4



