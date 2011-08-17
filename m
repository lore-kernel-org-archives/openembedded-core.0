Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Qtizs-0007RR-EO
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 18:29:40 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Aug 2011 09:25:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,240,1312182000"; d="scan'208";a="40645781"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.14.198])
	by fmsmga002.fm.intel.com with ESMTP; 17 Aug 2011 09:25:00 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Aug 2011 09:24:53 -0700
Message-Id: <cover.1313598136.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] Disable dtrace and system tap for glib-2.0-native
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
X-List-Received-Date: Wed, 17 Aug 2011 16:29:40 -0000

Per discussion on the Yocto mailing list:
https://lists.yoctoproject.org/pipermail/yocto/2011-August/004571.html

Regards,
Joshua

The following changes since commit 2e83e6755441cb14bd907d306974338c15173189:

  kernel: restore crtsavres.o to enable building external modules on powerpc (2011-08-17 15:46:16 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/work
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/work

Joshua Lock (1):
  glib-2.0: explicitly disable dtrace and systemtap for native varaint

 meta/recipes-core/glib-2.0/glib.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.6



