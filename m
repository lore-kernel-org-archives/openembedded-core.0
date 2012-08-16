Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T20fn-0000SA-JE
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 16:03:43 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Aug 2012 06:50:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,778,1336374000"; d="scan'208";a="134986083"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.33])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Aug 2012 06:50:38 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Aug 2012 15:55:14 +0300
Message-Id: <1345121720-25925-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 0/6] Package upgrades
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
X-List-Received-Date: Thu, 16 Aug 2012 14:03:43 -0000

This is another set of package upgrades compiled on all architectures
and tested using core-image-sato-sdk. The connman 1.4 recipe doesn't
need the 0001-storage-check-that-the-string-isn-t-empty-before-spl.patch
anymore.

Constantin Musca (6):
  dbus: upgrade to 1.6.4
  ofono: upgrade to 1.10
  iproute2: upgrade to 3.5.0
  iptables: upgrade to 1.4.15
  pulseaudio: upgrade to 2.1
  connman: upgrade to 1.4

 ...ck-that-the-string-isn-t-empty-before-spl.patch |   37 --------------------
 .../connman/{connman_1.3.bb => connman_1.4.bb}     |    9 +++--
 .../configure-cross.patch                          |    0
 .../{iproute2_3.4.0.bb => iproute2_3.5.0.bb}       |    4 +--
 .../ofono/{ofono_1.8.bb => ofono_1.10.bb}          |    6 ++--
 .../dbus/{dbus-1.4.20 => dbus-1.6.4}/dbus-1.init   |    0
 .../dbus/{dbus-1.4.20 => dbus-1.6.4}/tmpdir.patch  |    0
 .../dbus/{dbus_1.4.20.bb => dbus_1.6.4.bb}         |    4 +--
 .../{iptables_1.4.14.bb => iptables_1.4.15.bb}     |    4 +--
 .../{pulseaudio_2.0.bb => pulseaudio_2.1.bb}       |    4 +--
 10 files changed, 15 insertions(+), 53 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-storage-check-that-the-string-isn-t-empty-before-spl.patch
 rename meta/recipes-connectivity/connman/{connman_1.3.bb => connman_1.4.bb} (69%)
 rename meta/recipes-connectivity/iproute2/{iproute2-3.4.0 => iproute2-3.5.0}/configure-cross.patch (100%)
 rename meta/recipes-connectivity/iproute2/{iproute2_3.4.0.bb => iproute2_3.5.0.bb} (51%)
 rename meta/recipes-connectivity/ofono/{ofono_1.8.bb => ofono_1.10.bb} (63%)
 rename meta/recipes-core/dbus/{dbus-1.4.20 => dbus-1.6.4}/dbus-1.init (100%)
 rename meta/recipes-core/dbus/{dbus-1.4.20 => dbus-1.6.4}/tmpdir.patch (100%)
 rename meta/recipes-core/dbus/{dbus_1.4.20.bb => dbus_1.6.4.bb} (21%)
 rename meta/recipes-extended/iptables/{iptables_1.4.14.bb => iptables_1.4.15.bb} (91%)
 rename meta/recipes-multimedia/pulseaudio/{pulseaudio_2.0.bb => pulseaudio_2.1.bb} (71%)

-- 
1.7.9.5



