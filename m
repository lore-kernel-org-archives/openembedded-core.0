Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1SwGvm-0007ub-3q
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 20:12:30 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 31 Jul 2012 11:00:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="179894200"
Received: from envy.jf.intel.com (HELO envy) ([10.7.201.159])
	by orsmga002.jf.intel.com with ESMTP; 31 Jul 2012 11:00:28 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id q6VHxwjY017350;
	Tue, 31 Jul 2012 10:59:58 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q6VHxu82017349;
	Tue, 31 Jul 2012 10:59:56 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2012 10:59:55 -0700
Message-Id: <cover.1343757533.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] Update runqemu-gen-tapdevs to take UID
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
X-List-Received-Date: Tue, 31 Jul 2012 18:12:30 -0000

runqemu-if* now requires UID as a command line option which means
runqemu-gen-tapdevs needs to take it as an option.

The following changes since commit 3309cf42d314f0a26079a11836c6b9b9bb5f253e:

  package_rpm.bbclass: Accomodate dash when using arrays (2012-07-31 12:22:10 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib eflanagan/tapdevs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/tapdevs

Elizabeth Flanagan (1):
  runqemu-gen-tapdevs: add UID to CL options

 scripts/runqemu-gen-tapdevs |   16 +++++++++-------
 1 files changed, 9 insertions(+), 7 deletions(-)

-- 
1.7.5.4



