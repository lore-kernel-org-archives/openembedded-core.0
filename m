Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QuHZi-0005ju-Fe
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 07:24:58 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7J5KA7r005178;
	Thu, 18 Aug 2011 22:20:13 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 19 Aug 2011 01:20:04 -0400
Message-Id: <e7036174cf607031e13323564f402c7b805e4572.1313730559.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1313730559.git.bruce.ashfield@windriver.com>
References: <cover.1313730559.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1313730559.git.bruce.ashfield@windriver.com>
References: <cover.1313730559.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 1/3] linux-yocto: restoring LINUX_VERSION ?= "3.0"
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
X-List-Received-Date: Fri, 19 Aug 2011 05:24:58 -0000

There are enough other recipes/layers and users that are currently
using PREFERRED_VERSION that changing the value to 3.0.x does not
work at the current time. So we'll restore this to 3.0 and follow
the same model as previous releases. Using DEFAULT_PREFERENCE and
other schemes will be considered in the future.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.0.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 44f1ebe..5d9871f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -11,7 +11,7 @@ KMACHINE_qemuarm  = "yocto/standard/arm-versatile-926ejs"
 KBRANCH = ${KMACHINE}
 KMETA = meta
 
-LINUX_VERSION ?= "3.0.1"
+LINUX_VERSION ?= "3.0"
 LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
 
 SRCREV_machine_qemuarm = "36b4cdddcafc711f0ec9ad97882f23a6443c61b2"
-- 
1.7.4.1



