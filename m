Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id D9E4160601
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 03:07:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="91953396"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 May 2015 11:03:17 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t4B35q7X008522;
	Mon, 11 May 2015 11:05:52 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Mon, 11 May 2015 11:07:19 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] glibc_2.21.bb: Fix LSB bugs #3033
Thread-Index: AQHQiasrKGJ3ZL8n90e9uPR4z1e3g512GQpQ
Date: Mon, 11 May 2015 03:07:18 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E8739014E7@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1431075674-1688-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<6B7ABF87-0779-417E-88C3-C1FA1C96393E@gmail.com>
In-Reply-To: <6B7ABF87-0779-417E-88C3-C1FA1C96393E@gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.25]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc_2.21.bb: Fix LSB bugs #3033
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
X-List-Received-Date: Mon, 11 May 2015 03:07:23 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: Khem Raj [mailto:raj.khem@gmail.com]
> Sent: Saturday, May 09, 2015 12:21 AM
> To: Li, Xin/=1B$BM{=1B(B =1B$B6U=1B(B
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] glibc_2.21.bb: Fix LSB bugs #3033
>=20
>=20
> This patch is ok. However two questions
> 1. what kernel version do you see it on and is kernel piece fixed too or =
is not
> required 2. Has this been submitted to glibc ?
>=20

I see it on the kernel version 3.14.28 and the kernel piece is not fixed.
also I have not send the patch to glibc.

Cheers,

Li xin

> > Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> > ---
> > .../glibc/glibc/tcsetattr.c-Fix-LSB-NG-Cases.patch | 69 +++++++++++++++=
+++++++
> > meta/recipes-core/glibc/glibc_2.21.bb              |  1 +
> > 2 files changed, 70 insertions(+)
> > create mode 100644
> > meta/recipes-core/glibc/glibc/tcsetattr.c-Fix-LSB-NG-Cases.patch
> >
> > diff --git
> > a/meta/recipes-core/glibc/glibc/tcsetattr.c-Fix-LSB-NG-Cases.patch
> > b/meta/recipes-core/glibc/glibc/tcsetattr.c-Fix-LSB-NG-Cases.patch
> > new file mode 100644
> > index 0000000..df0e61d
> > --- /dev/null
> > +++ b/meta/recipes-core/glibc/glibc/tcsetattr.c-Fix-LSB-NG-Cases.patch
> > @@ -0,0 +1,69 @@
> > +From 9022ee975265b65f59782ea92b59eccc95774a88 Mon Sep 17 00:00:00
> > +2001
> > +From: Li xin <lixin.fnst@cn.fujitsu.com>
> > +Date: Fri, 8 May 2015 13:51:30 +0900
> > +Subject: [PATCH] tcsetattr.c: Fix LSB NG Cases
> > +
> > +/tset/POSIX.os/devclass/tcgetattr/T.tcgetattr 1 2
> > +/tset/POSIX.os/devclass/c_iflag/T.c_iflag 6 7 8 9
> > +
> > +This patch is from Fedora.
> > +
> > +Upstream-Status: pending.
> > +
> > +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> > +---
> > + sysdeps/unix/sysv/linux/tcsetattr.c | 32
> > ++++++++++++++++++++++++++++++++-
> > + 1 file changed, 31 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/sysdeps/unix/sysv/linux/tcsetattr.c
> > +b/sysdeps/unix/sysv/linux/tcsetattr.c
> > +index d7afc63..7cb2c61 100644
> > +--- a/sysdeps/unix/sysv/linux/tcsetattr.c
> > ++++ b/sysdeps/unix/sysv/linux/tcsetattr.c
> > +@@ -48,6 +48,7 @@ tcsetattr (fd, optional_actions, termios_p)  {
> > +   struct __kernel_termios k_termios;
> > +   unsigned long int cmd;
> > ++  int retval;
> > +
> > +   switch (optional_actions)
> > +     {
> > +@@ -79,6 +80,35 @@ tcsetattr (fd, optional_actions, termios_p)
> > +   memcpy (&k_termios.c_cc[0], &termios_p->c_cc[0],
> > + 	  __KERNEL_NCCS * sizeof (cc_t));
> > +
> > +-  return INLINE_SYSCALL (ioctl, 3, fd, cmd, &k_termios);
> > ++  retval =3D INLINE_SYSCALL (ioctl, 3, fd, cmd, &k_termios);
> > ++
> > ++  if (retval =3D=3D 0 && cmd =3D=3D TCSETS)
> > ++    {
> > ++      /* The Linux kernel has a bug which silently ignore the invalid
> > ++        c_cflag on pty. We have to check it here. */
> > ++      int save =3D errno;
> > ++      retval =3D INLINE_SYSCALL (ioctl, 3, fd, TCGETS, &k_termios);
> > ++      if (retval)
> > ++       {
> > ++         /* We cannot verify if the setting is ok. We don't return
> > ++            an error (?). */
> > ++         __set_errno (save);
> > ++         retval =3D 0;
> > ++       }
> > ++      else if ((termios_p->c_cflag & (PARENB | CREAD))
> > ++              !=3D (k_termios.c_cflag & (PARENB | CREAD))
> > ++              || ((termios_p->c_cflag & CSIZE)
> > ++                  && ((termios_p->c_cflag & CSIZE)
> > ++                      !=3D (k_termios.c_cflag & CSIZE))))
> > ++       {
> > ++         /* It looks like the Linux kernel silently changed the
> > ++            PARENB/CREAD/CSIZE bits in c_cflag. Report it as an
> > ++            error. */
> > ++         __set_errno (EINVAL);
> > ++         retval =3D -1;
> > ++       }
> > ++    }
> > ++
> > ++  return retval;
> > + }
> > + libc_hidden_def (tcsetattr)
> > +--
> > +1.8.4.2
> > +
> > diff --git a/meta/recipes-core/glibc/glibc_2.21.bb
> > b/meta/recipes-core/glibc/glibc_2.21.bb
> > index 58a9601..a061b08 100644
> > --- a/meta/recipes-core/glibc/glibc_2.21.bb
> > +++ b/meta/recipes-core/glibc/glibc_2.21.bb
> > @@ -27,6 +27,7 @@ SRC_URI =3D
> "git://sourceware.org/git/glibc.git;branch=3D${BRANCH} \
> >            file://0001-yes-within-the-path-sets-wrong-config-variables.=
patch \
> >            file://elf-Makefile-fix-a-typo.patch \
> >            ${EGLIBCPATCHES} \
> > +           file://tcsetattr.c-Fix-LSB-NG-Cases.patch \
> >           "
> > EGLIBCPATCHES =3D "\
> >            file://timezone-re-written-tzselect-as-posix-sh.patch \
> > --
> > 1.8.4.2
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core


