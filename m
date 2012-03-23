Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SB859-0000Xg-Bk
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 18:15:19 +0100
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2NH6IQk007657;
	Fri, 23 Mar 2012 10:06:19 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 23 Mar 2012 13:07:46 -0400
Message-Id: <e19729b388d03502a56b35325a7d2fc1eba278fd.1332522200.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1332522200.git.bruce.ashfield@windriver.com>
References: <cover.1332522200.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1332522200.git.bruce.ashfield@windriver.com>
References: <cover.1332522200.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/3] linux-libc-headers: add 3.2 headers and remove 3.1
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
X-List-Received-Date: Fri, 23 Mar 2012 17:15:19 -0000

The 3.1 kernel was never released or directly supported via
oe-core. So as part of update the libc-headers to 3.2 we can
take the opportunity to remove it.

Built and booted on the qemu* targets.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../linux-libc-headers/linux-libc-headers_3.1.bb   |    7 -------
 .../linux-libc-headers/linux-libc-headers_3.2.bb   |    6 ++++++
 2 files changed, 6 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.2.bb

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb
deleted file mode 100644
index b87ecde..0000000
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require linux-libc-headers.inc
-
-PR = "r1"
-
-SRC_URI += " file://connector-msg-size-fix.patch"
-SRC_URI[md5sum] = "8d43453f8159b2332ad410b19d86a931"
-SRC_URI[sha256sum] = "2573d2378c754b0c602b57586e9311e5b38c5d1e6c137f02873833633a4b9359"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.2.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.2.bb
new file mode 100644
index 0000000..9bee02b
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.2.bb
@@ -0,0 +1,6 @@
+require linux-libc-headers.inc
+
+PR = "r1"
+
+SRC_URI[md5sum] = "7ceb61f87c097fc17509844b71268935"
+SRC_URI[sha256sum] = "c881fc2b53cf0da7ca4538aa44623a7de043a41f76fd5d0f51a31f6ed699d463"
-- 
1.7.0.4



