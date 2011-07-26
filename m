Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QlZDx-0007y8-PL
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 06:26:29 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 25 Jul 2011 21:22:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,266,1309762800"; d="scan'208";a="34477908"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.14.158])
	by fmsmga001.fm.intel.com with ESMTP; 25 Jul 2011 21:22:02 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jul 2011 21:21:55 -0700
Message-Id: <cover.1311653945.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] Add remaining types to IMAGE_TYPES
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
X-List-Received-Date: Tue, 26 Jul 2011 04:26:30 -0000

My original patch to add the IMAGE_TYPES variable for use in hob missed
several image types from the list. The patch here fixes that.

The following changes since commit f10a3457cdfbb4a94978da998d178d4254632fa7:

  Move architecture specific TARGET_OS mangling into tune files (2011-07-25 14:19:54 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/image-types
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/image-types

Joshua Lock (1):
  classes/image_types: IMAGE_TYPES was missing some entries

 meta/classes/image_types.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.6



