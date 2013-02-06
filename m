Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1U37Mg-0003cW-24
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 16:56:53 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Feb 2013 07:40:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,615,1355126400"; d="scan'208";a="283588727"
Received: from unknown (HELO localhost) ([10.255.12.217])
	by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2013 07:40:57 -0800
From: tom.zanussi@linux.intel.com
To: openembedded-core@lists.openembedded.org,
	ross.burton@intel.com
Date: Wed,  6 Feb 2013 09:40:56 -0600
Message-Id: <cover.1360165052.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/1][danny] fix for 3756
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
X-List-Received-Date: Wed, 06 Feb 2013 15:56:57 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

This was pulled into master yesterday and should be pulled into
danny as well.

The following changes since commit a7ce81df2f6e513a7e364c443759733c778b5c1f:

  yocto-bsp: qualify user files with machine name (2013-02-05 21:37:35 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/3756-fix-danny
  http://git.yoctoproject.org/cgit.cgi//log/?h=tzanussi/3756-fix-danny

Tom Zanussi (1):
  crosstap: handle hyphenated x86_64 target arch

 scripts/crosstap | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.11.4



