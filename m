Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U35uL-0000tu-9I
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 15:23:33 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 06 Feb 2013 06:07:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,615,1355126400"; d="scan'208";a="287349746"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.80])
	by fmsmga002.fm.intel.com with ESMTP; 06 Feb 2013 06:07:36 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Ross Burton <ross.burton@intel.com>
Date: Wed,  6 Feb 2013 14:07:25 +0000
Message-Id: <cover.1360159588.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [for-danny][PATCH 0/1] RPM complementary package fix
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
X-List-Received-Date: Wed, 06 Feb 2013 14:23:46 -0000

The following changes since commit fdd6da5933a3e7dd1e0ca2afd7107839b4fa65e8:

  librsvg: CVE-2011-3146 (2013-01-07 11:31:55 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/danny-rpm-arch
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/danny-rpm-arch

Paul Eggleton (1):
  classes/rootfs_rpm: fix missed complementary packages with complex
    arch names

 meta/classes/rootfs_rpm.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.10.4



