Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 19C746011C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 20:29:18 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 04 Jul 2016 13:29:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,576,1459839600"; d="scan'208";a="840575360"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga003.jf.intel.com with ESMTP; 04 Jul 2016 13:29:19 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jul 2016 12:23:15 +0000
Message-Id: <cover.1467634829.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCHv2 0/1] Add command line parameter support for tag in testexport
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
X-List-Received-Date: Mon, 04 Jul 2016 20:29:19 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This allows to specify the tag to be used to filter test as an argument of
runexported.py.

Changes in v2:

- Use a specific dictionary instead of kwargs

The following changes since commit 5c11e365e19357f721c49d076971567e7b64b61b:

  lib/oeqa: add Galculator to SDK and runtime tests (2016-07-01 16:22:48 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug8532v2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug8532v2

Mariano Lopez (1):
  oetest.py: Add command line parameter support for tag in testexport

 meta/lib/oeqa/oetest.py      | 16 +++++++++++++---
 meta/lib/oeqa/runexported.py |  6 +++++-
 2 files changed, 18 insertions(+), 4 deletions(-)

-- 
2.6.6


