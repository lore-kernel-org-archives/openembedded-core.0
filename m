Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 457F277395
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 22:20:28 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Feb 2017 14:20:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,142,1484035200"; d="scan'208";a="57405773"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by orsmga004.jf.intel.com with ESMTP; 10 Feb 2017 14:20:29 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 14:15:55 +0000
Message-Id: <cover.1486735704.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH 0/2] OEQA loader improvement
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
X-List-Received-Date: Fri, 10 Feb 2017 22:20:30 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

The first adds more verbosity when a class doesn't inherit
from the expected test class.

The second patch raises an error when trying to import a test
with the same module name as a built-in module.

The following changes since commit e758547db9048d4aa1c1415d6af8072f519fae24:

  nss: Fix nss-native so the checksum doesn't change with BUILD_ARCH (2017-02-09 10:52:03 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug10978
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug10978

Mariano Lopez (2):
  oeqa/core/loader.py: Give meaningful error when failed to load classes
  oeqa/core/loader.py: Avoid importing tests with built-ins name

 meta/lib/oeqa/core/loader.py | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

-- 
2.6.6


