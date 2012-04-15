Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SJEw1-0006yD-3D
	for openembedded-core@lists.openembedded.org;
	Sun, 15 Apr 2012 04:11:25 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Apr 2012 19:02:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="141825617"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.47])
	by fmsmga001.fm.intel.com with ESMTP; 14 Apr 2012 19:01:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Apr 2012 03:01:56 +0100
Message-Id: <cover.1334455199.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] Fix connman-gnome for connman 0.79
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
X-List-Received-Date: Sun, 15 Apr 2012 02:11:25 -0000

The following change since commit 4396db54dba4afdb9f1099f4e386dc25c76f49fb:

  grub: Add missing dependency on autogen-native to avoid build failures (2012-04-14 23:42:16 +0100)

is available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/connman-gnome
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/connman-gnome

Paul Eggleton (1):
  connman-gnome: connman 0.79 API fixes

 ...0001-Monitor-the-Manager-s-State-property.patch |   48 +
 .../0002-Update-for-ConnMan-0.79-API-changes.patch |  865 ++++++++++++++++++
 .../0003-Fix-setting-IPv4-configuration.patch      |   85 ++
 ...Handle-WiFi-authentication-using-an-agent.patch |  923 ++++++++++++++++++++
 ...emove-all-handling-of-Passphrase-property.patch |  249 ++++++
 ...ix-status-descriptions-in-properties-tree.patch |   42 +
 .../connman/connman-gnome/3g.patch                 |  507 -----------
 .../connman/connman-gnome/security-type.patch      |   41 -
 .../connman/connman-gnome_0.5.bb                   |   14 +-
 9 files changed, 2221 insertions(+), 553 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/0001-Monitor-the-Manager-s-State-property.patch
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/0002-Update-for-ConnMan-0.79-API-changes.patch
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/0003-Fix-setting-IPv4-configuration.patch
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/0004-Handle-WiFi-authentication-using-an-agent.patch
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/0005-Remove-all-handling-of-Passphrase-property.patch
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/0006-Fix-status-descriptions-in-properties-tree.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/3g.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/security-type.patch

-- 
1.7.5.4



