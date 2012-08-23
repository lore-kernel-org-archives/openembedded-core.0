Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T4RiO-00008A-5m
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 09:20:28 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by orsmga102.jf.intel.com with ESMTP; 23 Aug 2012 00:08:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,298,1344236400"; d="scan'208";a="137018179"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.156])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Aug 2012 00:08:19 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2012 09:13:09 +0300
Message-Id: <1345702391-27078-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 0/2] Telepathy package upgrades
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
X-List-Received-Date: Thu, 23 Aug 2012 07:20:28 -0000

This is another set of package upgrades compiled on all architectures
and tested using core-image-sato-sdk.

Constantin Musca (2):
  telepathy-glib: update to 0.19.6
  telepathy-idle: upgrade to 0.1.12

 ...Fix-a-race-in-_gen-reentrant-methods.list.patch |   42 --------------------
 ...thy-glib_0.19.2.bb => telepathy-glib_0.19.6.bb} |    9 ++---
 .../fix-svc-gtk-doc.h-target.patch                 |   37 +++++++++++++++++
 ...thy-idle_0.1.11.bb => telepathy-idle_0.1.12.bb} |    9 +++--
 4 files changed, 46 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-connectivity/telepathy/telepathy-glib/0001-Fix-a-race-in-_gen-reentrant-methods.list.patch
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.19.2.bb => telepathy-glib_0.19.6.bb} (68%)
 create mode 100644 meta/recipes-connectivity/telepathy/telepathy-idle-0.1.12/fix-svc-gtk-doc.h-target.patch
 rename meta/recipes-connectivity/telepathy/{telepathy-idle_0.1.11.bb => telepathy-idle_0.1.12.bb} (72%)

-- 
1.7.9.5



