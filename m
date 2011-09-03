Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Qze22-00005l-GR
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Sep 2011 02:24:22 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Sep 2011 17:19:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,321,1312182000"; d="scan'208";a="48351281"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.14.9])
	by fmsmga002.fm.intel.com with ESMTP; 02 Sep 2011 17:19:24 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Sep 2011 17:19:16 -0700
Message-Id: <cover.1315008793.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/2] Patches for hob wrapper script
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
X-List-Received-Date: Sat, 03 Sep 2011 00:24:22 -0000

This series adapts the wrapper script to provide 2 configuration files, as
required by the patch series I just sent to the BitBake list, and warns the
user that the UI may not be shown immediately if pseudo may need building.

Regards,
Joshua

The following changes since commit 6b5706d1f9ce7a3fd4d8f819ff8f3fd789665647:

  scripts: Show sensible warning messages if expected binaries don't exist (2011-09-02 14:20:32 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/hob
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/hob

Joshua Lock (2):
  scripts/hob: update to match recent hob changes
  scripts/hob: notify the user when the GUI won't launch immediately

 scripts/hob |   25 ++++++++++++++++++++-----
 1 files changed, 20 insertions(+), 5 deletions(-)

-- 
1.7.6



