Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8354C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 15:51:31 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.104270.1701791485413508115
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 07:51:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hy65J0b9;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.178, mailfrom: steve@sakoman.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c9c18e7990so80488171fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 07:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701791483; x=1702396283; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4s5Yej4rDkHCfi3Kg8fEn9knPfVkyKEzuGckj+o09+M=;
        b=hy65J0b9EXuw76g9nLYh3eAJDbhbhprx1l8QrL0IQgxCqG8DN2yHwi57MSAK7K4Jln
         CaQCoNPNP8MEP1Wgziq0+o13xW2YcGJCgUhzONA0eHCaGscX6QlSF9ucdYFIutCvM2cn
         ZUmyBCxNwuVy6NcZm+zX6CF0tJtlaS3uWIrhjHdz51EvZfgKq4hIJd8jOjYmj7/WUMWK
         2yWeQgNSWc4VASjXssptfgtn8PuA1ioyP0Y8EsaZY616b17UD3jR7SmXh5mnI2xQ0mcT
         qhHCCe7qdbIEsTT6FNUFwXUzDi9ErrfXdY4ZEeBMoskirbG++ZjGQGmoTqWtkyJpKTVE
         Cilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701791483; x=1702396283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4s5Yej4rDkHCfi3Kg8fEn9knPfVkyKEzuGckj+o09+M=;
        b=VRDGoRTGe4HPiEoLGpf6iTEUxI0JmedCiGiKUivh0rmjwFHH4SeT1R/IomEk6Vjjxy
         xw9Cbz6w96nl2ODQSxuRCw0HuwIMTwCNbw6F5UX8Hng3WmX9kpFAOgss2LR5ZS7XDhrz
         khbVZNq1VV3f7k336c9RGXd/uaEtIoEYXFiGTvzsnVwRUd0PmDckOvogJ4Enx7KOzKld
         0MQKIIdyQKkIkqWWtL9n9PlDMqc9zpwfuPaTnFx1gvINwqMw8cwbz6DdMiFxtRP/P7Mg
         /cp5wmDeoRSoJ0kGVVBCl1RZ/iViFaBCh65v/ylKZuMnR9ldL1U/DMhYs29d99WN/3/8
         644w==
X-Gm-Message-State: AOJu0Ywvz9UJ5XNJAJzPmT3hx/fd73XVzuN5rHhCf4+Mo2iVqoqrriIX
	FNnBpYBjXXS3B50/vMX3UCnOe/Nukt2XQzfvk/zpcg==
X-Google-Smtp-Source: AGHT+IGx+vL5kfnW5SLpf5ZRYJnsntT9lRyeWKDdlijUNYQroL23lRxkm526IAQbQIbHJ1SWlEMS/B2Wd/V4K8KIJEU=
X-Received: by 2002:a2e:6814:0:b0:2ca:e89:3003 with SMTP id
 c20-20020a2e6814000000b002ca0e893003mr1075191lja.103.1701791483098; Tue, 05
 Dec 2023 07:51:23 -0800 (PST)
MIME-Version: 1.0
References: <20231205044257.4163850-1-bruce.ashfield@gmail.com> <20231205044257.4163850-3-bruce.ashfield@gmail.com>
In-Reply-To: <20231205044257.4163850-3-bruce.ashfield@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 5 Dec 2023 05:51:11 -1000
Message-ID: <CAOSpxdY_1UrsSN2B9fWsmiZMeusCTJqCuGq2FV4OEiqoizLq0g@mail.gmail.com>
Subject: Re: [OE-core][dunfell 3/3] linux-yocto/5.4: update to v5.4.262
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 15:51:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191844

Hi Bruce,

I'm getting a failure on the autobuilder for this version bump:

https://errors.yoctoproject.org/Errors/Details/745216/

ERROR: Package Version (5.4.262+gitAUTOINC+9f1a56eeea_102ea8999f) does
not match of kernel being built (5.4.260). Please update the PV
variable to match the kernel source or set
KERNEL_VERSION_SANITY_SKIP=3D"1" in your recipe.

Steve

On Mon, Dec 4, 2023 at 6:43=E2=80=AFPM <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Updating  to the latest korg -stable release that comprises
> the following commits:
>
>     8e221b47173d Linux 5.4.262
>     b053223b7cf4 netfilter: nf_tables: bogus EBUSY when deleting flowtabl=
e after flush (for 5.4)
>     c35df8b8c572 netfilter: nf_tables: disable toggling dormant table sta=
te more than once
>     e10f661adc55 netfilter: nf_tables: fix table flag updates
>     46c2947fcd71 netfilter: nftables: update table flags from the commit =
phase
>     b09e6ccf0d12 netfilter: nf_tables: double hook unregistration in netn=
s path
>     b05a24cc453e netfilter: nf_tables: unregister flowtable hooks on netn=
s exit
>     a995a68e8a3b netfilter: nf_tables: fix memleak when more than 255 ele=
ments expired
>     b95d7af657a8 netfilter: nft_set_hash: try later when GC hits EAGAIN o=
n iteration
>     61a7b3de20e2 netfilter: nft_set_rbtree: use read spinlock to avoid da=
tapath contention
>     03caf75da105 netfilter: nft_set_rbtree: skip sync GC for new elements=
 in this transaction
>     021d734c7eaa netfilter: nf_tables: defer gc run if previous batch is =
still pending
>     38ed6a5f836f netfilter: nf_tables: use correct lock to protect gc_lis=
t
>     4b6346dc1edf netfilter: nf_tables: GC transaction race with abort pat=
h
>     b76dcf466223 netfilter: nf_tables: GC transaction race with netns dis=
mantle
>     29ff9b8efb84 netfilter: nf_tables: fix GC transaction races with netn=
s and netlink event exit path
>     1398a0eee290 netfilter: nf_tables: remove busy mark and gc batch API
>     85520a1f1d87 netfilter: nft_set_hash: mark set element as dead when d=
eleting from packet path
>     c357648929c8 netfilter: nf_tables: adapt set backend to use GC transa=
ction API
>     bbdb3b65aa91 netfilter: nf_tables: GC transaction API to avoid race w=
ith control plane
>     1da4874d05da netfilter: nf_tables: don't skip expired elements during=
 walk
>     acaee227cf79 netfilter: nft_set_rbtree: fix overlap expiration walk
>     899aa5638568 netfilter: nft_set_rbtree: fix null deref on element ins=
ertion
>     181859bdfb97 netfilter: nft_set_rbtree: Switch to node list walk for =
overlap detection
>     3c7ec098e3b5 netfilter: nf_tables: drop map element references from p=
reparation phase
>     6b880f3b2c04 netfilter: nftables: rename set element data activation/=
deactivation functions
>     e1eed9e0b5e8 netfilter: nf_tables: pass context to nft_set_destroy()
>     961c4511c757 tracing: Have trace_event_file have ref counters
>     7676a41d90c5 drm/amdgpu: fix error handling in amdgpu_bo_list_get()
>     36383005f1db ext4: remove gdb backup copy for meta bg in setup_new_fl=
ex_group_blocks
>     e95f74653dff ext4: correct the start block of counting reserved clust=
ers
>     1fbfdcc3d65e ext4: correct return value of ext4_convert_meta_bg
>     dfdfd3f21830 ext4: correct offset of gdb backup in non meta_bg group =
to update_backups
>     85c12e80c474 ext4: apply umask if ACL support is disabled
>     d2aed8814f02 Revert "net: r8169: Disable multicast filter for RTL8168=
H and RTL8107E"
>     b9e5f633b35d nfsd: fix file memleak on client_opens_release
>     339d7d40d3dc media: venus: hfi: add checks to handle capabilities fro=
m firmware
>     cab97cdd409a media: venus: hfi: fix the check to handle session buffe=
r requirement
>     5d39d0c1f43f media: venus: hfi_parser: Add check to keep the number o=
f codecs within range
>     497b12d47cc6 media: sharp: fix sharp encoding
>     92d8a0478fb3 media: lirc: drop trailing space from scancode transmit
>     cac054d10324 i2c: i801: fix potential race in i801_block_transaction_=
byte_by_byte
>     b132e462363f net: dsa: lan9303: consequently nested-lock physical MDI=
O
>     229738d71702 Revert ncsi: Propagate carrier gain/loss events to the N=
CSI controller
>     4074957ec6bb Bluetooth: btusb: Add 0bda:b85b for Fn-Link RTL8852BE
>     356a2ee5fc36 Bluetooth: btusb: Add RTW8852BE device 13d3:3570 to devi=
ce tables
>     afe92b66a5d8 bluetooth: Add device 13d3:3571 to device tables
>     dc073a2626d3 bluetooth: Add device 0bda:887b to device tables
>     75d26f7f6118 Bluetooth: btusb: Add Realtek RTL8852BE support ID 0x0cb=
8:0xc559
>     323710a6b4c6 Bluetooth: btusb: add Realtek 8822CE to usb_device_id ta=
ble
>     981ee23b8d48 Bluetooth: btusb: Add flag to define wideband speech cap=
ability
>     0fe69c99cc13 tty: serial: meson: fix hard LOCKUP on crtscts mode
>     8f40bbf7dc01 serial: meson: Use platform_get_irq() to get the interru=
pt
>     a1113f2c9b2c tty: serial: meson: retrieve port FIFO size from DT
>     13391526d817 serial: meson: remove redundant initialization of variab=
le id
>     6245d0d70fe8 ALSA: hda/realtek - Enable internal speaker of ASUS K650=
0ZC
>     4ef452297de4 ALSA: info: Fix potential deadlock at disconnection
>     c7df9523fed2 parisc/pgtable: Do not drop upper 5 address bits of phys=
ical address
>     c32dfec86714 parisc: Prevent booting 64-bit kernels on PA1.x machines
>     d570d139cb38 i3c: master: cdns: Fix reading status register
>     ad6941b192ca mm/cma: use nth_page() in place of direct struct page ma=
nipulation
>     36512866607e dmaengine: stm32-mdma: correct desc prep when channel ru=
nning
>     4a5c267d5700 mcb: fix error handling for different scenarios when par=
sing
>     25eb381a736e i2c: core: Run atomic i2c xfer when !preemptible
>     975b5ff33f9a kernel/reboot: emergency_restart: Set correct system_sta=
te
>     421f9ccc75c5 quota: explicitly forbid quota files from being encrypte=
d
>     7d0c36cd2e65 jbd2: fix potential data lost in recovering journal race=
d with synchronizing fs bdev
>     665c2f186b8c btrfs: don't arbitrarily slow down delalloc if we're com=
mitting
>     b5a8382cf829 PM: hibernate: Clean up sync_read handling in snapshot_w=
rite_next()
>     2b3cfdaa8833 PM: hibernate: Use __get_safe_page() rather than touchin=
g the list
>     612c17a90fce mmc: vub300: fix an error code
>     398940412e8d clk: qcom: ipq8074: drop the CLK_SET_RATE_PARENT flag fr=
om PLL clocks
>     0b2b22b706ec parisc/pdc: Add width field to struct pdc_model
>     012dba0ab814 PCI: keystone: Don't discard .probe() callback
>     9988c9dc3c8b PCI: keystone: Don't discard .remove() callback
>     a438322e0078 genirq/generic_chip: Make irq_remove_generic_chip() irqd=
omain aware
>     683c562c434d mmc: meson-gx: Remove setting of CMD_CFG_ERROR
>     d894f9288cff ACPI: resource: Do IRQ override on TongFang GMxXGxx
>     7b15bc9b753f PCI/sysfs: Protect driver's D3cold preference from user =
space
>     78d3487b5b87 hvc/xen: fix error path in xen_hvc_init() to always regi=
ster frontend driver
>     6b21ae025b82 audit: don't WARN_ON_ONCE(!current->mm) in audit_exe_com=
pare()
>     c0d01f03aaac audit: don't take task_lock() in audit_exe_compare() cod=
e path
>     4d0a828775f0 KVM: x86: Ignore MSR_AMD64_TW_CFG access
>     5066faedd2f7 KVM: x86: hyper-v: Don't auto-enable stimer on write fro=
m user-space
>     268d17ab637a x86/cpu/hygon: Fix the CPU topology evaluation for real
>     acbc12b0b348 scsi: megaraid_sas: Increase register read retry rount f=
rom 3 to 30 for selected registers
>     bae690510316 bpf: Fix precision tracking for BPF_ALU | BPF_TO_BE | BP=
F_END
>     6933bc9a5f77 randstruct: Fix gcc-plugin performance mode to stay in g=
roup
>     c94d05ac6937 media: venus: hfi: add checks to perform sanity on queue=
 pointers
>     6d028ade9db7 cifs: spnego: add ';' in HOST_KEY_LEN
>     26415e35f669 tools/power/turbostat: Fix a knl bug
>     a49786297b83 macvlan: Don't propagate promisc change to lower dev in =
passthru
>     04cb9ab8ebc5 net/mlx5e: Check return value of snprintf writing to fw_=
version buffer for representors
>     c740f4716a44 net/mlx5_core: Clean driver version and name
>     e4bdbcce8e02 net/mlx5e: fix double free of encap_header
>     5cc1f24f7333 net: stmmac: fix rx budget limit check
>     c4b712d1a814 net: stmmac: Rework stmmac_rx()
>     b2762d13dfae netfilter: nf_conntrack_bridge: initialize err to 0
>     fd51e7541ff6 net: ethernet: cortina: Fix MTU max setting
>     823bffdaac39 net: ethernet: cortina: Handle large frames
>     f5055d7345d6 net: ethernet: cortina: Fix max RX frame define
>     b4f0e605a508 bonding: stop the device in bond_setup_by_slave()
>     7ea0a719e578 ptp: annotate data-race around q->head and q->tail
>     89af55e0fa13 xen/events: fix delayed eoi list handling
>     db957a2f5481 ppp: limit MRU to 64K
>     f3b250d91993 tipc: Fix kernel-infoleak due to uninitialized TLV value
>     77236275d4cd net: hns3: fix variable may not initialized problem in h=
ns3_init_mac_addr()
>     14c6cd41c851 tty: Fix uninit-value access in ppp_sync_receive()
>     4d2d30f0792b ipvlan: add ipvlan_route_v6_outbound() helper
>     ed53c1518811 NFSv4.1: fix SP4_MACH_CRED protection for pnfs IO
>     fe449f8b9727 wifi: iwlwifi: Use FW rate for non-data frames
>     eca19db60f99 pwm: Fix double shift bug
>     d996530ba92c ASoC: ti: omap-mcbsp: Fix runtime PM underflow warnings
>     6d703922bc9e kgdb: Flush console before entering kgdb on panic
>     eac3e4760aa1 drm/amd/display: Avoid NULL dereference of timing genera=
tor
>     514565ff7fce media: cobalt: Use FIELD_GET() to extract Link Width
>     2bb42a27a92f gfs2: ignore negated quota changes
>     a251e20a2cbe media: vivid: avoid integer overflow
>     8f83c85ee882 media: gspca: cpia1: shift-out-of-bounds in set_flicker
>     a8f829886d47 i2c: sun6i-p2wi: Prevent potential division by zero
>     80876a07ca3b usb: gadget: f_ncm: Always set current gadget in ncm_bin=
d()
>     460284dfb10b tty: vcc: Add check for kstrdup() in vcc_probe()
>     35b9435123ef HID: Add quirk for Dell Pro Wireless Keyboard and Mouse =
KM5221W
>     b549acf99982 scsi: libfc: Fix potential NULL pointer dereference in f=
c_lport_ptp_setup()
>     33906b36b15d atm: iphase: Do PCI error checks on own line
>     54f4dde8fa0c PCI: tegra194: Use FIELD_GET()/FIELD_PREP() with Link Wi=
dth fields
>     2527775616f3 ALSA: hda: Fix possible null-ptr-deref when assigning a =
stream
>     953ed26a77c6 ARM: 9320/1: fix stack depot IRQ stack filter
>     7467ca10a5ff jfs: fix array-index-out-of-bounds in diAlloc
>     ecfb47f13b08 jfs: fix array-index-out-of-bounds in dbFindLeaf
>     32bd8f1cbcf8 fs/jfs: Add validity check for db_maxag and db_agpref
>     a81a56b4cbe3 fs/jfs: Add check for negative db_l2nbperpage
>     e18d266fb3f1 RDMA/hfi1: Use FIELD_GET() to extract Link Width
>     c9c133469730 crypto: pcrypt - Fix hungtask for PADATA_RESET
>     ddd6e5266343 selftests/efivarfs: create-read: fix a resource leak
>     437e0fa907ba drm/amdgpu: Fix a null pointer access when the smc_rreg =
pointer is NULL
>     d50a56749e5a drm/amd: Fix UBSAN array-index-out-of-bounds for Polaris=
 and Tonga
>     c847379a5d00 drm/amd: Fix UBSAN array-index-out-of-bounds for SMU7
>     1f24c286f4a4 drm/komeda: drop all currently held locks if deadlock ha=
ppens
>     5305ae0d4ad8 platform/x86: thinkpad_acpi: Add battery quirk for Think=
pad X120e
>     3c4236f1b2a7 Bluetooth: Fix double free in hci_conn_cleanup
>     3cf391e4174a wifi: ath10k: Don't touch the CE interrupt registers aft=
er power up
>     252bde6b17b8 net: annotate data-races around sk->sk_dst_pending_confi=
rm
>     73909810ac27 net: annotate data-races around sk->sk_tx_queue_mapping
>     bd653b07095a wifi: ath10k: fix clang-specific fortify warning
>     32cc96dc5f4e wifi: ath9k: fix clang-specific fortify warnings
>     efeae5f4972f wifi: mac80211: don't return unset power in ieee80211_ge=
t_tx_power()
>     770da15be321 wifi: mac80211_hwsim: fix clang-specific fortify warning
>     cfe13e1486d4 x86/mm: Drop the 4 MB restriction on minimal NUMA node m=
emory size
>     91f7467ac96a clocksource/drivers/timer-atmel-tcb: Fix initialization =
on SAM9 hardware
>     da667a3f8e23 clocksource/drivers/timer-imx-gpt: Fix potential memory =
leak
>     788c0b3442ea perf/core: Bail out early if the request AUX area is out=
 of bound
>     dcd85e3c9293 locking/ww_mutex/test: Fix potential workqueue corruptio=
n
>     ef379773e2e7 Linux 5.4.261
>     3542ef5c3748 btrfs: use u64 for buffer sizes in the tree search ioctl=
s
>     7868e6151a6d Revert "mmc: core: Capture correct oemid-bits for eMMC c=
ards"
>     7be3aca8d73d fbdev: fsl-diu-fb: mark wr_reg_wa() static
>     6c66d737b272 fbdev: imsttfb: fix a resource leak in probe
>     b90c8dfd715f fbdev: imsttfb: Fix error path of imsttfb_probe()
>     4a6a3f1b3840 spi: spi-zynq-qspi: add spi-mem to driver kconfig depend=
encies
>     157333513d14 drm/syncobj: fix DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE
>     21858a75dc78 netfilter: nat: fix ipv6 nat redirect with mapped and sc=
oped addresses
>     ae99c5e16a83 netfilter: nft_redir: use `struct nf_nat_range2` through=
out and deduplicate eval call-backs
>     11380557c236 netfilter: xt_recent: fix (increase) ipv6 literal buffer=
 length
>     cce1d4668191 r8169: respect userspace disabling IFF_MULTICAST
>     e820e23338d1 tg3: power down device only on SYSTEM_POWER_OFF
>     f8065cde49b2 net/smc: fix dangling sock under state SMC_APPFINCLOSEWA=
IT
>     592f934b7a22 net: stmmac: xgmac: Enable support for multiple Flexible=
 PPS outputs
>     85513df59a3e Fix termination state for idr_for_each_entry_ul()
>     56cddb5e657f net: r8169: Disable multicast filter for RTL8168H and RT=
L8107E
>     e5a664ef4928 dccp/tcp: Call security_inet_conn_request() after settin=
g IPv6 addresses.
>     3af0af2f98f3 dccp: Call security_inet_conn_request() after setting IP=
v4 addresses.
>     afa49774d812 inet: shrink struct flowi_common
>     2199260c42e6 tipc: Change nla_policy for bearer-related names to NLA_=
NUL_STRING
>     cbdcdf42d15d llc: verify mac len before reading mac header
>     50d122536661 Input: synaptics-rmi4 - fix use after free in rmi_unregi=
ster_function()
>     e3677bfcbbcb pwm: brcmstb: Utilize appropriate clock APIs in suspend/=
resume
>     6e9b5295892e pwm: sti: Reduce number of allocations and drop usage of=
 chip_data
>     19e45307f71f pwm: sti: Avoid conditional gotos
>     c4d5179e42b4 regmap: prevent noinc writes from clobbering cache
>     d62d868b30b8 media: dvb-usb-v2: af9035: fix missing unlock
>     7843a9bfbe13 media: s3c-camif: Avoid inappropriate kfree()
>     b35fdade92c5 media: bttv: fix use after free error due to btv->timeou=
t timer
>     0bc0e36fccc2 pcmcia: ds: fix possible name leak in error path in pcmc=
ia_device_add()
>     1502edd4a014 pcmcia: ds: fix refcount leak in pcmcia_device_add()
>     58d6fb6a933c pcmcia: cs: fix possible hung task and memory leak pccar=
dd()
>     37212eede637 rtc: pcf85363: fix wrong mask/val parameters in regmap_u=
pdate_bits call
>     204beeb509d3 i3c: Fix potential refcount leak in i3c_master_register_=
new_i3c_devs
>     247ed618f534 powerpc/pseries: fix potential memory leak in init_cpu_a=
ssociativity()
>     cee681d4b22b powerpc/imc-pmu: Use the correct spinlock initializer.
>     dc5804b47b66 powerpc/xive: Fix endian conversion size
>     b6cffe8dd7cd modpost: fix tee MODULE_DEVICE_TABLE built on big-endian=
 host
>     90ab33735e2e f2fs: fix to initialize map.m_pblk in f2fs_precache_exte=
nts()
>     9f20b06214dc dmaengine: pxa_dma: Remove an erroneous BUG_ON() in pxad=
_free_desc()
>     688326e2cf9e USB: usbip: fix stub_dev hub disconnect
>     b003b7a7d42e tools: iio: iio_generic_buffer ensure alignment
>     7a64d15db7aa tools: iio: iio_generic_buffer: Fix some integer type an=
d calculation
>     db6d5b9ff6e8 tools: iio: privatize globals and functions in iio_gener=
ic_buffer.c file
>     55b90e4c406a misc: st_core: Do not call kfree_skb() under spin_lock_i=
rqsave()
>     ed9b2ad3b9ca dmaengine: ti: edma: handle irq_of_parse_and_map() error=
s
>     64c47749fc75 usb: dwc2: fix possible NULL pointer dereference caused =
by driver concurrency
>     4050f13f71f2 tty: tty_jobctrl: fix pid memleak in disassociate_ctty()
>     ba46faaa49c5 leds: trigger: ledtrig-cpu:: Fix 'output may be truncate=
d' issue for 'cpu'
>     abfd682fc5f0 ledtrig-cpu: Limit to 8 CPUs
>     f6c3b7a4ce51 leds: pwm: Don't disable the PWM when the LED should be =
off
>     cd6f50115fab leds: pwm: convert to atomic PWM API
>     9686f771c096 leds: pwm: simplify if condition
>     87b1ee831ddf mfd: dln2: Fix double put in dln2_probe
>     b843d2cd134b ASoC: ams-delta.c: use component after check
>     4634c9cc726d ASoC: Intel: Skylake: Fix mem leak when parsing UUIDs fa=
ils
>     66888e6953f8 sh: bios: Revive earlyprintk support
>     fdcbe9ce7bf3 RDMA/hfi1: Workaround truncation compilation error
>     01698922f5d3 scsi: ufs: core: Leave space for '\0' in utf8 desc strin=
g
>     3c61391a31a6 ext4: move 'ix' sanity check to corrent position
>     454e6493bbda ARM: 9321/1: memset: cast the constant byte to unsigned =
char
>     727203e6e7e7 hid: cp2112: Fix duplicate workqueue initialization
>     48bb2931f24c HID: cp2112: Use irqchip template
>     7b62cf90d0ea crypto: caam/jr - fix Chacha20 + Poly1305 self test fail=
ure
>     090e89c71620 crypto: caam/qi2 - fix Chacha20 + Poly1305 self test fai=
lure
>     40ba3fa21250 nd_btt: Make BTT lanes preemptible
>     68655462f8be sched/rt: Provide migrate_disable/enable() inlines
>     d14a373fe559 libnvdimm/of_pmem: Use devm_kstrdup instead of kstrdup a=
nd check its return value
>     f5d95a39683e hwrng: geode - fix accessing registers
>     e4e4d4abb82b clk: scmi: Free scmi_clk allocated when the clocks with =
invalid info are skipped
>     ce11e445d0ae firmware: ti_sci: Mark driver as non removable
>     5d97cc0b491e firmware: ti_sci: Replace HTTP links with HTTPS ones
>     cc1a1dcb411f soc: qcom: llcc: Handle a second device without data cor=
ruption
>     813fdddde20f soc: qcom: Rename llcc-slice to llcc-qcom
>     077010717b52 soc: qcom: llcc cleanup to get rid of sdm845 specific dr=
iver file
>     3da50ee512e2 ARM: dts: qcom: mdm9615: populate vsdcc fixed regulator
>     6b464d9414e3 arm64: dts: qcom: sdm845-mtp: fix WiFi configuration
>     64d990086065 drm/rockchip: cdn-dp: Fix some error handling paths in c=
dn_dp_probe()
>     ddc42881f170 drm/radeon: possible buffer overflow
>     4a29f0f7a1b7 drm/rockchip: vop: Fix call to crtc reset helper
>     824f0f4f93c6 drm/rockchip: vop: Fix reset of state in duplicate state=
 crtc funcs
>     eaf62ea6504f hwmon: (coretemp) Fix potentially truncated sysfs attrib=
ute name
>     9fb0eed09e14 platform/x86: wmi: Fix opening of char device
>     22117b77eecb platform/x86: wmi: remove unnecessary initializations
>     1607ea8a8161 platform/x86: wmi: Fix probe failure when failing to reg=
ister WMI devices
>     d1461f0c9ca0 clk: mediatek: clk-mt2701: Add check for mtk_alloc_clk_d=
ata
>     e8ae4b49dd9c clk: mediatek: clk-mt7629: Add check for mtk_alloc_clk_d=
ata
>     cfa68e0ac5dc clk: mediatek: clk-mt7629-eth: Add check for mtk_alloc_c=
lk_data
>     2705c5b97f50 clk: mediatek: clk-mt6797: Add check for mtk_alloc_clk_d=
ata
>     fbe466f06d4e clk: mediatek: clk-mt6779: Add check for mtk_alloc_clk_d=
ata
>     8ae911637b0b clk: npcm7xx: Fix incorrect kfree
>     cbcf67b0bc5d clk: keystone: pll: fix a couple NULL vs IS_ERR() checks
>     3d38bc4bab88 clk: imx: Select MXC_CLK for CLK_IMX8QXP
>     ae98b5ef991a clk: qcom: gcc-sm8150: Fix gcc_sdcc2_apps_clk_src
>     15f335494bb3 clk: qcom: gcc-sm8150: use ARRAY_SIZE instead of specify=
ing num_parents
>     141ccc127230 clk: qcom: clk-rcg2: Fix clock rate overflow for high pa=
rent frequencies
>     dbf13624b2de regmap: debugfs: Fix a erroneous check after snprintf()
>     af50165c1218 ipvlan: properly track tx_errors
>     76304c749e05 net: add DEV_STATS_READ() helper
>     4482b250c895 ipv6: avoid atomic fragment on GSO packets
>     19d527337870 ACPI: sysfs: Fix create_pnp_modalias() and create_of_mod=
alias()
>     5105d46146f2 tcp: fix cookie_init_timestamp() overflows
>     e4e819bdc8f3 tcp: Remove one extra ktime_get_ns() from cookie_init_ti=
mestamp
>     7ab8aa73002c chtls: fix tp->rcv_tstamp initialization
>     75bbf6e93462 r8169: fix rare issue with broken rx after link-down on =
RTL8125
>     282342bc47c6 r8169: use tp_to_dev instead of open code
>     3091ab943dfc thermal: core: prevent potential string overflow
>     35854733ae67 can: dev: can_restart(): fix race condition between cont=
roller restart and netif_carrier_on()
>     b53be254d30f can: dev: can_restart(): don't crash kernel if carrier i=
s OK
>     a29f012a27cf wifi: rtlwifi: fix EDCA limit set by BT coexistence
>     bed72a332f02 tcp_metrics: do not create an entry from tcp_init_metric=
s()
>     f3902c0e6f08 tcp_metrics: properly set tp->snd_ssthresh in tcp_init_m=
etrics()
>     b78f2b7774a0 tcp_metrics: add missing barriers on delete
>     af0fe2c2ff4d wifi: mt76: mt7603: rework/fix rx pse hang check
>     a2e99dbdc127 wifi: rtw88: debug: Fix the NULL vs IS_ERR() bug for deb=
ugfs_create_file()
>     c9b929f7932b tcp: call tcp_try_undo_recovery when an RTOd TFO SYNACK =
is ACKed
>     25eaef1d0d0e i40e: fix potential memory leaks in i40e_remove()
>     09ce728c9e27 genirq/matrix: Exclude managed interrupts in irq_matrix_=
allocated()
>     3718a48ef495 vfs: fix readahead(2) on block devices
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   |  4 ++--
>  meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb |  4 ++--
>  meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 12 ++++++------
>  3 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recip=
es-kernel/linux/linux-yocto-rt_5.4.bb
> index 92913d3ddb7..6e8111c0fb9 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> @@ -12,12 +12,12 @@ python () {
>  }
>
>  SRCREV_machine ?=3D "e14c8b01bbec8630c1f30e037d6e0226851369cc"
> -SRCREV_meta ?=3D "26bb76ebda0b545f3580f3c01e471f3357deb9d3"
> +SRCREV_meta ?=3D "9f1a56eeea58f7d9b597f0ea33e43e35b8288762"
>
>  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;branch=3D${KBRAN=
CH};name=3Dmachine \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.4;destsuffix=3D${KMETA}"
>
> -LINUX_VERSION ?=3D "5.4.260"
> +LINUX_VERSION ?=3D "5.4.262"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8=
814"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/rec=
ipes-kernel/linux/linux-yocto-tiny_5.4.bb
> index f193a5990f7..020b259f6aa 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> @@ -6,7 +6,7 @@ KCONFIG_MODE =3D "--allnoconfig"
>
>  require recipes-kernel/linux/linux-yocto.inc
>
> -LINUX_VERSION ?=3D "5.4.260"
> +LINUX_VERSION ?=3D "5.4.262"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8=
814"
>
>  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',=
 d)}"
> @@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL =3D "2"
>
>  SRCREV_machine_qemuarm ?=3D "7a685407c99004f8f3574c8528d6988f68477fdc"
>  SRCREV_machine ?=3D "29ed7a00fd34f83e07e08d662009bb982f26d2af"
> -SRCREV_meta ?=3D "26bb76ebda0b545f3580f3c01e471f3357deb9d3"
> +SRCREV_meta ?=3D "9f1a56eeea58f7d9b597f0ea33e43e35b8288762"
>
>  PV =3D "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-=
kernel/linux/linux-yocto_5.4.bb
> index 4affa994044..b2ff391c376 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> @@ -17,12 +17,12 @@ SRCREV_machine_qemuarm ?=3D "c414b2cca9023975041723eb=
eeae7a7a1a9169e4"
>  SRCREV_machine_qemuarm64 ?=3D "102ea8999fae670974ae712724612b47aff915ff"
>  SRCREV_machine_qemumips ?=3D "fe3aac3a3f5be178a8ba293c89eec0ffb845f3b6"
>  SRCREV_machine_qemuppc ?=3D "93642912bcad365bbc9d55c6afc2253c3290063d"
> -SRCREV_machine_qemuriscv64 ?=3D "1de97ac6497bae665acc69e6b3b15bef57229d4=
4"
> -SRCREV_machine_qemux86 ?=3D "1de97ac6497bae665acc69e6b3b15bef57229d44"
> -SRCREV_machine_qemux86-64 ?=3D "1de97ac6497bae665acc69e6b3b15bef57229d44=
"
> +SRCREV_machine_qemuriscv64 ?=3D "4d141be8fd148e0ea68d8f957f527ad5f22015a=
b"
> +SRCREV_machine_qemux86 ?=3D "4d141be8fd148e0ea68d8f957f527ad5f22015ab"
> +SRCREV_machine_qemux86-64 ?=3D "4d141be8fd148e0ea68d8f957f527ad5f22015ab=
"
>  SRCREV_machine_qemumips64 ?=3D "a9d34f8519781762993c7cc36464f632d96989c9=
"
> -SRCREV_machine ?=3D "1de97ac6497bae665acc69e6b3b15bef57229d44"
> -SRCREV_meta ?=3D "26bb76ebda0b545f3580f3c01e471f3357deb9d3"
> +SRCREV_machine ?=3D "4d141be8fd148e0ea68d8f957f527ad5f22015ab"
> +SRCREV_meta ?=3D "9f1a56eeea58f7d9b597f0ea33e43e35b8288762"
>
>  # remap qemuarm to qemuarma15 for the 5.4 kernel
>  # KMACHINE_qemuarm ?=3D "qemuarma15"
> @@ -31,7 +31,7 @@ SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git=
;name=3Dmachine;branch=3D${KBRA
>             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.4;destsuffix=3D${KMETA}"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8=
814"
> -LINUX_VERSION ?=3D "5.4.260"
> +LINUX_VERSION ?=3D "5.4.262"
>
>  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',=
 d)}"
>  DEPENDS +=3D "openssl-native util-linux-native"
> --
> 2.39.2
>

