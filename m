Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TsF5p-0000wu-Su
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 16:58:30 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r07FhFFp014487;
	Mon, 7 Jan 2013 07:43:17 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon,  7 Jan 2013 10:43:05 -0500
Message-Id: <75f4b11cef2f54c3488bf27cebdcee565387cf33.1357572952.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1357572952.git.bruce.ashfield@windriver.com>
References: <cover.1357572952.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1357572952.git.bruce.ashfield@windriver.com>
References: <cover.1357572952.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-libc-headers: add 3.7 version
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
X-List-Received-Date: Mon, 07 Jan 2013 15:58:30 -0000

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.7.bb |    4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.7.bb

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.7.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.7.bb
new file mode 100644
index 0000000..3d688b7
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.7.bb
@@ -0,0 +1,4 @@
+require linux-libc-headers.inc
+
+SRC_URI[md5sum] = "5323f3faadd051e83af605a63be5ea2e"
+SRC_URI[sha256sum] = "dc08d87a579fe2918362e6666e503a95a76296419195cb499aa9dd4dbe171a9e"
-- 
1.7.10.4



