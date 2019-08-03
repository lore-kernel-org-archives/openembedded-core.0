Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id DAF4B7E26B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2019 01:51:11 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id b29so46945559lfq.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2019 18:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tPd1nnLLucfUk4tRPJ+FPBlDtivWADPFgcDnmFCj+TY=;
	b=Xjx51af75vil2tRZ+Gdpaxc3QJhFPUMygEK50bon+9k9ruT+3xAbo53WgT+AfcOB8Y
	jnVtMMskibGbstJn5Mk8EvSv4h4GGfgkAoO+ZZk1Jz3nQM5OkIA5L0u7QHGP/q8taJAH
	qI88CWRz0xL0tak42V+7Hs4yM/Cp4XwUZxUofF5ZQ4jBHC9T9S3tX3KNKfgmnwr9Fc0N
	bY4iYbighHf6553G5snKbwekn9pBUdyWO6wqOdo14kQ2lyJvDHSOk0opXF6XhsrG9UID
	SiJMyJ6/M1P6Cam9pNwJxm5CGV5s3byoCkwMV07ADVqPkJiDYd/qs4UC9HicSsTnWvil
	tQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tPd1nnLLucfUk4tRPJ+FPBlDtivWADPFgcDnmFCj+TY=;
	b=bKdKOhIL9DtVuR28V33oooaf7O9ewv2LSLXrodn+caQArVkveyQJhX17iyFNJ+Gjdf
	uPHpcjpMaH/6wlemaAByOG8W8tvBdj65tqFpLWZpGt1pWvgpcQ054ETOI0+NY+3tyL28
	JiLyjAPwDvoTh01QUD5SE1WWVjYAFNACoHjgCe4lJRm9g+rTNF8n17ef43m75a6L5mtv
	1ySfuJF8HjdFSeQQwyLGN8BhHbs+XnVmDJMrZqJAf+og5oSFt3flBU0lpDyzuaIDnvqh
	e+BvMWqYPEUayoRQ01XnQK1oWVd4qvdN7UtkVK10DTdcOmfELyJHvXpQ1d2hmNW03x5x
	EJzQ==
X-Gm-Message-State: APjAAAXVRsDxpkDukWycXAukQaamjWmwG/S0bfN6VgY5gE5TMQ+mR0oi
	WJndyLreZpVhIypAwvOIcuvJM5vq1rKYbaK1ODY=
X-Google-Smtp-Source: APXvYqwEsM+6Iped2wmHq3wEfsJrdUQASAd9Qu50QLh+F8hlb0Nhq7gE+wV8RBF2ohiPnvxSfhXCl4BuPKs0v2Va+Do=
X-Received: by 2002:a19:f24e:: with SMTP id d14mr11624958lfk.184.1564797071860;
	Fri, 02 Aug 2019 18:51:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190802023318.28441-1-bruce.ashfield@gmail.com>
	<CAMKF1sre5ZGt=W1+QQHTYJ2FY7-T8cRd9SBr=XjFbFkPCB=F0g@mail.gmail.com>
	<CADkTA4Pmcn-ZObk+Y7FxD6LPpo-BrOq9VkTEhhiPfNSgGwnHHQ@mail.gmail.com>
	<CAMKF1spyLDzw7Z_DrT+aSDj8b1xOb4=vQj-ixpQtmwD_J8Au5A@mail.gmail.com>
In-Reply-To: <CAMKF1spyLDzw7Z_DrT+aSDj8b1xOb4=vQj-ixpQtmwD_J8Au5A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 2 Aug 2019 21:51:02 -0400
Message-ID: <CADkTA4NMSVmEgA6Ptk_ZJDFN1MNP8MM_vHWd2v1g3dCnxvreQQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto/4.19: update to v4.19.61
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
X-List-Received-Date: Sat, 03 Aug 2019 01:51:12 -0000
Content-Type: multipart/alternative; boundary="0000000000009d286d058f2cb5d0"

--0000000000009d286d058f2cb5d0
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 2, 2019 at 3:58 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Aug 2, 2019 at 5:55 AM Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
> >
> >
> >
> > On Thu, Aug 1, 2019 at 11:09 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> instead of posting whole shortlog to commit perhaps pointing to ko git
> >> log is going to save us some bits in git history
> >> something like
> >>
> >>
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/log/?h=linux-4.19.y&qt=range&q=5dd6139a0aa2..7250956f6eaf
> >>
> >
> > I'm going to keep the shortlog summary.
> >
> > It makes it both searchable, and it is in response to a request for that
> info to be in the logs years ago now. It has served me well so far, so I'll
> keep up the practice. The bit of text in git history isn't going to hurt
> anyone.
> >
> Not a big deal but a nudge.
> The logs have to be readable and when it starts going across page
> boundary, For repo level searches probably doing it in kernel repo is
> more appropriate than in OE core. Sometimes it can get to where people
> stop bothering because we are adding automated
> logs. Every bit we add to git metadata does increate the repo size (
> its at 207M at this time)
>

Nudge taken :D

I've just had multiple requests to include that info, which came along the
lines of "why would I upgrade" or "what does this fix" and is a particular
CVE in the -stable release.

Having to click a link and get a summary in any other way has shown to make
it less easy to find that info.

But if things do bloat out in the repo, I'll revisit.

Bruce



>
> > Bruce
> >
> >
> >>
> >>
> >> On Thu, Aug 1, 2019 at 7:33 PM <bruce.ashfield@gmail.com> wrote:
> >> >
> >> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >> >
> >> > Integrating the korg -stable commits that comprise the following
> >> > changes:
> >> >
> >> >    7250956f6eaf Linux 4.19.61
> >> >    025eb12bb4b0 dm bufio: fix deadlock with loop device
> >> >    404f59e265ac dt-bindings: allow up to four clocks for orion-mdio
> >> >    03e6a668ea1f net: mvmdio: allow up to four clocks to be specified
> for orion-mdio
> >> >    dd87cc633ba5 blkcg: update blkcg_print_stat() to handle larger
> outputs
> >> >    73efdc5d7d3b blk-iolatency: clear use_delay when io.latency is set
> to zero
> >> >    1ab644bd02ab blk-throttle: fix zero wait time for iops throttled
> group
> >> >    91da712ff592 usb: Handle USB3 remote wakeup for LPM enabled
> devices correctly
> >> >    152ddf9f0458 Bluetooth: Add SMP workaround Microsoft Surface
> Precision Mouse bug
> >> >    98318cd31b95 intel_th: msu: Fix single mode with disabled IOMMU
> >> >    d6328d7c1a71 mtd: spinand: read returns badly if the last page has
> bitflips
> >> >    94f1db42a968 mtd: rawnand: mtk: Correct low level time calculation
> of r/w cycle
> >> >    30c6b34759f6 eCryptfs: fix a couple type promotion bugs
> >> >    92e23f5fc049 mmc: sdhci-msm: fix mutex while in spinlock
> >> >    01982f7bcc9d powerpc/pseries: Fix oops in hotplug memory notifier
> >> >    e725502b8548 powerpc/powernv/npu: Fix reference leak
> >> >    1e3b61cbc30d powerpc/watchpoint: Restore NV GPRs while returning
> from exception
> >> >    237ac0d73b55 powerpc/32s: fix suspend/resume when IBATs 4-7 are
> used
> >> >    7961981718d6 parisc: Fix kernel panic due invalid values in IAOQ0
> or IAOQ1
> >> >    a6a0daa775e8 parisc: Ensure userspace privilege for ptraced
> processes in regset functions
> >> >    ef5c2e165ab0 crypto: caam - limit output IV to CBC to work around
> CTR mode DMA issue
> >> >    376b80276d84 gpu: ipu-v3: ipu-ic: Fix saturation bit offset in
> TPMEM
> >> >    ef30c0739439 xfs: abort unaligned nowait directio early
> >> >    669c867972c0 xfs: serialize unaligned dio writes against all other
> dio writes
> >> >    d61d885b17b0 xfs: fix reporting supported extra file attributes
> for statx()
> >> >    f614ef7a34b0 xfs: reserve blocks for ifree transaction during log
> recovery
> >> >    424543a53ae0 xfs: don't ever put nlink > 0 inodes on the unlinked
> list
> >> >    3a895cc066c0 xfs: rename m_inotbt_nores to m_finobt_nores
> >> >    2ab62234e823 xfs: don't overflow xattr listent buffer
> >> >    1dc8b13cc66d xfs: flush removing page cache in
> xfs_reflink_remap_prep
> >> >    788920d12b95 xfs: fix pagecache truncation prior to reflink
> >> >    41f64437f030 include/asm-generic/bug.h: fix "cut here" for WARN_ON
> for __WARN_TAINT architectures
> >> >    afa3e571cde3 coda: pass the host file in vma->vm_file on mmap
> >> >    2c0222b48e77 libnvdimm/pfn: fix fsdax-mode namespace info-block
> zero-fields
> >> >    656d06dab4d6 HID: wacom: correct touch resolution x/y typo
> >> >    1c871b4006b2 HID: wacom: generic: Correct pad syncing
> >> >    46f71a15abe7 HID: wacom: generic: only switch the mode on devices
> with LEDs
> >> >    cb4c2b94f629 IB/mlx5: Report correctly tag matching rendezvous
> capability
> >> >    4bd953241d81 Btrfs: add missing inode version, ctime and mtime
> updates when punching hole
> >> >    fffedf5cf67e Btrfs: fix fsync not persisting dentry deletions due
> to inode evictions
> >> >    110850fffeb0 Btrfs: fix data loss after inode eviction, renaming
> it, and fsync it
> >> >    6b71c62ea9da PCI: qcom: Ensure that PERST is asserted for at least
> 100 ms
> >> >    529e71cae929 PCI: Do not poll for PME if the device is in D3cold
> >> >    4d8504004c86 PCI: hv: Fix a use-after-free bug in
> hv_eject_device_work()
> >> >    f0ff76a42ef5 intel_th: pci: Add Ice Lake NNPI support
> >> >    66a13b5e4e9c drm/edid: parse CEA blocks embedded in DisplayID
> >> >    9854e06842bc perf/x86/amd/uncore: Set the thread mask for F17h L3
> PMCs
> >> >    82c46f7b0918 perf/x86/amd/uncore: Do not set 'ThreadMask' and
> 'SliceMask' for non-L3 PMCs
> >> >    a847a5225432 perf/x86/intel: Fix spurious NMI on fixed counter
> >> >    0d4c0bb70665 x86/boot: Fix memory leak in default_get_smp_config()
> >> >    b52807e607f1 9p/virtio: Add cleanup path in p9_virtio_init
> >> >    1253882d64d0 9p/xen: Add cleanup path in p9_trans_xen_init
> >> >    007e5aaf287c xen/events: fix binding user event channels to cpus
> >> >    e380170b3b3a dm zoned: fix zone state management race
> >> >    1e4247d7958b padata: use smp_mb in padata_reorder to avoid
> orphaned padata jobs
> >> >    0489d808a5f2 drm/nouveau/i2c: Enable i2c pads & busses during
> preinit
> >> >    c77cbc873586 kconfig: fix missing choice values in auto.conf
> >> >    2c7b50c7b1d0 fs/proc/proc_sysctl.c: fix the default values of
> i_uid/i_gid on /proc/sys inodes.
> >> >    ba271659ad42 arm64: tegra: Fix AGIC register range
> >> >    ba27a25df6df KVM: x86/vPMU: refine kvm_pmu err msg when event
> creation failed
> >> >    87bae91a0fe9 media: videobuf2-dma-sg: Prevent size from overflowing
> >> >    cb2e2b0ae554 media: videobuf2-core: Prevent size alignment
> wrapping buffer size to 0
> >> >    deb78bd24e0c media: coda: Remove unbalanced and unneeded mutex
> unlock
> >> >    fc0232e24541 media: v4l2: Test type instead of cfg->type in
> v4l2_ctrl_new_custom()
> >> >    a4c4c06f1755 ALSA: hda/realtek: apply ALC891 headset fixup to one
> Dell machine
> >> >    8ba78e4d564e ALSA: hda/realtek - Fixed Headphone Mic can't record
> on Dell platform
> >> >    c92212a81617 ALSA: seq: Break too long mutex context in the write
> loop
> >> >    eb6c84e4b4f2 raid5-cache: Need to do start() part job after adding
> journal device
> >> >    3f42c0000b23 ASoC: dapm: Adapt for debugfs API change
> >> >    677b2aa3be5c lib/scatterlist: Fix mapping iterator when sg->offset
> is greater than PAGE_SIZE
> >> >    0b174bac4e43 pnfs: Fix a problem where we gratuitously start doing
> I/O through the MDS
> >> >    f64ff5914f00 pNFS: Fix a typo in pnfs_update_layout
> >> >    603e7497bf27 pnfs/flexfiles: Fix PTR_ERR() dereferences in
> ff_layout_track_ds_error
> >> >    5347e61954fc NFSv4: Handle the special Linux file open access mode
> >> >    6825ff011c7c iwlwifi: fix RF-Kill interrupt while FW load for gen2
> devices
> >> >    a32e2ceca0ef iwlwifi: don't WARN when calling
> iwl_get_shared_mem_conf with RF-Kill
> >> >    d9ce0788da91 iwlwifi: pcie: fix ALIVE interrupt handling for gen2
> devices w/o MSI-X
> >> >    04c52c105a38 iwlwifi: pcie: don't service an interrupt that was
> masked
> >> >    7ebddd5fe217 arm64: tegra: Update Jetson TX1 GPU regulator timings
> >> >    042451b921b1 regulator: s2mps11: Fix buck7 and buck8 wrong voltages
> >> >    8da63aa46e26 Input: alps - fix a mismatch between a condition
> check and its comment
> >> >    81368a9a98d9 Input: synaptics - whitelist Lenovo T580 SMBus
> intertouch
> >> >    cfb9250619c8 Input: alps - don't handle ALPS cs19 trackpoint-only
> device
> >> >    d657077eda7b Input: gtco - bounds check collection indent level
> >> >    f11ba9df8eed bcache: destroy dc->writeback_write_wq if failed to
> create dc->writeback_thread
> >> >    2ab14861d2eb bcache: fix mistaken sysfs entry for io_error counter
> >> >    3c466df8fc59 bcache: ignore read-ahead request failure on backing
> device
> >> >    4fc48cd21a31 bcache: Revert "bcache: free heap
> cache_set->flush_btree in bch_journal_free"
> >> >    ab966241d59a bcache: Revert "bcache: fix high CPU occupancy during
> journal"
> >> >    58169c189bd6 Revert "bcache: set CACHE_SET_IO_DISABLE in
> bch_cached_dev_error()"
> >> >    c3b7d27f3746 crypto: crypto4xx - fix a potential double free in
> ppc4xx_trng_probe
> >> >    a9fd1795fee6 crypto: ccp/gcm - use const time tag comparison.
> >> >    561c4424f1e3 crypto: ccp - memset structure fields to zero before
> reuse
> >> >    13805a5df489 crypto: crypto4xx - block ciphers should only accept
> complete blocks
> >> >    17e63172d536 crypto: crypto4xx - fix blocksize for cfb and ofb
> >> >    4598094d24c7 crypto: crypto4xx - fix AES CTR blocksize value
> >> >    1c9b0a766513 crypto: chacha20poly1305 - fix atomic sleep when
> using async algorithm
> >> >    eb99c084da28 crypto: arm64/sha2-ce - correct digest for empty data
> in finup
> >> >    4230e09e61e6 crypto: arm64/sha1-ce - correct digest for empty data
> in finup
> >> >    52f07c1ac70e crypto: ccp - Validate the the error value used to
> index error messages
> >> >    bed97f646997 crypto: ghash - fix unaligned memory access in
> ghash_setkey()
> >> >    ce7ec07abaf7 scsi: mac_scsi: Fix pseudo DMA implementation, take 2
> >> >    de769c762626 scsi: mac_scsi: Increase PIO/PDMA transfer length
> threshold
> >> >    3e9534fa5046 scsi: megaraid_sas: Fix calculation of target ID
> >> >    1334a3e2d6d0 scsi: core: Fix race on creating sense cache
> >> >    58f59f6072ab Revert "scsi: ncr5380: Increase register polling
> limit"
> >> >    7cfded7a705c scsi: NCR5380: Always re-enable reselection interrupt
> >> >    d91baba81a6e scsi: NCR5380: Reduce goto statements in
> NCR5380_select()
> >> >    e73db096691e xen: let alloc_xenballooned_pages() fail if not
> enough memory free
> >> >    ff54c44f1038 floppy: fix out-of-bounds read in copy_buffer
> >> >    a9444d9d0f6f floppy: fix invalid pointer dereference in drive_name
> >> >    5b565f3276f3 floppy: fix out-of-bounds read in next_valid_format
> >> >    6e34fd07484a floppy: fix div-by-zero in setup_format_params
> >> >    7c16c5eae41a iavf: fix dereference of null rx_buffer pointer
> >> >    e9896b29d010 net: mvmdio: defer probe of orion-mdio if a clock is
> not ready
> >> >    5f6c5f5ae25e gtp: fix use-after-free in gtp_newlink()
> >> >    141222216438 gtp: fix use-after-free in gtp_encap_destroy()
> >> >    0a5eca2c949c gtp: fix Illegal context switch in RCU read-side
> critical section.
> >> >    e117a04133c6 gtp: fix suspicious RCU usage
> >> >    202de90df2b7 Bluetooth: validate BLE connection interval updates
> >> >    ca33af18b5fc gtp: add missing gtp_encap_disable_sock() in
> gtp_encap_enable()
> >> >    0fdb922d0ef0 Bluetooth: Check state in l2cap_disconnect_rsp
> >> >    3b57b7a3a82a perf tests: Fix record+probe_libc_inet_pton.sh for
> powerpc64
> >> >    c814f618b799 Bluetooth: 6lowpan: search for destination address in
> all peers
> >> >    c82c4910e9e6 Bluetooth: Add new 13d3:3501 QCA_ROME device
> >> >    1cbce19bd697 Bluetooth: Add new 13d3:3491 QCA_ROME device
> >> >    578658df21d5 Bluetooth: hci_bcsp: Fix memory leak in rx_skb
> >> >    9d47bd217539 tools: bpftool: Fix json dump crash on powerpc
> >> >    2ad04d31bb3e gpiolib: Fix references to
> gpiod_[gs]et_*value_cansleep() variants
> >> >    157d1c7a1a00 bonding: validate ip header before check IPPROTO_IGMP
> >> >    88f751b066f2 selftests: bpf: fix inlines in test_lwt_seg6local
> >> >    ef5b204336b3 bpf, libbpf, smatch: Fix potential NULL pointer
> dereference
> >> >    0f2f2cebe64d rxrpc: Fix oops in tracepoint
> >> >    ca37b9a74689 net: usb: asix: init MAC address buffers
> >> >    51216937c319 bnx2x: Prevent ptp_task to be rescheduled indefinitely
> >> >    e358d2ab42f8 perf stat: Fix group lookup for metric group
> >> >    a64e018be77a perf stat: Make metric event lookup more robust
> >> >    7343178ccf7d bpf: fix uapi bpf_prog_info fields alignment
> >> >    af3790a46a55 iwlwifi: mvm: Drop large non sta frames
> >> >    036184af23e0 igb: clear out skb->tstamp after reading the txtime
> >> >    0024b12b776c net: mvpp2: prs: Don't override the sign bit in SRAM
> parser shift
> >> >    05592b9b7f25 ath10k: destroy sdio workqueue while remove sdio
> module
> >> >    26d86b29e806 net: hns3: add some error checking in hclge_tm module
> >> >    ddfdbcccd71a net: hns3: fix a -Wformat-nonliteral compile warning
> >> >    95d084809495 bcache: fix potential deadlock in cached_def_free()
> >> >    4b7758e9c4ed bcache: check c->gc_thread by IS_ERR_OR_NULL in
> cache_set_flush()
> >> >    81b88c05bc45 bcache: acquire bch_register_lock later in
> cached_dev_free()
> >> >    d81080a0bcf8 bcache: check CACHE_SET_IO_DISABLE bit in
> bch_journal()
> >> >    57cfb755c356 bcache: check CACHE_SET_IO_DISABLE in allocator code
> >> >    e78d1d234469 EDAC: Fix global-out-of-bounds write when setting
> edac_mc_poll_msec
> >> >    e54cc89e6f0a wil6210: drop old event after wmi_call timeout
> >> >    0388597d0627 crypto: asymmetric_keys - select CRYPTO_HASH where
> needed
> >> >    1dea395c9e12 crypto: serpent - mark __serpent_setkey_sbox noinline
> >> >    b346070c72cd ixgbe: Check DDM existence in transceiver before
> access
> >> >    0340c621eca8 rslib: Fix handling of of caller provided syndrome
> >> >    8ba93c59441a rslib: Fix decoding of shortened codes
> >> >    dad0b17e4a4e xsk: Properly terminate assignment in
> xskq_produce_flush_desc
> >> >    e69fac59c493 clocksource/drivers/exynos_mct: Increase priority
> over ARM arch timer
> >> >    12e20eca894b libata: don't request sense data on !ZAC ATA devices
> >> >    6e6bc34f8570 ASoC: Intel: hdac_hdmi: Set ops to NULL on remove
> >> >    1182ff224847 perf tools: Increase MAX_NR_CPUS and MAX_CACHES
> >> >    7201cc227d4a ath10k: fix PCIE device wake up failed
> >> >    8a808fadc9f7 ath10k: add missing error handling
> >> >    fe2ceeb4cffc ipvs: fix tinfo memory leak in start_sync_thread
> >> >    20de38d282b3 mt7601u: fix possible memory leak when the device is
> disconnected
> >> >    033577880135 x86/build: Add 'set -e' to mkcapflags.sh to delete
> broken capflags.c
> >> >    3f7952b275c8 mt7601u: do not schedule rx_tasklet when the device
> has been disconnected
> >> >    6f6e126e1995 rtlwifi: rtl8192cu: fix error handle when usb probe
> failed
> >> >    41864adfee2e net: stmmac: sun8i: force select external PHY when no
> internal one
> >> >    bce037abc29f media: hdpvr: fix locking and a missing msleep
> >> >    43b9fdc48377 media: vimc: cap: check v4l2_fill_pixfmt return value
> >> >    d562537dbf0d media: coda: increment sequence offset for the last
> returned frame
> >> >    3697c12c4425 media: coda: fix last buffer handling in
> V4L2_ENC_CMD_STOP
> >> >    6fd3e9f65db9 media: coda: fix mpeg2 sequence number handling
> >> >    c647c00f28af acpi/arm64: ignore 5.1 FADTs that are reported as 5.0
> >> >    b9f547b7bdd9 timer_list: Guard procfs specific code
> >> >    d86c0b73f75b ntp: Limit TAI-UTC offset
> >> >    8d8f0b9009d0 media: i2c: fix warning same module names
> >> >    6439110fbeee media: s5p-mfc: Make additional clocks optional
> >> >    57de3c78f0b7 ipvs: defer hook registration to avoid leaks
> >> >    06a3cd416224 ipsec: select crypto ciphers for xfrm_algo
> >> >    723ba7938492 arm64: Do not enable IRQs for ct_user_exit
> >> >    010bfbc93424 lightnvm: pblk: fix freeing of merged pages
> >> >    762bba1b7ee7 nvme-pci: set the errno on ctrl state change error
> >> >    c876a66553d7 nvme-pci: properly report state change failure in
> nvme_reset_work
> >> >    f0c83dd15ee1 nvme: fix possible io failures when removing
> multipathed ns
> >> >    10cc3a65a55b EDAC/sysfs: Fix memory leak when creating a csrow
> object
> >> >    f6502ce4f050 ACPICA: Clear status of GPEs on first direct enable
> >> >    3ae98dc2db1e blk-iolatency: only account submitted bios
> >> >    a952f7c384aa x86/cacheinfo: Fix a -Wtype-limits warning
> >> >    3252b29ea41b ipoib: correcly show a VF hardware address
> >> >    0e2af9b06c00 vhost_net: disable zerocopy by default
> >> >    4c57957ed6c8 perf evsel: Make perf_evsel__name() accept a NULL
> argument
> >> >    9e0bcb59b6c0 x86/atomic: Fix smp_mb__{before,after}_atomic()
> >> >    dd0260fd1e3a perf/x86/intel/uncore: Handle invalid event coding
> for free-running counter
> >> >    7fc96cd2b0de sched/fair: Fix "runnable_avg_yN_inv" not used
> warnings
> >> >    d8b7db6c5004 sched/core: Add __sched tag for io_schedule()
> >> >    930655b01367 xfrm: fix sa selector validation
> >> >    b7d66bbc8ad3 blkcg, writeback: dead memcgs shouldn't contribute to
> writeback ownership arbitration
> >> >    c8f75e753784 block: null_blk: fix race condition for null_del_dev
> >> >    1a3706d8f800 net: hns3: fix for skb leak when doing selftest
> >> >    6a47a42f51cf qed: iWARP - Fix tc for MPA ll2 connection
> >> >    670fb965da03 x86/cpufeatures: Add FDP_EXCPTN_ONLY and ZERO_FCS_FDS
> >> >    366ae49ed78c rcu: Force inlining of rcu_read_lock()
> >> >    1fb3ce14f28d ASoC: meson: axg-tdm: fix sample clock inversion
> >> >    32df4043aed4 x86/cpu: Add Ice Lake NNPI to Intel family
> >> >    914026d58100 selinux: fix empty write to keycreate file
> >> >    10e3788e6575 media: s5p-mfc: fix reading min scratch buffer size
> on MFC v6/v7
> >> >    7c10f8941b95 bpf: silence warning messages in core
> >> >    b01bf44c363d regmap: fix bulk writes on paged registers
> >> >    544cd592ca72 gpio: omap: ensure irq is enabled before wakeup
> >> >    ddeef7a00050 gpio: omap: fix lack of irqstatus_raw0 for OMAP4
> >> >    79644b600850 iommu: Fix a leak in iommu_insert_resv_region
> >> >    f2a4624be8f3 media: fdp1: Support M3N and E3 platforms
> >> >    63e53991d791 media: uvcvideo: Fix access to uninitialized fields
> on probe error
> >> >    c844f4da9b92 irqchip/meson-gpio: Add support for Meson-G12A SoC
> >> >    eac8b39d089a perf report: Fix OOM error in TUI mode on s390
> >> >    be32a9dc3f62 perf test 6: Fix missing kvm module load for s390
> >> >    3662d8bca087 perf cs-etm: Properly set the value of 'old' and
> 'head' in snapshot mode
> >> >    ac510285d40b ipset: Fix memory accounting for hash types on resize
> >> >    c7bf2df45044 net: sfp: add mutex to prevent concurrent state checks
> >> >    fa4059c5497e RAS/CEC: Fix pfn insertion
> >> >    99dcd701465f s390/qdio: handle PENDING state for QEBSM devices
> >> >    a76f32cbd38c net: axienet: Fix race condition causing TX hang
> >> >    9d643358386d net: fec: Do not use netdev messages too early
> >> >    403c43921479 crypto: inside-secure - do not rely on the hardware
> last bit for result descriptors
> >> >    50331c64f3dd net: stmmac: modify default value of tx-frames
> >> >    1a0a837afc41 net: stmmac: dwmac4: fix flow control issue
> >> >    713737cac327 perf jvmti: Address gcc string overflow warning for
> strncpy()
> >> >    fb83987cbe6b arm64: mm: make CONFIG_ZONE_DMA32 configurable
> >> >    c360eb592938 cpupower : frequency-set -r option misses the last
> cpu in related cpu list
> >> >    cac3032062e5 net: hns3: set ops to null when unregister ad_dev
> >> >    35407917b0bc media: wl128x: Fix some error handling in
> fm_v4l2_init_video_device()
> >> >    2fbde2746597 locking/lockdep: Fix merging of hlocks with non-zero
> references
> >> >    909034b8ac64 batman-adv: Fix duplicated OGMs on NETDEV_UP
> >> >    aa2ad8b6fb2f tua6100: Avoid build warnings.
> >> >    9072450736d0 crypto: talitos - Align SEC1 accesses to 32 bits
> boundaries.
> >> >    9d25aedef08f crypto: talitos - properly handle split ICV.
> >> >    fc25cfb03ea2 net: phy: Check against net_device being NULL
> >> >    ef10d46d04a5 media: staging: media: davinci_vpfe: - Fix for memory
> leak if decoder initialization fails.
> >> >    e36f25627362 media: saa7164: fix remove_proc_entry warning
> >> >    ea904c9f6a33 media: mc-device.c: don't memset __user pointer
> contents
> >> >    a6dd4862b98f perf annotate TUI browser: Do not use member from
> variable within its own initialization
> >> >    71b029a5d908 fscrypt: clean up some BUG_ON()s in block
> encryption/decryption
> >> >    2c6acf7478aa xfrm: Fix xfrm sel prefix length validation
> >> >    0544b64ceb64 af_key: fix leaks in key_pol_get_resp and dump_sp.
> >> >    b397462a010d signal/pid_namespace: Fix reboot_pid_ns to use
> send_sig not force_sig
> >> >    1c8e736115cd qed: Set the doorbell address correctly
> >> >    df6680de7a20 net: stmmac: dwmac4/5: Clear unused address entries
> >> >    d3969670cb5a net: stmmac: dwmac1000: Clear unused address entries
> >> >    810441651a8a media: media_device_enum_links32: clean a reserved
> field
> >> >    6fb470ace862 media: vpss: fix a potential NULL pointer dereference
> >> >    70da38e80509 media: marvell-ccic: fix DMA s/g desc number
> calculation
> >> >    add712b63185 media: ov7740: avoid invalid framesize setting
> >> >    b0e199e13495 crypto: talitos - fix skcipher failure due to wrong
> output IV
> >> >    6452712f95e3 media: spi: IR LED: add missing of table registration
> >> >    94f2b518a788 media: dvb: usb: fix use after free in
> dvb_usb_device_exit
> >> >    8f855c09e2af batman-adv: fix for leaked TVLV handler.
> >> >    83d133c96aad regmap: debugfs: Fix memory leak in
> regmap_debugfs_init
> >> >    2b5b12c0c1b7 ath: DFS JP domain W56 fixed pulse type 3 RADAR
> detection
> >> >    da153c0c5746 wil6210: fix spurious interrupts in 3-msi
> >> >    a4bf4fecff16 ath10k: add peer id check in ath10k_peer_find_by_id
> >> >    83c911f4bd68 ath6kl: add some bounds checking
> >> >    42dcbf20e182 ath9k: Check for errors when reading SREV register
> >> >    7e19e658e535 ath10k: Do not send probe response template for mesh
> >> >    009edc622bba wil6210: fix potential out-of-bounds read
> >> >    09593c25b975 dmaengine: imx-sdma: fix use-after-free on probe
> error path
> >> >    06e15cf5aead scsi: iscsi: set auth_protocol back to NULL if CHAP_A
> value is not supported
> >> >    37cb02da44dc arm64/efi: Mark __efistub_stext_offset as an absolute
> symbol explicitly
> >> >    73ebefc814ef MIPS: fix build on non-linux hosts
> >> >    7202df6be6ec MIPS: ath79: fix ar933x uart parity mode
> >> >    be9b6782a9eb Linux 4.19.60
> >> >    d173ce091c1a x86/entry/32: Fix ENDPROC of common_spurious
> >> >    466bdfc6c4d6 drm/udl: move to embedding drm device inside udl
> device.
> >> >    af48f7d79fae drm/udl: Replace drm_dev_unref with drm_dev_put
> >> >    cfd99eccede5 drm/udl: introduce a macro to convert dev to udl.
> >> >    8f14cf159e9f regmap-irq: do not write mask register if mask_base
> is zero
> >> >    820b010743ee crypto/NX: Set receive window credits to max number
> of CRBs in RxFIFO
> >> >    b24c6403633d crypto: talitos - fix hash on SEC1.
> >> >    ff1ce8ef1f88 crypto: talitos - move struct talitos_edesc into
> talitos.h
> >> >    b578b87bcab6 s390/qdio: don't touch the dsci in
> tiqdio_add_input_queues()
> >> >    b1d52630b12a s390/qdio: (re-)initialize tiqdio list entries
> >> >    02eb533e940a s390: fix stfle zero padding
> >> >    9db915738e40 ARC: hide unused function unw_hdr_alloc
> >> >    fc6975ee932b x86/irq: Seperate unused system vectors from spurious
> entry again
> >> >    9494cd392885 x86/irq: Handle spurious interrupt after shutdown
> gracefully
> >> >    7897f5a443fb x86/ioapic: Implement irq_get_irqchip_state() callback
> >> >    6074f6043c49 genirq: Add optional hardware synchronization for
> shutdown
> >> >    3f10ccc29780 genirq: Fix misleading synchronize_irq() documentation
> >> >    578db1aa595b genirq: Delay deactivation in free_irq()
> >> >    2656ee5a5ad5 linux/kernel.h: fix overflow for DIV_ROUND_UP_ULL
> >> >    9c875e8556d4 pinctrl: mediatek: Update cur_mask in mask/mask ops
> >> >    f6e01328cb0e cpu/hotplug: Fix out-of-bounds read when setting fail
> state
> >> >    fa99487a43cf pinctrl: mediatek: Ignore interrupts that are wake
> only during resume
> >> >    cd2646e57ec5 HID: multitouch: Add pointstick support for ALPS
> Touchpad
> >> >    9ea3b131441e HID: chicony: add another quirk for PixArt mouse
> >> >    94968c37b6d3 x86/boot/64: Add missing fixup_pointer() for
> next_early_pgt access
> >> >    729d25f43b64 x86/boot/64: Fix crash if kernel image crosses page
> table boundary
> >> >    136847140cc8 dm verity: use message limit for data block
> corruption message
> >> >    042be78692ae dm table: don't copy from a NULL pointer in
> realloc_argv()
> >> >    0fc080bc9a72 pinctrl: mcp23s08: Fix add_data and
> irqchip_add_nested call order
> >> >    00640eb0eafa ARM: dts: imx6ul: fix PWM[1-4] interrupts
> >> >    a8cc2a2c2841 sis900: fix TX completion
> >> >    3232bccddeba ppp: mppe: Add softdep to arc4
> >> >    5ec7753c7c9e be2net: fix link failure after ethtool offline test
> >> >    2a6ee36917f0 x86/apic: Fix integer overflow on 10 bit left shift
> of cpu_khz
> >> >    fdfff855cd36 afs: Fix uninitialised spinlock
> afs_volume::cb_break_lock
> >> >    d47f06ab0c0e ARM: omap2: remove incorrect __init annotation
> >> >    5d3c45538151 ARM: dts: gemini Fix up DNS-313 compatible string
> >> >    afda29dc5ac6 perf/core: Fix perf_sample_regs_user() mm check
> >> >    627fdcc9b718 efi/bgrt: Drop BGRT status field reserved bits check
> >> >    cf4deb2d4de6 clk: ti: clkctrl: Fix returning uninitialized data
> >> >    ff232a47567f irqchip/gic-v3-its: Fix command queue pointer
> comparison bug
> >> >    244db54441a1 firmware: improve LSM/IMA security behaviour
> >> >    079d7f16a973 drivers: base: cacheinfo: Ensure cpu hotplug work is
> done before Intel RDT
> >> >    68048dce650e nilfs2: do not use unexported
> cpu_to_le32()/le32_to_cpu() in uapi header
> >> >    86859ef10d25 Input: synaptics - enable SMBUS on T480 thinkpad
> trackpad
> >> >    438a3dc6f2c3 e1000e: start network tx queue only when link is up
> >> >    8020568b404b Revert "e1000e: fix cyclic resets at link up with
> active tx"
> >> >    3bd837bfe431 Linux 4.19.59
> >> >    70bae382b3dc staging: rtl8712: reduce stack usage, again
> >> >    b46475ecd930 staging: bcm2835-camera: Handle empty EOS buffers
> whilst streaming
> >> >    0ee144effcc3 staging: bcm2835-camera: Remove check of the number
> of buffers supplied
> >> >    fcbc6ddcd624 staging: bcm2835-camera: Ensure all buffers are
> returned on disable
> >> >    4502c43d7f3b staging: bcm2835-camera: Replace spinlock protecting
> context_map with mutex
> >> >    22a20b9f6d9f staging: fsl-dpaa2/ethsw: fix memory leak of
> switchdev_work
> >> >    cc396afa1959 MIPS: Remove superfluous check for __linux__
> >> >    d202b5adccfb VMCI: Fix integer overflow in VMCI handle arrays
> >> >    486c32325caa carl9170: fix misuse of device driver API
> >> >    524ad00e80b7 binder: fix memory leak in error path
> >> >    294b893a41cd lkdtm: support llvm-objcopy
> >> >    5c90a2ecd08a HID: Add another Primax PIXART OEM mouse quirk
> >> >    c04c751bef87 staging: comedi: amplc_pci230: fix null pointer deref
> on interrupt
> >> >    4e49c6c91c18 staging: comedi: dt282x: fix a null pointer deref on
> interrupt
> >> >    8419fd562a09 drivers/usb/typec/tps6598x.c: fix 4CC cmd write
> >> >    63b3028cd590 drivers/usb/typec/tps6598x.c: fix portinfo width
> >> >    57e16e0d8c68 usb: renesas_usbhs: add a workaround for a race
> condition of workqueue
> >> >    aa9a8038ea8b usb: dwc2: use a longer AHB idle timeout in
> dwc2_core_reset()
> >> >    cac4a04202fb usb: gadget: ether: Fix race between
> gether_disconnect and rx_submit
> >> >    449a8d08a4bc p54usb: Fix race between disconnect and firmware
> loading
> >> >    135d9ba3b285 Revert "serial: 8250: Don't service RX FIFO if
> interrupts are disabled"
> >> >    0891268f36a2 USB: serial: option: add support for GosunCn ME3630
> RNDIS mode
> >> >    0a1c811bf033 USB: serial: ftdi_sio: add ID for isodebug v1
> >> >    bb902b6c87ff mwifiex: Don't abort on small, spec-compliant vendor
> IEs
> >> >    ffbbd626e1ce mwifiex: Abort at too short BSS descriptor element
> >> >    a2a24b57c27a Documentation/admin: Remove the vsyscall=native
> documentation
> >> >    8a815007f5fe Documentation: Add section about CPU vulnerabilities
> for Spectre
> >> >    bd9604022eb3 x86/tls: Fix possible spectre-v1 in
> do_get_thread_area()
> >> >    68ff28291a4f x86/ptrace: Fix possible spectre-v1 in
> ptrace_get_debugreg()
> >> >    d8e26651ce8d perf pmu: Fix uncore PMU alias list for ARM64
> >> >    018524b75852 block, bfq: NULL out the bic when it's no longer valid
> >> >    ff75e5f41e88 ALSA: hda/realtek - Headphone Mic can't record after
> S3
> >> >    87c3262b00d8 ALSA: usb-audio: Fix parse of UAC2 Extension Units
> >> >    ef374f5a2731 media: stv0297: fix frequency range limit
> >> >    5db079eb0acd udf: Fix incorrect final NOT_ALLOCATED (hole) extent
> length
> >> >    0fc3e9b9b603 fscrypt: don't set policy for a dead directory
> >> >    e9f76b954336 net :sunrpc :clnt :Fix xps refcount imbalance on the
> error path
> >> >    810cfc3d9d2e NFS4: Only set creation opendata if O_CREAT
> >> >    7075654ce7d0 net: dsa: mv88e6xxx: fix shift of FID bits in
> mv88e6185_g1_vtu_loadpurge()
> >> >    606561e16186 quota: fix a problem about transfer quota
> >> >    5ad566af08c1 scsi: qedi: Check targetname while finding boot
> target information
> >> >    37232abb6ea3 net: lio_core: fix potential sign-extension overflow
> on large shift
> >> >    740b2ac49518 ip6_tunnel: allow not to count pkts on tstats by
> passing dev as NULL
> >> >    a02ac12d2d48 drm: return -EFAULT if copy_to_user() fails
> >> >    4c938a635fc3 bnx2x: Check if transceiver implements DDM before
> access
> >> >    270ae00a0346 md: fix for divide error in status_resync
> >> >    5533d9ed4112 mmc: core: complete HS400 before checking status
> >> >    2da80536f629 qmi_wwan: extend permitted QMAP mux_id value range
> >> >    dc84e98393f7 qmi_wwan: avoid RCU stalls on device disconnect when
> in QMAP mode
> >> >    dbc6a83cf2bc qmi_wwan: add support for QMAP padding in the RX path
> >> >    292ba5b1faf4 bpf, x64: fix stack layout of JITed bpf code
> >> >    4c2ce7addda8 bpf, devmap: Add missing RCU read lock on flush
> >> >    ab44f8bcf2e5 bpf, devmap: Add missing bulk queue free
> >> >    8d09e862103b bpf, devmap: Fix premature entry free on destroying
> map
> >> >    ba0afe520ee9 mac80211: do not start any work during reconfigure
> flow
> >> >    de8cf2c0bc64 mac80211: only warn once on chanctx_conf being NULL
> >> >    9c2dd6d47131 ARM: davinci: da8xx: specify dma_coherent_mask for
> lcdc
> >> >    3bbcc8b9ad37 ARM: davinci: da850-evm: call
> regulator_has_full_constraints()
> >> >    443250665388 mlxsw: spectrum: Disallow prio-tagged packets when
> PVID is removed
> >> >    512bbb114b99 KVM: arm/arm64: vgic: Fix kvm_device leak in
> vgic_its_destroy
> >> >    41420ac584d7 Input: imx_keypad - make sure keyboard can always
> wake up system
> >> >    b71f312e9bf7 riscv: Fix udelay in RV32.
> >> >    122c6a71c08d drm/vmwgfx: fix a warning due to missing dma_parms
> >> >    d3861d4ca94c drm/vmwgfx: Honor the sg list segment size limitation
> >> >    c0b12abd1828 s390/boot: disable address-of-packed-member warning
> >> >    e71daed5176f ARM: dts: am335x phytec boards: Fix cd-gpios active
> level
> >> >    822c2ee81c63 ibmvnic: Fix unchecked return codes of memory
> allocations
> >> >    0f06004d16be ibmvnic: Refresh device multicast list after reset
> >> >    e65dd528bb8e ibmvnic: Do not close unopened driver during reset
> >> >    374180b11b29 net: phy: rename Asix Electronics PHY driver
> >> >    473a75c7fab5 can: af_can: Fix error path of can_init()
> >> >    486954277fc1 can: m_can: implement errata "Needless activation of
> MRAF irq"
> >> >    270149f78b9c can: mcp251x: add support for mcp25625
> >> >    33672c74b484 dt-bindings: can: mcp251x: add mcp25625 support
> >> >    07c96e8e8021 soundwire: intel: set dai min and max channels
> correctly
> >> >    c7e427e28a3a mwifiex: Fix heap overflow in
> mwifiex_uap_parse_tail_ies()
> >> >    8e115a079940 iwlwifi: Fix double-free problems in
> iwl_req_fw_callback()
> >> >    d4c0f752c1d2 mwifiex: Fix possible buffer overflows at parsing bss
> descriptor
> >> >    b8588a0981b7 mac80211: free peer keys before vif down in mesh
> >> >    acc42e5c2322 mac80211: mesh: fix RCU warning
> >> >    e3868c1a462f staging:iio:ad7150: fix threshold mode config bit
> >> >    6b1ce3971e05 soundwire: stream: fix out of boundary access on port
> properties
> >> >    6be857082611 bpf: sockmap, fix use after free from sleep in psock
> backlog workqueue
> >> >    bc84982f977d mac80211: fix rate reporting inside
> cfg80211_calculate_bitrate_he()
> >> >    3c24a931e972 samples, bpf: suppress compiler warning
> >> >    e7779115bbd9 samples, bpf: fix to change the buffer size for read()
> >> >    fe01e93c3fd1 Input: elantech - enable middle button support on 2
> ThinkPads
> >> >    2883fc1ece69 soc: bcm: brcmstb: biuctrl: Register writes require a
> barrier
> >> >    2f1c962a7416 soc: brcmstb: Fix error path for unsupported CPUs
> >> >    e8250f730410 crypto: talitos - rename alternative AEAD algos.
> >> >    7a6bfa08b938 Linux 4.19.58
> >> >    f37de75cb8eb dmaengine: imx-sdma: remove BD_INTR for channel0
> >> >    018c968de710 dmaengine: qcom: bam_dma: Fix completed descriptors
> count
> >> >    870de1499505 MIPS: have "plain" make calls build dtbs for selected
> platforms
> >> >    8957895b35de MIPS: Add missing EHB in mtc0 -> mfc0 sequence.
> >> >    2b8f8a80ca8b MIPS: Fix bounds check virt_addr_valid
> >> >    80b25628ff26 svcrdma: Ignore source port when computing DRC hash
> >> >    8129a10ce78f nfsd: Fix overflow causing non-working mounts on 1 TB
> machines
> >> >    f25c06955f8d KVM: LAPIC: Fix pending interrupt in IRR blocked by
> software disable LAPIC
> >> >    f6472f50fbfc KVM: x86: degrade WARN to pr_warn_ratelimited
> >> >    ac0024baf073 netfilter: ipv6: nf_defrag: accept duplicate
> fragments again
> >> >    54e8cf41b20b bpf: fix bpf_jit_limit knob for PAGE_SIZE >= 64K
> >> >    e6c288f7307e net: hns: fix unsigned comparison to less than zero
> >> >    4f24801ef50b sc16is7xx: move label 'err_spi' to correct section
> >> >    318244f3641a netfilter: ipv6: nf_defrag: fix leakage of unqueued
> fragments
> >> >    a8891c5e2251 ip6: fix skb leak in ip6frag_expire_frag_queue()
> >> >    382bc84da904 rds: Fix warning.
> >> >    7e6af1fa80b8 ALSA: hda: Initialize power_state field properly
> >> >    c8c88293bf72 net: hns: Fixes the missing put_device in positive
> leg for roce reset
> >> >    6bf9677300f3 x86/boot/compressed/64: Do not corrupt EDX on
> EFER.LME=1 setting
> >> >    b91ec6ae14da selftests: fib_rule_tests: Fix icmp proto with ipv6
> >> >    e2851c3ee0be scsi: tcmu: fix use after free
> >> >    04096b3beace mac80211: mesh: fix missing unlock on error in
> table_path_del()
> >> >    e2379b044d67 f2fs: don't access node/meta inode mapping after iput
> >> >    e9fde78c3a4f drm/fb-helper: generic: Don't take module ref for
> fbcon
> >> >    7821bcce20aa media: s5p-mfc: fix incorrect bus assignment in
> virtual child device
> >> >    3ddc2a100706 net/smc: move unhash before release of clcsock
> >> >    cd54dc4cd37d mlxsw: spectrum: Handle VLAN device unlinking
> >> >    a8a296abee36 tty: rocket: fix incorrect forward declaration of
> 'rp_init()'
> >> >    fb814f215013 btrfs: Ensure replaced device doesn't have pending
> chunk allocation
> >> >    27ce6c2675f6 mm/vmscan.c: prevent useless kswapd loops
> >> >    c854d9b6ef8d ftrace/x86: Remove possible deadlock between
> register_kprobe() and ftrace_run_update_code()
> >> >    2e716c3b562d drm/imx: only send event on crtc disable if kept
> disabled
> >> >    8ec242fd431b drm/imx: notify drm core before sending event during
> crtc disable
> >> >    d2d061351d64 drm/etnaviv: add missing failure path to destroy
> suballoc
> >> >    ec5d99e18d30 drm/amdgpu/gfx9: use reset default for PA_SC_FIFO_SIZE
> >> >    ec6d8c9e6687 drm/amd/powerplay: use hardware fan control if no
> powerplay fan table
> >> >    b6d56f4f6a49 arm64: kaslr: keep modules inside module region when
> KASAN is enabled
> >> >    7cab3dfa6d74 ARM: dts: armada-xp-98dx3236: Switch to
> armada-38x-uart serial node
> >> >    c8790d7f76be tracing/snapshot: Resize spare buffer if size changed
> >> >    052b31810085 fs/userfaultfd.c: disable irqs for fault_pending and
> event locks
> >> >    ea38007107d6 lib/mpi: Fix karactx leak in mpi_powm
> >> >    7df1e2f59bde ALSA: hda/realtek - Change front mic location for
> Lenovo M710q
> >> >    899377c50e60 ALSA: hda/realtek: Add quirks for several Clevo
> notebook barebones
> >> >    d9b6936b134e ALSA: usb-audio: fix sign unintended sign extension
> on left shifts
> >> >    7f52af5e9baa ALSA: line6: Fix write on zero-sized buffer
> >> >    3663bf2baa97 ALSA: firewire-lib/fireworks: fix miss detection of
> received MIDI messages
> >> >    9d2ac58c1ef9 ALSA: seq: fix incorrect order of
> dest_client/dest_ports arguments
> >> >    ae3fa28f0938 crypto: cryptd - Fix skcipher instance memory leak
> >> >    015c20532ace crypto: user - prevent operating on larval algorithms
> >> >    54435b7fff7b ptrace: Fix ->ptracer_cred handling for PTRACE_TRACEME
> >> >    600d3712ae12 drm/i915/dmc: protect against reading random memory
> >> >    2b39351e3844 ftrace: Fix NULL pointer dereference in
> free_ftrace_func_mapper()
> >> >    938044171949 module: Fix livepatch/ftrace module text permissions
> race
> >> >    220adcc0e0ca tracing: avoid build warning with HAVE_NOP_MCOUNT
> >> >    79fccb9815db mm/mlock.c: change count_mm_mlocked_page_nr return
> type
> >> >    4fce0a79e985 scripts/decode_stacktrace.sh: prefix addr2line with
> $CROSS_COMPILE
> >> >    b7747ecb82be cpuset: restore sanity to
> cpuset_cpus_allowed_fallback()
> >> >    e33aeb9a7c0a i2c: pca-platform: Fix GPIO lookup code
> >> >    7cf431edfb71 platform/mellanox: mlxreg-hotplug: Add devm_free_irq
> call to remove flow
> >> >    c241f3fbfa1a platform/x86: mlx-platform: Fix parent device in
> i2c-mux-reg device registration
> >> >    f853112772b0 platform/x86: intel-vbtn: Report switch events when
> event wakes device
> >> >    2ac96173bee0 platform/x86: asus-wmi: Only Tell EC the OS will
> handle display hotkeys from asus_nb_wmi
> >> >    027e043f9c78 drm: panel-orientation-quirks: Add quirk for GPD
> MicroPC
> >> >    2446563dd6d7 drm: panel-orientation-quirks: Add quirk for GPD
> pocket2
> >> >    8be5629b9622 scsi: hpsa: correct ioaccel2 chaining
> >> >    c1bef204c70a SoC: rt274: Fix internal jack assignment in set_jack
> callback
> >> >    1023af0c069d ALSA: hdac: fix memory release for SST and SOF drivers
> >> >    26a6acde2a42 usb: gadget: udc: lpc32xx: allocate descriptor with
> GFP_ATOMIC
> >> >    9be058f5dd70 usb: gadget: fusb300_udc: Fix memory leak of
> fusb300->ep[i]
> >> >    5284327f4e17 x86/CPU: Add more Icelake model numbers
> >> >    74929087384f ASoC: sun4i-i2s: Add offset to RX channel select
> >> >    32475634e8a8 ASoC: sun4i-i2s: Fix sun8i tx channel offset mask
> >> >    7b7486398a32 ASoC: max98090: remove 24-bit format support if RJ is
> 0
> >> >    3b60f98ef496 drm/mediatek: call mtk_dsi_stop() after
> mtk_drm_crtc_atomic_disable()
> >> >    34e5e1c4874f drm/mediatek: clear num_pipes when unbind driver
> >> >    a8a86e9a5533 drm/mediatek: call drm_atomic_helper_shutdown() when
> unbinding driver
> >> >    79e095d234bb drm/mediatek: unbind components in mtk_drm_unbind()
> >> >    319f4699bcaa drm/mediatek: fix unbind functions
> >> >    dbd94f4938c6 spi: bitbang: Fix NULL pointer dereference in
> spi_unregister_master
> >> >    3f8d3c9506a5 ASoC: ak4458: rstn_control - return a non-zero on
> error only
> >> >    3c3dd68c48e8 ASoC: soc-pcm: BE dai needs prepare when pause
> release after resume
> >> >    4c31b4b4ba65 ASoC: ak4458: add return value for ak4458_probe
> >> >    0c19bcdb0db9 ASoC : cs4265 : readable register too low
> >> >    c549680ed59b netfilter: nft_flow_offload: IPCB is only valid for
> ipv4 family
> >> >    041c181e6ba0 netfilter: nft_flow_offload: don't offload when
> sequence numbers need adjustment
> >> >    48f611ecea0e netfilter: nft_flow_offload: set liberal tracking
> mode for tcp
> >> >    3b2734bc839d netfilter: nf_flow_table: ignore DF bit setting
> >> >    869eec894663 md/raid0: Do not bypass blocking queue entered for
> raid0 bios
> >> >    c9d8d3e9d7a0 block: Fix a NULL pointer dereference in
> generic_make_request()
> >> >    5dd6139a0aa2 Bluetooth: Fix faulty expression for minimum
> encryption key size check
> >> >
> >> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >> > ---
> >> >  .../linux/linux-yocto-rt_4.19.bb              |  6 +++---
> >> >  .../linux/linux-yocto-tiny_4.19.bb            |  8 ++++----
> >> >  meta/recipes-kernel/linux/linux-yocto_4.19.bb | 20
> +++++++++----------
> >> >  3 files changed, 17 insertions(+), 17 deletions(-)
> >> >
> >> > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> >> > index 9715241bf4..4013a0c2d0 100644
> >> > --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> >> > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> >> > @@ -11,13 +11,13 @@ python () {
> >> >          raise bb.parse.SkipRecipe("Set
> PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
> >> >  }
> >> >
> >> > -SRCREV_machine ?= "dac3a011d5832c5f94ffac569559f05014746f01"
> >> > -SRCREV_meta ?= "772b96e00bb4d0dc4d2a18d2f7da7d5df53bf368"
> >> > +SRCREV_machine ?= "ca2e3322f4c5678eaef6434c808d0842c805d74d"
> >> > +SRCREV_meta ?= "960be4218436fbbb3500e019f7abf02fa94e6aac"
> >> >
> >> >  SRC_URI = "git://
> git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine
> <http://git.yoctoproject.org/linux-yocto.git;branch=$%7BKBRANCH%7D;name=machine>
> \
> >> >             git://
> git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}
> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=$%7BKMETA%7D>
> "
> >> >
> >> > -LINUX_VERSION ?= "4.19.57"
> >> > +LINUX_VERSION ?= "4.19.61"
> >> >
> >> >  LIC_FILES_CHKSUM =
> "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> >> >
> >> > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
> >> > index 6d42cfa971..4759d80438 100644
> >> > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
> >> > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
> >> > @@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
> >> >
> >> >  require recipes-kernel/linux/linux-yocto.inc
> >> >
> >> > -LINUX_VERSION ?= "4.19.57"
> >> > +LINUX_VERSION ?= "4.19.61"
> >> >  LIC_FILES_CHKSUM =
> "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> >> >
> >> >  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native',
> '', d)}"
> >> > @@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
> >> >  KMETA = "kernel-meta"
> >> >  KCONF_BSP_AUDIT_LEVEL = "2"
> >> >
> >> > -SRCREV_machine_qemuarm ?= "36a736baed7fedb11c7c39b3e8d06e165e9e4d06"
> >> > -SRCREV_machine ?= "b1d253af9cdeb237b4875ca6184c0cbdfbe65e70"
> >> > -SRCREV_meta ?= "772b96e00bb4d0dc4d2a18d2f7da7d5df53bf368"
> >> > +SRCREV_machine_qemuarm ?= "b5a2efa31290f31384971494031285d394635938"
> >> > +SRCREV_machine ?= "4ec6f255163da37a4c83528e5835b6b9baccee63"
> >> > +SRCREV_meta ?= "960be4218436fbbb3500e019f7abf02fa94e6aac"
> >> >
> >> >  PV = "${LINUX_VERSION}+git${SRCPV}"
> >> >
> >> > diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> >> > index c284bef448..cee8af7c99 100644
> >> > --- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> >> > +++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> >> > @@ -11,22 +11,22 @@ KBRANCH_qemux86  ?= "v4.19/standard/base"
> >> >  KBRANCH_qemux86-64 ?= "v4.19/standard/base"
> >> >  KBRANCH_qemumips64 ?= "v4.19/standard/mti-malta64"
> >> >
> >> > -SRCREV_machine_qemuarm ?= "c093532d256a8c46a4e73a940998ddec916f63be"
> >> > -SRCREV_machine_qemuarm64 ?=
> "b1d253af9cdeb237b4875ca6184c0cbdfbe65e70"
> >> > -SRCREV_machine_qemumips ?= "8bac53c36a72ab7dc343f754a76094c41c633c77"
> >> > -SRCREV_machine_qemuppc ?= "b1d253af9cdeb237b4875ca6184c0cbdfbe65e70"
> >> > -SRCREV_machine_qemux86 ?= "b1d253af9cdeb237b4875ca6184c0cbdfbe65e70"
> >> > -SRCREV_machine_qemux86-64 ?=
> "b1d253af9cdeb237b4875ca6184c0cbdfbe65e70"
> >> > -SRCREV_machine_qemumips64 ?=
> "bbc2fcd94ccdb48977a7bf3fcbbc56ef785a0bd1"
> >> > -SRCREV_machine ?= "b1d253af9cdeb237b4875ca6184c0cbdfbe65e70"
> >> > -SRCREV_meta ?= "772b96e00bb4d0dc4d2a18d2f7da7d5df53bf368"
> >> > +SRCREV_machine_qemuarm ?= "ca3cb923f8d7962c6d47a8d29923e52da1818854"
> >> > +SRCREV_machine_qemuarm64 ?=
> "4ec6f255163da37a4c83528e5835b6b9baccee63"
> >> > +SRCREV_machine_qemumips ?= "f624314048dfac57e47ac91d89ca3dc8395ca47a"
> >> > +SRCREV_machine_qemuppc ?= "4ec6f255163da37a4c83528e5835b6b9baccee63"
> >> > +SRCREV_machine_qemux86 ?= "4ec6f255163da37a4c83528e5835b6b9baccee63"
> >> > +SRCREV_machine_qemux86-64 ?=
> "4ec6f255163da37a4c83528e5835b6b9baccee63"
> >> > +SRCREV_machine_qemumips64 ?=
> "ca47368b698795cd5cada84dbfcceda1f47da1aa"
> >> > +SRCREV_machine ?= "4ec6f255163da37a4c83528e5835b6b9baccee63"
> >> > +SRCREV_meta ?= "960be4218436fbbb3500e019f7abf02fa94e6aac"
> >> >
> >> >  SRC_URI = "git://
> git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}
> <http://git.yoctoproject.org/linux-yocto.git;name=machine;branch=$%7BKBRANCH%7D>;
> \
> >> >             git://
> git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}
> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=$%7BKMETA%7D>
> \
> >> >            "
> >> >
> >> >  LIC_FILES_CHKSUM =
> "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> >> > -LINUX_VERSION ?= "4.19.57"
> >> > +LINUX_VERSION ?= "4.19.61"
> >> >
> >> >  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native',
> '', d)}"
> >> >  DEPENDS += "openssl-native util-linux-native"
> >> > --
> >> > 2.19.1
> >> >
> >> > --
> >> > _______________________________________________
> >> > Openembedded-core mailing list
> >> > Openembedded-core@lists.openembedded.org
> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000009d286d058f2cb5d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Aug 2, 2019 at 3:58 PM Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Aug 2, 2019 at 5:5=
5 AM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Thu, Aug 1, 2019 at 11:09 PM Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; instead of posting whole shortlog to commit perhaps pointing to ko=
 git<br>
&gt;&gt; log is going to save us some bits in git history<br>
&gt;&gt; something like<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/stable/=
linux.git/log/?h=3Dlinux-4.19.y&amp;qt=3Drange&amp;q=3D5dd6139a0aa2..725095=
6f6eaf" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/scm=
/linux/kernel/git/stable/linux.git/log/?h=3Dlinux-4.19.y&amp;qt=3Drange&amp=
;q=3D5dd6139a0aa2..7250956f6eaf</a><br>
&gt;&gt;<br>
&gt;<br>
&gt; I&#39;m going to keep the shortlog summary.<br>
&gt;<br>
&gt; It makes it both searchable, and it is in response to a request for th=
at info to be in the logs years ago now. It has served me well so far, so I=
&#39;ll keep up the practice. The bit of text in git history isn&#39;t goin=
g to hurt anyone.<br>
&gt;<br>
Not a big deal but a nudge.<br>
The logs have to be readable and when it starts going across page<br>
boundary, For repo level searches probably doing it in kernel repo is<br>
more appropriate than in OE core. Sometimes it can get to where people<br>
stop bothering because we are adding automated<br>
logs. Every bit we add to git metadata does increate the repo size (<br>
its at 207M at this time)<br></blockquote><div><br></div><div><div class=3D=
"gmail_default" style=3D"font-size:small">Nudge taken :D</div><div class=3D=
"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_def=
ault" style=3D"font-size:small">I&#39;ve just had multiple requests to incl=
ude that info, which came along the lines of &quot;why would I upgrade&quot=
; or &quot;what does this fix&quot; and is a particular CVE in the -stable =
release.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">Having to click =
a link and get a summary in any other way has shown to make it less easy to=
 find that info.</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div><div class=3D"gmail_default" style=3D"font-size:small">But if t=
hings do bloat out in the repo, I&#39;ll revisit.</div><div class=3D"gmail_=
default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
&gt; Bruce<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Aug 1, 2019 at 7:33 PM &lt;<a href=3D"mailto:bruce.ashfiel=
d@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gma=
il.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Integrating the korg -stable commits that comprise the follow=
ing<br>
&gt;&gt; &gt; changes:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 7250956f6eaf Linux 4.19.61<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 025eb12bb4b0 dm bufio: fix deadlock with loop de=
vice<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 404f59e265ac dt-bindings: allow up to four clock=
s for orion-mdio<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 03e6a668ea1f net: mvmdio: allow up to four clock=
s to be specified for orion-mdio<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 dd87cc633ba5 blkcg: update blkcg_print_stat() to=
 handle larger outputs<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 73efdc5d7d3b blk-iolatency: clear use_delay when=
 io.latency is set to zero<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 1ab644bd02ab blk-throttle: fix zero wait time fo=
r iops throttled group<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 91da712ff592 usb: Handle USB3 remote wakeup for =
LPM enabled devices correctly<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 152ddf9f0458 Bluetooth: Add SMP workaround Micro=
soft Surface Precision Mouse bug<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 98318cd31b95 intel_th: msu: Fix single mode with=
 disabled IOMMU<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 d6328d7c1a71 mtd: spinand: read returns badly if=
 the last page has bitflips<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 94f1db42a968 mtd: rawnand: mtk: Correct low leve=
l time calculation of r/w cycle<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 30c6b34759f6 eCryptfs: fix a couple type promoti=
on bugs<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 92e23f5fc049 mmc: sdhci-msm: fix mutex while in =
spinlock<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 01982f7bcc9d powerpc/pseries: Fix oops in hotplu=
g memory notifier<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 e725502b8548 powerpc/powernv/npu: Fix reference =
leak<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 1e3b61cbc30d powerpc/watchpoint: Restore NV GPRs=
 while returning from exception<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 237ac0d73b55 powerpc/32s: fix suspend/resume whe=
n IBATs 4-7 are used<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 7961981718d6 parisc: Fix kernel panic due invali=
d values in IAOQ0 or IAOQ1<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 a6a0daa775e8 parisc: Ensure userspace privilege =
for ptraced processes in regset functions<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 ef5c2e165ab0 crypto: caam - limit output IV to C=
BC to work around CTR mode DMA issue<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 376b80276d84 gpu: ipu-v3: ipu-ic: Fix saturation=
 bit offset in TPMEM<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 ef30c0739439 xfs: abort unaligned nowait directi=
o early<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 669c867972c0 xfs: serialize unaligned dio writes=
 against all other dio writes<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 d61d885b17b0 xfs: fix reporting supported extra =
file attributes for statx()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 f614ef7a34b0 xfs: reserve blocks for ifree trans=
action during log recovery<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 424543a53ae0 xfs: don&#39;t ever put nlink &gt; =
0 inodes on the unlinked list<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 3a895cc066c0 xfs: rename m_inotbt_nores to m_fin=
obt_nores<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 2ab62234e823 xfs: don&#39;t overflow xattr liste=
nt buffer<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 1dc8b13cc66d xfs: flush removing page cache in x=
fs_reflink_remap_prep<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 788920d12b95 xfs: fix pagecache truncation prior=
 to reflink<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 41f64437f030 include/asm-generic/bug.h: fix &quo=
t;cut here&quot; for WARN_ON for __WARN_TAINT architectures<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 afa3e571cde3 coda: pass the host file in vma-&gt=
;vm_file on mmap<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 2c0222b48e77 libnvdimm/pfn: fix fsdax-mode names=
pace info-block zero-fields<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 656d06dab4d6 HID: wacom: correct touch resolutio=
n x/y typo<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 1c871b4006b2 HID: wacom: generic: Correct pad sy=
ncing<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 46f71a15abe7 HID: wacom: generic: only switch th=
e mode on devices with LEDs<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 cb4c2b94f629 IB/mlx5: Report correctly tag match=
ing rendezvous capability<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 4bd953241d81 Btrfs: add missing inode version, c=
time and mtime updates when punching hole<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 fffedf5cf67e Btrfs: fix fsync not persisting den=
try deletions due to inode evictions<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 110850fffeb0 Btrfs: fix data loss after inode ev=
iction, renaming it, and fsync it<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 6b71c62ea9da PCI: qcom: Ensure that PERST is ass=
erted for at least 100 ms<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 529e71cae929 PCI: Do not poll for PME if the dev=
ice is in D3cold<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 4d8504004c86 PCI: hv: Fix a use-after-free bug i=
n hv_eject_device_work()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 f0ff76a42ef5 intel_th: pci: Add Ice Lake NNPI su=
pport<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 66a13b5e4e9c drm/edid: parse CEA blocks embedded=
 in DisplayID<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 9854e06842bc perf/x86/amd/uncore: Set the thread=
 mask for F17h L3 PMCs<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 82c46f7b0918 perf/x86/amd/uncore: Do not set &#3=
9;ThreadMask&#39; and &#39;SliceMask&#39; for non-L3 PMCs<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 a847a5225432 perf/x86/intel: Fix spurious NMI on=
 fixed counter<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 0d4c0bb70665 x86/boot: Fix memory leak in defaul=
t_get_smp_config()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 b52807e607f1 9p/virtio: Add cleanup path in p9_v=
irtio_init<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 1253882d64d0 9p/xen: Add cleanup path in p9_tran=
s_xen_init<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 007e5aaf287c xen/events: fix binding user event =
channels to cpus<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 e380170b3b3a dm zoned: fix zone state management=
 race<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 1e4247d7958b padata: use smp_mb in padata_reorde=
r to avoid orphaned padata jobs<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 0489d808a5f2 drm/nouveau/i2c: Enable i2c pads &a=
mp; busses during preinit<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 c77cbc873586 kconfig: fix missing choice values =
in auto.conf<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 2c7b50c7b1d0 fs/proc/proc_sysctl.c: fix the defa=
ult values of i_uid/i_gid on /proc/sys inodes.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 ba271659ad42 arm64: tegra: Fix AGIC register ran=
ge<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 ba27a25df6df KVM: x86/vPMU: refine kvm_pmu err m=
sg when event creation failed<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 87bae91a0fe9 media: videobuf2-dma-sg: Prevent si=
ze from overflowing<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 cb2e2b0ae554 media: videobuf2-core: Prevent size=
 alignment wrapping buffer size to 0<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 deb78bd24e0c media: coda: Remove unbalanced and =
unneeded mutex unlock<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 fc0232e24541 media: v4l2: Test type instead of c=
fg-&gt;type in v4l2_ctrl_new_custom()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 a4c4c06f1755 ALSA: hda/realtek: apply ALC891 hea=
dset fixup to one Dell machine<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 8ba78e4d564e ALSA: hda/realtek - Fixed Headphone=
 Mic can&#39;t record on Dell platform<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 c92212a81617 ALSA: seq: Break too long mutex con=
text in the write loop<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 eb6c84e4b4f2 raid5-cache: Need to do start() par=
t job after adding journal device<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 3f42c0000b23 ASoC: dapm: Adapt for debugfs API c=
hange<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 677b2aa3be5c lib/scatterlist: Fix mapping iterat=
or when sg-&gt;offset is greater than PAGE_SIZE<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 0b174bac4e43 pnfs: Fix a problem where we gratui=
tously start doing I/O through the MDS<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 f64ff5914f00 pNFS: Fix a typo in pnfs_update_lay=
out<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 603e7497bf27 pnfs/flexfiles: Fix PTR_ERR() deref=
erences in ff_layout_track_ds_error<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 5347e61954fc NFSv4: Handle the special Linux fil=
e open access mode<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 6825ff011c7c iwlwifi: fix RF-Kill interrupt whil=
e FW load for gen2 devices<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 a32e2ceca0ef iwlwifi: don&#39;t WARN when callin=
g iwl_get_shared_mem_conf with RF-Kill<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 d9ce0788da91 iwlwifi: pcie: fix ALIVE interrupt =
handling for gen2 devices w/o MSI-X<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 04c52c105a38 iwlwifi: pcie: don&#39;t service an=
 interrupt that was masked<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 7ebddd5fe217 arm64: tegra: Update Jetson TX1 GPU=
 regulator timings<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 042451b921b1 regulator: s2mps11: Fix buck7 and b=
uck8 wrong voltages<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 8da63aa46e26 Input: alps - fix a mismatch betwee=
n a condition check and its comment<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 81368a9a98d9 Input: synaptics - whitelist Lenovo=
 T580 SMBus intertouch<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 cfb9250619c8 Input: alps - don&#39;t handle ALPS=
 cs19 trackpoint-only device<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 d657077eda7b Input: gtco - bounds check collecti=
on indent level<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 f11ba9df8eed bcache: destroy dc-&gt;writeback_wr=
ite_wq if failed to create dc-&gt;writeback_thread<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 2ab14861d2eb bcache: fix mistaken sysfs entry fo=
r io_error counter<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 3c466df8fc59 bcache: ignore read-ahead request f=
ailure on backing device<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 4fc48cd21a31 bcache: Revert &quot;bcache: free h=
eap cache_set-&gt;flush_btree in bch_journal_free&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 ab966241d59a bcache: Revert &quot;bcache: fix hi=
gh CPU occupancy during journal&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 58169c189bd6 Revert &quot;bcache: set CACHE_SET_=
IO_DISABLE in bch_cached_dev_error()&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 c3b7d27f3746 crypto: crypto4xx - fix a potential=
 double free in ppc4xx_trng_probe<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 a9fd1795fee6 crypto: ccp/gcm - use const time ta=
g comparison.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 561c4424f1e3 crypto: ccp - memset structure fiel=
ds to zero before reuse<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 13805a5df489 crypto: crypto4xx - block ciphers s=
hould only accept complete blocks<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 17e63172d536 crypto: crypto4xx - fix blocksize f=
or cfb and ofb<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 4598094d24c7 crypto: crypto4xx - fix AES CTR blo=
cksize value<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 1c9b0a766513 crypto: chacha20poly1305 - fix atom=
ic sleep when using async algorithm<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 eb99c084da28 crypto: arm64/sha2-ce - correct dig=
est for empty data in finup<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 4230e09e61e6 crypto: arm64/sha1-ce - correct dig=
est for empty data in finup<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 52f07c1ac70e crypto: ccp - Validate the the erro=
r value used to index error messages<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 bed97f646997 crypto: ghash - fix unaligned memor=
y access in ghash_setkey()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 ce7ec07abaf7 scsi: mac_scsi: Fix pseudo DMA impl=
ementation, take 2<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 de769c762626 scsi: mac_scsi: Increase PIO/PDMA t=
ransfer length threshold<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 3e9534fa5046 scsi: megaraid_sas: Fix calculation=
 of target ID<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 1334a3e2d6d0 scsi: core: Fix race on creating se=
nse cache<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 58f59f6072ab Revert &quot;scsi: ncr5380: Increas=
e register polling limit&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 7cfded7a705c scsi: NCR5380: Always re-enable res=
election interrupt<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 d91baba81a6e scsi: NCR5380: Reduce goto statemen=
ts in NCR5380_select()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 e73db096691e xen: let alloc_xenballooned_pages()=
 fail if not enough memory free<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 ff54c44f1038 floppy: fix out-of-bounds read in c=
opy_buffer<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 a9444d9d0f6f floppy: fix invalid pointer derefer=
ence in drive_name<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 5b565f3276f3 floppy: fix out-of-bounds read in n=
ext_valid_format<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 6e34fd07484a floppy: fix div-by-zero in setup_fo=
rmat_params<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 7c16c5eae41a iavf: fix dereference of null rx_bu=
ffer pointer<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 e9896b29d010 net: mvmdio: defer probe of orion-m=
dio if a clock is not ready<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 5f6c5f5ae25e gtp: fix use-after-free in gtp_newl=
ink()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 141222216438 gtp: fix use-after-free in gtp_enca=
p_destroy()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 0a5eca2c949c gtp: fix Illegal context switch in =
RCU read-side critical section.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 e117a04133c6 gtp: fix suspicious RCU usage<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 202de90df2b7 Bluetooth: validate BLE connection =
interval updates<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 ca33af18b5fc gtp: add missing gtp_encap_disable_=
sock() in gtp_encap_enable()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 0fdb922d0ef0 Bluetooth: Check state in l2cap_dis=
connect_rsp<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 3b57b7a3a82a perf tests: Fix record+probe_libc_i=
net_pton.sh for powerpc64<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 c814f618b799 Bluetooth: 6lowpan: search for dest=
ination address in all peers<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 c82c4910e9e6 Bluetooth: Add new 13d3:3501 QCA_RO=
ME device<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 1cbce19bd697 Bluetooth: Add new 13d3:3491 QCA_RO=
ME device<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 578658df21d5 Bluetooth: hci_bcsp: Fix memory lea=
k in rx_skb<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 9d47bd217539 tools: bpftool: Fix json dump crash=
 on powerpc<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 2ad04d31bb3e gpiolib: Fix references to gpiod_[g=
s]et_*value_cansleep() variants<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 157d1c7a1a00 bonding: validate ip header before =
check IPPROTO_IGMP<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 88f751b066f2 selftests: bpf: fix inlines in test=
_lwt_seg6local<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 ef5b204336b3 bpf, libbpf, smatch: Fix potential =
NULL pointer dereference<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 0f2f2cebe64d rxrpc: Fix oops in tracepoint<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 ca37b9a74689 net: usb: asix: init MAC address bu=
ffers<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 51216937c319 bnx2x: Prevent ptp_task to be resch=
eduled indefinitely<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 e358d2ab42f8 perf stat: Fix group lookup for met=
ric group<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 a64e018be77a perf stat: Make metric event lookup=
 more robust<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 7343178ccf7d bpf: fix uapi bpf_prog_info fields =
alignment<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 af3790a46a55 iwlwifi: mvm: Drop large non sta fr=
ames<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 036184af23e0 igb: clear out skb-&gt;tstamp after=
 reading the txtime<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 0024b12b776c net: mvpp2: prs: Don&#39;t override=
 the sign bit in SRAM parser shift<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 05592b9b7f25 ath10k: destroy sdio workqueue whil=
e remove sdio module<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 26d86b29e806 net: hns3: add some error checking =
in hclge_tm module<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 ddfdbcccd71a net: hns3: fix a -Wformat-nonlitera=
l compile warning<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 95d084809495 bcache: fix potential deadlock in c=
ached_def_free()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 4b7758e9c4ed bcache: check c-&gt;gc_thread by IS=
_ERR_OR_NULL in cache_set_flush()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 81b88c05bc45 bcache: acquire bch_register_lock l=
ater in cached_dev_free()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 d81080a0bcf8 bcache: check CACHE_SET_IO_DISABLE =
bit in bch_journal()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 57cfb755c356 bcache: check CACHE_SET_IO_DISABLE =
in allocator code<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 e78d1d234469 EDAC: Fix global-out-of-bounds writ=
e when setting edac_mc_poll_msec<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 e54cc89e6f0a wil6210: drop old event after wmi_c=
all timeout<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 0388597d0627 crypto: asymmetric_keys - select CR=
YPTO_HASH where needed<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 1dea395c9e12 crypto: serpent - mark __serpent_se=
tkey_sbox noinline<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 b346070c72cd ixgbe: Check DDM existence in trans=
ceiver before access<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 0340c621eca8 rslib: Fix handling of of caller pr=
ovided syndrome<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 8ba93c59441a rslib: Fix decoding of shortened co=
des<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 dad0b17e4a4e xsk: Properly terminate assignment =
in xskq_produce_flush_desc<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 e69fac59c493 clocksource/drivers/exynos_mct: Inc=
rease priority over ARM arch timer<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 12e20eca894b libata: don&#39;t request sense dat=
a on !ZAC ATA devices<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 6e6bc34f8570 ASoC: Intel: hdac_hdmi: Set ops to =
NULL on remove<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 1182ff224847 perf tools: Increase MAX_NR_CPUS an=
d MAX_CACHES<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 7201cc227d4a ath10k: fix PCIE device wake up fai=
led<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 8a808fadc9f7 ath10k: add missing error handling<=
br>
&gt;&gt; &gt;=C2=A0 =C2=A0 fe2ceeb4cffc ipvs: fix tinfo memory leak in star=
t_sync_thread<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 20de38d282b3 mt7601u: fix possible memory leak w=
hen the device is disconnected<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 033577880135 x86/build: Add &#39;set -e&#39; to =
mkcapflags.sh to delete broken capflags.c<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 3f7952b275c8 mt7601u: do not schedule rx_tasklet=
 when the device has been disconnected<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 6f6e126e1995 rtlwifi: rtl8192cu: fix error handl=
e when usb probe failed<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 41864adfee2e net: stmmac: sun8i: force select ex=
ternal PHY when no internal one<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 bce037abc29f media: hdpvr: fix locking and a mis=
sing msleep<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 43b9fdc48377 media: vimc: cap: check v4l2_fill_p=
ixfmt return value<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 d562537dbf0d media: coda: increment sequence off=
set for the last returned frame<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 3697c12c4425 media: coda: fix last buffer handli=
ng in V4L2_ENC_CMD_STOP<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 6fd3e9f65db9 media: coda: fix mpeg2 sequence num=
ber handling<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 c647c00f28af acpi/arm64: ignore 5.1 FADTs that a=
re reported as 5.0<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 b9f547b7bdd9 timer_list: Guard procfs specific c=
ode<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 d86c0b73f75b ntp: Limit TAI-UTC offset<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 8d8f0b9009d0 media: i2c: fix warning same module=
 names<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 6439110fbeee media: s5p-mfc: Make additional clo=
cks optional<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 57de3c78f0b7 ipvs: defer hook registration to av=
oid leaks<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 06a3cd416224 ipsec: select crypto ciphers for xf=
rm_algo<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 723ba7938492 arm64: Do not enable IRQs for ct_us=
er_exit<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 010bfbc93424 lightnvm: pblk: fix freeing of merg=
ed pages<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 762bba1b7ee7 nvme-pci: set the errno on ctrl sta=
te change error<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 c876a66553d7 nvme-pci: properly report state cha=
nge failure in nvme_reset_work<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 f0c83dd15ee1 nvme: fix possible io failures when=
 removing multipathed ns<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 10cc3a65a55b EDAC/sysfs: Fix memory leak when cr=
eating a csrow object<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 f6502ce4f050 ACPICA: Clear status of GPEs on fir=
st direct enable<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 3ae98dc2db1e blk-iolatency: only account submitt=
ed bios<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 a952f7c384aa x86/cacheinfo: Fix a -Wtype-limits =
warning<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 3252b29ea41b ipoib: correcly show a VF hardware =
address<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 0e2af9b06c00 vhost_net: disable zerocopy by defa=
ult<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 4c57957ed6c8 perf evsel: Make perf_evsel__name()=
 accept a NULL argument<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 9e0bcb59b6c0 x86/atomic: Fix smp_mb__{before,aft=
er}_atomic()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 dd0260fd1e3a perf/x86/intel/uncore: Handle inval=
id event coding for free-running counter<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 7fc96cd2b0de sched/fair: Fix &quot;runnable_avg_=
yN_inv&quot; not used warnings<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 d8b7db6c5004 sched/core: Add __sched tag for io_=
schedule()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 930655b01367 xfrm: fix sa selector validation<br=
>
&gt;&gt; &gt;=C2=A0 =C2=A0 b7d66bbc8ad3 blkcg, writeback: dead memcgs shoul=
dn&#39;t contribute to writeback ownership arbitration<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 c8f75e753784 block: null_blk: fix race condition=
 for null_del_dev<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 1a3706d8f800 net: hns3: fix for skb leak when do=
ing selftest<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 6a47a42f51cf qed: iWARP - Fix tc for MPA ll2 con=
nection<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 670fb965da03 x86/cpufeatures: Add FDP_EXCPTN_ONL=
Y and ZERO_FCS_FDS<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 366ae49ed78c rcu: Force inlining of rcu_read_loc=
k()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 1fb3ce14f28d ASoC: meson: axg-tdm: fix sample cl=
ock inversion<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 32df4043aed4 x86/cpu: Add Ice Lake NNPI to Intel=
 family<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 914026d58100 selinux: fix empty write to keycrea=
te file<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 10e3788e6575 media: s5p-mfc: fix reading min scr=
atch buffer size on MFC v6/v7<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 7c10f8941b95 bpf: silence warning messages in co=
re<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 b01bf44c363d regmap: fix bulk writes on paged re=
gisters<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 544cd592ca72 gpio: omap: ensure irq is enabled b=
efore wakeup<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 ddeef7a00050 gpio: omap: fix lack of irqstatus_r=
aw0 for OMAP4<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 79644b600850 iommu: Fix a leak in iommu_insert_r=
esv_region<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 f2a4624be8f3 media: fdp1: Support M3N and E3 pla=
tforms<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 63e53991d791 media: uvcvideo: Fix access to unin=
itialized fields on probe error<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 c844f4da9b92 irqchip/meson-gpio: Add support for=
 Meson-G12A SoC<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 eac8b39d089a perf report: Fix OOM error in TUI m=
ode on s390<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 be32a9dc3f62 perf test 6: Fix missing kvm module=
 load for s390<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 3662d8bca087 perf cs-etm: Properly set the value=
 of &#39;old&#39; and &#39;head&#39; in snapshot mode<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 ac510285d40b ipset: Fix memory accounting for ha=
sh types on resize<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 c7bf2df45044 net: sfp: add mutex to prevent conc=
urrent state checks<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 fa4059c5497e RAS/CEC: Fix pfn insertion<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 99dcd701465f s390/qdio: handle PENDING state for=
 QEBSM devices<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 a76f32cbd38c net: axienet: Fix race condition ca=
using TX hang<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 9d643358386d net: fec: Do not use netdev message=
s too early<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 403c43921479 crypto: inside-secure - do not rely=
 on the hardware last bit for result descriptors<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 50331c64f3dd net: stmmac: modify default value o=
f tx-frames<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 1a0a837afc41 net: stmmac: dwmac4: fix flow contr=
ol issue<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 713737cac327 perf jvmti: Address gcc string over=
flow warning for strncpy()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 fb83987cbe6b arm64: mm: make CONFIG_ZONE_DMA32 c=
onfigurable<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 c360eb592938 cpupower : frequency-set -r option =
misses the last cpu in related cpu list<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 cac3032062e5 net: hns3: set ops to null when unr=
egister ad_dev<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 35407917b0bc media: wl128x: Fix some error handl=
ing in fm_v4l2_init_video_device()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 2fbde2746597 locking/lockdep: Fix merging of hlo=
cks with non-zero references<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 909034b8ac64 batman-adv: Fix duplicated OGMs on =
NETDEV_UP<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 aa2ad8b6fb2f tua6100: Avoid build warnings.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 9072450736d0 crypto: talitos - Align SEC1 access=
es to 32 bits boundaries.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 9d25aedef08f crypto: talitos - properly handle s=
plit ICV.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 fc25cfb03ea2 net: phy: Check against net_device =
being NULL<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 ef10d46d04a5 media: staging: media: davinci_vpfe=
: - Fix for memory leak if decoder initialization fails.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 e36f25627362 media: saa7164: fix remove_proc_ent=
ry warning<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 ea904c9f6a33 media: mc-device.c: don&#39;t memse=
t __user pointer contents<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 a6dd4862b98f perf annotate TUI browser: Do not u=
se member from variable within its own initialization<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 71b029a5d908 fscrypt: clean up some BUG_ON()s in=
 block encryption/decryption<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 2c6acf7478aa xfrm: Fix xfrm sel prefix length va=
lidation<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 0544b64ceb64 af_key: fix leaks in key_pol_get_re=
sp and dump_sp.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 b397462a010d signal/pid_namespace: Fix reboot_pi=
d_ns to use send_sig not force_sig<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 1c8e736115cd qed: Set the doorbell address corre=
ctly<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 df6680de7a20 net: stmmac: dwmac4/5: Clear unused=
 address entries<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 d3969670cb5a net: stmmac: dwmac1000: Clear unuse=
d address entries<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 810441651a8a media: media_device_enum_links32: c=
lean a reserved field<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 6fb470ace862 media: vpss: fix a potential NULL p=
ointer dereference<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 70da38e80509 media: marvell-ccic: fix DMA s/g de=
sc number calculation<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 add712b63185 media: ov7740: avoid invalid frames=
ize setting<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 b0e199e13495 crypto: talitos - fix skcipher fail=
ure due to wrong output IV<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 6452712f95e3 media: spi: IR LED: add missing of =
table registration<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 94f2b518a788 media: dvb: usb: fix use after free=
 in dvb_usb_device_exit<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 8f855c09e2af batman-adv: fix for leaked TVLV han=
dler.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 83d133c96aad regmap: debugfs: Fix memory leak in=
 regmap_debugfs_init<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 2b5b12c0c1b7 ath: DFS JP domain W56 fixed pulse =
type 3 RADAR detection<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 da153c0c5746 wil6210: fix spurious interrupts in=
 3-msi<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 a4bf4fecff16 ath10k: add peer id check in ath10k=
_peer_find_by_id<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 83c911f4bd68 ath6kl: add some bounds checking<br=
>
&gt;&gt; &gt;=C2=A0 =C2=A0 42dcbf20e182 ath9k: Check for errors when readin=
g SREV register<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 7e19e658e535 ath10k: Do not send probe response =
template for mesh<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 009edc622bba wil6210: fix potential out-of-bound=
s read<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 09593c25b975 dmaengine: imx-sdma: fix use-after-=
free on probe error path<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 06e15cf5aead scsi: iscsi: set auth_protocol back=
 to NULL if CHAP_A value is not supported<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 37cb02da44dc arm64/efi: Mark __efistub_stext_off=
set as an absolute symbol explicitly<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 73ebefc814ef MIPS: fix build on non-linux hosts<=
br>
&gt;&gt; &gt;=C2=A0 =C2=A0 7202df6be6ec MIPS: ath79: fix ar933x uart parity=
 mode<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 be9b6782a9eb Linux 4.19.60<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 d173ce091c1a x86/entry/32: Fix ENDPROC of common=
_spurious<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 466bdfc6c4d6 drm/udl: move to embedding drm devi=
ce inside udl device.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 af48f7d79fae drm/udl: Replace drm_dev_unref with=
 drm_dev_put<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 cfd99eccede5 drm/udl: introduce a macro to conve=
rt dev to udl.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 8f14cf159e9f regmap-irq: do not write mask regis=
ter if mask_base is zero<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 820b010743ee crypto/NX: Set receive window credi=
ts to max number of CRBs in RxFIFO<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 b24c6403633d crypto: talitos - fix hash on SEC1.=
<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 ff1ce8ef1f88 crypto: talitos - move struct talit=
os_edesc into talitos.h<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 b578b87bcab6 s390/qdio: don&#39;t touch the dsci=
 in tiqdio_add_input_queues()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 b1d52630b12a s390/qdio: (re-)initialize tiqdio l=
ist entries<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 02eb533e940a s390: fix stfle zero padding<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 9db915738e40 ARC: hide unused function unw_hdr_a=
lloc<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 fc6975ee932b x86/irq: Seperate unused system vec=
tors from spurious entry again<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 9494cd392885 x86/irq: Handle spurious interrupt =
after shutdown gracefully<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 7897f5a443fb x86/ioapic: Implement irq_get_irqch=
ip_state() callback<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 6074f6043c49 genirq: Add optional hardware synch=
ronization for shutdown<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 3f10ccc29780 genirq: Fix misleading synchronize_=
irq() documentation<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 578db1aa595b genirq: Delay deactivation in free_=
irq()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 2656ee5a5ad5 linux/kernel.h: fix overflow for DI=
V_ROUND_UP_ULL<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 9c875e8556d4 pinctrl: mediatek: Update cur_mask =
in mask/mask ops<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 f6e01328cb0e cpu/hotplug: Fix out-of-bounds read=
 when setting fail state<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 fa99487a43cf pinctrl: mediatek: Ignore interrupt=
s that are wake only during resume<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 cd2646e57ec5 HID: multitouch: Add pointstick sup=
port for ALPS Touchpad<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 9ea3b131441e HID: chicony: add another quirk for=
 PixArt mouse<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 94968c37b6d3 x86/boot/64: Add missing fixup_poin=
ter() for next_early_pgt access<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 729d25f43b64 x86/boot/64: Fix crash if kernel im=
age crosses page table boundary<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 136847140cc8 dm verity: use message limit for da=
ta block corruption message<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 042be78692ae dm table: don&#39;t copy from a NUL=
L pointer in realloc_argv()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 0fc080bc9a72 pinctrl: mcp23s08: Fix add_data and=
 irqchip_add_nested call order<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 00640eb0eafa ARM: dts: imx6ul: fix PWM[1-4] inte=
rrupts<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 a8cc2a2c2841 sis900: fix TX completion<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 3232bccddeba ppp: mppe: Add softdep to arc4<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 5ec7753c7c9e be2net: fix link failure after etht=
ool offline test<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 2a6ee36917f0 x86/apic: Fix integer overflow on 1=
0 bit left shift of cpu_khz<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 fdfff855cd36 afs: Fix uninitialised spinlock afs=
_volume::cb_break_lock<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 d47f06ab0c0e ARM: omap2: remove incorrect __init=
 annotation<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 5d3c45538151 ARM: dts: gemini Fix up DNS-313 com=
patible string<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 afda29dc5ac6 perf/core: Fix perf_sample_regs_use=
r() mm check<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 627fdcc9b718 efi/bgrt: Drop BGRT status field re=
served bits check<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 cf4deb2d4de6 clk: ti: clkctrl: Fix returning uni=
nitialized data<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 ff232a47567f irqchip/gic-v3-its: Fix command que=
ue pointer comparison bug<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 244db54441a1 firmware: improve LSM/IMA security =
behaviour<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 079d7f16a973 drivers: base: cacheinfo: Ensure cp=
u hotplug work is done before Intel RDT<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 68048dce650e nilfs2: do not use unexported cpu_t=
o_le32()/le32_to_cpu() in uapi header<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 86859ef10d25 Input: synaptics - enable SMBUS on =
T480 thinkpad trackpad<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 438a3dc6f2c3 e1000e: start network tx queue only=
 when link is up<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 8020568b404b Revert &quot;e1000e: fix cyclic res=
ets at link up with active tx&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 3bd837bfe431 Linux 4.19.59<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 70bae382b3dc staging: rtl8712: reduce stack usag=
e, again<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 b46475ecd930 staging: bcm2835-camera: Handle emp=
ty EOS buffers whilst streaming<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 0ee144effcc3 staging: bcm2835-camera: Remove che=
ck of the number of buffers supplied<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 fcbc6ddcd624 staging: bcm2835-camera: Ensure all=
 buffers are returned on disable<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 4502c43d7f3b staging: bcm2835-camera: Replace sp=
inlock protecting context_map with mutex<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 22a20b9f6d9f staging: fsl-dpaa2/ethsw: fix memor=
y leak of switchdev_work<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 cc396afa1959 MIPS: Remove superfluous check for =
__linux__<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 d202b5adccfb VMCI: Fix integer overflow in VMCI =
handle arrays<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 486c32325caa carl9170: fix misuse of device driv=
er API<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 524ad00e80b7 binder: fix memory leak in error pa=
th<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 294b893a41cd lkdtm: support llvm-objcopy<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 5c90a2ecd08a HID: Add another Primax PIXART OEM =
mouse quirk<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 c04c751bef87 staging: comedi: amplc_pci230: fix =
null pointer deref on interrupt<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 4e49c6c91c18 staging: comedi: dt282x: fix a null=
 pointer deref on interrupt<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 8419fd562a09 drivers/usb/typec/tps6598x.c: fix 4=
CC cmd write<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 63b3028cd590 drivers/usb/typec/tps6598x.c: fix p=
ortinfo width<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 57e16e0d8c68 usb: renesas_usbhs: add a workaroun=
d for a race condition of workqueue<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 aa9a8038ea8b usb: dwc2: use a longer AHB idle ti=
meout in dwc2_core_reset()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 cac4a04202fb usb: gadget: ether: Fix race betwee=
n gether_disconnect and rx_submit<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 449a8d08a4bc p54usb: Fix race between disconnect=
 and firmware loading<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 135d9ba3b285 Revert &quot;serial: 8250: Don&#39;=
t service RX FIFO if interrupts are disabled&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 0891268f36a2 USB: serial: option: add support fo=
r GosunCn ME3630 RNDIS mode<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 0a1c811bf033 USB: serial: ftdi_sio: add ID for i=
sodebug v1<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 bb902b6c87ff mwifiex: Don&#39;t abort on small, =
spec-compliant vendor IEs<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 ffbbd626e1ce mwifiex: Abort at too short BSS des=
criptor element<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 a2a24b57c27a Documentation/admin: Remove the vsy=
scall=3Dnative documentation<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 8a815007f5fe Documentation: Add section about CP=
U vulnerabilities for Spectre<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 bd9604022eb3 x86/tls: Fix possible spectre-v1 in=
 do_get_thread_area()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 68ff28291a4f x86/ptrace: Fix possible spectre-v1=
 in ptrace_get_debugreg()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 d8e26651ce8d perf pmu: Fix uncore PMU alias list=
 for ARM64<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 018524b75852 block, bfq: NULL out the bic when i=
t&#39;s no longer valid<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 ff75e5f41e88 ALSA: hda/realtek - Headphone Mic c=
an&#39;t record after S3<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 87c3262b00d8 ALSA: usb-audio: Fix parse of UAC2 =
Extension Units<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 ef374f5a2731 media: stv0297: fix frequency range=
 limit<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 5db079eb0acd udf: Fix incorrect final NOT_ALLOCA=
TED (hole) extent length<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 0fc3e9b9b603 fscrypt: don&#39;t set policy for a=
 dead directory<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 e9f76b954336 net :sunrpc :clnt :Fix xps refcount=
 imbalance on the error path<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 810cfc3d9d2e NFS4: Only set creation opendata if=
 O_CREAT<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 7075654ce7d0 net: dsa: mv88e6xxx: fix shift of F=
ID bits in mv88e6185_g1_vtu_loadpurge()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 606561e16186 quota: fix a problem about transfer=
 quota<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 5ad566af08c1 scsi: qedi: Check targetname while =
finding boot target information<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 37232abb6ea3 net: lio_core: fix potential sign-e=
xtension overflow on large shift<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 740b2ac49518 ip6_tunnel: allow not to count pkts=
 on tstats by passing dev as NULL<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 a02ac12d2d48 drm: return -EFAULT if copy_to_user=
() fails<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 4c938a635fc3 bnx2x: Check if transceiver impleme=
nts DDM before access<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 270ae00a0346 md: fix for divide error in status_=
resync<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 5533d9ed4112 mmc: core: complete HS400 before ch=
ecking status<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 2da80536f629 qmi_wwan: extend permitted QMAP mux=
_id value range<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 dc84e98393f7 qmi_wwan: avoid RCU stalls on devic=
e disconnect when in QMAP mode<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 dbc6a83cf2bc qmi_wwan: add support for QMAP padd=
ing in the RX path<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 292ba5b1faf4 bpf, x64: fix stack layout of JITed=
 bpf code<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 4c2ce7addda8 bpf, devmap: Add missing RCU read l=
ock on flush<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 ab44f8bcf2e5 bpf, devmap: Add missing bulk queue=
 free<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 8d09e862103b bpf, devmap: Fix premature entry fr=
ee on destroying map<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 ba0afe520ee9 mac80211: do not start any work dur=
ing reconfigure flow<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 de8cf2c0bc64 mac80211: only warn once on chanctx=
_conf being NULL<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 9c2dd6d47131 ARM: davinci: da8xx: specify dma_co=
herent_mask for lcdc<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 3bbcc8b9ad37 ARM: davinci: da850-evm: call regul=
ator_has_full_constraints()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 443250665388 mlxsw: spectrum: Disallow prio-tagg=
ed packets when PVID is removed<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 512bbb114b99 KVM: arm/arm64: vgic: Fix kvm_devic=
e leak in vgic_its_destroy<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 41420ac584d7 Input: imx_keypad - make sure keybo=
ard can always wake up system<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 b71f312e9bf7 riscv: Fix udelay in RV32.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 122c6a71c08d drm/vmwgfx: fix a warning due to mi=
ssing dma_parms<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 d3861d4ca94c drm/vmwgfx: Honor the sg list segme=
nt size limitation<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 c0b12abd1828 s390/boot: disable address-of-packe=
d-member warning<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 e71daed5176f ARM: dts: am335x phytec boards: Fix=
 cd-gpios active level<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 822c2ee81c63 ibmvnic: Fix unchecked return codes=
 of memory allocations<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 0f06004d16be ibmvnic: Refresh device multicast l=
ist after reset<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 e65dd528bb8e ibmvnic: Do not close unopened driv=
er during reset<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 374180b11b29 net: phy: rename Asix Electronics P=
HY driver<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 473a75c7fab5 can: af_can: Fix error path of can_=
init()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 486954277fc1 can: m_can: implement errata &quot;=
Needless activation of MRAF irq&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 270149f78b9c can: mcp251x: add support for mcp25=
625<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 33672c74b484 dt-bindings: can: mcp251x: add mcp2=
5625 support<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 07c96e8e8021 soundwire: intel: set dai min and m=
ax channels correctly<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 c7e427e28a3a mwifiex: Fix heap overflow in mwifi=
ex_uap_parse_tail_ies()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 8e115a079940 iwlwifi: Fix double-free problems i=
n iwl_req_fw_callback()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 d4c0f752c1d2 mwifiex: Fix possible buffer overfl=
ows at parsing bss descriptor<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 b8588a0981b7 mac80211: free peer keys before vif=
 down in mesh<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 acc42e5c2322 mac80211: mesh: fix RCU warning<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 e3868c1a462f staging:iio:ad7150: fix threshold m=
ode config bit<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 6b1ce3971e05 soundwire: stream: fix out of bound=
ary access on port properties<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 6be857082611 bpf: sockmap, fix use after free fr=
om sleep in psock backlog workqueue<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 bc84982f977d mac80211: fix rate reporting inside=
 cfg80211_calculate_bitrate_he()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 3c24a931e972 samples, bpf: suppress compiler war=
ning<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 e7779115bbd9 samples, bpf: fix to change the buf=
fer size for read()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 fe01e93c3fd1 Input: elantech - enable middle but=
ton support on 2 ThinkPads<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 2883fc1ece69 soc: bcm: brcmstb: biuctrl: Registe=
r writes require a barrier<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 2f1c962a7416 soc: brcmstb: Fix error path for un=
supported CPUs<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 e8250f730410 crypto: talitos - rename alternativ=
e AEAD algos.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 7a6bfa08b938 Linux 4.19.58<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 f37de75cb8eb dmaengine: imx-sdma: remove BD_INTR=
 for channel0<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 018c968de710 dmaengine: qcom: bam_dma: Fix compl=
eted descriptors count<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 870de1499505 MIPS: have &quot;plain&quot; make c=
alls build dtbs for selected platforms<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 8957895b35de MIPS: Add missing EHB in mtc0 -&gt;=
 mfc0 sequence.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 2b8f8a80ca8b MIPS: Fix bounds check virt_addr_va=
lid<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 80b25628ff26 svcrdma: Ignore source port when co=
mputing DRC hash<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 8129a10ce78f nfsd: Fix overflow causing non-work=
ing mounts on 1 TB machines<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 f25c06955f8d KVM: LAPIC: Fix pending interrupt i=
n IRR blocked by software disable LAPIC<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 f6472f50fbfc KVM: x86: degrade WARN to pr_warn_r=
atelimited<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 ac0024baf073 netfilter: ipv6: nf_defrag: accept =
duplicate fragments again<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 54e8cf41b20b bpf: fix bpf_jit_limit knob for PAG=
E_SIZE &gt;=3D 64K<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 e6c288f7307e net: hns: fix unsigned comparison t=
o less than zero<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 4f24801ef50b sc16is7xx: move label &#39;err_spi&=
#39; to correct section<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 318244f3641a netfilter: ipv6: nf_defrag: fix lea=
kage of unqueued fragments<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 a8891c5e2251 ip6: fix skb leak in ip6frag_expire=
_frag_queue()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 382bc84da904 rds: Fix warning.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 7e6af1fa80b8 ALSA: hda: Initialize power_state f=
ield properly<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 c8c88293bf72 net: hns: Fixes the missing put_dev=
ice in positive leg for roce reset<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 6bf9677300f3 x86/boot/compressed/64: Do not corr=
upt EDX on EFER.LME=3D1 setting<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 b91ec6ae14da selftests: fib_rule_tests: Fix icmp=
 proto with ipv6<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 e2851c3ee0be scsi: tcmu: fix use after free<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 04096b3beace mac80211: mesh: fix missing unlock =
on error in table_path_del()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 e2379b044d67 f2fs: don&#39;t access node/meta in=
ode mapping after iput<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 e9fde78c3a4f drm/fb-helper: generic: Don&#39;t t=
ake module ref for fbcon<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 7821bcce20aa media: s5p-mfc: fix incorrect bus a=
ssignment in virtual child device<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 3ddc2a100706 net/smc: move unhash before release=
 of clcsock<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 cd54dc4cd37d mlxsw: spectrum: Handle VLAN device=
 unlinking<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 a8a296abee36 tty: rocket: fix incorrect forward =
declaration of &#39;rp_init()&#39;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 fb814f215013 btrfs: Ensure replaced device doesn=
&#39;t have pending chunk allocation<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 27ce6c2675f6 mm/vmscan.c: prevent useless kswapd=
 loops<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 c854d9b6ef8d ftrace/x86: Remove possible deadloc=
k between register_kprobe() and ftrace_run_update_code()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 2e716c3b562d drm/imx: only send event on crtc di=
sable if kept disabled<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 8ec242fd431b drm/imx: notify drm core before sen=
ding event during crtc disable<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 d2d061351d64 drm/etnaviv: add missing failure pa=
th to destroy suballoc<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 ec5d99e18d30 drm/amdgpu/gfx9: use reset default =
for PA_SC_FIFO_SIZE<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 ec6d8c9e6687 drm/amd/powerplay: use hardware fan=
 control if no powerplay fan table<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 b6d56f4f6a49 arm64: kaslr: keep modules inside m=
odule region when KASAN is enabled<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 7cab3dfa6d74 ARM: dts: armada-xp-98dx3236: Switc=
h to armada-38x-uart serial node<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 c8790d7f76be tracing/snapshot: Resize spare buff=
er if size changed<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 052b31810085 fs/userfaultfd.c: disable irqs for =
fault_pending and event locks<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 ea38007107d6 lib/mpi: Fix karactx leak in mpi_po=
wm<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 7df1e2f59bde ALSA: hda/realtek - Change front mi=
c location for Lenovo M710q<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 899377c50e60 ALSA: hda/realtek: Add quirks for s=
everal Clevo notebook barebones<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 d9b6936b134e ALSA: usb-audio: fix sign unintende=
d sign extension on left shifts<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 7f52af5e9baa ALSA: line6: Fix write on zero-size=
d buffer<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 3663bf2baa97 ALSA: firewire-lib/fireworks: fix m=
iss detection of received MIDI messages<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 9d2ac58c1ef9 ALSA: seq: fix incorrect order of d=
est_client/dest_ports arguments<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 ae3fa28f0938 crypto: cryptd - Fix skcipher insta=
nce memory leak<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 015c20532ace crypto: user - prevent operating on=
 larval algorithms<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 54435b7fff7b ptrace: Fix -&gt;ptracer_cred handl=
ing for PTRACE_TRACEME<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 600d3712ae12 drm/i915/dmc: protect against readi=
ng random memory<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 2b39351e3844 ftrace: Fix NULL pointer dereferenc=
e in free_ftrace_func_mapper()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 938044171949 module: Fix livepatch/ftrace module=
 text permissions race<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 220adcc0e0ca tracing: avoid build warning with H=
AVE_NOP_MCOUNT<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 79fccb9815db mm/mlock.c: change count_mm_mlocked=
_page_nr return type<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 4fce0a79e985 scripts/decode_stacktrace.sh: prefi=
x addr2line with $CROSS_COMPILE<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 b7747ecb82be cpuset: restore sanity to cpuset_cp=
us_allowed_fallback()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 e33aeb9a7c0a i2c: pca-platform: Fix GPIO lookup =
code<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 7cf431edfb71 platform/mellanox: mlxreg-hotplug: =
Add devm_free_irq call to remove flow<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 c241f3fbfa1a platform/x86: mlx-platform: Fix par=
ent device in i2c-mux-reg device registration<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 f853112772b0 platform/x86: intel-vbtn: Report sw=
itch events when event wakes device<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 2ac96173bee0 platform/x86: asus-wmi: Only Tell E=
C the OS will handle display hotkeys from asus_nb_wmi<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 027e043f9c78 drm: panel-orientation-quirks: Add =
quirk for GPD MicroPC<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 2446563dd6d7 drm: panel-orientation-quirks: Add =
quirk for GPD pocket2<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 8be5629b9622 scsi: hpsa: correct ioaccel2 chaini=
ng<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 c1bef204c70a SoC: rt274: Fix internal jack assig=
nment in set_jack callback<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 1023af0c069d ALSA: hdac: fix memory release for =
SST and SOF drivers<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 26a6acde2a42 usb: gadget: udc: lpc32xx: allocate=
 descriptor with GFP_ATOMIC<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 9be058f5dd70 usb: gadget: fusb300_udc: Fix memor=
y leak of fusb300-&gt;ep[i]<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 5284327f4e17 x86/CPU: Add more Icelake model num=
bers<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 74929087384f ASoC: sun4i-i2s: Add offset to RX c=
hannel select<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 32475634e8a8 ASoC: sun4i-i2s: Fix sun8i tx chann=
el offset mask<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 7b7486398a32 ASoC: max98090: remove 24-bit forma=
t support if RJ is 0<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 3b60f98ef496 drm/mediatek: call mtk_dsi_stop() a=
fter mtk_drm_crtc_atomic_disable()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 34e5e1c4874f drm/mediatek: clear num_pipes when =
unbind driver<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 a8a86e9a5533 drm/mediatek: call drm_atomic_helpe=
r_shutdown() when unbinding driver<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 79e095d234bb drm/mediatek: unbind components in =
mtk_drm_unbind()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 319f4699bcaa drm/mediatek: fix unbind functions<=
br>
&gt;&gt; &gt;=C2=A0 =C2=A0 dbd94f4938c6 spi: bitbang: Fix NULL pointer dere=
ference in spi_unregister_master<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 3f8d3c9506a5 ASoC: ak4458: rstn_control - return=
 a non-zero on error only<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 3c3dd68c48e8 ASoC: soc-pcm: BE dai needs prepare=
 when pause release after resume<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 4c31b4b4ba65 ASoC: ak4458: add return value for =
ak4458_probe<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 0c19bcdb0db9 ASoC : cs4265 : readable register t=
oo low<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 c549680ed59b netfilter: nft_flow_offload: IPCB i=
s only valid for ipv4 family<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 041c181e6ba0 netfilter: nft_flow_offload: don&#3=
9;t offload when sequence numbers need adjustment<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 48f611ecea0e netfilter: nft_flow_offload: set li=
beral tracking mode for tcp<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 3b2734bc839d netfilter: nf_flow_table: ignore DF=
 bit setting<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 869eec894663 md/raid0: Do not bypass blocking qu=
eue entered for raid0 bios<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 c9d8d3e9d7a0 block: Fix a NULL pointer dereferen=
ce in generic_make_request()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 5dd6139a0aa2 Bluetooth: Fix faulty expression fo=
r minimum encryption key size check<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ash=
field@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 .../linux/<a href=3D"http://linux-yocto-rt_4.19.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-rt_4.19.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++---<br>
&gt;&gt; &gt;=C2=A0 .../linux/<a href=3D"http://linux-yocto-tiny_4.19.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_4.19.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++++----<br>
&gt;&gt; &gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto=
_4.19.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.19.bb</a> | 20=
 +++++++++----------<br>
&gt;&gt; &gt;=C2=A0 3 files changed, 17 insertions(+), 17 deletions(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linu=
x-yocto-rt_4.19.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_4.1=
9.bb</a> b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.19.=
bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_4.19.bb</a><br>
&gt;&gt; &gt; index 9715241bf4..4013a0c2d0 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto=
-rt_4.19.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_4.19.bb</a=
><br>
&gt;&gt; &gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto=
-rt_4.19.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_4.19.bb</a=
><br>
&gt;&gt; &gt; @@ -11,13 +11,13 @@ python () {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(&=
quot;Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it&q=
uot;)<br>
&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -SRCREV_machine ?=3D &quot;dac3a011d5832c5f94ffac569559f05014=
746f01&quot;<br>
&gt;&gt; &gt; -SRCREV_meta ?=3D &quot;772b96e00bb4d0dc4d2a18d2f7da7d5df53bf=
368&quot;<br>
&gt;&gt; &gt; +SRCREV_machine ?=3D &quot;ca2e3322f4c5678eaef6434c808d0842c8=
05d74d&quot;<br>
&gt;&gt; &gt; +SRCREV_meta ?=3D &quot;960be4218436fbbb3500e019f7abf02fa94e6=
aac&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproj=
ect.org/linux-yocto.git;branch=3D$%7BKBRANCH%7D;name=3Dmachine" rel=3D"nore=
ferrer" target=3D"_blank">git.yoctoproject.org/linux-yocto.git;branch=3D${K=
BRANCH};name=3Dmachine</a> \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=
=3D"http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta=
;branch=3Dyocto-4.19;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" target=
=3D"_blank">git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmet=
a;branch=3Dyocto-4.19;destsuffix=3D${KMETA}</a>&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -LINUX_VERSION ?=3D &quot;4.19.57&quot;<br>
&gt;&gt; &gt; +LINUX_VERSION ?=3D &quot;4.19.61&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dbbea815=
ee2795b2f4230826c0c6b8814&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linu=
x-yocto-tiny_4.19.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny=
_4.19.bb</a> b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny=
_4.19.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_4.19.bb</a>=
<br>
&gt;&gt; &gt; index 6d42cfa971..4759d80438 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto=
-tiny_4.19.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_4.19.b=
b</a><br>
&gt;&gt; &gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto=
-tiny_4.19.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_4.19.b=
b</a><br>
&gt;&gt; &gt; @@ -6,7 +6,7 @@ KCONFIG_MODE =3D &quot;--allnoconfig&quot;<br=
>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 require recipes-kernel/linux/linux-yocto.inc<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -LINUX_VERSION ?=3D &quot;4.19.57&quot;<br>
&gt;&gt; &gt; +LINUX_VERSION ?=3D &quot;4.19.61&quot;<br>
&gt;&gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dbbea815=
ee2795b2f4230826c0c6b8814&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 DEPENDS +=3D &quot;${@bb.utils.contains(&#39;ARCH&#39;,=
 &#39;x86&#39;, &#39;elfutils-native&#39;, &#39;&#39;, d)}&quot;<br>
&gt;&gt; &gt; @@ -15,9 +15,9 @@ DEPENDS +=3D &quot;openssl-native util-linu=
x-native&quot;<br>
&gt;&gt; &gt;=C2=A0 KMETA =3D &quot;kernel-meta&quot;<br>
&gt;&gt; &gt;=C2=A0 KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -SRCREV_machine_qemuarm ?=3D &quot;36a736baed7fedb11c7c39b3e8=
d06e165e9e4d06&quot;<br>
&gt;&gt; &gt; -SRCREV_machine ?=3D &quot;b1d253af9cdeb237b4875ca6184c0cbdfb=
e65e70&quot;<br>
&gt;&gt; &gt; -SRCREV_meta ?=3D &quot;772b96e00bb4d0dc4d2a18d2f7da7d5df53bf=
368&quot;<br>
&gt;&gt; &gt; +SRCREV_machine_qemuarm ?=3D &quot;b5a2efa31290f3138497149403=
1285d394635938&quot;<br>
&gt;&gt; &gt; +SRCREV_machine ?=3D &quot;4ec6f255163da37a4c83528e5835b6b9ba=
ccee63&quot;<br>
&gt;&gt; &gt; +SRCREV_meta ?=3D &quot;960be4218436fbbb3500e019f7abf02fa94e6=
aac&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linu=
x-yocto_4.19.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.19.bb</=
a> b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.19.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_4.19.bb</a><br>
&gt;&gt; &gt; index c284bef448..cee8af7c99 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto=
_4.19.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.19.bb</a><br>
&gt;&gt; &gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto=
_4.19.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.19.bb</a><br>
&gt;&gt; &gt; @@ -11,22 +11,22 @@ KBRANCH_qemux86=C2=A0 ?=3D &quot;v4.19/st=
andard/base&quot;<br>
&gt;&gt; &gt;=C2=A0 KBRANCH_qemux86-64 ?=3D &quot;v4.19/standard/base&quot;=
<br>
&gt;&gt; &gt;=C2=A0 KBRANCH_qemumips64 ?=3D &quot;v4.19/standard/mti-malta6=
4&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -SRCREV_machine_qemuarm ?=3D &quot;c093532d256a8c46a4e73a9409=
98ddec916f63be&quot;<br>
&gt;&gt; &gt; -SRCREV_machine_qemuarm64 ?=3D &quot;b1d253af9cdeb237b4875ca6=
184c0cbdfbe65e70&quot;<br>
&gt;&gt; &gt; -SRCREV_machine_qemumips ?=3D &quot;8bac53c36a72ab7dc343f754a=
76094c41c633c77&quot;<br>
&gt;&gt; &gt; -SRCREV_machine_qemuppc ?=3D &quot;b1d253af9cdeb237b4875ca618=
4c0cbdfbe65e70&quot;<br>
&gt;&gt; &gt; -SRCREV_machine_qemux86 ?=3D &quot;b1d253af9cdeb237b4875ca618=
4c0cbdfbe65e70&quot;<br>
&gt;&gt; &gt; -SRCREV_machine_qemux86-64 ?=3D &quot;b1d253af9cdeb237b4875ca=
6184c0cbdfbe65e70&quot;<br>
&gt;&gt; &gt; -SRCREV_machine_qemumips64 ?=3D &quot;bbc2fcd94ccdb48977a7bf3=
fcbbc56ef785a0bd1&quot;<br>
&gt;&gt; &gt; -SRCREV_machine ?=3D &quot;b1d253af9cdeb237b4875ca6184c0cbdfb=
e65e70&quot;<br>
&gt;&gt; &gt; -SRCREV_meta ?=3D &quot;772b96e00bb4d0dc4d2a18d2f7da7d5df53bf=
368&quot;<br>
&gt;&gt; &gt; +SRCREV_machine_qemuarm ?=3D &quot;ca3cb923f8d7962c6d47a8d299=
23e52da1818854&quot;<br>
&gt;&gt; &gt; +SRCREV_machine_qemuarm64 ?=3D &quot;4ec6f255163da37a4c83528e=
5835b6b9baccee63&quot;<br>
&gt;&gt; &gt; +SRCREV_machine_qemumips ?=3D &quot;f624314048dfac57e47ac91d8=
9ca3dc8395ca47a&quot;<br>
&gt;&gt; &gt; +SRCREV_machine_qemuppc ?=3D &quot;4ec6f255163da37a4c83528e58=
35b6b9baccee63&quot;<br>
&gt;&gt; &gt; +SRCREV_machine_qemux86 ?=3D &quot;4ec6f255163da37a4c83528e58=
35b6b9baccee63&quot;<br>
&gt;&gt; &gt; +SRCREV_machine_qemux86-64 ?=3D &quot;4ec6f255163da37a4c83528=
e5835b6b9baccee63&quot;<br>
&gt;&gt; &gt; +SRCREV_machine_qemumips64 ?=3D &quot;ca47368b698795cd5cada84=
dbfcceda1f47da1aa&quot;<br>
&gt;&gt; &gt; +SRCREV_machine ?=3D &quot;4ec6f255163da37a4c83528e5835b6b9ba=
ccee63&quot;<br>
&gt;&gt; &gt; +SRCREV_meta ?=3D &quot;960be4218436fbbb3500e019f7abf02fa94e6=
aac&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproj=
ect.org/linux-yocto.git;name=3Dmachine;branch=3D$%7BKBRANCH%7D" rel=3D"nore=
ferrer" target=3D"_blank">git.yoctoproject.org/linux-yocto.git;name=3Dmachi=
ne;branch=3D${KBRANCH}</a>; \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=
=3D"http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta=
;branch=3Dyocto-4.19;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" target=
=3D"_blank">git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmet=
a;branch=3Dyocto-4.19;destsuffix=3D${KMETA}</a> \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dbbea815=
ee2795b2f4230826c0c6b8814&quot;<br>
&gt;&gt; &gt; -LINUX_VERSION ?=3D &quot;4.19.57&quot;<br>
&gt;&gt; &gt; +LINUX_VERSION ?=3D &quot;4.19.61&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 DEPENDS +=3D &quot;${@bb.utils.contains(&#39;ARCH&#39;,=
 &#39;x86&#39;, &#39;elfutils-native&#39;, &#39;&#39;, d)}&quot;<br>
&gt;&gt; &gt;=C2=A0 DEPENDS +=3D &quot;openssl-native util-linux-native&quo=
t;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.19.1<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; _______________________________________________<br>
&gt;&gt; &gt; Openembedded-core mailing list<br>
&gt;&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/mailman/listinfo/openembedded-core</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--0000000000009d286d058f2cb5d0--
