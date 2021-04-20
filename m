Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.5227.1618888162254149847
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Apr 2021 20:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: vVBYFgi726/9fBgYMdrGk8EKwzh89OnHAYd30Alyj0gQR0tHXBMO5/Ha5octxwDO41snlSXQ4A
 n93lBe2qYIiQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="192247184"
X-IronPort-AV: E=Sophos;i="5.82,235,1613462400"; 
   d="scan'208";a="192247184"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2021 20:09:21 -0700
IronPort-SDR: c7m0IIPWM20AaiUeUIUhUbrNvVEczD39GjUA2iVTYA0kbhgejiexnYdXWkY9DrnkoA8karQs2v
 Q4CaRqKLU83Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,235,1613462400"; 
   d="scan'208";a="426750150"
Received: from kmsmsx602.gar.corp.intel.com ([172.21.219.142])
  by orsmga008.jf.intel.com with ESMTP; 19 Apr 2021 20:09:20 -0700
Received: from kmsmsx603.gar.corp.intel.com (172.21.219.143) by
 kmsmsx602.gar.corp.intel.com (172.21.219.142) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 20 Apr 2021 11:09:19 +0800
Received: from kmsmsx603.gar.corp.intel.com ([172.21.219.143]) by
 kmsmsx603.gar.corp.intel.com ([172.21.219.143]) with mapi id 15.01.2106.013;
 Tue, 20 Apr 2021 11:09:19 +0800
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 10/10] linux-yocto/5.4: update to v5.4.112
Thread-Topic: [OE-core] [PATCH 10/10] linux-yocto/5.4: update to v5.4.112
Thread-Index: AQHXNK/l4eFVGunof0q6EiTomGrUHKq8uyiA
Date: Tue, 20 Apr 2021 03:09:19 +0000
Message-ID: <84b57155f4484bc9818a4b60b1527fe2@intel.com>
References: <cover.1618790681.git.bruce.ashfield@gmail.com>
 <7ba2e0c0c056c586de70b333c7ead39968b9b7e2.1618790681.git.bruce.ashfield@gmail.com>
In-Reply-To: <7ba2e0c0c056c586de70b333c7ead39968b9b7e2.1618790681.git.bruce.ashfield@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[SWAT]

Kernel config warnings  for 'juno' machine from meta-arm build:
https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/911/step=
s/17/logs/stdio

WARNING: linux-yocto-5.4.112+gitAUTOINC+5017570a13_5f54b437b6-r0 do_kernel_=
configcheck: [kernel config]: specified values did not make it into the ker=
nel's final configuration:

    [NOTE]: 'CONFIG_BT_HCIBTUSB' last val (m) and .config val (n) do not ma=
tch
    [INFO]: CONFIG_BT_HCIBTUSB : n=20
    [INFO]: raw config text:

        config BT_HCIBTUSB
        	tristate "HCI USB driver"
        	select BT_INTEL
        	depends on USB && BT && NET
        	help
        	  Bluetooth HCI USB driver.
        	  This driver is required if you want to use Bluetooth devices wit=
h
        	  USB interface.
	 =20
        	  Say Y here to compile support for Bluetooth USB devices into the
        	  kernel or say M to compile it as module (btusb).

        Config 'BT_HCIBTUSB' has the following Direct dependencies (BT_HCIB=
TUSB=3Dn):
                USB(=3Dy) && BT(=3Dn) && NET(=3Dy)
        Parent dependencies are:
             BT [n] USB [y] NET [y]
    [INFO]: config 'CONFIG_BT_HCIBTUSB' was set, but it wasn't assignable, =
check (parent) dependencies


    [NOTE]: 'CONFIG_BT_HCIUART' last val (m) and .config val (n) do not mat=
ch
    [INFO]: CONFIG_BT_HCIUART : n=20
    [INFO]: raw config text:

        config BT_HCIUART
        	tristate "HCI UART driver"
        	depends on (SERIAL_DEV_BUS || !SERIAL_DEV_BUS) && (NVMEM || !NVMEM=
) && TTY && BT && NET
        	help
        	  Bluetooth HCI UART driver.
        	  This driver is required if you want to use Bluetooth devices wit=
h
        	  serial port interface. You will also need this driver if you hav=
e
        	  UART based Bluetooth PCMCIA and CF devices like Xircom Credit Ca=
rd
        	  adapter and BrainBoxes Bluetooth PC Card.
	 =20
        	  Say Y here to compile support for Bluetooth UART devices into th=
e
        	  kernel or say M to compile it as module (hci_uart).

        Config 'BT_HCIUART' has the following Direct dependencies (BT_HCIUA=
RT=3Dn):
                SERIAL_DEV_BUS(=3Dy) || !SERIAL_DEV_BUS(=3Dy) (=3Dy) && NVM=
EM(=3Dy) || !NVMEM(=3Dy) (=3Dy) && TTY(=3Dy) && BT(=3Dn) && NET(=3Dy)
        Parent dependencies are:
             BT [n] TTY [y] NET [y] NVMEM [y] SERIAL_DEV_BUS [y]
    [INFO]: config 'CONFIG_BT_HCIUART' was set, but it wasn't assignable, c=
heck (parent) dependencies


    [NOTE]: 'CONFIG_BT_HCIUART_LL' last val (y) and .config val (n) do not =
match
    [INFO]: CONFIG_BT_HCIUART_LL : n=20
    [INFO]: raw config text:

        config BT_HCIUART_LL
        	bool "HCILL protocol support"
        	select BT_HCIUART_H4
        	depends on BT_HCIUART_SERDEV && BT && NET
        	help
        	  HCILL (HCI Low Level) is a serial protocol for communication
        	  between Bluetooth device and host. This protocol is required for
        	  serial Bluetooth devices that are based on Texas Instruments'
        	  BRF chips.
	 =20
        	  Say Y here to compile support for HCILL protocol.

        Config 'BT_HCIUART_LL' has the following Direct dependencies (BT_HC=
IUART_LL=3Dn):
                BT_HCIUART_SERDEV(=3Dn) && BT(=3Dn) && NET(=3Dy)
        Parent dependencies are:
             BT [n] BT_HCIUART_SERDEV [n] NET [y]
    [INFO]: config 'CONFIG_BT_HCIUART_LL' was set, but it wasn't assignable=
, check (parent) dependencies


    [NOTE]: 'CONFIG_BT_HCIUART_BCM' last val (y) and .config val (n) do not=
 match
    [INFO]: CONFIG_BT_HCIUART_BCM : n=20
    [INFO]: raw config text:

        config BT_HCIUART_BCM
        	bool "Broadcom protocol support"
        	select BT_HCIUART_H4
        	select BT_BCM
        	depends on BT_HCIUART && BT_HCIUART_SERDEV && (!ACPI || SERIAL_DEV=
_CTRL_TTYPORT) && GPIOLIB && BT && NET
        	help
        	  The Broadcom protocol support enables Bluetooth HCI over serial
        	  port interface for Broadcom Bluetooth controllers.
	 =20
        	  Say Y here to compile support for Broadcom protocol.

        Config 'BT_HCIUART_BCM' has the following Direct dependencies (BT_H=
CIUART_BCM=3Dn):
                BT_HCIUART(=3Dn) && BT_HCIUART_SERDEV(=3Dn) && !ACPI(=3Dy) =
|| SERIAL_DEV_CTRL_TTYPORT(=3Dy) (=3Dy) && GPIOLIB(=3Dy) && BT(=3Dn) && NET=
(=3Dy)
        Parent dependencies are:
             SERIAL_DEV_CTRL_TTYPORT [y] BT [n] NET [y] BT_HCIUART_SERDEV [=
n] BT_HCIUART [n] ACPI [y] GPIOLIB [y]
    [INFO]: config 'CONFIG_BT_HCIUART_BCM' was set, but it wasn't assignabl=
e, check (parent) dependencies


    [NOTE]: 'CONFIG_LEGACY_PTY_COUNT' last val (16) and .config val (n) do =
not match
    [INFO]: CONFIG_LEGACY_PTY_COUNT : n=20
    [INFO]: raw config text:

        config LEGACY_PTY_COUNT
        	int "Maximum number of legacy PTY in use"
        	range 0 256
        	default "256"
        	depends on LEGACY_PTYS && TTY
        	help
        	  The maximum number of legacy PTYs that can be used at any one ti=
me.
        	  The default is 256, and should be more than enough.  Embedded
        	  systems may want to reduce this to save memory.
	 =20
        	  When not in use, each legacy PTY occupies 12 bytes on 32-bit
        	  architectures and 24 bytes on 64-bit architectures.

        Config 'LEGACY_PTY_COUNT' has the following Direct dependencies (LE=
GACY_PTY_COUNT=3Dn):
                LEGACY_PTYS(=3Dn) && TTY(=3Dy)
        Parent dependencies are:
             256 [256] TTY [y] 0 [0] LEGACY_PTYS [n] 256 [256]
    [INFO]: config 'CONFIG_LEGACY_PTY_COUNT' was set, but it wasn't assigna=
ble, check (parent) dependencies



> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Bruce Ashfield
> Sent: Monday, April 19, 2021 8:07 AM
> To: richard.purdie@linuxfoundation.org
> Cc: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 10/10] linux-yocto/5.4: update to v5.4.112
>=20
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>=20
> Updating linux-yocto/5.4 to the latest korg -stable release that comprise=
s the
> following commits:
>=20
>     8f55ad4daf00 Linux 5.4.112
>     ea42fd91d304 Revert "cifs: Set CIFS_MOUNT_USE_PREFIX_PATH flag on
> setting cifs_sb->prepath."
>     7ee5bde3164c net: ieee802154: stop dump llsec params for monitors
>     b4042ecc12cb net: ieee802154: forbid monitor for del llsec seclevel
>     e82f8b7713ab net: ieee802154: forbid monitor for set llsec params
>     948a2817f71d net: ieee802154: fix nl802154 del llsec devkey
>     b3a105e15cd6 net: ieee802154: fix nl802154 add llsec key
>     4097afd93df7 net: ieee802154: fix nl802154 del llsec dev
>     7d32fc7964d6 net: ieee802154: fix nl802154 del llsec key
>     8f4c815c74f4 net: ieee802154: nl-mac: fix check on panid
>     38ea2b3ed00f net: mac802154: Fix general protection fault
>     6e7098f56c83 drivers: net: fix memory leak in peak_usb_create_dev
>     32e2f9a708e1 drivers: net: fix memory leak in atusb_probe
>     0a790ad1358b net: tun: set tun->dev->addr_len during TUNSETLINK
> processing
>     ed13df88c6d5 cfg80211: remove WARN_ON() in cfg80211_sme_connect
>     628ac886dfba net: sched: bump refcount for new action in ACT replace
> mode
>     3dbafee8426f dt-bindings: net: ethernet-controller: fix typo in NVMEM
>     f4c5968da773 clk: socfpga: fix iomem pointer cast on 64-bit
>     35ba6d9240ee RAS/CEC: Correct ce_add_elem()'s returned values
>     f666ad4f8d87 RDMA/addr: Be strict with gid size
>     44d03319fe77 RDMA/cxgb4: check for ipv6 address properly while
> destroying listener
>     3ca5345db92c net/mlx5: Fix PBMC register mapping
>     798d94a274fb net/mlx5: Fix placement of log_max_flow_counter
>     9716aac17419 net: hns3: clear VF down state bit before request link s=
tatus
>     9dd7092d1a96 openvswitch: fix send of uninitialized stack memory in c=
t
> limit reply
>     731abf396e37 net: openvswitch: conntrack: simplify the return express=
ion
> of ovs_ct_limit_get_default_limit()
>     d0aab59f0993 perf inject: Fix repipe usage
>     d3343a35d108 s390/cpcmd: fix inline assembly register clobbering
>     c88fa8d4f994 workqueue: Move the position of debug_work_activate() in
> __queue_work()
>     14060454cdb9 clk: fix invalid usage of list cursor in unregister
>     bedda47d5dce clk: fix invalid usage of list cursor in register
>     b3717885865c net: macb: restore cmp registers on resume path
>     c61fe6b7e21f scsi: ufs: core: Fix wrong Task Tag used in task managem=
ent
> request UPIUs
>     81fddc7be649 scsi: ufs: core: Fix task management request completion
> timeout
>     f6abec1a3172 scsi: ufs: Use blk_{get,put}_request() to allocate and f=
ree
> TMFs
>     a8d2d45c70c7 scsi: ufs: Avoid busy-waiting by eliminating tag conflic=
ts
>     c5efc9d26c84 scsi: ufs: Fix irq return code
>     537a2449cc6f net: udp: Add support for getsockopt(..., ..., UDP_GRO, =
...,
> ...);
>     de8c5962bdae drm/msm: Set drvdata to NULL when msm_drm_init() fails
>     e22ce1d21b42 i40e: Fix display statistics for veb_tc
>     7c0d2372298f soc/fsl: qbman: fix conflicting alignment attributes
>     c178e8a19937 net/rds: Fix a use after free in rds_message_map_pages
>     73f88cc2bf5c net/mlx5: Don't request more than supported EQs
>     029416e14be2 net/mlx5e: Fix ethtool indication of connector type
>     1f3010fc3fe6 ASoC: sunxi: sun4i-codec: fill ASoC card owner
>     db4600aa938c net: phy: broadcom: Only advertise EEE for supported
> modes
>     6aa7d2621b19 nfp: flower: ignore duplicate merge hints from FW
>     bbbee59f4f32 net/ncsi: Avoid channel_monitor hrtimer deadlock
>     c66b672a231c ARM: dts: imx6: pbab01: Set vmmc supply for both SD
> interfaces
>     c991ca6a2c79 net:tipc: Fix a double free in tipc_sk_mcast_rcv
>     200c8453287f cxgb4: avoid collecting SGE_QBASE regs during traffic
>     e9bdd3e45f0e gianfar: Handle error code at MAC address change
>     516c436ff5d6 can: bcm/raw: fix msg_namelen values depending on
> CAN_REQUIRED_SIZE
>     ca443546f8d4 arm64: dts: imx8mm/q: Fix pad control of SD1_DATA0
>     840a181729ac sch_red: fix off-by-one checks in red_check_params()
>     accb27006595 amd-xgbe: Update DMA coherency values
>     e472f6814ceb hostfs: fix memory handling in follow_link()
>     613f35568a5d hostfs: Use kasprintf() instead of fixed buffer formatti=
ng
>     fec47d458add i40e: Fix kernel oops when i40e driver removes VF's
>     c0aacaa0a8f2 i40e: Added Asym_Pause to supported link modes
>     f819977ad42c xfrm: Fix NULL pointer dereference on policy lookup
>     bac7e764e5d5 ASoC: wm8960: Fix wrong bclk and lrclk with pll enabled =
for
> some chips
>     b32969aaed1c ASoC: SOF: Intel: HDA: fix core status verification
>     99b4e9af8f00 ASoC: SOF: Intel: hda: remove unnecessary parentheses
>     540ddeed5c51 esp: delete NETIF_F_SCTP_CRC bit from features for esp
> offload
>     a128e07b472b net: xfrm: Localize sequence counter per network
> namespace
>     34659399e713 regulator: bd9571mwv: Fix AVS and DVFS voltage range
>     d78e99dd4960 xfrm: interface: fix ipv4 pmtu check to honor ip header =
df
>     7977d5fe3d5b net: dsa: lantiq_gswip: Configure all remaining
> GSWIP_MII_CFG bits
>     249908ed36a8 net: dsa: lantiq_gswip: Don't use PHY auto polling
>     910e785ba8de virtio_net: Add XDP meta data support
>     0534f1f1bc76 i2c: turn recovery error on init to debug
>     cafced041915 usbip: synchronize event handler with sysfs code paths
>     37168011d427 usbip: vudc synchronize sysfs code paths
>     06fedcc6870e usbip: stub-dev synchronize sysfs code paths
>     6a435364b608 usbip: add sysfs_lock to synchronize sysfs code paths
>     b02bded94b91 net: let skb_orphan_partial wake-up waiters.
>     fd8a95d56050 net-ipv6: bugfix - raw & sctp - switch to
> ipv6_can_nonlocal_bind()
>     b5e7653ffdd1 net: hsr: Reset MAC header for Tx path
>     a9311be5f617 mac80211: fix TXQ AC confusion
>     5a4f39f19e6f net: sched: sch_teql: fix null-pointer dereference
>     2f5edf14f62a i40e: Fix sparse error: 'vsi->netdev' could be null
>     b31d91e9e8c8 i40e: Fix sparse warning: missing error code 'err'
>     599200ad44e7 net: ensure mac header is set in virtio_net_hdr_to_skb()
>     158a9b815c54 bpf, sockmap: Fix sk->prot unhash op reset
>     0242251d6a97 ethernet/netronome/nfp: Fix a use after free in
> nfp_bpf_ctrl_msg_rx
>     4a2933c88399 net: hso: fix null-ptr-deref during tty device unregistr=
ation
>     ef2ccf84071f ice: Cleanup fltr list in case of allocation issues
>     0df579b3de8c ice: Fix for dereference of NULL pointer
>     1aecc5781101 ice: Increase control queue timeout
>     9de1caa1103f batman-adv: initialize "struct batadv_tvlv_tt_vlan_data"=
-
> >reserved field
>     79407ae3475e ARM: dts: turris-omnia: configure LED[2]/INTn pin as
> interrupt pin
>     9dfd74a8c015 parisc: avoid a warning on u8 cast for cmpxchg on u8 poi=
nters
>     957d0308aa36 parisc: parisc-agp requires SBA IOMMU driver
>     507c2009dc4c fs: direct-io: fix missing sdio->boundary
>     f495bedb001b ocfs2: fix deadlock between setattr and dio_end_io_write
>     52999a66c0b3 nds32: flush_dcache_page: use page_mapping_file to avoid
> races with swapoff
>     75fd54ea1b60 ia64: fix user_stack_pointer() for ptrace()
>     7a92396bf8dd gcov: re-fix clang-11+ support
>     c2b3cf2c70d6 drm/i915: Fix invalid access to ACPI _DSM objects
>     0e8f850e26b2 net: dsa: lantiq_gswip: Let GSWIP automatically set the =
xMII
> clock
>     6649b5eda131 net: ipv6: check for validity before dereferencing cfg-
> >fc_nlinfo.nlh
>     a09acbb53934 xen/evtchn: Change irq_info lock to raw_spinlock_t
>     aa0cff2e0751 nfc: Avoid endless loops caused by repeated
> llcp_sock_connect()
>     404daa4d62a3 nfc: fix memory leak in llcp_sock_connect()
>     41bc58ba0945 nfc: fix refcount leak in llcp_sock_connect()
>     c89903c9eff2 nfc: fix refcount leak in llcp_sock_bind()
>     12289d9840d6 ASoC: intel: atom: Stop advertising non working S24LE
> support
>     c99780f782aa ALSA: hda/realtek: Fix speaker amp setup on Acer Aspire =
E1
>     da8f3cc5771e ALSA: aloop: Fix initialization of controls
>     8732c2df9d15 counter: stm32-timer-cnt: fix ceiling miss-alignment wit=
h
> reload register
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
>  .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
>  meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
>  3 files changed, 18 insertions(+), 18 deletions(-)
>=20
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recip=
es-
> kernel/linux/linux-yocto-rt_5.4.bb
> index b78a163b9c..e52c9ebe0e 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> @@ -11,13 +11,13 @@ python () {
>          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel=
 to
> linux-yocto-rt to enable it")  }
>=20
> -SRCREV_machine ?=3D "cccae402fe6c1892e4395e25bd482d6bc8f00826"
> -SRCREV_meta ?=3D "5973c11656b6d5221a764be1b2f1622c7e905e6c"
> +SRCREV_machine ?=3D "324e77d816cf6434507ab29140beb24044009efa"
> +SRCREV_meta ?=3D "5017570a130f142365dfdcd043d84143fdd6e255"
>=20
>  SRC_URI =3D "git://git.yoctoproject.org/linux-
> yocto.git;branch=3D${KBRANCH};name=3Dmachine \
>             git://git.yoctoproject.org/yocto-kernel-
> cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-5.4;destsuffix=3D${KMETA}"
>=20
> -LINUX_VERSION ?=3D "5.4.111"
> +LINUX_VERSION ?=3D "5.4.112"
>=20
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8814"
>=20
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> index 059a7196fe..f07375c761 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> @@ -6,7 +6,7 @@ KCONFIG_MODE =3D "--allnoconfig"
>=20
>  require recipes-kernel/linux/linux-yocto.inc
>=20
> -LINUX_VERSION ?=3D "5.4.111"
> +LINUX_VERSION ?=3D "5.4.112"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8814"
>=20
>  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',=
 d)}"
> @@ -15,9 +15,9 @@ DEPENDS +=3D "openssl-native util-linux-native"
>  KMETA =3D "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL =3D "2"
>=20
> -SRCREV_machine_qemuarm ?=3D
> "519d4d331aad2c1302530c5af0b4356b6f362be9"
> -SRCREV_machine ?=3D "5dba555ee7d5317a9720d33403e1e1f8e560b3fc"
> -SRCREV_meta ?=3D "5973c11656b6d5221a764be1b2f1622c7e905e6c"
> +SRCREV_machine_qemuarm ?=3D
> "8463db325b93f0669446f68c19334cfe11ffb9c2"
> +SRCREV_machine ?=3D "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
> +SRCREV_meta ?=3D "5017570a130f142365dfdcd043d84143fdd6e255"
>=20
>  PV =3D "${LINUX_VERSION}+git${SRCPV}"
>=20
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-
> kernel/linux/linux-yocto_5.4.bb
> index 92e6a489e0..38833ff8f7 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> @@ -12,16 +12,16 @@ KBRANCH_qemux86  ?=3D "v5.4/standard/base"
>  KBRANCH_qemux86-64 ?=3D "v5.4/standard/base"
>  KBRANCH_qemumips64 ?=3D "v5.4/standard/mti-malta64"
>=20
> -SRCREV_machine_qemuarm ?=3D
> "eee89fab3a932bbd8a54995a5da2ac15af2d929f"
> -SRCREV_machine_qemuarm64 ?=3D
> "5dba555ee7d5317a9720d33403e1e1f8e560b3fc"
> -SRCREV_machine_qemumips ?=3D
> "7cafd60186c08ce6d941ad1bcfc539950534a178"
> -SRCREV_machine_qemuppc ?=3D
> "5dba555ee7d5317a9720d33403e1e1f8e560b3fc"
> -SRCREV_machine_qemuriscv64 ?=3D
> "5dba555ee7d5317a9720d33403e1e1f8e560b3fc"
> -SRCREV_machine_qemux86 ?=3D
> "5dba555ee7d5317a9720d33403e1e1f8e560b3fc"
> -SRCREV_machine_qemux86-64 ?=3D
> "5dba555ee7d5317a9720d33403e1e1f8e560b3fc"
> -SRCREV_machine_qemumips64 ?=3D
> "e7d9c5457ce29ae61c37580888743951f2bf65b9"
> -SRCREV_machine ?=3D "5dba555ee7d5317a9720d33403e1e1f8e560b3fc"
> -SRCREV_meta ?=3D "5973c11656b6d5221a764be1b2f1622c7e905e6c"
> +SRCREV_machine_qemuarm ?=3D
> "133328e5d558f6060a5633d71506a6b716bb4fc6"
> +SRCREV_machine_qemuarm64 ?=3D
> "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
> +SRCREV_machine_qemumips ?=3D
> "eef7365804592f95bceefa143cdb3cc19e8c6b66"
> +SRCREV_machine_qemuppc ?=3D
> "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
> +SRCREV_machine_qemuriscv64 ?=3D
> "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
> +SRCREV_machine_qemux86 ?=3D
> "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
> +SRCREV_machine_qemux86-64 ?=3D
> "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
> +SRCREV_machine_qemumips64 ?=3D
> "996fe040c8d8d01a9af6be42dae3844d127471bf"
> +SRCREV_machine ?=3D "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
> +SRCREV_meta ?=3D "5017570a130f142365dfdcd043d84143fdd6e255"
>=20
>  # remap qemuarm to qemuarma15 for the 5.4 kernel  #
> KMACHINE_qemuarm ?=3D "qemuarma15"
> @@ -30,7 +30,7 @@ SRC_URI =3D "git://git.yoctoproject.org/linux-
> yocto.git;name=3Dmachine;branch=3D${KBRA
>             git://git.yoctoproject.org/yocto-kernel-
> cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-5.4;destsuffix=3D${KMETA}"
>=20
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8814"
> -LINUX_VERSION ?=3D "5.4.111"
> +LINUX_VERSION ?=3D "5.4.112"
>=20
>  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',=
 d)}"
>  DEPENDS +=3D "openssl-native util-linux-native"
> --
> 2.19.1

