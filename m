Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0008CCA464
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 08:18:08 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17146.1792138686389209798
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 01:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=D3nP+KU0;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 433751A1257
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 08:18:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 125216075D;
	Fri, 16 Oct 2026 08:18:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 539C910328D1B;
	Fri, 16 Oct 2026 10:18:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792138683; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mzXPvPk7M1XKN7wn4n0K9fzqKos8oIuNVKCALQLfq8w=;
	b=D3nP+KU0KO1ty+Tbk7cTP2PKSiNvONQRBM5gVLuc0wxkED4s6CpbEiIlTqnp9EvfMhy13l
	NTePI1e8UZONsMdxv8wbfU+nWJgPxfjZupLpbFjQGMAtTUaVYV4pv7DcLv0H4V8wQPjlpG
	501Va+brR7Ld5Y6ozoc21HO/OIBdA6i/Wo9mwOKjlgSCwVagJ2HufRHFZxiCZcppQ1ILRE
	XO5HaJcUUOVOqqHL6wa123qgwSGeqJYtKRQHPuf7/XNQS/VPMz8tNQ2LBd7yxEhZBB+rWN
	VEYXnGV1D6qPEuqIj+BkTVETTB9HUxz3x9lyKo7b6K52SaH1thlBjchJMVEqyw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 10:18:01 +0200
Message-Id: <DM6454M8AZXW.22GK84O103WXZ@bootlin.com>
Subject: Re: [OE-core] [PATCH 2/2] eudev: upgrade 3.2.14 -> 3.2.15
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <alex.kiernan@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261015-eudev-3-2-15-v1-0-407ba1a93edb@gmail.com>
 <20261015-eudev-3-2-15-v1-2-407ba1a93edb@gmail.com>
In-Reply-To: <20261015-eudev-3-2-15-v1-2-407ba1a93edb@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 08:18:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248004

On Thu Oct 15, 2026 at 3:08 PM CEST, Alex Kiernan via lists.openembedded.or=
g wrote:
> Drop backported commits.
>
> Changes:
>
...
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---

Hi Alex,

Thanks for the upgrade. But it looks like we can see runtime failures,
at lease on x86 qemu:

-----------------------
Central error: [    1.369029] udevd[144]: segfault at 7f9e4cea81c0 ip 00007=
f9e4d5f5643 sp 00007ffcea775058 error 4 in libc.so[3a643,7f9e4d5cd000+6e000=
] likely on CPU 0 (core 0, socket 0)
***********************
[    1.324424] VFS: Pivoted into new rootfs
[    1.325948] Freeing unused kernel image (initmem) memory: 3804K
[    1.327763] Write protecting the kernel read-only data: 30720k
[    1.329535] input: QEMU QEMU USB Tablet as /devices/pci0000:00/0000:00:1=
d.7/usb1/1-1/1-1:1.0/0003:0627:0001.0001/input/input1
[    1.332703] hid-generic 0003:0627:0001.0001: input: USB HID v0.01 Mouse =
[QEMU QEMU USB Tablet] on usb-0000:00:1d.7-1/input0
[    1.332741] Freeing unused kernel image (text/rodata gap) memory: 732K
[    1.337474] Freeing unused kernel image (rodata/data gap) memory: 1588K
[    1.339154] Run /sbin/init as init process
[    1.340184]   with arguments:
[    1.340185]     /sbin/init
[    1.340186]   with environment:
[    1.340186]     HOME=3D/
[    1.340187]     TERM=3Dlinux
[    1.356209] udevd[143]: starting version 3.2.15
[    1.360803] udevd[144]: starting eudev-3.2.15
[    1.369029] udevd[144]: segfault at 7f9e4cea81c0 ip 00007f9e4d5f5643 sp =
00007ffcea775058 error 4 in libc.so[3a643,7f9e4d5cd000+6e000] likely on CPU=
 0 (core 0, socket 0)
[    1.373539] Code: ca 74 e4 e9 69 ff ff ff 0f 1f 80 00 00 00 00 48 89 f8 =
c3 0f 1f 40 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 0f b6 17 <0f=
> b6 0e 31 c0 38 ca 74 25 eb 32 0f 1f 80 00 00 00 00 66 66 2e 0f
[    1.446848] usb 1-2: new high-speed USB device number 3 using ehci-pci
[    1.579181] input: QEMU QEMU USB Keyboard as /devices/pci0000:00/0000:00=
:1d.7/usb1/1-2/1-2:1.0/0003:0627:0001.0002/input/input2
[    1.633000] hid-generic 0003:0627:0001.0002: input: USB HID v1.11 Keyboa=
rd [QEMU QEMU USB Keyboard] on usb-0000:00:1d.7-2/input0
[  121.483345] EXT4-fs (vda): re-mounted 7b4506d6-59d8-4ca9-87c3-880a5a0dcf=
6c.

This did happen a few times in a row on rebuild:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1371
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1372
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1373
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1379

Can you have a look at the issue?

Also, about the commit message: we try to embedded a bit of the
changelog on upgrades, but this one is definitely too long. There is no
hard constraint, but a good excerpt is probably between 5 and 30 lines.
Can you trim it down a bit?

Thanks,
Mathieu

>  ....c-sync-dev_urandom-implementation-to-sys.patch | 138 ---------------=
------
>  meta/recipes-core/udev/eudev/netifnames.patch      |  17 ---
>  .../udev/{eudev_3.2.14.bb =3D> eudev_3.2.15.bb}      |   4 +-
>  3 files changed, 1 insertion(+), 158 deletions(-)
>
> diff --git a/meta/recipes-core/udev/eudev/0001-random-util.c-sync-dev_ura=
ndom-implementation-to-sys.patch b/meta/recipes-core/udev/eudev/0001-random=
-util.c-sync-dev_urandom-implementation-to-sys.patch
> deleted file mode 100644
> index 668aa731aca1..000000000000
> --- a/meta/recipes-core/udev/eudev/0001-random-util.c-sync-dev_urandom-im=
plementation-to-sys.patch
> +++ /dev/null
> @@ -1,138 +0,0 @@
> -From 95c871b7b912f39539777ac222ef7f8798bb0225 Mon Sep 17 00:00:00 2001
> -From: Masahisa Kojima <kojima.masahisa@socionext.com>
> -Date: Thu, 25 Apr 2024 17:23:10 +0900
> -Subject: [PATCH] random-util.c: sync dev_urandom implementation to
> - systemd-udev
> -
> -Current dev_urandom() assumes that reading /dev/urandom
> -will never block regardless if the random pool is fully
> -initialized or not.
> -This assumption is no longer applicable since linux kerrnel
> -enforces the /dev/urandom entropy initialization from
> -v5.18-rc2 with the commit:
> -48bff1053c17 ("random: opportunistically initialize on /dev/urandom read=
s").
> -
> -With this, when we use the linux v5.18-rc2 or later,
> -dev_urandom() will block if enough random pool is not supplied.
> -It causes the boot delay, typically 1024msec(4msec * 256 =3D 1024msec)
> -delay to fill the 256 bits entropy for the case CONFIG_HZ=3D250.
> -
> -To prevent this boot delay, this commit syncs dev_urandom()
> -implementation to the systemd-udev.
> -The systemd-udev implementation of reading /dev/urandom is as follows.
> - - Try to get random with calling getrandom(GRND_INSECURE)
> - - If kernel does not support GRND_INSECURE, fallback to GRND_NONBLOCK
> - - If enough entropy is not supplied, fallback to reading /dev/urandom,
> -   this will block when the kernel version is v5.18-rc2 or later
> -
> -With this modification, dev_urandom() tries not to block
> -as much as possible.
> -
> -This modification still keeps the backword compatibility,
> -dev_random() will never block if the commit(48bff1053c17) is not
> -applied to the linux kernel, the behavior is same as before
> -in this case.
> -
> -Upstream-Status: Backport [a49a3aaa460add6ae7ea208b4cac630e56fe1180]
> -Signed-off-by: Masahisa Kojima <kojima.masahisa@socionext.com>
> ----
> - src/shared/missing.h     |  4 +++
> - src/shared/random-util.c | 70 ++++++++++++++++++----------------------
> - 2 files changed, 35 insertions(+), 39 deletions(-)
> -
> -diff --git a/src/shared/missing.h b/src/shared/missing.h
> -index 1967840cdbf3..1caec0f9207c 100644
> ---- a/src/shared/missing.h
> -+++ b/src/shared/missing.h
> -@@ -79,6 +79,10 @@ static inline int getrandom(void *buffer, size_t coun=
t, unsigned flags) {
> - #define GRND_RANDOM 0x0002
> - #endif
> -=20
> -+#ifndef GRND_INSECURE
> -+#define GRND_INSECURE 0x0004
> -+#endif
> -+
> - #ifndef BTRFS_IOCTL_MAGIC
> - #define BTRFS_IOCTL_MAGIC 0x94
> - #endif
> -diff --git a/src/shared/random-util.c b/src/shared/random-util.c
> -index 01a28c8ef4e9..852b00e4ce2b 100644
> ---- a/src/shared/random-util.c
> -+++ b/src/shared/random-util.c
> -@@ -31,45 +31,37 @@
> - #include "util.h"
> -=20
> - int dev_urandom(void *p, size_t n) {
> --        static int have_syscall =3D -1;
> --
> --        _cleanup_close_ int fd =3D -1;
> --        int r;
> --
> --        /* Gathers some randomness from the kernel. This call will
> --         * never block, and will always return some data from the
> --         * kernel, regardless if the random pool is fully initialized
> --         * or not. It thus makes no guarantee for the quality of the
> --         * returned entropy, but is good enough for or usual usecases
> --         * of seeding the hash functions for hashtable */
> --
> --        /* Use the getrandom() syscall unless we know we don't have
> --         * it, or when the requested size is too large for it. */
> --        if (have_syscall !=3D 0 || (size_t) (int) n !=3D n) {
> --                r =3D getrandom(p, n, GRND_NONBLOCK);
> --                if (r =3D=3D (int) n) {
> --                        have_syscall =3D true;
> --                        return 0;
> --                }
> --
> --                if (r < 0) {
> --                        if (errno =3D=3D ENOSYS)
> --                                /* we lack the syscall, continue with
> --                                 * reading from /dev/urandom */
> --                                have_syscall =3D false;
> --                        else if (errno =3D=3D EAGAIN)
> --                                /* not enough entropy for now. Let's
> --                                 * remember to use the syscall the
> --                                 * next time, again, but also read
> --                                 * from /dev/urandom for now, which
> --                                 * doesn't care about the current
> --                                 * amount of entropy.  */
> --                                have_syscall =3D true;
> --                        else
> --                                return -errno;
> --                } else
> --                        /* too short read? */
> --                        return -ENODATA;
> -+        static bool have_getrandom =3D true, have_grndinsecure =3D true=
;
> -+        _cleanup_close_ int fd =3D -EBADF;
> -+
> -+        if (n =3D=3D 0)
> -+                return 0;
> -+
> -+        for (;;) {
> -+                ssize_t l;
> -+
> -+                if (!have_getrandom)
> -+                        break;
> -+
> -+                l =3D getrandom(p, n, have_grndinsecure ? GRND_INSECURE=
 : GRND_NONBLOCK);
> -+                if (l > 0) {
> -+                        if ((size_t) l =3D=3D n)
> -+                                return 0; /* Done reading, success. */
> -+                        p =3D (uint8_t *) p + l;
> -+                        n -=3D l;
> -+                        continue; /* Interrupted by a signal; keep goin=
g. */
> -+                } else if (l =3D=3D 0)
> -+                        break; /* Weird, so fallback to /dev/urandom. *=
/
> -+                else if (errno =3D=3D ENOSYS) {
> -+                        have_getrandom =3D false;
> -+                        break; /* No syscall, so fallback to /dev/urand=
om. */
> -+                } else if (errno =3D=3D EINVAL && have_grndinsecure) {
> -+                        have_grndinsecure =3D false;
> -+                        continue; /* No GRND_INSECURE; fallback to GRND=
_NONBLOCK. */
> -+                } else if (errno =3D=3D EAGAIN && !have_grndinsecure)
> -+                        break; /* Will block, but no GRND_INSECURE, so =
fallback to /dev/urandom. */
> -+
> -+                break; /* Unexpected, so just give up and fallback to /=
dev/urandom. */
> -         }
> -=20
> -         fd =3D open("/dev/urandom", O_RDONLY|O_CLOEXEC|O_NOCTTY);
> diff --git a/meta/recipes-core/udev/eudev/netifnames.patch b/meta/recipes=
-core/udev/eudev/netifnames.patch
> deleted file mode 100644
> index 4f8e54d12d4a..000000000000
> --- a/meta/recipes-core/udev/eudev/netifnames.patch
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -eudev: consider ID_NET_NAME_MAC as an interface name
> -
> -eudev might not create names based on slot or path.
> -
> -Upstream-Status: Backport [github.com/eudev-project/eudev/pull/274]
> -
> -Signed-off-by: Joe Slater <joe.slater@windriver.com>
> -
> ---- a/rules/80-net-name-slot.rules
> -+++ b/rules/80-net-name-slot.rules
> -@@ -10,5 +10,6 @@ ENV{net.ifnames}=3D=3D"0", GOTO=3D"net_name_sl
> - NAME=3D=3D"", ENV{ID_NET_NAME_ONBOARD}!=3D"", NAME=3D"$env{ID_NET_NAME_=
ONBOARD}"
> - NAME=3D=3D"", ENV{ID_NET_NAME_SLOT}!=3D"", NAME=3D"$env{ID_NET_NAME_SLO=
T}"
> - NAME=3D=3D"", ENV{ID_NET_NAME_PATH}!=3D"", NAME=3D"$env{ID_NET_NAME_PAT=
H}"
> -+NAME=3D=3D"", ENV{ID_NET_NAME_MAC}!=3D"", NAME=3D"$env{ID_NET_NAME_MAC}=
"
> -=20
> - LABEL=3D"net_name_slot_end"
> diff --git a/meta/recipes-core/udev/eudev_3.2.14.bb b/meta/recipes-core/u=
dev/eudev_3.2.15.bb
> similarity index 93%
> rename from meta/recipes-core/udev/eudev_3.2.14.bb
> rename to meta/recipes-core/udev/eudev_3.2.15.bb
> index 3e4972694ac0..2ff2370bcb5e 100644
> --- a/meta/recipes-core/udev/eudev_3.2.14.bb
> +++ b/meta/recipes-core/udev/eudev_3.2.15.bb
> @@ -10,13 +10,11 @@ DEPENDS =3D "gperf-native"
>  PROVIDES =3D "udev"
> =20
>  SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
> -           file://netifnames.patch \
>             file://init \
>             file://local.rules \
> -           file://0001-random-util.c-sync-dev_urandom-implementation-to-=
sys.patch \
>             "
> =20
> -SRC_URI[sha256sum] =3D "8da4319102f24abbf7fff5ce9c416af848df163b29590e66=
6d334cc1927f006f"
> +SRC_URI[sha256sum] =3D "eb69809fc0d1187f2463ab2149c53aa9f42a78e59f14ebea=
68eae6cb6b4fc1c3"
> =20
>  GITHUB_BASE_URI =3D "https://github.com/eudev-project/eudev/releases"
> =20




--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


