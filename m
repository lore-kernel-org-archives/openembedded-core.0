Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RJR6x-0002cX-Jx
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Oct 2011 16:39:15 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9REX3p4001648;
	Thu, 27 Oct 2011 07:33:06 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 27 Oct 2011 10:32:49 -0400
Message-Id: <59e1e65076d660facf44bd4111aa1dabc6925eb1.1319725711.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1319725711.git.bruce.ashfield@windriver.com>
References: <cover.1319725711.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1319725711.git.bruce.ashfield@windriver.com>
References: <cover.1319725711.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 3/3] linux-libc-headers: remove older recipes
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
X-List-Received-Date: Thu, 27 Oct 2011 14:39:16 -0000

The default libc-headers is v3.1 and building against the new
headers but booting an older kernel has been shown to work.
Older 2.6 based header builds can easily be reproduced, but
having all the old recipe iterations available is not required.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../linux-libc-headers_2.6.37.2.bb                 |    7 -------
 .../linux-libc-headers_2.6.39.bb                   |    7 -------
 2 files changed, 0 insertions(+), 14 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb
deleted file mode 100644
index c6562b5..0000000
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require linux-libc-headers.inc
-
-PR = "r3"
-
-SRC_URI += " file://connector-msg-size-fix.patch"
-SRC_URI[md5sum] = "89f681bc7c917a84aa7470da6eed5101"
-SRC_URI[sha256sum] = "2920c4cd3e87fe40ebee96d28779091548867e1c36f71c1fc3d07e6d5802161f"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb
deleted file mode 100644
index 36cfb4f..0000000
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require linux-libc-headers.inc
-
-PR = "r3"
-
-SRC_URI += " file://connector-msg-size-fix.patch"
-SRC_URI[md5sum] = "1aab7a741abe08d42e8eccf20de61e05"
-SRC_URI[sha256sum] = "584d17f2a3ee18a9501d7ff36907639e538cfdba4529978b8550c461d45c61f6"
-- 
1.7.0.4



