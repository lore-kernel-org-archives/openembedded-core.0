Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1S5uGH-0005rY-FQ
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 08:29:14 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Mar 2012 23:20:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="116135613"
Received: from dcui-desktop.sh.intel.com ([10.239.36.12])
	by orsmga001.jf.intel.com with ESMTP; 08 Mar 2012 23:19:32 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2012 15:19:56 +0800
Message-Id: <cover.1331277565.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] a fix to 2067
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
X-List-Received-Date: Fri, 09 Mar 2012 07:29:15 -0000

The following changes since commit 6bd23e0faf329f086bb4885991ce5f5d095dac56:

  adt-installer: Corrected wrong environment file names. (2012-03-08 12:18:52 -0800)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/fix_2067
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/fix_2067

Dexuan Cui (1):
  image_types: ensure .rootfs.ext3 is created before vmdk is created.

 meta/classes/image_types.bbclass |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

-- 
1.7.6



