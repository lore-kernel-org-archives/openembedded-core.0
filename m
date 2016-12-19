Return-Path: <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 5DBCE6FEF3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 21:07:41 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 19 Dec 2016 13:07:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,375,1477983600"; d="scan'208";a="44344124"
Received: from jairdeje-mobl1.amr.corp.intel.com (HELO
	jairdeje-mobl1.zpn.intel.com) ([10.219.128.79])
	by orsmga005.jf.intel.com with ESMTP; 19 Dec 2016 13:07:42 -0800
From: Jair Gonzalez <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2016 15:07:30 -0600
Message-Id: <cover.1482179865.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2 0/4] selftest/wic: extending test coverage for WIC script options
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
X-List-Received-Date: Mon, 19 Dec 2016 21:07:42 -0000

Changed in V2:

The original patch was splitted and updated according to the discussion on:
http://lists.openembedded.org/pipermail/openembedded-core/2016-December/130131.html
NOTE: The WKS_FILE entry deletion was ommitted from this patch set as it
was introduced on the first patch by mistake.

The following changes since commit 573c646d4cc62dcd0c230381df4940bdf314d495:

  bitbake: BBHandler: use with instead of open/close (2016-12-16 10:23:24 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jairglez/wictest
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jairglez/wictest

Jair Gonzalez (4):
  selftest/wic: adding Testopia ID numbers to test cases missing it
  selftest/wic: code cleanup
  selftest/wic: reorganizing test methods by functionality
  selftest/wic: extending test coverage for WIC script options

 meta/lib/oeqa/selftest/wic.py | 370 +++++++++++++++++++++++++++---------------
 1 file changed, 238 insertions(+), 132 deletions(-)

-- 
2.7.4


