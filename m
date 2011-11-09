Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RO70O-0002cc-6j
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 13:11:48 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Nov 2011 04:05:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="72731998"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.103])
	by orsmga002.jf.intel.com with ESMTP; 09 Nov 2011 04:05:31 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 12:05:27 +0000
Message-Id: <cover.1320839130.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/2] RPM/upgrade fixes
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
X-List-Received-Date: Wed, 09 Nov 2011 12:11:48 -0000

This is the fix for the problem Anders reported on the Yocto mailing
list (now filed as Yocto bug #1760). I've checked through usage of
postrm/prerm in oe-core and meta-oe and it looks OK to me, but it
would help for others to double-check it. 

I considered whether or not it would be worth bumping PR on every
recipe that uses prerm/postrm, however this is a *lot* of recipes.

Also included is another fix for a minor issue I discovered when
uninstalling busybox.

The following changes since commit 25fae81538a92e15eab3fc169ebce44505f67839:

  python: skip setup.py 'import check' when cross-compiling (2011-11-08 21:44:23 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/rmscripts
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/rmscripts

Paul Eggleton (2):
  classes/package_rpm: disable uninstall scripts for upgrades
  busybox: add grep to temporary links during uninstall

 meta/classes/package_rpm.bbclass            |   18 ++++++++++++++++--
 meta/recipes-core/busybox/busybox.inc       |    1 +
 meta/recipes-core/busybox/busybox_1.18.5.bb |    2 +-
 3 files changed, 18 insertions(+), 3 deletions(-)

-- 
1.7.5.4



