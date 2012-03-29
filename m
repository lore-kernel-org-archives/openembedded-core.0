Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SDHs7-00041a-0R
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 18:06:47 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 4707430500
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 11:57:40 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Mar 2012 08:57:37 -0700
Message-Id: <c513f4ecba19d0ceeb5d158287e77d3c74322254.1333036186.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1333036186.git.scott.a.garman@intel.com>
References: <cover.1333036186.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1333036186.git.scott.a.garman@intel.com>
References: <cover.1333036186.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 4707430500.005CA
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/1] runqemu: set console=ttyS0 when running with nographic option
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
X-List-Received-Date: Thu, 29 Mar 2012 16:06:47 -0000

When passing the nograhic option to the runqemu script, set
console=ttyS0 in the kernel options so the user can view
the kernel boot messages.

This fixes [YOCTO #1475]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 scripts/runqemu |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index c349de0..caabf61 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -135,6 +135,7 @@ while [ $i -le $# ]; do
             ;;
         "nographic")
             SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -nographic"
+            SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT console=ttyS0"
             ;;
         "serial")
             SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -serial stdio"
-- 
1.7.5.4



