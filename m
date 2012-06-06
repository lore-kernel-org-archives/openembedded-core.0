Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1ScCmo-0001pP-BL
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 11:44:18 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q569Xn98006872
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jun 2012 02:33:49 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 6 Jun 2012 02:33:49 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jun 2012 17:34:28 +0800
Message-ID: <84924cacd41a733a3cee67beab160506c56862ef.1338963552.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1338963552.git.liezhi.yang@windriver.com>
References: <cover.1338963552.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/5] pybootchartgui: add the original code
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
X-List-Received-Date: Wed, 06 Jun 2012 09:44:18 -0000
Content-Type: text/plain

This is from:
http://pybootchartgui.googlecode.com/files/pybootchartgui-r124.tar.gz

Will modify it to make the build profiling in pictures.

[YOCTO #2403]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/pybootchartgui/AUTHORS                     |   11 +
 scripts/pybootchartgui/COPYING                     |  674 ++
 scripts/pybootchartgui/README                      |   36 +
 .../examples/1/extract.proc_diskstats.log          |  141 +
 .../pybootchartgui/examples/1/extract.proc_ps.log  |  861 ++
 .../examples/1/extract.proc_stat.log               |  141 +
 .../examples/1/extract.processtree.1.log           |  861 ++
 .../examples/1/extract.processtree.2.log           |  861 ++
 .../examples/1/extract.processtree.3.log           |  861 ++
 .../examples/1/extract.processtree.3a.log          |  861 ++
 .../examples/1/extract.processtree.3b.log          |  200 +
 .../examples/1/extract.processtree.3c.log          |  200 +
 .../examples/1/extract.processtree.3d.log          |  108 +
 .../examples/1/extract.processtree.3e.log          |  100 +
 .../examples/1/extract.processtree.4.log           |  100 +
 .../examples/1/extract.processtree.5.log           |  100 +
 .../pybootchartgui/examples/1/extract2.proc_ps.log |  861 ++
 scripts/pybootchartgui/examples/1/header           |    7 +
 .../pybootchartgui/examples/1/java-png-result.png  |  Bin 0 -> 138999 bytes
 .../pybootchartgui/examples/1/proc_diskstats.log   | 3171 +++++++
 scripts/pybootchartgui/examples/1/proc_ps.log      | 9041 ++++++++++++++++++++
 scripts/pybootchartgui/examples/1/proc_stat.log    | 1562 ++++
 .../pybootchartgui/examples/1/pybootchartgui.png   |  Bin 0 -> 102909 bytes
 scripts/pybootchartgui/examples/2/header           |    6 +
 .../pybootchartgui/examples/2/java-png-result.png  |  Bin 0 -> 173535 bytes
 scripts/pybootchartgui/examples/2/kernel_pacct     |  Bin 0 -> 321408 bytes
 .../pybootchartgui/examples/2/proc_diskstats.log   | 5262 ++++++++++++
 scripts/pybootchartgui/examples/2/proc_ps.log      | 8940 +++++++++++++++++++
 scripts/pybootchartgui/examples/2/proc_stat.log    | 2050 +++++
 .../pybootchartgui/examples/3/f11_bootchart.tgz    |  Bin 0 -> 77979 bytes
 .../pybootchartgui/examples/4/f11_bootchart2.tgz   |  Bin 0 -> 77979 bytes
 scripts/pybootchartgui/pybootchartgui.py           |    7 +
 scripts/pybootchartgui/pybootchartgui/batch.py     |   23 +
 scripts/pybootchartgui/pybootchartgui/draw.py      |  355 +
 scripts/pybootchartgui/pybootchartgui/gui.py       |  273 +
 scripts/pybootchartgui/pybootchartgui/main.py      |   71 +
 scripts/pybootchartgui/pybootchartgui/parsing.py   |  223 +
 .../pybootchartgui/pybootchartgui/process_tree.py  |  270 +
 scripts/pybootchartgui/pybootchartgui/samples.py   |   93 +
 .../pybootchartgui/tests/parser_test.py            |   93 +
 .../pybootchartgui/tests/process_tree_test.py      |   78 +
 41 files changed, 38502 insertions(+), 0 deletions(-)
 create mode 100644 scripts/pybootchartgui/AUTHORS
 create mode 100644 scripts/pybootchartgui/COPYING
 create mode 100644 scripts/pybootchartgui/README
 create mode 100644 scripts/pybootchartgui/examples/1/extract.proc_diskstats.log
 create mode 100644 scripts/pybootchartgui/examples/1/extract.proc_ps.log
 create mode 100644 scripts/pybootchartgui/examples/1/extract.proc_stat.log
 create mode 100644 scripts/pybootchartgui/examples/1/extract.processtree.1.log
 create mode 100644 scripts/pybootchartgui/examples/1/extract.processtree.2.log
 create mode 100644 scripts/pybootchartgui/examples/1/extract.processtree.3.log
 create mode 100644 scripts/pybootchartgui/examples/1/extract.processtree.3a.log
 create mode 100644 scripts/pybootchartgui/examples/1/extract.processtree.3b.log
 create mode 100644 scripts/pybootchartgui/examples/1/extract.processtree.3c.log
 create mode 100644 scripts/pybootchartgui/examples/1/extract.processtree.3d.log
 create mode 100644 scripts/pybootchartgui/examples/1/extract.processtree.3e.log
 create mode 100644 scripts/pybootchartgui/examples/1/extract.processtree.4.log
 create mode 100644 scripts/pybootchartgui/examples/1/extract.processtree.5.log
 create mode 100644 scripts/pybootchartgui/examples/1/extract2.proc_ps.log
 create mode 100644 scripts/pybootchartgui/examples/1/header
 create mode 100644 scripts/pybootchartgui/examples/1/java-png-result.png
 create mode 100644 scripts/pybootchartgui/examples/1/proc_diskstats.log
 create mode 100644 scripts/pybootchartgui/examples/1/proc_ps.log
 create mode 100644 scripts/pybootchartgui/examples/1/proc_stat.log
 create mode 100644 scripts/pybootchartgui/examples/1/pybootchartgui.png
 create mode 100644 scripts/pybootchartgui/examples/2/header
 create mode 100644 scripts/pybootchartgui/examples/2/java-png-result.png
 create mode 100644 scripts/pybootchartgui/examples/2/kernel_pacct
 create mode 100644 scripts/pybootchartgui/examples/2/proc_diskstats.log
 create mode 100644 scripts/pybootchartgui/examples/2/proc_ps.log
 create mode 100644 scripts/pybootchartgui/examples/2/proc_stat.log
 create mode 100755 scripts/pybootchartgui/examples/3/f11_bootchart.tgz
 create mode 100755 scripts/pybootchartgui/examples/4/f11_bootchart2.tgz
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

# Remove the patch since it is too big to send via email, please fetch
# the patch via the git repo


