Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8BCBD65C75
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 21:00:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 06 Feb 2015 13:00:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,530,1418112000"; d="scan'208";a="682165576"
Received: from ranerica-desk01.sc.intel.com ([10.3.52.155])
	by orsmga002.jf.intel.com with ESMTP; 06 Feb 2015 13:00:20 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
Date: Fri,  6 Feb 2015 12:59:58 -0800
Message-Id: <1423256398-20405-2-git-send-email-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1423256398-20405-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
References: <1423256398-20405-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
Subject: [PATCH] runqemu: Add option for BIOS binary filename
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
X-List-Received-Date: Fri, 06 Feb 2015 21:00:57 -0000

If we intend to use a custom BIOS binary file, it would be good to be
able to specify the name of the binary via the -bios option of qemu. The
name of the custom binary could be different from the default name used
by qemu. For instance, it was bios.bin in qemu 1.5.0 and changed to
bios-256k.bin for 2.1.0.

Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
 scripts/runqemu | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index da35bb8..3d75319 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -153,6 +153,9 @@ while true; do
 	"biosdir="*)
             CUSTOMBIOSDIR="${arg##biosdir=}"
 	    ;;
+        "biosfilename="*)
+            SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -bios ${arg##biosfilename=}"
+            ;;
         "qemuparams="*)
             SCRIPT_QEMU_EXTRA_OPT="${arg##qemuparams=}"
 
-- 
1.9.1


