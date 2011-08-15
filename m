Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Qt3n2-0004u6-1h
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 22:29:40 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7FKOvCC019821;
	Mon, 15 Aug 2011 13:25:00 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 15 Aug 2011 16:24:53 -0400
Message-Id: <93aa2a7df8c13f5acb7c0d1231face394924b8c0.1313439568.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1313439568.git.bruce.ashfield@windriver.com>
References: <cover.1313439568.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1313439568.git.bruce.ashfield@windriver.com>
References: <cover.1313439568.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 3/3] linux-yocto: meta SRCREV bump
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
X-List-Received-Date: Mon, 15 Aug 2011 20:29:40 -0000

Bumping the linux-yocto meta SRCREV to pickup new target
configurations and features.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.0.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 132ee0f..44f1ebe 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -20,7 +20,7 @@ SRCREV_machine_qemuppc = "c0f5dd4ef37b445d8ac73b11dd93e0ffdb7e9f6d"
 SRCREV_machine_qemux86 = "c29beadfd4364aca9358ac0fdb8356c1dbbdacb2"
 SRCREV_machine_qemux86-64 = "d0b814813bce09971c5cbb0d22bacb8842146fa0"
 SRCREV_machine = "ad13129a87957656c18584793abcee51de0e196a"
-SRCREV_meta = "7782fc673afd6a1c742409896ae787560d96fce8"
+SRCREV_meta = "9da70812ecddee0f7eeb11675f29497cb997275e"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.4.1



