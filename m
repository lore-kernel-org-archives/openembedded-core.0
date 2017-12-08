Return-Path: <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D60C37838B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 21:04:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Dec 2017 13:04:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,379,1508828400"; 
   d="scan'208";a="1234775"
Received: from jairdeje-mobl1.zpn.intel.com ([10.219.4.135])
	by orsmga007.jf.intel.com with ESMTP; 08 Dec 2017 13:04:00 -0800
From: Jair Gonzalez <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Dec 2017 15:03:55 -0600
Message-Id: <cover.1512765610.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.7.5
Subject: [PATCH V4 0/2] imagefeatures.py: Added testcase to track IMAGE_GEN_DEBUGFS
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
X-List-Received-Date: Fri, 08 Dec 2017 21:04:01 -0000

Patch to add a testcase for IMAGE_GEN_DEBUGFS variable. Checks if debug filesystem
was created.

Changed on V4:

- Rebased with master.
- Added id to tests missing it.

The following changes since commit 4469acdf1d0338220f3fe2ecb5e079eea6fda375:

  lib/oe/utils: remove param_bool() (2017-12-02 11:25:34 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jairglez/ImageGenDebugfs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jairglez/ImageGenDebugfs

Humberto Ibarra (1):
  imagefeatures.py: Added testcase to track IMAGE_GEN_DEBUGFS

Jair Gonzalez (1):
  imagefeatures.py: Add id to tests missing it

 meta/lib/oeqa/selftest/cases/imagefeatures.py | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

-- 
2.7.5


