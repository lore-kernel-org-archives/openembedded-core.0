Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QCHul-0003jg-Sn
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Apr 2011 22:52:54 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Apr 2011 13:50:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,241,1301900400"; d="scan'208";a="422133802"
Received: from unknown (HELO localhost) ([10.255.12.208])
	by azsmga001.ch.intel.com with ESMTP; 19 Apr 2011 13:50:28 -0700
Message-Id: <cover.1303246083.git.josh@linux.intel.com>
Old-Date: Tue, 19 Apr 2011 13:48:03 -0700
Date: Tue, 19 Apr 2011 13:50:18 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Joshua Lock <josh@linux.intel.com>
Subject: [PATCH 0/2] Fix clutter-1.6
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
X-List-Received-Date: Tue, 19 Apr 2011 20:52:54 -0000

From: Joshua Lock <josh@linux.intel.com>

With a recent patchset I changed clutter to depend on a json-glib recipe then
promptly didn't include that recipe in the patch series - apologies.

Further I've removed a patch from the 1.6 recipe which is no longer required.

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: josh/clutter
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/clutter

Thanks,
    Joshua Lock <josh@linux.intel.com>
---


Joshua Lock (2):
  json-glib: new recipe required by clutter
  clutter-1.6: drop no longer required patch

 meta/recipes-gnome/json-glib/json-glib_0.12.2.bb   |   20 ++++++++++++++++++++
 meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb |    5 ++---
 2 files changed, 22 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-gnome/json-glib/json-glib_0.12.2.bb

-- 
1.7.4.4



