Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SeY08-0002Md-Lw
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 22:47:44 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 34BBA2FD1D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 16:37:06 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2012 13:36:40 -0700
Message-Id: <1a76f50c1f159477a86dc7a6cb95873cee05d9e6.1339533128.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1339533128.git.scott.a.garman@intel.com>
References: <cover.1339533128.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1339533128.git.scott.a.garman@intel.com>
References: <cover.1339533128.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 34BBA2FD1D.36CF7
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 09/16] gnupg: add libusb to DEPENDS
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
X-List-Received-Date: Tue, 12 Jun 2012 20:47:44 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

gnupg apparently depends on libusb:

| error: Failed dependencies:
| 	 libusb-0.1-4 >= 0.1.3 is needed by gnupg-2.0.18-r1.core2

So add libusb to gnupg DEPENDS.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Resolved merge conflicts when importing from oe-core master.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-support/gnupg/gnupg_2.0.18.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/gnupg/gnupg_2.0.18.bb b/meta/recipes-support/gnupg/gnupg_2.0.18.bb
index 3085494..7dfd908 100644
--- a/meta/recipes-support/gnupg/gnupg_2.0.18.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.0.18.bb
@@ -4,8 +4,8 @@ LICENSE = "GPLv3 & LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
                     file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6"
 
-DEPENDS = "pth libassuan libksba zlib bzip2 readline libgcrypt"
-PR = "r1"
+DEPENDS = "pth libassuan libksba zlib bzip2 readline libgcrypt libusb"
+PR = "r2"
 
 inherit autotools gettext
 
-- 
1.7.9.5



