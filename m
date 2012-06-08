Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Sd03k-0008LN-Kl
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 16:21:04 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q58EAVLP028748;
	Fri, 8 Jun 2012 07:10:32 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri,  8 Jun 2012 10:10:16 -0400
Message-Id: <41df15f562c9b9b66a4d9b7cfb058b1fc1631fbb.1339164527.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1339164527.git.bruce.ashfield@windriver.com>
References: <cover.1339164527.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1339164527.git.bruce.ashfield@windriver.com>
References: <cover.1339164527.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/1] linux-yocto/3.2: fix meta SRCREV typo
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
X-List-Received-Date: Fri, 08 Jun 2012 14:21:05 -0000

Never underestimate the power of a rebase for inserting fat finger
errors that are hidden by local layers.

An extraneous character made it into the 3.2 meta SRCREV, which makes
the fetcher error, even when the kernel isn't being built.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index 85c0096..e6cf9bb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -16,7 +16,7 @@ SRCREV_machine_qemuppc ?= "1396a8f7b62f8926dc1fa474c7d94ae920d81852"
 SRCREV_machine_qemux86 ?= "9d32bb075e349cc69c7af42b60f6715c5d8c972e"
 SRCREV_machine_qemux86-64 ?= "dd488f551fa0f8e3bf1aadd78083b8547bba8bdf"
 SRCREV_machine ?= "76133a1cadf0de417c29ed15d6fbb12c41c0802b"
-SRCREV_meta ?= "ee78519365bdb25287703bbc31c06b193263c654l"
+SRCREV_meta ?= "ee78519365bdb25287703bbc31c06b193263c654"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.5.4



