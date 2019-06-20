Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0B23D6BA9D;
	Thu, 20 Jun 2019 20:17:33 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id j29so3325256lfk.10;
	Thu, 20 Jun 2019 13:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=KG+/OsNmSNL8/O364Da3cuxwxLlBQRJ79eKs11RR4lY=;
	b=mz4L9CYBulHZLdxx2PrD+/MiwaTUFZRK3ha9hDsor85EqKPr9qQ9Va/2QTCinS+ngx
	7e8d7Pbbq4+L28E3qkYfMKXZ4Vjk9ESePhfQf/HBcv630JT+0D6ewP8lah5SErNir3SB
	KPWHzWZGEejDU1hMPtLuyCEbz2ZohZugzbBlnY5Eoowox2Ijf+XxYRCgx6G56+mhoQL2
	N1vP0ivmfg/ibnwZbwe3vID+k2RQ+1YLwAaKiUs45xFwfW5+uk2/6tYbw0zYZbJNoMkL
	FfpoFzR+IWm1nAPj/bjgRNlMjo3Kp/QQt5pJcRzZaLre/wZLBLK4c81Bb1lJxainphwO
	HDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=KG+/OsNmSNL8/O364Da3cuxwxLlBQRJ79eKs11RR4lY=;
	b=CrjRT22PsJhtGz/Br4A9iYsqY6JNyeljxoid2+GUzcTIMFEn3mKNkn4vqJbGopTgxU
	4kbEgbmnuS/G1HyUuYhzV0B5aN9QQU8MGErd/FE0rQcXdvc1rGrKZIjE2mrlj99wDzWa
	I3RVbe7yxzfOu5ueWyW0CiU72sWOskI49tDxmIn8PkmTv4q2BZoBTyoOv+dzePJlQS1L
	Mvu9/Z7aH/R11OAcG2KfXaWkhsxDskQYY31XAIxdQKeGohuM7Sj9tzB+9u1dxelXe9zp
	+1pKzKgFx8cWpBQrlVDn0jQD4KjwFaSSOruK/rBGtOj6yUJ2yNfxdPMRNakeChcVtTBU
	ka0A==
X-Gm-Message-State: APjAAAWI9516N5Pd1kH6yTW9P7C22mR0J11vowNf0QTZWZOoIwLK8IWV
	kcLPIy60cYXPZyfgeVWK0l6HYYONEa8e8gWWC+fhQK5PACo=
X-Google-Smtp-Source: APXvYqxfnen7+WrnNZMHrbfYAfNH6mjqM/IpOdJayoKfUJ2NGbRg9zJATsFwWabWVhj4eHmGWUG1tpotI3Qn0rquq1Q=
X-Received: by 2002:ac2:5b0c:: with SMTP id v12mr54134929lfn.184.1561061853849;
	Thu, 20 Jun 2019 13:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <156085389271.26327.12531071352385707940@git.openembedded.org>
	<20190618103133.9022A2342C2@git.openembedded.org>
	<CA+chaQdFSThk4NPhTQt05V1pw8sd-uKZDCnePh9eBuNPL8EDJA@mail.gmail.com>
In-Reply-To: <CA+chaQdFSThk4NPhTQt05V1pw8sd-uKZDCnePh9eBuNPL8EDJA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 20 Jun 2019 16:17:22 -0400
Message-ID: <CADkTA4O3RJ+vmf9Yao_2Hsc=yZuaP9uFhxxT_5gPR2UK6TBD0g@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-commits@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 09/30: linux-yocto/5.0: update to v5.0.19
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
X-List-Received-Date: Thu, 20 Jun 2019 20:17:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2019 at 3:19 PM Martin Jansa <martin.jansa@gmail.com> wrote=
:
>
> Hi,
>
>
> One of these recent updates is causing following WARNING:

It is this one:

------
commit 70a30872bd93cc058b05d9cf2b4f9334658629ee
Author: Mariano L=C3=B3pez <just.another.mariano@gmail.com>
Date:   Thu Jun 13 22:32:41 2019 -0500

    linux-yocto: Add scsi_debug module when ptest is in DISTRO_FEATURES

    util-linux ptest requires the scsi_debug module to perform eject/mount
    tests. This will conditionally add scsi_debug module when ptest is in
    DISTRO_FEATURES.

    This doesn't include linux-yocto-tiny because the resulting image will
    be too big and do_image would complain about this.

    [YOCTO #13301]

    Signed-off-by: Mariano L=C3=B3pez <just.another.mariano@gmail.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-----

Khem pointed it out the other day, and I have a WIP patch that should
address it shortly.

Bruce

>
> ---------- CONFIG_SCSI_DEBUG -----------------
> Config: CONFIG_SCSI_DEBUG
> From: work-shared/qemuarm/kernel-source/.kernel-meta/configs/v5.0/standar=
d/features/scsi/scsi-debug.cfg
> Requested value:  CONFIG_SCSI_DEBUG=3Dm
> Actual value:
>
> No reference to SCSI_DEBUG found
>
>
> On Tue, Jun 18, 2019 at 12:31 PM <git@git.openembedded.org> wrote:
>>
>> This is an automated email from the git hooks/post-receive script.
>>
>> rpurdie pushed a commit to branch warrior
>> in repository openembedded-core.
>>
>> commit 02ee58ba18a0393ce372f4fe9d4860ccaaaa9486
>> Author: Bruce Ashfield <bruce.ashfield@gmail.com>
>> AuthorDate: Thu May 30 08:44:42 2019 -0400
>>
>>     linux-yocto/5.0: update to v5.0.19
>>
>>     Integrating the korg -stable updates that comprise the following
>>     commits:
>>
>>        3f7c1cab1a61 Linux 5.0.19
>>        64d314bd8cc8 fbdev: sm712fb: fix memory frequency by avoiding a s=
witch/case fallthrough
>>        e5c6d75b0f03 bpf, lru: avoid messing with eviction heuristics upo=
n syscall lookup
>>        b5f95aa7a88b bpf: add map_lookup_elem_sys_only for lookups from s=
yscall side
>>        d811930f74ac bpf: relax inode permission check for retrieving bpf=
 program
>>        ca7ef7e3ddfa driver core: Postpone DMA tear-down until after devr=
es release for probe failure
>>        bad4fbe76cfb md/raid: raid5 preserve the writeback action after t=
he parity check
>>        3770eb3721be Revert "Don't jump to compute_result state from chec=
k_result state"
>>        07116a6548c8 perf/x86/intel: Fix race in intel_pmu_disable_event(=
)
>>        58d1e074c742 perf cs-etm: Always allocate memory for cs_etm_queue=
::prev_packet
>>        cd448c27b08e perf bench numa: Add define for RUSAGE_THREAD if not=
 present
>>        7325696ce261 i2c: designware: ratelimit 'transfer when suspended'=
 errors
>>        8258661858d5 ufs: fix braino in ufs_get_inode_gid() for solaris U=
FS flavour
>>        5b73764a5d2c KVM: selftests: make hyperv_cpuid test pass on AMD
>>        fb654d0763c8 KVM: fix KVM_CLEAR_DIRTY_LOG for memory slots of una=
ligned size
>>        497ce5c7f538 x86/mm/mem_encrypt: Disable all instrumentation for =
early SME setup
>>        96f0be982c8a sched/cpufreq: Fix kobject memleak
>>        2a9605f177f8 iwlwifi: mvm: check for length correctness in iwl_mv=
m_create_skb()
>>        df5eba5f41be qmi_wwan: new Wistron, ZTE and D-Link devices
>>        bd61ddd3e9fc bpf: Fix preempt_enable_no_resched() abuse
>>        bd3713424a01 tools: bpftool: fix infinite loop in map create
>>        1e61a219090f power: supply: sysfs: prevent endless uevent loop wi=
th CONFIG_POWER_SUPPLY_DEBUG
>>        e6ae43922897 KVM: arm/arm64: Ensure vcpu target is unset on reset=
 failure
>>        5450811a02f5 net: ieee802154: fix missing checks for regmap_updat=
e_bits
>>        15f64f420bae mac80211: Fix kernel panic due to use of txq after f=
ree
>>        eff6d5429bd2 x86: kvm: hyper-v: deal with buggy TLB flush request=
s from WS2012
>>        48be4d7ced2c PCI: Fix issue with "pci=3Ddisable_acs_redir" parame=
ter being ignored
>>        fa42fde1f8e6 apparmorfs: fix use-after-free on symlink traversal
>>        cf0259f7662a securityfs: fix use-after-free on symlink traversal
>>        04aa8a51e723 power: supply: cpcap-battery: Fix division by zero
>>        38a725dd0be7 KVM: PPC: Book3S: Protect memslots while validating =
user address
>>        eec0c746757b KVM: PPC: Book3S HV: Perserve PSSCR FAKE_SUSPEND bit=
 on guest exit
>>        f3adb80bb243 clk: sunxi-ng: nkmp: Avoid GENMASK(-1, 0)
>>        791746a758e7 ARC: PAE40: don't panic and instead turn off hw ioc
>>        30bd4585bf14 xfrm4: Fix uninitialized memory read in _decode_sess=
ion4
>>        79fad8fd2b76 xfrm: Honor original L3 slave device in xfrmi policy=
 lookup
>>        ff7fa2c801bc esp4: add length check for UDP encapsulation
>>        4e8ce2680442 xfrm: clean up xfrm protocol checks
>>        6c0db1cbf772 vti4: ipip tunnel deregistration fixes.
>>        f8a427ca50d6 xfrm6_tunnel: Fix potential panic when unloading xfr=
m6_tunnel module
>>        70a87327025a xfrm: Reset secpath in xfrm failure
>>        9531aac1ee3e xfrm: policy: Fix out-of-bound array accesses in __x=
frm_policy_unlink
>>        07a573c046c0 fuse: Add FOPEN_STREAM to use stream_open()
>>        560c6fd312c9 dm mpath: always free attached_handler_name in parse=
_path()
>>        96ecf4c59f08 dm integrity: correctly calculate the size of metada=
ta area
>>        ecff1441aa15 dm crypt: move detailed message into debug level
>>        862a78341ade dm delay: fix a crash when invalid device is specifi=
ed
>>        fab2e96c6be0 dm zoned: Fix zone report handling
>>        ef3f84246954 dm cache metadata: Fix loading discard bitset
>>        6c412dc3b757 PCI: Work around Pericom PCIe-to-PCI bridge Retrain =
Link erratum
>>        d06a30b1a957 PCI: Factor out pcie_retrain_link() function
>>        4f22ec9f0c28 PCI: rcar: Add the initialization of PCIe link in re=
sume_noirq()
>>        fbd9c6ef0dfc PCI/AER: Change pci_aer_init() stub to return void
>>        be361ee757b8 PCI: Init PCIe feature bits for managed host bridge =
alloc
>>        adb00a68d2dd PCI: Reset Lenovo ThinkPad P50 nvgpu at boot if nece=
ssary
>>        2e4017e3ddfd PCI: Mark Atheros AR9462 to avoid bus reset
>>        4ddfb43373ca PCI: Mark AMD Stoney Radeon R7 GPU ATS as broken
>>        1fbec8aa02f3 fbdev: sm712fb: fix crashes and garbled display duri=
ng DPMS modesetting
>>        620a97786fd6 fbdev: sm712fb: use 1024x768 by default on non-MIPS,=
 fix garbled display
>>        b2adbace369e fbdev: sm712fb: fix support for 1024x768-16 mode
>>        d119b4a43e53 fbdev: sm712fb: fix crashes during framebuffer write=
s by correctly mapping VRAM
>>        39045ad5a808 fbdev: sm712fb: fix boot screen glitch when sm712fb =
replaces VGA
>>        4badede3e74b fbdev: sm712fb: fix white screen of death on reboot,=
 don't set CR3B-CR3F
>>        62463c4661f1 fbdev: sm712fb: fix VRAM detection, don't set SR70/7=
1/74/75
>>        2a5d31230505 fbdev: sm712fb: fix brightness control on reboot, do=
n't set SR30
>>        cfe31930dac8 fbdev/efifb: Ignore framebuffer memmap entries that =
lack any memory types
>>        a816dc52fe77 x86/mpx, mm/core: Fix recursive munmap() corruption
>>        9d50a05607a7 objtool: Allow AR to be overridden with HOSTAR
>>        93dbb5304b51 MIPS: perf: Fix build with CONFIG_CPU_BMIPS5000 enab=
led
>>        822e8c43b08a perf intel-pt: Fix sample timestamp wrt non-taken br=
anches
>>        14f3460ed499 perf intel-pt: Fix improved sample timestamp
>>        23abb1eed2ee perf intel-pt: Fix instructions sampling rate
>>        c82da3e43ce1 memory: tegra: Fix integer overflow on tick value ca=
lculation
>>        dda71c1663c8 tracing: probeevent: Fix to make the type of $comm s=
tring
>>        95142e28042b tracing: Fix partial reading of trace event's id fil=
e
>>        9dba717a8156 ftrace/x86_64: Emulate call function while updating =
in breakpoint handler
>>        2a1069824a5c x86_64: Allow breakpoints to emulate call instructio=
ns
>>        16e559791d6b x86_64: Add gap to int3 to allow for call emulation
>>        69fc24195198 ceph: flush dirty inodes before proceeding with remo=
unt
>>        43cc8d378ca0 iommu/tegra-smmu: Fix invalid ASID bits on Tegra30/1=
14
>>        d79e6a726acb gcc-plugins: arm_ssp_per_task_plugin: Fix for older =
GCC < 6
>>        0e83f9e5ce46 ovl: fix missing upper fs freeze protection on copy =
up for ioctl
>>        bf076fd44bd6 fuse: honor RLIMIT_FSIZE in fuse_file_fallocate
>>        79d8f6321221 fuse: fix writepages on 32bit
>>        12db517f8a3e udlfb: introduce a rendering mutex
>>        0bd143ed4109 udlfb: fix sleeping inside spinlock
>>        02851943751d udlfb: delete the unused parameter for dlfb_handle_d=
amage
>>        855e2af24ab5 clk: rockchip: fix wrong clock definitions for rk332=
8
>>        317e574eaf6d clk: mediatek: Disable tuner_en before change PLL ra=
te
>>        b5f7027a6f79 clk: tegra: Fix PLLM programming on Tegra124+ when P=
MC overrides divider
>>        87b083dbdd8f clk: hi3660: Mark clk_gate_ufs_subsys as critical
>>        3c1f44469d83 PNFS fallback to MDS if no deviceid found
>>        73e0d62f16ec NFS4: Fix v4.0 client state corruption when mount
>>        1aa8f89cf5ad RDMA/ipoib: Allow user space differentiate between v=
alid dev_port
>>        90ebb540a7b1 RDMA/mlx5: Use get_zeroed_page() for clock_info
>>        2132baff7e0f media: imx: Clear fwnode link struct for each endpoi=
nt iteration
>>        7543aeaf9331 media: imx: csi: Allow unknown nearest upstream enti=
ties
>>        8a6a542635fe media: ov6650: Fix sensor possibly not detected on p=
robe
>>        252f74c15935 phy: ti-pipe3: fix missing bit-wise or operator when=
 assigning val
>>        921bb3e9be5b cifs: fix strcat buffer overflow and reduce raciness=
 in smb21_set_oplock_level()
>>        6c65b5a9d829 brcmfmac: Add DMI nvram filename quirk for ACEPC T8 =
and T11 mini PCs
>>        e15c901c9b1f of: fix clang -Wunsequenced for be32_to_cpu()
>>        a1243cd45745 p54: drop device reference count if fails to enable =
device
>>        24cb69043d68 intel_th: msu: Fix single mode with IOMMU
>>        86901d0a34ab dcache: sort the freeing-without-RCU-delay mess for =
good.
>>        cb259d53313c md: add a missing endianness conversion in check_sb_=
changes
>>        ceaae3df28ef md: add mddev->pers to avoid potential NULL pointer =
dereference
>>        3d8c54fb4b8f md: batch flush requests.
>>        dfbe4d1af4b3 Revert "MD: fix lock contention for flush bios"
>>        be2bcbeda06b proc: prevent changes to overridden credentials
>>        e2d95e6022f9 brd: re-enable __GFP_HIGHMEM in brd_insert_page()
>>        019da3cf8d2d stm class: Fix channel bitmap on 32-bit systems
>>        e52484d4b315 stm class: Fix channel free in stm output free path
>>        7a76effe2dea parisc: Rename LEVEL to PA_ASM_LEVEL to avoid name c=
lash with DRBD code
>>        e2d87b36a59b parisc: Use PA_ASM_LEVEL in boot code
>>        fac8648ec7ce parisc: Allow live-patching of __meminit functions
>>        62c78938e3ee parisc: Add memory barrier to asm pdc and sync instr=
uctions
>>        81641f9c6039 parisc: Skip registering LED when running in QEMU
>>        f4a05c586c3a parisc: Add memory clobber to TLB purges
>>        52b905433b0d parisc: Export running_on_qemu symbol for modules
>>        5b3b51fe5bef regulator: core: fix error path for regulator_set_vo=
ltage_unlocked
>>        97346dda2c99 blk-mq: free hw queue's resource in hctx's release h=
andler
>>        860dde8d0962 mm/gup: Remove the 'write' parameter from gup_fast_p=
ermitted()
>>        b80fc1eed537 net/mlx5e: Fix ethtool rxfh commands when CONFIG_MLX=
5_EN_RXNFC is disabled
>>        5125c4d4cfca net/mlx5: Imply MLXFW in mlx5_core
>>        ac5465716ae6 net/mlx5e: Additional check for flow destination com=
parison
>>        e3e09b07aab6 net/mlx5e: Add missing ethtool driver info for repre=
sentors
>>        5048d03fa137 vsock/virtio: Initialize core virtio vsock before re=
gistering the driver
>>        ac01b87ed3ec tipc: fix modprobe tipc failed after switch order of=
 device registration
>>        51adb8ebe8c1 vsock/virtio: free packets during the socket release
>>        3f48a2fa3d79 tipc: switch order of device registration to fix a c=
rash
>>        0501b80b158a rtnetlink: always put IFLA_LINK for links with a lin=
k-netnsid
>>        4d4b20738489 ppp: deflate: Fix possible crash in deflate_init
>>        ebf4338d96e9 nfp: flower: add rcu locks when accessing netdev for=
 tunnels
>>        d818a94975ed net: usb: qmi_wwan: add Telit 0x1260 and 0x1261 comp=
ositions
>>        18b3bb2503b4 net: test nouarg before dereferencing zerocopy point=
ers
>>        4e6d54b16a89 net/mlx4_core: Change the error print to info print
>>        708c22fedf0c net: avoid weird emergency message
>>        145708e7d94c net: Always descend into dsa/
>>        6c8566ebb5f1 ipv6: prevent possible fib6 leaks
>>        aed9be48191f ipv6: fix src addr routing with the exception table
>>        8614793dbb41 Linux 5.0.18
>>        3dacabb35d7f ext4: don't update s_rev_level if not required
>>        18f59db712ce ext4: fix compile error when using BUFFER_TRACE
>>        593ddcbac4a4 s390/mm: convert to the generic get_user_pages_fast =
code
>>        97249a2034b6 s390/mm: make the pxd_offset functions more robust
>>        4999174b1a77 iov_iter: optimize page_copy_sane()
>>        6e52e4b6cf50 libnvdimm/namespace: Fix label tracking error
>>        63e54af2e570 xen/pvh: correctly setup the PV EFI interface for do=
m0
>>        a1c5c7476db0 xen/pvh: set xen_domain_type to HVM in xen_pvh_init
>>        9339434bdbb4 kbuild: turn auto.conf.cmd into a mandatory include =
file
>>        d71c6a4b31db KVM: lapic: Busy wait for timer to expire when using=
 hv_timer
>>        fae3b156b196 KVM: x86: Skip EFER vs. guest CPUID checks for host-=
initiated writes
>>        87e61d57ae37 KVM: Fix the bitmap range to copy during clear dirty
>>        295a7bd172d2 jbd2: fix potential double free
>>        a5f8b69097a3 ALSA: hda/realtek - Fix for Lenovo B50-70 inverted i=
nternal microphone bug
>>        20f6e5999787 ALSA: hda/realtek - Fixup headphone noise via runtim=
e suspend
>>        5ddcddba1be6 ALSA: hda/realtek - Corrected fixup for System76 Gaz=
elle (gaze14)
>>        ec9ff0dd9829 ext4: avoid panic during forced reboot due to aborte=
d journal
>>        297a39c6528c ext4: fix use-after-free in dx_release()
>>        256e27da8b62 ext4: fix data corruption caused by overlapping unal=
igned and aligned IO
>>        7f3b711cbf54 ext4: zero out the unused memory region in the exten=
t tree block
>>        bde5b8473bd3 tty: Don't force RISCV SBI console as preferred cons=
ole
>>        549b0b8a9479 fs/writeback.c: use rcu_barrier() to wait for inflig=
ht wb switches going into workqueue when umount
>>        f7fea7c067fb crypto: ccm - fix incompatibility between "ccm" and =
"ccm_base"
>>        638fffb11c93 ipmi:ssif: compare block number correctly for multi-=
part return messages
>>        bfc6980ff235 bcache: never set KEY_PTRS of journal key to 0 in jo=
urnal_reclaim()
>>        5fa31fabc628 bcache: fix a race between cache register and caches=
et unregister
>>        0e56cc24df1a Btrfs: fix race between send and deduplication that =
lead to failures and crashes
>>        0565f46b75e4 Btrfs: do not start a transaction at iterate_extent_=
inodes()
>>        d48e71659e07 Btrfs: do not start a transaction during fiemap
>>        e7fb540d6a06 Btrfs: send, flush dellaloc in order to avoid data l=
oss
>>        b9ee62718749 btrfs: Honour FITRIM range constraints during free s=
pace trim
>>        4afdd2d2afbb btrfs: Correctly free extent buffer in case btree_re=
ad_extent_buffer_pages fails
>>        1a6e5f745b57 btrfs: Check the first key and level for cached exte=
nt buffer
>>        f325062756d0 ext4: fix ext4_show_options for file systems w/o jou=
rnal
>>        91bf9123ce86 ext4: actually request zeroing of inode table after =
grow
>>        715f547a6299 ext4: fix use-after-free race with debug_want_extra_=
isize
>>        310aea022196 ext4: avoid drop reference to iloc.bh twice
>>        7db933229f64 ext4: ignore e_value_offs for xattrs with value-in-e=
a-inode
>>        7dfca4b97693 ext4: make sanity check in mballoc more strict
>>        39108bea309d jbd2: check superblock mapped prior to committing
>>        033b15ff6b92 tty/vt: fix write/write race in ioctl(KDSKBSENT) han=
dler
>>        770e812bbc1d tty: vt.c: Fix TIOCL_BLANKSCREEN console blanking if=
 blankinterval =3D=3D 0
>>        9537358c9452 mtd: maps: Allow MTD_PHYSMAP with MTD_RAM
>>        969859b87f8b mtd: maps: physmap: Store gpio_values correctly
>>        8a2c3433b51b mtd: spi-nor: intel-spi: Avoid crossing 4K address b=
oundary on read/write
>>        ed824ff290d3 mfd: max77620: Fix swapped FPS_PERIOD_MAX_US values
>>        12061d7ce0ee mfd: da9063: Fix OTP control register names to match=
 datasheets for DA9063/63L
>>        966e7ae49bee ACPI: PM: Set enable_for_wake for wakeup GPEs during=
 suspend-to-idle
>>        09ceb529c4ac userfaultfd: use RCU to free the task struct when fo=
rk fails
>>        3f26c01c4001 ocfs2: fix ocfs2 read inode data panic in ocfs2_iget
>>        f989305d02a4 hugetlb: use same fault hash key for shared and priv=
ate mappings
>>        6720e0bc50e9 mm/hugetlb.c: don't put_page in lock of hugetlb_lock
>>        ff191b1d827d mm/huge_memory: fix vmf_insert_pfn_{pmd, pud}() cras=
h, handle unaligned addresses
>>        535ca6f75ddb mm/mincore.c: make mincore() more conservative
>>        b5b076649d2e crypto: ccree - handle tee fips error during power m=
anagement resume
>>        2380a8464ee1 crypto: ccree - add function to handle cryptocell te=
e fips error
>>        22a44b51f2e0 crypto: ccree - HOST_POWER_DOWN_EN should be the las=
t CC access during suspend
>>        f1a7dc5d0e46 crypto: ccree - pm resume first enable the source cl=
k
>>        4a807bab1431 crypto: ccree - don't map AEAD key and IV on stack
>>        a1cb31fd79be crypto: ccree - use correct internal state sizes for=
 export
>>        3ff036422024 crypto: ccree - don't map MAC key on stack
>>        2e1679f6a1d0 crypto: ccree - fix mem leak on error path
>>        23a072df0482 crypto: ccree - remove special handling of chained s=
g
>>        8efcdb781463 bpf, arm64: remove prefetch insn in xadd mapping
>>        fd049ce703c3 ASoC: codec: hdac_hdmi add device_link to card devic=
e
>>        519511e47f79 ASoC: fsl_esai: Fix missing break in switch statemen=
t
>>        94748513d811 ASoC: RT5677-SPI: Disable 16Bit SPI Transfers
>>        dccbcc8060c8 ASoC: max98090: Fix restore of DAPM Muxes
>>        b2c90ad71e00 ALSA: hdea/realtek - Headset fixup for System76 Gaze=
lle (gaze14)
>>        0a1cf4fdc58b ALSA: hda/realtek - EAPD turn on later
>>        98ffad31068d ALSA: hda/hdmi - Consider eld_valid when reporting j=
ack event
>>        787d1c606f1a ALSA: hda/hdmi - Read the pin sense from register wh=
en repolling
>>        bc3c4c9e00b0 ALSA: usb-audio: Fix a memory leak bug
>>        592b655a306b ALSA: line6: toneport: Fix broken usage of timer for=
 delayed execution
>>        978e70ead670 mmc: sdhci-pci: Fix BYT OCP setting
>>        56f590e2e30a mmc: core: Fix tag set memory leak
>>        1ea20c66648a mmc: tegra: fix ddr signaling for non-ddr modes
>>        4ea5e92a20b9 crypto: arm64/aes-neonbs - don't access already-free=
d walk.iv
>>        b51455e5493a crypto: arm/aes-neonbs - don't access already-freed =
walk.iv
>>        86d478d06696 crypto: caam/qi2 - generate hash keys in-place
>>        fd2830991e56 crypto: caam/qi2 - fix DMA mapping of stack memory
>>        0eaed393b4ec crypto: caam/qi2 - fix zero-length buffer DMA mappin=
g
>>        86add9b56835 crypto: rockchip - update IV buffer to contain the n=
ext IV
>>        8d9cdf34aaf9 crypto: gcm - fix incompatibility between "gcm" and =
"gcm_base"
>>        246ef445e015 crypto: arm64/gcm-aes-ce - fix no-NEON fallback code
>>        47a9de26eb06 crypto: x86/crct10dif-pcl - fix use via crypto_shash=
_digest()
>>        8eb6266c8eb1 crypto: crct10dif-generic - fix use via crypto_shash=
_digest()
>>        043e69dd7fef crypto: skcipher - don't WARN on unprocessed data af=
ter slow walk step
>>        2c0f409ba69c crypto: vmx - fix copy-paste error in CTR mode
>>        8d02b83b332b crypto: ccp - Do not free psp_master when PLATFORM_I=
NIT fails
>>        fdcd8b3b745e crypto: chacha20poly1305 - set cra_name correctly
>>        d6d54c7c59c6 crypto: chacha-generic - fix use as arm64 no-NEON fa=
llback
>>        0a348941ad06 crypto: lrw - don't access already-freed walk.iv
>>        25f1509c739f crypto: salsa20 - don't access already-freed walk.iv
>>        fb7261b31a2c crypto: crypto4xx - fix cfb and ofb "overran dst buf=
fer" issues
>>        3149ac3ef4e6 crypto: crypto4xx - fix ctr-aes missing output IV
>>        5404a6ff7458 x86/MCE/AMD: Don't report L1 BTB MCA errors on some =
family 17h models
>>        ad09c6ef2dcb x86/MCE: Group AMD function prototypes in <asm/mce.h=
>
>>        b05237350b4a x86/MCE/AMD: Carve out the MC4_MISC thresholding qui=
rk
>>        e6b8b66f965e x86/MCE/AMD: Turn off MC4_MISC thresholding on all f=
amily 0x15 models
>>        993a6595b253 x86/MCE: Add an MCE-record filtering function
>>        52176123f9cb sched/x86: Save [ER]FLAGS on context switch
>>        d81b4ae57fe9 arm64: Save and restore OSDLR_EL1 across suspend/res=
ume
>>        bd254f9d1157 arm64: Clear OSDLR_EL1 on CPU boot
>>        a184f8889306 arm64: compat: Reduce address limit
>>        e57320e0177a arm64: arch_timer: Ensure counter register reads occ=
ur with seqlock held
>>        32e802d947ca arm64: mmap: Ensure file offset is treated as unsign=
ed
>>        38a6f722c01a power: supply: axp288_fuel_gauge: Add ACEPC T8 and T=
11 mini PCs to the blacklist
>>        a4e41f047a3e power: supply: axp288_charger: Fix unchecked return =
value
>>        fe3f22b7084d ARM: exynos: Fix a leaked reference by adding missin=
g of_node_put
>>        a6bc3bfb8206 mmc: sdhci-of-arasan: Add DTS property to disable DC=
MDs.
>>        bf6cb21717f4 ARM: dts: exynos: Fix audio (microphone) routing on =
Odroid XU3
>>        de42e519cbee ARM: dts: exynos: Fix interrupt for shared EINTs on =
Exynos5260
>>        3ea393bb1ca4 ARM: dts: qcom: ipq4019: enlarge PCIe BAR range
>>        5d6fa0370c51 arm64: dts: rockchip: Disable DCMDs on RK3399's eMMC=
 controller.
>>        5414a4761988 arm64: dts: rockchip: fix IO domain voltage setting =
of APIO5 on rockpro64
>>        8c1134ff70df objtool: Fix function fallthrough detection
>>        bc19bb7d8d10 x86/speculation/mds: Improve CPU buffer clear docume=
ntation
>>        d2214ccfecb5 x86/speculation/mds: Revert CPU buffer clear on doub=
le fault exit
>>        bfcac7872252 locking/rwsem: Prevent decrement of reader count bef=
ore increment
>>
>>     Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb   |  6 +++---
>>  meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb |  8 ++++----
>>  meta/recipes-kernel/linux/linux-yocto_5.0.bb      | 20 ++++++++++------=
----
>>  3 files changed, 17 insertions(+), 17 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/reci=
pes-kernel/linux/linux-yocto-rt_5.0.bb
>> index 36db6b6..b8ca4a2 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
>> @@ -11,13 +11,13 @@ python () {
>>          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kerne=
l to linux-yocto-rt to enable it")
>>  }
>>
>> -SRCREV_machine ?=3D "cc66f1b95af7b75d25b0155203df9db801273fd2"
>> -SRCREV_meta ?=3D "2bc19ce252b1ce753056b32c55f55f515698b42a"
>> +SRCREV_machine ?=3D "9376c193ebe7db89847195a749c2a200a1273c33"
>> +SRCREV_meta ?=3D "9262e21627a82956fb85eef0024135ce5179c73b"
>>
>>  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;branch=3D${KBRA=
NCH};name=3Dmachine \
>>             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;n=
ame=3Dmeta;branch=3Dyocto-5.0;destsuffix=3D${KMETA}"
>>
>> -LINUX_VERSION ?=3D "5.0.17"
>> +LINUX_VERSION ?=3D "5.0.19"
>>
>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b=
8814"
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/re=
cipes-kernel/linux/linux-yocto-tiny_5.0.bb
>> index 9888a3f..b3bb1f4 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
>> @@ -6,7 +6,7 @@ KCONFIG_MODE =3D "--allnoconfig"
>>
>>  require recipes-kernel/linux/linux-yocto.inc
>>
>> -LINUX_VERSION ?=3D "5.0.17"
>> +LINUX_VERSION ?=3D "5.0.19"
>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b=
8814"
>>
>>  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', ''=
, d)}"
>> @@ -15,9 +15,9 @@ DEPENDS +=3D "openssl-native util-linux-native"
>>  KMETA =3D "kernel-meta"
>>  KCONF_BSP_AUDIT_LEVEL =3D "2"
>>
>> -SRCREV_machine_qemuarm ?=3D "bb915f6be9a133fd702b152aa456cc31eea0936e"
>> -SRCREV_machine ?=3D "fa6f061d0da0c15c8685e6fad5b8ccc96a2e212c"
>> -SRCREV_meta ?=3D "2bc19ce252b1ce753056b32c55f55f515698b42a"
>> +SRCREV_machine_qemuarm ?=3D "fabee455f397ba8054f35a3ad5f2250bbad93bef"
>> +SRCREV_machine ?=3D "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
>> +SRCREV_meta ?=3D "9262e21627a82956fb85eef0024135ce5179c73b"
>>
>>  PV =3D "${LINUX_VERSION}+git${SRCPV}"
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes=
-kernel/linux/linux-yocto_5.0.bb
>> index dfbe495..1b2224d 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
>> @@ -11,15 +11,15 @@ KBRANCH_qemux86  ?=3D "v5.0/standard/base"
>>  KBRANCH_qemux86-64 ?=3D "v5.0/standard/base"
>>  KBRANCH_qemumips64 ?=3D "v5.0/standard/mti-malta64"
>>
>> -SRCREV_machine_qemuarm ?=3D "0cf286c38da5959520f6c01e606c722deb069fd1"
>> -SRCREV_machine_qemuarm64 ?=3D "fa6f061d0da0c15c8685e6fad5b8ccc96a2e212c=
"
>> -SRCREV_machine_qemumips ?=3D "577fd817ec6c9566277b341ac5911ea657ec5ba4"
>> -SRCREV_machine_qemuppc ?=3D "fa6f061d0da0c15c8685e6fad5b8ccc96a2e212c"
>> -SRCREV_machine_qemux86 ?=3D "fa6f061d0da0c15c8685e6fad5b8ccc96a2e212c"
>> -SRCREV_machine_qemux86-64 ?=3D "fa6f061d0da0c15c8685e6fad5b8ccc96a2e212=
c"
>> -SRCREV_machine_qemumips64 ?=3D "f9e63bc3f0ee65f03b3f9963a938668e6abf942=
5"
>> -SRCREV_machine ?=3D "fa6f061d0da0c15c8685e6fad5b8ccc96a2e212c"
>> -SRCREV_meta ?=3D "2bc19ce252b1ce753056b32c55f55f515698b42a"
>> +SRCREV_machine_qemuarm ?=3D "9161b2fa2f1cec0ba02976c389c788445858e0de"
>> +SRCREV_machine_qemuarm64 ?=3D "00638cdd8f92869a0f89ebe3289fdbd856ba9458=
"
>> +SRCREV_machine_qemumips ?=3D "7de9b8f0db98e51a666477c8e2b64f1964b45410"
>> +SRCREV_machine_qemuppc ?=3D "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
>> +SRCREV_machine_qemux86 ?=3D "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
>> +SRCREV_machine_qemux86-64 ?=3D "00638cdd8f92869a0f89ebe3289fdbd856ba945=
8"
>> +SRCREV_machine_qemumips64 ?=3D "5a8b27bcc0b16077ab8edfcd3fb25c80dc2c652=
e"
>> +SRCREV_machine ?=3D "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
>> +SRCREV_meta ?=3D "9262e21627a82956fb85eef0024135ce5179c73b"
>>
>>  # remap qemuarm to qemuarma15 for the 5.0 kernel
>>  # KMACHINE_qemuarm ?=3D "qemuarma15"
>> @@ -28,7 +28,7 @@ SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.gi=
t;name=3Dmachine;branch=3D${KBRA
>>             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;n=
ame=3Dmeta;branch=3Dyocto-5.0;destsuffix=3D${KMETA}"
>>
>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b=
8814"
>> -LINUX_VERSION ?=3D "5.0.17"
>> +LINUX_VERSION ?=3D "5.0.19"
>>
>>  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', ''=
, d)}"
>>  DEPENDS +=3D "openssl-native util-linux-native"
>>
>> --
>> To stop receiving notification emails like this one, please contact
>> the administrator of this repository.
>> --
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

