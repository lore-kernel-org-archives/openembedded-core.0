Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QvcUO-0006ye-3m
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 23:57:00 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2011 14:52:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,265,1312182000"; d="scan'208";a="43970274"
Received: from unknown (HELO swold-MOBL.lan) ([10.255.13.234])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2011 14:52:13 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2011 14:51:56 -0700
Message-Id: <26adbe24ec7644ead732fd382a5f9a62aab6eccc.1314043945.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314043945.git.sgw@linux.intel.com>
References: <cover.1314043945.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314043945.git.sgw@linux.intel.com>
References: <cover.1314043945.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 11/19] linux-yocto: update SRCREVs for 3.0.3
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
X-List-Received-Date: Mon, 22 Aug 2011 21:57:00 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Updating the SRCREVs to pickup the kernel.org -stable update for
3.0.3

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.0.bb |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 6e6f386..944efc0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -10,15 +10,15 @@ KMACHINE_qemuarm  = "yocto/standard/arm-versatile-926ejs"
 
 KBRANCH = ${KMACHINE}
 
-LINUX_VERSION ?= "3.0.1"
-
-SRCREV_machine_qemuarm = "36b4cdddcafc711f0ec9ad97882f23a6443c61b2"
-SRCREV_machine_qemumips = "2db2aacc589a518a74e8a8543e80403f09de8134"
-SRCREV_machine_qemuppc = "c0f5dd4ef37b445d8ac73b11dd93e0ffdb7e9f6d"
-SRCREV_machine_qemux86 = "c29beadfd4364aca9358ac0fdb8356c1dbbdacb2"
-SRCREV_machine_qemux86-64 = "d0b814813bce09971c5cbb0d22bacb8842146fa0"
-SRCREV_machine = "ad13129a87957656c18584793abcee51de0e196a"
-SRCREV_meta = "9da70812ecddee0f7eeb11675f29497cb997275e"
+LINUX_VERSION ?= "3.0.3"
+
+SRCREV_machine_qemuarm = "083e3befb5f2562e1375f19e645f1e024c92b0b2"
+SRCREV_machine_qemumips = "79f46ece4d5e54fce49442f575a4b8663012dfa2"
+SRCREV_machine_qemuppc = "f1ce5cf96659e036674eddd170633caaf3c1d487"
+SRCREV_machine_qemux86 = "d44ab16a5c0aa5fed2ef2f587bd90cad37132dbd"
+SRCREV_machine_qemux86-64 = "842be4e7221f982e0a76075cf556a9354991ff94"
+SRCREV_machine = "66398ee1195e1b142a1b540795ff16e04b32467f"
+SRCREV_meta = "d588bdafc0d9b4d2386144b7d76a1d379e2d16c0"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.6



