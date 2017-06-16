Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id F2FF778500
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:57:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 09:57:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,348,1493708400"; d="scan'208";a="1142009718"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 16 Jun 2017 09:57:06 -0700
Received: from localhost.zpn.intel.com (unknown [10.219.4.140])
	by linux.intel.com (Postfix) with ESMTP id 17E665804B3;
	Fri, 16 Jun 2017 09:57:06 -0700 (PDT)
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 12:01:34 -0500
Message-Id: <cover.1497632387.git.humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.7.5
Subject: [PATCH 0/1] imagefeatures.py: Added testcase to track IMAGE_GEN_DEBUGFS
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
X-List-Received-Date: Fri, 16 Jun 2017 16:57:06 -0000

Patch to add a testcase for IMAGE_GEN_DEBUGFS variable. Checks if debug filesystem
and packages were created.

The following changes since commit 9ea5a31776440abd6468f003c5e1905f079446d3:

  ovmf: fix secureboot PACKAGECONFIG + OpenSSL update (2017-06-16 10:58:23 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib humberto/ImageGenDebugfs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=humberto/ImageGenDebugfs

Humberto Ibarra (1):
  imagefeatures.py: Added testcase to track IMAGE_GEN_DEBUGFS

 meta/lib/oeqa/selftest/cases/imagefeatures.py | 33 +++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

-- 
2.7.5


