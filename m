Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A0E6F615E9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 02:20:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r852KTrL026010
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Sep 2013 19:20:29 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 4 Sep 2013 19:20:29 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 4 Sep 2013 22:20:24 -0400
Message-ID: <2f0356043cffbb9acd466e75f14cc4fa9f6b7c0d.1378347409.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1378347409.git.bruce.ashfield@windriver.com>
References: <cover.1378347409.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] qemumips: fix keyboard entry in graphical boots
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
X-List-Received-Date: Thu, 05 Sep 2013 02:20:30 -0000
Content-Type: text/plain

qemumips* (aka mti-malta32/64) still need to revert the following in
3.10:

   "Input: i8042-io - fix up region handling on MIPS" (commit 197a1e96)

It was understood that this was no longer necessary, but X based boots
still suffer the issue.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 1d29f6b..2de1798 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -4,11 +4,11 @@ KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
 SRCREV_machine_qemuarm ?= "6a38a13d2aa6058d7e7d88c3dc44b0bdfc4fe551"
-SRCREV_machine_qemumips  ?= "ad273773bee951fc63ab54f9fda672263bf919b4"
+SRCREV_machine_qemumips  ?= "6c8921e44618938847865e4a9951086d7dc23085"
 SRCREV_machine_qemuppc ?= "677afd6cdbfb5c23a9e5479acafb7ba484789837"
 SRCREV_machine_qemux86 ?= "ebc8428fdd938cfdfcdcadd77c3308ece6a57de1"
 SRCREV_machine_qemux86-64 ?= "ebc8428fdd938cfdfcdcadd77c3308ece6a57de1"
-SRCREV_machine_qemumips64 ?= "6fdcd396b40373a63f57aeaf4fd59b4b4da05f8a"
+SRCREV_machine_qemumips64 ?= "ebc55bed9558a0e2f390e9cef03161b299138326"
 SRCREV_machine ?= "ebc8428fdd938cfdfcdcadd77c3308ece6a57de1"
 SRCREV_meta ?= "cd502a88148ab214b54860f97a96f41858fd6446"
 
-- 
1.7.10.4


