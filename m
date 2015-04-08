Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7943F724DC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 18:09:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 08 Apr 2015 11:09:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,545,1422950400"; d="scan'208";a="710768992"
Received: from yctb03.ostc.intel.com (HELO yctb03.otcr.jf.intel.com)
	([10.23.219.52])
	by orsmga002.jf.intel.com with ESMTP; 08 Apr 2015 11:10:01 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Apr 2015 10:04:43 +0000
Message-Id: <cover.1428487200.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
MIME-Version: 1.0
Subject: [PATCH 0/2] x32 ABI fixes kexec-tools and nss
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
X-List-Received-Date: Wed, 08 Apr 2015 18:10:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The next changes contains,

	kexec-tools v2 patch that fixes problems related to configure.ac when
	try to compile enabling zlib.

	nss v1 patch that enables x32 build.

The following changes since commit a146e8ccfcc9d7f957de60c8634b38bb3431ca04:

  bitbake: runqueue: pass finalized metadata to scenequeue callbacks (2015-04-08 10:53:32 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/x32_abi_fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/x32_abi_fixes

Aníbal Limón (1):
  nss: Fix build in x32 ABI

Mariano Lopez (1):
  kexec-tools: Add support for build with x32 ABI in x86_64

 .../kexec/kexec-tools/kexec-x32.patch              | 113 +++++++++++++++++++++
 meta/recipes-kernel/kexec/kexec-tools_2.0.9.bb     |   3 +-
 meta/recipes-support/nss/nss.inc                   |   4 +
 3 files changed, 119 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/kexec-x32.patch

-- 
1.8.4.5


