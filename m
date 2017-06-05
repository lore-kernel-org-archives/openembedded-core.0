Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 36BFA780CB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 17:15:03 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jun 2017 10:15:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,302,1493708400"; d="scan'208";a="94874700"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 05 Jun 2017 10:15:03 -0700
Received: from localhost.zpn.intel.com (unknown [10.219.4.140])
	by linux.intel.com (Postfix) with ESMTP id 12FBD58059D;
	Mon,  5 Jun 2017 10:15:01 -0700 (PDT)
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Jun 2017 12:19:09 -0500
Message-Id: <cover.1496682874.git.humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.7.5
Subject: [PATCH 0/1] runtime-test.py: Split different tests inside selftest.py
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
X-List-Received-Date: Mon, 05 Jun 2017 17:15:04 -0000

Patch solves bug related to two different functionalities being tested in the same test
module.

The following changes since commit 02417b149623c3042c257d1c1074f915dc02b7c7:

  oeqa/selftest: lock down Meson git revision for reliability (2017-06-05 17:59:38 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib humberto/SplitDnfTestimage
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=humberto/SplitDnfTestimage

Humberto Ibarra (1):
  runtime-test.py: Split different tests inside selftest.py

 .../lib/oeqa/runtime/cases/dnf-runtime.py          | 42 ++++++++++++++++++++++
 meta-selftest/lib/oeqa/runtime/cases/selftest.py   | 42 ----------------------
 meta/lib/oeqa/selftest/runtime-test.py             | 20 +++++++++--
 3 files changed, 60 insertions(+), 44 deletions(-)
 create mode 100644 meta-selftest/lib/oeqa/runtime/cases/dnf-runtime.py

-- 
2.7.5


