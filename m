Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 39F12737F4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 01:05:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 21 Aug 2015 18:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,723,1432623600"; d="scan'208";a="788755585"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by orsmga002.jf.intel.com with ESMTP; 21 Aug 2015 18:04:55 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Aug 2015 16:56:13 +0000
Message-Id: <1440176176-35232-1-git-send-email-mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH 0/3] Get dumps when qemu fails
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
X-List-Received-Date: Sat, 22 Aug 2015 01:05:09 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This provides classes for dump logs from the host
and the target. This way it's easier to get dumps
from the runner or the target and not just from
the test. With this now the qemurunner instance
get the dumps from the host when qemu fails.

This also allows to have datastore vars in the
commands and removes the special case commands.

This depends on:

http://lists.openembedded.org/pipermail/openembedded-core/2015-August/108912.html

[YOCTO #8118]

Mariano Lopez (3):
  dump: Created new classes for dump host and target
  qemurunner: Added host dumps when there are errors
  dump: allow to have datastore vars on dump commands

 meta/classes/testimage.bbclass    | 14 +++++--
 meta/lib/oeqa/oetest.py           | 52 +++--------------------
 meta/lib/oeqa/targetcontrol.py    | 16 +++----
 meta/lib/oeqa/utils/dump.py       | 88 +++++++++++++++++++++++++++++++++++++++
 meta/lib/oeqa/utils/qemurunner.py | 15 ++++++-
 5 files changed, 127 insertions(+), 58 deletions(-)
 create mode 100644 meta/lib/oeqa/utils/dump.py

-- 
1.8.4.5


