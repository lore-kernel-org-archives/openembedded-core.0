Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1SZsY0-0005jT-3W
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 01:43:24 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 May 2012 16:31:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="146413167"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga001.jf.intel.com with ESMTP; 30 May 2012 16:31:59 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy.jf.intel.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	q4UNdcr3020837; Wed, 30 May 2012 16:39:38 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q4UNdbeU020836;
	Wed, 30 May 2012 16:39:37 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 May 2012 16:39:34 -0700
Message-Id: <cover.1338420972.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] Package version to package manifest
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
X-List-Received-Date: Wed, 30 May 2012 23:43:24 -0000

[YOCTO #2441]

This was requested and makes sense. Adds the PV to the package manifest.

The following changes since commit 348da93e283b2b8454fd9cde80d4b17378e2a168:

  webkit-gtk: Use glib as unicode backend to avoid browser crash (2012-05-30 17:38:02 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib eflanagan/license_pkg
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/license_pkg

Elizabeth Flanagan (1):
  license.bbclass: Adding PV to package.manifest

 meta/classes/license.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

-- 
1.7.5.4



