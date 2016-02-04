Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 37CD97734D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 14:06:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 04 Feb 2016 06:06:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,395,1449561600"; d="scan'208";a="905490096"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 04 Feb 2016 06:06:37 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 16:06:34 +0200
Message-Id: <1454594795-23064-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH] ncurses: use closing curly brackets
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
X-List-Received-Date: Thu, 04 Feb 2016 14:06:37 -0000

This patch fixes the usage of curly brackets inside python expression in
ncurses recipe. This patch should be applied together with
http://lists.openembedded.org/pipermail/bitbake-devel/2016-February/007007.html
which changes python expression parsing in bitbake.

No similar construct was found in any other recipe in git.openembedded.org
repositories or the layer repositories in git.yoctoproject.org (master
branches).


Markus Lehtonen (1):
  ncurses: use closing curly brackets in FILES_${PN}-tools variable

 meta/recipes-core/ncurses/ncurses.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.6.2


