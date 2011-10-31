Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RKzt5-0000KL-Hu
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 22:59:23 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 31 Oct 2011 14:53:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="69521504"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.199.77])
	by orsmga002.jf.intel.com with ESMTP; 31 Oct 2011 14:53:17 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Oct 2011 14:53:13 -0700
Message-Id: <cover.1320097805.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH 0/1] Xfce Terminal Support v2
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
X-List-Received-Date: Mon, 31 Oct 2011 21:59:23 -0000

Turns out v1 of this was pretty useless, thanks to Chris for reviewing and
spotting most of my bloopers. I keep telling myself not to submit patches
before the weekend, but never listen.

I've not had chance to test this on Ubuntu/Debian but am reasonably confident
it'll work there now.

Thanks,
Joshua

The following changes since commit ff13e06892f102d915855cde50896349b07b3717:

  clutter-gtk: add LIC_FILES_CHKSUM to include file (2011-10-31 10:46:59 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/work
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/work

Joshua Lock (1):
  lib/oe/terminal: add support for XFCE's terminal emulator

 meta/lib/oe/terminal.py |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

-- 
1.7.7



