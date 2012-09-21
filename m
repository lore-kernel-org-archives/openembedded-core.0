Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <alexandru.damian@intel.com>) id 1TF0qS-0004Si-Vg
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 12:52:29 +0200
Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 21 Sep 2012 03:38:38 -0700
Received: by qafi29 with SMTP id i29so596029qaf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2012 03:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=FKm0N0jD22HneVpilvCkcw2aoUOm2kL7kaHPbo3RUDs=;
	b=gmAiiARoE4ZpKeeycIdHAQKx+TcTMOXtGQ+lnzLnydybz8LG7Is92pdS1BN2Gzz/2K
	a5fst9PcRWa3na+uaXqw349/CI587UcMwoTLohX9gfM1P9oG8sT5x/rHQcAv8J7DR1zJ
	spr/5n4Yohz49Q3LTQaWdBEb412wIJ6NPZndOkAktBWsqRky2GkD/hxZ5wTyMZlMvKVz
	jLJrwduYFWBppAG0c7qQRmJXRZpApPFihtE0syfEF3BkY+ereDLTaudxoZXcSTUncoQo
	L8iEmWf1gLm7xLGIYjpB0sYvP6x98+eDlNjcCN7vmLMbUfz6dr3AYZXZ6uQTaX5ZgwR0
	gnpw==
MIME-Version: 1.0
Received: by 10.229.137.7 with SMTP id u7mr3048496qct.63.1348223916921; Fri,
	21 Sep 2012 03:38:36 -0700 (PDT)
Received: by 10.49.15.33 with HTTP; Fri, 21 Sep 2012 03:38:36 -0700 (PDT)
In-Reply-To: <CAMKF1so98F5-G44x1QEi0k5X4UE4vJqBe3WEyQC2jBce0eQrYw@mail.gmail.com>
References: <1346923666-8619-1-git-send-email-alexandru.damian@intel.com>
	<504FA4C4.9040005@linux.intel.com>
	<CAMKF1so98F5-G44x1QEi0k5X4UE4vJqBe3WEyQC2jBce0eQrYw@mail.gmail.com>
Date: Fri, 21 Sep 2012 13:38:36 +0300
Message-ID: <CAJ2CSBvcQiHirYRir-3PU-i=rvZNe=9WZxTitGz7O=qXOQc=Sw@mail.gmail.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
To: Khem Raj <raj.khem@gmail.com>
X-Gm-Message-State: ALoCoQluLiow8vCHnHCbqt4B4btpJ8XtjGN3qFk6Do8wh42RALX3i1o6M7WMgqGFwkeKj0q4AsfJ
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] udev: upgrade to 182
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Sep 2012 10:52:29 -0000
Content-Type: multipart/alternative; boundary=002354790f74a5522904ca33d723

--002354790f74a5522904ca33d723
Content-Type: text/plain; charset=ISO-8859-1

This patch still stands.

I took a look at meta-oe. IMHO, the way the build works here is the right
way.

I had no problems rebasing it to the latest HEAD,
df5f9a3e6dfcf8e8f57132843a024b44c0bd90fc,
and rebuilding.

Tested as follows:
- build core-image-sato
- running qemux86 image
- udevd is started correctly. the image works normally under usage smoke
tests
- udevd is verified to be version 182

If you'll see problems building, please let me have a log.

Alex

On Wed, Sep 19, 2012 at 9:02 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Sep 11, 2012 at 1:53 PM, Saul Wold <sgw@linux.intel.com> wrote:
> > On 09/06/2012 02:27 AM, Alex DAMIAN wrote:
> >>
> >> From: Alexandru DAMIAN <alexandru.damian@intel.com>
> >>
> >> This is the final upgrade of udev. Futher upgrades will only
> >> come in conjunction with systemd.
> >>
> >> The v4l1 removal patch is deprecated as the bug is fixed inside udev.
> >> There is a new patch fixing the path for default sh interpreter.
> >> New debug binaries are generated, and udev.inc is modified to package
> >> those correctly.
> >> The install locations changed for udevd and udevadm, so the scripts
> >> are updated accordingly.
> >>
> >> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> >>
> >
> > Alex,
> >
> > I have had some problems with this patch trying to build it.  It was
> looking
> > on my host for usbutils version .82 or greater, but we have the new
> numbered
> > 006 usbutils and it failed.
> >
> > Also, why did you not take the meta-oe version, did you compare your
> changes
> > with the version is meta-oe?  This was mentioned once before?
> >
> > Thanks
> >         Sau!
> >
> >
>
> Alex
>
> whats status of this patch is there is a v4 expected soon
>
> >
> >> Conflicts:
> >>
> >>         meta/recipes-core/udev/udev_164.bb
> >> ---
> >>   .../initscripts/initscripts-1.0/volatiles          |    2 +-
> >>   meta/recipes-core/udev/udev.inc                    |   12 +++--
> >>   ...yboard_force_release.sh-shell-script-path.patch |   35
> ++++++++++++++
> >>   meta/recipes-core/udev/udev/include_resource.patch |   31 ------------
> >>   meta/recipes-core/udev/udev/init                   |   14 +++---
> >>   meta/recipes-core/udev/udev/udev-166-v4l1-1.patch  |   50
> >> --------------------
> >>   meta/recipes-core/udev/udev/udev-cache             |    2 +-
> >>   meta/recipes-core/udev/udev_164.bb                 |    9 ----
> >>   meta/recipes-core/udev/udev_182.bb                 |    9 ++++
> >>   9 files changed, 61 insertions(+), 103 deletions(-)
> >>   create mode 100644
> >>
> meta/recipes-core/udev/udev/0001-Fixing-keyboard_force_release.sh-shell-script-path.patch
> >>   delete mode 100644 meta/recipes-core/udev/udev/include_resource.patch
> >>   delete mode 100644 meta/recipes-core/udev/udev/udev-166-v4l1-1.patch
> >>   delete mode 100644 meta/recipes-core/udev/udev_164.bb
> >>   create mode 100644 meta/recipes-core/udev/udev_182.bb
> >>
> >> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> >> b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> >> index b2ae279..e0741aa 100644
> >> --- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> >> +++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> >> @@ -36,4 +36,4 @@ f root root 0664 /var/log/wtmp none
> >>   f root root 0664 /var/run/utmp none
> >>   l root root 0644 /etc/resolv.conf /var/run/resolv.conf
> >>   f root root 0644 /var/run/resolv.conf none
> >> -
> >> +l root root 0755 /run /var/run
> >> diff --git a/meta/recipes-core/udev/udev.inc
> >> b/meta/recipes-core/udev/udev.inc
> >> index 9cc00e8..fafd9ce 100644
> >> --- a/meta/recipes-core/udev/udev.inc
> >> +++ b/meta/recipes-core/udev/udev.inc
> >> @@ -6,9 +6,10 @@ LICENSE = "GPLv2.0+ & LGPLv2.1+"
> >>   LICENSE_${PN} = "GPLv2.0+"
> >>   LICENSE_libudev = "LGPLv2.1+"
> >>   LICENSE_libgudev = "LGPLv2.1+"
> >> -LIC_FILES_CHKSUM =
> "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
> >> -
> >> file://libudev/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
> >> -
> >> file://extras/gudev/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
> >> +LIC_FILES_CHKSUM =
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> >> +
> >> file://src/COPYING;md5=17c4e5fb495e6707ac92a3864926f979 \
> >> +
> >> file://src/gudev/COPYING;md5=fb494485a7d0505308cb68e4997cc266"
> >> +
> >>
> >>   DEPENDS = "acl glib-2.0 libusb usbutils pciutils gperf-native
> >> libxslt-native"
> >>   RPROVIDES_${PN} = "hotplug"
> >> @@ -16,6 +17,7 @@ RRECOMMENDS_${PN} += "udev-extraconf usbutils-ids
> >> pciutils-ids"
> >>   RDEPENDS_libudev = "${PN} (= ${EXTENDPKGV})"
> >>
> >>   SRC_URI =
> >> "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
> >> +
> >> file://0001-Fixing-keyboard_force_release.sh-shell-script-path.patch \
> >>              file://run.rules \
> >>              file://udev.rules \
> >>              file://devfs-udev.rules \
> >> @@ -32,7 +34,7 @@ inherit autotools pkgconfig update-rc.d
> >>
> >>   # udevd/udevadm -> /sbin/, libudev.so.* -> /lib/
> >>   sbindir = "${base_sbindir}"
> >> -libexecdir = "${base_libdir}/udev"
> >> +libexecdir = "${base_libdir}"
> >>   EXTRA_OECONF = "--disable-introspection
> --with-rootlibdir=${base_libdir}
> >> \
> >>                   --with-pci-ids-path=${datadir}/pci.ids"
> >>
> >> @@ -50,6 +52,8 @@ FILES_${PN} += "${libexecdir} ${libdir}/ConsoleKit"
> >>   RRECOMMENDS_${PN} += "udev-utils"
> >>
> >>   FILES_${PN}-dbg += "${libexecdir}/.debug"
> >> +FILES_${PN}-dbg += "${base_libdir}/udev/.debug/"
> >> +FILES_${PN}-dbg += "${base_libdir}/udev/.debug/*"
> >>   FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc"
> >>   FILES_libudev = "${base_libdir}/libudev.so.*"
> >>   FILES_libudev-dbg = "${base_libdir}/.debug/libudev.so.*"
> >> diff --git
> >>
> a/meta/recipes-core/udev/udev/0001-Fixing-keyboard_force_release.sh-shell-script-path.patch
> >>
> b/meta/recipes-core/udev/udev/0001-Fixing-keyboard_force_release.sh-shell-script-path.patch
> >> new file mode 100644
> >> index 0000000..41deafa
> >> --- /dev/null
> >> +++
> >>
> b/meta/recipes-core/udev/udev/0001-Fixing-keyboard_force_release.sh-shell-script-path.patch
> >> @@ -0,0 +1,35 @@
> >> +From 0f8290c943da298abd269ca60fd8375dfb219971 Mon Sep 17 00:00:00 2001
> >> +From: Alexandru DAMIAN <alexandru.damian@intel.com>
> >> +Date: Thu, 12 Jul 2012 12:54:48 +0300
> >> +Subject: [PATCH] Fixing keyboard_force_release.sh shell script path
> >> +
> >> +With the introduction of rootprefix, the keyboard-force-release.sh.in
> >> +was modified to be executed with @rootprefix@/bin/sh, which is wrong
> >> +because @rootprefix@ defaults to /usr (which is correct), but the
> >> +shell is always at /bin/sh (IEEE Std 1003.2-1992).
> >> +
> >> +Therefore the interpreter for shell scripts needs to be /bin/sh at all
> >> times.
> >> +
> >> +The upstream moved to configurable root prefix, this patch taclkes a
> >> +transition bug, and will not be applied upstream.
> >> +
> >> +Upstream-Status: Inappropriate [legacy version]
> >> +
> >> +Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> >> +---
> >> + src/keymap/keyboard-force-release.sh.in |    2 +-
> >> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> +
> >> +diff --git a/src/keymap/keyboard-force-release.sh.in
> >> b/src/keymap/keyboard-force-release.sh.in
> >> +index dd040ce..597a3a6 100755
> >> +--- a/src/keymap/keyboard-force-release.sh.in
> >> ++++ b/src/keymap/keyboard-force-release.sh.in
> >> +@@ -1,4 +1,4 @@
> >> +-#!@rootprefix@/bin/sh -e
> >> ++#!/bin/sh -e
> >> + # read list of scancodes, convert hex to decimal and
> >> + # append to the atkbd force_release sysfs attribute
> >> + # $1 sysfs devpath for serioX
> >> +--
> >> +1.7.9.5
> >> +
> >> diff --git a/meta/recipes-core/udev/udev/include_resource.patch
> >> b/meta/recipes-core/udev/udev/include_resource.patch
> >> deleted file mode 100644
> >> index a46ce59..0000000
> >> --- a/meta/recipes-core/udev/udev/include_resource.patch
> >> +++ /dev/null
> >> @@ -1,31 +0,0 @@
> >> -Fixes errors like below with eglibc 2.16
> >> -
> >> -libudev/libudev-util-private.c:348:16: error: 'PRIO_PROCESS' undeclared
> >> (first use in this function)
> >> -
> >> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> -Upstream-Status: Pending
> >> -
> >> -Index: udev-164/libudev/libudev-util-private.c
> >> -===================================================================
> >> ---- udev-164.orig/libudev/libudev-util-private.c       2010-08-03
> >> 02:42:26.000000000 -0700
> >> -+++ udev-164/libudev/libudev-util-private.c    2012-07-03
> >> 10:53:35.082346684 -0700
> >> -@@ -21,6 +21,7 @@
> >> - #include <grp.h>
> >> - #include <sys/wait.h>
> >> - #include <sys/param.h>
> >> -+#include <sys/resource.h>
> >> -
> >> - #include "libudev.h"
> >> - #include "libudev-private.h"
> >> -Index: udev-164/udev/udevd.c
> >> -===================================================================
> >> ---- udev-164.orig/udev/udevd.c 2010-10-13 04:08:29.000000000 -0700
> >> -+++ udev-164/udev/udevd.c      2012-07-03 10:53:19.214345914 -0700
> >> -@@ -43,6 +43,7 @@
> >> - #include <sys/ioctl.h>
> >> - #include <sys/inotify.h>
> >> - #include <sys/utsname.h>
> >> -+#include <sys/resource.h>
> >> -
> >> - #include "udev.h"
> >> - #include "sd-daemon.h"
> >> diff --git a/meta/recipes-core/udev/udev/init
> >> b/meta/recipes-core/udev/udev/init
> >> index d521685..ca02abb 100644
> >> --- a/meta/recipes-core/udev/udev/init
> >> +++ b/meta/recipes-core/udev/udev/init
> >> @@ -13,7 +13,7 @@ export TZ=/etc/localtime
> >>
> >>   [ -d /sys/class ] || exit 1
> >>   [ -r /proc/mounts ] || exit 1
> >> -[ -x /sbin/udevd ] || exit 1
> >> +[ -x /lib/udev/udevd ] || exit 1
> >>   [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
> >>   [ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
> >>
> >> @@ -70,15 +70,15 @@ kill_udevd > "/dev/null" 2>&1
> >>
> >>   # trigger the sorted events
> >>   echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
> >> -/sbin/udevd -d
> >> +/lib/udev/udevd -d
> >>
> >> -/sbin/udevadm control --env=STARTUP=1
> >> +/usr/bin/udevadm control --env=STARTUP=1
> >>   if [ "$not_first_boot" != "" ];then
> >> -       /sbin/udevadm trigger --action=add --subsystem-nomatch=tty
> >> --subsystem-nomatch=mem --subsystem-nomatch=vc
> --subsystem-nomatch=vtconsole
> >> --subsystem-nomatch=misc --subsystem-nomatch=dcon
> >> --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics
> >> --subsystem-nomatch=backlight --subsystem-nomatch=video4linux
> >> --subsystem-nomatch=platform
> >> -       (/sbin/udevadm settle --timeout=3; /sbin/udevadm control
> >> --env=STARTUP=)&
> >> +       /usr/bin/udevadm trigger --action=add --subsystem-nomatch=tty
> >> --subsystem-nomatch=mem --subsystem-nomatch=vc
> --subsystem-nomatch=vtconsole
> >> --subsystem-nomatch=misc --subsystem-nomatch=dcon
> >> --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics
> >> --subsystem-nomatch=backlight --subsystem-nomatch=video4linux
> >> --subsystem-nomatch=platform
> >> +       (/usr/bin/udevadm settle --timeout=3; /usr/bin/udevadm control
> >> --env=STARTUP=)&
> >>   else
> >> -       /sbin/udevadm trigger --action=add
> >> -       /sbin/udevadm settle
> >> +       /usr/bin/udevadm trigger --action=add
> >> +       /usr/bin/udevadm settle
> >>   fi
> >>
> >>   exit 0
> >> diff --git a/meta/recipes-core/udev/udev/udev-166-v4l1-1.patch
> >> b/meta/recipes-core/udev/udev/udev-166-v4l1-1.patch
> >> deleted file mode 100644
> >> index 2086fe1..0000000
> >> --- a/meta/recipes-core/udev/udev/udev-166-v4l1-1.patch
> >> +++ /dev/null
> >> @@ -1,50 +0,0 @@
> >> -Upstream-Status: Backport
> >> -
> >> -Submitted By:            Matt Burgess
> >> <matthew_at_linuxfromscratch_dot_org>
> >> -Date:                    2011-03-26
> >> -Initial Package Version: 166
> >> -Upstream Status:         From upstream
> >> -Origin:
> >>
> http://git.kernel.org/?p=linux/hotplug/udev.git;a=commitdiff;h=4ace8a43ac2cbbd4d6f5c29fc461c3caa8f8545b
> >> -Description:             Fixes a compilation error caused by the
> removal
> >> of the
> >> -                         Video for Linux 1 API from Linux kernels from
> >> 2.6.38
> >> -                         onwards.
> >> -
> >> -diff -Naur udev-166.orig/extras/v4l_id/v4l_id.c
> >> udev-166/extras/v4l_id/v4l_id.c
> >> ---- udev-166.orig/extras/v4l_id/v4l_id.c       2009-12-03
> >> 12:45:03.000000000 +0000
> >> -+++ udev-166/extras/v4l_id/v4l_id.c    2011-03-25 20:26:33.000000000
> >> +0000
> >> -@@ -28,7 +28,6 @@
> >> - #include <sys/types.h>
> >> - #include <sys/time.h>
> >> - #include <sys/ioctl.h>
> >> --#include <linux/videodev.h>
> >> - #include <linux/videodev2.h>
> >> -
> >> - int main (int argc, char *argv[])
> >> -@@ -39,7 +38,6 @@
> >> -       };
> >> -       int fd;
> >> -       char *device;
> >> --      struct video_capability v1cap;
> >> -       struct v4l2_capability v2cap;
> >> -
> >> -       while (1) {
> >> -@@ -82,19 +80,6 @@
> >> -               if ((v2cap.capabilities & V4L2_CAP_RADIO) > 0)
> >> -                       printf("radio:");
> >> -               printf("\n");
> >> --      } else if (ioctl (fd, VIDIOCGCAP, &v1cap) == 0) {
> >> --              printf("ID_V4L_VERSION=1\n");
> >> --              printf("ID_V4L_PRODUCT=%s\n", v1cap.name);
> >> --              printf("ID_V4L_CAPABILITIES=:");
> >> --              if ((v1cap.type & VID_TYPE_CAPTURE) > 0)
> >> --                      printf("capture:");
> >> --              if ((v1cap.type & VID_TYPE_OVERLAY) > 0)
> >> --                      printf("video_overlay:");
> >> --              if (v1cap.audios > 0)
> >> --                      printf("audio:");
> >> --              if ((v1cap.type & VID_TYPE_TUNER) > 0)
> >> --                      printf("tuner:");
> >> --              printf("\n");
> >> -       }
> >> -
> >> -       close (fd);
> >> diff --git a/meta/recipes-core/udev/udev/udev-cache
> >> b/meta/recipes-core/udev/udev/udev-cache
> >> index 9c24e76..0f3d7cd 100644
> >> --- a/meta/recipes-core/udev/udev/udev-cache
> >> +++ b/meta/recipes-core/udev/udev/udev-cache
> >> @@ -12,7 +12,7 @@
> >>   export TZ=/etc/localtime
> >>
> >>   [ -r /proc/mounts ] || exit 1
> >> -[ -x /sbin/udevd ] || exit 1
> >> +[ -x /lib/udev/udevd ] || exit 1
> >>   [ -d /sys/class ] || exit 1
> >>
> >>   [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
> >> diff --git a/meta/recipes-core/udev/udev_164.bb
> >> b/meta/recipes-core/udev/udev_164.bb
> >> deleted file mode 100644
> >> index 4d22bc8..0000000
> >> --- a/meta/recipes-core/udev/udev_164.bb
> >> +++ /dev/null
> >> @@ -1,9 +0,0 @@
> >> -include udev.inc
> >> -
> >> -PR = "r16"
> >> -
> >> -SRC_URI += "file://udev-166-v4l1-1.patch \
> >> -            file://include_resource.patch \
> >> -           "
> >> -SRC_URI[md5sum] = "fddac2d54761ea34865af9467377ca9f"
> >> -SRC_URI[sha256sum] =
> >> "c12e66280b5e1465f6587a8cfa47d7405c4caa7e52ce5dd13478d04f6ec05e5c"
> >> diff --git a/meta/recipes-core/udev/udev_182.bb
> >> b/meta/recipes-core/udev/udev_182.bb
> >> new file mode 100644
> >> index 0000000..6678fe1
> >> --- /dev/null
> >> +++ b/meta/recipes-core/udev/udev_182.bb
> >> @@ -0,0 +1,9 @@
> >> +include udev.inc
> >> +
> >> +PR = "r0"
> >> +
> >> +# module-init-tools from kmod_git will provide libkmod runtime
> >> +DEPENDS = "module-init-tools"
> >> +
> >> +SRC_URI[md5sum] = "1b964456177fbf48023dfee7db3a708d"
> >> +SRC_URI[sha256sum] =
> >> "7857ed19fafd8f3ca8de410194e8c7336e9eb8a20626ea8a4ba6449b017faba4"
> >>
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--002354790f74a5522904ca33d723
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

This patch still stands.<br><br>I took a look at meta-oe. IMHO, the way the=
 build works here is the right way.<br><br>I had no problems rebasing it to=
 the latest HEAD, df5f9a3e6dfcf8e8f57132843a024b44c0bd90fc,<br>and rebuildi=
ng.<br>
<br>Tested as follows:<br>- build core-image-sato<br>- running qemux86 imag=
e<br>- udevd is started correctly. the image works normally under usage smo=
ke tests<br>- udevd is verified to be version 182<br><br>If you&#39;ll see =
problems building, please let me have a log.<br>
<br>Alex<br><br><div class=3D"gmail_quote">On Wed, Sep 19, 2012 at 9:02 PM,=
 Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" targe=
t=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<div class=3D"im">On Tue, Sep 11, 2012 at 1:53 PM, Saul Wold &lt;<a href=3D=
"mailto:sgw@linux.intel.com">sgw@linux.intel.com</a>&gt; wrote:<br>
&gt; On 09/06/2012 02:27 AM, Alex DAMIAN wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: Alexandru DAMIAN &lt;<a href=3D"mailto:alexandru.damian@inte=
l.com">alexandru.damian@intel.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; This is the final upgrade of udev. Futher upgrades will only<br>
&gt;&gt; come in conjunction with systemd.<br>
&gt;&gt;<br>
&gt;&gt; The v4l1 removal patch is deprecated as the bug is fixed inside ud=
ev.<br>
&gt;&gt; There is a new patch fixing the path for default sh interpreter.<b=
r>
&gt;&gt; New debug binaries are generated, and udev.inc is modified to pack=
age<br>
&gt;&gt; those correctly.<br>
&gt;&gt; The install locations changed for udevd and udevadm, so the script=
s<br>
&gt;&gt; are updated accordingly.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Alexandru DAMIAN &lt;<a href=3D"mailto:alexandru.da=
mian@intel.com">alexandru.damian@intel.com</a>&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; Alex,<br>
&gt;<br>
&gt; I have had some problems with this patch trying to build it. =A0It was=
 looking<br>
&gt; on my host for usbutils version .82 or greater, but we have the new nu=
mbered<br>
&gt; 006 usbutils and it failed.<br>
&gt;<br>
&gt; Also, why did you not take the meta-oe version, did you compare your c=
hanges<br>
&gt; with the version is meta-oe? =A0This was mentioned once before?<br>
&gt;<br>
&gt; Thanks<br>
&gt; =A0 =A0 =A0 =A0 Sau!<br>
&gt;<br>
&gt;<br>
<br>
</div>Alex<br>
<br>
whats status of this patch is there is a v4 expected soon<br>
<div><div class=3D"h5"><br>
&gt;<br>
&gt;&gt; Conflicts:<br>
&gt;&gt;<br>
&gt;&gt; =A0 =A0 =A0 =A0 meta/recipes-core/udev/<a href=3D"http://udev_164.=
bb" target=3D"_blank">udev_164.bb</a><br>
&gt;&gt; ---<br>
&gt;&gt; =A0 .../initscripts/initscripts-1.0/volatiles =A0 =A0 =A0 =A0 =A0|=
 =A0 =A02 +-<br>
&gt;&gt; =A0 meta/recipes-core/udev/udev.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 12 +++--<br>
&gt;&gt; =A0 ...yboard_force_release.sh-shell-script-path.patch | =A0 35 ++=
++++++++++++<br>
&gt;&gt; =A0 meta/recipes-core/udev/udev/include_resource.patch | =A0 31 --=
----------<br>
&gt;&gt; =A0 meta/recipes-core/udev/udev/init =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 14 +++---<br>
&gt;&gt; =A0 meta/recipes-core/udev/udev/udev-166-v4l1-1.patch =A0| =A0 50<=
br>
&gt;&gt; --------------------<br>
&gt;&gt; =A0 meta/recipes-core/udev/udev/udev-cache =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A02 +-<br>
&gt;&gt; =A0 meta/recipes-core/udev/<a href=3D"http://udev_164.bb" target=
=3D"_blank">udev_164.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A09 ----=
<br>
&gt;&gt; =A0 meta/recipes-core/udev/<a href=3D"http://udev_182.bb" target=
=3D"_blank">udev_182.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A09 ++++=
<br>
&gt;&gt; =A0 9 files changed, 61 insertions(+), 103 deletions(-)<br>
&gt;&gt; =A0 create mode 100644<br>
&gt;&gt; meta/recipes-core/udev/udev/0001-Fixing-keyboard_force_release.sh-=
shell-script-path.patch<br>
&gt;&gt; =A0 delete mode 100644 meta/recipes-core/udev/udev/include_resourc=
e.patch<br>
&gt;&gt; =A0 delete mode 100644 meta/recipes-core/udev/udev/udev-166-v4l1-1=
.patch<br>
&gt;&gt; =A0 delete mode 100644 meta/recipes-core/udev/<a href=3D"http://ud=
ev_164.bb" target=3D"_blank">udev_164.bb</a><br>
&gt;&gt; =A0 create mode 100644 meta/recipes-core/udev/<a href=3D"http://ud=
ev_182.bb" target=3D"_blank">udev_182.bb</a><br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatil=
es<br>
&gt;&gt; b/meta/recipes-core/initscripts/initscripts-1.0/volatiles<br>
&gt;&gt; index b2ae279..e0741aa 100644<br>
&gt;&gt; --- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles<br>
&gt;&gt; +++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles<br>
&gt;&gt; @@ -36,4 +36,4 @@ f root root 0664 /var/log/wtmp none<br>
&gt;&gt; =A0 f root root 0664 /var/run/utmp none<br>
&gt;&gt; =A0 l root root 0644 /etc/resolv.conf /var/run/resolv.conf<br>
&gt;&gt; =A0 f root root 0644 /var/run/resolv.conf none<br>
&gt;&gt; -<br>
&gt;&gt; +l root root 0755 /run /var/run<br>
&gt;&gt; diff --git a/meta/recipes-core/udev/udev.inc<br>
&gt;&gt; b/meta/recipes-core/udev/udev.inc<br>
&gt;&gt; index 9cc00e8..fafd9ce 100644<br>
&gt;&gt; --- a/meta/recipes-core/udev/udev.inc<br>
&gt;&gt; +++ b/meta/recipes-core/udev/udev.inc<br>
&gt;&gt; @@ -6,9 +6,10 @@ LICENSE =3D &quot;GPLv2.0+ &amp; LGPLv2.1+&quot;<=
br>
&gt;&gt; =A0 LICENSE_${PN} =3D &quot;GPLv2.0+&quot;<br>
&gt;&gt; =A0 LICENSE_libudev =3D &quot;LGPLv2.1+&quot;<br>
&gt;&gt; =A0 LICENSE_libgudev =3D &quot;LGPLv2.1+&quot;<br>
&gt;&gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D751419260aa954499=
f7abaabaa882bbe \<br>
&gt;&gt; -<br>
&gt;&gt; file://libudev/COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37343 \<br=
>
&gt;&gt; -<br>
&gt;&gt; file://extras/gudev/COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37343=
&quot;<br>
&gt;&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce44=
86a80fdaf4a4263 \<br>
&gt;&gt; +<br>
&gt;&gt; file://src/COPYING;md5=3D17c4e5fb495e6707ac92a3864926f979 \<br>
&gt;&gt; +<br>
&gt;&gt; file://src/gudev/COPYING;md5=3Dfb494485a7d0505308cb68e4997cc266&qu=
ot;<br>
&gt;&gt; +<br>
&gt;&gt;<br>
&gt;&gt; =A0 DEPENDS =3D &quot;acl glib-2.0 libusb usbutils pciutils gperf-=
native<br>
&gt;&gt; libxslt-native&quot;<br>
&gt;&gt; =A0 RPROVIDES_${PN} =3D &quot;hotplug&quot;<br>
&gt;&gt; @@ -16,6 +17,7 @@ RRECOMMENDS_${PN} +=3D &quot;udev-extraconf usbu=
tils-ids<br>
&gt;&gt; pciutils-ids&quot;<br>
&gt;&gt; =A0 RDEPENDS_libudev =3D &quot;${PN} (=3D ${EXTENDPKGV})&quot;<br>
&gt;&gt;<br>
&gt;&gt; =A0 SRC_URI =3D<br>
&gt;&gt; &quot;${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.ta=
r.gz \<br>
&gt;&gt; +<br>
&gt;&gt; file://0001-Fixing-keyboard_force_release.sh-shell-script-path.pat=
ch \<br>
&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0file://run.rules \<br>
&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0file://udev.rules \<br>
&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0file://devfs-udev.rules \<br>
&gt;&gt; @@ -32,7 +34,7 @@ inherit autotools pkgconfig update-rc.d<br>
&gt;&gt;<br>
&gt;&gt; =A0 # udevd/udevadm -&gt; /sbin/, libudev.so.* -&gt; /lib/<br>
&gt;&gt; =A0 sbindir =3D &quot;${base_sbindir}&quot;<br>
&gt;&gt; -libexecdir =3D &quot;${base_libdir}/udev&quot;<br>
&gt;&gt; +libexecdir =3D &quot;${base_libdir}&quot;<br>
&gt;&gt; =A0 EXTRA_OECONF =3D &quot;--disable-introspection --with-rootlibd=
ir=3D${base_libdir}<br>
&gt;&gt; \<br>
&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --with-pci-ids-path=3D${datadi=
r}/pci.ids&quot;<br>
&gt;&gt;<br>
&gt;&gt; @@ -50,6 +52,8 @@ FILES_${PN} +=3D &quot;${libexecdir} ${libdir}/C=
onsoleKit&quot;<br>
&gt;&gt; =A0 RRECOMMENDS_${PN} +=3D &quot;udev-utils&quot;<br>
&gt;&gt;<br>
&gt;&gt; =A0 FILES_${PN}-dbg +=3D &quot;${libexecdir}/.debug&quot;<br>
&gt;&gt; +FILES_${PN}-dbg +=3D &quot;${base_libdir}/udev/.debug/&quot;<br>
&gt;&gt; +FILES_${PN}-dbg +=3D &quot;${base_libdir}/udev/.debug/*&quot;<br>
&gt;&gt; =A0 FILES_${PN}-dev =3D &quot;${datadir}/pkgconfig/udev.pc&quot;<b=
r>
&gt;&gt; =A0 FILES_libudev =3D &quot;${base_libdir}/libudev.so.*&quot;<br>
&gt;&gt; =A0 FILES_libudev-dbg =3D &quot;${base_libdir}/.debug/libudev.so.*=
&quot;<br>
&gt;&gt; diff --git<br>
&gt;&gt; a/meta/recipes-core/udev/udev/0001-Fixing-keyboard_force_release.s=
h-shell-script-path.patch<br>
&gt;&gt; b/meta/recipes-core/udev/udev/0001-Fixing-keyboard_force_release.s=
h-shell-script-path.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000..41deafa<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++<br>
&gt;&gt; b/meta/recipes-core/udev/udev/0001-Fixing-keyboard_force_release.s=
h-shell-script-path.patch<br>
&gt;&gt; @@ -0,0 +1,35 @@<br>
&gt;&gt; +From 0f8290c943da298abd269ca60fd8375dfb219971 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Alexandru DAMIAN &lt;<a href=3D"mailto:alexandru.damian@int=
el.com">alexandru.damian@intel.com</a>&gt;<br>
&gt;&gt; +Date: Thu, 12 Jul 2012 12:54:48 +0300<br>
&gt;&gt; +Subject: [PATCH] Fixing keyboard_force_release.sh shell script pa=
th<br>
&gt;&gt; +<br>
&gt;&gt; +With the introduction of rootprefix, the <a href=3D"http://keyboa=
rd-force-release.sh.in" target=3D"_blank">keyboard-force-release.sh.in</a><=
br>
&gt;&gt; +was modified to be executed with @rootprefix@/bin/sh, which is wr=
ong<br>
&gt;&gt; +because @rootprefix@ defaults to /usr (which is correct), but the=
<br>
&gt;&gt; +shell is always at /bin/sh (IEEE Std 1003.2-1992).<br>
&gt;&gt; +<br>
&gt;&gt; +Therefore the interpreter for shell scripts needs to be /bin/sh a=
t all<br>
&gt;&gt; times.<br>
&gt;&gt; +<br>
&gt;&gt; +The upstream moved to configurable root prefix, this patch taclke=
s a<br>
&gt;&gt; +transition bug, and will not be applied upstream.<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Inappropriate [legacy version]<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Alexandru DAMIAN &lt;<a href=3D"mailto:alexandru.d=
amian@intel.com">alexandru.damian@intel.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + src/keymap/<a href=3D"http://keyboard-force-release.sh.in" targe=
t=3D"_blank">keyboard-force-release.sh.in</a> | =A0 =A02 +-<br>
&gt;&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/src/keymap/<a href=3D"http://keyboard-force-release.=
sh.in" target=3D"_blank">keyboard-force-release.sh.in</a><br>
&gt;&gt; b/src/keymap/<a href=3D"http://keyboard-force-release.sh.in" targe=
t=3D"_blank">keyboard-force-release.sh.in</a><br>
&gt;&gt; +index dd040ce..597a3a6 100755<br>
&gt;&gt; +--- a/src/keymap/<a href=3D"http://keyboard-force-release.sh.in" =
target=3D"_blank">keyboard-force-release.sh.in</a><br>
&gt;&gt; ++++ b/src/keymap/<a href=3D"http://keyboard-force-release.sh.in" =
target=3D"_blank">keyboard-force-release.sh.in</a><br>
&gt;&gt; +@@ -1,4 +1,4 @@<br>
&gt;&gt; +-#!@rootprefix@/bin/sh -e<br>
&gt;&gt; ++#!/bin/sh -e<br>
&gt;&gt; + # read list of scancodes, convert hex to decimal and<br>
&gt;&gt; + # append to the atkbd force_release sysfs attribute<br>
&gt;&gt; + # $1 sysfs devpath for serioX<br>
&gt;&gt; +--<br>
&gt;&gt; +1.7.9.5<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta/recipes-core/udev/udev/include_resource.patch<br=
>
&gt;&gt; b/meta/recipes-core/udev/udev/include_resource.patch<br>
&gt;&gt; deleted file mode 100644<br>
&gt;&gt; index a46ce59..0000000<br>
&gt;&gt; --- a/meta/recipes-core/udev/udev/include_resource.patch<br>
&gt;&gt; +++ /dev/null<br>
&gt;&gt; @@ -1,31 +0,0 @@<br>
&gt;&gt; -Fixes errors like below with eglibc 2.16<br>
&gt;&gt; -<br>
&gt;&gt; -libudev/libudev-util-private.c:348:16: error: &#39;PRIO_PROCESS&#=
39; undeclared<br>
&gt;&gt; (first use in this function)<br>
&gt;&gt; -<br>
&gt;&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
>raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; -Upstream-Status: Pending<br>
&gt;&gt; -<br>
&gt;&gt; -Index: udev-164/libudev/libudev-util-private.c<br>
&gt;&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; ---- udev-164.orig/libudev/libudev-util-private.c =A0 =A0 =A0 2010=
-08-03<br>
&gt;&gt; 02:42:26.000000000 -0700<br>
&gt;&gt; -+++ udev-164/libudev/libudev-util-private.c =A0 =A02012-07-03<br>
&gt;&gt; 10:53:35.082346684 -0700<br>
&gt;&gt; -@@ -21,6 +21,7 @@<br>
&gt;&gt; - #include &lt;grp.h&gt;<br>
&gt;&gt; - #include &lt;sys/wait.h&gt;<br>
&gt;&gt; - #include &lt;sys/param.h&gt;<br>
&gt;&gt; -+#include &lt;sys/resource.h&gt;<br>
&gt;&gt; -<br>
&gt;&gt; - #include &quot;libudev.h&quot;<br>
&gt;&gt; - #include &quot;libudev-private.h&quot;<br>
&gt;&gt; -Index: udev-164/udev/udevd.c<br>
&gt;&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; ---- udev-164.orig/udev/udevd.c 2010-10-13 04:08:29.000000000 -070=
0<br>
&gt;&gt; -+++ udev-164/udev/udevd.c =A0 =A0 =A02012-07-03 10:53:19.21434591=
4 -0700<br>
&gt;&gt; -@@ -43,6 +43,7 @@<br>
&gt;&gt; - #include &lt;sys/ioctl.h&gt;<br>
&gt;&gt; - #include &lt;sys/inotify.h&gt;<br>
&gt;&gt; - #include &lt;sys/utsname.h&gt;<br>
&gt;&gt; -+#include &lt;sys/resource.h&gt;<br>
&gt;&gt; -<br>
&gt;&gt; - #include &quot;udev.h&quot;<br>
&gt;&gt; - #include &quot;sd-daemon.h&quot;<br>
&gt;&gt; diff --git a/meta/recipes-core/udev/udev/init<br>
&gt;&gt; b/meta/recipes-core/udev/udev/init<br>
&gt;&gt; index d521685..ca02abb 100644<br>
&gt;&gt; --- a/meta/recipes-core/udev/udev/init<br>
&gt;&gt; +++ b/meta/recipes-core/udev/udev/init<br>
&gt;&gt; @@ -13,7 +13,7 @@ export TZ=3D/etc/localtime<br>
&gt;&gt;<br>
&gt;&gt; =A0 [ -d /sys/class ] || exit 1<br>
&gt;&gt; =A0 [ -r /proc/mounts ] || exit 1<br>
&gt;&gt; -[ -x /sbin/udevd ] || exit 1<br>
&gt;&gt; +[ -x /lib/udev/udevd ] || exit 1<br>
&gt;&gt; =A0 [ -f /etc/default/udev-cache ] &amp;&amp; . /etc/default/udev-=
cache<br>
&gt;&gt; =A0 [ -f /etc/udev/udev.conf ] &amp;&amp; . /etc/udev/udev.conf<br=
>
&gt;&gt;<br>
&gt;&gt; @@ -70,15 +70,15 @@ kill_udevd &gt; &quot;/dev/null&quot; 2&gt;&am=
p;1<br>
&gt;&gt;<br>
&gt;&gt; =A0 # trigger the sorted events<br>
&gt;&gt; =A0 echo -e &#39;\000\000\000\000&#39; &gt; /proc/sys/kernel/hotpl=
ug<br>
&gt;&gt; -/sbin/udevd -d<br>
&gt;&gt; +/lib/udev/udevd -d<br>
&gt;&gt;<br>
&gt;&gt; -/sbin/udevadm control --env=3DSTARTUP=3D1<br>
&gt;&gt; +/usr/bin/udevadm control --env=3DSTARTUP=3D1<br>
&gt;&gt; =A0 if [ &quot;$not_first_boot&quot; !=3D &quot;&quot; ];then<br>
&gt;&gt; - =A0 =A0 =A0 /sbin/udevadm trigger --action=3Dadd --subsystem-nom=
atch=3Dtty<br>
&gt;&gt; --subsystem-nomatch=3Dmem --subsystem-nomatch=3Dvc --subsystem-nom=
atch=3Dvtconsole<br>
&gt;&gt; --subsystem-nomatch=3Dmisc --subsystem-nomatch=3Ddcon<br>
&gt;&gt; --subsystem-nomatch=3Dpci_bus =A0--subsystem-nomatch=3Dgraphics<br=
>
&gt;&gt; --subsystem-nomatch=3Dbacklight --subsystem-nomatch=3Dvideo4linux<=
br>
&gt;&gt; --subsystem-nomatch=3Dplatform<br>
&gt;&gt; - =A0 =A0 =A0 (/sbin/udevadm settle --timeout=3D3; /sbin/udevadm c=
ontrol<br>
&gt;&gt; --env=3DSTARTUP=3D)&amp;<br>
&gt;&gt; + =A0 =A0 =A0 /usr/bin/udevadm trigger --action=3Dadd --subsystem-=
nomatch=3Dtty<br>
&gt;&gt; --subsystem-nomatch=3Dmem --subsystem-nomatch=3Dvc --subsystem-nom=
atch=3Dvtconsole<br>
&gt;&gt; --subsystem-nomatch=3Dmisc --subsystem-nomatch=3Ddcon<br>
&gt;&gt; --subsystem-nomatch=3Dpci_bus =A0--subsystem-nomatch=3Dgraphics<br=
>
&gt;&gt; --subsystem-nomatch=3Dbacklight --subsystem-nomatch=3Dvideo4linux<=
br>
&gt;&gt; --subsystem-nomatch=3Dplatform<br>
&gt;&gt; + =A0 =A0 =A0 (/usr/bin/udevadm settle --timeout=3D3; /usr/bin/ude=
vadm control<br>
&gt;&gt; --env=3DSTARTUP=3D)&amp;<br>
&gt;&gt; =A0 else<br>
&gt;&gt; - =A0 =A0 =A0 /sbin/udevadm trigger --action=3Dadd<br>
&gt;&gt; - =A0 =A0 =A0 /sbin/udevadm settle<br>
&gt;&gt; + =A0 =A0 =A0 /usr/bin/udevadm trigger --action=3Dadd<br>
&gt;&gt; + =A0 =A0 =A0 /usr/bin/udevadm settle<br>
&gt;&gt; =A0 fi<br>
&gt;&gt;<br>
&gt;&gt; =A0 exit 0<br>
&gt;&gt; diff --git a/meta/recipes-core/udev/udev/udev-166-v4l1-1.patch<br>
&gt;&gt; b/meta/recipes-core/udev/udev/udev-166-v4l1-1.patch<br>
&gt;&gt; deleted file mode 100644<br>
&gt;&gt; index 2086fe1..0000000<br>
&gt;&gt; --- a/meta/recipes-core/udev/udev/udev-166-v4l1-1.patch<br>
&gt;&gt; +++ /dev/null<br>
&gt;&gt; @@ -1,50 +0,0 @@<br>
&gt;&gt; -Upstream-Status: Backport<br>
&gt;&gt; -<br>
&gt;&gt; -Submitted By: =A0 =A0 =A0 =A0 =A0 =A0Matt Burgess<br>
&gt;&gt; &lt;matthew_at_linuxfromscratch_dot_org&gt;<br>
&gt;&gt; -Date: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A02011-03-26<br>
&gt;&gt; -Initial Package Version: 166<br>
&gt;&gt; -Upstream Status: =A0 =A0 =A0 =A0 From upstream<br>
&gt;&gt; -Origin:<br>
&gt;&gt; <a href=3D"http://git.kernel.org/?p=3Dlinux/hotplug/udev.git;a=3Dc=
ommitdiff;h=3D4ace8a43ac2cbbd4d6f5c29fc461c3caa8f8545b" target=3D"_blank">h=
ttp://git.kernel.org/?p=3Dlinux/hotplug/udev.git;a=3Dcommitdiff;h=3D4ace8a4=
3ac2cbbd4d6f5c29fc461c3caa8f8545b</a><br>

&gt;&gt; -Description: =A0 =A0 =A0 =A0 =A0 =A0 Fixes a compilation error ca=
used by the removal<br>
&gt;&gt; of the<br>
&gt;&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Video for Linux =
1 API from Linux kernels from<br>
&gt;&gt; 2.6.38<br>
&gt;&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 onwards.<br>
&gt;&gt; -<br>
&gt;&gt; -diff -Naur udev-166.orig/extras/v4l_id/v4l_id.c<br>
&gt;&gt; udev-166/extras/v4l_id/v4l_id.c<br>
&gt;&gt; ---- udev-166.orig/extras/v4l_id/v4l_id.c =A0 =A0 =A0 2009-12-03<b=
r>
&gt;&gt; 12:45:03.000000000 +0000<br>
&gt;&gt; -+++ udev-166/extras/v4l_id/v4l_id.c =A0 =A02011-03-25 20:26:33.00=
0000000<br>
&gt;&gt; +0000<br>
&gt;&gt; -@@ -28,7 +28,6 @@<br>
&gt;&gt; - #include &lt;sys/types.h&gt;<br>
&gt;&gt; - #include &lt;sys/time.h&gt;<br>
&gt;&gt; - #include &lt;sys/ioctl.h&gt;<br>
&gt;&gt; --#include &lt;linux/videodev.h&gt;<br>
&gt;&gt; - #include &lt;linux/videodev2.h&gt;<br>
&gt;&gt; -<br>
&gt;&gt; - int main (int argc, char *argv[])<br>
&gt;&gt; -@@ -39,7 +38,6 @@<br>
&gt;&gt; - =A0 =A0 =A0 };<br>
&gt;&gt; - =A0 =A0 =A0 int fd;<br>
&gt;&gt; - =A0 =A0 =A0 char *device;<br>
&gt;&gt; -- =A0 =A0 =A0struct video_capability v1cap;<br>
&gt;&gt; - =A0 =A0 =A0 struct v4l2_capability v2cap;<br>
&gt;&gt; -<br>
&gt;&gt; - =A0 =A0 =A0 while (1) {<br>
&gt;&gt; -@@ -82,19 +80,6 @@<br>
&gt;&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((v2cap.capabilities &amp; V4L2_C=
AP_RADIO) &gt; 0)<br>
&gt;&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printf(&quot;radio:&=
quot;);<br>
&gt;&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 printf(&quot;\n&quot;);<br>
&gt;&gt; -- =A0 =A0 =A0} else if (ioctl (fd, VIDIOCGCAP, &amp;v1cap) =3D=3D=
 0) {<br>
&gt;&gt; -- =A0 =A0 =A0 =A0 =A0 =A0 =A0printf(&quot;ID_V4L_VERSION=3D1\n&qu=
ot;);<br>
&gt;&gt; -- =A0 =A0 =A0 =A0 =A0 =A0 =A0printf(&quot;ID_V4L_PRODUCT=3D%s\n&q=
uot;, <a href=3D"http://v1cap.name" target=3D"_blank">v1cap.name</a>);<br>
&gt;&gt; -- =A0 =A0 =A0 =A0 =A0 =A0 =A0printf(&quot;ID_V4L_CAPABILITIES=3D:=
&quot;);<br>
&gt;&gt; -- =A0 =A0 =A0 =A0 =A0 =A0 =A0if ((v1cap.type &amp; VID_TYPE_CAPTU=
RE) &gt; 0)<br>
&gt;&gt; -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printf(&quot;capture=
:&quot;);<br>
&gt;&gt; -- =A0 =A0 =A0 =A0 =A0 =A0 =A0if ((v1cap.type &amp; VID_TYPE_OVERL=
AY) &gt; 0)<br>
&gt;&gt; -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printf(&quot;video_o=
verlay:&quot;);<br>
&gt;&gt; -- =A0 =A0 =A0 =A0 =A0 =A0 =A0if (v1cap.audios &gt; 0)<br>
&gt;&gt; -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printf(&quot;audio:&=
quot;);<br>
&gt;&gt; -- =A0 =A0 =A0 =A0 =A0 =A0 =A0if ((v1cap.type &amp; VID_TYPE_TUNER=
) &gt; 0)<br>
&gt;&gt; -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printf(&quot;tuner:&=
quot;);<br>
&gt;&gt; -- =A0 =A0 =A0 =A0 =A0 =A0 =A0printf(&quot;\n&quot;);<br>
&gt;&gt; - =A0 =A0 =A0 }<br>
&gt;&gt; -<br>
&gt;&gt; - =A0 =A0 =A0 close (fd);<br>
&gt;&gt; diff --git a/meta/recipes-core/udev/udev/udev-cache<br>
&gt;&gt; b/meta/recipes-core/udev/udev/udev-cache<br>
&gt;&gt; index 9c24e76..0f3d7cd 100644<br>
&gt;&gt; --- a/meta/recipes-core/udev/udev/udev-cache<br>
&gt;&gt; +++ b/meta/recipes-core/udev/udev/udev-cache<br>
&gt;&gt; @@ -12,7 +12,7 @@<br>
&gt;&gt; =A0 export TZ=3D/etc/localtime<br>
&gt;&gt;<br>
&gt;&gt; =A0 [ -r /proc/mounts ] || exit 1<br>
&gt;&gt; -[ -x /sbin/udevd ] || exit 1<br>
&gt;&gt; +[ -x /lib/udev/udevd ] || exit 1<br>
&gt;&gt; =A0 [ -d /sys/class ] || exit 1<br>
&gt;&gt;<br>
&gt;&gt; =A0 [ -f /etc/default/udev-cache ] &amp;&amp; . /etc/default/udev-=
cache<br>
&gt;&gt; diff --git a/meta/recipes-core/udev/<a href=3D"http://udev_164.bb"=
 target=3D"_blank">udev_164.bb</a><br>
&gt;&gt; b/meta/recipes-core/udev/<a href=3D"http://udev_164.bb" target=3D"=
_blank">udev_164.bb</a><br>
&gt;&gt; deleted file mode 100644<br>
&gt;&gt; index 4d22bc8..0000000<br>
&gt;&gt; --- a/meta/recipes-core/udev/<a href=3D"http://udev_164.bb" target=
=3D"_blank">udev_164.bb</a><br>
&gt;&gt; +++ /dev/null<br>
&gt;&gt; @@ -1,9 +0,0 @@<br>
&gt;&gt; -include udev.inc<br>
&gt;&gt; -<br>
&gt;&gt; -PR =3D &quot;r16&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -SRC_URI +=3D &quot;file://udev-166-v4l1-1.patch \<br>
&gt;&gt; - =A0 =A0 =A0 =A0 =A0 =A0file://include_resource.patch \<br>
&gt;&gt; - =A0 =A0 =A0 =A0 =A0 &quot;<br>
&gt;&gt; -SRC_URI[md5sum] =3D &quot;fddac2d54761ea34865af9467377ca9f&quot;<=
br>
&gt;&gt; -SRC_URI[sha256sum] =3D<br>
&gt;&gt; &quot;c12e66280b5e1465f6587a8cfa47d7405c4caa7e52ce5dd13478d04f6ec0=
5e5c&quot;<br>
&gt;&gt; diff --git a/meta/recipes-core/udev/<a href=3D"http://udev_182.bb"=
 target=3D"_blank">udev_182.bb</a><br>
&gt;&gt; b/meta/recipes-core/udev/<a href=3D"http://udev_182.bb" target=3D"=
_blank">udev_182.bb</a><br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000..6678fe1<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-core/udev/<a href=3D"http://udev_182.bb" target=
=3D"_blank">udev_182.bb</a><br>
&gt;&gt; @@ -0,0 +1,9 @@<br>
&gt;&gt; +include udev.inc<br>
&gt;&gt; +<br>
&gt;&gt; +PR =3D &quot;r0&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +# module-init-tools from kmod_git will provide libkmod runtime<br=
>
&gt;&gt; +DEPENDS =3D &quot;module-init-tools&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +SRC_URI[md5sum] =3D &quot;1b964456177fbf48023dfee7db3a708d&quot;<=
br>
&gt;&gt; +SRC_URI[sha256sum] =3D<br>
&gt;&gt; &quot;7857ed19fafd8f3ca8de410194e8c7336e9eb8a20626ea8a4ba6449b017f=
aba4&quot;<br>
&gt;&gt;<br>
&gt;<br>
</div></div>&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/li=
stinfo/openembedded-core</a><br>
</blockquote></div><br>

--002354790f74a5522904ca33d723--
