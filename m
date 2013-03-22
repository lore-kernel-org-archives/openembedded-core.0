Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kevin.strasser@linux.intel.com>) id 1UJ8kt-0008Qv-Nv
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 21:40:09 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Mar 2013 13:21:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,893,1355126400"; d="scan'208";a="283374430"
Received: from wrk.jf.intel.com ([10.7.202.62])
	by orsmga001.jf.intel.com with ESMTP; 22 Mar 2013 13:23:07 -0700
From: Kevin Strasser <kevin.strasser@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 13:19:21 -0700
Message-Id: <cover.1363982857.git.kevin.strasser@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: kevstras@gmail.com
Subject: [PATCH 0/1] fix srpm archiving build errors
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Mar 2013 20:40:11 -0000

The following changes since commit 7846f68537a942d340d5931e23a4fceb84b6edcb:

  vte: Fix conflict between FILES_${PN}-dbg and FILES_vte-dbg (2013-03-22 17:05:09 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib strassek/archiver
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=strassek/archiver

Kevin Strasser (1):
  archiver: fix srpm archiving build errors

 meta/classes/archive-configured-source.bbclass |   25 +++++++++---------------
 meta/classes/archive-original-source.bbclass   |   25 +++++++++---------------
 meta/classes/archive-patched-source.bbclass    |   25 +++++++++---------------
 meta/classes/archiver.bbclass                  |    4 ----
 4 files changed, 27 insertions(+), 52 deletions(-)

-- 
1.7.9.5



