Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Tohvd-0007Wb-LO
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Dec 2012 22:57:22 +0100
Received: from localhost (c-50-137-42-92.hsd1.or.comcast.net [50.137.42.92])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 0F4C82FEF2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2012 16:42:20 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Dec 2012 13:41:43 -0800
Message-Id: <c067fbcb910f888cc6328d725a395ce681862377.1356730817.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1356730817.git.scott.a.garman@intel.com>
References: <cover.1356730817.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1356730817.git.scott.a.garman@intel.com>
References: <cover.1356730817.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 0F4C82FEF2.2AD30
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 10/15] gitignore: add generated doc files to ignore list
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
X-List-Received-Date: Fri, 28 Dec 2012 21:57:24 -0000

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .gitignore |   24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/.gitignore b/.gitignore
index f8db092..32ade34 100644
--- a/.gitignore
+++ b/.gitignore
@@ -17,5 +17,25 @@ meta-*
 *.orig
 *.rej
 *~
-
-
+documentation/adt-manual/adt-manual.html
+documentation/adt-manual/adt-manual.pdf
+documentation/adt-manual/adt-manual.tgz
+documentation/dev-manual/dev-manual.html
+documentation/dev-manual/dev-manual.pdf
+documentation/dev-manual/dev-manual.tgz
+documentation/poky-ref-manual/poky-ref-manual.html
+documentation/poky-ref-manual/poky-ref-manual.pdf
+documentation/poky-ref-manual/poky-ref-manual.tgz
+documentation/poky-ref-manual/bsp-guide.html
+documentation/poky-ref-manual/bsp-guide.pdf
+documentation/bsp-guide/bsp-guide.html
+documentation/bsp-guide/bsp-guide.pdf
+documentation/bsp-guide/bsp-guide.tgz
+documentation/yocto-project-qs/yocto-project-qs.html
+documentation/yocto-project-qs/yocto-project-qs.tgz
+documentation/kernel-manual/kernel-manual.html
+documentation/kernel-manual/kernel-manual.tgz
+documentation/kernel-manual/kernel-manual.pdf
+documentation/mega-manual/mega-manual.html
+documentation/mega-manual/mega-manual.pdf
+documentation/mega-manual/mega-manual.tgz
-- 
1.7.9.5



