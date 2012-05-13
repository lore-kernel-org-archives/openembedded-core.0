Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1STUhf-00030b-NE
	for openembedded-core@lists.openembedded.org;
	Sun, 13 May 2012 11:02:59 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 13 May 2012 01:53:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="99477253"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.101])
	by AZSMGA002.ch.intel.com with ESMTP; 13 May 2012 01:52:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Scott Garman <scott.a.garman@intel.com>
Date: Sun, 13 May 2012 09:52:56 +0100
Message-Id: <cover.1336898939.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] Fix buildhistory depgraphs with ipk/deb
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
X-List-Received-Date: Sun, 13 May 2012 09:03:00 -0000

This fix should also go into 1.2.1.

The following change since commit cab85fd0b481cdbf36477348de75352be3f38ca2:

  gdk-pixbuf: Drop unneeded RPROVIDES (2012-05-12 11:23:27 +0100)

is available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-depgraph-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-depgraph-fix

Paul Eggleton (1):
  classes/rootfs_*: fix splitting package dependency strings

 meta/classes/rootfs_deb.bbclass |    4 ++--
 meta/classes/rootfs_ipk.bbclass |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.7.5.4



