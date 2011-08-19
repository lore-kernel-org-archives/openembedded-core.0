Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QuHZj-0005jy-Ix
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 07:24:59 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7J5KA7t005178;
	Thu, 18 Aug 2011 22:20:15 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 19 Aug 2011 01:20:06 -0400
Message-Id: <180e52d7b1b6754d91a98b09cb3d9ebe702feaec.1313730559.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1313730559.git.bruce.ashfield@windriver.com>
References: <cover.1313730559.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1313730559.git.bruce.ashfield@windriver.com>
References: <cover.1313730559.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 3/3] linux-yocto: update SRCREVs for 3.0.3
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
X-List-Received-Date: Fri, 19 Aug 2011 05:25:00 -0000

Updating the SRCREVs to pickup the kernel.org -stable update for
3.0.3

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.0.bb |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 3ebd830..fa33a76 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -12,13 +12,13 @@ KBRANCH = ${KMACHINE}
 
 LINUX_VERSION ?= "3.0"
 
-SRCREV_machine_qemuarm = "36b4cdddcafc711f0ec9ad97882f23a6443c61b2"
-SRCREV_machine_qemumips = "2db2aacc589a518a74e8a8543e80403f09de8134"
-SRCREV_machine_qemuppc = "c0f5dd4ef37b445d8ac73b11dd93e0ffdb7e9f6d"
-SRCREV_machine_qemux86 = "c29beadfd4364aca9358ac0fdb8356c1dbbdacb2"
-SRCREV_machine_qemux86-64 = "d0b814813bce09971c5cbb0d22bacb8842146fa0"
-SRCREV_machine = "ad13129a87957656c18584793abcee51de0e196a"
-SRCREV_meta = "9da70812ecddee0f7eeb11675f29497cb997275e"
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
1.7.4.1



