Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QjKEr-0004QX-GN
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 02:02:09 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jul 2011 16:58:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,231,1309762800"; d="scan'208";a="29979617"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.14.85])
	by fmsmga002.fm.intel.com with ESMTP; 19 Jul 2011 16:58:02 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2011 16:57:54 -0700
Message-Id: <cover.1311119488.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] Fix Pseudo on hosts with older compilers
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
X-List-Received-Date: Wed, 20 Jul 2011 00:02:09 -0000

The realpath_fix patch included an unitialised variable which modern GCC
cleverly optimises away, however hosts with older GCC like CentOS 5.x weren't
so lucky and... BOOM.

See http://git.yoctoproject.org/cgit/cgit.cgi/pseudo/commit/?id=4a646c8bbe73ca830cb8c2e80be4b457d925cdd4 for a more detailed description.

The following changes since commit 6ca80453618fa308cc2d6329450aaf5dfdf2d610:

  Fixed concurrency problem for ZIP packed recipes. (2011-07-19 18:03:04 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/pseudo
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/pseudo

Joshua Lock (1):
  pseudo: fix uninitialised variable in realpath_fix.patch

 .../pseudo/pseudo/realpath_fix.patch               |    2 +-
 meta/recipes-devtools/pseudo/pseudo_1.1.1.bb       |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.6



