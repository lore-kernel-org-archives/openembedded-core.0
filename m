Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QgdYW-0008Ia-EZ
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 16:03:20 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2011 06:59:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,521,1304319600"; d="scan'208";a="26744101"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.183])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2011 06:59:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 14:59:07 +0100
Message-Id: <cover.1310478977.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1] busybox: fix missing features due to lack of variable expansion
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
X-List-Received-Date: Tue, 12 Jul 2011 14:03:20 -0000

This fixes the issue with ipv4/ipv6 features not being enabled in busybox
(which Gary Thomas pointed out on the poky mailing list.)

The following change since commit e66c2999afa2b3efbce8bb46c89f9db5e15f35c7:

  libx11: ensure nativesdk uses correct DEPENDS and XCB flags (2011-07-10 09:49:06 +0100)

is available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/busybox-features-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/busybox-features-fix

Paul Eggleton (1):
  busybox: fix missing features due to lack of variable expansion

 meta/recipes-core/busybox/busybox.inc       |    4 ++--
 meta/recipes-core/busybox/busybox_1.18.4.bb |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.4.1



