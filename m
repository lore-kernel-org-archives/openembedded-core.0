Received: from am1ehsobe005.messaging.microsoft.com ([213.199.154.208]
	helo=AM1EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <b39320@vakul-desktop.ap.freescale.net>)
	id 1Rmg7r-0006ET-KP for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 07:33:03 +0100
Received: from mail76-am1-R.bigfish.com (10.3.201.242) by
	AM1EHSOBE005.bigfish.com (10.3.204.25) with Microsoft SMTP Server id
	14.1.225.23; Mon, 16 Jan 2012 06:10:11 +0000
Received: from mail76-am1 (localhost [127.0.0.1])	by mail76-am1-R.bigfish.com
	(Postfix) with ESMTP id 5BD5A40601	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2012 06:10:11 +0000 (UTC)
X-SpamScore: 0
X-BigFish: VS0(zzzz1202hzz8275bh8275dhz2dhc1ahc1bh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail76-am1 (localhost.localdomain [127.0.0.1]) by mail76-am1
	(MessageSwitch) id 1326694210519313_1936;
	Mon, 16 Jan 2012 06:10:10 +0000 (UTC)
Received: from AM1EHSMHS012.bigfish.com (unknown [10.3.201.241])	by
	mail76-am1.bigfish.com (Postfix) with ESMTP id 6EEBC5C0042	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2012 06:10:10 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS012.bigfish.com
	(10.3.207.112) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 16 Jan 2012 06:10:09 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.355.3; Mon, 16 Jan 2012 00:10:11 -0600
Received: from vakul-desktop.ap.freescale.net (vakul-desktop.ap.freescale.net
	[10.232.14.48])	by az33smr01.freescale.net (8.13.1/8.13.0) with
	ESMTP id
	q0G6A89B027148	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2012 00:10:10 -0600 (CST)
Received: from vakul-desktop.ap.freescale.net (localhost [127.0.0.1])	by
	vakul-desktop.ap.freescale.net (8.14.3/8.14.3/Debian-9.1ubuntu1) with
	ESMTP id q0GBcIiY006350;	Mon, 16 Jan 2012 17:08:18 +0530
Received: (from b39320@localhost)	by vakul-desktop.ap.freescale.net
	(8.14.3/8.14.3/Submit) id q0GBcHIj006348;
	Mon, 16 Jan 2012 17:08:17 +0530
From: <b39320@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jan 2012 17:08:15 +0530
Message-ID: <1326713895-6307-1-git-send-email-b39320@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.net
Cc: Aneesh Bansal <aneesh.bansal@freescale.com>
Subject: [PATCH] add mfatbu/mfatbl instructions support in Valgrind
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
X-List-Received-Date: Mon, 16 Jan 2012 06:33:03 -0000
Content-Type: text/plain

From: Aneesh Bansal <aneesh.bansal@freescale.com>

Upstream Status : Pending

---
 ...upport-for-PPC-instructions-mfatbu-mfatbl.patch |   94 ++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.7.0.bb   |    3 +-
 2 files changed, 96 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.7.0/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind-3.7.0/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch b/meta/recipes-devtools/valgrind/valgrind-3.7.0/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
new file mode 100644
index 0000000..ca66bc7
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind-3.7.0/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
@@ -0,0 +1,94 @@
+From 0bf4b0ac18d1ea41b32ad781d214b295ca1998f3 Mon Sep 17 00:00:00 2001
+From: Aneesh Bansal <aneesh.bansal@freescale.com>
+Date: Mon, 21 Nov 2011 17:31:39 +0530
+Subject: [PATCH] Added support for PPC instructions mfatbu, mfatbl.
+
+Signed-off-by: Aneesh Bansal <aneesh.bansal@freescale.com>
+---
+Currently Valgrind 3.7.0 does not have support for PPC instructions mfatbu and mfatbl. When we run a USDPAA application with VALGRIND, the following error is given by valgrind :
+dis_proc_ctl(ppc)(mfspr,SPR)(0x20F)
+disInstr(ppc): unhandled instruction: 0x7C0F82A6
+
+
+ VEX/priv/guest_ppc_defs.h    |    2 ++
+ VEX/priv/guest_ppc_helpers.c |   18 ++++++++++++++++++
+ VEX/priv/guest_ppc_toIR.c    |   22 ++++++++++++++++++++++
+ 3 files changed, 42 insertions(+), 0 deletions(-)
+
+diff --git a/VEX/priv/guest_ppc_defs.h b/VEX/priv/guest_ppc_defs.h
+index dd3c62e..11a34aa 100644
+--- a/VEX/priv/guest_ppc_defs.h
++++ b/VEX/priv/guest_ppc_defs.h
+@@ -146,6 +146,8 @@ extern UInt ppc32g_dirtyhelper_MFSPR_268_269 ( UInt );
+ 
+ extern UInt ppc32g_dirtyhelper_MFSPR_287 ( void );
+ 
++extern UInt ppc32g_dirtyhelper_MFSPR_526_527 ( UInt );
++
+ extern void ppc32g_dirtyhelper_LVS ( VexGuestPPC32State* gst,
+                                      UInt vD_idx, UInt sh,
+                                      UInt shift_right );
+diff --git a/VEX/priv/guest_ppc_helpers.c b/VEX/priv/guest_ppc_helpers.c
+index 11aa428..b49ea3f 100644
+--- a/VEX/priv/guest_ppc_helpers.c
++++ b/VEX/priv/guest_ppc_helpers.c
+@@ -119,6 +119,24 @@ UInt ppc32g_dirtyhelper_MFSPR_287 ( void )
+ #  endif
+ }
+ 
++/* CALLED FROM GENERATED CODE */
++/* DIRTY HELPER (non-referentially transparent) */
++UInt ppc32g_dirtyhelper_MFSPR_526_527 ( UInt r527 )
++{
++#  if defined(__powerpc__) || defined(_AIX)
++   UInt spr;
++   if (r527) {
++      __asm__ __volatile__("mfspr %0,527" : "=b"(spr));
++   } else {
++      __asm__ __volatile__("mfspr %0,526" : "=b"(spr));
++   }
++   return spr;
++#  else
++   return 0;
++#  endif
++}
++
++
+ 
+ /* CALLED FROM GENERATED CODE */
+ /* DIRTY HELPER (reads guest state, writes guest mem) */
+diff --git a/VEX/priv/guest_ppc_toIR.c b/VEX/priv/guest_ppc_toIR.c
+index f8d220d..37c8974 100644
+--- a/VEX/priv/guest_ppc_toIR.c
++++ b/VEX/priv/guest_ppc_toIR.c
+@@ -5657,6 +5657,28 @@ static Bool dis_proc_ctl ( VexAbiInfo* vbi, UInt theInstr )
+          break;
+       }
+ 
++
++      case 526 /* 0x20E */:
++      case 527 /* 0x20F */: {
++         UInt     arg  = SPR==526 ? 0 : 1;
++         IRTemp   val  = newTemp(Ity_I32);
++         IRExpr** args = mkIRExprVec_1( mkU32(arg) );
++         IRDirty* d    = unsafeIRDirty_1_N(
++                            val,
++                            0/*regparms*/,
++                            "ppc32g_dirtyhelper_MFSPR_526_527",
++                            fnptr_to_fnentry
++                               (vbi, &ppc32g_dirtyhelper_MFSPR_526_527),
++                            args
++                         );
++         /* execute the dirty call, dumping the result in val. */
++         stmt( IRStmt_Dirty(d) );
++         putIReg( rD_addr,
++                  mkWidenFrom32(ty, mkexpr(val), False/*unsigned*/) );
++         DIP("mfspr r%u,%u", rD_addr, (UInt)SPR);
++         break;
++      }
++
+       default:
+          vex_printf("dis_proc_ctl(ppc)(mfspr,SPR)(0x%x)\n", SPR);
+          return False;
+-- 
+1.7.0.4
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
index d2c4467..858bf3d 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
@@ -14,7 +14,8 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://fix_unsupporting_kernel_3.patch \
            file://fixed-perl-path.patch \
            file://fix_for_automake_1.11.2.patch \
-           file://configure-fix.patch"
+           file://configure-fix.patch \
+           file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch"
 
 SRC_URI[md5sum] = "a855fda56edf05614f099dca316d1775"
 SRC_URI[sha256sum] = "5d62c0330f1481fe2c593249192fa68ff454c19c34343978cc9ce91aa324cbf6"
-- 
1.7.0.4




