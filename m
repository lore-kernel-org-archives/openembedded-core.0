Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1T8xDQ-00077b-QH
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 19:47:09 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q84HYh1r028385;
	Tue, 4 Sep 2012 10:34:44 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue,  4 Sep 2012 13:34:42 -0400
Message-Id: <210d5dd9a5b18d8b11e2cb1effa694de31c4448c.1346779930.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346779930.git.bruce.ashfield@windriver.com>
References: <cover.1346779930.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1346779930.git.bruce.ashfield@windriver.com>
References: <cover.1346779930.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] linux-yocto-rt: 3.4.9-rt17 remaining changes
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
X-List-Received-Date: Tue, 04 Sep 2012 17:47:09 -0000

The first import of 3.4.9-rt17 only picked up part of the import due
to a merge conflict with the modified files, and then SRCREVs being
generated from the pre-merge commit.

This SRCREV update picks up the rest of the modified files for full
-rt support.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index ae64de1..b2620ea 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -8,8 +8,8 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "52518e60a7220385f31cdd09b83dacd84581c88c"
-SRCREV_machine_qemuppc ?= "e6db5e91e1a5b31d26ac67778df7fb1fd5e42aa5"
+SRCREV_machine ?= "9032b1e9daf5b4396f939981c3be95f67802d18c"
+SRCREV_machine_qemuppc ?= "08ce190232f89303772b6591ca7daaf2820eb74e"
 SRCREV_meta ?= "463299bc2e533e1bd38b0053ae7b210980f269c3"
 
 PR = "${INC_PR}.0"
-- 
1.7.5.4



