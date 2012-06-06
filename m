Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1ScCmn-0001pO-9l
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 11:44:17 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q569XmEM002548
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jun 2012 02:33:48 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 6 Jun 2012 02:33:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jun 2012 17:34:27 +0800
Message-ID: <cover.1338963552.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/5] pybootchartgui: make the build profiling in pictures
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Jun 2012 09:44:17 -0000
Content-Type: text/plain

Note: Removed the patch details for PATCH 1/5 and 2/5 since they are too
      big(bigger than 2M) to send via email, please fetch the patch via
      the git repo

// Robert

The following changes since commit df8f55a919b3cc602ce1f1c51630c7edf6e36b55:

  ltp: Add patch to correct failing build (2012-06-05 23:05:00 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/chart
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/chart

Robert Yang (5):
  pybootchartgui: add the original code
  pybootchartgui: remove the original examples
  pybootchartgui: make the build profiling in pictures
  pybootchartgui: split the output chart into multiple ones
  pybootchartgui: Fix the filename and add a default format

 scripts/pybootchartgui/AUTHORS                     |   11 +
 scripts/pybootchartgui/COPYING                     |  674 ++++++++++++++++++++
 scripts/pybootchartgui/README                      |   36 +
 scripts/pybootchartgui/pybootchartgui.py           |    7 +
 scripts/pybootchartgui/pybootchartgui/batch.py     |   23 +
 scripts/pybootchartgui/pybootchartgui/draw.py      |  408 ++++++++++++
 scripts/pybootchartgui/pybootchartgui/gui.py       |  273 ++++++++
 scripts/pybootchartgui/pybootchartgui/main.py      |   76 +++
 scripts/pybootchartgui/pybootchartgui/parsing.py   |  264 ++++++++
 .../pybootchartgui/pybootchartgui/process_tree.py  |  270 ++++++++
 scripts/pybootchartgui/pybootchartgui/samples.py   |   93 +++
 .../pybootchartgui/tests/parser_test.py            |   93 +++
 .../pybootchartgui/tests/process_tree_test.py      |   78 +++
 13 files changed, 2306 insertions(+), 0 deletions(-)
 create mode 100644 scripts/pybootchartgui/AUTHORS
 create mode 100644 scripts/pybootchartgui/COPYING
 create mode 100644 scripts/pybootchartgui/README
 create mode 100755 scripts/pybootchartgui/pybootchartgui.py
 create mode 100644 scripts/pybootchartgui/pybootchartgui/__init__.py
 create mode 100644 scripts/pybootchartgui/pybootchartgui/batch.py
 create mode 100644 scripts/pybootchartgui/pybootchartgui/draw.py
 create mode 100644 scripts/pybootchartgui/pybootchartgui/gui.py
 create mode 100644 scripts/pybootchartgui/pybootchartgui/main.py
 create mode 100644 scripts/pybootchartgui/pybootchartgui/parsing.py
 create mode 100644 scripts/pybootchartgui/pybootchartgui/process_tree.py
 create mode 100644 scripts/pybootchartgui/pybootchartgui/samples.py
 create mode 100644 scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
 create mode 100644 scripts/pybootchartgui/pybootchartgui/tests/process_tree_test.py



