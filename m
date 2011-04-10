Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q912w-0007eL-Am
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Apr 2011 22:15:46 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 Apr 2011 13:13:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,334,1299484800"; d="scan'208";a="907791339"
Received: from unknown (HELO localhost) ([10.255.12.197])
	by fmsmga001.fm.intel.com with ESMTP; 10 Apr 2011 13:13:33 -0700
Message-Id: <1a7bf1d969de53de470a1ce5ce8ce5fdcc7232ad.1302466269.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302466269.git.sgw@linux.intel.com>
References: <cover.1302466269.git.sgw@linux.intel.com>
Old-Date: Fri, 8 Apr 2011 10:27:52 -0700
Date: Sun, 10 Apr 2011 13:13:33 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 6/6] README.hardware: automate boot process for router station pro
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
X-List-Received-Date: Sun, 10 Apr 2011 20:15:46 -0000

From: Darren Hart <dvhart@linux.intel.com>

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 README.hardware |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/README.hardware b/README.hardware
index 025c678..b2ce146 100644
--- a/README.hardware
+++ b/README.hardware
@@ -392,3 +392,25 @@ To boot the flashed kernel perform the following steps.
 (-e means 'elf', -d 'decompress')
 
 2) Execute the kernel using the exec command as above.
+
+--- Automating the boot process ---
+
+After writing the kernel to flash and testing the load and exec commands
+manually, you can automate the boot process with a boot script.
+
+1) RedBoot> fconfig
+   (Answer the questions not specified here as they pertain to your environment)
+2) Run script at boot: true
+  Boot script: 
+  .. fis load -d -e kernel
+  .. exec
+  Enter script, terminate with empty line
+  >> fis load -d -e kernel
+  >> exec -c "console=ttyS0,115200 root=/dev/sda1 rw rootdelay=2 board=UBNT-RSPRO"
+  >> 
+3) Answer the remaining questions and write the changes to flash:
+  Update RedBoot non-volatile configuration - continue (y/n)? y
+  ... Erase from 0xbfff0000-0xc0000000: .
+  ... Program from 0x87ff0000-0x88000000 at 0xbfff0000: .
+4) Power cycle the board.
+
-- 
1.7.1.1



