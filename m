Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SFCoO-0005q1-LL
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 01:06:52 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Apr 2012 15:57:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="149325047"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by fmsmga002.fm.intel.com with ESMTP; 03 Apr 2012 15:57:42 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Apr 2012 15:57:39 -0700
Message-Id: <cover.1333493785.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.7.6
MIME-Version: 1.0
Subject: [PATCH 0/2] Few bugfixes
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
X-List-Received-Date: Tue, 03 Apr 2012 23:06:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit 46600e37cf87e9aa68e70f1d21caad8eac974a24:

  elfutils: disable lzma (and bzip2 for native) (2012-04-03 21:32:34 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/bugfixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/bugfixes

Nitin A Kamble (2):
  gcc-cross-intermediate: fix do_install for x32
  eglibc packaging: locale packaging configuration

 meta/classes/libc-package.bbclass                  |    8 ++++++++
 meta/recipes-core/eglibc/eglibc-options.inc        |    6 ------
 .../gcc/gcc-cross-intermediate.inc                 |    3 ++-
 3 files changed, 10 insertions(+), 7 deletions(-)

-- 
1.7.7.6



