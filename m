Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D5512782D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 20:14:40 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jul 2017 13:14:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,421,1496127600"; d="scan'208";a="116483729"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 27 Jul 2017 13:14:41 -0700
Received: from localhost.zpn.intel.com (unknown [10.219.4.140])
	by linux.intel.com (Postfix) with ESMTP id 6C0465809DF;
	Thu, 27 Jul 2017 13:14:41 -0700 (PDT)
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jul 2017 15:18:01 -0500
Message-Id: <cover.1501186507.git.humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.7.5
Subject: [PATCH 0/1] multiconfig.py: added testsuite for multiconfig
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
X-List-Received-Date: Thu, 27 Jul 2017 20:14:41 -0000

Multiconfig testsuite is being added to selftest, incluiding a globbing
testcase.

The following changes since commit d4c3ace09790a18e240c4aea655e41ecee786e1b:

  bitbake: bitbake-diffsigs: fix regression after recent server changes (2017-07-27 15:14:20 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib humberto/Multiconfig
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=humberto/Multiconfig

Humberto Ibarra (1):
  multiconfig.py: added testsuite for multiconfig

 meta/lib/oeqa/selftest/cases/multiconfig.py | 100 ++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/multiconfig.py

-- 
2.7.5


