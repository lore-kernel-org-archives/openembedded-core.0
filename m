Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RrxYJ-00017J-B4
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 21:10:13 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0UK2DFu017744;
	Mon, 30 Jan 2012 12:02:14 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 30 Jan 2012 15:02:10 -0500
Message-Id: <254adfc706aa9853847ea75a920d6afe1b55b46b.1327952323.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1327952323.git.bruce.ashfield@windriver.com>
References: <cover.1327952323.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1327952323.git.bruce.ashfield@windriver.com>
References: <cover.1327952323.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 1/3] kern-tools: import config audit and branch manipulation updates
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
X-List-Received-Date: Mon, 30 Jan 2012 20:10:13 -0000

Updating the kern-tools SRCREV to import the following changes:

 a7a9930 kgit-meta/scc: allow multi-line defines
 e3442c6 kern-tools: add required and optional kernel configuration processing
 b56b67b configme: extract redefinition and mismatch information
 6118eaf kern-tools: remove branchname assumptions

These are required to support the kernel configuration policy changes
implemented in the yocto 3.2 kernel repository.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 2711465..1eced23 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=e2bf4415f3d8
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "52d929b5435d32097bce22b3f3662440f73a33b5"
+SRCREV = "a7a9930d2b1f1954fbd817810b706e2e3c42e8de"
 PR = r12
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.4.1



