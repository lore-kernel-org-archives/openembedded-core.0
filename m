Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9581D71987
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 15:46:58 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Feb 2017 07:46:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,215,1484035200"; d="scan'208";a="828950357"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Feb 2017 07:46:59 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2017 07:44:59 +0000
Message-Id: <cover.1488181279.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCHv2 0/2] OEQA loader improvment
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
X-List-Received-Date: Mon, 27 Feb 2017 15:47:01 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

The first adds more verbosity when a class doesn't inherit
from the expected test class.

The second patch raises an error when trying to import a test
with the same module name as a built-in module.

Change in v2:

- Rebased to current master

The following changes since commit 3c83b56309ab419f8cda72c0711479f60f61439a:

  bitbake: fetch2/svn: change 'rsh' parameter to 'ssh' (2017-02-23 12:50:17 -0800)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug10978
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug10978

Mariano Lopez (2):
  oeqa/core/loader.py: Give meaningful error when failed to load classes
  oeqa/core/loader.py: Avoid importing tests with built-ins name

 meta/lib/oeqa/core/loader.py | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

-- 
2.6.6


