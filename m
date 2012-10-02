Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1TJBhC-0005G1-8i
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 01:16:10 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Oct 2012 16:03:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,525,1344236400"; d="scan'208";a="200832334"
Received: from envy.jf.intel.com ([10.7.201.159])
	by orsmga001.jf.intel.com with ESMTP; 02 Oct 2012 16:03:09 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy.jf.intel.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	q92N1crL023320; Tue, 2 Oct 2012 16:01:38 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q92N1bpg023319;
	Tue, 2 Oct 2012 16:01:37 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Oct 2012 16:01:36 -0700
Message-Id: <cover.1349218820.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] Change bzip2 to a less generic license
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
X-List-Received-Date: Tue, 02 Oct 2012 23:16:10 -0000

The license for bzip2 is not quite BSD. I have an email out to the
maintainer to see if we can utilize a common BSD license (or something
else) however, for now, we should revert bzip2 back to a special
license.

As busybox also utilizes a lightly modified bzip2, this also
effects busybox.

The following changes since commit 8609051d8d4f9fa565eb48418a87fa0048613374:

  bitbake.conf: Add CCACHE_DISABLE to BS_HASHBASE_WHITELIST (2012-10-02 18:12:48 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib eflanagan/bzip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/bzip

Elizabeth Flanagan (1):
  bzip2 and busybox: Incorrect LICENSE

 meta/recipes-core/busybox/busybox.inc      |    3 +--
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb |    2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

-- 
1.7.5.4



