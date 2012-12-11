Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TiN43-0008Kt-K9
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 11:27:53 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id A4575D22C0;
	Tue, 11 Dec 2012 11:13:15 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Dec 2012 11:12:51 +0100
Message-Id: <1355220771-32095-2-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1355220771-32095-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1355220771-32095-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [PATCH] linux-libc-headers: add 3.7 version
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
X-List-Received-Date: Tue, 11 Dec 2012 10:27:53 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.7.bb | 4 ++++
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
1.8.0



