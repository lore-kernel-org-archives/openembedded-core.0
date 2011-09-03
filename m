Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qztj5-0002Wc-J4
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Sep 2011 19:09:51 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Sep 2011 10:04:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="44776168"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.30])
	by orsmga002.jf.intel.com with ESMTP; 03 Sep 2011 10:04:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Sep 2011 10:04:49 -0700
Message-Id: <cover.1315069299.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] Fix gettext dependency issue
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
X-List-Received-Date: Sat, 03 Sep 2011 17:09:51 -0000

Use gettext's internal libraries for libxml and libcroco to
ensure that there is not any strange behavior if ordering of
the build of these items changes.

The gettext-tools configure script looks for a libxml and libcroco
in sysroot and this can cause an unforseen dependency issue.

Sau!

The following changes since commit 0616557a8c29b42bae0ffd5fd665a046810047e4:

  populate_sdk: We need to ensure that the SDK sysroot reflects PACKAGE_ARCH (2011-09-02 23:38:00 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (1):
  gettext: use included libxml and libcroco

 meta/recipes-core/gettext/gettext_0.18.1.1.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

-- 
1.7.6



