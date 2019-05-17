Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id D800C6D196
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 12:39:04 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id e13so6118323ljl.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 05:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GbzyaosTsdIOTkGrqCDy9TEemo27D3flV4lm0J2Plm8=;
	b=s1NcKwGxLWsZYP3mRT5getOu0Q2ImhqgSqcAGk/Padm5fzFKXxl/zoWWYaAAJXulzs
	jsSzApjkL31VhNvoZe/nu8tiWhjSZ3huZFy1ti0k1XAR81bHuVyN/OI5kxIYawgD6YoR
	oCyQicQo8pR8K1ctrBCdRoOsv9AgDXj4gveZuhXpdSDZECCi+CMi/Je9+mNkdg5fg7fh
	ehnJK5JHAmzph5J7vPxaCG1UF5RsFHcG0arcNkArY1UyWy7DrYJOzIkKNaOrDjni2wqc
	V+LXy9vxZ+QsCaqcRir8V5V+ZDkL4Tis7kNq5DTcM4acIoF8K8ymJAEBubTc4oN0as6/
	f/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GbzyaosTsdIOTkGrqCDy9TEemo27D3flV4lm0J2Plm8=;
	b=CPPT1ehkEu5Jbc3r+HZlLTeB7eT/bK5wNaWP68taAPCKpd6Fd8SekFX/rbHZOb3z34
	xrzMZa5zNZMjGF+kmTshuX//3F66zvgegMj0+I07o5t55H75UpHUWPBbcjmVLFe2SeYT
	kSI+0KzsuAefipQLVDvo0hZXRtMKofkm2ijRSGo5wg0g8vZ4Ge58zdYyS6oxoX4sxY+A
	f+b3v5JDpVDKQuaYd8dOV1raV3jl/frK5CwXSM5xgEhk8bBpt7JAc50Xf7auUeES++Iy
	ji6IyKwuqIK9Ywrt24/uOY5cyaPMLFGBlZrEm59S23aGgUgbGzARDFWUNU1zr0OFgJih
	2Cyw==
X-Gm-Message-State: APjAAAVL8pEDjCnZfp+usmsoj1Ox+klp/UQU4u05UgmsS6SsC+aESRCG
	GSfx96vKjhaKq0pQIh9DORg5JQQvarDJqhzBChw=
X-Google-Smtp-Source: APXvYqwdH7LS3zMz8cAVHyO6HxYnzbZdOxX2PK30l0l84Uk/B5v72cGB6Y9ZhjcMRnLW5GooQEpmZZXxVfcC7fo2TXc=
X-Received: by 2002:a2e:8446:: with SMTP id u6mr28238483ljh.71.1558096745156; 
	Fri, 17 May 2019 05:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190517040219.8946-1-naveen.kumar.saini@intel.com>
In-Reply-To: <20190517040219.8946-1-naveen.kumar.saini@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 17 May 2019 08:38:54 -0400
Message-ID: <CADkTA4O4gBERCW2tR9ses4UFYDGfNQauiGVsD-_vwGDPpikW1Q@mail.gmail.com>
To: Naveen Saini <naveen.kumar.saini@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][warrior][PATCH] lttng-modules: Fix build errors for kernel v5.1
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
X-List-Received-Date: Fri, 17 May 2019 12:39:05 -0000
Content-Type: multipart/alternative; boundary="00000000000005543d058914ab2c"

--00000000000005543d058914ab2c
Content-Type: text/plain; charset="UTF-8"

On Fri, May 17, 2019 at 12:08 AM Naveen Saini <naveen.kumar.saini@intel.com>
wrote:

> Backport patches from upstream to fix build errors when building with
> kernel v5.1.
>

When suggesting a backport like this, we should also be logging and showing
test results
that the newer support patches don't cause issues with older kernels.

That's why I typically do not backport support for various recipes for
kernels newer than
our reference in any given release. Those backports don't always carry zero
risk, and
there will always be a breaking point where kernels are just to new to work
with the
older releases.

Yes, this is just an offset of one version, but we should still be in the
habit of showing that
testing did include the reference versions (in this case 4.19 and 5.0).

Cheers,

Bruce



>
> Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> ---
>  ...-create-the-new-vm_fault_t-type-v5.1.patch |  66 +++++
>  ...rapper-definitions-for-obsolete-RCU..patch |  48 ++++
>  ...3-Fix-pipe-stop-using-can_merge-v5.1.patch |  43 +++
>  ...ert-KVM-MMU-show-mmu_valid_gen.-v5.1.patch |  52 ++++
>  ...-and-number-from-syscall_get_argumen.patch | 260 ++++++++++++++++++
>  .../lttng/lttng-modules_2.10.9.bb             |   5 +
>  6 files changed, 474 insertions(+)
>  create mode 100644
> meta/recipes-kernel/lttng/lttng-modules/0001-Fix-mm-create-the-new-vm_fault_t-type-v5.1.patch
>  create mode 100644
> meta/recipes-kernel/lttng/lttng-modules/0002-Fix-rcu-Remove-wrapper-definitions-for-obsolete-RCU..patch
>  create mode 100644
> meta/recipes-kernel/lttng/lttng-modules/0003-Fix-pipe-stop-using-can_merge-v5.1.patch
>  create mode 100644
> meta/recipes-kernel/lttng/lttng-modules/0004-Fix-Revert-KVM-MMU-show-mmu_valid_gen.-v5.1.patch
>  create mode 100644
> meta/recipes-kernel/lttng/lttng-modules/0005-Fix-Remove-start-and-number-from-syscall_get_argumen.patch
>
> diff --git
> a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-mm-create-the-new-vm_fault_t-type-v5.1.patch
> b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-mm-create-the-new-vm_fault_t-type-v5.1.patch
> new file mode 100644
> index 0000000000..12e32e8452
> --- /dev/null
> +++
> b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-mm-create-the-new-vm_fault_t-type-v5.1.patch
> @@ -0,0 +1,66 @@
> +From 55026979d71852aa2cf5e19bb4adb2db98affd1e Mon Sep 17 00:00:00 2001
> +From: Michael Jeanson <mjeanson@efficios.com>
> +Date: Mon, 18 Mar 2019 16:20:32 -0400
> +Subject: [PATCH 1/5] Fix: mm: create the new vm_fault_t type (v5.1)
> +
> +See upstream commit:
> +
> +  commit 3d3539018d2cbd12e5af4a132636ee7fd8d43ef0
> +  Author: Souptick Joarder <jrdr.linux@gmail.com>
> +  Date:   Thu Mar 7 16:31:14 2019 -0800
> +
> +    mm: create the new vm_fault_t type
> +
> +    Page fault handlers are supposed to return VM_FAULT codes, but some
> +    drivers/file systems mistakenly return error numbers.  Now that all
> +    drivers/file systems have been converted to use the vm_fault_t return
> +    type, change the type definition to no longer be compatible with
> 'int'.
> +    By making it an unsigned int, the function prototype becomes
> +    incompatible with a function which returns int.  Sparse will detect
> any
> +    attempts to return a value which is not a VM_FAULT code.
> +
> +    VM_FAULT_SET_HINDEX and VM_FAULT_GET_HINDEX values are changed to
> avoid
> +    conflict with other VM_FAULT codes.
> +
> +Upstream-Status: Backport [
> http://git.lttng.org/?p=lttng-modules.git;a=commit;h=2ca0c84f0b4a915c555a0b83102d94ac941619ca
> ]
> +
> +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> +Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> +---
> + lib/ringbuffer/ring_buffer_mmap.c | 12 +++++++++++-
> + 1 file changed, 11 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/ringbuffer/ring_buffer_mmap.c
> b/lib/ringbuffer/ring_buffer_mmap.c
> +index 4b1b7b3..6592a82 100644
> +--- a/lib/ringbuffer/ring_buffer_mmap.c
> ++++ b/lib/ringbuffer/ring_buffer_mmap.c
> +@@ -32,7 +32,11 @@
> + /*
> +  * fault() vm_op implementation for ring buffer file mapping.
> +  */
> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,1,0))
> ++static vm_fault_t lib_ring_buffer_fault_compat(struct vm_area_struct
> *vma, struct vm_fault *vmf)
> ++#else
> + static int lib_ring_buffer_fault_compat(struct vm_area_struct *vma,
> struct vm_fault *vmf)
> ++#endif
> + {
> +       struct lib_ring_buffer *buf = vma->vm_private_data;
> +       struct channel *chan = buf->backend.chan;
> +@@ -65,7 +69,13 @@ static int lib_ring_buffer_fault_compat(struct
> vm_area_struct *vma, struct vm_fa
> +       return 0;
> + }
> +
> +-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,11,0))
> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,1,0))
> ++static vm_fault_t lib_ring_buffer_fault(struct vm_fault *vmf)
> ++{
> ++      struct vm_area_struct *vma = vmf->vma;
> ++      return lib_ring_buffer_fault_compat(vma, vmf);
> ++}
> ++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,11,0))
> + static int lib_ring_buffer_fault(struct vm_fault *vmf)
> + {
> +       struct vm_area_struct *vma = vmf->vma;
> +--
> +2.17.0
> +
> diff --git
> a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-rcu-Remove-wrapper-definitions-for-obsolete-RCU..patch
> b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-rcu-Remove-wrapper-definitions-for-obsolete-RCU..patch
> new file mode 100644
> index 0000000000..9d7fcf217a
> --- /dev/null
> +++
> b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-rcu-Remove-wrapper-definitions-for-obsolete-RCU..patch
> @@ -0,0 +1,48 @@
> +From 68f073a5cdd89f905cb39895f5c2f160a6585672 Mon Sep 17 00:00:00 2001
> +From: Michael Jeanson <mjeanson@efficios.com>
> +Date: Mon, 18 Mar 2019 16:20:33 -0400
> +Subject: [PATCH 2/5] Fix: rcu: Remove wrapper definitions for obsolete
> RCU...
> + (v5.1)
> +
> +See upstream commit :
> +
> +commit 6ba7d681aca22e53385bdb35b1d7662e61905760
> +Author: Paul E. McKenney <paulmck@linux.ibm.com>
> +Date:   Wed Jan 9 15:22:03 2019 -0800
> +
> +    rcu: Remove wrapper definitions for obsolete RCU update functions
> +
> +    None of synchronize_rcu_bh, synchronize_rcu_bh_expedited, call_rcu_bh,
> +    rcu_barrier_bh, synchronize_sched, synchronize_sched_expedited,
> +    call_rcu_sched, rcu_barrier_sched, get_state_synchronize_sched, and
> +    cond_synchronize_sched are actually used.  This commit therefore
> removes
> +    their trivial wrapper-function definitions.
> +
> +Upstream-Status: Backport [
> http://git.lttng.org/?p=lttng-modules.git;a=commit;h=92da05ce1f73488a57e7fd79e9c03113cefdb76f
> ]
> +
> +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> +Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> +---
> + lttng-events.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/lttng-events.c b/lttng-events.c
> +index 47431ca..3481bd4 100644
> +--- a/lttng-events.c
> ++++ b/lttng-events.c
> +@@ -89,7 +89,12 @@ int _lttng_field_statedump(struct lttng_session
> *session,
> +
> + void synchronize_trace(void)
> + {
> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,1,0))
> ++      synchronize_rcu();
> ++#else
> +       synchronize_sched();
> ++#endif
> ++
> + #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,4,0))
> + #ifdef CONFIG_PREEMPT_RT_FULL
> +       synchronize_rcu();
> +--
> +2.17.0
> +
> diff --git
> a/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-pipe-stop-using-can_merge-v5.1.patch
> b/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-pipe-stop-using-can_merge-v5.1.patch
> new file mode 100644
> index 0000000000..bc028537fd
> --- /dev/null
> +++
> b/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-pipe-stop-using-can_merge-v5.1.patch
> @@ -0,0 +1,43 @@
> +From 9a203973ad3cbefb67a6032fd66e746d19b2d1c3 Mon Sep 17 00:00:00 2001
> +From: Michael Jeanson <mjeanson@efficios.com>
> +Date: Mon, 18 Mar 2019 16:20:34 -0400
> +Subject: [PATCH 3/5] Fix: pipe: stop using ->can_merge (v5.1)
> +
> +See upstream commit:
> +
> +  commit 01e7187b41191376cee8bea8de9f907b001e87b4
> +  Author: Jann Horn <jannh@google.com>
> +  Date:   Wed Jan 23 15:19:18 2019 +0100
> +
> +    pipe: stop using ->can_merge
> +
> +    Al Viro pointed out that since there is only one pipe buffer type to
> which
> +    new data can be appended, it isn't necessary to have a ->can_merge
> field in
> +    struct pipe_buf_operations, we can just check for a magic type.
> +
> +Upstream-Status: Backport [
> http://git.lttng.org/?p=lttng-modules.git;a=commit;h=d6cd2c9598a06f0ba1ba885bbe754e8836528310
> ]
> +
> +Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
> +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> +Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> +---
> + lib/ringbuffer/ring_buffer_splice.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/lib/ringbuffer/ring_buffer_splice.c
> b/lib/ringbuffer/ring_buffer_splice.c
> +index 8d14666..93cad29 100644
> +--- a/lib/ringbuffer/ring_buffer_splice.c
> ++++ b/lib/ringbuffer/ring_buffer_splice.c
> +@@ -56,7 +56,9 @@ static void lib_ring_buffer_pipe_buf_release(struct
> pipe_inode_info *pipe,
> + }
> +
> + static const struct pipe_buf_operations ring_buffer_pipe_buf_ops = {
> ++#if (LINUX_VERSION_CODE < KERNEL_VERSION(5,1,0))
> +       .can_merge = 0,
> ++#endif
> + #if (LINUX_VERSION_CODE < KERNEL_VERSION(3,15,0))
> +       .map = generic_pipe_buf_map,
> +       .unmap = generic_pipe_buf_unmap,
> +--
> +2.17.0
> +
> diff --git
> a/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-Revert-KVM-MMU-show-mmu_valid_gen.-v5.1.patch
> b/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-Revert-KVM-MMU-show-mmu_valid_gen.-v5.1.patch
> new file mode 100644
> index 0000000000..0e0ab76509
> --- /dev/null
> +++
> b/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-Revert-KVM-MMU-show-mmu_valid_gen.-v5.1.patch
> @@ -0,0 +1,52 @@
> +From f65f074de41fcc2c176397d54947f5ae2104671b Mon Sep 17 00:00:00 2001
> +From: Michael Jeanson <mjeanson@efficios.com>
> +Date: Mon, 18 Mar 2019 16:20:35 -0400
> +Subject: [PATCH 4/5] Fix: Revert "KVM: MMU: show mmu_valid_gen..." (v5.1)
> +
> +See upstream commit :
> +
> +  commit b59c4830ca185ba0e9f9e046fb1cd10a4a92627a
> +  Author: Sean Christopherson <sean.j.christopherson@intel.com>
> +  Date:   Tue Feb 5 13:01:30 2019 -0800
> +
> +    Revert "KVM: MMU: show mmu_valid_gen in shadow page related
> tracepoints"
> +
> +    ...as part of removing x86 KVM's fast invalidate mechanism, i.e. this
> +    is one part of a revert all patches from the series that introduced
> the
> +    mechanism[1].
> +
> +    This reverts commit 2248b023219251908aedda0621251cffc548f258.
> +
> +Upstream-Status: Backport [
> http://git.lttng.org/?p=lttng-modules.git;a=commit;h=8a88382fb09bbeda443044ee8cdb8f92040636bc
> ]
> +
> +Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
> +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> +Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> +---
> + .../events/lttng-module/arch/x86/kvm/mmutrace.h        | 10 +++++++++-
> + 1 file changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/instrumentation/events/lttng-module/arch/x86/kvm/mmutrace.h
> b/instrumentation/events/lttng-module/arch/x86/kvm/mmutrace.h
> +index e3f7abd..71e8b34 100644
> +--- a/instrumentation/events/lttng-module/arch/x86/kvm/mmutrace.h
> ++++ b/instrumentation/events/lttng-module/arch/x86/kvm/mmutrace.h
> +@@ -13,7 +13,15 @@
> + #undef TRACE_SYSTEM
> + #define TRACE_SYSTEM kvm_mmu
> +
> +-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,11,0))
> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,1,0))
> ++
> ++#define LTTNG_KVM_MMU_PAGE_FIELDS \
> ++      ctf_integer(__u64, gfn, (sp)->gfn) \
> ++      ctf_integer(__u32, role, (sp)->role.word) \
> ++      ctf_integer(__u32, root_count, (sp)->root_count) \
> ++      ctf_integer(bool, unsync, (sp)->unsync)
> ++
> ++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,11,0))
> +
> + #define LTTNG_KVM_MMU_PAGE_FIELDS \
> +       ctf_integer(unsigned long, mmu_valid_gen, (sp)->mmu_valid_gen) \
> +--
> +2.17.0
> +
> diff --git
> a/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-Remove-start-and-number-from-syscall_get_argumen.patch
> b/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-Remove-start-and-number-from-syscall_get_argumen.patch
> new file mode 100644
> index 0000000000..53583abaa0
> --- /dev/null
> +++
> b/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-Remove-start-and-number-from-syscall_get_argumen.patch
> @@ -0,0 +1,260 @@
> +From bd3fb656df0fedb0f87d1ef3690260a1d4b135e5 Mon Sep 17 00:00:00 2001
> +From: Michael Jeanson <mjeanson@efficios.com>
> +Date: Tue, 9 Apr 2019 14:12:41 -0400
> +Subject: [PATCH 5/5] Fix: Remove start and number from
> syscall_get_arguments()
> + args (v5.1)
> +
> +  commit b35f549df1d7520d37ba1e6d4a8d4df6bd52d136
> +  Author: Steven Rostedt (Red Hat) <rostedt@goodmis.org>
> +  Date:   Mon Nov 7 16:26:37 2016 -0500
> +
> +    syscalls: Remove start and number from syscall_get_arguments() args
> +
> +    At Linux Plumbers, Andy Lutomirski approached me and pointed out that
> the
> +    function call syscall_get_arguments() implemented in x86 was horribly
> +    written and not optimized for the standard case of passing in 0 and 6
> for
> +    the starting index and the number of system calls to get. When
> looking at
> +    all the users of this function, I discovered that all instances pass
> in only
> +    0 and 6 for these arguments. Instead of having this function handle
> +    different cases that are never used, simply rewrite it to return the
> first 6
> +    arguments of a system call.
> +
> +    This should help out the performance of tracing system calls by
> ptrace,
> +    ftrace and perf.
> +
> +    Link: http://lkml.kernel.org/r/20161107213233.754809394@goodmis.org
> +
> +Upstream-Status: Backport [
> http://git.lttng.org/?p=lttng-modules.git;a=commit;h=1b7b9c650ebb94358365512199559b0ece3e657c
> ]
> +
> +Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
> +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> +Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> +---
> + lttng-syscalls.c  | 57 ++++++++++++++++++++++++-----------------------
> + wrapper/syscall.h | 34 ++++++++++++++++++++++++++++
> + 2 files changed, 63 insertions(+), 28 deletions(-)
> + create mode 100644 wrapper/syscall.h
> +
> +diff --git a/lttng-syscalls.c b/lttng-syscalls.c
> +index 0b980a1..c9dc275 100644
> +--- a/lttng-syscalls.c
> ++++ b/lttng-syscalls.c
> +@@ -38,6 +38,7 @@
> + #include <wrapper/tracepoint.h>
> + #include <wrapper/file.h>
> + #include <wrapper/rcu.h>
> ++#include <wrapper/syscall.h>
> + #include <lttng-events.h>
> +
> + #ifndef CONFIG_COMPAT
> +@@ -374,9 +375,9 @@ struct lttng_syscall_filter {
> + static void syscall_entry_unknown(struct lttng_event *event,
> +       struct pt_regs *regs, unsigned int id)
> + {
> +-      unsigned long args[UNKNOWN_SYSCALL_NRARGS];
> ++      unsigned long args[LTTNG_SYSCALL_NR_ARGS];
> +
> +-      syscall_get_arguments(current, regs, 0, UNKNOWN_SYSCALL_NRARGS,
> args);
> ++      lttng_syscall_get_arguments(current, regs, args);
> +       if (unlikely(in_compat_syscall()))
> +               __event_probe__compat_syscall_entry_unknown(event, id,
> args);
> +       else
> +@@ -445,9 +446,9 @@ void syscall_entry_probe(void *__data, struct pt_regs
> *regs, long id)
> +       case 1:
> +       {
> +               void (*fptr)(void *__data, unsigned long arg0) =
> entry->func;
> +-              unsigned long args[1];
> ++              unsigned long args[LTTNG_SYSCALL_NR_ARGS];
> +
> +-              syscall_get_arguments(current, regs, 0, entry->nrargs,
> args);
> ++              lttng_syscall_get_arguments(current, regs, args);
> +               fptr(event, args[0]);
> +               break;
> +       }
> +@@ -456,9 +457,9 @@ void syscall_entry_probe(void *__data, struct pt_regs
> *regs, long id)
> +               void (*fptr)(void *__data,
> +                       unsigned long arg0,
> +                       unsigned long arg1) = entry->func;
> +-              unsigned long args[2];
> ++              unsigned long args[LTTNG_SYSCALL_NR_ARGS];
> +
> +-              syscall_get_arguments(current, regs, 0, entry->nrargs,
> args);
> ++              lttng_syscall_get_arguments(current, regs, args);
> +               fptr(event, args[0], args[1]);
> +               break;
> +       }
> +@@ -468,9 +469,9 @@ void syscall_entry_probe(void *__data, struct pt_regs
> *regs, long id)
> +                       unsigned long arg0,
> +                       unsigned long arg1,
> +                       unsigned long arg2) = entry->func;
> +-              unsigned long args[3];
> ++              unsigned long args[LTTNG_SYSCALL_NR_ARGS];
> +
> +-              syscall_get_arguments(current, regs, 0, entry->nrargs,
> args);
> ++              lttng_syscall_get_arguments(current, regs, args);
> +               fptr(event, args[0], args[1], args[2]);
> +               break;
> +       }
> +@@ -481,9 +482,9 @@ void syscall_entry_probe(void *__data, struct pt_regs
> *regs, long id)
> +                       unsigned long arg1,
> +                       unsigned long arg2,
> +                       unsigned long arg3) = entry->func;
> +-              unsigned long args[4];
> ++              unsigned long args[LTTNG_SYSCALL_NR_ARGS];
> +
> +-              syscall_get_arguments(current, regs, 0, entry->nrargs,
> args);
> ++              lttng_syscall_get_arguments(current, regs, args);
> +               fptr(event, args[0], args[1], args[2], args[3]);
> +               break;
> +       }
> +@@ -495,9 +496,9 @@ void syscall_entry_probe(void *__data, struct pt_regs
> *regs, long id)
> +                       unsigned long arg2,
> +                       unsigned long arg3,
> +                       unsigned long arg4) = entry->func;
> +-              unsigned long args[5];
> ++              unsigned long args[LTTNG_SYSCALL_NR_ARGS];
> +
> +-              syscall_get_arguments(current, regs, 0, entry->nrargs,
> args);
> ++              lttng_syscall_get_arguments(current, regs, args);
> +               fptr(event, args[0], args[1], args[2], args[3], args[4]);
> +               break;
> +       }
> +@@ -510,9 +511,9 @@ void syscall_entry_probe(void *__data, struct pt_regs
> *regs, long id)
> +                       unsigned long arg3,
> +                       unsigned long arg4,
> +                       unsigned long arg5) = entry->func;
> +-              unsigned long args[6];
> ++              unsigned long args[LTTNG_SYSCALL_NR_ARGS];
> +
> +-              syscall_get_arguments(current, regs, 0, entry->nrargs,
> args);
> ++              lttng_syscall_get_arguments(current, regs, args);
> +               fptr(event, args[0], args[1], args[2],
> +                       args[3], args[4], args[5]);
> +               break;
> +@@ -525,9 +526,9 @@ void syscall_entry_probe(void *__data, struct pt_regs
> *regs, long id)
> + static void syscall_exit_unknown(struct lttng_event *event,
> +       struct pt_regs *regs, int id, long ret)
> + {
> +-      unsigned long args[UNKNOWN_SYSCALL_NRARGS];
> ++      unsigned long args[LTTNG_SYSCALL_NR_ARGS];
> +
> +-      syscall_get_arguments(current, regs, 0, UNKNOWN_SYSCALL_NRARGS,
> args);
> ++      lttng_syscall_get_arguments(current, regs, args);
> +       if (unlikely(in_compat_syscall()))
> +               __event_probe__compat_syscall_exit_unknown(event, id, ret,
> +                       args);
> +@@ -601,9 +602,9 @@ void syscall_exit_probe(void *__data, struct pt_regs
> *regs, long ret)
> +               void (*fptr)(void *__data,
> +                       long ret,
> +                       unsigned long arg0) = entry->func;
> +-              unsigned long args[1];
> ++              unsigned long args[LTTNG_SYSCALL_NR_ARGS];
> +
> +-              syscall_get_arguments(current, regs, 0, entry->nrargs,
> args);
> ++              lttng_syscall_get_arguments(current, regs, args);
> +               fptr(event, ret, args[0]);
> +               break;
> +       }
> +@@ -613,9 +614,9 @@ void syscall_exit_probe(void *__data, struct pt_regs
> *regs, long ret)
> +                       long ret,
> +                       unsigned long arg0,
> +                       unsigned long arg1) = entry->func;
> +-              unsigned long args[2];
> ++              unsigned long args[LTTNG_SYSCALL_NR_ARGS];
> +
> +-              syscall_get_arguments(current, regs, 0, entry->nrargs,
> args);
> ++              lttng_syscall_get_arguments(current, regs, args);
> +               fptr(event, ret, args[0], args[1]);
> +               break;
> +       }
> +@@ -626,9 +627,9 @@ void syscall_exit_probe(void *__data, struct pt_regs
> *regs, long ret)
> +                       unsigned long arg0,
> +                       unsigned long arg1,
> +                       unsigned long arg2) = entry->func;
> +-              unsigned long args[3];
> ++              unsigned long args[LTTNG_SYSCALL_NR_ARGS];
> +
> +-              syscall_get_arguments(current, regs, 0, entry->nrargs,
> args);
> ++              lttng_syscall_get_arguments(current, regs, args);
> +               fptr(event, ret, args[0], args[1], args[2]);
> +               break;
> +       }
> +@@ -640,9 +641,9 @@ void syscall_exit_probe(void *__data, struct pt_regs
> *regs, long ret)
> +                       unsigned long arg1,
> +                       unsigned long arg2,
> +                       unsigned long arg3) = entry->func;
> +-              unsigned long args[4];
> ++              unsigned long args[LTTNG_SYSCALL_NR_ARGS];
> +
> +-              syscall_get_arguments(current, regs, 0, entry->nrargs,
> args);
> ++              lttng_syscall_get_arguments(current, regs, args);
> +               fptr(event, ret, args[0], args[1], args[2], args[3]);
> +               break;
> +       }
> +@@ -655,9 +656,9 @@ void syscall_exit_probe(void *__data, struct pt_regs
> *regs, long ret)
> +                       unsigned long arg2,
> +                       unsigned long arg3,
> +                       unsigned long arg4) = entry->func;
> +-              unsigned long args[5];
> ++              unsigned long args[LTTNG_SYSCALL_NR_ARGS];
> +
> +-              syscall_get_arguments(current, regs, 0, entry->nrargs,
> args);
> ++              lttng_syscall_get_arguments(current, regs, args);
> +               fptr(event, ret, args[0], args[1], args[2], args[3],
> args[4]);
> +               break;
> +       }
> +@@ -671,9 +672,9 @@ void syscall_exit_probe(void *__data, struct pt_regs
> *regs, long ret)
> +                       unsigned long arg3,
> +                       unsigned long arg4,
> +                       unsigned long arg5) = entry->func;
> +-              unsigned long args[6];
> ++              unsigned long args[LTTNG_SYSCALL_NR_ARGS];
> +
> +-              syscall_get_arguments(current, regs, 0, entry->nrargs,
> args);
> ++              lttng_syscall_get_arguments(current, regs, args);
> +               fptr(event, ret, args[0], args[1], args[2],
> +                       args[3], args[4], args[5]);
> +               break;
> +diff --git a/wrapper/syscall.h b/wrapper/syscall.h
> +new file mode 100644
> +index 0000000..8715f0c
> +--- /dev/null
> ++++ b/wrapper/syscall.h
> +@@ -0,0 +1,34 @@
> ++/* SPDX-License-Identifier: (GPL-2.0 or LGPL-2.1)
> ++ *
> ++ * wrapper/syscall.h
> ++ *
> ++ * wrapper around asm/syscall.h.
> ++ *
> ++ * Copyright (C) 2019 Michael Jeanson <mjeanson@efficios.com>
> ++ */
> ++
> ++#ifndef _LTTNG_WRAPPER_SYSCALL_H
> ++#define _LTTNG_WRAPPER_SYSCALL_H
> ++
> ++#include <asm/syscall.h>
> ++#include <lttng-kernel-version.h>
> ++
> ++#define LTTNG_SYSCALL_NR_ARGS 6
> ++
> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,1,0))
> ++
> ++#define lttng_syscall_get_arguments(task, regs, args) \
> ++      syscall_get_arguments(task, regs, args)
> ++
> ++#else /* LINUX_VERSION_CODE >= KERNEL_VERSION(5,1,0) */
> ++
> ++static inline
> ++void lttng_syscall_get_arguments(struct task_struct *task,
> ++              struct pt_regs *regs, unsigned long *args)
> ++{
> ++      syscall_get_arguments(task, regs, 0, LTTNG_SYSCALL_NR_ARGS, args);
> ++}
> ++
> ++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(5,1,0) */
> ++
> ++#endif /* _LTTNG_WRAPPER_SYSCALL_H */
> +--
> +2.17.0
> +
> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
> b/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
> index 70a6843263..417c8b1724 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
> @@ -15,6 +15,11 @@ COMPATIBLE_HOST =
> '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm|riscv).*-linux'
>  SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
>
> file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
>             file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
> +           file://0001-Fix-mm-create-the-new-vm_fault_t-type-v5.1.patch \
> +
>  file://0002-Fix-rcu-Remove-wrapper-definitions-for-obsolete-RCU..patch \
> +           file://0003-Fix-pipe-stop-using-can_merge-v5.1.patch \
> +           file://0004-Fix-Revert-KVM-MMU-show-mmu_valid_gen.-v5.1.patch \
> +
>  file://0005-Fix-Remove-start-and-number-from-syscall_get_argumen.patch \
>             "
>
>  SRC_URI[md5sum] = "09df0ac2e8f245740a2f32411d10c0d1"
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000005543d058914ab2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, May 17, 2019 at 12:08 AM Naveen Saini &lt;<=
a href=3D"mailto:naveen.kumar.saini@intel.com">naveen.kumar.saini@intel.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Backport patches from upstream to fix build errors when building with<br>
kernel v5.1.<br></blockquote><div><br></div><div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">When suggesting a backport like this, we shoul=
d also be logging and showing test results</div><div class=3D"gmail_default=
" style=3D"font-size:small">that the newer support patches don&#39;t cause =
issues with older kernels.</div><div class=3D"gmail_default" style=3D"font-=
size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">That&#39;s why I typically do not backport support for various recipes fo=
r kernels newer than</div><div class=3D"gmail_default" style=3D"font-size:s=
mall">our reference in any given release. Those backports don&#39;t always =
carry zero risk, and=C2=A0</div><div class=3D"gmail_default" style=3D"font-=
size:small">there will always be a breaking point where kernels are just to=
 new to work with the</div><div class=3D"gmail_default" style=3D"font-size:=
small">older releases.</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Ye=
s, this is just an offset of one version, but we should still be in the hab=
it of showing that</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">testing did include the reference versions (in this case 4.19 and 5.0).=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">Cheers,</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Naveen Saini &lt;<a href=3D"mailto:naveen.kumar.saini@intel.=
com" target=3D"_blank">naveen.kumar.saini@intel.com</a>&gt;<br>
---<br>
=C2=A0...-create-the-new-vm_fault_t-type-v5.1.patch |=C2=A0 66 +++++<br>
=C2=A0...rapper-definitions-for-obsolete-RCU..patch |=C2=A0 48 ++++<br>
=C2=A0...3-Fix-pipe-stop-using-can_merge-v5.1.patch |=C2=A0 43 +++<br>
=C2=A0...ert-KVM-MMU-show-mmu_valid_gen.-v5.1.patch |=C2=A0 52 ++++<br>
=C2=A0...-and-number-from-syscall_get_argumen.patch | 260 +++++++++++++++++=
+<br>
=C2=A0.../lttng/<a href=3D"http://lttng-modules_2.10.9.bb" rel=3D"noreferre=
r" target=3D"_blank">lttng-modules_2.10.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
=C2=A06 files changed, 474 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-m=
m-create-the-new-vm_fault_t-type-v5.1.patch<br>
=C2=A0create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-r=
cu-Remove-wrapper-definitions-for-obsolete-RCU..patch<br>
=C2=A0create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-Fix-p=
ipe-stop-using-can_merge-v5.1.patch<br>
=C2=A0create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-Fix-R=
evert-KVM-MMU-show-mmu_valid_gen.-v5.1.patch<br>
=C2=A0create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-Fix-R=
emove-start-and-number-from-syscall_get_argumen.patch<br>
<br>
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-mm-create-the=
-new-vm_fault_t-type-v5.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0=
001-Fix-mm-create-the-new-vm_fault_t-type-v5.1.patch<br>
new file mode 100644<br>
index 0000000000..12e32e8452<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-mm-create-the-new-vm=
_fault_t-type-v5.1.patch<br>
@@ -0,0 +1,66 @@<br>
+From 55026979d71852aa2cf5e19bb4adb2db98affd1e Mon Sep 17 00:00:00 2001<br>
+From: Michael Jeanson &lt;<a href=3D"mailto:mjeanson@efficios.com" target=
=3D"_blank">mjeanson@efficios.com</a>&gt;<br>
+Date: Mon, 18 Mar 2019 16:20:32 -0400<br>
+Subject: [PATCH 1/5] Fix: mm: create the new vm_fault_t type (v5.1)<br>
+<br>
+See upstream commit:<br>
+<br>
+=C2=A0 commit 3d3539018d2cbd12e5af4a132636ee7fd8d43ef0<br>
+=C2=A0 Author: Souptick Joarder &lt;<a href=3D"mailto:jrdr.linux@gmail.com=
" target=3D"_blank">jrdr.linux@gmail.com</a>&gt;<br>
+=C2=A0 Date:=C2=A0 =C2=A0Thu Mar 7 16:31:14 2019 -0800<br>
+<br>
+=C2=A0 =C2=A0 mm: create the new vm_fault_t type<br>
+<br>
+=C2=A0 =C2=A0 Page fault handlers are supposed to return VM_FAULT codes, b=
ut some<br>
+=C2=A0 =C2=A0 drivers/file systems mistakenly return error numbers.=C2=A0 =
Now that all<br>
+=C2=A0 =C2=A0 drivers/file systems have been converted to use the vm_fault=
_t return<br>
+=C2=A0 =C2=A0 type, change the type definition to no longer be compatible =
with &#39;int&#39;.<br>
+=C2=A0 =C2=A0 By making it an unsigned int, the function prototype becomes=
<br>
+=C2=A0 =C2=A0 incompatible with a function which returns int.=C2=A0 Sparse=
 will detect any<br>
+=C2=A0 =C2=A0 attempts to return a value which is not a VM_FAULT code.<br>
+<br>
+=C2=A0 =C2=A0 VM_FAULT_SET_HINDEX and VM_FAULT_GET_HINDEX values are chang=
ed to avoid<br>
+=C2=A0 =C2=A0 conflict with other VM_FAULT codes.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"http://git.lttng.org/?p=3Dlttng-modu=
les.git;a=3Dcommit;h=3D2ca0c84f0b4a915c555a0b83102d94ac941619ca" rel=3D"nor=
eferrer" target=3D"_blank">http://git.lttng.org/?p=3Dlttng-modules.git;a=3D=
commit;h=3D2ca0c84f0b4a915c555a0b83102d94ac941619ca</a>]<br>
+<br>
+Signed-off-by: Mathieu Desnoyers &lt;<a href=3D"mailto:mathieu.desnoyers@e=
fficios.com" target=3D"_blank">mathieu.desnoyers@efficios.com</a>&gt;<br>
+Signed-off-by: Naveen Saini &lt;<a href=3D"mailto:naveen.kumar.saini@intel=
.com" target=3D"_blank">naveen.kumar.saini@intel.com</a>&gt;<br>
+---<br>
+ lib/ringbuffer/ring_buffer_mmap.c | 12 +++++++++++-<br>
+ 1 file changed, 11 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/lib/ringbuffer/ring_buffer_mmap.c b/lib/ringbuffer/ring_buffe=
r_mmap.c<br>
+index 4b1b7b3..6592a82 100644<br>
+--- a/lib/ringbuffer/ring_buffer_mmap.c<br>
++++ b/lib/ringbuffer/ring_buffer_mmap.c<br>
+@@ -32,7 +32,11 @@<br>
+ /*<br>
+=C2=A0 * fault() vm_op implementation for ring buffer file mapping.<br>
+=C2=A0 */<br>
++#if (LINUX_VERSION_CODE &gt;=3D KERNEL_VERSION(5,1,0))<br>
++static vm_fault_t lib_ring_buffer_fault_compat(struct vm_area_struct *vma=
, struct vm_fault *vmf)<br>
++#else<br>
+ static int lib_ring_buffer_fault_compat(struct vm_area_struct *vma, struc=
t vm_fault *vmf)<br>
++#endif<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lib_ring_buffer *buf =3D vma-&gt;vm_priv=
ate_data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct channel *chan =3D buf-&gt;backend.chan;<=
br>
+@@ -65,7 +69,13 @@ static int lib_ring_buffer_fault_compat(struct vm_area_=
struct *vma, struct vm_fa<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+ }<br>
+ <br>
+-#if (LINUX_VERSION_CODE &gt;=3D KERNEL_VERSION(4,11,0))<br>
++#if (LINUX_VERSION_CODE &gt;=3D KERNEL_VERSION(5,1,0))<br>
++static vm_fault_t lib_ring_buffer_fault(struct vm_fault *vmf)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct vm_area_struct *vma =3D vmf-&gt;vma;<br>
++=C2=A0 =C2=A0 =C2=A0 return lib_ring_buffer_fault_compat(vma, vmf);<br>
++}<br>
++#elif (LINUX_VERSION_CODE &gt;=3D KERNEL_VERSION(4,11,0))<br>
+ static int lib_ring_buffer_fault(struct vm_fault *vmf)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vm_area_struct *vma =3D vmf-&gt;vma;<br>
+-- <br>
+2.17.0<br>
+<br>
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-rcu-Remove-wr=
apper-definitions-for-obsolete-RCU..patch b/meta/recipes-kernel/lttng/lttng=
-modules/0002-Fix-rcu-Remove-wrapper-definitions-for-obsolete-RCU..patch<br=
>
new file mode 100644<br>
index 0000000000..9d7fcf217a<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-rcu-Remove-wrapper-d=
efinitions-for-obsolete-RCU..patch<br>
@@ -0,0 +1,48 @@<br>
+From 68f073a5cdd89f905cb39895f5c2f160a6585672 Mon Sep 17 00:00:00 2001<br>
+From: Michael Jeanson &lt;<a href=3D"mailto:mjeanson@efficios.com" target=
=3D"_blank">mjeanson@efficios.com</a>&gt;<br>
+Date: Mon, 18 Mar 2019 16:20:33 -0400<br>
+Subject: [PATCH 2/5] Fix: rcu: Remove wrapper definitions for obsolete RCU=
...<br>
+ (v5.1)<br>
+<br>
+See upstream commit :<br>
+<br>
+commit 6ba7d681aca22e53385bdb35b1d7662e61905760<br>
+Author: Paul E. McKenney &lt;<a href=3D"mailto:paulmck@linux.ibm.com" targ=
et=3D"_blank">paulmck@linux.ibm.com</a>&gt;<br>
+Date:=C2=A0 =C2=A0Wed Jan 9 15:22:03 2019 -0800<br>
+<br>
+=C2=A0 =C2=A0 rcu: Remove wrapper definitions for obsolete RCU update func=
tions<br>
+<br>
+=C2=A0 =C2=A0 None of synchronize_rcu_bh, synchronize_rcu_bh_expedited, ca=
ll_rcu_bh,<br>
+=C2=A0 =C2=A0 rcu_barrier_bh, synchronize_sched, synchronize_sched_expedit=
ed,<br>
+=C2=A0 =C2=A0 call_rcu_sched, rcu_barrier_sched, get_state_synchronize_sch=
ed, and<br>
+=C2=A0 =C2=A0 cond_synchronize_sched are actually used.=C2=A0 This commit =
therefore removes<br>
+=C2=A0 =C2=A0 their trivial wrapper-function definitions.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"http://git.lttng.org/?p=3Dlttng-modu=
les.git;a=3Dcommit;h=3D92da05ce1f73488a57e7fd79e9c03113cefdb76f" rel=3D"nor=
eferrer" target=3D"_blank">http://git.lttng.org/?p=3Dlttng-modules.git;a=3D=
commit;h=3D92da05ce1f73488a57e7fd79e9c03113cefdb76f</a>]<br>
+<br>
+Signed-off-by: Mathieu Desnoyers &lt;<a href=3D"mailto:mathieu.desnoyers@e=
fficios.com" target=3D"_blank">mathieu.desnoyers@efficios.com</a>&gt;<br>
+Signed-off-by: Naveen Saini &lt;<a href=3D"mailto:naveen.kumar.saini@intel=
.com" target=3D"_blank">naveen.kumar.saini@intel.com</a>&gt;<br>
+---<br>
+ lttng-events.c | 5 +++++<br>
+ 1 file changed, 5 insertions(+)<br>
+<br>
+diff --git a/lttng-events.c b/lttng-events.c<br>
+index 47431ca..3481bd4 100644<br>
+--- a/lttng-events.c<br>
++++ b/lttng-events.c<br>
+@@ -89,7 +89,12 @@ int _lttng_field_statedump(struct lttng_session *sessio=
n,<br>
+ <br>
+ void synchronize_trace(void)<br>
+ {<br>
++#if (LINUX_VERSION_CODE &gt;=3D KERNEL_VERSION(5,1,0))<br>
++=C2=A0 =C2=A0 =C2=A0 synchronize_rcu();<br>
++#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0synchronize_sched();<br>
++#endif<br>
++<br>
+ #if (LINUX_VERSION_CODE &gt;=3D KERNEL_VERSION(3,4,0))<br>
+ #ifdef CONFIG_PREEMPT_RT_FULL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0synchronize_rcu();<br>
+-- <br>
+2.17.0<br>
+<br>
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-pipe-stop-usi=
ng-can_merge-v5.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-=
pipe-stop-using-can_merge-v5.1.patch<br>
new file mode 100644<br>
index 0000000000..bc028537fd<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-pipe-stop-using-can_=
merge-v5.1.patch<br>
@@ -0,0 +1,43 @@<br>
+From 9a203973ad3cbefb67a6032fd66e746d19b2d1c3 Mon Sep 17 00:00:00 2001<br>
+From: Michael Jeanson &lt;<a href=3D"mailto:mjeanson@efficios.com" target=
=3D"_blank">mjeanson@efficios.com</a>&gt;<br>
+Date: Mon, 18 Mar 2019 16:20:34 -0400<br>
+Subject: [PATCH 3/5] Fix: pipe: stop using -&gt;can_merge (v5.1)<br>
+<br>
+See upstream commit:<br>
+<br>
+=C2=A0 commit 01e7187b41191376cee8bea8de9f907b001e87b4<br>
+=C2=A0 Author: Jann Horn &lt;<a href=3D"mailto:jannh@google.com" target=3D=
"_blank">jannh@google.com</a>&gt;<br>
+=C2=A0 Date:=C2=A0 =C2=A0Wed Jan 23 15:19:18 2019 +0100<br>
+<br>
+=C2=A0 =C2=A0 pipe: stop using -&gt;can_merge<br>
+<br>
+=C2=A0 =C2=A0 Al Viro pointed out that since there is only one pipe buffer=
 type to which<br>
+=C2=A0 =C2=A0 new data can be appended, it isn&#39;t necessary to have a -=
&gt;can_merge field in<br>
+=C2=A0 =C2=A0 struct pipe_buf_operations, we can just check for a magic ty=
pe.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"http://git.lttng.org/?p=3Dlttng-modu=
les.git;a=3Dcommit;h=3Dd6cd2c9598a06f0ba1ba885bbe754e8836528310" rel=3D"nor=
eferrer" target=3D"_blank">http://git.lttng.org/?p=3Dlttng-modules.git;a=3D=
commit;h=3Dd6cd2c9598a06f0ba1ba885bbe754e8836528310</a>]<br>
+<br>
+Signed-off-by: Michael Jeanson &lt;<a href=3D"mailto:mjeanson@efficios.com=
" target=3D"_blank">mjeanson@efficios.com</a>&gt;<br>
+Signed-off-by: Mathieu Desnoyers &lt;<a href=3D"mailto:mathieu.desnoyers@e=
fficios.com" target=3D"_blank">mathieu.desnoyers@efficios.com</a>&gt;<br>
+Signed-off-by: Naveen Saini &lt;<a href=3D"mailto:naveen.kumar.saini@intel=
.com" target=3D"_blank">naveen.kumar.saini@intel.com</a>&gt;<br>
+---<br>
+ lib/ringbuffer/ring_buffer_splice.c | 2 ++<br>
+ 1 file changed, 2 insertions(+)<br>
+<br>
+diff --git a/lib/ringbuffer/ring_buffer_splice.c b/lib/ringbuffer/ring_buf=
fer_splice.c<br>
+index 8d14666..93cad29 100644<br>
+--- a/lib/ringbuffer/ring_buffer_splice.c<br>
++++ b/lib/ringbuffer/ring_buffer_splice.c<br>
+@@ -56,7 +56,9 @@ static void lib_ring_buffer_pipe_buf_release(struct pipe=
_inode_info *pipe,<br>
+ }<br>
+ <br>
+ static const struct pipe_buf_operations ring_buffer_pipe_buf_ops =3D {<br=
>
++#if (LINUX_VERSION_CODE &lt; KERNEL_VERSION(5,1,0))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.can_merge =3D 0,<br>
++#endif<br>
+ #if (LINUX_VERSION_CODE &lt; KERNEL_VERSION(3,15,0))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.map =3D generic_pipe_buf_map,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.unmap =3D generic_pipe_buf_unmap,<br>
+-- <br>
+2.17.0<br>
+<br>
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-Revert-KVM-MM=
U-show-mmu_valid_gen.-v5.1.patch b/meta/recipes-kernel/lttng/lttng-modules/=
0004-Fix-Revert-KVM-MMU-show-mmu_valid_gen.-v5.1.patch<br>
new file mode 100644<br>
index 0000000000..0e0ab76509<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-Revert-KVM-MMU-show-=
mmu_valid_gen.-v5.1.patch<br>
@@ -0,0 +1,52 @@<br>
+From f65f074de41fcc2c176397d54947f5ae2104671b Mon Sep 17 00:00:00 2001<br>
+From: Michael Jeanson &lt;<a href=3D"mailto:mjeanson@efficios.com" target=
=3D"_blank">mjeanson@efficios.com</a>&gt;<br>
+Date: Mon, 18 Mar 2019 16:20:35 -0400<br>
+Subject: [PATCH 4/5] Fix: Revert &quot;KVM: MMU: show mmu_valid_gen...&quo=
t; (v5.1)<br>
+<br>
+See upstream commit :<br>
+<br>
+=C2=A0 commit b59c4830ca185ba0e9f9e046fb1cd10a4a92627a<br>
+=C2=A0 Author: Sean Christopherson &lt;<a href=3D"mailto:sean.j.christophe=
rson@intel.com" target=3D"_blank">sean.j.christopherson@intel.com</a>&gt;<b=
r>
+=C2=A0 Date:=C2=A0 =C2=A0Tue Feb 5 13:01:30 2019 -0800<br>
+<br>
+=C2=A0 =C2=A0 Revert &quot;KVM: MMU: show mmu_valid_gen in shadow page rel=
ated tracepoints&quot;<br>
+<br>
+=C2=A0 =C2=A0 ...as part of removing x86 KVM&#39;s fast invalidate mechani=
sm, i.e. this<br>
+=C2=A0 =C2=A0 is one part of a revert all patches from the series that int=
roduced the<br>
+=C2=A0 =C2=A0 mechanism[1].<br>
+<br>
+=C2=A0 =C2=A0 This reverts commit 2248b023219251908aedda0621251cffc548f258=
.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"http://git.lttng.org/?p=3Dlttng-modu=
les.git;a=3Dcommit;h=3D8a88382fb09bbeda443044ee8cdb8f92040636bc" rel=3D"nor=
eferrer" target=3D"_blank">http://git.lttng.org/?p=3Dlttng-modules.git;a=3D=
commit;h=3D8a88382fb09bbeda443044ee8cdb8f92040636bc</a>]<br>
+<br>
+Signed-off-by: Michael Jeanson &lt;<a href=3D"mailto:mjeanson@efficios.com=
" target=3D"_blank">mjeanson@efficios.com</a>&gt;<br>
+Signed-off-by: Mathieu Desnoyers &lt;<a href=3D"mailto:mathieu.desnoyers@e=
fficios.com" target=3D"_blank">mathieu.desnoyers@efficios.com</a>&gt;<br>
+Signed-off-by: Naveen Saini &lt;<a href=3D"mailto:naveen.kumar.saini@intel=
.com" target=3D"_blank">naveen.kumar.saini@intel.com</a>&gt;<br>
+---<br>
+ .../events/lttng-module/arch/x86/kvm/mmutrace.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 10 +++++++++-<br>
+ 1 file changed, 9 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/instrumentation/events/lttng-module/arch/x86/kvm/mmutrace.h b=
/instrumentation/events/lttng-module/arch/x86/kvm/mmutrace.h<br>
+index e3f7abd..71e8b34 100644<br>
+--- a/instrumentation/events/lttng-module/arch/x86/kvm/mmutrace.h<br>
++++ b/instrumentation/events/lttng-module/arch/x86/kvm/mmutrace.h<br>
+@@ -13,7 +13,15 @@<br>
+ #undef TRACE_SYSTEM<br>
+ #define TRACE_SYSTEM kvm_mmu<br>
+ <br>
+-#if (LINUX_VERSION_CODE &gt;=3D KERNEL_VERSION(3,11,0))<br>
++#if (LINUX_VERSION_CODE &gt;=3D KERNEL_VERSION(5,1,0))<br>
++<br>
++#define LTTNG_KVM_MMU_PAGE_FIELDS \<br>
++=C2=A0 =C2=A0 =C2=A0 ctf_integer(__u64, gfn, (sp)-&gt;gfn) \<br>
++=C2=A0 =C2=A0 =C2=A0 ctf_integer(__u32, role, (sp)-&gt;role.word) \<br>
++=C2=A0 =C2=A0 =C2=A0 ctf_integer(__u32, root_count, (sp)-&gt;root_count) =
\<br>
++=C2=A0 =C2=A0 =C2=A0 ctf_integer(bool, unsync, (sp)-&gt;unsync)<br>
++<br>
++#elif (LINUX_VERSION_CODE &gt;=3D KERNEL_VERSION(3,11,0))<br>
+ <br>
+ #define LTTNG_KVM_MMU_PAGE_FIELDS \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctf_integer(unsigned long, mmu_valid_gen, (sp)-=
&gt;mmu_valid_gen) \<br>
+-- <br>
+2.17.0<br>
+<br>
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-Remove-start-=
and-number-from-syscall_get_argumen.patch b/meta/recipes-kernel/lttng/lttng=
-modules/0005-Fix-Remove-start-and-number-from-syscall_get_argumen.patch<br=
>
new file mode 100644<br>
index 0000000000..53583abaa0<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-Remove-start-and-num=
ber-from-syscall_get_argumen.patch<br>
@@ -0,0 +1,260 @@<br>
+From bd3fb656df0fedb0f87d1ef3690260a1d4b135e5 Mon Sep 17 00:00:00 2001<br>
+From: Michael Jeanson &lt;<a href=3D"mailto:mjeanson@efficios.com" target=
=3D"_blank">mjeanson@efficios.com</a>&gt;<br>
+Date: Tue, 9 Apr 2019 14:12:41 -0400<br>
+Subject: [PATCH 5/5] Fix: Remove start and number from syscall_get_argumen=
ts()<br>
+ args (v5.1)<br>
+<br>
+=C2=A0 commit b35f549df1d7520d37ba1e6d4a8d4df6bd52d136<br>
+=C2=A0 Author: Steven Rostedt (Red Hat) &lt;<a href=3D"mailto:rostedt@good=
mis.org" target=3D"_blank">rostedt@goodmis.org</a>&gt;<br>
+=C2=A0 Date:=C2=A0 =C2=A0Mon Nov 7 16:26:37 2016 -0500<br>
+<br>
+=C2=A0 =C2=A0 syscalls: Remove start and number from syscall_get_arguments=
() args<br>
+<br>
+=C2=A0 =C2=A0 At Linux Plumbers, Andy Lutomirski approached me and pointed=
 out that the<br>
+=C2=A0 =C2=A0 function call syscall_get_arguments() implemented in x86 was=
 horribly<br>
+=C2=A0 =C2=A0 written and not optimized for the standard case of passing i=
n 0 and 6 for<br>
+=C2=A0 =C2=A0 the starting index and the number of system calls to get. Wh=
en looking at<br>
+=C2=A0 =C2=A0 all the users of this function, I discovered that all instan=
ces pass in only<br>
+=C2=A0 =C2=A0 0 and 6 for these arguments. Instead of having this function=
 handle<br>
+=C2=A0 =C2=A0 different cases that are never used, simply rewrite it to re=
turn the first 6<br>
+=C2=A0 =C2=A0 arguments of a system call.<br>
+<br>
+=C2=A0 =C2=A0 This should help out the performance of tracing system calls=
 by ptrace,<br>
+=C2=A0 =C2=A0 ftrace and perf.<br>
+<br>
+=C2=A0 =C2=A0 Link: <a href=3D"http://lkml.kernel.org/r/20161107213233.754=
809394@goodmis.org" rel=3D"noreferrer" target=3D"_blank">http://lkml.kernel=
.org/r/20161107213233.754809394@goodmis.org</a><br>
+<br>
+Upstream-Status: Backport [<a href=3D"http://git.lttng.org/?p=3Dlttng-modu=
les.git;a=3Dcommit;h=3D1b7b9c650ebb94358365512199559b0ece3e657c" rel=3D"nor=
eferrer" target=3D"_blank">http://git.lttng.org/?p=3Dlttng-modules.git;a=3D=
commit;h=3D1b7b9c650ebb94358365512199559b0ece3e657c</a>]<br>
+<br>
+Signed-off-by: Michael Jeanson &lt;<a href=3D"mailto:mjeanson@efficios.com=
" target=3D"_blank">mjeanson@efficios.com</a>&gt;<br>
+Signed-off-by: Mathieu Desnoyers &lt;<a href=3D"mailto:mathieu.desnoyers@e=
fficios.com" target=3D"_blank">mathieu.desnoyers@efficios.com</a>&gt;<br>
+Signed-off-by: Naveen Saini &lt;<a href=3D"mailto:naveen.kumar.saini@intel=
.com" target=3D"_blank">naveen.kumar.saini@intel.com</a>&gt;<br>
+---<br>
+ lttng-syscalls.c=C2=A0 | 57 ++++++++++++++++++++++++---------------------=
--<br>
+ wrapper/syscall.h | 34 ++++++++++++++++++++++++++++<br>
+ 2 files changed, 63 insertions(+), 28 deletions(-)<br>
+ create mode 100644 wrapper/syscall.h<br>
+<br>
+diff --git a/lttng-syscalls.c b/lttng-syscalls.c<br>
+index 0b980a1..c9dc275 100644<br>
+--- a/lttng-syscalls.c<br>
++++ b/lttng-syscalls.c<br>
+@@ -38,6 +38,7 @@<br>
+ #include &lt;wrapper/tracepoint.h&gt;<br>
+ #include &lt;wrapper/file.h&gt;<br>
+ #include &lt;wrapper/rcu.h&gt;<br>
++#include &lt;wrapper/syscall.h&gt;<br>
+ #include &lt;lttng-events.h&gt;<br>
+ <br>
+ #ifndef CONFIG_COMPAT<br>
+@@ -374,9 +375,9 @@ struct lttng_syscall_filter {<br>
+ static void syscall_entry_unknown(struct lttng_event *event,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pt_regs *regs, unsigned int id)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 unsigned long args[UNKNOWN_SYSCALL_NRARGS];<br>
++=C2=A0 =C2=A0 =C2=A0 unsigned long args[LTTNG_SYSCALL_NR_ARGS];<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 syscall_get_arguments(current, regs, 0, UNKNOWN_SYSC=
ALL_NRARGS, args);<br>
++=C2=A0 =C2=A0 =C2=A0 lttng_syscall_get_arguments(current, regs, args);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlikely(in_compat_syscall()))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__event_probe__comp=
at_syscall_entry_unknown(event, id, args);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+@@ -445,9 +446,9 @@ void syscall_entry_probe(void *__data, struct pt_regs =
*regs, long id)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void (*fptr)(void *=
__data, unsigned long arg0) =3D entry-&gt;func;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long args[1];<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long args[LTTNG=
_SYSCALL_NR_ARGS];<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 syscall_get_arguments(cu=
rrent, regs, 0, entry-&gt;nrargs, args);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lttng_syscall_get_argume=
nts(current, regs, args);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fptr(event, args[0]=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -456,9 +457,9 @@ void syscall_entry_probe(void *__data, struct pt_regs =
*regs, long id)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void (*fptr)(void *=
__data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg1) =3D entry-&gt;func;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long args[2];<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long args[LTTNG=
_SYSCALL_NR_ARGS];<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 syscall_get_arguments(cu=
rrent, regs, 0, entry-&gt;nrargs, args);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lttng_syscall_get_argume=
nts(current, regs, args);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fptr(event, args[0]=
, args[1]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -468,9 +469,9 @@ void syscall_entry_probe(void *__data, struct pt_regs =
*regs, long id)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg2) =3D entry-&gt;func;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long args[3];<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long args[LTTNG=
_SYSCALL_NR_ARGS];<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 syscall_get_arguments(cu=
rrent, regs, 0, entry-&gt;nrargs, args);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lttng_syscall_get_argume=
nts(current, regs, args);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fptr(event, args[0]=
, args[1], args[2]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -481,9 +482,9 @@ void syscall_entry_probe(void *__data, struct pt_regs =
*regs, long id)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg3) =3D entry-&gt;func;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long args[4];<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long args[LTTNG=
_SYSCALL_NR_ARGS];<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 syscall_get_arguments(cu=
rrent, regs, 0, entry-&gt;nrargs, args);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lttng_syscall_get_argume=
nts(current, regs, args);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fptr(event, args[0]=
, args[1], args[2], args[3]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -495,9 +496,9 @@ void syscall_entry_probe(void *__data, struct pt_regs =
*regs, long id)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg3,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg4) =3D entry-&gt;func;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long args[5];<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long args[LTTNG=
_SYSCALL_NR_ARGS];<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 syscall_get_arguments(cu=
rrent, regs, 0, entry-&gt;nrargs, args);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lttng_syscall_get_argume=
nts(current, regs, args);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fptr(event, args[0]=
, args[1], args[2], args[3], args[4]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -510,9 +511,9 @@ void syscall_entry_probe(void *__data, struct pt_regs =
*regs, long id)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg3,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg5) =3D entry-&gt;func;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long args[6];<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long args[LTTNG=
_SYSCALL_NR_ARGS];<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 syscall_get_arguments(cu=
rrent, regs, 0, entry-&gt;nrargs, args);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lttng_syscall_get_argume=
nts(current, regs, args);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fptr(event, args[0]=
, args[1], args[2],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0args[3], args[4], args[5]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+@@ -525,9 +526,9 @@ void syscall_entry_probe(void *__data, struct pt_regs =
*regs, long id)<br>
+ static void syscall_exit_unknown(struct lttng_event *event,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pt_regs *regs, int id, long ret)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 unsigned long args[UNKNOWN_SYSCALL_NRARGS];<br>
++=C2=A0 =C2=A0 =C2=A0 unsigned long args[LTTNG_SYSCALL_NR_ARGS];<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 syscall_get_arguments(current, regs, 0, UNKNOWN_SYSC=
ALL_NRARGS, args);<br>
++=C2=A0 =C2=A0 =C2=A0 lttng_syscall_get_arguments(current, regs, args);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlikely(in_compat_syscall()))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__event_probe__comp=
at_syscall_exit_unknown(event, id, ret,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0args);<br>
+@@ -601,9 +602,9 @@ void syscall_exit_probe(void *__data, struct pt_regs *=
regs, long ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void (*fptr)(void *=
__data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0long ret,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg0) =3D entry-&gt;func;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long args[1];<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long args[LTTNG=
_SYSCALL_NR_ARGS];<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 syscall_get_arguments(cu=
rrent, regs, 0, entry-&gt;nrargs, args);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lttng_syscall_get_argume=
nts(current, regs, args);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fptr(event, ret, ar=
gs[0]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -613,9 +614,9 @@ void syscall_exit_probe(void *__data, struct pt_regs *=
regs, long ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0long ret,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg1) =3D entry-&gt;func;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long args[2];<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long args[LTTNG=
_SYSCALL_NR_ARGS];<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 syscall_get_arguments(cu=
rrent, regs, 0, entry-&gt;nrargs, args);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lttng_syscall_get_argume=
nts(current, regs, args);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fptr(event, ret, ar=
gs[0], args[1]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -626,9 +627,9 @@ void syscall_exit_probe(void *__data, struct pt_regs *=
regs, long ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg2) =3D entry-&gt;func;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long args[3];<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long args[LTTNG=
_SYSCALL_NR_ARGS];<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 syscall_get_arguments(cu=
rrent, regs, 0, entry-&gt;nrargs, args);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lttng_syscall_get_argume=
nts(current, regs, args);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fptr(event, ret, ar=
gs[0], args[1], args[2]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -640,9 +641,9 @@ void syscall_exit_probe(void *__data, struct pt_regs *=
regs, long ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg3) =3D entry-&gt;func;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long args[4];<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long args[LTTNG=
_SYSCALL_NR_ARGS];<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 syscall_get_arguments(cu=
rrent, regs, 0, entry-&gt;nrargs, args);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lttng_syscall_get_argume=
nts(current, regs, args);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fptr(event, ret, ar=
gs[0], args[1], args[2], args[3]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -655,9 +656,9 @@ void syscall_exit_probe(void *__data, struct pt_regs *=
regs, long ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg3,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg4) =3D entry-&gt;func;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long args[5];<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long args[LTTNG=
_SYSCALL_NR_ARGS];<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 syscall_get_arguments(cu=
rrent, regs, 0, entry-&gt;nrargs, args);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lttng_syscall_get_argume=
nts(current, regs, args);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fptr(event, ret, ar=
gs[0], args[1], args[2], args[3], args[4]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -671,9 +672,9 @@ void syscall_exit_probe(void *__data, struct pt_regs *=
regs, long ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg3,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long arg5) =3D entry-&gt;func;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long args[6];<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long args[LTTNG=
_SYSCALL_NR_ARGS];<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 syscall_get_arguments(cu=
rrent, regs, 0, entry-&gt;nrargs, args);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lttng_syscall_get_argume=
nts(current, regs, args);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fptr(event, ret, ar=
gs[0], args[1], args[2],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0args[3], args[4], args[5]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+diff --git a/wrapper/syscall.h b/wrapper/syscall.h<br>
+new file mode 100644<br>
+index 0000000..8715f0c<br>
+--- /dev/null<br>
++++ b/wrapper/syscall.h<br>
+@@ -0,0 +1,34 @@<br>
++/* SPDX-License-Identifier: (GPL-2.0 or LGPL-2.1)<br>
++ *<br>
++ * wrapper/syscall.h<br>
++ *<br>
++ * wrapper around asm/syscall.h.<br>
++ *<br>
++ * Copyright (C) 2019 Michael Jeanson &lt;<a href=3D"mailto:mjeanson@effi=
cios.com" target=3D"_blank">mjeanson@efficios.com</a>&gt;<br>
++ */<br>
++<br>
++#ifndef _LTTNG_WRAPPER_SYSCALL_H<br>
++#define _LTTNG_WRAPPER_SYSCALL_H<br>
++<br>
++#include &lt;asm/syscall.h&gt;<br>
++#include &lt;lttng-kernel-version.h&gt;<br>
++<br>
++#define LTTNG_SYSCALL_NR_ARGS 6<br>
++<br>
++#if (LINUX_VERSION_CODE &gt;=3D KERNEL_VERSION(5,1,0))<br>
++<br>
++#define lttng_syscall_get_arguments(task, regs, args) \<br>
++=C2=A0 =C2=A0 =C2=A0 syscall_get_arguments(task, regs, args)<br>
++<br>
++#else /* LINUX_VERSION_CODE &gt;=3D KERNEL_VERSION(5,1,0) */<br>
++<br>
++static inline<br>
++void lttng_syscall_get_arguments(struct task_struct *task,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct pt_regs *regs, un=
signed long *args)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 syscall_get_arguments(task, regs, 0, LTTNG_SYSCALL_N=
R_ARGS, args);<br>
++}<br>
++<br>
++#endif /* LINUX_VERSION_CODE &gt;=3D KERNEL_VERSION(5,1,0) */<br>
++<br>
++#endif /* _LTTNG_WRAPPER_SYSCALL_H */<br>
+-- <br>
+2.17.0<br>
+<br>
diff --git a/meta/recipes-kernel/lttng/<a href=3D"http://lttng-modules_2.10=
.9.bb" rel=3D"noreferrer" target=3D"_blank">lttng-modules_2.10.9.bb</a> b/m=
eta/recipes-kernel/lttng/<a href=3D"http://lttng-modules_2.10.9.bb" rel=3D"=
noreferrer" target=3D"_blank">lttng-modules_2.10.9.bb</a><br>
index 70a6843263..417c8b1724 100644<br>
--- a/meta/recipes-kernel/lttng/<a href=3D"http://lttng-modules_2.10.9.bb" =
rel=3D"noreferrer" target=3D"_blank">lttng-modules_2.10.9.bb</a><br>
+++ b/meta/recipes-kernel/lttng/<a href=3D"http://lttng-modules_2.10.9.bb" =
rel=3D"noreferrer" target=3D"_blank">lttng-modules_2.10.9.bb</a><br>
@@ -15,6 +15,11 @@ COMPATIBLE_HOST =3D &#39;(x86_64|i.86|powerpc|aarch64|mi=
ps|nios2|arm|riscv).*-linux&#39;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://lttng.org/files/$%7BBPN%7D/$%7BB=
PN%7D-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank">https://lttng=
.org/files/${BPN}/${BPN}-${PV}.tar.bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Makefile-Do-not-fail-if-CO=
NFIG_TRACEPOINTS-is-not-en.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://BUILD_RUNTIME_BUG_ON-vs-gc=
c7.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-mm-create-the-new=
-vm_fault_t-type-v5.1.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Fix-rcu-Remove-wrappe=
r-definitions-for-obsolete-RCU..patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-Fix-pipe-stop-using-c=
an_merge-v5.1.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-Fix-Revert-KVM-MMU-sh=
ow-mmu_valid_gen.-v5.1.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-Fix-Remove-start-and-=
number-from-syscall_get_argumen.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;09df0ac2e8f245740a2f32411d10c0d1&quot;<br>
-- <br>
2.17.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--00000000000005543d058914ab2c--
