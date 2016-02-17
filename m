Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A784C6FF86
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 17:59:26 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 17 Feb 2016 09:59:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,461,1449561600"; d="scan'208";a="49610330"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga004.fm.intel.com with ESMTP; 17 Feb 2016 09:59:06 -0800
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Feb 2016 09:55:38 +0000
Message-Id: <1455702940-5840-1-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH 0/2] testimage: add/modify DEFAULT_TEST_SUITES
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
X-List-Received-Date: Wed, 17 Feb 2016 17:59:29 -0000

- Add generic variables to reuse values in default test suites
- Add more default test suites variables
- Modify existing test suites to use generic vars when possible

[YOCTO #8410]

Alex Franco (2):
  testimage: add DEFAULT_TEST_SUITES for more images
  testimage: reuse generic test suites

 meta/classes/testimage.bbclass | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

--
2.6.2


