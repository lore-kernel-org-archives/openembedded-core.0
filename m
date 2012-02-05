Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Rtvl1-00013r-5K
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Feb 2012 07:39:32 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q156VIVe002873;
	Sat, 4 Feb 2012 22:31:25 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Sun,  5 Feb 2012 01:31:09 -0500
Message-Id: <b77a4edb8a1782a2d04eda1b751d36b608a5f455.1328423023.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1328423023.git.bruce.ashfield@windriver.com>
References: <cover.1328423023.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1328423023.git.bruce.ashfield@windriver.com>
References: <cover.1328423023.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 5/5] linux-yocto: fri2: use emgd-1.10
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
X-List-Received-Date: Sun, 05 Feb 2012 06:39:32 -0000

Updating meta for the following change:

    fri2: use emgd-1.10

    Use the yocto/emgd-1.10 branch in place of yocto/emgd.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index a80924d..c13fb37 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemuppc ?= "b8228f337002ad88f1e152d0c0c46c6035cd0428"
 SRCREV_machine_qemux86 ?= "417fc778a86e81303bab5883b919ee422ec51c04"
 SRCREV_machine_qemux86-64 ?= "417fc778a86e81303bab5883b919ee422ec51c04"
 SRCREV_machine ?= "417fc778a86e81303bab5883b919ee422ec51c04"
-SRCREV_meta ?= "138bf5b502607fe40315c0d76822318d77d97e01"
+SRCREV_meta ?= "b78a519841bd8b477cad599af8d38df6760445c1"
 
 PR = "r0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.4.1



