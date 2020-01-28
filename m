Return-Path: <jupiter.hce@gmail.com>
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
	[209.85.166.170])
	by mail.openembedded.org (Postfix) with ESMTP id A770A7FDFF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 10:55:59 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id f5so10256060ilq.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 02:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=pLGkLSge+gcGB6wUKL7dxTDOvEwf/MXmG4DVbkadZzk=;
	b=hC2hs1L5PZFjB3Ipkvw7ep34ulUG/RBkEh8yOX0BwPHIS+844aSco2wwfn04OSow8K
	Xm/SFQYfXRHMMoggtfCe26uZd1GxfjozXWC9QagHdtoi9ALbkaxkGm6VE3GJdUjGFEHf
	tB8+ZMzENp7krXCXNAoyuANWfCWDyeTt3g8MvOxCaA286nlZ1gQRbN3RvWxVwq8wtA7o
	RoeqhHISCSLF2ArJeCrfgJMBlxQ4yXDCw6vMrLI3KL4viyGXLbqXcguMO3UuLgun7CHA
	luP+aH8cpZec38pNJ49E/t7YL/gaO7AdSFqzpyRFnDrlEeKhQXUKHmXDRqWhlYFhWeG7
	8UdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=pLGkLSge+gcGB6wUKL7dxTDOvEwf/MXmG4DVbkadZzk=;
	b=pOty/dXgKUbgfSWajZ1fS7MQheo74GGKdfFhEFWeUy/vUa/GdgJGmlzsQRLHgx2xAi
	0prPIPOQqtWjzZbm0Z7oAT9KbxxTqIBB0iuckAM1Ru7Qp3AsoNGAK675nSsCEgp9iuDH
	kz1J8hTa09ySdVx1hGXGfTgrKLNfla/EvcWj6fi/mh7Z4ptl5hTqLvLJ57XhRqSUdQd/
	2R8LXuwSIxcOcwCwDiUseH5YrzfdmLVtoAduqPj2w9nRCJxygdQZyDNCK/zHFr2XnNAt
	iPvjIxZZhSkPGaU5cfA5t3cyDOgnGDqRyPHCjUTvGHkqTzqZ1HqoxgYnJPqpDBBlz5GR
	/cuA==
X-Gm-Message-State: APjAAAWP373QUE97DNFLsQuXSMLxM5WAhHwzOhefBgzmzDE7E2VsFJlq
	XWul1FlthFVH9Ct4Q3IvuDNnPnjvFY43nuL0MzpunJIXTCg=
X-Google-Smtp-Source: APXvYqz/My7u2mMHVceNu7QXY54FQX/kst7TV2m3LbCSghb8GVZDZOTB+3Bw7S9yoMm7k5tV9bpYp9ItGCUu3EW63pI=
X-Received: by 2002:a92:d7c1:: with SMTP id g1mr20035266ilq.192.1580208960385; 
	Tue, 28 Jan 2020 02:56:00 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP; Tue, 28 Jan 2020 02:56:00
	-0800 (PST)
In-Reply-To: <CAA=hcWS5w_QTmUMZBBMpj-H+iyBcqc=6h3RoZwdpVYU7gpyaMw@mail.gmail.com>
References: <CAA=hcWS5w_QTmUMZBBMpj-H+iyBcqc=6h3RoZwdpVYU7gpyaMw@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Tue, 28 Jan 2020 21:56:00 +1100
Message-ID: <CAA=hcWQNSmRKEeu=YxGAMMSNFAmKff6t4AOdcX2MUtcVSz9BKw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: Could oe-core be infected by virus?
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
X-List-Received-Date: Tue, 28 Jan 2020 10:55:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I don't have Bluetooth, I don't need RPC, etc., yet the kernel
initialized all those processes I have never defined and I don't need.
Where those things defined to let the kernel to initialize them in
boot process?

It is a small resource device, how can I get rid of those things I
don't need? As I said, in older version of image, I have never seen
those things, where are coming from?

Thank you.

Kind regards,

- jh



On 1/21/20, JH <jupiter.hce@gmail.com> wrote:
> Hi,
>
> I have been using thud version to build imx6 image for about a year,
> it was all good until my last image built at Mon Dec 23 2019.
>
> The image was booted fine in the first and second times, then in the
> third time, it broken, the boot could not be completed. The wired
> thing was that image injected so many new messages, including "Welcome
> to OpenEmbedded nodistro.0!" I have never seen in previous built image
> boot. Here are new messages in booting, which were never seen in good
> normal image booting:
>
> ..................
>
> [    0.440012] No ATAGs?
> [    0.440595] hw-breakpoint: found 5 (+1 reserved) breakpoint and 4
> watchpoint.
> [    0.448156] hw-breakpoint: maximum watchpoint size is 8 bytes.
> [    0.466328] imx6ul-pinctrl 20e0000.iomuxc: initialized IMX pinctrl
> driver
> [    0.472450] imx6ul-pinctrl 2290000.iomuxc-snvs: no groups defined in
> /soc/ai0
> [    0.480569] imx6ul-pinctrl 2290000.iomuxc-snvs: initialized IMX pinctr=
l
> drivr
> [    0.651365] mxs-dma 1804000.dma-apbh: initialized
> [    0.664997] vgaarb: loaded
>
>
> [    0.689977] media: Linux media interface: v0.10
> [    0.692021] videodev: Linux video capture interface: v2.00
>
> [    0.717522] Advanced Linux Sound Architecture Driver Initialized.
>
> [    0.727570] Bluetooth: Core ver 2.22
>
> [    0.727570] Bluetooth: Core ver 2.22
> [    0.728643] NET: Registered protocol family 31
>
> [    0.733019] Bluetooth: HCI device and connection manager initialized
> [    0.739321] Bluetooth: HCI socket layer initialized
> [    0.744236] Bluetooth: L2CAP socket layer initialized
> [    0.749512] Bluetooth: SCO socket layer initialized
>
> [    1.562280] RPC: Registered named UNIX socket transport module.
> [    1.565491] RPC: Registered udp transport module.
> [    1.570421] RPC: Registered tcp transport module.
> [    1.574864] RPC: Registered tcp NFSv4.1 backchannel transport module.
>
> [    1.600637] Initialise system trusted keyrings
>
> [    1.603975] workingset: timestamp_bits=3D30 max_order=3D16 bucket_orde=
r=3D0
> [    1.659645] NFS: Registering the id_resolver key type
> [    1.662137] Key type id_resolver registered
> [    1.666121] Key type id_legacy registered
>
> [    1.670929] jffs2: version 2.2. (NAND) =EF=BF=BD=E0=BF=A9 2001-2006 Re=
d Hat, Inc.
> [    1.727050] Key type asymmetric registered
> [    1.728573] Asymmetric key parser 'x509' registered
>
> [    1.971780] brd: module loaded
>
> [    3.594532] Bluetooth: HCI UART driver ver 2.3
> [    3.599353] Bluetooth: HCI UART protocol H4 registered
> [    3.605805] Bluetooth: HCI UART protocol LL registered
>
> [    3.849843] can: controller area network core (rev 20170425 abi 9)
> [    3.856714] NET: Registered protocol family 29
> [    3.861547] can: raw protocol (rev 20170425)
> [    3.866187] can: broadcast manager protocol (rev 20170425 t)
> [    3.873206] can: netlink gateway (rev 20170425) max_hops=3D1
>
> [    4.057226] ubi0: default fastmap pool size: 70
> [    4.062139] ubi0: default fastmap WL pool size: 35
>
> [    5.718715] snvs_rtc 20cc000.snvs:snvs-rtc-lp: setting system clock to
> 1970-)
> [    5.728375] cfg80211: Loading compiled-in X.509 certificates for
> regulatory e
> [    5.744952] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
> [    5.754131] ALSA device list:
> [    5.757168]   No soundcards found.
> [    5.761914] platform regulatory.0: Direct firmware load for regulatory=
.db
> fa2
> [    5.770856] cfg80211: failed to load regulatory.db
> [    5.826418] random: crng init done
>
> [    5.872444] UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, nam=
e
> "rooe
> [    5.881562] UBIFS (ubi0:0): LEB size: 126976 byteinfections (124
> KiB), min./max. I/O s
> [    5.891639] UBIFS (ubi0:0): FS size: 166338560 bytes (158 MiB, 1310
> LEBs), j)
> [    5.902467] UBIFS (ubi0:0): reserved for root: 4952683 bytes (4836 KiB=
)
> [    5.909215] UBIFS (ubi0:0): media format: w4/r0 (latest is w5/r0), UUI=
D
> 1DCCl
> [    5.925837] VFS: Mounted root (ubifs filesystem) readonly on device
> 0:13.
>
> Welcome to OpenEmbedded nodistro.0!
>
> [    6.948506] systemd[1]: Set hostname to <solar>.
> [    7.845072] systemd[1]: File
> /lib/systemd/system/systemd-journald.service:36.
> [    7.862906] systemd[1]: Proceeding WITHOUT firewalling in effect! (Thi=
s
> warn)
> [    8.565419] systemd[1]: Started Forward Password Requests to Wall
> Directory .
> [  OK  ] Started Forward Password Requests to Wall Directory Watch.
> [    8.627954] systemd[1]: Listening on Journal Socket (/dev/log).
> [  OK  ] Listening on Journal Socket (/dev/log).
> [    8.685831] systemd[1]: Listening on udev Kernel Socket.
> [  OK  ] Listening on udev Kernel Socket.
> [    8.732943] systemd[1]: Reached target Swap.
> [  OK  ] Reached target Swap.
> [    8.789883] systemd[1]: Created slice system-getty.slice.
> [  OK  ] Created slice system-getty.slice.
> [  OK  ] Reached target Remote File Systems.
> [  OK  ] Started Dispatch Password Requests to Console Directory Watch.
> [  OK  ] Reached target Host and Network Name Lookups.
> [  OK  ] Listening on Journal Socket.infection
>          Starting Journal Service...
>          Mounting Kernel Debug File System...
>          Mounting Temporary Directory (/tmp)...
> [    9.148665] systemd[80]: tmp.mount: Failed to execute command: No such
> file y
> [    9.159411] systemd[79]: sys-kernel-debug.mount: Failed to execute
> command: y
>          Starting File System Check on Root Device...
> [  OK  ] Listening on initctl Compatibility Named Pipe.
> [  OK  ] Listening on udev Control Socket.
>          Starting udev Coldplug all Devices...
> [    9.315009] systemd[82]: systemd-udev-trigger.service: Failed to execu=
te
> comy
>          Starting Apply Kernel Variables...
> [  OK  ] Created slice system-serial\x2dgetty.slice.infection
> [  OK  ] Listening on Network Service Netlink Socket.
> [  OK  ] Created slice User and Session Slice.
> [  OK  ] Reached target Slices.
>          Mounting FUSE Control File System...
> [  OK  ] Reached target Paths.
> [    9.567040] systemd[84]: sys-fs-fuse-connections.mount: Failed to exec=
ute
> coy
> [FAILED] Failed to mount Kernel Debug File System.
> See 'systemctl status sys-kernel-debug.mount' for details.
> [FAILED] Failed to mount Temporary Directory (/tmp).
> See 'systemctl status tmp.mount' for details.
> [DEPEND] Dependency failed for Network Time Synchronization.U-Boot
> 2018.03-g00dfdc2130-dirty (Oct 14 2019 - 05:41:17 +0000)infection
>
> CPU:   Freescale i.MX6ULZ rev1.1 900 MHz (running at 396 MHz)
> CPU:   Commercial temperature grade (0C to 95C) at 36C
> Reset cause: POR
> Model: Freescale i.MX6 ULZ 14x14 EVK Board
> Board: MX6ULZ 14x14 EVK
>
> [DEPEND] Dependency failed for Network Service.
> [  OK  ] Started Journal Service.
> [  OK  ] Started File System Check on Root Device.
> [FAILED] Failed to start udev Coldplug all Devices.
> See 'systemctl status systemd-udev-trigger.service' for details.
> [  OK  ] Started Apply Kernel Variables.
> [FAILED] Failed to mount FUSE Control File System.
> See 'systemctl status sys-fs-fuse-connections.mountinfection' for details=
.
> [  OK  ] Reached target System Time Synchronized.
>          Starting Remount Root and Kernel File Systems...
> [FAILED] Failed to start Remount Root and Kernel File Systems.
> See 'systemctl status systemd-remount-fs.service' for details.
>          Starting Flush Journal to Persistent Storage...
>          Starting Create Static Device Nodes in /dev...
> [FAILED] Failed to start Flush Journal to Persistent Storage.
> See 'systemctl status systemd-journal-flush.service' for details.
> [FAILED] Failed to start Create Static Device Nodes in /dev.
> See 'systemctl status systemd-tmpfiles-setup-dev.service' for details.
>          Starting udev Kernel Device Manager...
> [  OK  ] Reached target Local File Systems (Pre).
>          Mounting /var/volatile...
> [  OK  ] Reached target Containers.
> [FAILED] Failed to mount /var/volatile.
> See 'systemctl status var-volatile.mount' for details.
> [DEPEND] Dependency failed for Bind mount volatile /srv.
> [DEPEND] Dependency failed for Bind mount volatile /var/spool.
> [DEPEND] Dependency failed for Local File Systems.
> [DEPEND] Dependency failed for Bind mount volatile /var/lib.
> [DEPEND] Dependency failed for Bind mount volatile /var/cache.
> [  OK  ] Reached target Network.
> [  OK  ] Reached target Login Prompts.
> [  OK  ] Reached target Sockets.infection
> [  OK  ] Reached target Timers.
>          Starting Create Volatile Files and Directories...
>          Starting Load/Save Random Seed...
> [  OK  ] Started Emergency Shell.
> [  OK  ] Reached target Emergency Mode.
> [  OK  ] Started udev Kernel Device Manager.
> [FAILED] Failed to start Create Volatile Files and Directories.
> See 'systemctl status systemd-tmpfiles-setup.service' for details.
> [  OK  ] Started Load/Save Random Seed.
>          Starting Update UTMP about System Boot/Shutdown...
> [  OK  ] Started Update UTMP about System Boot/Shutdown.
>          Starting Update UTMP about System Runlevelinfection Changes...
> [  OK  ] Started Update UTMP about System Runlevel Changes.
> You are in emergency mode. After logging in, type "journalctl -xb" to vie=
w
> system logs, "systemctl reboot" to reboot, "systemctl default" or "exit"
> to boot into default mode.
> Press Enter for maintenance
> (or press Control-D to continue):
>
> It looks like some kind of virus infected in a desktop system, but I
> have never seen in an embedded system. Could anyone kindly explain
> what was going on there?
>
> Thank you.
>
> Kind regards,
>
> - jh
>

