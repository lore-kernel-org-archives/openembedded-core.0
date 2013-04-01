Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UMiWG-0006kN-Rc
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Apr 2013 19:27:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r31H9tfT014812
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Apr 2013 10:09:55 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 1 Apr 2013 10:09:55 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 1 Apr 2013 10:09:35 -0700
Message-ID: <54438b839dc8cba9f84999be60d485381d7a236b.1364835699.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364835699.git.bruce.ashfield@windriver.com>
References: <cover.1364835699.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto-rt: integrate 3.8.4-rt2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Apr 2013 17:27:45 -0000
Content-Type: text/plain

Updating to 3.8.4-rt2 to fix the minor issues found with -rt1.

From the upstream commit log:

 changes since v3.8.4-rt1:
   - build fix for i915 (reported by "Luis Claudio R. Goncalves")
   - build fix for fscache (reported by tglx)
   - build fix for !RT (kernel/softirq.c did not compile)
   - per-cpu rwsem fixed for RT (required only by uprobes so far)
   - slub: delay the execution of the ->ctor() hook for newly created
     objects. This lowers the worst case latencies.

 Known issues:

    - SLxB is broken on PowerPC.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
index 7b9a4f8..903fcb5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
@@ -8,8 +8,8 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "c122468c96f47f281eb3ab51f96507d66dcc60d7"
-SRCREV_machine_qemuppc ?= "dc0440c8bbf12676a54c7aa29879155d925a7565"
+SRCREV_machine ?= "abd0728b164f651292374e96251ee197b50e3c02"
+SRCREV_machine_qemuppc ?= "1619988b773840ec546292a9cd65dda99d55b96c"
 SRCREV_meta ?= "1b534b2f8bbe9b8a773268cfa30a4850346f6f5f"
 
 PR = "${INC_PR}.0"
-- 
1.7.10.4



