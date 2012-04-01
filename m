Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <darren@apps.dvhart.com>) id 1SEFDz-0007dw-0Z
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Apr 2012 09:29:19 +0200
Received: by pbcum15 with SMTP id um15so2868556pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Apr 2012 00:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=O2PQibwNGwpv7ayQ6eEOI26V3VbHfNMUqiBlFftRvt8=;
	b=U21Ltq3H7Yaf1eM8RHTsog3QqILsObb3rr037kUHSgkEbviJxqBtBhzlfyYWO6dH7I
	thJsYIoJjObl/nEy58S+iO56oOw0gfUG+DN5BFIsSb9whsZMIpC2/tFk5bTnZ2GqYo1J
	qnX2jCYl6RaIwqKie54TWou3fQ39OdNby4QVIVP3rN7rUkewctxYqXViXD22MOyPPy3D
	6qBsA4y5Y74NOvu/t74g4dunwIQO1oF9+eRi9xH8q7qDft7dcdNFC1Hz6JY/NftwVy2I
	LBN90NW5DwLNJSUlLzDFeqS/BrLTnhxK0bXYkzv3DwGuL4iEi1cXWpyoRQNUK7WEePf0
	kKDA==
Received: by 10.68.237.1 with SMTP id uy1mr11165042pbc.99.1333264811610;
	Sun, 01 Apr 2012 00:20:11 -0700 (PDT)
Received: from localhost (static-50-53-99-101.bvtn.or.frontiernet.net.
	[50.53.99.101])
	by mx.google.com with ESMTPS id i4sm5410167pbt.45.2012.04.01.00.20.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 01 Apr 2012 00:20:10 -0700 (PDT)
Sender: Darren Hart <darren@apps.dvhart.com>
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Sun,  1 Apr 2012 00:19:58 -0700
Message-Id: <d879b5825e0d5bb1e045379326fdb9daad67c1a7.1333264701.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1333264701.git.dvhart@linux.intel.com>
References: <cover.1333264701.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1333264701.git.dvhart@linux.intel.com>
References: <cover.1333264701.git.dvhart@linux.intel.com>
X-Gm-Message-State: ALoCoQn4pqOusZPJ/6zuELe4EKqla2iWYLYlH/wEIDHG+5Jy+WdqCp0RHMabU5VcAQnDUEvnlHuV
Subject: [PATCH 1/1] tiny: Update linux-yocto-tiny to 3.2
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
X-List-Received-Date: Sun, 01 Apr 2012 07:29:19 -0000

Migrate linux-yocto-tiny from 3.0 to 3.2. The 3.0 recipe was
based entirely on recipe-space fragments and was only a proof of concept.
The 3.2 linux-yocto meta-data now has a proper tiny KTYPE defined.

By default this recipe supports only the qemux86 machine, which builds the
common-pc support (including networking, sound, USB, VGA and serial consoles,
etc.). New machines can be added and will use the tiny KTYPE, but will need to
add any desired hardware support as the base config is very minimal.

No filesystems are supported by default, only the initramfs.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny/ata.cfg |    9 -
 .../recipes-kernel/linux/linux-yocto-tiny/core.cfg |   19 -
 .../linux/linux-yocto-tiny/debug.cfg               |    5 -
 .../linux/linux-yocto-tiny/devtmpfs.cfg            |    6 -
 .../linux/linux-yocto-tiny/e1000.cfg               |    7 -
 .../recipes-kernel/linux/linux-yocto-tiny/ext2.cfg |    1 -
 .../recipes-kernel/linux/linux-yocto-tiny/ext3.cfg |    2 -
 .../recipes-kernel/linux/linux-yocto-tiny/lzma.cfg |    3 -
 meta/recipes-kernel/linux/linux-yocto-tiny/net.cfg |   26 -
 .../linux/linux-yocto-tiny/qemux86/defconfig       |  613 --------------------
 .../linux/linux-yocto-tiny/ramfs.cfg               |    6 -
 .../linux/linux-yocto-tiny/rtc-pc.cfg              |   13 -
 .../linux/linux-yocto-tiny/serial.cfg              |    7 -
 meta/recipes-kernel/linux/linux-yocto-tiny/smp.cfg |    7 -
 meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb  |   39 --
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb  |   25 +
 16 files changed, 25 insertions(+), 763 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ata.cfg
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/core.cfg
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/debug.cfg
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/devtmpfs.cfg
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/e1000.cfg
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ext2.cfg
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ext3.cfg
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/lzma.cfg
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/net.cfg
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/qemux86/defconfig
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ramfs.cfg
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/rtc-pc.cfg
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/serial.cfg
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/smp.cfg
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny/ata.cfg b/meta/recipes-kernel/linux/linux-yocto-tiny/ata.cfg
deleted file mode 100644
index 97e4d00..0000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny/ata.cfg
+++ /dev/null
@@ -1,9 +0,0 @@
-# IDE disk support
-# Dependencies
-CONFIG_PCI=y
-CONFIG_BLOCK=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_ATA=y
-CONFIG_ATA_SFF=y
-CONFIG_ATA_BMDMA=y
-CONFIG_ATA_PIIX=y
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny/core.cfg b/meta/recipes-kernel/linux/linux-yocto-tiny/core.cfg
deleted file mode 100644
index 7057218..0000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny/core.cfg
+++ /dev/null
@@ -1,19 +0,0 @@
-# Basic facilities that shall be present in all kernels
-
-# Needed to execute... anything (like init)
-CONFIG_BINFMT_ELF=y
-
-# Needed by at least the telephony daemon
-CONFIG_SIGNALFD=y
-
-# At least bootlogd requires this
-CONFIG_UNIX98_PTYS=y
-
-# Required for basic IPC and pthread locking support
-CONFIG_SYSVIPC=y
-CONFIG_FUTEX=y
-CONFIG_RT_MUTEXES=y
-
-CONFIG_PROC_FS=y
-CONFIG_SYSFS=y
-
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny/debug.cfg b/meta/recipes-kernel/linux/linux-yocto-tiny/debug.cfg
deleted file mode 100644
index 886bfd9..0000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny/debug.cfg
+++ /dev/null
@@ -1,5 +0,0 @@
-# Debug options
-# +98k bzImage
-CONFIG_PRINTK=y
-CONFIG_EARLY_PRINTK=y
-CONFIG_PRINTK_TIME=y
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny/devtmpfs.cfg b/meta/recipes-kernel/linux/linux-yocto-tiny/devtmpfs.cfg
deleted file mode 100644
index 07632e2..0000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny/devtmpfs.cfg
+++ /dev/null
@@ -1,6 +0,0 @@
-# For /dev and udev
-# Could eliminate for a static /dev tree
-# +1.5k bzImage
-CONFIG_HOTPLUG=y
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny/e1000.cfg b/meta/recipes-kernel/linux/linux-yocto-tiny/e1000.cfg
deleted file mode 100644
index 8e18bbb..0000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny/e1000.cfg
+++ /dev/null
@@ -1,7 +0,0 @@
-# e1000 PCI network card support (qemu default)
-# FIXME: This appears in dmesg, but a probe fails
-# bzImage +31k
-CONFIG_PCI=y
-CONFIG_NETDEVICES=y
-CONFIG_NETDEV_1000=y
-CONFIG_E1000=y
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny/ext2.cfg b/meta/recipes-kernel/linux/linux-yocto-tiny/ext2.cfg
deleted file mode 100644
index e35c36d..0000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny/ext2.cfg
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_EXT2_FS=y
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny/ext3.cfg b/meta/recipes-kernel/linux/linux-yocto-tiny/ext3.cfg
deleted file mode 100644
index df9dd64..0000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny/ext3.cfg
+++ /dev/null
@@ -1,2 +0,0 @@
-# bzImage +61k
-CONFIG_EXT3_FS=y
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny/lzma.cfg b/meta/recipes-kernel/linux/linux-yocto-tiny/lzma.cfg
deleted file mode 100644
index f1bafe1..0000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny/lzma.cfg
+++ /dev/null
@@ -1,3 +0,0 @@
-# bzImage -235k (-15% of bzImage size)
-CONFIG_KERNEL_LZMA=y
-
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny/net.cfg b/meta/recipes-kernel/linux/linux-yocto-tiny/net.cfg
deleted file mode 100644
index ab6d1ee..0000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny/net.cfg
+++ /dev/null
@@ -1,26 +0,0 @@
-# +246k bzImage
-
-# Basic socket support
-CONFIG_NET=y
-CONFIG_UNIX=y
-CONFIG_NETWORK_FILESYSTEMS=y
-CONFIG_NLATTR=y
-
-# INET TCP/IP
-CONFIG_INET=y
-CONFIG_TCP_CONG_CUBIC=y
-CONFIG_DEFAULT_TCP_CONG="cubic"
-
-# Disable certain new defaults
-# bzImage ~ -200k
-# Using allnoconfig internally would eliminate the need for this
-# CONFIG_XFRM is not set
-# CONFIG_IPV6 is not set
-# CONFIG_WIRELESS is not set
-# CONFIG_IPCOMP_XFRM is not set
-# IPSEC
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
-#
-# CONFIG_INET_DIAG is not set
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny/qemux86/defconfig b/meta/recipes-kernel/linux/linux-yocto-tiny/qemux86/defconfig
deleted file mode 100644
index ba9ae04..0000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny/qemux86/defconfig
+++ /dev/null
@@ -1,613 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Linux/i386 3.0.4 Kernel Configuration
-#
-# CONFIG_64BIT is not set
-CONFIG_X86_32=y
-# CONFIG_X86_64 is not set
-CONFIG_X86=y
-CONFIG_INSTRUCTION_DECODER=y
-CONFIG_OUTPUT_FORMAT="elf32-i386"
-CONFIG_ARCH_DEFCONFIG="arch/x86/configs/i386_defconfig"
-CONFIG_GENERIC_CMOS_UPDATE=y
-CONFIG_CLOCKSOURCE_WATCHDOG=y
-CONFIG_GENERIC_CLOCKEVENTS=y
-CONFIG_LOCKDEP_SUPPORT=y
-CONFIG_STACKTRACE_SUPPORT=y
-CONFIG_HAVE_LATENCYTOP_SUPPORT=y
-CONFIG_MMU=y
-# CONFIG_ZONE_DMA is not set
-# CONFIG_NEED_DMA_MAP_STATE is not set
-CONFIG_NEED_SG_DMA_LENGTH=y
-CONFIG_GENERIC_ISA_DMA=y
-CONFIG_GENERIC_IOMAP=y
-CONFIG_GENERIC_HWEIGHT=y
-CONFIG_ARCH_MAY_HAVE_PC_FDC=y
-# CONFIG_RWSEM_GENERIC_SPINLOCK is not set
-CONFIG_RWSEM_XCHGADD_ALGORITHM=y
-CONFIG_ARCH_HAS_CPU_IDLE_WAIT=y
-CONFIG_GENERIC_CALIBRATE_DELAY=y
-# CONFIG_GENERIC_TIME_VSYSCALL is not set
-CONFIG_ARCH_HAS_CPU_RELAX=y
-CONFIG_ARCH_HAS_DEFAULT_IDLE=y
-CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
-CONFIG_HAVE_SETUP_PER_CPU_AREA=y
-CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
-CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
-# CONFIG_HAVE_CPUMASK_OF_CPU_MAP is not set
-CONFIG_ARCH_HIBERNATION_POSSIBLE=y
-CONFIG_ARCH_SUSPEND_POSSIBLE=y
-# CONFIG_ZONE_DMA32 is not set
-CONFIG_ARCH_POPULATES_NODE_MAP=y
-# CONFIG_AUDIT_ARCH is not set
-CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=y
-CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
-CONFIG_X86_32_LAZY_GS=y
-CONFIG_ARCH_HWEIGHT_CFLAGS="-fcall-saved-ecx -fcall-saved-edx"
-CONFIG_KTIME_SCALAR=y
-CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
-CONFIG_HAVE_IRQ_WORK=y
-CONFIG_IRQ_WORK=y
-
-#
-# General setup
-#
-# CONFIG_EXPERIMENTAL is not set
-CONFIG_BROKEN_ON_SMP=y
-CONFIG_INIT_ENV_ARG_LIMIT=32
-CONFIG_CROSS_COMPILE=""
-CONFIG_LOCALVERSION=""
-# CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_HAVE_KERNEL_GZIP=y
-CONFIG_HAVE_KERNEL_BZIP2=y
-CONFIG_HAVE_KERNEL_LZMA=y
-CONFIG_HAVE_KERNEL_XZ=y
-CONFIG_HAVE_KERNEL_LZO=y
-CONFIG_KERNEL_GZIP=y
-# CONFIG_KERNEL_BZIP2 is not set
-# CONFIG_KERNEL_LZMA is not set
-# CONFIG_KERNEL_XZ is not set
-# CONFIG_KERNEL_LZO is not set
-CONFIG_DEFAULT_HOSTNAME="(none)"
-# CONFIG_SYSVIPC is not set
-# CONFIG_BSD_PROCESS_ACCT is not set
-# CONFIG_FHANDLE is not set
-CONFIG_HAVE_GENERIC_HARDIRQS=y
-
-#
-# IRQ subsystem
-#
-CONFIG_GENERIC_HARDIRQS=y
-CONFIG_HAVE_SPARSE_IRQ=y
-CONFIG_GENERIC_IRQ_PROBE=y
-CONFIG_GENERIC_IRQ_SHOW=y
-CONFIG_IRQ_FORCED_THREADING=y
-# CONFIG_SPARSE_IRQ is not set
-
-#
-# RCU Subsystem
-#
-CONFIG_TINY_RCU=y
-# CONFIG_PREEMPT_RCU is not set
-# CONFIG_RCU_TRACE is not set
-# CONFIG_TREE_RCU_TRACE is not set
-# CONFIG_IKCONFIG is not set
-CONFIG_LOG_BUF_SHIFT=17
-CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y
-# CONFIG_NAMESPACES is not set
-# CONFIG_SCHED_AUTOGROUP is not set
-# CONFIG_RELAY is not set
-# CONFIG_BLK_DEV_INITRD is not set
-# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
-CONFIG_ANON_INODES=y
-CONFIG_EXPERT=y
-# CONFIG_UPTIME_LIMITED_KERNEL is not set
-# CONFIG_UID16 is not set
-# CONFIG_KALLSYMS is not set
-# CONFIG_HOTPLUG is not set
-# CONFIG_PRINTK is not set
-# CONFIG_BUG is not set
-# CONFIG_ELF_CORE is not set
-# CONFIG_PCSPKR_PLATFORM is not set
-# CONFIG_BASE_FULL is not set
-# CONFIG_FUTEX is not set
-# CONFIG_EPOLL is not set
-# CONFIG_SIGNALFD is not set
-# CONFIG_TIMERFD is not set
-# CONFIG_EVENTFD is not set
-# CONFIG_SHMEM is not set
-# CONFIG_AIO is not set
-CONFIG_EMBEDDED=y
-CONFIG_HAVE_PERF_EVENTS=y
-
-#
-# Kernel Performance Events And Counters
-#
-CONFIG_PERF_EVENTS=y
-# CONFIG_PERF_COUNTERS is not set
-# CONFIG_VM_EVENT_COUNTERS is not set
-# CONFIG_COMPAT_BRK is not set
-# CONFIG_SLAB is not set
-CONFIG_SLUB=y
-# CONFIG_SLOB is not set
-# CONFIG_PROFILING is not set
-CONFIG_HAVE_OPROFILE=y
-# CONFIG_JUMP_LABEL is not set
-CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
-CONFIG_HAVE_IOREMAP_PROT=y
-CONFIG_HAVE_KPROBES=y
-CONFIG_HAVE_KRETPROBES=y
-CONFIG_HAVE_OPTPROBES=y
-CONFIG_HAVE_ARCH_TRACEHOOK=y
-CONFIG_HAVE_DMA_ATTRS=y
-CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
-CONFIG_HAVE_DMA_API_DEBUG=y
-CONFIG_HAVE_HW_BREAKPOINT=y
-CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
-CONFIG_HAVE_USER_RETURN_NOTIFIER=y
-CONFIG_HAVE_PERF_EVENTS_NMI=y
-CONFIG_HAVE_ARCH_JUMP_LABEL=y
-
-#
-# GCOV-based kernel profiling
-#
-CONFIG_HAVE_GENERIC_DMA_COHERENT=y
-CONFIG_BASE_SMALL=1
-# CONFIG_MODULES is not set
-# CONFIG_BLOCK is not set
-# CONFIG_INLINE_SPIN_TRYLOCK is not set
-# CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
-# CONFIG_INLINE_SPIN_LOCK is not set
-# CONFIG_INLINE_SPIN_LOCK_BH is not set
-# CONFIG_INLINE_SPIN_LOCK_IRQ is not set
-# CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
-CONFIG_INLINE_SPIN_UNLOCK=y
-# CONFIG_INLINE_SPIN_UNLOCK_BH is not set
-CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
-# CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
-# CONFIG_INLINE_READ_TRYLOCK is not set
-# CONFIG_INLINE_READ_LOCK is not set
-# CONFIG_INLINE_READ_LOCK_BH is not set
-# CONFIG_INLINE_READ_LOCK_IRQ is not set
-# CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
-CONFIG_INLINE_READ_UNLOCK=y
-# CONFIG_INLINE_READ_UNLOCK_BH is not set
-CONFIG_INLINE_READ_UNLOCK_IRQ=y
-# CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
-# CONFIG_INLINE_WRITE_TRYLOCK is not set
-# CONFIG_INLINE_WRITE_LOCK is not set
-# CONFIG_INLINE_WRITE_LOCK_BH is not set
-# CONFIG_INLINE_WRITE_LOCK_IRQ is not set
-# CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
-CONFIG_INLINE_WRITE_UNLOCK=y
-# CONFIG_INLINE_WRITE_UNLOCK_BH is not set
-CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
-# CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
-# CONFIG_MUTEX_SPIN_ON_OWNER is not set
-# CONFIG_FREEZER is not set
-
-#
-# Processor type and features
-#
-# CONFIG_NO_HZ is not set
-# CONFIG_HIGH_RES_TIMERS is not set
-CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
-# CONFIG_SMP is not set
-# CONFIG_X86_EXTENDED_PLATFORM is not set
-# CONFIG_X86_32_IRIS is not set
-# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
-# CONFIG_PARAVIRT_GUEST is not set
-CONFIG_NO_BOOTMEM=y
-# CONFIG_MEMTEST is not set
-# CONFIG_M386 is not set
-# CONFIG_M486 is not set
-# CONFIG_M586 is not set
-# CONFIG_M586TSC is not set
-# CONFIG_M586MMX is not set
-CONFIG_M686=y
-# CONFIG_MPENTIUMII is not set
-# CONFIG_MPENTIUMIII is not set
-# CONFIG_MPENTIUMM is not set
-# CONFIG_MPENTIUM4 is not set
-# CONFIG_MK6 is not set
-# CONFIG_MK7 is not set
-# CONFIG_MK8 is not set
-# CONFIG_MCRUSOE is not set
-# CONFIG_MEFFICEON is not set
-# CONFIG_MWINCHIPC6 is not set
-# CONFIG_MWINCHIP3D is not set
-# CONFIG_MELAN is not set
-# CONFIG_MGEODEGX1 is not set
-# CONFIG_MGEODE_LX is not set
-# CONFIG_MCYRIXIII is not set
-# CONFIG_MVIAC3_2 is not set
-# CONFIG_MVIAC7 is not set
-# CONFIG_MCORE2 is not set
-# CONFIG_MATOM is not set
-# CONFIG_X86_GENERIC is not set
-CONFIG_X86_INTERNODE_CACHE_SHIFT=5
-CONFIG_X86_CMPXCHG=y
-CONFIG_CMPXCHG_LOCAL=y
-CONFIG_X86_L1_CACHE_SHIFT=5
-CONFIG_X86_XADD=y
-# CONFIG_X86_PPRO_FENCE is not set
-CONFIG_X86_WP_WORKS_OK=y
-CONFIG_X86_INVLPG=y
-CONFIG_X86_BSWAP=y
-CONFIG_X86_POPAD_OK=y
-CONFIG_X86_USE_PPRO_CHECKSUM=y
-CONFIG_X86_TSC=y
-CONFIG_X86_CMPXCHG64=y
-CONFIG_X86_CMOV=y
-CONFIG_X86_MINIMUM_CPU_FAMILY=5
-CONFIG_X86_DEBUGCTLMSR=y
-# CONFIG_PROCESSOR_SELECT is not set
-CONFIG_CPU_SUP_INTEL=y
-CONFIG_CPU_SUP_CYRIX_32=y
-CONFIG_CPU_SUP_AMD=y
-CONFIG_CPU_SUP_CENTAUR=y
-CONFIG_CPU_SUP_TRANSMETA_32=y
-CONFIG_CPU_SUP_UMC_32=y
-# CONFIG_HPET_TIMER is not set
-# CONFIG_DMI is not set
-# CONFIG_IOMMU_HELPER is not set
-# CONFIG_IOMMU_API is not set
-CONFIG_NR_CPUS=1
-# CONFIG_IRQ_TIME_ACCOUNTING is not set
-CONFIG_PREEMPT_NONE=y
-# CONFIG_PREEMPT_VOLUNTARY is not set
-# CONFIG_PREEMPT is not set
-# CONFIG_X86_UP_APIC is not set
-# CONFIG_X86_MCE is not set
-# CONFIG_VM86 is not set
-# CONFIG_TOSHIBA is not set
-# CONFIG_I8K is not set
-# CONFIG_X86_REBOOTFIXUPS is not set
-# CONFIG_MICROCODE is not set
-# CONFIG_X86_MSR is not set
-# CONFIG_X86_CPUID is not set
-# CONFIG_NOHIGHMEM is not set
-CONFIG_HIGHMEM4G=y
-# CONFIG_HIGHMEM64G is not set
-CONFIG_PAGE_OFFSET=0xC0000000
-CONFIG_HIGHMEM=y
-# CONFIG_ARCH_PHYS_ADDR_T_64BIT is not set
-# CONFIG_ARCH_DMA_ADDR_T_64BIT is not set
-CONFIG_ARCH_FLATMEM_ENABLE=y
-CONFIG_ILLEGAL_POINTER_VALUE=0
-CONFIG_FLATMEM=y
-CONFIG_FLAT_NODE_MEM_MAP=y
-CONFIG_HAVE_MEMBLOCK=y
-CONFIG_PAGEFLAGS_EXTENDED=y
-CONFIG_SPLIT_PTLOCK_CPUS=4
-# CONFIG_COMPACTION is not set
-# CONFIG_PHYS_ADDR_T_64BIT is not set
-CONFIG_ZONE_DMA_FLAG=0
-CONFIG_VIRT_TO_BUS=y
-# CONFIG_KSM is not set
-CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
-# CONFIG_TRANSPARENT_HUGEPAGE is not set
-CONFIG_NEED_PER_CPU_KM=y
-# CONFIG_CLEANCACHE is not set
-# CONFIG_HIGHPTE is not set
-# CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
-CONFIG_X86_RESERVE_LOW=64
-# CONFIG_MATH_EMULATION is not set
-# CONFIG_MTRR is not set
-# CONFIG_SECCOMP is not set
-# CONFIG_CC_STACKPROTECTOR is not set
-# CONFIG_HZ_100 is not set
-CONFIG_HZ_250=y
-# CONFIG_HZ_300 is not set
-# CONFIG_HZ_1000 is not set
-CONFIG_HZ=250
-# CONFIG_SCHED_HRTICK is not set
-# CONFIG_KEXEC is not set
-# CONFIG_CRASH_DUMP is not set
-CONFIG_PHYSICAL_START=0x1000000
-# CONFIG_RELOCATABLE is not set
-CONFIG_PHYSICAL_ALIGN=0x1000000
-# CONFIG_COMPAT_VDSO is not set
-# CONFIG_CMDLINE_BOOL is not set
-CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
-
-#
-# Power management and ACPI options
-#
-# CONFIG_SUSPEND is not set
-# CONFIG_PM_RUNTIME is not set
-# CONFIG_SFI is not set
-
-#
-# CPU Frequency scaling
-#
-# CONFIG_CPU_FREQ is not set
-# CONFIG_CPU_IDLE is not set
-
-#
-# Bus options (PCI etc.)
-#
-# CONFIG_PCI is not set
-# CONFIG_ARCH_SUPPORTS_MSI is not set
-CONFIG_ISA_DMA_API=y
-# CONFIG_ISA is not set
-# CONFIG_MCA is not set
-# CONFIG_SCx200 is not set
-# CONFIG_OLPC is not set
-
-#
-# Executable file formats / Emulations
-#
-# CONFIG_BINFMT_ELF is not set
-CONFIG_HAVE_AOUT=y
-# CONFIG_BINFMT_AOUT is not set
-# CONFIG_BINFMT_MISC is not set
-CONFIG_HAVE_ATOMIC_IOMAP=y
-CONFIG_HAVE_TEXT_POKE_SMP=y
-# CONFIG_NET is not set
-
-#
-# Device Drivers
-#
-
-#
-# Generic Driver Options
-#
-CONFIG_STANDALONE=y
-# CONFIG_PREVENT_FIRMWARE_BUILD is not set
-# CONFIG_FW_LOADER is not set
-# CONFIG_SYS_HYPERVISOR is not set
-# CONFIG_MTD is not set
-# CONFIG_PARPORT is not set
-# CONFIG_MISC_DEVICES is not set
-CONFIG_HAVE_IDE=y
-
-#
-# SCSI device support
-#
-CONFIG_SCSI_MOD=y
-# CONFIG_SCSI_DMA is not set
-# CONFIG_SCSI_NETLINK is not set
-# CONFIG_MACINTOSH_DRIVERS is not set
-# CONFIG_PHONE is not set
-
-#
-# Input device support
-#
-# CONFIG_INPUT is not set
-
-#
-# Hardware I/O ports
-#
-# CONFIG_SERIO is not set
-# CONFIG_GAMEPORT is not set
-
-#
-# Character devices
-#
-# CONFIG_VT is not set
-# CONFIG_UNIX98_PTYS is not set
-# CONFIG_LEGACY_PTYS is not set
-# CONFIG_SERIAL_NONSTANDARD is not set
-# CONFIG_TRACE_SINK is not set
-# CONFIG_DEVKMEM is not set
-
-#
-# Serial drivers
-#
-# CONFIG_SERIAL_8250 is not set
-CONFIG_FIX_EARLYCON_MEM=y
-
-#
-# Non-8250 serial port support
-#
-# CONFIG_SERIAL_TIMBERDALE is not set
-# CONFIG_SERIAL_ALTERA_JTAGUART is not set
-# CONFIG_SERIAL_ALTERA_UART is not set
-# CONFIG_SERIAL_XILINX_PS_UART is not set
-# CONFIG_TTY_PRINTK is not set
-# CONFIG_IPMI_HANDLER is not set
-# CONFIG_HW_RANDOM is not set
-# CONFIG_NVRAM is not set
-# CONFIG_RTC is not set
-# CONFIG_GEN_RTC is not set
-# CONFIG_R3964 is not set
-# CONFIG_MWAVE is not set
-# CONFIG_PC8736x_GPIO is not set
-# CONFIG_NSC_GPIO is not set
-# CONFIG_HANGCHECK_TIMER is not set
-# CONFIG_RAMOOPS is not set
-# CONFIG_I2C is not set
-# CONFIG_SPI is not set
-
-#
-# PPS support
-#
-
-#
-# PPS generators support
-#
-
-#
-# PTP clock support
-#
-
-#
-# Enable Device Drivers -> PPS to see the PTP clock options.
-#
-CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=y
-# CONFIG_GPIOLIB is not set
-# CONFIG_W1 is not set
-# CONFIG_POWER_SUPPLY is not set
-# CONFIG_HWMON is not set
-# CONFIG_THERMAL is not set
-# CONFIG_WATCHDOG is not set
-CONFIG_SSB_POSSIBLE=y
-
-#
-# Sonics Silicon Backplane
-#
-# CONFIG_SSB is not set
-CONFIG_BCMA_POSSIBLE=y
-
-#
-# Broadcom specific AMBA
-#
-# CONFIG_BCMA is not set
-# CONFIG_MFD_SUPPORT is not set
-# CONFIG_REGULATOR is not set
-# CONFIG_MEDIA_SUPPORT is not set
-
-#
-# Graphics support
-#
-# CONFIG_DRM is not set
-# CONFIG_VGASTATE is not set
-# CONFIG_VIDEO_OUTPUT_CONTROL is not set
-# CONFIG_FB is not set
-# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
-
-#
-# Display device support
-#
-# CONFIG_DISPLAY_SUPPORT is not set
-# CONFIG_SOUND is not set
-# CONFIG_USB_SUPPORT is not set
-# CONFIG_MMC is not set
-# CONFIG_MEMSTICK is not set
-# CONFIG_NEW_LEDS is not set
-# CONFIG_NFC_DEVICES is not set
-# CONFIG_ACCESSIBILITY is not set
-# CONFIG_EDAC is not set
-# CONFIG_RTC_CLASS is not set
-# CONFIG_DMADEVICES is not set
-# CONFIG_AUXDISPLAY is not set
-# CONFIG_UIO is not set
-# CONFIG_STAGING is not set
-# CONFIG_X86_PLATFORM_DEVICES is not set
-CONFIG_CLKSRC_I8253=y
-
-#
-# Firmware Drivers
-#
-# CONFIG_EDD is not set
-# CONFIG_FIRMWARE_MEMMAP is not set
-# CONFIG_DELL_RBU is not set
-# CONFIG_DCDBAS is not set
-# CONFIG_ISCSI_IBFT_FIND is not set
-# CONFIG_GOOGLE_FIRMWARE is not set
-
-#
-# File systems
-#
-# CONFIG_FS_POSIX_ACL is not set
-# CONFIG_FILE_LOCKING is not set
-# CONFIG_FSNOTIFY is not set
-# CONFIG_DNOTIFY is not set
-# CONFIG_INOTIFY_USER is not set
-# CONFIG_FANOTIFY is not set
-# CONFIG_QUOTA is not set
-# CONFIG_QUOTACTL is not set
-# CONFIG_AUTOFS4_FS is not set
-# CONFIG_FUSE_FS is not set
-
-#
-# Caches
-#
-# CONFIG_FSCACHE is not set
-
-#
-# Pseudo filesystems
-#
-# CONFIG_PROC_FS is not set
-# CONFIG_SYSFS is not set
-# CONFIG_HUGETLBFS is not set
-# CONFIG_HUGETLB_PAGE is not set
-# CONFIG_CONFIGFS_FS is not set
-# CONFIG_MISC_FILESYSTEMS is not set
-# CONFIG_NLS is not set
-
-#
-# Kernel hacking
-#
-CONFIG_TRACE_IRQFLAGS_SUPPORT=y
-CONFIG_DEFAULT_MESSAGE_LOGLEVEL=4
-# CONFIG_ENABLE_WARN_DEPRECATED is not set
-# CONFIG_ENABLE_MUST_CHECK is not set
-CONFIG_FRAME_WARN=1024
-# CONFIG_MAGIC_SYSRQ is not set
-# CONFIG_STRIP_ASM_SYMS is not set
-# CONFIG_UNUSED_SYMBOLS is not set
-# CONFIG_DEBUG_FS is not set
-# CONFIG_HEADERS_CHECK is not set
-# CONFIG_DEBUG_SECTION_MISMATCH is not set
-# CONFIG_DEBUG_KERNEL is not set
-# CONFIG_HARDLOCKUP_DETECTOR is not set
-# CONFIG_SPARSE_RCU_POINTER is not set
-# CONFIG_DEBUG_MEMORY_INIT is not set
-CONFIG_ARCH_WANT_FRAME_POINTERS=y
-# CONFIG_FRAME_POINTER is not set
-CONFIG_USER_STACKTRACE_SUPPORT=y
-CONFIG_HAVE_FUNCTION_TRACER=y
-CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
-CONFIG_HAVE_FUNCTION_GRAPH_FP_TEST=y
-CONFIG_HAVE_FUNCTION_TRACE_MCOUNT_TEST=y
-CONFIG_HAVE_DYNAMIC_FTRACE=y
-CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
-CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
-CONFIG_HAVE_C_RECORDMCOUNT=y
-CONFIG_TRACING_SUPPORT=y
-# CONFIG_FTRACE is not set
-# CONFIG_DMA_API_DEBUG is not set
-# CONFIG_ATOMIC64_SELFTEST is not set
-# CONFIG_SAMPLES is not set
-CONFIG_HAVE_ARCH_KGDB=y
-CONFIG_HAVE_ARCH_KMEMCHECK=y
-# CONFIG_TEST_KSTRTOX is not set
-# CONFIG_STRICT_DEVMEM is not set
-# CONFIG_X86_VERBOSE_BOOTUP is not set
-# CONFIG_EARLY_PRINTK is not set
-# CONFIG_DOUBLEFAULT is not set
-# CONFIG_IOMMU_STRESS is not set
-CONFIG_HAVE_MMIOTRACE_SUPPORT=y
-CONFIG_IO_DELAY_TYPE_0X80=0
-CONFIG_IO_DELAY_TYPE_0XED=1
-CONFIG_IO_DELAY_TYPE_UDELAY=2
-CONFIG_IO_DELAY_TYPE_NONE=3
-CONFIG_IO_DELAY_0X80=y
-# CONFIG_IO_DELAY_0XED is not set
-# CONFIG_IO_DELAY_UDELAY is not set
-# CONFIG_IO_DELAY_NONE is not set
-CONFIG_DEFAULT_IO_DELAY_TYPE=0
-# CONFIG_OPTIMIZE_INLINING is not set
-
-#
-# Security options
-#
-# CONFIG_KEYS is not set
-# CONFIG_SECURITY_DMESG_RESTRICT is not set
-# CONFIG_SECURITYFS is not set
-CONFIG_DEFAULT_SECURITY_DAC=y
-CONFIG_DEFAULT_SECURITY=""
-# CONFIG_CRYPTO is not set
-CONFIG_HAVE_KVM=y
-# CONFIG_VIRTUALIZATION is not set
-# CONFIG_BINARY_PRINTF is not set
-
-#
-# Library routines
-#
-CONFIG_GENERIC_FIND_FIRST_BIT=y
-# CONFIG_CRC_CCITT is not set
-# CONFIG_CRC16 is not set
-# CONFIG_CRC_T10DIF is not set
-# CONFIG_CRC_ITU_T is not set
-# CONFIG_CRC32 is not set
-# CONFIG_CRC7 is not set
-# CONFIG_LIBCRC32C is not set
-# CONFIG_XZ_DEC is not set
-# CONFIG_XZ_DEC_BCJ is not set
-CONFIG_HAS_IOMEM=y
-CONFIG_HAS_IOPORT=y
-CONFIG_HAS_DMA=y
-# CONFIG_AVERAGE is not set
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny/ramfs.cfg b/meta/recipes-kernel/linux/linux-yocto-tiny/ramfs.cfg
deleted file mode 100644
index 96f4bd3..0000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny/ramfs.cfg
+++ /dev/null
@@ -1,6 +0,0 @@
-CONFIG_BLK_DEV=y
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_COUNT=1
-CONFIG_BLK_DEV_RAM_SIZE=6144
-
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny/rtc-pc.cfg b/meta/recipes-kernel/linux/linux-yocto-tiny/rtc-pc.cfg
deleted file mode 100644
index f667440..0000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny/rtc-pc.cfg
+++ /dev/null
@@ -1,13 +0,0 @@
-# Dependencies
-CONFIG_ACPI=y
-CONFIG_HPET=y
-CONFIG_HPET_TIMER=y
-
-CONFIG_HPET_EMULATE_RTC=y
-CONFIG_RTC_LIB=y
-CONFIG_RTC_CLASS=y
-CONFIG_RTC_HCTOSYS=y
-CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
-CONFIG_RTC_INTF_PROC=y
-CONFIG_RTC_INTF_DEV=y
-CONFIG_RTC_DRV_CMOS=y
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny/serial.cfg b/meta/recipes-kernel/linux/linux-yocto-tiny/serial.cfg
deleted file mode 100644
index 0a28dca..0000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny/serial.cfg
+++ /dev/null
@@ -1,7 +0,0 @@
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_8250_NR_UARTS=4
-CONFIG_SERIAL_8250_RUNTIME_UARTS=4
-# CONFIG_SERIAL_8250_EXTENDED is not set
-CONFIG_SERIAL_CORE=y
-CONFIG_SERIAL_CORE_CONSOLE=y
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny/smp.cfg b/meta/recipes-kernel/linux/linux-yocto-tiny/smp.cfg
deleted file mode 100644
index a82096e..0000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny/smp.cfg
+++ /dev/null
@@ -1,7 +0,0 @@
-# bzImage +104k
-CONFIG_HOTPLUG=y
-CONFIG_HOTPLUG_CPU=y
-CONFIG_SMP=y
-CONFIG_SCHED_SMT=y
-CONFIG_SCHED_MC=y
-
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
deleted file mode 100644
index e8bd633..0000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-inherit kernel
-require recipes-kernel/linux/linux-yocto.inc
-
-# We need lzma (as CONFIG_KERNEL_LZMA=y)
-DEPENDS += "xz-native"
-
-#KMACHINE = "yocto/standard/tiny/base"
-KMACHINE = "yocto/standard/base"
-KBRANCH = "${KMACHINE}"
-
-LINUX_VERSION ?= "3.0.24"
-
-SRCREV_machine ?= "da7c40006b08916ff3a3db104def82aaf9ac2716"
-SRCREV_meta ?= "a4ac64fe873f08ef718e2849b88914725dc99c1c"
-
-PR = "r3"
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta \
-           file://core.cfg \
-           file://serial.cfg \
-           file://ext2.cfg \
-           file://rtc-pc.cfg \
-           file://ramfs.cfg \
-           file://devtmpfs.cfg \
-           file://net.cfg \
-           file://debug.cfg \
-           file://lzma.cfg \
-           "
-
-
-# Enable qemux86 specific emulated options
-SRC_URI_append_qemux86 = " file://defconfig file://ata.cfg file://e1000.cfg"
-
-#COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
-COMPATIBLE_MACHINE = "(qemux86)"
-
-# Functionality flags
-KERNEL_FEATURES = ""
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
new file mode 100644
index 0000000..d2c8bf7
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
@@ -0,0 +1,25 @@
+inherit kernel
+require recipes-kernel/linux/linux-yocto.inc
+
+# We need lzma (as CONFIG_KERNEL_LZMA=y)
+DEPENDS += "xz-native"
+
+KMACHINE = "common-pc"
+KBRANCH = "standard/tiny"
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+LINUX_VERSION ?= "3.2.11"
+
+SRCREV_machine ?= "ec236058dc254183dbfb3744bf21f110c37af30b"
+SRCREV_meta ?= "59f350ec3794e19fa806c1b73749d851f8ebf364"
+
+PR = "r0"
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.2;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
+
+COMPATIBLE_MACHINE = "(qemux86)"
+
+# Functionality flags
+KERNEL_FEATURES = ""
-- 
1.7.5.4



