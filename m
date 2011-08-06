Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QpYRF-0001xf-VR
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Aug 2011 06:24:42 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p764K9SI002298;
	Fri, 5 Aug 2011 21:20:13 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Sat,  6 Aug 2011 00:19:51 -0400
Message-Id: <168397a33a081e2948b316b468556a4eceebbcb7.1312604261.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1312604261.git.bruce.ashfield@windriver.com>
References: <cover.1312604261.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1312604261.git.bruce.ashfield@windriver.com>
References: <cover.1312604261.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 3/4] linux-yocto: update atom-pc preempt-rt definition
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
X-List-Received-Date: Sat, 06 Aug 2011 04:24:42 -0000

The atom-pc preempt-rt configuration wasn't pulling in the common-pc
settings, and wasn't defining re-use of the preempt-rt/base branch
properly.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.0.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index ead9d7c..bd08ca6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -20,7 +20,7 @@ SRCREV_machine_qemuppc = "582dcc88c7c4d765c03b38ff384210d6efbf7956"
 SRCREV_machine_qemux86 = "099a40c1669d20fdae2846cfd28bf74fd38dacea"
 SRCREV_machine_qemux86-64 = "896b8fd5783a6aac80d1447da5958334f4734845"
 SRCREV_machine = "2d22c15ef4802bc117c5482217c2b2c4d34ab303"
-SRCREV_meta = "37856a69113155d343efc8f8c59c7e63fbf963c4"
+SRCREV_meta = "76b3679beff6c640388a609ccf87f46bb7bf0f2b"
 
 PR = "r0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.4.1



