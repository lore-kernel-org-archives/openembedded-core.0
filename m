Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T4Wua-0001Dd-7b
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 14:53:24 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 23 Aug 2012 05:40:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,300,1344236400"; d="scan'208";a="209459714"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.156])
	by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2012 05:40:10 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2012 14:44:59 +0300
Message-Id: <1345722302-25467-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 0/3] Package upgrades
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
X-List-Received-Date: Thu, 23 Aug 2012 12:53:24 -0000

This is another set of package upgrades compiled on all architectures
and tested using core-image-sato.

Constantin Musca (3):
  foomatic-filters: upgrade to 4.0.17
  libnfsidmap: upgrade to 0.25
  dbus-glib: upgrade to 0.100

 .../nfs-utils/files/fix-ac-prereq.patch            |    6 ++----
 .../{libnfsidmap_0.24.bb => libnfsidmap_0.25.bb}   |    6 +++---
 .../no-examples.patch                              |    0
 .../test-install-makefile.patch                    |    0
 .../test-service-glib-include-glib-only.patch      |   20 --------------------
 meta/recipes-core/dbus/dbus-glib.inc               |    1 -
 .../dbus/{dbus-glib_0.98.bb => dbus-glib_0.100.bb} |    6 +++---
 ...ilters_4.0.16.bb => foomatic-filters_4.0.17.bb} |    6 +++---
 8 files changed, 11 insertions(+), 34 deletions(-)
 rename meta/recipes-connectivity/nfs-utils/{libnfsidmap_0.24.bb => libnfsidmap_0.25.bb} (74%)
 rename meta/recipes-core/dbus/{dbus-glib-0.98 => dbus-glib-0.100}/no-examples.patch (100%)
 rename meta/recipes-core/dbus/{dbus-glib-0.98 => dbus-glib-0.100}/test-install-makefile.patch (100%)
 delete mode 100644 meta/recipes-core/dbus/dbus-glib-0.98/test-service-glib-include-glib-only.patch
 rename meta/recipes-core/dbus/{dbus-glib_0.98.bb => dbus-glib_0.100.bb} (13%)
 rename meta/recipes-extended/foomatic/{foomatic-filters_4.0.16.bb => foomatic-filters_4.0.17.bb} (90%)

-- 
1.7.9.5



