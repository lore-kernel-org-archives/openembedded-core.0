Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QwKU1-0003IN-PI
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 22:55:34 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7OKoecF009007;
	Wed, 24 Aug 2011 13:50:43 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 24 Aug 2011 16:50:27 -0400
Message-Id: <8cf6b1317842abdd11533f221d60c9f7e0d5d058.1314218754.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1314218753.git.bruce.ashfield@windriver.com>
References: <cover.1314218753.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1314218753.git.bruce.ashfield@windriver.com>
References: <cover.1314218753.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 3/4] linux-yocto: update machines and default configuration
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
X-List-Received-Date: Wed, 24 Aug 2011 20:55:34 -0000

Fixes [YOCTO: #686]

During routine maintenance some base changes were re-wound on
the common branches. All machines still had these changes, but
any new machine branched from the common base would miss those
changes. This update restores those commits to the standard branch
and merges them out to all child branches.

The meta branch update adds a configuration item to support
live image booting on qemux86.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.0.bb |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 08d09d3..a5e208b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -12,13 +12,13 @@ KBRANCH = ${KMACHINE}
 
 LINUX_VERSION ?= "3.0.3"
 
-SRCREV_machine_qemuarm = "083e3befb5f2562e1375f19e645f1e024c92b0b2"
-SRCREV_machine_qemumips = "79f46ece4d5e54fce49442f575a4b8663012dfa2"
-SRCREV_machine_qemuppc = "f1ce5cf96659e036674eddd170633caaf3c1d487"
-SRCREV_machine_qemux86 = "d44ab16a5c0aa5fed2ef2f587bd90cad37132dbd"
-SRCREV_machine_qemux86-64 = "842be4e7221f982e0a76075cf556a9354991ff94"
-SRCREV_machine = "66398ee1195e1b142a1b540795ff16e04b32467f"
-SRCREV_meta = "4d2805c96fe229fa0390d2fafc15d49df9acc595"
+SRCREV_machine_qemuarm ?= "eecaa32095ab63e0a73f161cf48fd02251eb6c88"
+SRCREV_machine_qemumips ?= "eee3cb2066bb6aae5b3869083cb477b03eb87c79"
+SRCREV_machine_qemuppc ?= "c0da1d35dee9fb63ba6bfc7907a77b0feb89766e"
+SRCREV_machine_qemux86 ?= "8b51ddba0f85a6bb8e105b37a9ac03fb58b9de20"
+SRCREV_machine_qemux86-64 ?= "965dd365cf3652347960f7145ac188c86c323070"
+SRCREV_machine ?= "49d93fb0c9e1645ba0bb8951be23e56ea227a5bd"
+SRCREV_meta ?= "13dbce30d6a647228bf5a9483a9b9c2da1514f78"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.4.1



