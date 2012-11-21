Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TbI81-00087U-8J
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 22:46:47 +0100
Received: from yow-bashfiel-d3.corp.ad.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qALLWUKp020293;
	Wed, 21 Nov 2012 13:32:31 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 21 Nov 2012 16:32:23 -0500
Message-Id: <0c7e7c3d7d82d194f552e35002e7433d3b674922.1353532567.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1353532567.git.bruce.ashfield@windriver.com>
References: <cover.1353532567.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1353532567.git.bruce.ashfield@windriver.com>
References: <cover.1353532567.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, linux-yocto@yoctoproject.org,
	openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto/3.0: fix virtio configuration typo
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
X-List-Received-Date: Wed, 21 Nov 2012 21:46:47 -0000

The recent tools updates in master exposed a typo that has existed
in the 3.0 kernel meta data and that breaks the build for boards still
using the 3.0 kernel.

Bumping the meta SRCREV to pickup the following fix:

[
  commit fa9b8c24e84bb9d75d08d197c84c50ce4f99c424
  Author: Bruce Ashfield <bruce.ashfield@windriver.com>
  Date:   Wed Nov 21 09:24:46 2012 -0500

    meta: fix typo in virtio.scc

    virtio.scc was referring to an invalid/incorrect virto.cfg. Fixing
    this typo fixes the build for boards still using the 3.0 kernel.
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.0.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index e917beb..b7fbf23 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -17,7 +17,7 @@ SRCREV_machine_qemuppc ?= "d8779a6245d13c3b56eabac36a14c8896f448566"
 SRCREV_machine_qemux86 ?= "33d5d1ea371dad280e5bcfadd12c3a360c6bc5b8"
 SRCREV_machine_qemux86-64 ?= "fe23c7dd94eb94dd5887028683093615ac921086"
 SRCREV_machine ?= "cef17a18d72eae749dc78de3c83772f52815d842"
-SRCREV_meta ?= "bf5ee4945ee6d748e6abe16356f2357f76b5e2f0"
+SRCREV_meta ?= "fa9b8c24e84bb9d75d08d197c84c50ce4f99c424"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.10.4



