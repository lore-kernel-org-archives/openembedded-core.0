Return-Path: <peter.kjellerstedt@axis.com>
Received: from anubis.se.axis.com (anubis.se.axis.com [195.60.68.12])
	by mail.openembedded.org (Postfix) with ESMTP id E4DAE6CB7C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 15:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by anubis.se.axis.com (Postfix) with ESMTP id C5B6C19DC9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:23:43 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at anubis.se.axis.com
Received: from anubis.se.axis.com ([127.0.0.1])
	by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3lLr17YjtPk4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:23:41 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by anubis.se.axis.com (Postfix) with ESMTP id 175581A043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:38 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id E87C0A47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:37 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id DC1E4355
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:37 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id DAAFB3E06F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:37 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id s0LFMbBq015058
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:37 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id s0LFMbhQ015057
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jan 2014 16:22:37 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2014 16:22:30 +0100
Message-Id: <cover.1390317718.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.4
Subject: [PATCH 0/5] Fixes for pybootchartgui
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
X-List-Received-Date: Tue, 21 Jan 2014 15:23:45 -0000

This corrects and improves pybootchartgui. It starts by correcting two
flaws introduced in my last update of pybootchartgui. It then makes a
little simplification, followed up by improving the naming of split
output files. Finally it introduces a new option (--full-time or -T)
which makes sure the graph(s) always show the full time span regadless
of which bars are currently shown (this is especially useful in
combination with the -s option).

//Peter

The following changes since commit 1105b46d8f0174edbc315370835546e8ba5f7fd9:

  poky.conf: Remove Debian Squeeze from SANITY_TESTED_DISTROS (2014-01-21 10:45:29 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/pybootchartgui2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/pybootchartgui2

Peter Kjellerstedt (5):
  pybootchartgui: Make the -s option work again
  pybootchartgui: Correct the legend
  pybootchartgui: Simplify adding processes to the trace
  pybootchartgui: Adopt the width of the index in split output files
  pybootchartgui: Add option -T to allways use the full time

 scripts/pybootchartgui/pybootchartgui/draw.py    |  8 ++-
 scripts/pybootchartgui/pybootchartgui/main.py.in |  8 ++-
 scripts/pybootchartgui/pybootchartgui/parsing.py | 63 ++++++++++++------------
 3 files changed, 43 insertions(+), 36 deletions(-)

-- 
1.8.4


