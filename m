Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TfdAv-0007R6-0x
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 22:03:37 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB3Kn7lv013095;
	Mon, 3 Dec 2012 12:49:10 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon,  3 Dec 2012 15:49:06 -0500
Message-Id: <fb44f3ebdbc3f46c33f55cde955cc990cddcfc99.1354566708.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1354566708.git.bruce.ashfield@windriver.com>
References: <cover.1354566708.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1354566708.git.bruce.ashfield@windriver.com>
References: <cover.1354566708.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto/3.4: inform the fetcher if the meta branch changes
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
X-List-Received-Date: Mon, 03 Dec 2012 21:03:37 -0000

The meta data branch for the kernel can be varied by changing the
KMETA variable, but that change wasn't reflected in the SRC_URI,
which means that the fetcher won't check for changes on that branch
and is a potential source of errors.

Making the meta branch specification KMETA vs meta solves the problem.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 0e795c6..91785f9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -11,7 +11,7 @@ SRCREV_machine_qemux86-64 ?= "b13bef6377719a488293af196236cc290566fad3"
 SRCREV_machine ?= "b13bef6377719a488293af196236cc290566fad3"
 SRCREV_meta ?= "6737e890fff2a423fbb022ab1f7f82ef187fd8b1"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
 LINUX_VERSION ?= "3.4.20"
 
-- 
1.7.10.4



