Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DA0AB705EA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 14:34:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6FEYsfC025410
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 07:34:54 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 15 Jul 2014 07:34:54 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jul 2014 07:34:54 -0700
Message-ID: <fcd61e5baf3556bdd989c51e318f6e177032b516.1405434689.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1405434689.git.liezhi.yang@windriver.com>
References: <cover.1405434689.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] kernel.bbclass: add perl python bash to RDEPENDS_kernel-dev
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
X-List-Received-Date: Tue, 15 Jul 2014 14:34:54 -0000
Content-Type: text/plain

Bash scripts:
[snip]
66 ones

Perl scripts:
[snip]
26 ones

Python scripts:
kernel-dev/usr/src/kernel/scripts/diffconfig
kernel-dev/usr/src/kernel/scripts/rt-tester/rt-tester.py
kernel-dev/usr/src/kernel/scripts/tracing/draw_functrace.py
kernel-dev/usr/src/kernel/scripts/analyze_suspend.py
kernel-dev/usr/src/kernel/scripts/bloat-o-meter
kernel-dev/usr/src/kernel/scripts/show_delta
kernel-dev/usr/src/kernel/tools/perf/scripts/python/sched-migration.py
kernel-dev/usr/src/kernel/tools/perf/util/setup.py
kernel-dev/usr/src/kernel/arch/ia64/scripts/unwcheck.py

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/kernel.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index b2e9d4c..a78ee96 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -350,6 +350,7 @@ FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERN
 FILES_kernel-vmlinux = "/boot/vmlinux*"
 FILES_kernel-modules = ""
 RDEPENDS_kernel = "kernel-base"
+RDEPENDS_kernel-dev = "perl bash python"
 # Allow machines to override this dependency if kernel image files are 
 # not wanted in images as standard
 RDEPENDS_kernel-base ?= "kernel-image"
-- 
1.7.9.5


