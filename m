Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 36E3C780F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 20:37:44 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Jun 2017 13:37:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,282,1496127600"; d="scan'208";a="119080893"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 29 Jun 2017 13:37:45 -0700
Received: from localhost.zpn.intel.com (unknown [10.219.4.140])
	by linux.intel.com (Postfix) with ESMTP id 6677C5808A4;
	Thu, 29 Jun 2017 13:37:45 -0700 (PDT)
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Jun 2017 15:42:27 -0500
Message-Id: <cover.1498768832.git.humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.7.5
Subject: [PATCH v3 0/1] imagefeatures.py: Added testcase to track IMAGE_GEN_DEBUGFS
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
X-List-Received-Date: Thu, 29 Jun 2017 20:37:45 -0000

Patch to add a testcase for IMAGE_GEN_DEBUGFS variable. Checks if debug filesystem
was created.

The following changes since commit 98099349e358a9caaec8ec81f0d4abe588909cfe:

  bitbake: npm fetcher: fix unknown variable name. (2017-06-29 14:33:42 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib humberto/ImageGenDebugfs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=humberto/ImageGenDebugfs

Humberto Ibarra (1):
  imagefeatures.py: Added testcase to track IMAGE_GEN_DEBUGFS

 meta/lib/oeqa/selftest/cases/imagefeatures.py | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

-- 
2.7.5


