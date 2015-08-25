Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D0BAD65CCD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 15:55:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 25 Aug 2015 08:55:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,746,1432623600"; d="scan'208";a="775381201"
Received: from mlopezva-mobl2.zpn.intel.com (HELO localhost.localdomain)
	([10.219.16.76])
	by fmsmga001.fm.intel.com with ESMTP; 25 Aug 2015 08:55:25 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Aug 2015 10:55:13 -0500
Message-Id: <1440518117-6722-1-git-send-email-mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/4 v2] Get dumps when qemu fails
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
X-List-Received-Date: Tue, 25 Aug 2015 15:55:27 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This provides classes for dump logs from the host
and the target. This way it's easier to get dumps
from the runner or the target and not just from
the test. With this now the qemurunner instance
get the dumps from the host when qemu fails.

This also allows to have datastore vars in the
commands and removes the special case commands.

This fix the regresion regression when testin real
hardware

This depends on:

http://lists.openembedded.org/pipermail/openembedded-core/2015-August/108912.html

[YOCTO #8118]
[YOCTO #8203]

Mariano Lopez (4):
  dump: Created new classes for dump host and target
  qemurunner: Added host dumps when there are errors
  dump: allow to have datastore vars on dump commands
  oetest: Fix regression when testing real hardware

 meta/classes/testimage.bbclass    | 14 +++++--
 meta/lib/oeqa/oetest.py           | 56 ++++---------------------
 meta/lib/oeqa/targetcontrol.py    | 16 +++----
 meta/lib/oeqa/utils/dump.py       | 87 +++++++++++++++++++++++++++++++++++++++
 meta/lib/oeqa/utils/qemurunner.py | 14 ++++++-
 5 files changed, 129 insertions(+), 58 deletions(-)
 create mode 100644 meta/lib/oeqa/utils/dump.py

-- 
1.9.1


