Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RVt3Y-0002DJ-5a
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 23:55:12 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 30 Nov 2011 14:48:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,272,1320652800"; d="scan'208";a="42682067"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.113])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Nov 2011 14:48:29 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 14:48:26 -0800
Message-Id: <cover.1322693022.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.3
Subject: [PATCH 0/2] Upgrade gthumb, claim some recipes
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
X-List-Received-Date: Wed, 30 Nov 2011 22:55:12 -0000

This series upgrades Gthumb to 2.12.4 and updates the distro_tracking_fields
as I'm offering to maintain some recipes without a listed maintainer:
* gthumb
* json-glib
* xdg-utils

Cheers,
Joshua

The following changes since commit 36654d6d393cb8c8a545835184a96be4ae0c885d:

  grub: Use COMPATIBLE_HOST (2011-11-30 22:21:53 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/updates

Joshua Lock (2):
  gthumb: update to 2.12.4
  distro_tracking_fields: update gthumb and claim some recipes

 .../conf/distro/include/distro_tracking_fields.inc |   19 +++++++++++++++++--
 .../gthumb/{gthumb_2.12.3.bb => gthumb_2.12.4.bb}  |    5 ++---
 2 files changed, 19 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/gthumb/{gthumb_2.12.3.bb => gthumb_2.12.4.bb} (76%)

-- 
1.7.7.3



