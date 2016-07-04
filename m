Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6124A6011C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 22:18:20 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 Jul 2016 15:18:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,576,1459839600"; d="scan'208";a="1010879271"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 04 Jul 2016 15:18:16 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 5DFAF6A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 15:18:10 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2016 01:08:12 +0300
Message-Id: <cover.1467669922.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2 0/3] devpyshell fixes
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
X-List-Received-Date: Mon, 04 Jul 2016 22:18:22 -0000

Hi,

This patchset fixes several devpyshell bugs caused by moving to Python 3.

Please, note that it contains fix for double unbuffering, which was sent in
a separate patchset targeting jethro, krogoth and master. It's included here
just to keep it together with the rest of devpyshell fixes for master.

Changes in v2: removed bitbake patch from the series

The following changes since commit 5c11e365e19357f721c49d076971567e7b64b61b:

  lib/oeqa: add Galculator to SDK and runtime tests (2016-07-01 16:22:48 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/oe-core/devpyshell-python3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/oe-core/devpyshell-python3

Ed Bartosh (3):
  devshell.bbclass: fix double unbuffering
  devpyshell: python3: flush stdout explicitly
  oepydevshell-internal: python3: encode/decode pty content

 meta/classes/devshell.bbclass    |  5 ++---
 scripts/oepydevshell-internal.py | 12 +++++-------
 2 files changed, 7 insertions(+), 10 deletions(-)

--
Regards,
Ed


