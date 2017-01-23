Return-Path: <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D68657721D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 18:23:26 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP; 23 Jan 2017 10:23:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,275,1477983600"; d="scan'208";a="57252189"
Received: from jairdeje-mobl1.zpn.intel.com ([10.219.128.79])
	by fmsmga006.fm.intel.com with ESMTP; 23 Jan 2017 10:23:26 -0800
From: Jair Gonzalez <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 12:23:00 -0600
Message-Id: <cover.1485193773.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [bitbake-selftest][PATCH 0/2] QA: create unit tests for event module
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
X-List-Received-Date: Mon, 23 Jan 2017 18:23:27 -0000

This patch set adds a test unit to the bitbake event module and appends it
to the bitbake-selftest script's dictionary containing the list of the default
tests to execute when the script is run.

The following changes since commit b47ecf28775830efab423fa12f0addb68671cc06:

  poky.ent: Added "pip3" as an essential host installation package (2017-01-20 11:57:25 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jairglez/bbevents
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jairglez/bbevents

Jair Gonzalez (2):
  bitbake: tests: create unit tests for event module
  bitbake: selftest: add bb.tests.event to bitbake-selftest

 bitbake/bin/bitbake-selftest  |   1 +
 bitbake/lib/bb/tests/event.py | 324 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 325 insertions(+)
 create mode 100644 bitbake/lib/bb/tests/event.py

-- 
2.7.4


