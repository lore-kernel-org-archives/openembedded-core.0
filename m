Return-Path: <jdmason@kudzu.us>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8BA4A7C8B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 21:03:15 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id z131so611924itf.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 13:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=5q42+hhHic9bZK0ygRT+ghL/GnDYZplVuzU+BO0OkeY=;
	b=Sn1Ub+1pg+1Bml5gLoYq8+nld6hqygALBY07zvvR3XUyD3KaUTLfqs6y3W1um5uLWw
	DA65Qy2CGPSaHfrnuC5aiXA1Z5bl0ASMKqYEHSYEpRtGtI4zsojOKvafnqJGShizo+mC
	nMtoXOvZqCIKxUGZcbarBguh28pa9p/AnuRNzXGdZMGGtYZF6ryYrOG0gtfr5h2ukh62
	oVPuRMoFhjDYB2PeonhVJh/P9uCLQdMgCugiv8zSrhZSjgkBImQMI/InwBNHhvToDmVE
	XQE4WltJJTmr7jRO7KQb9+zYPKPDb4C3rsE4umsK9a81S2A0xqYynzOFvILEvjXaJ5by
	sTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=5q42+hhHic9bZK0ygRT+ghL/GnDYZplVuzU+BO0OkeY=;
	b=C6hoWJPc/GrnN2KwK6XolF7+SVZq9zAENGCwMC532K2kSj5q3HJd7ARnOgLiUcTK5H
	UlU3x2mKS0f4j2av4Hl+TpHEbwSuehQ5vJodSNKejmBtF3oa9KWaSfD0cXz04WQ1v2oO
	P9DOlpyqXSuAfYxR9YlkXpBxJTbiUehHSCYRxVxXHkoILnlC+O/EG1T5IXlNo6hOZOzf
	0V9CZ3jwEEMm7F+JC6bWY6SV+v3DlMi41hd1wmdYqxrZfOsaNajoG0PG9rbpANHMx+cc
	WrG5I/RMlugTPnZ4KzVOa/mNgR11MiudSKJmml9N0+wentQb5d5iT+P74sLoXdipHl69
	wwsQ==
X-Gm-Message-State: AHQUAub5lK2uZW2uCzFK4bIWoQ1FpGunv6fxepHEegkLlp/EA4f6j9bX
	9c5umnW66Ue/oEUswh47ekILW9alC9QeV6B4jZAlRMqUye58yA==
X-Google-Smtp-Source: AHgI3Ia7AHnPIQKUelTHNL6fZ4llm4i5bvpreumcw0icslGPhZ2pc5VZq4NJHG9olcjUSdT4LE6dsxt4sMMJ/jD3R6E=
X-Received: by 2002:a02:5184:: with SMTP id s126mr10385915jaa.12.1551128595940;
	Mon, 25 Feb 2019 13:03:15 -0800 (PST)
MIME-Version: 1.0
From: Jon Mason <jdmason@kudzu.us>
Date: Mon, 25 Feb 2019 16:03:05 -0500
Message-ID: <CAPoiz9ydVmuh_QKHCvywy26VYubR4TDGWtCHe0Hrjcb=1HD=Hw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Xorg issue on qemuarma15
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
X-List-Received-Date: Mon, 25 Feb 2019 21:03:15 -0000
Content-Type: text/plain; charset="UTF-8"

I'm having a problem trying to get Xorg up and running on the
qemuarma15 (from the series
http://lists.openembedded.org/pipermail/openembedded-core/2019-January/278190.html).
I've applied a patch on top of these to get framebuffer added by
default to the kernel config and changes in the default recipe.

I can visually verify that the frame buffer is working by the "tuxes"
that appear during the kernel boot, as well as the presence of
/dev/fb0
However, when X should take over, it logs an error to the screen:

(EE) AddScreen/ScreenInit failed for driver 0



My knowledge of Xorg is very limited.  So, I'm hoping someone can
provide some insight as to what is going on.  The log file output is
below:


# cat /var/log/Xorg.0.log
[    12.742]
X.Org X Server 1.20.3
X Protocol Version 11, Revision 0
[    12.747] Build Operating System: Linux 4.19.8-200.fc28.x86_64 x86_64
[    12.748] Current Operating System: Linux qemuarm
4.19.14-yocto-standard #1 SMP PREEMPT Fri Jan 25 20:16:06 UTC 2019
armv7l
[    12.748] Kernel command line: root=/dev/vda rw highres=off
mem=512M ip=192.168.7.2::192.168.7.1:255.255.255.0 console=ttyAMA0
console=tty1
[    12.749] Build Date: 25 January 2019  08:56:06PM
[    12.749]
[    12.749] Current version of pixman: 0.34.0
[    12.749]     Before reporting problems, check http://wiki.x.org
    to make sure that you have the latest version.
[    12.749] Markers: (--) probed, (**) from config file, (==) default setting,
    (++) from command line, (!!) notice, (II) informational,
    (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[    12.751] (==) Log file: "/var/log/Xorg.0.log", Time: Mon Feb 25
20:54:20 2019
[    12.766] (==) Using config file: "/etc/X11/xorg.conf"
[    12.771] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[    12.785] (==) ServerLayout "Default Layout"
[    12.785] (**) |-->Screen "Default Screen" (0)
[    12.785] (**) |   |-->Monitor "Generic Monitor"
[    12.789] (**) |   |-->Device "Graphics Controller"
[    12.794] (==) Automatically adding devices
[    12.795] (==) Automatically enabling devices
[    12.796] (==) Automatically adding GPU devices
[    12.799] (==) Max clients allowed: 256, resource mask: 0x1fffff
[    12.821] (WW) The directory "/usr/share/fonts/X11/misc/" does not exist.
[    12.821]     Entry deleted from font path.
[    12.821] (WW) The directory "/usr/share/fonts/X11/TTF/" does not exist.
[    12.821]     Entry deleted from font path.
[    12.821] (WW) The directory "/usr/share/fonts/X11/OTF/" does not exist.
[    12.821]     Entry deleted from font path.
[    12.821] (WW) The directory "/usr/share/fonts/X11/Type1/" does not exist.
[    12.821]     Entry deleted from font path.
[    12.821] (WW) The directory "/usr/share/fonts/X11/100dpi/" does not exist.
[    12.821]     Entry deleted from font path.
[    12.821] (WW) The directory "/usr/share/fonts/X11/75dpi/" does not exist.
[    12.821]     Entry deleted from font path.
[    12.821] (==) FontPath set to:

[    12.821] (==) ModulePath set to "/usr/lib/xorg/modules"
[    12.821] (II) The server relies on udev to provide the list of
input devices.
    If no devices become available, reconfigure udev or disable AutoAddDevices.
[    12.822] (II) Loader magic: 0x590d78
[    12.822] (II) Module ABI versions:
[    12.822]     X.Org ANSI C Emulation: 0.4
[    12.822]     X.Org Video Driver: 24.0
[    12.822]     X.Org XInput driver : 24.1
[    12.822]     X.Org Server Extension : 10.0
[    12.843] (II) xfree86: Adding drm device (/dev/dri/card1)
[    12.846] (II) xfree86: Adding drm device (/dev/dri/card0)
[    12.931] (--) PCI: (0@0:1:0) 1af4:1050:1af4:1100 rev 1, Mem @
0x10000000/4096, 0x00000000/16384
[    12.931] (II) no primary bus or device found
[    12.931]     falling back to
/sys/devices/platform/4010000000.pcie/pci0000:00/0000:00:01.0/virtio2/drm/card1
[    12.932] (II) LoadModule: "glx"
[    12.939] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[    12.995] (II) Module glx: vendor="X.Org Foundation"
[    12.995]     compiled for 1.20.3, module version = 1.0.0
[    12.995]     ABI class: X.Org Server Extension, version 10.0
[    12.996] (II) LoadModule: "fbdev"
[    12.998] (II) Loading /usr/lib/xorg/modules/drivers/fbdev_drv.so
[    13.000] (II) Module fbdev: vendor="X.Org Foundation"
[    13.000]     compiled for 1.20.3, module version = 0.5.0
[    13.000]     Module class: X.Org Video Driver
[    13.000]     ABI class: X.Org Video Driver, version 24.0
[    13.001] (II) FBDEV: driver for framebuffer: fbdev
[    13.001] (--) using VT number 2

[    13.050] (WW) Falling back to old probe method for fbdev
[    13.051] (II) Loading sub module "fbdevhw"
[    13.051] (II) LoadModule: "fbdevhw"
[    13.052] (II) Loading /usr/lib/xorg/modules/libfbdevhw.so
[    13.054] (II) Module fbdevhw: vendor="X.Org Foundation"
[    13.054]     compiled for 1.20.3, module version = 0.0.2
[    13.059]     ABI class: X.Org Video Driver, version 24.0
[    13.067] (II) FBDEV(0): using default device
[    13.070] (==) FBDEV(0): Depth 24, (==) framebuffer bpp 32
[    13.071] (==) FBDEV(0): RGB weight 888
[    13.071] (==) FBDEV(0): Default visual is TrueColor
[    13.071] (==) FBDEV(0): Using gamma correction (1.0, 1.0, 1.0)
[    13.071] (II) FBDEV(0): hardware: virtiodrmfb (video memory: 0kB)
[    13.071] (DB) xf86MergeOutputClassOptions unsupported bus type 0
[    13.071] (II) FBDEV(0): checking modes against framebuffer device...
[    13.072] (EE) FBDEV(0): FBIOPUT_VSCREENINFO: Invalid argument
[    13.072] (II) FBDEV(0):     mode "640x480" test failed
[    13.072] (EE) FBDEV(0): FBIOPUT_VSCREENINFO: Invalid argument
[    13.072] (II) FBDEV(0):     mode "640x480" test failed
[    13.072] (EE) FBDEV(0): FBIOPUT_VSCREENINFO: Invalid argument
[    13.073] (II) FBDEV(0):     mode "640x480" test failed
[    13.073] (EE) FBDEV(0): FBIOPUT_VSCREENINFO: Invalid argument
[    13.073] (II) FBDEV(0):     mode "640x480" test failed
[    13.073] (II) FBDEV(0):     mode "640x480" not found
[    13.073] (II) FBDEV(0): checking modes against monitor...
[    13.073] (II) FBDEV(0): Virtual size is 1024x768 (pitch 1024)
[    13.073] (**) FBDEV(0):  Built-in mode "current"
[    13.073] (==) FBDEV(0): DPI set to (96, 96)
[    13.073] (II) Loading sub module "fb"
[    13.073] (II) LoadModule: "fb"
[    13.074] (II) Loading /usr/lib/xorg/modules/libfb.so
[    13.077] (II) Module fb: vendor="X.Org Foundation"
[    13.077]     compiled for 1.20.3, module version = 1.0.0
[    13.077]     ABI class: X.Org ANSI C Emulation, version 0.4
[    13.077] (**) FBDEV(0): using shadow framebuffer
[    13.077] (II) Loading sub module "shadow"
[    13.077] (II) LoadModule: "shadow"
[    13.078] (II) Loading /usr/lib/xorg/modules/libshadow.so
[    13.080] (II) Module shadow: vendor="X.Org Foundation"
[    13.080]     compiled for 1.20.3, module version = 1.1.0
[    13.080]     ABI class: X.Org ANSI C Emulation, version 0.4
[    13.082] (EE) FBDEV(0): mmap fbmem: Invalid argument
[    13.082] (EE) FBDEV(0): mapping of video memory failed
[    13.082] (EE)
Fatal server error:
[    13.083] (EE) AddScreen/ScreenInit failed for driver 0
[    13.083] (EE)
[    13.083] (EE)
Please consult the The X.Org Foundation support
     at http://wiki.x.org
 for help.
[    13.084] (EE) Please also check the log file at
"/var/log/Xorg.0.log" for additional information.
[    13.084] (EE)
[    13.147] (EE) Server terminated with error (1). Closing log file.




If anyone wants to try to reproduce the issue, I've uploaded the
relevant code to my github account and it can be found at:
https://github.com/jonmason/poky.git
branch dev

https://github.com/jonmason/yocto-kernel-cache.git
branch yocto-4.19


Any help is greatly appreciated.


Thanks,
Jon

