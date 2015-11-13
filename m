Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2198E772EC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 11:56:30 +0000 (UTC)
Received: by wmww144 with SMTP id w144so25568115wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 03:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RV/sYiqndxbqTc3haX6HEHN8T2a36D3PseVmNj+Fuow=;
	b=OKS78e1l1QGzcyIpCySvUw8Zv5csJWdi3r6saJZuLKytUFFUHfdeEco0HD6XS818cF
	zf8ghoy87VWrmOmkha1bjcSQmovyjy8rKGRbCWglgKJuPUlbBcqQ5nfnH73G9I0Qbdhq
	SHDjPsMsBaLNACLbE/JcGCXB0q4Bz7Pg1ai1ua0pTuGGby08ey14uIF9pi5L8aT5O4mA
	S90eUC6ce3WQfLmaJVAYyMZPjkLOg8UnhXBsaIo+6b5HC9ITG1o+SFQeSE8j8xOGiw0o
	HrkmbUXmx1HrUVMmKIr1haF3BArmE8vEPB5aR8YdtYawYhze8sTm0YMY/aWkw254LHKB
	Bu8A==
X-Received: by 10.28.220.69 with SMTP id t66mr3230107wmg.4.1447415790260;
	Fri, 13 Nov 2015 03:56:30 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	184sm3632828wmk.10.2015.11.13.03.56.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Nov 2015 03:56:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 13 Nov 2015 12:56:51 +0100
To: openembedded-core@lists.openembedded.org
Message-ID: <20151113115651.GC2567@jama>
References: <20151029165513.GB2564@jama>
MIME-Version: 1.0
In-Reply-To: <20151029165513.GB2564@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: New warnings in default linux-yocto-4.1 builds
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
X-List-Received-Date: Fri, 13 Nov 2015 11:56:35 -0000
X-Groupsio-MsgNum: 73400
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jousvV0MzM2p6OtC"
Content-Disposition: inline

--jousvV0MzM2p6OtC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2015 at 05:55:13PM +0100, Martin Jansa wrote:
> Probably caused by last linux-yocto changes.
>=20
> NOTE: recipe linux-yocto-4.1.8+gitAUTOINC+aed9021602_dbe692d91c-r0: task =
do_kernel_configcheck: Started
> WARNING: [kernel config]: specified values did not make it into the kerne=
l's final configuration:
>=20
> Value requested for CONFIG_I2O not in final ".config"
> Requested value: "CONFIG_I2O=3Dm"
> Actual value set: "# CONFIG_I2O is not set"
>=20
> Value requested for CONFIG_I2O_BLOCK not in final ".config"
> Requested value: "CONFIG_I2O_BLOCK=3Dm"
> Actual value set: ""
>=20
> Value requested for CONFIG_I2O_CONFIG not in final ".config"
> Requested value: "CONFIG_I2O_CONFIG=3Dm"
> Actual value set: ""
>=20
> Value requested for CONFIG_I2O_CONFIG_OLD_IOCTL not in final ".config"
> Requested value: "CONFIG_I2O_CONFIG_OLD_IOCTL=3Dy"
> Actual value set: ""
>=20
> Value requested for CONFIG_I2O_PROC not in final ".config"
> Requested value: "CONFIG_I2O_PROC=3Dm"
> Actual value set: ""
>=20
> Value requested for CONFIG_I2O_SCSI not in final ".config"
> Requested value: "CONFIG_I2O_SCSI=3Dm"
> Actual value set: ""
>=20
> Value requested for CONFIG_MTRR_SANITIZER not in final ".config"
> Requested value: "# CONFIG_MTRR_SANITIZER is not set"
> Actual value set: "CONFIG_MTRR_SANITIZER=3Dy"
>=20
>=20
> NOTE: recipe linux-yocto-4.1.8+gitAUTOINC+aed9021602_dbe692d91c-r0: task =
do_kernel_configcheck: Succeeded

Now it failed completely in last world build, looks like race condition wit=
h linux-yocto-tiny-kexecboot
which is dangerously close in cooker log.

+Andrea to check if linux-yocto-tiny-kexecboot does something bad to sysroo=
t now
+Bruce to reply about new warnings from do_kernel_configcheck

NOTE: Running task 5608 of 34039 (ID: 13986, /home/jenkins/oe/world/shr-cor=
e/meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-ke=
xecboot_3.19.bb, do_fetch)
NOTE: recipe linux-yocto-tiny-kexecboot-3.19.5+gitAUTOINC+1016714868_e15234=
9de5-r0: task do_fetch: Started
NOTE: recipe linux-yocto-tiny-kexecboot-3.19.5+gitAUTOINC+1016714868_e15234=
9de5-r0: task do_fetch: Succeeded
NOTE: Running task 5609 of 34039 (ID: 13982, /home/jenkins/oe/world/shr-cor=
e/meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-ke=
xecboot_3.19.bb, do_unpack)
NOTE: recipe linux-yocto-tiny-kexecboot-3.19.5+gitAUTOINC+1016714868_e15234=
9de5-r0: task do_unpack: Started
ERROR: oe_runmake failed
ERROR: Function failed: do_compile (log file is located at /home/jenkins/oe=
/world/shr-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/4.1.8+gitAUTOIN=
C+aed9021602_dbe692d91c-r0/temp/log.do_compile.2069)
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/qemux86-oe-linux/linux-yocto/4.1.8+gitAUTOINC+aed9021602_dbe692d91=
c-r0/temp/log.do_compile.2069
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 8 bzImage CC=3Di586-oe-linux-gcc  -fuse-ld=3Dbfd LD=3Di586-=
oe-linux-ld.bfd
|   GEN     ./Makefile
| scripts/kconfig/conf  --silentoldconfig Kconfig
|   SYSTBL  arch/x86/syscalls/../include/generated/asm/syscalls_32.h
|   SYSHDR  arch/x86/syscalls/../include/generated/uapi/asm/unistd_32.h
|   SYSHDR  arch/x86/syscalls/../include/generated/uapi/asm/unistd_64.h
|   SYSHDR  arch/x86/syscalls/../include/generated/uapi/asm/unistd_x32.h
|   CHK     include/config/kernel.release
|   HOSTCC  scripts/basic/bin2c
|   GEN     ./Makefile
|   UPD     include/config/kernel.release
|   WRAP    arch/x86/include/generated/asm/clkdev.h
|   WRAP    arch/x86/include/generated/asm/cputime.h
|   WRAP    arch/x86/include/generated/asm/dma-contiguous.h
|   WRAP    arch/x86/include/generated/asm/early_ioremap.h
|   WRAP    arch/x86/include/generated/asm/scatterlist.h
|   WRAP    arch/x86/include/generated/asm/mcs_spinlock.h
|   CHK     include/generated/uapi/linux/version.h
|   UPD     include/generated/uapi/linux/version.h
|   CHK     include/generated/utsrelease.h
|   UPD     include/generated/utsrelease.h
|   Using /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86/ker=
nel-source as source for kernel
|   HOSTCC  arch/x86/tools/relocs_32.o
|   HOSTCC  arch/x86/tools/relocs_64.o
|   HOSTCC  arch/x86/tools/relocs_common.o
|   HOSTCC  scripts/kallsyms
|   HOSTCC  scripts/conmakehash
|   HOSTCC  scripts/recordmcount
|   CC      scripts/mod/empty.o
|   HOSTCC  scripts/mod/mk_elfconfig
|   HOSTCC  scripts/sortextable
|   CC      scripts/mod/devicetable-offsets.s
|   MKELF   scripts/mod/elfconfig.h
|   GEN     scripts/mod/devicetable-offsets.h
|   HOSTLD  arch/x86/tools/relocs
|   HOSTCC  scripts/mod/modpost.o
|   HOSTCC  scripts/mod/sumversion.o
|   HOSTCC  scripts/mod/file2alias.o
|   HOSTLD  scripts/mod/modpost
|   CC      kernel/bounds.s
|   CHK     include/generated/bounds.h
|   UPD     include/generated/bounds.h
|   CC      arch/x86/kernel/asm-offsets.s
|   CHK     include/generated/asm-offsets.h
|   UPD     include/generated/asm-offsets.h
|   CALL    /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86/k=
ernel-source/scripts/checksyscalls.sh
|   HOSTCC  usr/gen_init_cpio
|   CC      init/main.o
|   CHK     include/generated/compile.h
|   CC      init/do_mounts.o
|   CC      init/do_mounts_rd.o
|   CC      init/do_mounts_initrd.o
|   LD      arch/x86/crypto/built-in.o
|   UPD     include/generated/compile.h
|   GEN     usr/initramfs_data.cpio.gz
|   CC      arch/x86/mm/init.o
|   AS      usr/initramfs_data.o
|   LD      usr/built-in.o
|   CC      arch/x86/mm/init_32.o
|   CC      kernel/fork.o
|   CC      kernel/exec_domain.o
|   CC      arch/x86/kernel/process_32.o
|   CC      kernel/panic.o
|   CC      kernel/cpu.o
|   CC      init/do_mounts_md.o
|   CC      kernel/exit.o
|   CC      arch/x86/mm/fault.o
|   CC      kernel/softirq.o
|   CC      arch/x86/kernel/signal.o
|   CC      mm/filemap.o
|   CC      mm/mempool.o
|   CC      init/initramfs.o
|   CC      arch/x86/mm/ioremap.o
|   AS      arch/x86/kernel/entry_32.o
|   CC      arch/x86/kernel/traps.o
|   CC      arch/x86/mm/extable.o
|   CC      mm/oom_kill.o
|   CC      kernel/resource.o
|   CC      init/calibrate.o
|   CC      kernel/sysctl.o
|   CC      arch/x86/mm/pageattr.o
|   CC      init/init_task.o
|   CC      arch/x86/kernel/irq.o
|   CC      fs/open.o
|   CC      fs/read_write.o
|   CC      fs/file_table.o
|   CC      mm/maccess.o
|   CC      init/version.o
|   CC      arch/x86/mm/mmap.o
|   CC      mm/page_alloc.o
|   CC      arch/x86/kernel/irq_32.o
|   LD      init/mounts.o
|   LD      init/built-in.o
|   CC      kernel/sysctl_binary.o
|   CC      mm/page-writeback.o
|   LD      arch/x86/net/built-in.o
|   CC      mm/readahead.o
|   CC      arch/x86/mm/pat.o
|   CC      arch/x86/mm/pgtable.o
|   CC      arch/x86/kernel/dumpstack_32.o
|   CC      fs/super.o
|   CC      kernel/capability.o
|   CC      arch/x86/mm/physaddr.o
|   CC      fs/char_dev.o
|   CC      mm/swap.o
|   CC      arch/x86/kernel/time.o
|   CC      kernel/ptrace.o
|   CC      arch/x86/mm/gup.o
|   CC      arch/x86/kernel/ioport.o
|   CC      arch/x86/realmode/init.o
|   CC      fs/stat.o
|   AS      arch/x86/realmode/rm/header.o
|   LD      arch/x86/platform/ce4100/built-in.o
|   CC      arch/x86/mm/setup_nx.o
|   CC      arch/x86/platform/efi/quirks.o
|   CC      arch/x86/kernel/ldt.o
|   AS      arch/x86/realmode/rm/trampoline_32.o
|   LD      arch/x86/platform/geode/built-in.o
|   CC      mm/truncate.o
|   LD      arch/x86/platform/goldfish/built-in.o
|   AS      arch/x86/realmode/rm/stack.o
|   LD      arch/x86/platform/intel-mid/built-in.o
|   LD      arch/x86/platform/intel-quark/built-in.o
|   LD      arch/x86/platform/iris/built-in.o
|   CC      kernel/user.o
|   AS      arch/x86/realmode/rm/reboot.o
|   AS      arch/x86/realmode/rm/wakeup_asm.o
|   LD      arch/x86/platform/olpc/built-in.o
|   CC      arch/x86/mm/pat_rbtree.o
|   LD      arch/x86/platform/scx200/built-in.o
|   LD      arch/x86/platform/sfi/built-in.o
|   CC      arch/x86/realmode/rm/wakemain.o
|   LD      arch/x86/platform/ts5500/built-in.o
|   CC      arch/x86/mm/tlb.o
|   CC      arch/x86/realmode/rm/video-mode.o
|   CC      fs/exec.o
|   CC      arch/x86/kernel/dumpstack.o
|   CC      arch/x86/platform/efi/efi.o
|   CC      kernel/signal.o
|   AS      arch/x86/realmode/rm/copy.o
|   CC      arch/x86/platform/efi/efi_32.o
|   AS      arch/x86/realmode/rm/bioscall.o
|   CC      mm/vmscan.o
|   CC      arch/x86/realmode/rm/regs.o
|   CC      arch/x86/realmode/rm/video-vga.o
|   CC      arch/x86/kernel/nmi.o
|   CC      arch/x86/mm/pgtable_32.o
|   CC      arch/x86/realmode/rm/video-vesa.o
|   CC      arch/x86/realmode/rm/video-bios.o
|   AS      arch/x86/platform/efi/efi_stub_32.o
|   CC      kernel/sys.o
|   LD      arch/x86/platform/efi/built-in.o
|   CC      fs/pipe.o
|   PASYMS  arch/x86/realmode/rm/pasyms.h
|   LDS     arch/x86/realmode/rm/realmode.lds
|   LD      arch/x86/platform/uv/built-in.o
|   LD      arch/x86/platform/built-in.o
|   LD      arch/x86/realmode/rm/realmode.elf
|   RELOCS  arch/x86/realmode/rm/realmode.relocs
|   OBJCOPY arch/x86/realmode/rm/realmode.bin
|   AS      arch/x86/realmode/rmpiggy.o
|   CC      arch/x86/mm/iomap_32.o
|   LD      arch/x86/realmode/built-in.o
|   CC      arch/x86/kernel/setup.o
|   CC      arch/x86/kernel/x86_init.o
|   CC      arch/x86/vdso/vma.o
|   CC      arch/x86/mm/highmem_32.o
|   CC      mm/shmem.o
|   CC      arch/x86/vdso/vdso32-setup.o
|   CC      fs/namei.o
|   CC      arch/x86/kernel/i8259.o
|   CC      ipc/util.o
|   CC      kernel/kmod.o
|   LD      arch/x86/mm/built-in.o
|   LDS     arch/x86/vdso/vdso32/vdso32.lds
|   CC      arch/x86/kernel/irqinit.o
|   CC      arch/x86/vdso/vdso32/vclock_gettime.o
|   CC      ipc/msgutil.o
|   AS      arch/x86/vdso/vdso32/note.o
|   CC      security/integrity/iint.o
|   AS      arch/x86/vdso/vdso32/int80.o
|   CC      mm/util.o
|   CC      ipc/msg.o
|   HOSTCC  arch/x86/vdso/vdso2c
|   CC      kernel/workqueue.o
|   CC      arch/x86/kernel/jump_label.o
|   LD      security/integrity/integrity.o
|   LD      security/integrity/built-in.o
|   CC      security/keys/gc.o
|   CC      security/keys/key.o
|   CC      mm/mmzone.o
|   CC      arch/x86/kernel/irq_work.o
|   CC      ipc/sem.o
|   AS      arch/x86/vdso/vdso32/sysenter.o
|   CC      mm/vmstat.o
|   CC      fs/fcntl.o
|   CC      arch/x86/kernel/probe_roms.o
|   CC      ipc/shm.o
|   CC      security/keys/keyring.o
|   CC      arch/x86/kernel/i386_ksyms_32.o
|   VDSO    arch/x86/vdso/vdso32-int80.so.dbg
|   CC      security/keys/keyctl.o
|   CC      ipc/syscall.o
|   CC      arch/x86/kernel/syscall_32.o
|   CC      fs/ioctl.o
|   CC      arch/x86/kernel/vsyscall_gtod.o
|   CC      arch/x86/kernel/ksysfs.o
|   CC      mm/backing-dev.o
|   CC      kernel/pid.o
|   CC      fs/readdir.o
|   CC      ipc/ipc_sysctl.o
|   CC      arch/x86/kernel/bootflag.o
|   CC      fs/select.o
|   CC      security/keys/permission.o
|   VDSO    arch/x86/vdso/vdso32-sysenter.so.dbg
|   OBJCOPY arch/x86/vdso/vdso32-int80.so
|   CC      mm/mm_init.o
|   OBJCOPY arch/x86/vdso/vdso32-sysenter.so
|   CC      ipc/mqueue.o
|   VDSO2C  arch/x86/vdso/vdso-image-32-int80.c
|   VDSO2C  arch/x86/vdso/vdso-image-32-sysenter.c
|   CC      arch/x86/vdso/vdso-image-32-int80.o
|   CC      arch/x86/vdso/vdso-image-32-sysenter.o
|   CC      kernel/task_work.o
|   CC      security/keys/process_keys.o
|   CC      arch/x86/kernel/e820.o
|   LD      arch/x86/vdso/built-in.o
|   CC      security/commoncap.o
|   CC      mm/mmu_context.o
|   CC      kernel/extable.o
|   CC      security/keys/request_key.o
|   CC      fs/dcache.o
|   CC      crypto/api.o
|   CC      mm/percpu.o
|   CC      arch/x86/kernel/pci-dma.o
|   CC      ipc/namespace.o
|   CC      kernel/params.o
|   CC      kernel/kthread.o
|   CC      security/keys/request_key_auth.o
|   CC      arch/x86/kernel/quirks.o
|   CC      ipc/mq_sysctl.o
|   CC      crypto/cipher.o
|   CC      kernel/sys_ni.o
|   CC      security/keys/user_defined.o
|   CC      security/keys/proc.o
|   CC      kernel/nsproxy.o
|   CC      mm/slab_common.o
|   LD      ipc/built-in.o
|   CC      security/keys/sysctl.o
|   CC      arch/x86/kernel/topology.o
|   CC      arch/x86/kernel/kdebugfs.o
|   CC      crypto/compress.o
|   CC      arch/x86/kernel/alternative.o
|   CC      fs/inode.o
|   LD      security/keys/built-in.o
|   CC      security/min_addr.o
|   CC      security/security.o
|   CC      kernel/notifier.o
|   CC      kernel/ksysfs.o
|   CC      crypto/memneq.o
|   CC      security/capability.o
|   CC      mm/compaction.o
|   CC      kernel/cred.o
|   CC      arch/x86/kernel/i8253.o
|   CC      kernel/reboot.o
|   CC      crypto/crypto_wq.o
|   CC      security/device_cgroup.o
|   CC      mm/vmacache.o
|   CC      arch/x86/kernel/pci-nommu.o
|   CC      fs/attr.o
|   CC      crypto/algapi.o
|   CC      kernel/async.o
|   CC      mm/interval_tree.o
|   CC      arch/x86/kernel/hw_breakpoint.o
|   CC      kernel/range.o
|   LD      security/built-in.o
|   CC      fs/bad_inode.o
|   CC      kernel/smpboot.o
|   CC      block/bio.o
|   CC      fs/file.o
|   CC      block/elevator.o
|   CC      mm/list_lru.o
|   CC      arch/x86/kernel/tsc.o
|   CC      kernel/groups.o
|   CC      crypto/scatterwalk.o
|   CC      fs/filesystems.o
|   CC      mm/workingset.o
|   CC      arch/x86/kernel/tsc_msr.o
|   CC      arch/x86/kernel/io_delay.o
|   CC      block/blk-core.o
|   CC      crypto/proc.o
|   CC      kernel/bpf/core.o
|   CC      drivers/acpi/tables.o
|   CC      kernel/debug/debug_core.o
|   CC      arch/x86/kernel/rtc.o
|   CC      fs/namespace.o
|   CC      mm/prfile.o
|   CC      crypto/aead.o
|   CC      drivers/acpi/blacklist.o
|   CC      arch/x86/kernel/pci-iommu_table.o
|   CC      mm/debug.o
|   LD      kernel/bpf/built-in.o
|   CC      kernel/debug/gdbstub.o
|   CC      drivers/acpi/osl.o
|   CC      arch/x86/kernel/resource.o
|   CC      arch/x86/kernel/process.o
|   CC      sound/sound_core.o
|   CC      mm/gup.o
|   CC      crypto/ablkcipher.o
|   CC      kernel/debug/kdb/kdb_io.o
|   LD      sound/arm/built-in.o
|   LD      sound/atmel/built-in.o
|   CC      drivers/acpi/utils.o
|   CC      mm/highmem.o
|   CC      fs/seq_file.o
|   CC      block/blk-tag.o
|   CC      sound/core/sound.o
|   CC      arch/x86/kernel/i387.o
|   CC      kernel/debug/kdb/kdb_main.o
|   CC      crypto/blkcipher.o
|   CC      sound/core/init.o
|   CC      drivers/acpi/reboot.o
|   CC      mm/memory.o
|   CC      fs/xattr.o
|   CC      block/blk-sysfs.o
|   CC      arch/x86/kernel/xsave.o
|   CC      drivers/acpi/nvs.o
|   CC      sound/core/memory.o
|   CC      crypto/chainiv.o
|   CC      block/blk-flush.o
|   CC      arch/x86/kernel/ptrace.o
|   CC      kernel/debug/kdb/kdb_support.o
|   CC      fs/libfs.o
|   CC      sound/core/info.o
|   CC      drivers/acpi/wakeup.o
|   CC      crypto/eseqiv.o
|   CC      mm/mincore.o
|   CC      block/blk-settings.o
|   CC      drivers/acpi/sleep.o
|   CC      kernel/debug/kdb/kdb_bt.o
|   CC      sound/core/control.o
|   CC      arch/x86/kernel/tls.o
|   CC      crypto/ahash.o
|   GENKDB  kernel/debug/kdb/gen-kdb_cmds.c
|   CC      fs/fs-writeback.o
|   CC      kernel/debug/kdb/kdb_bp.o
|   CC      mm/mlock.o
|   CC      block/blk-ioc.o
|   CC      drivers/acpi/device_pm.o
|   CC      arch/x86/kernel/step.o
|   CC      crypto/shash.o
|   CC      kernel/debug/kdb/kdb_debugger.o
|   CC      block/blk-map.o
|   CC      mm/mmap.o
|   CC      sound/core/misc.o
|   CC      arch/x86/kernel/i8237.o
|   CC      kernel/debug/kdb/kdb_keyboard.o
|   CC      drivers/acpi/proc.o
|   CC      arch/x86/kernel/stacktrace.o
|   CC      crypto/pcompress.o
|   CC      sound/core/device.o
|   CC      kernel/debug/kdb/gen-kdb_cmds.o
|   CC      block/blk-exec.o
|   LD      kernel/debug/kdb/built-in.o
|   LD      kernel/debug/built-in.o
|   CC      drivers/acpi/bus.o
|   CC      fs/pnode.o
|   CC      sound/core/isadma.o
|   CC      kernel/events/core.o
|   CC      arch/x86/kernel/acpi/boot.o
|   CC      crypto/algboss.o
|   CC      block/blk-merge.o
|   CC      fs/spli
|   LD      arch/x86/kernel/acpi/built-in.o
|   CC      fs/stack.o
|   CC      drivers/acpi/resource.o
|   CC      arch/x86/kernel/apic/apic.o
|   CC      crypto/md5.o
|   CC      kernel/events/ring_buffer.o
|   CC      fs/fs_struct.o
|   CC      block/blk-lib.o
|   CC      drivers/acpi/acpi_processor.o
|   CC      crypto/sha1_generic.o
|   CC      sound/core/pcm.o
|   CC      mm/vmalloc.o
|   CC      fs/statfs.o
|   CC      block/blk-mq.o
|   CC      kernel/events/callchain.o
|   CC      crypto/sha256_generic.o
|   CC      drivers/acpi/processor_core.o
|   CC      arch/x86/kernel/apic/apic_noop.o
|   CC      sound/core/pcm_native.o
|   CC      fs/fs_pin.o
|   CC      arch/x86/kernel/apic/ipi.o
|   CC      kernel/events/hw_breakpoint.o
|   CC      drivers/acpi/processor_pdc.o
|   CC      fs/nsfs.o
|   CC      mm/pagewalk.o
|   CC      crypto/ecb.o
|   CC      kernel/events/uprobes.o
|   CC      drivers/acpi/ec.o
|   CC      fs/buffer.o
|   CC      arch/x86/kernel/apic/vector.o
|   CC      block/blk-mq-tag.o
|   CC      crypto/cbc.o
|   CC      mm/pgtable-generic.o
|   CC      arch/x86/kernel/apic/hw_nmi.o
|   CC      sound/core/pcm_lib.o
|   CC      crypto/cts.o
|   CC      mm/process_vm_access.o
|   CC      drivers/acpi/pci_root.o
|   CC      block/blk-mq-sysfs.o
|   CC      arch/x86/kernel/apic/io_apic.o
|   LD      kernel/events/built-in.o
|   CC      drivers/acpi/pci_link.o
|   CC      crypto/des_generic.o
|   CC      kernel/irq/irqdesc.o
|   CC      mm/init-mm.o
|   CC      fs/block_dev.o
|   CC      block/blk-mq-cpu.o
|   CC      mm/nobootmem.o
|   CC      drivers/acpi/pci_irq.o
|   CC      kernel/irq/handle.o
|   CC      crypto/aes_generic.o
|   CC      block/blk-mq-cpumap.o
|   CC      sound/core/pcm_timer.o
|   CC      mm/fadvise.o
|   CC      kernel/irq/manage.o
|   CC      arch/x86/kernel/apic/msi.o
|   CC      drivers/acpi/acpi_lpss.o
|   CC      fs/direct-io.o
|   CC      block/ioctl.o
|   CC      sound/core/pcm_misc.o
|   CC      crypto/crc32c_generic.o
|   CC      mm/madvise.o
|   CC      drivers/acpi/acpi_apd.o
|   CC      arch/x86/kernel/apic/htirq.o
|   CC      sound/core/pcm_memory.o
|   CC      drivers/acpi/acpi_platform.o
|   CC      block/genhd.o
|   CC      kernel/irq/spurious.o
|   CC      crypto/authenc.o
|   CC      arch/x86/kernel/apic/probe_32.o
|   CC      mm/memblock.o
|   CC      kernel/irq/resend.o
|   CC      sound/core/memalloc.o
|   CC      drivers/acpi/acpi_pnp.o
|   CC      fs/mpage.o
|   LD      arch/x86/kernel/apic/built-in.o
| In file included from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86/kernel-source/include/linux/sysfs.h:21:0,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86/kernel-source/include/linux/kobject.h:21,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86/kernel-source/include/linux/device.h:17,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86/kernel-source/include/linux/acpi.h:31,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86/kernel-source/drivers/acpi/acpi_pnp.c:13:
| /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86/kernel-sour=
ce/include/linux/stat.h:6:29: fatal error: uapi/linux/stat.h: No such file =
or directory
| compilation terminated.
| fixdep: error opening config file: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work-shared/qemux86/kernel-source/kernel/irq/settings.h: No such file o=
r directory
| /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86/kernel-sour=
ce/scripts/Makefile.build:53: scripts/Makefile.lib: No such file or directo=
ry
| make[4]: *** [kernel/irq/resend.o] Error 2
| make[3]: *** [kernel/irq] Error 2
| make[2]: *** [kernel] Error 2
| make[2]: *** Waiting for unfinished jobs....
| In file included from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86/kernel-source/include/linux/mmzone.h:9:0,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86/kernel-source/include/linux/gfp.h:5,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86/kernel-source/include/linux/mm.h:9,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work-shar=
ed/qemux86/kernel-source/fs/mpage.c:17:
| /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86/kernel-sour=
ce/include/linux/wait.h:10:29: fatal error: uapi/linux/wait.h: No such file=
 or directory
| compilation terminated.
| make[5]: *** No rule to make target `scripts/Makefile.lib'.  Stop.
| make[4]: *** [arch/x86/kernel/cpu] Error 2
| make[3]: *** [fs/mpage.o] Error 1
| make[2]: *** [fs] Error 2
| make[4]: *** [drivers/acpi/acpi_pnp.o] Error 1
| make[4]: *** Waiting for unfinished jobs....
|   CC      drivers/acpi/int340x_thermal.o
| make[3]: *** [arch/x86/kernel] Error 2
| make[2]: *** [arch/x86] Error 2
|   CC      crypto/authencesn.o
| make[4]: /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86/ke=
rnel-source/scripts/Makefile.build: No such file or directory
| make[4]: *** No rule to make target `/home/jenkins/oe/world/shr-core/tmp-=
glibc/work-shared/qemux86/kernel-source/scripts/Makefile.build'.  Stop.
| make[3]: *** [sound/drivers] Error 2
| make[3]: *** Waiting for unfinished jobs....
| make[3]: *** No rule to make target `mm/swap_state.o', needed by `mm/buil=
t-in.o'.  Stop.
| make[3]: *** Waiting for unfinished jobs....
|   CC      mm/page_io.o
|   CC      crypto/rng.o
| cc1: fatal error: /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/q=
emux86/kernel-source/include/linux/kconfig.h: No such file or directory
| compilation terminated.
| i586-oe-linux-gcc: error: /home/jenkins/oe/world/shr-core/tmp-glibc/work-=
shared/qemux86/kernel-source/mm/page_io.c: No such file or directory
| i586-oe-linux-gcc: fatal error: no input files
| compilation terminated.
| make[3]: *** [mm/page_io.o] Error 1
|   CC      sound/core/sgbuf.o
| cc1: fatal error: /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/q=
emux86/kernel-source/include/linux/kconfig.h: No such file or directory
| compilation terminated.
| make[4]: *** [drivers/acpi/int340x_thermal.o] Error 1
| i586-oe-linux-gcc: error: /home/jenkins/oe/world/shr-core/tmp-glibc/work-=
shared/qemux86/kernel-source/sound/core/sgbuf.c: No such file or directory
| make[3]: *** [drivers/acpi] Error 2
| i586-oe-linux-gcc: fatal error: no input files
| compilation terminated.
| make[2]: *** [drivers] Error 2
| cc1: fatal error: /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/q=
emux86/kernel-source/include/linux/kconfig.h: No such file or directory
| compilation terminated.
| make[5]: /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86/ke=
rnel-source/scripts/Makefile.build: No such file or directory
| make[5]: *** No rule to make target `/home/jenkins/oe/world/shr-core/tmp-=
glibc/work-shared/qemux86/kernel-source/scripts/Makefile.build'.  Stop.
| make[4]: *** [sound/core/sgbuf.o] Error 1
| make[4]: *** Waiting for unfinished jobs....
| make[4]: *** [sound/core/oss] Error 2
|   CC      crypto/krng.o
|   CC      block/scsi_ioctl.o
| make[3]: *** [crypto/authencesn.o] Error 1
| make[3]: *** Waiting for unfinished jobs....
| make[3]: *** [crypto/rng.o] Error 1
|   CC      block/ioprio.o
| cc1: fatal error: /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/q=
emux86/kernel-source/include/linux/kconfig.h: No such file or directory
| compilation terminated.
|   CC      block/partition-generic.o
| fixdep: error opening config file: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work-shared/qemux86/kernel-source/sound/core/memalloc.c: No such file o=
r directory
| make[4]: *** [sound/core/memalloc.o] Error 2
| make[3]: *** [sound/core] Error 2
| make[2]: *** [sound] Error 2
| cc1: fatal error: /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/q=
emux86/kernel-source/include/linux/kconfig.h: No such file or directory
| compilation terminated.
| make[3]: *** [crypto/krng.o] Error 1
| make[4]: /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86/ke=
rnel-source/scripts/Makefile.build: No such file or directory
| make[4]: *** No rule to make target `/home/jenkins/oe/world/shr-core/tmp-=
glibc/work-shared/qemuion terminated.
| make[3]: *** [block/scsi_ioctl.o] Error 1
| cc1: fatal error: /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/q=
emux86/kernel-source/include/linux/kconfig.h: No such file or directory
| compilation terminated.
| make[3]: *** [block/partition-generic.o] Error 1
| fixdep: error opening config file: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work-shared/qemux86/kernel-source/include/crypto/aead.h: No such file o=
r directory
| make[3]: *** [crypto/authenc.o] Error 2
| cc1: fatal error: /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/q=
emux86/kernel-source/include/linux/kconfig.h: No such file or directory
| compilation terminated.
| make[2]: *** [crypto] Error 2
| make[3]: *** [block/ioprio.o] Error 1
| make[3]: *** [block/bounce.o] Error 1
| fixdep: error opening config file: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work-shared/qemux86/kernel-source/mm/memblock.c: No such file or direct=
ory
| make[3]: *** [mm/memblock.o] Error 2
| make[2]: *** [mm] Error 2
| fixdep: error opening config file: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work-shared/qemux86/kernel-source/include/linux/module.h: No such file =
or directory
| make[3]: *** [block/genhd.o] Error 2
| make[2]: *** [block] Error 2
| make[1]: *** [sub-make] Error 2
| make: *** [__sub-make] Error 2
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/world/shr-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/4.1.8+gitAUTO=
INC+aed9021602_dbe692d91c-r0/temp/log.do_compile.2069)
NOTE: recipe linux-yocto-4.1.8+gitAUTOINC+aed9021602_dbe692d91c-r0: task do=
_compile: Failed
ERROR: Task 31903 (/home/jenkins/oe/world/shr-core/openembedded-core/meta/r=
ecipes-kernel/linux/linux-yocto_4.1.bb, do_compile) failed with exit code '=
1'

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jousvV0MzM2p6OtC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZF0AIACgkQN1Ujt2V2gBystgCgq5rPIIMkXE27Df31267AQU56
fEwAoKK1VcRv24h05zvmZ5Ulv9UIuNpS
=XJjp
-----END PGP SIGNATURE-----

--jousvV0MzM2p6OtC--
