Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36EA5C27C54
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.813.1686887482033781643
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Q8mM54ul;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010188c25441fa-65aa9a29-6ed7-4bb3-b3ce-a1ba1a6b18d8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XbSSLO17wCTm7sSlnPYBbbPLuqOQrmo7n3GTOP7UZ4E=;
	b=Q8mM54ul60I0alwdHb11U7KuBXMV4sKWkfEiXmcYd7UfhZ2KrvA8sN2QDvSVVj8t
	Z0LKp/LX+Ei4soo/f0u2XmZXnZX8eGswSV9djvnrV1D91WRbD/UdEI0oewU+AfrM6lf
	mUA8pvNlTTTLZDEzHIdc0MzrNVr4knBs7dXxPdrs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XbSSLO17wCTm7sSlnPYBbbPLuqOQrmo7n3GTOP7UZ4E=;
	b=Qcm+s2OmneuX81CJmkNYOS58cj2PcBIk42s/IEsEqpVPX2sP2tx3Pv9q40Pv2KdQ
	yWxJaV/+xGaXa4jp0ZCd1aBrfiBeVgOhnWVhr9t6dqvA8A/GfJ6tgMYj4ccsUXF1QkB
	S14hKkLHgK5cZA7coBB+u3RHslXYV4GAu85MX+7c=
Content-Type: multipart/mixed; boundary="===============6299568490534116760=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gdb: upgrading to 13.2 SUCCEEDED
Message-ID: <01010188c25441fa-65aa9a29-6ed7-4bb3-b3ce-a1ba1a6b18d8-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182899

--===============6299568490534116760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gdb* to *13.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gdb-upgrade-13.1-13.2.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 2d4511a81ee2a0d3b09fe43d5ae3fff6a46d209f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 09:12:18 +0000
Subject: [PATCH] gdb: upgrade 13.1 -> 13.2

---
 meta/recipes-devtools/gdb/gdb.inc             |   4 +-
 ...r-valid-inferior-thread-regcache-bef.patch | 286 ------------------
 ...low.cc-Fix-a-typo-in-ternary-operato.patch |  24 --
 .../gdb/{gdb_13.1.bb => gdb_13.2.bb}          |   0
 4 files changed, 1 insertion(+), 313 deletions(-)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0001-aarch64-Check-for-valid-inferior-thread-regcache-bef.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0009-gdbserver-linux-low.cc-Fix-a-typo-in-ternary-operato.patch
 rename meta/recipes-devtools/gdb/{gdb_13.1.bb => gdb_13.2.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 8589de62ff..e986b1a1f9 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -13,10 +13,8 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0006-resolve-restrict-keyword-conflict.patch \
            file://0007-Fix-invalid-sigprocmask-call.patch \
            file://0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
-           file://0009-gdbserver-linux-low.cc-Fix-a-typo-in-ternary-operato.patch \
            file://add-missing-ldflags.patch \
-           file://0001-aarch64-Check-for-valid-inferior-thread-regcache-bef.patch \
            "
-SRC_URI[sha256sum] = "115ad5c18d69a6be2ab15882d365dda2a2211c14f480b3502c6eba576e2e95a0"
+SRC_URI[sha256sum] = "fd5bebb7be1833abdb6e023c2f498a354498281df9d05523d8915babeb893f0a"
 
 TOOLCHAIN = "gcc"
diff --git a/meta/recipes-devtools/gdb/gdb/0001-aarch64-Check-for-valid-inferior-thread-regcache-bef.patch b/meta/recipes-devtools/gdb/gdb/0001-aarch64-Check-for-valid-inferior-thread-regcache-bef.patch
deleted file mode 100644
index 9adf4a4db5..0000000000
--- a/meta/recipes-devtools/gdb/gdb/0001-aarch64-Check-for-valid-inferior-thread-regcache-bef.patch
+++ /dev/null
@@ -1,286 +0,0 @@
-From b3eff3e15576229af9bae026c5c23ee694b90389 Mon Sep 17 00:00:00 2001
-From: Luis Machado <luis.machado@arm.com>
-Date: Fri, 24 Mar 2023 07:58:38 +0000
-Subject: [PATCH] aarch64: Check for valid inferior thread/regcache before
- reading pauth registers
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-There were reports of gdb throwing internal errors when calling
-inferior_thread ()/get_current_regcache () on a system with
-Pointer Authentication enabled.
-
-In such cases, gdb produces the following backtrace, or a variation
-of it (for gdb's with the non-address removal implemented only in
-the aarch64-linux-tdep.c file).
-
-../../../repos/binutils-gdb/gdb/thread.c:86: internal-error: inferior_thread: Assertion `current_thread_ != nullptr' failed.
-A problem internal to GDB has been detected,
-further debugging may prove unreliable.
------ Backtrace -----
-0xaaaae04a571f gdb_internal_backtrace_1
-        ../../../repos/binutils-gdb/gdb/bt-utils.c:122
-0xaaaae04a57f3 _Z22gdb_internal_backtracev
-        ../../../repos/binutils-gdb/gdb/bt-utils.c:168
-0xaaaae0b52ccf internal_vproblem
-        ../../../repos/binutils-gdb/gdb/utils.c:401
-0xaaaae0b5310b _Z15internal_verrorPKciS0_St9__va_list
-        ../../../repos/binutils-gdb/gdb/utils.c:481
-0xaaaae0e24b8f _Z18internal_error_locPKciS0_z
-        ../../../repos/binutils-gdb/gdbsupport/errors.cc:58
-0xaaaae0a88983 _Z15inferior_threadv
-        ../../../repos/binutils-gdb/gdb/thread.c:86
-0xaaaae0956c87 _Z20get_current_regcachev
-        ../../../repos/binutils-gdb/gdb/regcache.c:428
-0xaaaae035223f aarch64_remove_non_address_bits
-        ../../../repos/binutils-gdb/gdb/aarch64-tdep.c:3572
-0xaaaae03e8abb _Z31gdbarch_remove_non_address_bitsP7gdbarchm
-        ../../../repos/binutils-gdb/gdb/gdbarch.c:3109
-0xaaaae0a692d7 memory_xfer_partial
-        ../../../repos/binutils-gdb/gdb/target.c:1620
-0xaaaae0a695e3 _Z19target_xfer_partialP10target_ops13target_objectPKcPhPKhmmPm
-        ../../../repos/binutils-gdb/gdb/target.c:1684
-0xaaaae0a69e9f target_read_partial
-        ../../../repos/binutils-gdb/gdb/target.c:1937
-0xaaaae0a69fdf _Z11target_readP10target_ops13target_objectPKcPhml
-        ../../../repos/binutils-gdb/gdb/target.c:1977
-0xaaaae0a69937 _Z18target_read_memorymPhl
-        ../../../repos/binutils-gdb/gdb/target.c:1773
-0xaaaae08be523 ps_xfer_memory
-        ../../../repos/binutils-gdb/gdb/proc-service.c:90
-0xaaaae08be6db ps_pdread
-        ../../../repos/binutils-gdb/gdb/proc-service.c:124
-0x40001ed7c3b3 _td_fetch_value
-        /build/glibc-RIFKjK/glibc-2.31/nptl_db/fetch-value.c:115
-0x40001ed791ef td_ta_map_lwp2thr
-        /build/glibc-RIFKjK/glibc-2.31/nptl_db/td_ta_map_lwp2thr.c:194
-0xaaaae07f4473 thread_from_lwp
-        ../../../repos/binutils-gdb/gdb/linux-thread-db.c:413
-0xaaaae07f6d6f _ZN16thread_db_target4waitE6ptid_tP17target_waitstatus10enum_flagsI16target_wait_flagE
-        ../../../repos/binutils-gdb/gdb/linux-thread-db.c:1420
-0xaaaae0a6b33b _Z11target_wait6ptid_tP17target_waitstatus10enum_flagsI16target_wait_flagE
-        ../../../repos/binutils-gdb/gdb/target.c:2586
-0xaaaae0789cf7 do_target_wait_1
-        ../../../repos/binutils-gdb/gdb/infrun.c:3825
-0xaaaae0789e6f operator()
-        ../../../repos/binutils-gdb/gdb/infrun.c:3884
-0xaaaae078a167 do_target_wait
-        ../../../repos/binutils-gdb/gdb/infrun.c:3903
-0xaaaae078b0af _Z20fetch_inferior_eventv
-        ../../../repos/binutils-gdb/gdb/infrun.c:4314
-0xaaaae076652f _Z22inferior_event_handler19inferior_event_type
-        ../../../repos/binutils-gdb/gdb/inf-loop.c:41
-0xaaaae07dc68b handle_target_event
-        ../../../repos/binutils-gdb/gdb/linux-nat.c:4206
-0xaaaae0e25fbb handle_file_event
-        ../../../repos/binutils-gdb/gdbsupport/event-loop.cc:573
-0xaaaae0e264f3 gdb_wait_for_event
-        ../../../repos/binutils-gdb/gdbsupport/event-loop.cc:694
-0xaaaae0e24f9b _Z16gdb_do_one_eventi
-        ../../../repos/binutils-gdb/gdbsupport/event-loop.cc:217
-0xaaaae080f033 start_event_loop
-        ../../../repos/binutils-gdb/gdb/main.c:411
-0xaaaae080f1b7 captured_command_loop
-        ../../../repos/binutils-gdb/gdb/main.c:475
-0xaaaae0810b97 captured_main
-        ../../../repos/binutils-gdb/gdb/main.c:1318
-0xaaaae0810c1b _Z8gdb_mainP18captured_main_args
-        ../../../repos/binutils-gdb/gdb/main.c:1337
-0xaaaae0338453 main
-        ../../../repos/binutils-gdb/gdb/gdb.c:32
----------------------
-../../../repos/binutils-gdb/gdb/thread.c:86: internal-error: inferior_thread: Assertion `current_thread_ != nullptr' failed.
-A problem internal to GDB has been detected,
-further debugging may prove unreliable.
-Quit this debugging session? (y or n)
-
-We also see failures across the testsuite if the tests get executed on a target
-that has native support for the pointer authentication feature. But
-gdb.base/break.exp and gdb.base/access-mem-running.exp are two examples of
-tests that run into errors and internal errors.
-
-This issue started after commit d88cb738e6a7a7179dfaff8af78d69250c852af1, which
-enabled more broad use of pointer authentication masks to remove non-address
-bits of pointers, but wasn't immediately detected because systems with native
-support for pointer authentication are not that common yet.
-
-The above crash happens because gdb is in the middle of handling an event,
-and do_target_wait_1 calls switch_to_inferior_no_thread, nullifying the
-current thread.  This means a call to inferior_thread () will assert, and
-attempting to call get_current_regcache () will also call inferior_thread (),
-resulting in an assertion as well.
-
-target_has_registers was one function that seemed useful for detecting these
-types of situation where we don't have a register cache. The problem with that
-is the inconsistent state of inferior_ptid, which is used by
-target_has_registers.
-
-Despite the call to switch_to_no_thread in switch_to_inferior_no_thread from
-do_target_wait_1 in the backtrace above clearing inferior_ptid, the call to
-ps_xfer_memory sets inferior_ptid momentarily before reading memory:
-
-static ps_err_e
-ps_xfer_memory (const struct ps_prochandle *ph, psaddr_t addr,
-                gdb_byte *buf, size_t len, int write)
-{
-  scoped_restore_current_inferior restore_inferior;
-  set_current_inferior (ph->thread->inf);
-
-  scoped_restore_current_program_space restore_current_progspace;
-  set_current_program_space (ph->thread->inf->pspace);
-
-  scoped_restore save_inferior_ptid = make_scoped_restore (&inferior_ptid);
-  inferior_ptid = ph->thread->ptid;
-
-  CORE_ADDR core_addr = ps_addr_to_core_addr (addr);
-
-  int ret;
-  if (write)
-    ret = target_write_memory (core_addr, buf, len);
-  else
-    ret = target_read_memory (core_addr, buf, len);
-  return (ret == 0 ? PS_OK : PS_ERR);
-}
-
-Maybe this shouldn't happen, or maybe it is just an unfortunate state to be
-in. But this prevents the use of target_has_registers to guard against the
-lack of registers, since, although current_thread_ is still nullptr,
-inferior_ptid is valid and is not null_ptid.
-
-There is another crash scenario after we kill a previously active inferior, in
-which case the gdbarch will still say we support pointer authentication but we
-will also have no current thread (inferior_thread () will assert etc).
-
-If the target has support for pointer authentication, gdb needs to use
-a couple (or 4, for bare-metal) mask registers to mask off some bits of
-pointers, and for that it needs to access the registers.
-
-At some points, like the one from the backtrace above, there is no active
-thread/current regcache because gdb is in the middle of doing event handling
-and switching between threads.
-
-Simon suggested the use of inferior_ptid to fetch the register cache, as
-opposed to relying on the current register cache.  Though we need to make sure
-inferior_ptid is valid (not null_ptid), I think this works nicely.
-
-With inferior_ptid, we can do safety checks along the way, making sure we have
-a thread to fetch a register cache from and checking if the thread is actually
-stopped or running.
-
-The following patch implements this idea with safety checks to make sure we
-don't run into assertions or errors.  If any of the checks fail, we fallback to
-using a default mask to remove non-address bits of a pointer.
-
-I discussed with Pedro the possibility of caching the mask register values
-(which are per-process and can change mid-execution), but there isn't a good
-spot to cache those values. Besides, the mask registers can change constantly
-for bare-metal debugging when switching between exception levels.
-
-In some cases, it is just not possible to get access to these mask registers,
-like the case where threads are running. In those cases, using a default mask
-to remove the non-address bits should be enough.
-
-This can happen when we let threads run in the background and then we attempt
-to access a memory address (now that gdb is capable of reading memory even
-with threads running).  Thus gdb will attempt to remove non-address bits
-of that memory access, will attempt to access registers, running into errors.
-
-Regression-tested on aarch64-linux Ubuntu 20.04.
----
- gdb/aarch64-linux-tdep.c | 64 ++++++++++++++++++++++++++++++----------
- 1 file changed, 49 insertions(+), 15 deletions(-)
-
-diff --git a/gdb/aarch64-linux-tdep.c b/gdb/aarch64-linux-tdep.c
-index 20a041c599e..4b2915b8e99 100644
---- a/gdb/aarch64-linux-tdep.c
-+++ b/gdb/aarch64-linux-tdep.c
-@@ -57,6 +57,9 @@
- #include "elf/common.h"
- #include "elf/aarch64.h"
- 
-+/* For inferior_ptid and current_inferior ().  */
-+#include "inferior.h"
-+
- /* Signal frame handling.
- 
-       +------------+  ^
-@@ -1986,29 +1989,60 @@ aarch64_linux_decode_memtag_section (struct gdbarch *gdbarch,
- static CORE_ADDR
- aarch64_remove_non_address_bits (struct gdbarch *gdbarch, CORE_ADDR pointer)
- {
--  aarch64_gdbarch_tdep *tdep = gdbarch_tdep<aarch64_gdbarch_tdep> (gdbarch);
--
-   /* By default, we assume TBI and discard the top 8 bits plus the VA range
--     select bit (55).  */
-+     select bit (55).  Below we try to fetch information about pointer
-+     authentication masks in order to make non-address removal more
-+     precise.  */
-   CORE_ADDR mask = AARCH64_TOP_BITS_MASK;
- 
--  if (tdep->has_pauth ())
-+  /* Check if we have an inferior first.  If not, just use the default
-+     mask.
-+
-+     We use the inferior_ptid here because the pointer authentication masks
-+     should be the same across threads of a process.  Since we may not have
-+     access to the current thread (gdb may have switched to no inferiors
-+     momentarily), we use the inferior ptid.  */
-+  if (inferior_ptid != null_ptid)
-     {
--      /* Fetch the PAC masks.  These masks are per-process, so we can just
--	 fetch data from whatever thread we have at the moment.
-+      /* If we do have an inferior, attempt to fetch its thread's thread_info
-+	 struct.  */
-+      thread_info *thread
-+	= find_thread_ptid (current_inferior ()->process_target (),
-+			    inferior_ptid);
- 
--	 Also, we have both a code mask and a data mask.  For now they are the
--	 same, but this may change in the future.  */
--      struct regcache *regs = get_current_regcache ();
--      CORE_ADDR cmask, dmask;
-+      /* If the thread is running, we will not be able to fetch the mask
-+	 registers.  */
-+      if (thread != nullptr && thread->state != THREAD_RUNNING)
-+	{
-+	  /* Otherwise, fetch the register cache and the masks.  */
-+	  struct regcache *regs
-+	    = get_thread_regcache (current_inferior ()->process_target (),
-+				   inferior_ptid);
-+
-+	  /* Use the gdbarch from the register cache to check for pointer
-+	     authentication support, as it matches the features found in
-+	     that particular thread.  */
-+	  aarch64_gdbarch_tdep *tdep
-+	    = gdbarch_tdep<aarch64_gdbarch_tdep> (regs->arch ());
-+
-+	  /* Is there pointer authentication support?  */
-+	  if (tdep->has_pauth ())
-+	    {
-+	      /* We have both a code mask and a data mask.  For now they are
-+		 the same, but this may change in the future.  */
-+	      CORE_ADDR cmask, dmask;
- 
--      if (regs->cooked_read (tdep->pauth_reg_base, &dmask) != REG_VALID)
--	dmask = mask;
-+	      if (regs->cooked_read (tdep->pauth_reg_base, &dmask)
-+		  != REG_VALID)
-+		dmask = mask;
- 
--      if (regs->cooked_read (tdep->pauth_reg_base + 1, &cmask) != REG_VALID)
--	cmask = mask;
-+	      if (regs->cooked_read (tdep->pauth_reg_base + 1, &cmask)
-+		  != REG_VALID)
-+		cmask = mask;
- 
--      mask |= aarch64_mask_from_pac_registers (cmask, dmask);
-+	      mask |= aarch64_mask_from_pac_registers (cmask, dmask);
-+	    }
-+	}
-     }
- 
-   return aarch64_remove_top_bits (pointer, mask);
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/gdb/gdb/0009-gdbserver-linux-low.cc-Fix-a-typo-in-ternary-operato.patch b/meta/recipes-devtools/gdb/gdb/0009-gdbserver-linux-low.cc-Fix-a-typo-in-ternary-operato.patch
deleted file mode 100644
index 32eba089bc..0000000000
--- a/meta/recipes-devtools/gdb/gdb/0009-gdbserver-linux-low.cc-Fix-a-typo-in-ternary-operato.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 9a85132c4ba7d37a5df146239b3ab1a5854ce478 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 22 Feb 2023 16:24:07 -0800
-Subject: [PATCH] gdbserver/linux-low.cc: Fix a typo in ternary operator
-
-Upstream-Status: Submitted [https://sourceware.org/pipermail/gdb-patches/2023-February/197298.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gdbserver/linux-low.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gdbserver/linux-low.cc b/gdbserver/linux-low.cc
-index 7e1de397893..95ec871d436 100644
---- a/gdbserver/linux-low.cc
-+++ b/gdbserver/linux-low.cc
-@@ -5390,7 +5390,7 @@ proc_xfer_memory (CORE_ADDR memaddr, unsigned char *readbuf,
-       if (lseek (fd, memaddr, SEEK_SET) != -1)
- 	bytes = (readbuf != nullptr
- 		 ? read (fd, readbuf, len)
--		 ? write (fd, writebuf, len));
-+		 : write (fd, writebuf, len));
- #endif
- 
-       if (bytes < 0)
diff --git a/meta/recipes-devtools/gdb/gdb_13.1.bb b/meta/recipes-devtools/gdb/gdb_13.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_13.1.bb
rename to meta/recipes-devtools/gdb/gdb_13.2.bb
-- 
2.39.2


--===============6299568490534116760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gdb/gdb-dbg: PV changed from "13.1" to "13.2"
packages/core2-32-poky-linux/gdb/gdb-dbg: PKGV changed from 13.1 [default] to 13.2 [default]
packages/core2-32-poky-linux/gdb/gdb-dbg: PKGSIZE changed from 136533392 to 136538092 (+0%)
packages/core2-32-poky-linux/gdb/gdb-dev: PV changed from "13.1" to "13.2"
packages/core2-32-poky-linux/gdb/gdb-dev: PKGV changed from 13.1 [default] to 13.2 [default]
packages/core2-32-poky-linux/gdb/gdb-doc: PV changed from "13.1" to "13.2"
packages/core2-32-poky-linux/gdb/gdb-doc: PKGV changed from 13.1 [default] to 13.2 [default]
packages/core2-32-poky-linux/gdb/gdb-locale: PV changed from "13.1" to "13.2"
packages/core2-32-poky-linux/gdb/gdb-locale: PKGV changed from 13.1 [default] to 13.2 [default]
packages/core2-32-poky-linux/gdb/gdb-src: PV changed from "13.1" to "13.2"
packages/core2-32-poky-linux/gdb/gdb-src: PKGV changed from 13.1 [default] to 13.2 [default]
packages/core2-32-poky-linux/gdb/gdb-src: PKGSIZE changed from 26201837 to 26202373 (+0%)
packages/core2-32-poky-linux/gdb/gdb-staticdev: PV changed from "13.1" to "13.2"
packages/core2-32-poky-linux/gdb/gdb-staticdev: PKGV changed from 13.1 [default] to 13.2 [default]
packages/core2-32-poky-linux/gdb/gdb: PV changed from "13.1" to "13.2"
packages/core2-32-poky-linux/gdb/gdb: PKGV changed from 13.1 [default] to 13.2 [default]
packages/core2-32-poky-linux/gdb/gdbserver: PV changed from "13.1" to "13.2"
packages/core2-32-poky-linux/gdb/gdbserver: PKGV changed from 13.1 [default] to 13.2 [default]
packages/core2-32-poky-linux/gdb: PV changed from "13.1" to "13.2"
packages/core2-32-poky-linux/gdb: SRC_URI changed from "https://ftp.gnu.org/gnu/gdb/gdb-13.1.tar.xz file://0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch file://0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch file://0003-Dont-disable-libreadline.a-when-using-disable-static.patch file://0004-use-asm-sgidefs.h.patch file://0005-Change-order-of-CFLAGS.patch file://0006-resolve-restrict-keyword-conflict.patch file://0007-Fix-invalid-sigprocmask-call.patch file://0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch file://0009-gdbserver-linux-low.cc-Fix-a-typo-in-ternary-operato.patch file://add-missing-ldflags.patch file://0001-aarch64-Check-for-valid-inferior-thread-regcache-bef.patch" to "https://ftp.gnu.org/gnu/gdb/gdb-13.2.tar.xz file://0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch file://0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch file://0003-Dont-disable-libreadline.a-when-using-disable-static.patch file://0004-use-a
 sm-sgidefs.h.patch file://0005-Change-order-of-CFLAGS.patch file://0006-resolve-restrict-keyword-conflict.patch file://0007-Fix-invalid-sigprocmask-call.patch file://0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch file://add-missing-ldflags.patch"
packages/core2-32-poky-linux/gdb: PKGV changed from 13.1 [default] to 13.2 [default]

--===============6299568490534116760==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-gdb-upgrade-13.1-13.2.patch"

RnJvbSAyZDQ1MTFhODFlZTJhMGQzYjA5ZmU0M2Q1YWUzZmZmNmE0NmQyMDlmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMDk6MTI6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
ZGI6IHVwZ3JhZGUgMTMuMSAtPiAxMy4yCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIv
Z2RiLmluYyAgICAgICAgICAgICB8ICAgNCArLQogLi4uci12YWxpZC1pbmZlcmlvci10aHJlYWQt
cmVnY2FjaGUtYmVmLnBhdGNoIHwgMjg2IC0tLS0tLS0tLS0tLS0tLS0tLQogLi4ubG93LmNjLUZp
eC1hLXR5cG8taW4tdGVybmFyeS1vcGVyYXRvLnBhdGNoIHwgIDI0IC0tCiAuLi4vZ2RiL3tnZGJf
MTMuMS5iYiA9PiBnZGJfMTMuMi5iYn0gICAgICAgICAgfCAgIDAKIDQgZmlsZXMgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDMxMyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZ2RiL2dkYi8wMDAxLWFhcmNoNjQtQ2hlY2stZm9yLXZhbGlkLWlu
ZmVyaW9yLXRocmVhZC1yZWdjYWNoZS1iZWYucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZ2RiL2dkYi8wMDA5LWdkYnNlcnZlci1saW51eC1sb3cuY2MtRml4
LWEtdHlwby1pbi10ZXJuYXJ5LW9wZXJhdG8ucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ2RiL3tnZGJfMTMuMS5iYiA9PiBnZGJfMTMuMi5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dkYi9nZGIuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2dkYi9nZGIuaW5jCmluZGV4IDg1ODlkZTYyZmYuLmU5ODZiMWExZjkgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIvZ2RiLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ2RiL2dkYi5pbmMKQEAgLTEzLDEwICsxMyw4IEBAIFNSQ19VUkkgPSAiJHtHTlVfTUlS
Uk9SfS9nZGIvZ2RiLSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDA2LXJlc29s
dmUtcmVzdHJpY3Qta2V5d29yZC1jb25mbGljdC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8w
MDA3LUZpeC1pbnZhbGlkLXNpZ3Byb2NtYXNrLWNhbGwucGF0Y2ggXAogICAgICAgICAgICBmaWxl
Oi8vMDAwOC1EZWZpbmUtYWxpZ25vZi11c2luZy1fQWxpZ25vZi13aGVuLXVzaW5nLUMxMS1vci1u
ZXdlLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDktZ2Ric2VydmVyLWxpbnV4LWxvdy5j
Yy1GaXgtYS10eXBvLWluLXRlcm5hcnktb3BlcmF0by5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6
Ly9hZGQtbWlzc2luZy1sZGZsYWdzLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtYWFy
Y2g2NC1DaGVjay1mb3ItdmFsaWQtaW5mZXJpb3ItdGhyZWFkLXJlZ2NhY2hlLWJlZi5wYXRjaCBc
CiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxMTVhZDVjMThkNjlhNmJlMmFi
MTU4ODJkMzY1ZGRhMmEyMjExYzE0ZjQ4MGIzNTAyYzZlYmE1NzZlMmU5NWEwIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gImZkNWJlYmI3YmUxODMzYWJkYjZlMDIzYzJmNDk4YTM1NDQ5ODI4MWRmOWQw
NTUyM2Q4OTE1YmFiZWI4OTNmMGEiCiAKIFRPT0xDSEFJTiA9ICJnY2MiCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2RiL2dkYi8wMDAxLWFhcmNoNjQtQ2hlY2stZm9yLXZhbGlk
LWluZmVyaW9yLXRocmVhZC1yZWdjYWNoZS1iZWYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZ2RiL2dkYi8wMDAxLWFhcmNoNjQtQ2hlY2stZm9yLXZhbGlkLWluZmVyaW9yLXRocmVhZC1y
ZWdjYWNoZS1iZWYucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDlhZGY0YTRk
YjUuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dkYi9nZGIvMDAwMS1h
YXJjaDY0LUNoZWNrLWZvci12YWxpZC1pbmZlcmlvci10aHJlYWQtcmVnY2FjaGUtYmVmLnBhdGNo
CisrKyAvZGV2L251bGwKQEAgLTEsMjg2ICswLDAgQEAKLUZyb20gYjNlZmYzZTE1NTc2MjI5YWY5
YmFlMDI2YzVjMjNlZTY5NGI5MDM4OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEx1
aXMgTWFjaGFkbyA8bHVpcy5tYWNoYWRvQGFybS5jb20+Ci1EYXRlOiBGcmksIDI0IE1hciAyMDIz
IDA3OjU4OjM4ICswMDAwCi1TdWJqZWN0OiBbUEFUQ0hdIGFhcmNoNjQ6IENoZWNrIGZvciB2YWxp
ZCBpbmZlcmlvciB0aHJlYWQvcmVnY2FjaGUgYmVmb3JlCi0gcmVhZGluZyBwYXV0aCByZWdpc3Rl
cnMKLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydAotU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0
b24gPHJvc3MuYnVydG9uQGFybS5jb20+Ci0KLVRoZXJlIHdlcmUgcmVwb3J0cyBvZiBnZGIgdGhy
b3dpbmcgaW50ZXJuYWwgZXJyb3JzIHdoZW4gY2FsbGluZwotaW5mZXJpb3JfdGhyZWFkICgpL2dl
dF9jdXJyZW50X3JlZ2NhY2hlICgpIG9uIGEgc3lzdGVtIHdpdGgKLVBvaW50ZXIgQXV0aGVudGlj
YXRpb24gZW5hYmxlZC4KLQotSW4gc3VjaCBjYXNlcywgZ2RiIHByb2R1Y2VzIHRoZSBmb2xsb3dp
bmcgYmFja3RyYWNlLCBvciBhIHZhcmlhdGlvbgotb2YgaXQgKGZvciBnZGIncyB3aXRoIHRoZSBu
b24tYWRkcmVzcyByZW1vdmFsIGltcGxlbWVudGVkIG9ubHkgaW4KLXRoZSBhYXJjaDY0LWxpbnV4
LXRkZXAuYyBmaWxlKS4KLQotLi4vLi4vLi4vcmVwb3MvYmludXRpbHMtZ2RiL2dkYi90aHJlYWQu
Yzo4NjogaW50ZXJuYWwtZXJyb3I6IGluZmVyaW9yX3RocmVhZDogQXNzZXJ0aW9uIGBjdXJyZW50
X3RocmVhZF8gIT0gbnVsbHB0cicgZmFpbGVkLgotQSBwcm9ibGVtIGludGVybmFsIHRvIEdEQiBo
YXMgYmVlbiBkZXRlY3RlZCwKLWZ1cnRoZXIgZGVidWdnaW5nIG1heSBwcm92ZSB1bnJlbGlhYmxl
LgotLS0tLS0gQmFja3RyYWNlIC0tLS0tCi0weGFhYWFlMDRhNTcxZiBnZGJfaW50ZXJuYWxfYmFj
a3RyYWNlXzEKLSAgICAgICAgLi4vLi4vLi4vcmVwb3MvYmludXRpbHMtZ2RiL2dkYi9idC11dGls
cy5jOjEyMgotMHhhYWFhZTA0YTU3ZjMgX1oyMmdkYl9pbnRlcm5hbF9iYWNrdHJhY2V2Ci0gICAg
ICAgIC4uLy4uLy4uL3JlcG9zL2JpbnV0aWxzLWdkYi9nZGIvYnQtdXRpbHMuYzoxNjgKLTB4YWFh
YWUwYjUyY2NmIGludGVybmFsX3Zwcm9ibGVtCi0gICAgICAgIC4uLy4uLy4uL3JlcG9zL2JpbnV0
aWxzLWdkYi9nZGIvdXRpbHMuYzo0MDEKLTB4YWFhYWUwYjUzMTBiIF9aMTVpbnRlcm5hbF92ZXJy
b3JQS2NpUzBfU3Q5X192YV9saXN0Ci0gICAgICAgIC4uLy4uLy4uL3JlcG9zL2JpbnV0aWxzLWdk
Yi9nZGIvdXRpbHMuYzo0ODEKLTB4YWFhYWUwZTI0YjhmIF9aMThpbnRlcm5hbF9lcnJvcl9sb2NQ
S2NpUzBfegotICAgICAgICAuLi8uLi8uLi9yZXBvcy9iaW51dGlscy1nZGIvZ2Ric3VwcG9ydC9l
cnJvcnMuY2M6NTgKLTB4YWFhYWUwYTg4OTgzIF9aMTVpbmZlcmlvcl90aHJlYWR2Ci0gICAgICAg
IC4uLy4uLy4uL3JlcG9zL2JpbnV0aWxzLWdkYi9nZGIvdGhyZWFkLmM6ODYKLTB4YWFhYWUwOTU2
Yzg3IF9aMjBnZXRfY3VycmVudF9yZWdjYWNoZXYKLSAgICAgICAgLi4vLi4vLi4vcmVwb3MvYmlu
dXRpbHMtZ2RiL2dkYi9yZWdjYWNoZS5jOjQyOAotMHhhYWFhZTAzNTIyM2YgYWFyY2g2NF9yZW1v
dmVfbm9uX2FkZHJlc3NfYml0cwotICAgICAgICAuLi8uLi8uLi9yZXBvcy9iaW51dGlscy1nZGIv
Z2RiL2FhcmNoNjQtdGRlcC5jOjM1NzIKLTB4YWFhYWUwM2U4YWJiIF9aMzFnZGJhcmNoX3JlbW92
ZV9ub25fYWRkcmVzc19iaXRzUDdnZGJhcmNobQotICAgICAgICAuLi8uLi8uLi9yZXBvcy9iaW51
dGlscy1nZGIvZ2RiL2dkYmFyY2guYzozMTA5Ci0weGFhYWFlMGE2OTJkNyBtZW1vcnlfeGZlcl9w
YXJ0aWFsCi0gICAgICAgIC4uLy4uLy4uL3JlcG9zL2JpbnV0aWxzLWdkYi9nZGIvdGFyZ2V0LmM6
MTYyMAotMHhhYWFhZTBhNjk1ZTMgX1oxOXRhcmdldF94ZmVyX3BhcnRpYWxQMTB0YXJnZXRfb3Bz
MTN0YXJnZXRfb2JqZWN0UEtjUGhQS2htbVBtCi0gICAgICAgIC4uLy4uLy4uL3JlcG9zL2JpbnV0
aWxzLWdkYi9nZGIvdGFyZ2V0LmM6MTY4NAotMHhhYWFhZTBhNjllOWYgdGFyZ2V0X3JlYWRfcGFy
dGlhbAotICAgICAgICAuLi8uLi8uLi9yZXBvcy9iaW51dGlscy1nZGIvZ2RiL3RhcmdldC5jOjE5
MzcKLTB4YWFhYWUwYTY5ZmRmIF9aMTF0YXJnZXRfcmVhZFAxMHRhcmdldF9vcHMxM3RhcmdldF9v
YmplY3RQS2NQaG1sCi0gICAgICAgIC4uLy4uLy4uL3JlcG9zL2JpbnV0aWxzLWdkYi9nZGIvdGFy
Z2V0LmM6MTk3NwotMHhhYWFhZTBhNjk5MzcgX1oxOHRhcmdldF9yZWFkX21lbW9yeW1QaGwKLSAg
ICAgICAgLi4vLi4vLi4vcmVwb3MvYmludXRpbHMtZ2RiL2dkYi90YXJnZXQuYzoxNzczCi0weGFh
YWFlMDhiZTUyMyBwc194ZmVyX21lbW9yeQotICAgICAgICAuLi8uLi8uLi9yZXBvcy9iaW51dGls
cy1nZGIvZ2RiL3Byb2Mtc2VydmljZS5jOjkwCi0weGFhYWFlMDhiZTZkYiBwc19wZHJlYWQKLSAg
ICAgICAgLi4vLi4vLi4vcmVwb3MvYmludXRpbHMtZ2RiL2dkYi9wcm9jLXNlcnZpY2UuYzoxMjQK
LTB4NDAwMDFlZDdjM2IzIF90ZF9mZXRjaF92YWx1ZQotICAgICAgICAvYnVpbGQvZ2xpYmMtUklG
S2pLL2dsaWJjLTIuMzEvbnB0bF9kYi9mZXRjaC12YWx1ZS5jOjExNQotMHg0MDAwMWVkNzkxZWYg
dGRfdGFfbWFwX2x3cDJ0aHIKLSAgICAgICAgL2J1aWxkL2dsaWJjLVJJRktqSy9nbGliYy0yLjMx
L25wdGxfZGIvdGRfdGFfbWFwX2x3cDJ0aHIuYzoxOTQKLTB4YWFhYWUwN2Y0NDczIHRocmVhZF9m
cm9tX2x3cAotICAgICAgICAuLi8uLi8uLi9yZXBvcy9iaW51dGlscy1nZGIvZ2RiL2xpbnV4LXRo
cmVhZC1kYi5jOjQxMwotMHhhYWFhZTA3ZjZkNmYgX1pOMTZ0aHJlYWRfZGJfdGFyZ2V0NHdhaXRF
NnB0aWRfdFAxN3RhcmdldF93YWl0c3RhdHVzMTBlbnVtX2ZsYWdzSTE2dGFyZ2V0X3dhaXRfZmxh
Z0UKLSAgICAgICAgLi4vLi4vLi4vcmVwb3MvYmludXRpbHMtZ2RiL2dkYi9saW51eC10aHJlYWQt
ZGIuYzoxNDIwCi0weGFhYWFlMGE2YjMzYiBfWjExdGFyZ2V0X3dhaXQ2cHRpZF90UDE3dGFyZ2V0
X3dhaXRzdGF0dXMxMGVudW1fZmxhZ3NJMTZ0YXJnZXRfd2FpdF9mbGFnRQotICAgICAgICAuLi8u
Li8uLi9yZXBvcy9iaW51dGlscy1nZGIvZ2RiL3RhcmdldC5jOjI1ODYKLTB4YWFhYWUwNzg5Y2Y3
IGRvX3RhcmdldF93YWl0XzEKLSAgICAgICAgLi4vLi4vLi4vcmVwb3MvYmludXRpbHMtZ2RiL2dk
Yi9pbmZydW4uYzozODI1Ci0weGFhYWFlMDc4OWU2ZiBvcGVyYXRvcigpCi0gICAgICAgIC4uLy4u
Ly4uL3JlcG9zL2JpbnV0aWxzLWdkYi9nZGIvaW5mcnVuLmM6Mzg4NAotMHhhYWFhZTA3OGExNjcg
ZG9fdGFyZ2V0X3dhaXQKLSAgICAgICAgLi4vLi4vLi4vcmVwb3MvYmludXRpbHMtZ2RiL2dkYi9p
bmZydW4uYzozOTAzCi0weGFhYWFlMDc4YjBhZiBfWjIwZmV0Y2hfaW5mZXJpb3JfZXZlbnR2Ci0g
ICAgICAgIC4uLy4uLy4uL3JlcG9zL2JpbnV0aWxzLWdkYi9nZGIvaW5mcnVuLmM6NDMxNAotMHhh
YWFhZTA3NjY1MmYgX1oyMmluZmVyaW9yX2V2ZW50X2hhbmRsZXIxOWluZmVyaW9yX2V2ZW50X3R5
cGUKLSAgICAgICAgLi4vLi4vLi4vcmVwb3MvYmludXRpbHMtZ2RiL2dkYi9pbmYtbG9vcC5jOjQx
Ci0weGFhYWFlMDdkYzY4YiBoYW5kbGVfdGFyZ2V0X2V2ZW50Ci0gICAgICAgIC4uLy4uLy4uL3Jl
cG9zL2JpbnV0aWxzLWdkYi9nZGIvbGludXgtbmF0LmM6NDIwNgotMHhhYWFhZTBlMjVmYmIgaGFu
ZGxlX2ZpbGVfZXZlbnQKLSAgICAgICAgLi4vLi4vLi4vcmVwb3MvYmludXRpbHMtZ2RiL2dkYnN1
cHBvcnQvZXZlbnQtbG9vcC5jYzo1NzMKLTB4YWFhYWUwZTI2NGYzIGdkYl93YWl0X2Zvcl9ldmVu
dAotICAgICAgICAuLi8uLi8uLi9yZXBvcy9iaW51dGlscy1nZGIvZ2Ric3VwcG9ydC9ldmVudC1s
b29wLmNjOjY5NAotMHhhYWFhZTBlMjRmOWIgX1oxNmdkYl9kb19vbmVfZXZlbnRpCi0gICAgICAg
IC4uLy4uLy4uL3JlcG9zL2JpbnV0aWxzLWdkYi9nZGJzdXBwb3J0L2V2ZW50LWxvb3AuY2M6MjE3
Ci0weGFhYWFlMDgwZjAzMyBzdGFydF9ldmVudF9sb29wCi0gICAgICAgIC4uLy4uLy4uL3JlcG9z
L2JpbnV0aWxzLWdkYi9nZGIvbWFpbi5jOjQxMQotMHhhYWFhZTA4MGYxYjcgY2FwdHVyZWRfY29t
bWFuZF9sb29wCi0gICAgICAgIC4uLy4uLy4uL3JlcG9zL2JpbnV0aWxzLWdkYi9nZGIvbWFpbi5j
OjQ3NQotMHhhYWFhZTA4MTBiOTcgY2FwdHVyZWRfbWFpbgotICAgICAgICAuLi8uLi8uLi9yZXBv
cy9iaW51dGlscy1nZGIvZ2RiL21haW4uYzoxMzE4Ci0weGFhYWFlMDgxMGMxYiBfWjhnZGJfbWFp
blAxOGNhcHR1cmVkX21haW5fYXJncwotICAgICAgICAuLi8uLi8uLi9yZXBvcy9iaW51dGlscy1n
ZGIvZ2RiL21haW4uYzoxMzM3Ci0weGFhYWFlMDMzODQ1MyBtYWluCi0gICAgICAgIC4uLy4uLy4u
L3JlcG9zL2JpbnV0aWxzLWdkYi9nZGIvZ2RiLmM6MzIKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQot
Li4vLi4vLi4vcmVwb3MvYmludXRpbHMtZ2RiL2dkYi90aHJlYWQuYzo4NjogaW50ZXJuYWwtZXJy
b3I6IGluZmVyaW9yX3RocmVhZDogQXNzZXJ0aW9uIGBjdXJyZW50X3RocmVhZF8gIT0gbnVsbHB0
cicgZmFpbGVkLgotQSBwcm9ibGVtIGludGVybmFsIHRvIEdEQiBoYXMgYmVlbiBkZXRlY3RlZCwK
LWZ1cnRoZXIgZGVidWdnaW5nIG1heSBwcm92ZSB1bnJlbGlhYmxlLgotUXVpdCB0aGlzIGRlYnVn
Z2luZyBzZXNzaW9uPyAoeSBvciBuKQotCi1XZSBhbHNvIHNlZSBmYWlsdXJlcyBhY3Jvc3MgdGhl
IHRlc3RzdWl0ZSBpZiB0aGUgdGVzdHMgZ2V0IGV4ZWN1dGVkIG9uIGEgdGFyZ2V0Ci10aGF0IGhh
cyBuYXRpdmUgc3VwcG9ydCBmb3IgdGhlIHBvaW50ZXIgYXV0aGVudGljYXRpb24gZmVhdHVyZS4g
QnV0Ci1nZGIuYmFzZS9icmVhay5leHAgYW5kIGdkYi5iYXNlL2FjY2Vzcy1tZW0tcnVubmluZy5l
eHAgYXJlIHR3byBleGFtcGxlcyBvZgotdGVzdHMgdGhhdCBydW4gaW50byBlcnJvcnMgYW5kIGlu
dGVybmFsIGVycm9ycy4KLQotVGhpcyBpc3N1ZSBzdGFydGVkIGFmdGVyIGNvbW1pdCBkODhjYjcz
OGU2YTdhNzE3OWRmYWZmOGFmNzhkNjkyNTBjODUyYWYxLCB3aGljaAotZW5hYmxlZCBtb3JlIGJy
b2FkIHVzZSBvZiBwb2ludGVyIGF1dGhlbnRpY2F0aW9uIG1hc2tzIHRvIHJlbW92ZSBub24tYWRk
cmVzcwotYml0cyBvZiBwb2ludGVycywgYnV0IHdhc24ndCBpbW1lZGlhdGVseSBkZXRlY3RlZCBi
ZWNhdXNlIHN5c3RlbXMgd2l0aCBuYXRpdmUKLXN1cHBvcnQgZm9yIHBvaW50ZXIgYXV0aGVudGlj
YXRpb24gYXJlIG5vdCB0aGF0IGNvbW1vbiB5ZXQuCi0KLVRoZSBhYm92ZSBjcmFzaCBoYXBwZW5z
IGJlY2F1c2UgZ2RiIGlzIGluIHRoZSBtaWRkbGUgb2YgaGFuZGxpbmcgYW4gZXZlbnQsCi1hbmQg
ZG9fdGFyZ2V0X3dhaXRfMSBjYWxscyBzd2l0Y2hfdG9faW5mZXJpb3Jfbm9fdGhyZWFkLCBudWxs
aWZ5aW5nIHRoZQotY3VycmVudCB0aHJlYWQuICBUaGlzIG1lYW5zIGEgY2FsbCB0byBpbmZlcmlv
cl90aHJlYWQgKCkgd2lsbCBhc3NlcnQsIGFuZAotYXR0ZW1wdGluZyB0byBjYWxsIGdldF9jdXJy
ZW50X3JlZ2NhY2hlICgpIHdpbGwgYWxzbyBjYWxsIGluZmVyaW9yX3RocmVhZCAoKSwKLXJlc3Vs
dGluZyBpbiBhbiBhc3NlcnRpb24gYXMgd2VsbC4KLQotdGFyZ2V0X2hhc19yZWdpc3RlcnMgd2Fz
IG9uZSBmdW5jdGlvbiB0aGF0IHNlZW1lZCB1c2VmdWwgZm9yIGRldGVjdGluZyB0aGVzZQotdHlw
ZXMgb2Ygc2l0dWF0aW9uIHdoZXJlIHdlIGRvbid0IGhhdmUgYSByZWdpc3RlciBjYWNoZS4gVGhl
IHByb2JsZW0gd2l0aCB0aGF0Ci1pcyB0aGUgaW5jb25zaXN0ZW50IHN0YXRlIG9mIGluZmVyaW9y
X3B0aWQsIHdoaWNoIGlzIHVzZWQgYnkKLXRhcmdldF9oYXNfcmVnaXN0ZXJzLgotCi1EZXNwaXRl
IHRoZSBjYWxsIHRvIHN3aXRjaF90b19ub190aHJlYWQgaW4gc3dpdGNoX3RvX2luZmVyaW9yX25v
X3RocmVhZCBmcm9tCi1kb190YXJnZXRfd2FpdF8xIGluIHRoZSBiYWNrdHJhY2UgYWJvdmUgY2xl
YXJpbmcgaW5mZXJpb3JfcHRpZCwgdGhlIGNhbGwgdG8KLXBzX3hmZXJfbWVtb3J5IHNldHMgaW5m
ZXJpb3JfcHRpZCBtb21lbnRhcmlseSBiZWZvcmUgcmVhZGluZyBtZW1vcnk6Ci0KLXN0YXRpYyBw
c19lcnJfZQotcHNfeGZlcl9tZW1vcnkgKGNvbnN0IHN0cnVjdCBwc19wcm9jaGFuZGxlICpwaCwg
cHNhZGRyX3QgYWRkciwKLSAgICAgICAgICAgICAgICBnZGJfYnl0ZSAqYnVmLCBzaXplX3QgbGVu
LCBpbnQgd3JpdGUpCi17Ci0gIHNjb3BlZF9yZXN0b3JlX2N1cnJlbnRfaW5mZXJpb3IgcmVzdG9y
ZV9pbmZlcmlvcjsKLSAgc2V0X2N1cnJlbnRfaW5mZXJpb3IgKHBoLT50aHJlYWQtPmluZik7Ci0K
LSAgc2NvcGVkX3Jlc3RvcmVfY3VycmVudF9wcm9ncmFtX3NwYWNlIHJlc3RvcmVfY3VycmVudF9w
cm9nc3BhY2U7Ci0gIHNldF9jdXJyZW50X3Byb2dyYW1fc3BhY2UgKHBoLT50aHJlYWQtPmluZi0+
cHNwYWNlKTsKLQotICBzY29wZWRfcmVzdG9yZSBzYXZlX2luZmVyaW9yX3B0aWQgPSBtYWtlX3Nj
b3BlZF9yZXN0b3JlICgmaW5mZXJpb3JfcHRpZCk7Ci0gIGluZmVyaW9yX3B0aWQgPSBwaC0+dGhy
ZWFkLT5wdGlkOwotCi0gIENPUkVfQUREUiBjb3JlX2FkZHIgPSBwc19hZGRyX3RvX2NvcmVfYWRk
ciAoYWRkcik7Ci0KLSAgaW50IHJldDsKLSAgaWYgKHdyaXRlKQotICAgIHJldCA9IHRhcmdldF93
cml0ZV9tZW1vcnkgKGNvcmVfYWRkciwgYnVmLCBsZW4pOwotICBlbHNlCi0gICAgcmV0ID0gdGFy
Z2V0X3JlYWRfbWVtb3J5IChjb3JlX2FkZHIsIGJ1ZiwgbGVuKTsKLSAgcmV0dXJuIChyZXQgPT0g
MCA/IFBTX09LIDogUFNfRVJSKTsKLX0KLQotTWF5YmUgdGhpcyBzaG91bGRuJ3QgaGFwcGVuLCBv
ciBtYXliZSBpdCBpcyBqdXN0IGFuIHVuZm9ydHVuYXRlIHN0YXRlIHRvIGJlCi1pbi4gQnV0IHRo
aXMgcHJldmVudHMgdGhlIHVzZSBvZiB0YXJnZXRfaGFzX3JlZ2lzdGVycyB0byBndWFyZCBhZ2Fp
bnN0IHRoZQotbGFjayBvZiByZWdpc3RlcnMsIHNpbmNlLCBhbHRob3VnaCBjdXJyZW50X3RocmVh
ZF8gaXMgc3RpbGwgbnVsbHB0ciwKLWluZmVyaW9yX3B0aWQgaXMgdmFsaWQgYW5kIGlzIG5vdCBu
dWxsX3B0aWQuCi0KLVRoZXJlIGlzIGFub3RoZXIgY3Jhc2ggc2NlbmFyaW8gYWZ0ZXIgd2Uga2ls
bCBhIHByZXZpb3VzbHkgYWN0aXZlIGluZmVyaW9yLCBpbgotd2hpY2ggY2FzZSB0aGUgZ2RiYXJj
aCB3aWxsIHN0aWxsIHNheSB3ZSBzdXBwb3J0IHBvaW50ZXIgYXV0aGVudGljYXRpb24gYnV0IHdl
Ci13aWxsIGFsc28gaGF2ZSBubyBjdXJyZW50IHRocmVhZCAoaW5mZXJpb3JfdGhyZWFkICgpIHdp
bGwgYXNzZXJ0IGV0YykuCi0KLUlmIHRoZSB0YXJnZXQgaGFzIHN1cHBvcnQgZm9yIHBvaW50ZXIg
YXV0aGVudGljYXRpb24sIGdkYiBuZWVkcyB0byB1c2UKLWEgY291cGxlIChvciA0LCBmb3IgYmFy
ZS1tZXRhbCkgbWFzayByZWdpc3RlcnMgdG8gbWFzayBvZmYgc29tZSBiaXRzIG9mCi1wb2ludGVy
cywgYW5kIGZvciB0aGF0IGl0IG5lZWRzIHRvIGFjY2VzcyB0aGUgcmVnaXN0ZXJzLgotCi1BdCBz
b21lIHBvaW50cywgbGlrZSB0aGUgb25lIGZyb20gdGhlIGJhY2t0cmFjZSBhYm92ZSwgdGhlcmUg
aXMgbm8gYWN0aXZlCi10aHJlYWQvY3VycmVudCByZWdjYWNoZSBiZWNhdXNlIGdkYiBpcyBpbiB0
aGUgbWlkZGxlIG9mIGRvaW5nIGV2ZW50IGhhbmRsaW5nCi1hbmQgc3dpdGNoaW5nIGJldHdlZW4g
dGhyZWFkcy4KLQotU2ltb24gc3VnZ2VzdGVkIHRoZSB1c2Ugb2YgaW5mZXJpb3JfcHRpZCB0byBm
ZXRjaCB0aGUgcmVnaXN0ZXIgY2FjaGUsIGFzCi1vcHBvc2VkIHRvIHJlbHlpbmcgb24gdGhlIGN1
cnJlbnQgcmVnaXN0ZXIgY2FjaGUuICBUaG91Z2ggd2UgbmVlZCB0byBtYWtlIHN1cmUKLWluZmVy
aW9yX3B0aWQgaXMgdmFsaWQgKG5vdCBudWxsX3B0aWQpLCBJIHRoaW5rIHRoaXMgd29ya3Mgbmlj
ZWx5LgotCi1XaXRoIGluZmVyaW9yX3B0aWQsIHdlIGNhbiBkbyBzYWZldHkgY2hlY2tzIGFsb25n
IHRoZSB3YXksIG1ha2luZyBzdXJlIHdlIGhhdmUKLWEgdGhyZWFkIHRvIGZldGNoIGEgcmVnaXN0
ZXIgY2FjaGUgZnJvbSBhbmQgY2hlY2tpbmcgaWYgdGhlIHRocmVhZCBpcyBhY3R1YWxseQotc3Rv
cHBlZCBvciBydW5uaW5nLgotCi1UaGUgZm9sbG93aW5nIHBhdGNoIGltcGxlbWVudHMgdGhpcyBp
ZGVhIHdpdGggc2FmZXR5IGNoZWNrcyB0byBtYWtlIHN1cmUgd2UKLWRvbid0IHJ1biBpbnRvIGFz
c2VydGlvbnMgb3IgZXJyb3JzLiAgSWYgYW55IG9mIHRoZSBjaGVja3MgZmFpbCwgd2UgZmFsbGJh
Y2sgdG8KLXVzaW5nIGEgZGVmYXVsdCBtYXNrIHRvIHJlbW92ZSBub24tYWRkcmVzcyBiaXRzIG9m
IGEgcG9pbnRlci4KLQotSSBkaXNjdXNzZWQgd2l0aCBQZWRybyB0aGUgcG9zc2liaWxpdHkgb2Yg
Y2FjaGluZyB0aGUgbWFzayByZWdpc3RlciB2YWx1ZXMKLSh3aGljaCBhcmUgcGVyLXByb2Nlc3Mg
YW5kIGNhbiBjaGFuZ2UgbWlkLWV4ZWN1dGlvbiksIGJ1dCB0aGVyZSBpc24ndCBhIGdvb2QKLXNw
b3QgdG8gY2FjaGUgdGhvc2UgdmFsdWVzLiBCZXNpZGVzLCB0aGUgbWFzayByZWdpc3RlcnMgY2Fu
IGNoYW5nZSBjb25zdGFudGx5Ci1mb3IgYmFyZS1tZXRhbCBkZWJ1Z2dpbmcgd2hlbiBzd2l0Y2hp
bmcgYmV0d2VlbiBleGNlcHRpb24gbGV2ZWxzLgotCi1JbiBzb21lIGNhc2VzLCBpdCBpcyBqdXN0
IG5vdCBwb3NzaWJsZSB0byBnZXQgYWNjZXNzIHRvIHRoZXNlIG1hc2sgcmVnaXN0ZXJzLAotbGlr
ZSB0aGUgY2FzZSB3aGVyZSB0aHJlYWRzIGFyZSBydW5uaW5nLiBJbiB0aG9zZSBjYXNlcywgdXNp
bmcgYSBkZWZhdWx0IG1hc2sKLXRvIHJlbW92ZSB0aGUgbm9uLWFkZHJlc3MgYml0cyBzaG91bGQg
YmUgZW5vdWdoLgotCi1UaGlzIGNhbiBoYXBwZW4gd2hlbiB3ZSBsZXQgdGhyZWFkcyBydW4gaW4g
dGhlIGJhY2tncm91bmQgYW5kIHRoZW4gd2UgYXR0ZW1wdAotdG8gYWNjZXNzIGEgbWVtb3J5IGFk
ZHJlc3MgKG5vdyB0aGF0IGdkYiBpcyBjYXBhYmxlIG9mIHJlYWRpbmcgbWVtb3J5IGV2ZW4KLXdp
dGggdGhyZWFkcyBydW5uaW5nKS4gIFRodXMgZ2RiIHdpbGwgYXR0ZW1wdCB0byByZW1vdmUgbm9u
LWFkZHJlc3MgYml0cwotb2YgdGhhdCBtZW1vcnkgYWNjZXNzLCB3aWxsIGF0dGVtcHQgdG8gYWNj
ZXNzIHJlZ2lzdGVycywgcnVubmluZyBpbnRvIGVycm9ycy4KLQotUmVncmVzc2lvbi10ZXN0ZWQg
b24gYWFyY2g2NC1saW51eCBVYnVudHUgMjAuMDQuCi0tLS0KLSBnZGIvYWFyY2g2NC1saW51eC10
ZGVwLmMgfCA2NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCi0gMSBm
aWxlIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQotCi1kaWZmIC0t
Z2l0IGEvZ2RiL2FhcmNoNjQtbGludXgtdGRlcC5jIGIvZ2RiL2FhcmNoNjQtbGludXgtdGRlcC5j
Ci1pbmRleCAyMGEwNDFjNTk5ZS4uNGIyOTE1YjhlOTkgMTAwNjQ0Ci0tLS0gYS9nZGIvYWFyY2g2
NC1saW51eC10ZGVwLmMKLSsrKyBiL2dkYi9hYXJjaDY0LWxpbnV4LXRkZXAuYwotQEAgLTU3LDYg
KzU3LDkgQEAKLSAjaW5jbHVkZSAiZWxmL2NvbW1vbi5oIgotICNpbmNsdWRlICJlbGYvYWFyY2g2
NC5oIgotIAotKy8qIEZvciBpbmZlcmlvcl9wdGlkIGFuZCBjdXJyZW50X2luZmVyaW9yICgpLiAg
Ki8KLSsjaW5jbHVkZSAiaW5mZXJpb3IuaCIKLSsKLSAvKiBTaWduYWwgZnJhbWUgaGFuZGxpbmcu
Ci0gCi0gICAgICAgKy0tLS0tLS0tLS0tLSsgIF4KLUBAIC0xOTg2LDI5ICsxOTg5LDYwIEBAIGFh
cmNoNjRfbGludXhfZGVjb2RlX21lbXRhZ19zZWN0aW9uIChzdHJ1Y3QgZ2RiYXJjaCAqZ2RiYXJj
aCwKLSBzdGF0aWMgQ09SRV9BRERSCi0gYWFyY2g2NF9yZW1vdmVfbm9uX2FkZHJlc3NfYml0cyAo
c3RydWN0IGdkYmFyY2ggKmdkYmFyY2gsIENPUkVfQUREUiBwb2ludGVyKQotIHsKLS0gIGFhcmNo
NjRfZ2RiYXJjaF90ZGVwICp0ZGVwID0gZ2RiYXJjaF90ZGVwPGFhcmNoNjRfZ2RiYXJjaF90ZGVw
PiAoZ2RiYXJjaCk7Ci0tCi0gICAvKiBCeSBkZWZhdWx0LCB3ZSBhc3N1bWUgVEJJIGFuZCBkaXNj
YXJkIHRoZSB0b3AgOCBiaXRzIHBsdXMgdGhlIFZBIHJhbmdlCi0tICAgICBzZWxlY3QgYml0ICg1
NSkuICAqLwotKyAgICAgc2VsZWN0IGJpdCAoNTUpLiAgQmVsb3cgd2UgdHJ5IHRvIGZldGNoIGlu
Zm9ybWF0aW9uIGFib3V0IHBvaW50ZXIKLSsgICAgIGF1dGhlbnRpY2F0aW9uIG1hc2tzIGluIG9y
ZGVyIHRvIG1ha2Ugbm9uLWFkZHJlc3MgcmVtb3ZhbCBtb3JlCi0rICAgICBwcmVjaXNlLiAgKi8K
LSAgIENPUkVfQUREUiBtYXNrID0gQUFSQ0g2NF9UT1BfQklUU19NQVNLOwotIAotLSAgaWYgKHRk
ZXAtPmhhc19wYXV0aCAoKSkKLSsgIC8qIENoZWNrIGlmIHdlIGhhdmUgYW4gaW5mZXJpb3IgZmly
c3QuICBJZiBub3QsIGp1c3QgdXNlIHRoZSBkZWZhdWx0Ci0rICAgICBtYXNrLgotKwotKyAgICAg
V2UgdXNlIHRoZSBpbmZlcmlvcl9wdGlkIGhlcmUgYmVjYXVzZSB0aGUgcG9pbnRlciBhdXRoZW50
aWNhdGlvbiBtYXNrcwotKyAgICAgc2hvdWxkIGJlIHRoZSBzYW1lIGFjcm9zcyB0aHJlYWRzIG9m
IGEgcHJvY2Vzcy4gIFNpbmNlIHdlIG1heSBub3QgaGF2ZQotKyAgICAgYWNjZXNzIHRvIHRoZSBj
dXJyZW50IHRocmVhZCAoZ2RiIG1heSBoYXZlIHN3aXRjaGVkIHRvIG5vIGluZmVyaW9ycwotKyAg
ICAgbW9tZW50YXJpbHkpLCB3ZSB1c2UgdGhlIGluZmVyaW9yIHB0aWQuICAqLwotKyAgaWYgKGlu
ZmVyaW9yX3B0aWQgIT0gbnVsbF9wdGlkKQotICAgICB7Ci0tICAgICAgLyogRmV0Y2ggdGhlIFBB
QyBtYXNrcy4gIFRoZXNlIG1hc2tzIGFyZSBwZXItcHJvY2Vzcywgc28gd2UgY2FuIGp1c3QKLS0J
IGZldGNoIGRhdGEgZnJvbSB3aGF0ZXZlciB0aHJlYWQgd2UgaGF2ZSBhdCB0aGUgbW9tZW50Lgot
KyAgICAgIC8qIElmIHdlIGRvIGhhdmUgYW4gaW5mZXJpb3IsIGF0dGVtcHQgdG8gZmV0Y2ggaXRz
IHRocmVhZCdzIHRocmVhZF9pbmZvCi0rCSBzdHJ1Y3QuICAqLwotKyAgICAgIHRocmVhZF9pbmZv
ICp0aHJlYWQKLSsJPSBmaW5kX3RocmVhZF9wdGlkIChjdXJyZW50X2luZmVyaW9yICgpLT5wcm9j
ZXNzX3RhcmdldCAoKSwKLSsJCQkgICAgaW5mZXJpb3JfcHRpZCk7Ci0gCi0tCSBBbHNvLCB3ZSBo
YXZlIGJvdGggYSBjb2RlIG1hc2sgYW5kIGEgZGF0YSBtYXNrLiAgRm9yIG5vdyB0aGV5IGFyZSB0
aGUKLS0JIHNhbWUsIGJ1dCB0aGlzIG1heSBjaGFuZ2UgaW4gdGhlIGZ1dHVyZS4gICovCi0tICAg
ICAgc3RydWN0IHJlZ2NhY2hlICpyZWdzID0gZ2V0X2N1cnJlbnRfcmVnY2FjaGUgKCk7Ci0tICAg
ICAgQ09SRV9BRERSIGNtYXNrLCBkbWFzazsKLSsgICAgICAvKiBJZiB0aGUgdGhyZWFkIGlzIHJ1
bm5pbmcsIHdlIHdpbGwgbm90IGJlIGFibGUgdG8gZmV0Y2ggdGhlIG1hc2sKLSsJIHJlZ2lzdGVy
cy4gICovCi0rICAgICAgaWYgKHRocmVhZCAhPSBudWxscHRyICYmIHRocmVhZC0+c3RhdGUgIT0g
VEhSRUFEX1JVTk5JTkcpCi0rCXsKLSsJICAvKiBPdGhlcndpc2UsIGZldGNoIHRoZSByZWdpc3Rl
ciBjYWNoZSBhbmQgdGhlIG1hc2tzLiAgKi8KLSsJICBzdHJ1Y3QgcmVnY2FjaGUgKnJlZ3MKLSsJ
ICAgID0gZ2V0X3RocmVhZF9yZWdjYWNoZSAoY3VycmVudF9pbmZlcmlvciAoKS0+cHJvY2Vzc190
YXJnZXQgKCksCi0rCQkJCSAgIGluZmVyaW9yX3B0aWQpOwotKwotKwkgIC8qIFVzZSB0aGUgZ2Ri
YXJjaCBmcm9tIHRoZSByZWdpc3RlciBjYWNoZSB0byBjaGVjayBmb3IgcG9pbnRlcgotKwkgICAg
IGF1dGhlbnRpY2F0aW9uIHN1cHBvcnQsIGFzIGl0IG1hdGNoZXMgdGhlIGZlYXR1cmVzIGZvdW5k
IGluCi0rCSAgICAgdGhhdCBwYXJ0aWN1bGFyIHRocmVhZC4gICovCi0rCSAgYWFyY2g2NF9nZGJh
cmNoX3RkZXAgKnRkZXAKLSsJICAgID0gZ2RiYXJjaF90ZGVwPGFhcmNoNjRfZ2RiYXJjaF90ZGVw
PiAocmVncy0+YXJjaCAoKSk7Ci0rCi0rCSAgLyogSXMgdGhlcmUgcG9pbnRlciBhdXRoZW50aWNh
dGlvbiBzdXBwb3J0PyAgKi8KLSsJICBpZiAodGRlcC0+aGFzX3BhdXRoICgpKQotKwkgICAgewot
KwkgICAgICAvKiBXZSBoYXZlIGJvdGggYSBjb2RlIG1hc2sgYW5kIGEgZGF0YSBtYXNrLiAgRm9y
IG5vdyB0aGV5IGFyZQotKwkJIHRoZSBzYW1lLCBidXQgdGhpcyBtYXkgY2hhbmdlIGluIHRoZSBm
dXR1cmUuICAqLwotKwkgICAgICBDT1JFX0FERFIgY21hc2ssIGRtYXNrOwotIAotLSAgICAgIGlm
IChyZWdzLT5jb29rZWRfcmVhZCAodGRlcC0+cGF1dGhfcmVnX2Jhc2UsICZkbWFzaykgIT0gUkVH
X1ZBTElEKQotLQlkbWFzayA9IG1hc2s7Ci0rCSAgICAgIGlmIChyZWdzLT5jb29rZWRfcmVhZCAo
dGRlcC0+cGF1dGhfcmVnX2Jhc2UsICZkbWFzaykKLSsJCSAgIT0gUkVHX1ZBTElEKQotKwkJZG1h
c2sgPSBtYXNrOwotIAotLSAgICAgIGlmIChyZWdzLT5jb29rZWRfcmVhZCAodGRlcC0+cGF1dGhf
cmVnX2Jhc2UgKyAxLCAmY21hc2spICE9IFJFR19WQUxJRCkKLS0JY21hc2sgPSBtYXNrOwotKwkg
ICAgICBpZiAocmVncy0+Y29va2VkX3JlYWQgKHRkZXAtPnBhdXRoX3JlZ19iYXNlICsgMSwgJmNt
YXNrKQotKwkJICAhPSBSRUdfVkFMSUQpCi0rCQljbWFzayA9IG1hc2s7Ci0gCi0tICAgICAgbWFz
ayB8PSBhYXJjaDY0X21hc2tfZnJvbV9wYWNfcmVnaXN0ZXJzIChjbWFzaywgZG1hc2spOwotKwkg
ICAgICBtYXNrIHw9IGFhcmNoNjRfbWFza19mcm9tX3BhY19yZWdpc3RlcnMgKGNtYXNrLCBkbWFz
ayk7Ci0rCSAgICB9Ci0rCX0KLSAgICAgfQotIAotICAgcmV0dXJuIGFhcmNoNjRfcmVtb3ZlX3Rv
cF9iaXRzIChwb2ludGVyLCBtYXNrKTsKLS0tIAotMi4zNC4xCi0KZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9nZGIvZ2RiLzAwMDktZ2Ric2VydmVyLWxpbnV4LWxvdy5jYy1GaXgt
YS10eXBvLWluLXRlcm5hcnktb3BlcmF0by5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9n
ZGIvZ2RiLzAwMDktZ2Ric2VydmVyLWxpbnV4LWxvdy5jYy1GaXgtYS10eXBvLWluLXRlcm5hcnkt
b3BlcmF0by5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMzJlYmEwODliYy4u
MDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2RiL2dkYi8wMDA5LWdkYnNl
cnZlci1saW51eC1sb3cuY2MtRml4LWEtdHlwby1pbi10ZXJuYXJ5LW9wZXJhdG8ucGF0Y2gKKysr
IC9kZXYvbnVsbApAQCAtMSwyNCArMCwwIEBACi1Gcm9tIDlhODUxMzJjNGJhN2QzN2E1ZGYxNDYy
MzliM2FiMWE1ODU0Y2U0NzggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBLaGVtIFJh
aiA8cmFqLmtoZW1AZ21haWwuY29tPgotRGF0ZTogV2VkLCAyMiBGZWIgMjAyMyAxNjoyNDowNyAt
MDgwMAotU3ViamVjdDogW1BBVENIXSBnZGJzZXJ2ZXIvbGludXgtbG93LmNjOiBGaXggYSB0eXBv
IGluIHRlcm5hcnkgb3BlcmF0b3IKLQotVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBz
Oi8vc291cmNld2FyZS5vcmcvcGlwZXJtYWlsL2dkYi1wYXRjaGVzLzIwMjMtRmVicnVhcnkvMTk3
Mjk4Lmh0bWxdCi1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgot
LS0tCi0gZ2Ric2VydmVyL2xpbnV4LWxvdy5jYyB8IDIgKy0KLSAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKLQotZGlmZiAtLWdpdCBhL2dkYnNlcnZlci9saW51
eC1sb3cuY2MgYi9nZGJzZXJ2ZXIvbGludXgtbG93LmNjCi1pbmRleCA3ZTFkZTM5Nzg5My4uOTVl
Yzg3MWQ0MzYgMTAwNjQ0Ci0tLS0gYS9nZGJzZXJ2ZXIvbGludXgtbG93LmNjCi0rKysgYi9nZGJz
ZXJ2ZXIvbGludXgtbG93LmNjCi1AQCAtNTM5MCw3ICs1MzkwLDcgQEAgcHJvY194ZmVyX21lbW9y
eSAoQ09SRV9BRERSIG1lbWFkZHIsIHVuc2lnbmVkIGNoYXIgKnJlYWRidWYsCi0gICAgICAgaWYg
KGxzZWVrIChmZCwgbWVtYWRkciwgU0VFS19TRVQpICE9IC0xKQotIAlieXRlcyA9IChyZWFkYnVm
ICE9IG51bGxwdHIKLSAJCSA/IHJlYWQgKGZkLCByZWFkYnVmLCBsZW4pCi0tCQkgPyB3cml0ZSAo
ZmQsIHdyaXRlYnVmLCBsZW4pKTsKLSsJCSA6IHdyaXRlIChmZCwgd3JpdGVidWYsIGxlbikpOwot
ICNlbmRpZgotIAotICAgICAgIGlmIChieXRlcyA8IDApCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZ2RiL2dkYl8xMy4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dkYi9n
ZGJfMTMuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2dkYi9nZGJfMTMuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2dkYi9nZGJfMTMuMi5iYgotLSAKMi4zOS4yCgo=

--===============6299568490534116760==--

