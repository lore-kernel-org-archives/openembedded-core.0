Return-Path: <peter.kjellerstedt@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0D3C96DA69
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 17:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id 48CA225B1C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id J8kXHJF5O4XK
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:27 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id 9EF7025B0C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:10 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 886C3BEB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 7BCACA5F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 711D63404E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id rAFH98ZN014816
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id rAFH98te014815
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Nov 2013 18:09:08 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Nov 2013 18:08:49 +0100
Message-Id: <cover.1384535211.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.4
Subject: [PATCH 00/14] Improvements to pybootchartgui
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
X-List-Received-Date: Fri, 15 Nov 2013 17:09:35 -0000

This corrects and improves pybootchartgui. It starts by importing the
relevant parts for pybootchartgui from the latest version (0.14.5) of
bootchart2 from "https://github.com/mmeeks/bootchart". It then corrects
a couple of problems (e.g., X scaling, X offset of the chart, and header
height), and finally adds a couple of improvements (e.g., disable
irrelevant options, draw a lot less ticks, and use "Show more" to show
all processes).

//Peter

The following changes since commit 4fdc3d77d4a875b7236536bf78849a4d1f6a7449:

  kbd: Fix stdarg related errors on uclibc (2013-11-08 17:31:36 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/pybootchartgui
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/pybootchartgui

Peter Kjellerstedt (14):
  pybootchartgui: Import pybootchartgui 0.14.5
  pybootchartgui: Make the horizontal scaling stay within bounds
  pybootchartgui: Set the initial state of "Show more" correctly
  pybootchartgui: Correct the X offset for the chart
  pybootchartgui: Use correct header height
  pybootchartgui: Avoid having overlapping process bars
  pybootchartgui: No need to do a double list comprehension over files
  pybootchartgui: Disable options that do not make sense
  pybootchartgui: Draw a lot less ticks
  pybootchartgui: Make "Show more" show all processes
  pybootchartgui: Make bars without a specified color white
  pybootchartgui: Reorder the legend to match the task execution order
  pybootchartgui: Add a color for the package_write_* tasks
  pybootchartgui: Add option --minutes to show time in minutes

 scripts/pybootchartgui/AUTHORS                     |  10 +-
 scripts/pybootchartgui/COPYING                     | 912 +++++++--------------
 scripts/pybootchartgui/MAINTAINERS                 |   3 +
 scripts/pybootchartgui/NEWS                        | 204 +++++
 .../pybootchartgui/{README => README.pybootchart}  |  19 +-
 scripts/pybootchartgui/pybootchartgui.py           |  16 +
 scripts/pybootchartgui/pybootchartgui/batch.py     |  53 +-
 scripts/pybootchartgui/pybootchartgui/draw.py      | 763 +++++++++++++----
 scripts/pybootchartgui/pybootchartgui/gui.py       | 597 ++++++++------
 scripts/pybootchartgui/pybootchartgui/main.py      |  79 +-
 scripts/pybootchartgui/pybootchartgui/main.py.in   | 183 +++++
 scripts/pybootchartgui/pybootchartgui/parsing.py   | 796 ++++++++++++++----
 .../pybootchartgui/pybootchartgui/process_tree.py  | 126 +--
 scripts/pybootchartgui/pybootchartgui/samples.py   | 226 +++--
 .../pybootchartgui/tests/parser_test.py            |  82 +-
 .../pybootchartgui/tests/process_tree_test.py      |  30 +-
 16 files changed, 2623 insertions(+), 1476 deletions(-)
 create mode 100644 scripts/pybootchartgui/MAINTAINERS
 create mode 100644 scripts/pybootchartgui/NEWS
 rename scripts/pybootchartgui/{README => README.pybootchart} (61%)
 mode change 100644 => 120000 scripts/pybootchartgui/pybootchartgui/main.py
 create mode 100644 scripts/pybootchartgui/pybootchartgui/main.py.in

-- 
1.8.4


