Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1SeEfb-0004yT-4i
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 02:09:15 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2012 16:58:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="151619930"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.198.61])
	by orsmga001.jf.intel.com with ESMTP; 11 Jun 2012 16:58:40 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jun 2012 16:58:37 -0700
Message-Id: <cover.1339458406.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.10.2
Subject: [2011-1 PATCH 0/1] Backport a fix for newer Ubuntu releases
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
X-List-Received-Date: Tue, 12 Jun 2012 00:09:15 -0000

Single change series for Edison to fix building ghostscript-native on newer Ubuntu
releases.

Cheers,
Joshua

The following changes since commit ab2a4591c4c3926a960f18fa7e848f5d41255e14:

  populate_sdk_ipk.bbclass: Ensure the correct environment is setup for postinstalls (2012-05-21 22:14:59 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib josh/edison
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/edison

Richard Purdie (1):
  ghostscript-native: Ensure the sys/time/h fix is applied for native
    builds

 meta/recipes-extended/ghostscript/ghostscript_9.02.bb |    1 +
 1 file changed, 1 insertion(+)

-- 
1.7.10.2



