Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D6E5973D99
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 May 2015 01:34:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t411YMEF026036
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Apr 2015 18:34:22 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 30 Apr 2015 18:34:21 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 30 Apr 2015 21:34:16 -0400
Message-ID: <0604f9cf79d88a6bdfb68aab7800548097308fa8.1430443583.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1430443583.git.bruce.ashfield@windriver.com>
References: <cover.1430443583.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] linux-yocto/3.14: refresh -rt support
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
X-List-Received-Date: Fri, 01 May 2015 01:34:23 -0000
Content-Type: text/plain

Paul Gortmaker refreshed the 3.14-rt support to the latest rt stable
content.

With these SRCREV bumps, the 3.14 LTSI kernel is now at -rt37.

   91dc6afcecd4 rt: bump localversion from 32 to 37
   e69f7430b620 rt: bump localversion to 32
   c060800318e4 netpoll: guard the access to dev->npinfo with rcu_read_lock/unlock_bh() for CONFIG_PREEMPT_RT_FULL=y
   833c21beba79 Revert "timers: do not raise softirq unconditionally"
   6c9337ff352c fs,btrfs: fix rt deadlock on extent_buffer->lock
   2d542663bfb9 staging: Mark rtl8821ae as broken
   988e4701df83 timers: Reduce future __run_timers() latency for first add to empty list
   2549262883c5 timers: Reduce future __run_timers() latency for newly emptied list
   073fac19d3e4 timers: Reduce __run_timers() latency for empty list
   25ca11173e64 timers: Track total number of timers in list
   277a4ae36580 fs/aio: simple simple work
   7b2ebc4e590b lockdep: selftest: fix warnings due to missing PREEMPT_RT conditionals
   9afc01954298 thermal: Defer thermal wakups to threads
   84d35d05b236 locking: ww_mutex: fix ww_mutex vs self-deadlock
   f0c8e4837a51 Revert "rwsem-rt: Do not allow readers to nest"
   df0d51ecf13f sunrpc: make svc_xprt_do_enqueue() use get_cpu_light()
   f069e339ca02 work-simple: Simple work queue implemenation
   0d9e6cbead39 scheduling while atomic in cgroup code
   8405cdab8c2c sas-ata/isci: dont't disable interrupts in qc_issue handler
   dfb7e1ab2427 mips: rt: Replace pagefault_* to raw version
   ddbe4584a13b ARM: cmpxchg: define __HAVE_ARCH_CMPXCHG for armv6 and later
   607f2a27c2ee arm/futex: disable preemption during futex_atomic_cmpxchg_inatomic()
   58de8f60159f ARM: enable irq in translation/section permission fault handlers
   62d90b45607c x86: UV: raw_spinlock conversion
   e8d164191f65 rtmutex: enable deadlock detection in ww_mutex_lock functions
   9612daf936db rt,locking: fix __ww_mutex_lock_interruptible() lockdep annotation
   47915a120d41 rtmutex.c: Fix incorrect waiter check
   a6a68d53df5f locking/rt-mutex: avoid a NULL pointer dereference on deadlock
   fb2c256f8a91 futex: Simplify futex_lock_pi_atomic() and make it more robust
   7e59d4d5900e futex: Split out the first waiter attachment from lookup_pi_state()
   45ccc2e3f25f futex: Split out the waiter check from lookup_pi_state()
   c5133997a345 futex: Use futex_top_waiter() in lookup_pi_state()
   4726c8b47964 futex: Make unlock_pi more robust
   b55c2c7782ee rtmutex: Avoid pointless requeueing in the deadlock detection chain walk
   ff7cfbb757d4 rtmutex: Cleanup deadlock detector debug logic
   e80ba665fa71 rtmutex: Confine deadlock logic to futex
   7a9e7c37ccf4 rtmutex: Simplify remove_waiter()
   d664c14c1db3 rtmutex: Document pi chain walk
   64bcb809c720 rtmutex: Clarify the boost/deboost part
   02323ee362c4 rtmutex: No need to keep task ref for lock owner check
   063983fb0497 rtmutex: Simplify and document try_to_take_rtmutex()
   f87319b715f1 rtmutex: Simplify rtmutex_slowtrylock()
   de9723ae23f9 gpio: omap: use raw locks for locking
   705ad635f56a rt: bump localversion from 22 to 31
   22b5a5cda73a mm/page_alloc: fixup warning from stable merges to -rt

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 18 +++++++++---------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 4b602b1b03f6..23e1688daeda 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,9 +3,9 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "3fb54cf8f4c3254f628e6c4720fe3c731a9de0b2"
-SRCREV_machine_qemuppc ?= "ab935c000435b6f5af42543f8e2300e473995d5a"
-SRCREV_meta ?= "162dfe3bb092c1a792e5ed224fe09672e9814b24"
+SRCREV_machine ?= "91dc6afcecd47c08e7e13e674d8d7e9dcede5aca"
+SRCREV_machine_qemuppc ?= "2655b44cfe839f6f9ba15b061e1b4d386d5821f6"
+SRCREV_meta ?= "46df2668fa657162d11f96a6f1af138c562a03aa"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index afcc4dd6206c..1d999650611c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "3.14.36"
 KMETA = "meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "4434aa71ff7043c570f9eae493df1ccadbda9b85"
-SRCREV_meta ?= "162dfe3bb092c1a792e5ed224fe09672e9814b24"
+SRCREV_machine ?= "2a2be8720802fae73fbdf1da37f61d7843332ba3"
+SRCREV_meta ?= "46df2668fa657162d11f96a6f1af138c562a03aa"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index b71aea2b18e9..fa433b61c821 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "d1cea997ae512ee325600a247d75027e65655e0a"
-SRCREV_machine_qemuarm64 ?= "4434aa71ff7043c570f9eae493df1ccadbda9b85"
-SRCREV_machine_qemumips ?= "c37155f99472e7dc9f94b3bda72c73a3f718fdbf"
-SRCREV_machine_qemuppc ?= "521b9fd001dc25a446d39f349cdfb7f9f5697d05"
-SRCREV_machine_qemux86 ?= "f7cbba6012312f5bf9b7279bafa8bb09d18b547d"
-SRCREV_machine_qemux86-64 ?= "4434aa71ff7043c570f9eae493df1ccadbda9b85"
-SRCREV_machine_qemumips64 ?= "a777f11a26f075b71becb47b5133252c5d8fafff"
-SRCREV_machine ?= "4434aa71ff7043c570f9eae493df1ccadbda9b85"
-SRCREV_meta ?= "162dfe3bb092c1a792e5ed224fe09672e9814b24"
+SRCREV_machine_qemuarm ?= "90f1033d72d422b4e4a8125f68cd1623d6788870"
+SRCREV_machine_qemuarm64 ?= "2a2be8720802fae73fbdf1da37f61d7843332ba3"
+SRCREV_machine_qemumips ?= "bc927927f774c9d12f6c4689dbfba9f5578d0b62"
+SRCREV_machine_qemuppc ?= "e4dfdbf1a059e0edb1be677973f8e2c73e012c8a"
+SRCREV_machine_qemux86 ?= "594bfbce3133d75d9aa569883bdeaed15eeadc8f"
+SRCREV_machine_qemux86-64 ?= "2a2be8720802fae73fbdf1da37f61d7843332ba3"
+SRCREV_machine_qemumips64 ?= "ea8b5406c6ec027d0475146ac84f24eb34196b78"
+SRCREV_machine ?= "2a2be8720802fae73fbdf1da37f61d7843332ba3"
+SRCREV_meta ?= "46df2668fa657162d11f96a6f1af138c562a03aa"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
2.1.0


