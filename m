Return-Path: <sadlife1990@gmail.com>
Received: from mail-ve0-f173.google.com (mail-ve0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9A1DF60E24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 08:36:55 +0000 (UTC)
Received: by mail-ve0-f173.google.com with SMTP id db11so7817525veb.18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 01:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=FVVA7FdieoC7M/q2swWd8L7h1Okss4PATTxPVCVZ8tA=;
	b=e/EKPQbIatt8FZdV99CV68jtvgK1s9jxiIjqvBs2L/57UsMET9TxZdovNuWlmn/j9s
	w2evXzH3VhjhynieYiKLVbL/+FMMLsYNVqFAowcJKONPpXJ4OTJ/KnwRZie+PmmGfSEE
	uMN0CgGC3a5Z0GN06/f+HBVRrJ7ineU6PqYwWfZhfYhWm59oqr+KUjhRxpb1aa2XBVgf
	pH7UYpDmUh0jmZIh7+fUN5C8Ll+y4BeznxtGYYh536yQpQmR8BomQI51S4gvpWe+YV7J
	vRbZz425ei2Jm3SgWIML5PVIy0/p+sasDlpwOcVLQ6qpvNKJZfWk0FnNpw3FkG5a8PsR
	bDuw==
MIME-Version: 1.0
X-Received: by 10.220.166.9 with SMTP id k9mr37114824vcy.20.1404117415936;
	Mon, 30 Jun 2014 01:36:55 -0700 (PDT)
Received: by 10.58.152.200 with HTTP; Mon, 30 Jun 2014 01:36:55 -0700 (PDT)
In-Reply-To: <20140630081507.GA5083@ad.chargestorm.se>
References: <CAAHuHfzRzh2LhFoc0VrdA+MqJiUOVwv_tNe9y48nOrk13ERHug@mail.gmail.com>
	<53B0DD86.4030402@windriver.com>
	<20140630081507.GA5083@ad.chargestorm.se>
Date: Mon, 30 Jun 2014 11:36:55 +0300
Message-ID: <CAAHuHfy=uyAnu1HiXfLA0a8Yk_DfrSpQktcBpedrW3SEzaYySA@mail.gmail.com>
From: Life Life <sadlife1990@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: anders@chargestorm.se, Saul Wold <saul.wold@intel.com>
Subject: Re: Cape Manager
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
X-List-Received-Date: Mon, 30 Jun 2014 08:37:01 -0000
Content-Type: multipart/alternative; boundary=047d7b3a8ae6ccc70d04fd098f51

--047d7b3a8ae6ccc70d04fd098f51
Content-Type: text/plain; charset=UTF-8

Hello,

I add ti-meta but capemgr is not work

This my boot log

Booting from mmc ...
## Booting kernel from Legacy Image at 80007fc0 ...
   Image Name:   Linux-3.14.0-yocto-standard
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    4985304 Bytes = 4.8 MiB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
## Flattened Device Tree blob at 80f80000
   Booting using the fdt blob at 0x80f80000
   XIP Kernel Image ... OK
OK
   Using Device Tree in place at 80f80000, end 80f8a207

Starting kernel ...

Booting Linux on physical CPU 0x0
Initializing cgroup subsys cpuset
Initializing cgroup subsys cpu
Initializing cgroup subsys cpuacct
Linux version 3.14.0-yocto-standard (panda@pandabook) (gcc version 4.8.2
(GCC) ) #1 PREEMPT Fri Jun 27 15:16:56 EEST 2014
CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7), cr=10c53c7d
CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
Machine model: TI AM335x BeagleBone
cma: CMA: reserved 16 MiB at 9e800000
Memory policy: Data cache writeback
CPU: All CPU(s) started in SVC mode.
AM335X ES2.1 (sgx neon )
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 129792
Kernel command line: console=ttyO0,115200n8 root=/dev/mmcblk0p2 ro
rootfstype=ext4 rootwait
PID hash table entries: 2048 (order: 1, 8192 bytes)
Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
allocated 1048576 bytes of page_cgroup
please try 'cgroup_disable=memory' option if you don't want memory cgroups
Memory: 489448K/523264K available (7491K kernel code, 520K rwdata, 2444K
rodata, 488K init, 757K bss, 33816K reserved, 0K highmem)
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
    vmalloc : 0xe0800000 - 0xff000000   ( 488 MB)
    lowmem  : 0xc0000000 - 0xe0000000   ( 512 MB)
    pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
    modules : 0xbf000000 - 0xbfe00000   (  14 MB)
      .text : 0xc0008000 - 0xc09bc044   (9937 kB)
      .init : 0xc09bd000 - 0xc0a37034   ( 489 kB)
      .data : 0xc0a38000 - 0xc0aba0d4   ( 521 kB)
       .bss : 0xc0aba0d4 - 0xc0b77678   ( 758 kB)
SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
Preemptible hierarchical RCU implementation.
NR_IRQS:16 nr_irqs:16 16
IRQ: Found an INTC at 0xfa200000 (revision 5.0) with 128 interrupts
Total of 128 interrupts on 1 active controller
OMAP clockevent source: timer2 at 24000000 Hz
sched_clock: 32 bits at 24MHz, resolution 41ns, wraps every 178956969942ns
OMAP clocksource: timer1 at 24000000 Hz
Console: colour dummy device 80x30
Calibrating delay loop... 548.86 BogoMIPS (lpj=2744320)
pid_max: default: 32768 minimum: 301
Security Framework initialized
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
Initializing cgroup subsys debug
Initializing cgroup subsys memory
Initializing cgroup subsys devices
Initializing cgroup subsys freezer
Initializing cgroup subsys net_cls
Initializing cgroup subsys blkio
CPU: Testing write buffer coherency: ok
ftrace: allocating 25107 entries in 74 pages
Setting up static identity map for 0x806c4000 - 0x806c4058
devtmpfs: initialized
VFP support v0.3: implementor 41 architecture 3 part 30 variant c rev 3
omap_hwmod: tptc0 using broken dt data from edma
omap_hwmod: tptc1 using broken dt data from edma
omap_hwmod: tptc2 using broken dt data from edma
omap_hwmod: debugss: _wait_target_disable failed
xor: measuring software checksum speed
   arm4regs  :   685.200 MB/sec
   8regs     :   504.800 MB/sec
   32regs    :   658.800 MB/sec
xor: using function: arm4regs (685.200 MB/sec)
pinctrl core: initialized pinctrl subsystem
regulator-dummy: no parameters
NET: Registered protocol family 16
DMA: preallocated 256 KiB pool for atomic coherent allocations
cpuidle: using governor ladder
cpuidle: using governor menu
platform 49000000.edma: alias fck already exists
platform 49000000.edma: alias fck already exists
platform 49000000.edma: alias fck already exists
OMAP GPIO hardware version 0.1
hw-breakpoint: debug architecture 0x4 unsupported.
bio: create slab <bio-0> at 0
raid6: int32x1     89 MB/s
raid6: int32x2    107 MB/s
raid6: int32x4     90 MB/s
raid6: int32x8     92 MB/s
raid6: using algorithm int32x2 (107 MB/s)
raid6: using intx1 recovery algorithm
edma-dma-engine edma-dma-engine.0: TI EDMA DMA engine driver
vmmcsd_fixed: 3300 mV
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
omap_i2c 44e0b000.i2c: could not find pctldev for node
/pinmux@44e10800/pinmux_i2c0_pins,
deferring probe
platform 44e0b000.i2c: Driver omap_i2c requests probe deferral
cfg80211: Calling CRDA to update world regulatory domain
Switched to clocksource timer1
NET: Registered protocol family 2
TCP established hash table entries: 4096 (order: 2, 16384 bytes)
TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
TCP: Hash tables configured (established 4096 bind 4096)
TCP: reno registered
UDP hash table entries: 256 (order: 0, 4096 bytes)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
hw perfevents: enabled with ARMv7 Cortex-A8 PMU driver, 5 counters available
futex hash table entries: 256 (order: -1, 3072 bytes)
NFS: Registering the id_resolver key type
Key type id_resolver registered
Key type id_legacy registered
msgmni has been set to 987
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
pinctrl-single 44e10800.pinmux: 142 pins at pa f9e10800 size 568
omap_uart 44e09000.serial: no wakeirq for uart0
44e09000.serial: ttyO0 at MMIO 0x44e09000 (irq = 88, base_baud = 3000000)
is a OMAP UART0
console [ttyO0] enabled
[drm] Initialized drm 1.1.0 20060810
brd: module loaded
mtdoops: mtd device (mtddev=name/number) must be supplied
usbcore: registered new interface driver kaweth
pegasus: v0.9.3 (2013/04/25), Pegasus/Pegasus II USB Ethernet driver
usbcore: registered new interface driver pegasus
usbcore: registered new interface driver rtl8150
usbcore: registered new interface driver asix
usbcore: registered new interface driver ax88179_178a
usbcore: registered new interface driver cdc_ether
usbcore: registered new interface driver dm9601
usbcore: registered new interface driver smsc75xx
usbcore: registered new interface driver smsc95xx
usbcore: registered new interface driver net1080
usbcore: registered new interface driver cdc_subset
usbcore: registered new interface driver zaurus
usbcore: registered new interface driver MOSCHIP usb-ethernet driver
usbcore: registered new interface driver int51x1
usbcore: registered new interface driver cdc_ncm
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
ehci-omap: OMAP-EHCI Host Controller driver
usbcore: registered new interface driver usb-storage
mousedev: PS/2 mouse device common for all mice
omap_rtc 44e3e000.rtc: rtc core: registered 44e3e000.rtc as rtc0
i2c /dev entries driver
omap_wdt: OMAP Watchdog Timer Rev 0x01: initial timeout 60 sec
48060000.mmc supply vmmc_aux not found, using dummy regulator
481d8000.mmc supply vmmc_aux not found, using dummy regulator
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
oprofile: using arm/armv7
u32 classifier
    Actions configured
TCP: cubic registered
NET: Registered protocol family 10
sit: IPv6 over IPv4 tunneling driver
NET: Registered protocol family 17
mmc0: host does not support reading read-only switch. assuming write-enable.
Key type dns_resolver registered
ThumbEE CPU extension supported.
mmc0: new high speed SDHC card at address 0001
bio: create slab <bio-1> at 1
mmcblk0: mmc0:0001 ASTC 7.38 GiB
 mmcblk0: p1 p2
Btrfs loaded
regulator-dummy: disabling
slave hdmi.6: could not get i2c
platform hdmi.6: Driver slave requests probe deferral
platform 4830e000.lcdc: Driver tilcdc requests probe deferral
DCDC1: at 1500 mV
vdd_mpu: 925 <--> 1325 mV at 1100 mV
vdd_core: 925 <--> 1150 mV at 1100 mV
LDO1: at 1800 mV
LDO2: at 3300 mV
LDO3: 1800 mV
LDO4: at 3300 mV
tps65217 0-0024: TPS65217 ID 0xe version 1.2
omap_i2c 44e0b000.i2c: bus 0 rev0.11 at 400 kHz
mmc1: BKOPS_EN bit is not set
mmc1: new high speed MMC card at address 0001
mmcblk1: mmc1:0001 MMC02G 1.78 GiB
mmcblk1boot0: mmc1:0001 MMC02G partition 1 1.00 MiB
mmcblk1boot1: mmc1:0001 MMC02G partition 2 1.00 MiB
 mmcblk1: p1 p2
 mmcblk1boot1: unknown partition table
 mmcblk1boot0: unknown partition table
tilcdc 4830e000.lcdc: found TDA19988
[drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[drm] No driver support for vblank timestamp query.
tilcdc 4830e000.lcdc: No connectors reported connected with modes
[drm] Cannot find any crtc or sizes - going 1024x768
Console: switching to colour frame buffer device 128x48
tilcdc 4830e000.lcdc: fb0:  frame buffer device
tilcdc 4830e000.lcdc: registered panic notifier
[drm] Initialized tilcdc 1.0.0 20121205 on minor 0
console [netcon0] enabled
netconsole: network logging started
davinci_mdio 4a101000.mdio: davinci mdio revision 1.6
davinci_mdio 4a101000.mdio: detected phy mask fffffffe
libphy: 4a101000.mdio: probed
davinci_mdio 4a101000.mdio: phy[0]: device 4a101000.mdio:00, driver SMSC
LAN8710/LAN8720
Detected MACID = 1c:ba:8c:f1:ec:e4
omap_rtc 44e3e000.rtc: setting system clock to 2000-01-01 00:00:00 UTC
(946684800)
EXT4-fs (mmcblk0p2): mounted filesystem without journal. Opts: (null)
VFS: Mounted root (ext4 filesystem) readonly on device 179:2.
devtmpfs: mounted
Freeing unused kernel memory: 488K (c09bd000 - c0a37000)
INIT: version 2.88 booting
Starting udev
udevd[82]: starting version 182
EXT4-fs (mmcblk0p2): warning: mounting unchecked fs, running e2fsck is
recommended
EXT4-fs (mmcblk0p2): re-mounted. Opts: (null)
Starting Bootlog daemon: bootlogd.
random: dd urandom read with 128 bits of entropy available
random: nonblocking pool is initialized
Mon Jun 30 07:45:00 UTC 2014
INIT: Entering runlevel: 5
Configuring network interfaces... net eth0: initializing cpsw version 1.12
(0)
net eth0: phy found : id is : 0x7c0f1
libphy: PHY 4a101000.mdio:01 not found
net eth0: phy 4a101000.mdio:01 not found on slave 1
IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
udhcpc (v1.22.1) started
Sending discover...
libphy: 4a101000.mdio:00 - Link is Up - 100/Full
IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
Sending discover...
Sending select for 192.168.50.1
Lease of 192.168.50.18 obtained, lease time 691200
/etc/udhcpc.d/50default: Adding DNS 192.168.50.1
/etc/udhcpc.d/50default: Adding DNS 192.168.50.1
done.
Starting OpenBSD Secure Shell server: sshd
done.
Starting syslogd/klogd: done
Stopping Bootlog daemon: bootlogd.

Poky (Yocto Project Reference Distro) 1.6.1 beaglebone /dev/ttyO0

I run this command

root@beaglebone:~# cape-stop.sh
hexdump: /sys/bus/i2c/devices/3-005*/eeprom: No such file or directory
unknown cape:




2014-06-30 11:15 GMT+03:00 Anders Darander <anders@chargestorm.se>:

> * Robert Yang <liezhi.yang@windriver.com> [140630 05:47]:
>
>
> > On 06/30/2014 12:24 AM, Life Life wrote:
> > > Hello,
>
> > > I'm trying build yocto based linux, My hardware is beaglebone black I
> > > successfull build system image. But I can't see capemanager. Beacuse
> my lcd is
> > > not work.
>
> > Hello,
>
> > The cape manager is in meta-ti layer:
>
> > http://layers.openembedded.org/layerindex/branch/master/layer/meta-ti/
>
> > Seems that we'd better add it to meta-yoco-bsp ?
>
> Unless something has changed since I last looked at this, I don't think
> so.
>
> If I remember correctly, capemgr basically consists of a number of
> patches not in the mainline kernel (and also not in TI's staging
> kernel). I haven't checked it, by I doubt that we have them in the
> linux-yocto kernel. (Especially as the last time I checked it, you had
> to revert to a 3.8 (if I rember correctly, it might have been an even
> earlier kernel) kernel to get full capemgr support.
>
> If this has changed, then it'd be interesting to know!
>
> Cheers,
> Anders
>
> > Add Saul in the loop.
>
>
> --
> Anders Darander
> ChargeStorm AB / eStorm AB
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7b3a8ae6ccc70d04fd098f51
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hello,<br><br></div>I add ti-meta but capem=
gr is not work<br><br></div>This my boot log<br><br>Booting from mmc ...<br=
>## Booting kernel from Legacy Image at 80007fc0 ...<br>=C2=A0=C2=A0 Image =
Name:=C2=A0=C2=A0 Linux-3.14.0-yocto-standard<br>
=C2=A0=C2=A0 Image Type:=C2=A0=C2=A0 ARM Linux Kernel Image (uncompressed)<=
br>=C2=A0=C2=A0 Data Size:=C2=A0=C2=A0=C2=A0 4985304 Bytes =3D 4.8 MiB<br>=
=C2=A0=C2=A0 Load Address: 80008000<br>=C2=A0=C2=A0 Entry Point:=C2=A0 8000=
8000<br>=C2=A0=C2=A0 Verifying Checksum ... OK<br>## Flattened Device Tree =
blob at 80f80000<br>
=C2=A0=C2=A0 Booting using the fdt blob at 0x80f80000<br>=C2=A0=C2=A0 XIP K=
ernel Image ... OK<br>OK<br>=C2=A0=C2=A0 Using Device Tree in place at 80f8=
0000, end 80f8a207<br><br>Starting kernel ...<br><br>Booting Linux on physi=
cal CPU 0x0<br>Initializing cgroup subsys cpuset<br>
Initializing cgroup subsys cpu<br>Initializing cgroup subsys cpuacct<br>Lin=
ux version 3.14.0-yocto-standard (panda@pandabook) (gcc version 4.8.2 (GCC)=
 ) #1 PREEMPT Fri Jun 27 15:16:56 EEST 2014<br>CPU: ARMv7 Processor [413fc0=
82] revision 2 (ARMv7), cr=3D10c53c7d<br>
CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache<br=
>Machine model: TI AM335x BeagleBone<br>cma: CMA: reserved 16 MiB at 9e8000=
00<br>Memory policy: Data cache writeback<br>CPU: All CPU(s) started in SVC=
 mode.<br>
AM335X ES2.1 (sgx neon )<br>Built 1 zonelists in Zone order, mobility group=
ing on.=C2=A0 Total pages: 129792<br>Kernel command line: console=3DttyO0,1=
15200n8 root=3D/dev/mmcblk0p2 ro rootfstype=3Dext4 rootwait<br>PID hash tab=
le entries: 2048 (order: 1, 8192 bytes)<br>
Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)<br>Inode-ca=
che hash table entries: 32768 (order: 5, 131072 bytes)<br>allocated 1048576=
 bytes of page_cgroup<br>please try &#39;cgroup_disable=3Dmemory&#39; optio=
n if you don&#39;t want memory cgroups<br>
Memory: 489448K/523264K available (7491K kernel code, 520K rwdata, 2444K ro=
data, 488K init, 757K bss, 33816K reserved, 0K highmem)<br>Virtual kernel m=
emory layout:<br>=C2=A0=C2=A0=C2=A0 vector=C2=A0 : 0xffff0000 - 0xffff1000=
=C2=A0=C2=A0 (=C2=A0=C2=A0 4 kB)<br>=C2=A0=C2=A0=C2=A0 fixmap=C2=A0 : 0xfff=
00000 - 0xfffe0000=C2=A0=C2=A0 ( 896 kB)<br>
=C2=A0=C2=A0=C2=A0 vmalloc : 0xe0800000 - 0xff000000=C2=A0=C2=A0 ( 488 MB)<=
br>=C2=A0=C2=A0=C2=A0 lowmem=C2=A0 : 0xc0000000 - 0xe0000000=C2=A0=C2=A0 ( =
512 MB)<br>=C2=A0=C2=A0=C2=A0 pkmap=C2=A0=C2=A0 : 0xbfe00000 - 0xc0000000=
=C2=A0=C2=A0 (=C2=A0=C2=A0 2 MB)<br>=C2=A0=C2=A0=C2=A0 modules : 0xbf000000=
 - 0xbfe00000=C2=A0=C2=A0 (=C2=A0 14 MB)<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
.text : 0xc0008000 - 0xc09bc044=C2=A0=C2=A0 (9937 kB)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .init : 0xc09bd000 - 0xc0a37034=C2=A0=C2=A0 =
( 489 kB)<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .data : 0xc0a38000 - 0xc0aba0d4=
=C2=A0=C2=A0 ( 521 kB)<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .bss : 0xc0a=
ba0d4 - 0xc0b77678=C2=A0=C2=A0 ( 758 kB)<br>SLUB: HWalign=3D64, Order=3D0-3=
, MinObjects=3D0, CPUs=3D1, Nodes=3D1<br>
Preemptible hierarchical RCU implementation.<br>NR_IRQS:16 nr_irqs:16 16<br=
>IRQ: Found an INTC at 0xfa200000 (revision 5.0) with 128 interrupts<br>Tot=
al of 128 interrupts on 1 active controller<br>OMAP clockevent source: time=
r2 at 24000000 Hz<br>
sched_clock: 32 bits at 24MHz, resolution 41ns, wraps every 178956969942ns<=
br>OMAP clocksource: timer1 at 24000000 Hz<br>Console: colour dummy device =
80x30<br>Calibrating delay loop... 548.86 BogoMIPS (lpj=3D2744320)<br>pid_m=
ax: default: 32768 minimum: 301<br>
Security Framework initialized<br>Mount-cache hash table entries: 1024 (ord=
er: 0, 4096 bytes)<br>Mountpoint-cache hash table entries: 1024 (order: 0, =
4096 bytes)<br>Initializing cgroup subsys debug<br>Initializing cgroup subs=
ys memory<br>
Initializing cgroup subsys devices<br>Initializing cgroup subsys freezer<br=
>Initializing cgroup subsys net_cls<br>Initializing cgroup subsys blkio<br>=
CPU: Testing write buffer coherency: ok<br>ftrace: allocating 25107 entries=
 in 74 pages<br>
Setting up static identity map for 0x806c4000 - 0x806c4058<br>devtmpfs: ini=
tialized<br>VFP support v0.3: implementor 41 architecture 3 part 30 variant=
 c rev 3<br>omap_hwmod: tptc0 using broken dt data from edma<br>omap_hwmod:=
 tptc1 using broken dt data from edma<br>
omap_hwmod: tptc2 using broken dt data from edma<br>omap_hwmod: debugss: _w=
ait_target_disable failed<br>xor: measuring software checksum speed<br>=C2=
=A0=C2=A0 arm4regs=C2=A0 :=C2=A0=C2=A0 685.200 MB/sec<br>=C2=A0=C2=A0 8regs=
=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 504.800 MB/sec<br>=C2=A0=C2=A0 32reg=
s=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 658.800 MB/sec<br>
xor: using function: arm4regs (685.200 MB/sec)<br>pinctrl core: initialized=
 pinctrl subsystem<br>regulator-dummy: no parameters<br>NET: Registered pro=
tocol family 16<br>DMA: preallocated 256 KiB pool for atomic coherent alloc=
ations<br>
cpuidle: using governor ladder<br>cpuidle: using governor menu<br>platform =
49000000.edma: alias fck already exists<br>platform 49000000.edma: alias fc=
k already exists<br>platform 49000000.edma: alias fck already exists<br>
OMAP GPIO hardware version 0.1<br>hw-breakpoint: debug architecture 0x4 uns=
upported.<br>bio: create slab &lt;bio-0&gt; at 0<br>raid6: int32x1=C2=A0=C2=
=A0=C2=A0=C2=A0 89 MB/s<br>raid6: int32x2=C2=A0=C2=A0=C2=A0 107 MB/s<br>rai=
d6: int32x4=C2=A0=C2=A0=C2=A0=C2=A0 90 MB/s<br>raid6: int32x8=C2=A0=C2=A0=
=C2=A0=C2=A0 92 MB/s<br>
raid6: using algorithm int32x2 (107 MB/s)<br>raid6: using intx1 recovery al=
gorithm<br>edma-dma-engine edma-dma-engine.0: TI EDMA DMA engine driver<br>=
vmmcsd_fixed: 3300 mV <br>SCSI subsystem initialized<br>usbcore: registered=
 new interface driver usbfs<br>
usbcore: registered new interface driver hub<br>usbcore: registered new dev=
ice driver usb<br>omap_i2c 44e0b000.i2c: could not find pctldev for node /p=
inmux@44e10800/pinmux_i2c0_pins, deferring probe<br>platform 44e0b000.i2c: =
Driver omap_i2c requests probe deferral<br>
cfg80211: Calling CRDA to update world regulatory domain<br>Switched to clo=
cksource timer1<br>NET: Registered protocol family 2<br>TCP established has=
h table entries: 4096 (order: 2, 16384 bytes)<br>TCP bind hash table entrie=
s: 4096 (order: 2, 16384 bytes)<br>
TCP: Hash tables configured (established 4096 bind 4096)<br>TCP: reno regis=
tered<br>UDP hash table entries: 256 (order: 0, 4096 bytes)<br>UDP-Lite has=
h table entries: 256 (order: 0, 4096 bytes)<br>NET: Registered protocol fam=
ily 1<br>
RPC: Registered named UNIX socket transport module.<br>RPC: Registered udp =
transport module.<br>RPC: Registered tcp transport module.<br>RPC: Register=
ed tcp NFSv4.1 backchannel transport module.<br>hw perfevents: enabled with=
 ARMv7 Cortex-A8 PMU driver, 5 counters available<br>
futex hash table entries: 256 (order: -1, 3072 bytes)<br>NFS: Registering t=
he id_resolver key type<br>Key type id_resolver registered<br>Key type id_l=
egacy registered<br>msgmni has been set to 987<br>Block layer SCSI generic =
(bsg) driver version 0.4 loaded (major 252)<br>
io scheduler noop registered<br>io scheduler deadline registered<br>io sche=
duler cfq registered (default)<br>pinctrl-single 44e10800.pinmux: 142 pins =
at pa f9e10800 size 568<br>omap_uart 44e09000.serial: no wakeirq for uart0<=
br>
44e09000.serial: ttyO0 at MMIO 0x44e09000 (irq =3D 88, base_baud =3D 300000=
0) is a OMAP UART0<br>console [ttyO0] enabled<br>[drm] Initialized drm 1.1.=
0 20060810<br>brd: module loaded<br>mtdoops: mtd device (mtddev=3Dname/numb=
er) must be supplied<br>
usbcore: registered new interface driver kaweth<br>pegasus: v0.9.3 (2013/04=
/25), Pegasus/Pegasus II USB Ethernet driver<br>usbcore: registered new int=
erface driver pegasus<br>usbcore: registered new interface driver rtl8150<b=
r>
usbcore: registered new interface driver asix<br>usbcore: registered new in=
terface driver ax88179_178a<br>usbcore: registered new interface driver cdc=
_ether<br>usbcore: registered new interface driver dm9601<br>usbcore: regis=
tered new interface driver smsc75xx<br>
usbcore: registered new interface driver smsc95xx<br>usbcore: registered ne=
w interface driver net1080<br>usbcore: registered new interface driver cdc_=
subset<br>usbcore: registered new interface driver zaurus<br>usbcore: regis=
tered new interface driver MOSCHIP usb-ethernet driver<br>
usbcore: registered new interface driver int51x1<br>usbcore: registered new=
 interface driver cdc_ncm<br>ehci_hcd: USB 2.0 &#39;Enhanced&#39; Host Cont=
roller (EHCI) Driver<br>ehci-omap: OMAP-EHCI Host Controller driver<br>
usbcore: registered new interface driver usb-storage<br>mousedev: PS/2 mous=
e device common for all mice<br>omap_rtc 44e3e000.rtc: rtc core: registered=
 44e3e000.rtc as rtc0<br>i2c /dev entries driver<br>omap_wdt: OMAP Watchdog=
 Timer Rev 0x01: initial timeout 60 sec<br>
48060000.mmc supply vmmc_aux not found, using dummy regulator<br>481d8000.m=
mc supply vmmc_aux not found, using dummy regulator<br>usbcore: registered =
new interface driver usbhid<br>usbhid: USB HID core driver<br>oprofile: usi=
ng arm/armv7<br>
u32 classifier<br>=C2=A0=C2=A0=C2=A0 Actions configured<br>TCP: cubic regis=
tered<br>NET: Registered protocol family 10<br>sit: IPv6 over IPv4 tunnelin=
g driver<br>NET: Registered protocol family 17<br>mmc0: host does not suppo=
rt reading read-only switch. assuming write-enable.<br>
Key type dns_resolver registered<br>ThumbEE CPU extension supported.<br>mmc=
0: new high speed SDHC card at address 0001<br>bio: create slab &lt;bio-1&g=
t; at 1<br>mmcblk0: mmc0:0001 ASTC 7.38 GiB <br>=C2=A0mmcblk0: p1 p2<br>Btr=
fs loaded<br>
regulator-dummy: disabling<br>slave hdmi.6: could not get i2c<br>platform h=
dmi.6: Driver slave requests probe deferral<br>platform 4830e000.lcdc: Driv=
er tilcdc requests probe deferral<br>DCDC1: at 1500 mV <br>vdd_mpu: 925 &lt=
;--&gt; 1325 mV at 1100 mV <br>
vdd_core: 925 &lt;--&gt; 1150 mV at 1100 mV <br>LDO1: at 1800 mV <br>LDO2: =
at 3300 mV <br>LDO3: 1800 mV <br>LDO4: at 3300 mV <br>tps65217 0-0024: TPS6=
5217 ID 0xe version 1.2<br>omap_i2c 44e0b000.i2c: bus 0 rev0.11 at 400 kHz<=
br>
mmc1: BKOPS_EN bit is not set<br>mmc1: new high speed MMC card at address 0=
001<br>mmcblk1: mmc1:0001 MMC02G 1.78 GiB <br>mmcblk1boot0: mmc1:0001 MMC02=
G partition 1 1.00 MiB<br>mmcblk1boot1: mmc1:0001 MMC02G partition 2 1.00 M=
iB<br>
=C2=A0mmcblk1: p1 p2<br>=C2=A0mmcblk1boot1: unknown partition table<br>=C2=
=A0mmcblk1boot0: unknown partition table<br>tilcdc 4830e000.lcdc: found TDA=
19988<br>[drm] Supports vblank timestamp caching Rev 2 (21.10.2013).<br>[dr=
m] No driver support for vblank timestamp query.<br>
tilcdc 4830e000.lcdc: No connectors reported connected with modes<br>[drm] =
Cannot find any crtc or sizes - going 1024x768<br>Console: switching to col=
our frame buffer device 128x48<br>tilcdc 4830e000.lcdc: fb0:=C2=A0 frame bu=
ffer device<br>
tilcdc 4830e000.lcdc: registered panic notifier<br>[drm] Initialized tilcdc=
 1.0.0 20121205 on minor 0<br>console [netcon0] enabled<br>netconsole: netw=
ork logging started<br>davinci_mdio 4a101000.mdio: davinci mdio revision 1.=
6<br>
davinci_mdio 4a101000.mdio: detected phy mask fffffffe<br>libphy: 4a101000.=
mdio: probed<br>davinci_mdio 4a101000.mdio: phy[0]: device 4a101000.mdio:00=
, driver SMSC LAN8710/LAN8720<br>Detected MACID =3D 1c:ba:8c:f1:ec:e4<br>
omap_rtc 44e3e000.rtc: setting system clock to 2000-01-01 00:00:00 UTC (946=
684800)<br>EXT4-fs (mmcblk0p2): mounted filesystem without journal. Opts: (=
null)<br>VFS: Mounted root (ext4 filesystem) readonly on device 179:2.<br>
devtmpfs: mounted<br>Freeing unused kernel memory: 488K (c09bd000 - c0a3700=
0)<br>INIT: version 2.88 booting<br>Starting udev<br>udevd[82]: starting ve=
rsion 182<br>EXT4-fs (mmcblk0p2): warning: mounting unchecked fs, running e=
2fsck is recommended<br>
EXT4-fs (mmcblk0p2): re-mounted. Opts: (null)<br>Starting Bootlog daemon: b=
ootlogd.<br>random: dd urandom read with 128 bits of entropy available<br>r=
andom: nonblocking pool is initialized<br>Mon Jun 30 07:45:00 UTC 2014<br>
INIT: Entering runlevel: 5<br>Configuring network interfaces... net eth0: i=
nitializing cpsw version 1.12 (0)<br>net eth0: phy found : id is : 0x7c0f1<=
br>libphy: PHY 4a101000.mdio:01 not found<br>net eth0: phy 4a101000.mdio:01=
 not found on slave 1<br>
IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready<br>udhcpc (v1.22.1) star=
ted<br>Sending discover...<br>libphy: 4a101000.mdio:00 - Link is Up - 100/F=
ull<br>IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready<br>Sending d=
iscover...<br>
Sending select for 192.168.50.1<br>Lease of 192.168.50.18 obtained, lease t=
ime 691200<br>/etc/udhcpc.d/50default: Adding DNS 192.168.50.1<br>/etc/udhc=
pc.d/50default: Adding DNS 192.168.50.1<br>done.<br>Starting OpenBSD Secure=
 Shell server: sshd<br>
done.<br>Starting syslogd/klogd: done<br>Stopping Bootlog daemon: bootlogd.=
<br><br>Poky (Yocto Project Reference Distro) 1.6.1 beaglebone /dev/ttyO0<b=
r><br></div>I run this command <br><br>root@beaglebone:~# cape-stop.sh <br>
hexdump: /sys/bus/i2c/devices/3-005*/eeprom: No such file or directory<br>u=
nknown cape: <br><br><div><br></div></div><div class=3D"gmail_extra"><br><b=
r><div class=3D"gmail_quote">2014-06-30 11:15 GMT+03:00 Anders Darander <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:anders@chargestorm.se" target=3D"_blan=
k">anders@chargestorm.se</a>&gt;</span>:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">* Robert Yang &lt;<a href=3D"mailto:liezhi.y=
ang@windriver.com">liezhi.yang@windriver.com</a>&gt; [140630 05:47]:<br>
<div><div class=3D"h5"><br>
<br>
&gt; On 06/30/2014 12:24 AM, Life Life wrote:<br>
&gt; &gt; Hello,<br>
<br>
&gt; &gt; I&#39;m trying build yocto based linux, My hardware is beaglebone=
 black I<br>
&gt; &gt; successfull build system image. But I can&#39;t see capemanager. =
Beacuse my lcd is<br>
&gt; &gt; not work.<br>
<br>
&gt; Hello,<br>
<br>
&gt; The cape manager is in meta-ti layer:<br>
<br>
&gt; <a href=3D"http://layers.openembedded.org/layerindex/branch/master/lay=
er/meta-ti/" target=3D"_blank">http://layers.openembedded.org/layerindex/br=
anch/master/layer/meta-ti/</a><br>
<br>
&gt; Seems that we&#39;d better add it to meta-yoco-bsp ?<br>
<br>
</div></div>Unless something has changed since I last looked at this, I don=
&#39;t think<br>
so.<br>
<br>
If I remember correctly, capemgr basically consists of a number of<br>
patches not in the mainline kernel (and also not in TI&#39;s staging<br>
kernel). I haven&#39;t checked it, by I doubt that we have them in the<br>
linux-yocto kernel. (Especially as the last time I checked it, you had<br>
to revert to a 3.8 (if I rember correctly, it might have been an even<br>
earlier kernel) kernel to get full capemgr support.<br>
<br>
If this has changed, then it&#39;d be interesting to know!<br>
<br>
Cheers,<br>
Anders<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; Add Saul in the loop.<br>
<br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
Anders Darander<br>
ChargeStorm AB / eStorm AB<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br></div>

--047d7b3a8ae6ccc70d04fd098f51--
