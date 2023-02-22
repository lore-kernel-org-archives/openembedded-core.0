Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AAB9C61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 15:28:28 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.11688.1677079704972108358
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 07:28:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NFA+XOL4;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id m14-20020a7bce0e000000b003e00c739ce4so5603594wmc.5
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 07:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bONGZ1KvZluChLztEP1v2vV3Vvi9o/C3bFOQY36JyI0=;
        b=NFA+XOL4xGmcE0T2TBGyD5UWcEdm2aLJgO+1F5myRHr8RiHJpwp+bOcsEkyIWJl2bu
         BA/n+Fjpl9+DWMZIN6jF7Z2L7WB36VzFUOOymPsEUWUusxEyk2X5D7S7RUAKXNL5BF+L
         AGL2i7KmXIDHbQXePMhweQh/eTGM1w23qwLVSpq7LSRsoYi23QEYOTv3PUN/Ll8Vlzqw
         LWKfYQ4mSPUwsxG3VgayfbBlUqqLTFTb8eDrH1WS+cWvs75poVTH346cIyR+WCsyMvHt
         sS0Pwa4eLiMIo+DtzHDhA92xev+vsBSrhStZFI9CvvY+gc30nST6PIQHzs3/O+M7CcL9
         IRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bONGZ1KvZluChLztEP1v2vV3Vvi9o/C3bFOQY36JyI0=;
        b=NXAA2Ua4hSfBPjV1LeEhWwnxDbE8GkCRV1JP8MjdlEmg4Yu0sCdFBmZuurii9qNJrd
         qVRrXS1tm9cbx95N9j0gBIuZto9GZqMmtSLXFDO3+4pjrJUL6eXPmn9faiQwRHCEH3cz
         CIM7z5tN0gAo2QaMi4QDDLBk7itumIXb6SELsT1ry6C/Q37HivkUKJs/9LjWqexOvawF
         wi0UYw/tL9dOYwCecop905BGlBYRB804g2MKgizdPdWlK/D0DwshIJDC1LbunfekUxCn
         XhCCVoHsC9o/FNOdSPW1OPVbEQ57ybhiC/EWz1Wt9OTEvyFZZ1yih8OCUwzLdiKzZHH3
         pejg==
X-Gm-Message-State: AO0yUKU+0vLL2US1j6rDZBs+uTYZmUxX565v5x1kcvrySSb2C5MHVIYq
	DmIPIyWA6P4OQU2iPfgQvhw8OMul08nsefbrLWs=
X-Google-Smtp-Source: AK7set+6CU/VavlqbvWBABWvOSTNx6VtzEEsaReup30SttgGcZE8OwzbdyzNqJfurYa1MsQUUFvc7Y/wHAjSGCcERgM=
X-Received: by 2002:a05:600c:1e85:b0:3dc:546c:b2ec with SMTP id
 be5-20020a05600c1e8500b003dc546cb2ecmr1863880wmb.32.1677079703395; Wed, 22
 Feb 2023 07:28:23 -0800 (PST)
MIME-Version: 1.0
References: <17462D99D28A7B3C.10470@lists.openembedded.org>
In-Reply-To: <17462D99D28A7B3C.10470@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 22 Feb 2023 16:28:10 +0100
Message-ID: <CA+chaQfpOv5J3OFjq2+OEdfth6Nmk34FEq+aPVAj+9wsaYc58g@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv2] qemu: Fix building with latest glibc 2.36
To: Martin.Jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org, Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="000000000000fb211905f54b8bfa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 15:28:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177574

--000000000000fb211905f54b8bfa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I've seen this build issue on my gentoo builder today with qemu-native, so
I've removed the stray cross.patch and sent v2.

Then RP had good question how to reproduce this failure and I've checked
when I've updated glibc in gentoo for last time and it was a month ago (and
I've rebuilt qemu-native few time since then).

So in the end it was linux-libc-headers upgrade to 6.2 from yesterday
(sys-kernel/linux-headers-6.2 in gentoo) which caused this for me (if I
downgrade to 6.1 I can build qemu-native again even without this patch).

Joel: Should I send v3 with updated commit message or will you do it?

Regards,

On Wed, Feb 22, 2023 at 4:00 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:

> From: Joel Stanley <joel@jms.id.au>
>
> When building native qemu with glibc 2.36 (including latest changes from
> the glibc stable branch), qemu fails to build:
>
>  In file included from /usr/include/linux/btrfs.h:29,
>                   from ../qemu-7.2.0/linux-user/syscall.c:165:
>  /usr/include/linux/fs.h:50:8: error: redefinition of =E2=80=98struct
> file_clone_range=E2=80=99
>     50 | struct file_clone_range {
>        |        ^~~~~~~~~~~~~~~~
>  ../qemu-7.2.0/linux-user/syscall.c:129:8: note: originally defined here
>    129 | struct file_clone_range {
>        |        ^~~~~~~~~~~~~~~~
>
> Backport changes to linux-user that remove the local copy of struct
> file_clone_range.
>
> Patches from
> https://lore.kernel.org/qemu-devel/20230110174901.2580297-1-berrange@redh=
at.com/
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Tested-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |  2 +
>  ...er-add-more-compat-ioctl-definitions.patch | 69 ++++++++++++++++
>  ...r-fix-compat-with-glibc-2.36-sys-mou.patch | 78 +++++++++++++++++++
>  3 files changed, 149 insertions(+)
>  create mode 100644
> meta/recipes-devtools/qemu/qemu/0001-Revert-linux-user-add-more-compat-io=
ctl-definitions.patch
>  create mode 100644
> meta/recipes-devtools/qemu/qemu/0002-Revert-linux-user-fix-compat-with-gl=
ibc-2.36-sys-mou.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc
> b/meta/recipes-devtools/qemu/qemu.inc
> index 92828e8f2d..1e768b560d 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -30,6 +30,8 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz
> \
>
> file://0001-contrib-vhost-user-blk-Replace-lseek64-with-lseek.patch \
>
> file://0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch \
>
> file://0001-configure-Fix-check-tcg-not-executing-any-tests.patch \
> +
>  file://0001-Revert-linux-user-add-more-compat-ioctl-definitions.patch \
> +
>  file://0002-Revert-linux-user-fix-compat-with-glibc-2.36-sys-mou.patch \
>             "
>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>
> diff --git
> a/meta/recipes-devtools/qemu/qemu/0001-Revert-linux-user-add-more-compat-=
ioctl-definitions.patch
> b/meta/recipes-devtools/qemu/qemu/0001-Revert-linux-user-add-more-compat-=
ioctl-definitions.patch
> new file mode 100644
> index 0000000000..cd8121fed1
> --- /dev/null
> +++
> b/meta/recipes-devtools/qemu/qemu/0001-Revert-linux-user-add-more-compat-=
ioctl-definitions.patch
> @@ -0,0 +1,69 @@
> +From afa96c55f2c270405de8984e2466067bbb44c0e4 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D <berrange@=
redhat.com>
> +Date: Tue, 10 Jan 2023 12:49:00 -0500
> +Subject: [PATCH] Revert "linux-user: add more compat ioctl definitions"
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +This reverts commit c5495f4ecb0cdaaf2e9dddeb48f1689cdb520ca0.
> +
> +glibc has fixed (in 2.36.9000-40-g774058d729) the problem
> +that caused a clash when both sys/mount.h annd linux/mount.h
> +are included, and backported this to the 2.36 stable release
> +too:
> +
> +
> https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.=
h.3E_and_.3Csys.2Fmount.h.3E
> +
> +It is saner for QEMU to remove the workaround it applied for
> +glibc 2.36 and expect distros to ship the 2.36 maint release
> +with the fix. This avoids needing to add a further workaround
> +to QEMU to deal with the fact that linux/brtfs.h now also pulls
> +in linux/mount.h via linux/fs.h since Linux 6.1
> +
> +Upstream-Status: Backport from v8.0 (master)
> +
> +Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> +Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> +Link:
> https://lore.kernel.org/r/20230110174901.2580297-2-berrange@redhat.com
> +Signed-off-by: Joel Stanley <joel@jms.id.au>
> +---
> + linux-user/syscall.c | 25 -------------------------
> + 1 file changed, 25 deletions(-)
> +
> +diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> +index f95a6161e..510de8edc 100644
> +--- a/linux-user/syscall.c
> ++++ b/linux-user/syscall.c
> +@@ -111,31 +111,6 @@
> + #define FS_IOC32_SETFLAGS              _IOW('f', 2, int)
> + #define FS_IOC32_GETVERSION            _IOR('v', 1, int)
> + #define FS_IOC32_SETVERSION            _IOW('v', 2, int)
> +-
> +-#define BLKGETSIZE64 _IOR(0x12,114,size_t)
> +-#define BLKDISCARD _IO(0x12,119)
> +-#define BLKIOMIN _IO(0x12,120)
> +-#define BLKIOOPT _IO(0x12,121)
> +-#define BLKALIGNOFF _IO(0x12,122)
> +-#define BLKPBSZGET _IO(0x12,123)
> +-#define BLKDISCARDZEROES _IO(0x12,124)
> +-#define BLKSECDISCARD _IO(0x12,125)
> +-#define BLKROTATIONAL _IO(0x12,126)
> +-#define BLKZEROOUT _IO(0x12,127)
> +-
> +-#define FIBMAP     _IO(0x00,1)
> +-#define FIGETBSZ   _IO(0x00,2)
> +-
> +-struct file_clone_range {
> +-        __s64 src_fd;
> +-        __u64 src_offset;
> +-        __u64 src_length;
> +-        __u64 dest_offset;
> +-};
> +-
> +-#define FICLONE         _IOW(0x94, 9, int)
> +-#define FICLONERANGE    _IOW(0x94, 13, struct file_clone_range)
> +-
> + #else
> + #include <linux/fs.h>
> + #endif
> diff --git
> a/meta/recipes-devtools/qemu/qemu/0002-Revert-linux-user-fix-compat-with-=
glibc-2.36-sys-mou.patch
> b/meta/recipes-devtools/qemu/qemu/0002-Revert-linux-user-fix-compat-with-=
glibc-2.36-sys-mou.patch
> new file mode 100644
> index 0000000000..d754f21ad4
> --- /dev/null
> +++
> b/meta/recipes-devtools/qemu/qemu/0002-Revert-linux-user-fix-compat-with-=
glibc-2.36-sys-mou.patch
> @@ -0,0 +1,78 @@
> +From e95c0a42940ca1cf763ca3374b36a9be030039d7 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D <berrange@=
redhat.com>
> +Date: Tue, 10 Jan 2023 12:49:01 -0500
> +Subject: [PATCH] Revert "linux-user: fix compat with glibc >=3D 2.36
> + sys/mount.h"
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +This reverts commit 3cd3df2a9584e6f753bb62a0028bd67124ab5532.
> +
> +glibc has fixed (in 2.36.9000-40-g774058d729) the problem
> +that caused a clash when both sys/mount.h annd linux/mount.h
> +are included, and backported this to the 2.36 stable release
> +too:
> +
> +
> https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.=
h.3E_and_.3Csys.2Fmount.h.3E
> +
> +It is saner for QEMU to remove the workaround it applied for
> +glibc 2.36 and expect distros to ship the 2.36 maint release
> +with the fix. This avoids needing to add a further workaround
> +to QEMU to deal with the fact that linux/brtfs.h now also pulls
> +in linux/mount.h via linux/fs.h since Linux 6.1
> +
> +Upstream-Status: Backport from v8.0 (master)
> +
> +Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> +Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> +Link:
> https://lore.kernel.org/r/20230110174901.2580297-3-berrange@redhat.com
> +Signed-off-by: Joel Stanley <joel@jms.id.au>
> +---
> + linux-user/syscall.c | 18 ------------------
> + meson.build          |  2 --
> + 2 files changed, 20 deletions(-)
> +
> +diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> +index 510de8edc..13a67b84b 100644
> +--- a/linux-user/syscall.c
> ++++ b/linux-user/syscall.c
> +@@ -95,25 +95,7 @@
> + #include <linux/soundcard.h>
> + #include <linux/kd.h>
> + #include <linux/mtio.h>
> +-
> +-#ifdef HAVE_SYS_MOUNT_FSCONFIG
> +-/*
> +- * glibc >=3D 2.36 linux/mount.h conflicts with sys/mount.h,
> +- * which in turn prevents use of linux/fs.h. So we have to
> +- * define the constants ourselves for now.
> +- */
> +-#define FS_IOC_GETFLAGS                _IOR('f', 1, long)
> +-#define FS_IOC_SETFLAGS                _IOW('f', 2, long)
> +-#define FS_IOC_GETVERSION              _IOR('v', 1, long)
> +-#define FS_IOC_SETVERSION              _IOW('v', 2, long)
> +-#define FS_IOC_FIEMAP                  _IOWR('f', 11, struct fiemap)
> +-#define FS_IOC32_GETFLAGS              _IOR('f', 1, int)
> +-#define FS_IOC32_SETFLAGS              _IOW('f', 2, int)
> +-#define FS_IOC32_GETVERSION            _IOR('v', 1, int)
> +-#define FS_IOC32_SETVERSION            _IOW('v', 2, int)
> +-#else
> + #include <linux/fs.h>
> +-#endif
> + #include <linux/fd.h>
> + #if defined(CONFIG_FIEMAP)
> + #include <linux/fiemap.h>
> +diff --git a/meson.build b/meson.build
> +index e44432370..f37ba4114 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -2032,8 +2032,6 @@ config_host_data.set('HAVE_OPTRESET',
> +                      cc.has_header_symbol('getopt.h', 'optreset'))
> + config_host_data.set('HAVE_IPPROTO_MPTCP',
> +                      cc.has_header_symbol('netinet/in.h',
> 'IPPROTO_MPTCP'))
> +-config_host_data.set('HAVE_SYS_MOUNT_FSCONFIG',
> +-                     cc.has_header_symbol('sys/mount.h',
> 'FSCONFIG_SET_FLAG'))
> +
> + # has_member
> + config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_ID',
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177573):
> https://lists.openembedded.org/g/openembedded-core/message/177573
> Mute This Topic: https://lists.openembedded.org/mt/97161162/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fb211905f54b8bfa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div>I&#39;ve seen this build issu=
e on my gentoo builder today with qemu-native, so I&#39;ve removed the stra=
y cross.patch and sent v2.<div><br></div><div>Then RP had good question how=
 to reproduce this failure and I&#39;ve checked when I&#39;ve updated glibc=
 in gentoo for last time and it was a month ago (and I&#39;ve rebuilt qemu-=
native few time since then).</div><div><br></div><div>So in the end it was =
linux-libc-headers upgrade to 6.2 from yesterday (sys-kernel/linux-headers-=
6.2 in gentoo) which caused this for me (if I downgrade to 6.1 I can build =
qemu-native again even without this patch).</div><div><br></div><div>Joel: =
Should I send v3 with updated commit message or will you do it?</div><div><=
br></div><div>Regards,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Feb 22, 2023 at 4:00 PM Martin Jansa =
via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &l=
t;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.=
com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">From: Joel Stanley &lt;<a href=3D"mailto:joel@jms=
.id.au" target=3D"_blank">joel@jms.id.au</a>&gt;<br>
<br>
When building native qemu with glibc 2.36 (including latest changes from<br=
>
the glibc stable branch), qemu fails to build:<br>
<br>
=C2=A0In file included from /usr/include/linux/btrfs.h:29,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from ../qemu=
-7.2.0/linux-user/syscall.c:165:<br>
=C2=A0/usr/include/linux/fs.h:50:8: error: redefinition of =E2=80=98struct =
file_clone_range=E2=80=99<br>
=C2=A0 =C2=A0 50 | struct file_clone_range {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~<br=
>
=C2=A0../qemu-7.2.0/linux-user/syscall.c:129:8: note: originally defined he=
re<br>
=C2=A0 =C2=A0129 | struct file_clone_range {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~<br=
>
<br>
Backport changes to linux-user that remove the local copy of struct<br>
file_clone_range.<br>
<br>
Patches from <a href=3D"https://lore.kernel.org/qemu-devel/20230110174901.2=
580297-1-berrange@redhat.com/" rel=3D"noreferrer" target=3D"_blank">https:/=
/lore.kernel.org/qemu-devel/20230110174901.2580297-1-berrange@redhat.com/</=
a><br>
<br>
Signed-off-by: Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au" target=3D=
"_blank">joel@jms.id.au</a>&gt;<br>
Tested-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" targe=
t=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/qemu/qemu.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 2 +<br>
=C2=A0...er-add-more-compat-ioctl-definitions.patch | 69 ++++++++++++++++<b=
r>
=C2=A0...r-fix-compat-with-glibc-2.36-sys-mou.patch | 78 ++++++++++++++++++=
+<br>
=C2=A03 files changed, 149 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/qemu/qemu/0001-Revert-linux-=
user-add-more-compat-ioctl-definitions.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/qemu/qemu/0002-Revert-linux-=
user-fix-compat-with-glibc-2.36-sys-mou.patch<br>
<br>
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc<br>
index 92828e8f2d..1e768b560d 100644<br>
--- a/meta/recipes-devtools/qemu/qemu.inc<br>
+++ b/meta/recipes-devtools/qemu/qemu.inc<br>
@@ -30,6 +30,8 @@ SRC_URI =3D &quot;<a href=3D"https://download.qemu.org/$%=
7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://dow=
nload.qemu.org/${BPN}-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-contrib-vhost-user-bl=
k-Replace-lseek64-with-lseek.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-linux-user-Replace-us=
e-of-lfs64-related-functions-an.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-configure-Fix-check-t=
cg-not-executing-any-tests.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Revert-linux-user-add=
-more-compat-ioctl-definitions.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Revert-linux-user-fix=
-compat-with-glibc-2.36-sys-mou.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;qemu-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar&=
quot;<br>
<br>
diff --git a/meta/recipes-devtools/qemu/qemu/0001-Revert-linux-user-add-mor=
e-compat-ioctl-definitions.patch b/meta/recipes-devtools/qemu/qemu/0001-Rev=
ert-linux-user-add-more-compat-ioctl-definitions.patch<br>
new file mode 100644<br>
index 0000000000..cd8121fed1<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/qemu/qemu/0001-Revert-linux-user-add-more-compa=
t-ioctl-definitions.patch<br>
@@ -0,0 +1,69 @@<br>
+From afa96c55f2c270405de8984e2466067bbb44c0e4 Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D &lt;<a href=
=3D"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&g=
t;<br>
+Date: Tue, 10 Jan 2023 12:49:00 -0500<br>
+Subject: [PATCH] Revert &quot;linux-user: add more compat ioctl definition=
s&quot;<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+This reverts commit c5495f4ecb0cdaaf2e9dddeb48f1689cdb520ca0.<br>
+<br>
+glibc has fixed (in 2.36.9000-40-g774058d729) the problem<br>
+that caused a clash when both sys/mount.h annd linux/mount.h<br>
+are included, and backported this to the 2.36 stable release<br>
+too:<br>
+<br>
+=C2=A0 <a href=3D"https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_=
.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E" rel=3D"noreferrer" target=3D=
"_blank">https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2=
Fmount.h.3E_and_.3Csys.2Fmount.h.3E</a><br>
+<br>
+It is saner for QEMU to remove the workaround it applied for<br>
+glibc 2.36 and expect distros to ship the 2.36 maint release<br>
+with the fix. This avoids needing to add a further workaround<br>
+to QEMU to deal with the fact that linux/brtfs.h now also pulls<br>
+in linux/mount.h via linux/fs.h since Linux 6.1<br>
+<br>
+Upstream-Status: Backport from v8.0 (master)<br>
+<br>
+Signed-off-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redh=
at.com" target=3D"_blank">berrange@redhat.com</a>&gt;<br>
+Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau=
@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
+Link: <a href=3D"https://lore.kernel.org/r/20230110174901.2580297-2-berran=
ge@redhat.com" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org=
/r/20230110174901.2580297-2-berrange@redhat.com</a><br>
+Signed-off-by: Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au" target=
=3D"_blank">joel@jms.id.au</a>&gt;<br>
+---<br>
+ linux-user/syscall.c | 25 -------------------------<br>
+ 1 file changed, 25 deletions(-)<br>
+<br>
+diff --git a/linux-user/syscall.c b/linux-user/syscall.c<br>
+index f95a6161e..510de8edc 100644<br>
+--- a/linux-user/syscall.c<br>
++++ b/linux-user/syscall.c<br>
+@@ -111,31 +111,6 @@<br>
+ #define FS_IOC32_SETFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 _IOW(&#39;f&#39;, 2, int)<br>
+ #define FS_IOC32_GETVERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _IOR=
(&#39;v&#39;, 1, int)<br>
+ #define FS_IOC32_SETVERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _IOW=
(&#39;v&#39;, 2, int)<br>
+-<br>
+-#define BLKGETSIZE64 _IOR(0x12,114,size_t)<br>
+-#define BLKDISCARD _IO(0x12,119)<br>
+-#define BLKIOMIN _IO(0x12,120)<br>
+-#define BLKIOOPT _IO(0x12,121)<br>
+-#define BLKALIGNOFF _IO(0x12,122)<br>
+-#define BLKPBSZGET _IO(0x12,123)<br>
+-#define BLKDISCARDZEROES _IO(0x12,124)<br>
+-#define BLKSECDISCARD _IO(0x12,125)<br>
+-#define BLKROTATIONAL _IO(0x12,126)<br>
+-#define BLKZEROOUT _IO(0x12,127)<br>
+-<br>
+-#define FIBMAP=C2=A0 =C2=A0 =C2=A0_IO(0x00,1)<br>
+-#define FIGETBSZ=C2=A0 =C2=A0_IO(0x00,2)<br>
+-<br>
+-struct file_clone_range {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 __s64 src_fd;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u64 src_offset;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u64 src_length;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u64 dest_offset;<br>
+-};<br>
+-<br>
+-#define FICLONE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_IOW(0x94, 9, int)<br>
+-#define FICLONERANGE=C2=A0 =C2=A0 _IOW(0x94, 13, struct file_clone_range)=
<br>
+-<br>
+ #else<br>
+ #include &lt;linux/fs.h&gt;<br>
+ #endif<br>
diff --git a/meta/recipes-devtools/qemu/qemu/0002-Revert-linux-user-fix-com=
pat-with-glibc-2.36-sys-mou.patch b/meta/recipes-devtools/qemu/qemu/0002-Re=
vert-linux-user-fix-compat-with-glibc-2.36-sys-mou.patch<br>
new file mode 100644<br>
index 0000000000..d754f21ad4<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/qemu/qemu/0002-Revert-linux-user-fix-compat-wit=
h-glibc-2.36-sys-mou.patch<br>
@@ -0,0 +1,78 @@<br>
+From e95c0a42940ca1cf763ca3374b36a9be030039d7 Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D &lt;<a href=
=3D"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&g=
t;<br>
+Date: Tue, 10 Jan 2023 12:49:01 -0500<br>
+Subject: [PATCH] Revert &quot;linux-user: fix compat with glibc &gt;=3D 2.=
36<br>
+ sys/mount.h&quot;<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+This reverts commit 3cd3df2a9584e6f753bb62a0028bd67124ab5532.<br>
+<br>
+glibc has fixed (in 2.36.9000-40-g774058d729) the problem<br>
+that caused a clash when both sys/mount.h annd linux/mount.h<br>
+are included, and backported this to the 2.36 stable release<br>
+too:<br>
+<br>
+=C2=A0 <a href=3D"https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_=
.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E" rel=3D"noreferrer" target=3D=
"_blank">https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2=
Fmount.h.3E_and_.3Csys.2Fmount.h.3E</a><br>
+<br>
+It is saner for QEMU to remove the workaround it applied for<br>
+glibc 2.36 and expect distros to ship the 2.36 maint release<br>
+with the fix. This avoids needing to add a further workaround<br>
+to QEMU to deal with the fact that linux/brtfs.h now also pulls<br>
+in linux/mount.h via linux/fs.h since Linux 6.1<br>
+<br>
+Upstream-Status: Backport from v8.0 (master)<br>
+<br>
+Signed-off-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redh=
at.com" target=3D"_blank">berrange@redhat.com</a>&gt;<br>
+Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau=
@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
+Link: <a href=3D"https://lore.kernel.org/r/20230110174901.2580297-3-berran=
ge@redhat.com" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org=
/r/20230110174901.2580297-3-berrange@redhat.com</a><br>
+Signed-off-by: Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au" target=
=3D"_blank">joel@jms.id.au</a>&gt;<br>
+---<br>
+ linux-user/syscall.c | 18 ------------------<br>
+ meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 --<br>
+ 2 files changed, 20 deletions(-)<br>
+<br>
+diff --git a/linux-user/syscall.c b/linux-user/syscall.c<br>
+index 510de8edc..13a67b84b 100644<br>
+--- a/linux-user/syscall.c<br>
++++ b/linux-user/syscall.c<br>
+@@ -95,25 +95,7 @@<br>
+ #include &lt;linux/soundcard.h&gt;<br>
+ #include &lt;linux/kd.h&gt;<br>
+ #include &lt;linux/mtio.h&gt;<br>
+-<br>
+-#ifdef HAVE_SYS_MOUNT_FSCONFIG<br>
+-/*<br>
+- * glibc &gt;=3D 2.36 linux/mount.h conflicts with sys/mount.h,<br>
+- * which in turn prevents use of linux/fs.h. So we have to<br>
+- * define the constants ourselves for now.<br>
+- */<br>
+-#define FS_IOC_GETFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 _IOR(&#39;f&#39;, 1, long)<br>
+-#define FS_IOC_SETFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 _IOW(&#39;f&#39;, 2, long)<br>
+-#define FS_IOC_GETVERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 _IOR(&#39;v&#39;, 1, long)<br>
+-#define FS_IOC_SETVERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 _IOW(&#39;v&#39;, 2, long)<br>
+-#define FS_IOC_FIEMAP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 _IOWR(&#39;f&#39;, 11, struct fiemap)<br>
+-#define FS_IOC32_GETFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 _IOR(&#39;f&#39;, 1, int)<br>
+-#define FS_IOC32_SETFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 _IOW(&#39;f&#39;, 2, int)<br>
+-#define FS_IOC32_GETVERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _IOR=
(&#39;v&#39;, 1, int)<br>
+-#define FS_IOC32_SETVERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _IOW=
(&#39;v&#39;, 2, int)<br>
+-#else<br>
+ #include &lt;linux/fs.h&gt;<br>
+-#endif<br>
+ #include &lt;linux/fd.h&gt;<br>
+ #if defined(CONFIG_FIEMAP)<br>
+ #include &lt;linux/fiemap.h&gt;<br>
+diff --git a/meson.build b/meson.build<br>
+index e44432370..f37ba4114 100644<br>
+--- a/meson.build<br>
++++ b/meson.build<br>
+@@ -2032,8 +2032,6 @@ config_host_data.set(&#39;HAVE_OPTRESET&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 cc.has_header_symbol(&#39;getopt.h&#39;, &#39;optreset&#39;))<br>
+ config_host_data.set(&#39;HAVE_IPPROTO_MPTCP&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 cc.has_header_symbol(&#39;netinet/in.h&#39;, &#39;IPPROTO_MPTCP&#39;))<=
br>
+-config_host_data.set(&#39;HAVE_SYS_MOUNT_FSCONFIG&#39;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cc.has_header_symbol(&#39;sys/mount.h&#39;, &#39;FSCONFIG_SET_FLAG&#39;)=
)<br>
+ <br>
+ # has_member<br>
+ config_host_data.set(&#39;HAVE_SIGEV_NOTIFY_THREAD_ID&#39;,<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#177573): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/177573" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/177573</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97161162/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97161162/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000fb211905f54b8bfa--

