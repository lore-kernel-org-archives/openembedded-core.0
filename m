Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6E7876013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 21:18:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jul 2016 14:18:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,325,1464678000"; d="scan'208";a="731111605"
Received: from jtsai-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.253])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Jul 2016 14:17:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jul 2016 09:17:31 +1200
Message-Id: <cover.1467926203.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/1] oe-selftest fix
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
X-List-Received-Date: Thu, 07 Jul 2016 21:18:08 -0000

Fix an oe-selftest failure seen on the YP autobuilder caused by my eSDK
installation reworking.


The following changes since commit ed85fa3c40d6a9db9184e4f08698e278ea802674:

  local.conf.sample.extended: drop RPM4 example (2016-07-07 13:28:51 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/esdk-selftest-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/esdk-selftest-fix

Paul Eggleton (1):
  oe-selftest: drop test_prepare_unexpected

 meta/lib/oeqa/selftest/esdk_prepare.py | 75 ----------------------------------
 1 file changed, 75 deletions(-)
 delete mode 100755 meta/lib/oeqa/selftest/esdk_prepare.py

-- 
2.5.5


