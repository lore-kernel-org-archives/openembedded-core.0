Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id F21C260767
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 08:08:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 27 May 2016 01:08:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,373,1459839600"; d="scan'208";a="989841998"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 27 May 2016 01:08:25 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Fri, 27 May 2016 11:08:09 +0300
Message-Id: <cover.1464336009.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/1] Fix image creation problems (WRT dosfstools)
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
X-List-Received-Date: Fri, 27 May 2016 08:08:29 -0000

This fixes the image build issues that were a result of my dosfstools
upgrade, sorry for not testing that one properly.

This was the first time I even looked at the image generation code,
would appreciate review from Robert or someone else more familiar
with it. There are alternative solutions (like silencing the warning
from mcopy), but this seemed like an ok one to me.

I've pushed this commit on top of the branch with the dosfstools
upgrade, let me know if you'd rather have this sort of things
separately.

Thanks,
  Jussi



The following changes since commit 265c2d710ce6941f6ddae3aa699bf1e9c13aa156:

  libgpg-error: Upgrade 1.21 -> 1.22 (2016-05-26 15:39:14 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/gnupg-mirror-plus-upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/gnupg-mirror-plus-upgrades

Jussi Kukkonen (1):
  image-live.bbclass: Tweak rounding up sector count

 meta/classes/image-live.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

-- 
2.1.4


