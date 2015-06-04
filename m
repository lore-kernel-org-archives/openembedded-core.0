Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 501C97580A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 18:41:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 04 Jun 2015 11:41:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,554,1427785200"; d="scan'208";a="737234159"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.173])
	by fmsmga002.fm.intel.com with ESMTP; 04 Jun 2015 11:41:28 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jun 2015 13:42:55 -0500
Message-Id: <cover.1433443273.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCHv2 0/4] recipeutils and distrodata fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Jun 2015 18:41:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

  xserver-xorg: Upgrade 1.16.3 -> 1.17.1 (OELAYOUT_ABI change) (2015-06-03 16:38:49 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/distrodata
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/distrodata

Aníbal Limón (4):
  recipeutils: Improve get_recipe_pv_without_srcpv function
  distrodata: Remove unnecessary include of package_regex.inc
  distrodata: checkpkg make usage of
    oe.recipeutils.get_recipe_upstream_version
  distrodata: Use Python CSV instead of did by hand

 meta/classes/distrodata.bbclass | 210 +++++++++++++++++++---------------------
 meta/lib/oe/recipeutils.py      |  12 +--
 2 files changed, 103 insertions(+), 119 deletions(-)

-- 
1.9.1


