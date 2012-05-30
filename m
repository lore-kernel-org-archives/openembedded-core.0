Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SZlrr-0005Kb-0h
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 18:35:27 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 May 2012 09:25:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="149558426"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.128])
	by azsmga001.ch.intel.com with ESMTP; 30 May 2012 09:25:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 May 2012 17:25:03 +0100
Message-Id: <cover.1338395048.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] bitbake.conf: set an exclusion list for varflags in checksums
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
X-List-Received-Date: Wed, 30 May 2012 16:35:28 -0000

This is the OE-Core change corresponding to the varflags change just
sent to the bitbake-devel list.


The following changes since commit f5356062443320c29a19cfd7113128caa185b221:

  Revert "meta: replace os.popen with subprocess.Popen" (2012-05-30 14:20:04 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/varflags
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/varflags

Paul Eggleton (1):
  bitbake.conf: set an exclusion list for varflags in checksums

 meta/conf/bitbake.conf |    4 ++++
 1 file changed, 4 insertions(+)

-- 
1.7.9.5



