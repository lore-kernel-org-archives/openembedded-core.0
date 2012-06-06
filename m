Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1ScCmo-0001pT-QB
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 11:44:19 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q569XpVQ002551
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jun 2012 02:33:51 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 6 Jun 2012 02:33:51 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jun 2012 17:34:29 +0800
Message-ID: <c7a2c1c7a6772a164054d3dde9623fd585ac17aa.1338963552.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1338963552.git.liezhi.yang@windriver.com>
References: <cover.1338963552.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 2/5] pybootchartgui: remove the original examples
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
X-List-Received-Date: Wed, 06 Jun 2012 09:44:19 -0000
Content-Type: text/plain

Remove the examples since they would not work any more, and they cost
much disk space.

[YOCTO #2403]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../examples/1/extract.proc_diskstats.log          |  141 -
 .../pybootchartgui/examples/1/extract.proc_ps.log  |  861 --
 .../examples/1/extract.proc_stat.log               |  141 -
 .../examples/1/extract.processtree.1.log           |  861 --
 .../examples/1/extract.processtree.2.log           |  861 --
 .../examples/1/extract.processtree.3.log           |  861 --
 .../examples/1/extract.processtree.3a.log          |  861 --
 .../examples/1/extract.processtree.3b.log          |  200 -
 .../examples/1/extract.processtree.3c.log          |  200 -
 .../examples/1/extract.processtree.3d.log          |  108 -
 .../examples/1/extract.processtree.3e.log          |  100 -
 .../examples/1/extract.processtree.4.log           |  100 -
 .../examples/1/extract.processtree.5.log           |  100 -
 .../pybootchartgui/examples/1/extract2.proc_ps.log |  861 --
 scripts/pybootchartgui/examples/1/header           |    7 -
 .../pybootchartgui/examples/1/java-png-result.png  |  Bin 138999 -> 0 bytes
 .../pybootchartgui/examples/1/proc_diskstats.log   | 3171 -------
 scripts/pybootchartgui/examples/1/proc_ps.log      | 9041 --------------------
 scripts/pybootchartgui/examples/1/proc_stat.log    | 1562 ----
 .../pybootchartgui/examples/1/pybootchartgui.png   |  Bin 102909 -> 0 bytes
 scripts/pybootchartgui/examples/2/header           |    6 -
 .../pybootchartgui/examples/2/java-png-result.png  |  Bin 173535 -> 0 bytes
 scripts/pybootchartgui/examples/2/kernel_pacct     |  Bin 321408 -> 0 bytes
 .../pybootchartgui/examples/2/proc_diskstats.log   | 5262 ------------
 scripts/pybootchartgui/examples/2/proc_ps.log      | 8940 -------------------
 scripts/pybootchartgui/examples/2/proc_stat.log    | 2050 -----
 .../pybootchartgui/examples/3/f11_bootchart.tgz    |  Bin 77979 -> 0 bytes
 .../pybootchartgui/examples/4/f11_bootchart2.tgz   |  Bin 77979 -> 0 bytes
 28 files changed, 0 insertions(+), 36295 deletions(-)
 delete mode 100644 scripts/pybootchartgui/examples/1/extract.proc_diskstats.log
 delete mode 100644 scripts/pybootchartgui/examples/1/extract.proc_ps.log
 delete mode 100644 scripts/pybootchartgui/examples/1/extract.proc_stat.log
 delete mode 100644 scripts/pybootchartgui/examples/1/extract.processtree.1.log
 delete mode 100644 scripts/pybootchartgui/examples/1/extract.processtree.2.log
 delete mode 100644 scripts/pybootchartgui/examples/1/extract.processtree.3.log
 delete mode 100644 scripts/pybootchartgui/examples/1/extract.processtree.3a.log
 delete mode 100644 scripts/pybootchartgui/examples/1/extract.processtree.3b.log
 delete mode 100644 scripts/pybootchartgui/examples/1/extract.processtree.3c.log
 delete mode 100644 scripts/pybootchartgui/examples/1/extract.processtree.3d.log
 delete mode 100644 scripts/pybootchartgui/examples/1/extract.processtree.3e.log
 delete mode 100644 scripts/pybootchartgui/examples/1/extract.processtree.4.log
 delete mode 100644 scripts/pybootchartgui/examples/1/extract.processtree.5.log
 delete mode 100644 scripts/pybootchartgui/examples/1/extract2.proc_ps.log
 delete mode 100644 scripts/pybootchartgui/examples/1/header
 delete mode 100644 scripts/pybootchartgui/examples/1/java-png-result.png
 delete mode 100644 scripts/pybootchartgui/examples/1/proc_diskstats.log
 delete mode 100644 scripts/pybootchartgui/examples/1/proc_ps.log
 delete mode 100644 scripts/pybootchartgui/examples/1/proc_stat.log
 delete mode 100644 scripts/pybootchartgui/examples/1/pybootchartgui.png
 delete mode 100644 scripts/pybootchartgui/examples/2/header
 delete mode 100644 scripts/pybootchartgui/examples/2/java-png-result.png
 delete mode 100644 scripts/pybootchartgui/examples/2/kernel_pacct
 delete mode 100644 scripts/pybootchartgui/examples/2/proc_diskstats.log
 delete mode 100644 scripts/pybootchartgui/examples/2/proc_ps.log
 delete mode 100644 scripts/pybootchartgui/examples/2/proc_stat.log
 delete mode 100755 scripts/pybootchartgui/examples/3/f11_bootchart.tgz
 delete mode 100755 scripts/pybootchartgui/examples/4/f11_bootchart2.tgz

# Remove the patch since it is too big to send via email, please fetch
# the code via the git repo


