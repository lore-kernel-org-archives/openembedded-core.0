Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CA7BA757C4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 19:48:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 02 Jun 2015 12:48:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,541,1427785200"; d="scan'208";a="719544794"
Received: from krithika-mobl2.amr.corp.intel.com (HELO
	alimon-ThinkPad-W540.amr.corp.intel.com) ([10.254.180.132])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jun 2015 12:48:21 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jun 2015 14:49:44 -0500
Message-Id: <cover.1433274434.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/4] recipeutils adds get_recipe_upstream_version and distrodata fixes
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
X-List-Received-Date: Tue, 02 Jun 2015 19:48:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 5cc614ed68d9f763041e4d67134c5d7ada795978:

  qt4: unconditionally disable gstreamer 0.10 support in qt webkit (2015-05-30 22:26:14 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/distrodata
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/distrodata

Aníbal Limón (4):
  recipeutils: Add get_recipe_upstream_version and
    get_recipe_pv_without_srcpv functions
  distrodata: Remove unnecessary include of package_regex.inc
  distrodata: checkpkg make usage of
    oe.recipeutils.get_recipe_upstream_version
  distrodata: Use Python CSV instead of did by hand

 meta/classes/distrodata.bbclass | 210 +++++++++++++++++++---------------------
 meta/lib/oe/recipeutils.py      |  88 +++++++++++++++++
 2 files changed, 189 insertions(+), 109 deletions(-)

-- 
1.9.1


