Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BBA9D6E648
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 00:43:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 14 Jul 2015 17:43:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,476,1432623600"; d="scan'208";a="606330193"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.5.54])
	by orsmga003.jf.intel.com with ESMTP; 14 Jul 2015 17:43:58 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 19:43:54 -0500
Message-Id: <1436921037-32378-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCHv2 0/3] oe/recipeutils.py: get_recipe_upstream_info improvements
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
X-List-Received-Date: Wed, 15 Jul 2015 00:44:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sending v2 i forget to include first patch.

This patch set uses the new latest_versionstring method that returns the
current revision of a version in SCM's this DEPENDS on,

http://lists.openembedded.org/pipermail/bitbake-devel/2015-July/006034.html

Aníbal Limón (3):
  oe/recipeutils.py: get_recipe_upstream_info only use sfx and pfx when 
       exits
  oe/recipeutils.py: get_recipe_upstream_info update to get revision
  recipeutils.py: get_recipe_pv_without_srcpv remove prefixes from pv

 meta/lib/oe/recipeutils.py | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

-- 
1.9.1


