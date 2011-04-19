Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QCJm9-0005hb-Ee
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Apr 2011 00:52:05 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Apr 2011 15:49:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,241,1301900400"; d="scan'208";a="681223412"
Received: from unknown (HELO localhost) ([10.255.13.54])
	by fmsmga002.fm.intel.com with ESMTP; 19 Apr 2011 15:49:40 -0700
Message-Id: <cover.1303253280.git.josh@linux.intel.com>
Old-Date: Tue, 19 Apr 2011 15:48:00 -0700
Date: Tue, 19 Apr 2011 15:49:40 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Joshua Lock <josh@linux.intel.com>
Subject: [PATCH v2 0/3] Fix and update clutter-1.6
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
X-List-Received-Date: Tue, 19 Apr 2011 22:52:05 -0000

From: Joshua Lock <josh@linux.intel.com>

Same as the v1 patch set only with an extra patch to update to the latest
release in the Clutter 1.6 stable series.

With a recent patchset I changed clutter to depend on a json-glib recipe then
promptly didn't include that recipe in the patch series - apologies.

Further I've removed a patch from the 1.6 recipe which is no longer required.

Finally, Clutter 1.6.14 - hurrah!

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: josh/clutter
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/clutter

Thanks,
    Joshua Lock <josh@linux.intel.com>
---


Joshua Lock (3):
  json-glib: new recipe required by clutter
  clutter-1.6: drop no longer required patch
  clutter-1.6: update to 1.6.14

 meta/recipes-gnome/json-glib/json-glib_0.12.2.bb   |   20 ++++++++++++++++++++
 ...{clutter-1.6_1.6.8.bb => clutter-1.6_1.6.14.bb} |    9 ++++-----
 2 files changed, 24 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-gnome/json-glib/json-glib_0.12.2.bb
 rename meta/recipes-graphics/clutter/{clutter-1.6_1.6.8.bb => clutter-1.6_1.6.14.bb} (66%)

-- 
1.7.4.4



