Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2CCD0771CB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 17:17:48 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 23 Feb 2016 09:17:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,490,1449561600"; d="scan'208";a="657971332"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Feb 2016 09:17:30 -0800
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Feb 2016 09:14:26 +0000
Message-Id: <1456218868-36139-1-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCHv2 0/2] testimage: add/modify DEFAULT_TEST_SUITES
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
X-List-Received-Date: Tue, 23 Feb 2016 17:17:49 -0000

- Add generic variables to reuse values in default test suites
- Add more default test suites variables
- Modify existing test suites to use generic vars when possible

[YOCTO #8410]

Alex Franco (2):
  testimage.bbclass: add generic, image test suites
  testimage.bbclass: reuse generic test suites

 meta/classes/testimage.bbclass | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

-- 
2.6.2


