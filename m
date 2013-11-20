Return-Path: <seebs@msp-lpggp2.wrs.com>
Received: from msp-lpggp2.wrs.com (unknown [206.144.70.9])
	by mail.openembedded.org (Postfix) with ESMTP id 2223D6B200
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 00:30:34 +0000 (UTC)
Received: by msp-lpggp2.wrs.com (Postfix, from userid 508)
	id 8FAB9A02E70; Tue, 19 Nov 2013 18:31:57 -0600 (CST)
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Nov 2013 18:31:56 -0600
Message-Id: <cover.1384907111.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] Make sanity check failures nonfatal for bitbake -e
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
X-List-Received-Date: Wed, 20 Nov 2013 00:30:34 -0000

This patch depends on a separate patch to bitbake providing an
isTracking() in DataSmart. The goal here is that if you run "bitbake -e",
you can get variable values and include history even if something is
horribly wrong, because "something is horribly wrong" is precisely when
"bitbake -e" is most useful.

The following changes since commit 0eb947454e1c92467283e6f1adeca67c7c57698b:

  python: Fix ptest not working problems (2013-11-18 13:04:13 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib seebs/nonfatal_insanity
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/nonfatal_insanity

Peter Seebach (1):
  sanity.bbclass: Don't fatal() when trying to dump environment.

 meta/classes/sanity.bbclass |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)


