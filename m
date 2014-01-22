Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E15FD6CDF2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 00:53:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Jan 2014 16:49:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,697,1384329600"; d="scan'208";a="470435621"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga002.jf.intel.com with ESMTP; 21 Jan 2014 16:53:10 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Poky <poky@yoctoproject.org>
Date: Tue, 21 Jan 2014 16:59:03 -0800
Message-Id: <a5f59093c6a7569e566bec48413edbf6dc6502a3.1390351667.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <e6c72bf867006ab15d62d0beb1cd8aafe19db72a.1390351667.git.dvhart@linux.intel.com>
References: <e6c72bf867006ab15d62d0beb1cd8aafe19db72a.1390351667.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1390351667.git.dvhart@linux.intel.com>
References: <cover.1390351667.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@intel.com>
Subject: [PATCH 18/19] doc: Update profile-manual to use new core2_32 tune name
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jan 2014 00:53:39 -0000

Replace core2 with core2_32 where appropriate for the new
x86 tune naming.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Eggleton <paul.eggleton@intel.com>
Cc: Tom Zanussi <tom.zanussi@intel.com>
Cc: Nitin Kamble <nitin.a.kamble@intel.com>
Cc: Mark Hatle <mark.hatle@windriver.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 .../profile-manual/profile-manual-usage.xml        |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/profile-manual/profile-manual-usage.xml b/documentation/profile-manual/profile-manual-usage.xml
index faae645..5577b1b 100644
--- a/documentation/profile-manual/profile-manual-usage.xml
+++ b/documentation/profile-manual/profile-manual-usage.xml
@@ -381,13 +381,13 @@
                 build/tmp/deploy/rpm/* on the host system. Find the
                 busybox-dbg-...rpm file and copy it to the target. For example:
                 <literallayout class='monospaced'>
-     [trz@empanada core2]$ scp /home/trz/yocto/crownbay-tracing-dbg/build/tmp/deploy/rpm/core2/busybox-dbg-1.20.2-r2.core2.rpm root@192.168.1.31:
+     [trz@empanada core2]$ scp /home/trz/yocto/crownbay-tracing-dbg/build/tmp/deploy/rpm/core2_32/busybox-dbg-1.20.2-r2.core2_32.rpm root@192.168.1.31:
      root@192.168.1.31's password:
-     busybox-dbg-1.20.2-r2.core2.rpm                     100% 1826KB   1.8MB/s   00:01
+     busybox-dbg-1.20.2-r2.core2_32.rpm                     100% 1826KB   1.8MB/s   00:01
                 </literallayout>
                 Now install the debug rpm on the target:
                 <literallayout class='monospaced'>
-     root@crownbay:~# rpm -i busybox-dbg-1.20.2-r2.core2.rpm
+     root@crownbay:~# rpm -i busybox-dbg-1.20.2-r2.core2_32.rpm
                 </literallayout>
                 Now that the debuginfo is installed, we see that the busybox
                 entries now display their functions symbolically:
@@ -3024,7 +3024,7 @@
                 First cd into the build directory that contains the hello
                 executable:
                 <literallayout class='monospaced'>
-     $ cd build/tmp/work/core2-poky-linux/lttng-ust/2.0.5-r0/git/tests/hello/.libs
+     $ cd build/tmp/work/core2_32-poky-linux/lttng-ust/2.0.5-r0/git/tests/hello/.libs
                 </literallayout>
                 Copy that over to the target machine:
                 <literallayout class='monospaced'>
-- 
1.7.9.5


