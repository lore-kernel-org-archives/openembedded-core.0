Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1T8v6G-0004Hh-Rj
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 17:31:37 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q84FJAOK005974;
	Tue, 4 Sep 2012 08:19:11 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue,  4 Sep 2012 11:19:09 -0400
Message-Id: <fc1c6360e80b1d094a5b618cb7aeabe0700a4971.1346771668.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346771668.git.bruce.ashfield@windriver.com>
References: <cover.1346771668.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1346771668.git.bruce.ashfield@windriver.com>
References: <cover.1346771668.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, dvhart@linux.intel.com,
	saul.wold@intel.com
Subject: [PATCH 1/1] linux-yocto-rt: update to 3.4.9-rt17
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
X-List-Received-Date: Tue, 04 Sep 2012 15:31:37 -0000

Bumping the 3.4 kernel to -rt17.

As well as picking up the normal set of bug fixes, this update fixes
a boot issue that was introduced during merging of kernel.org -stable
updates into the -rt branches (in the timekeeping code).

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 9cc7e99..ae64de1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -8,8 +8,8 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "eb9c0669c66041eeae72b853011ec31ad81cc35d"
-SRCREV_machine_qemuppc ?= "76add8441a2b6ed26bcc9268819782b2eec99001"
+SRCREV_machine ?= "52518e60a7220385f31cdd09b83dacd84581c88c"
+SRCREV_machine_qemuppc ?= "e6db5e91e1a5b31d26ac67778df7fb1fd5e42aa5"
 SRCREV_meta ?= "463299bc2e533e1bd38b0053ae7b210980f269c3"
 
 PR = "${INC_PR}.0"
-- 
1.7.5.4



