Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 16383723C3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 16:22:23 +0000 (UTC)
Received: by pdbnk13 with SMTP id nk13so89393700pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 May 2015 09:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=vkqWE+5fzBoDjImlx//9hQofv4ASVkzzCTKAAdDzTbU=;
	b=eGZAZZGnimbalhpFyeXIze0ajPP8icAa8j1Zbg/y9mXUKpZc6rJvJIWcYhrHBwntLt
	rSss9zlOnu5EhKeUvC+qeXvSkQ0Jkud61y7PDVih4CjuriUxvxPEO6oEelsRmBMRMJAL
	0txJOnXXyb8RVZT37z0FoRzdR2M8wKDwjybpfGtLXaEslBA28rsMWjD7cQONf9J627Jc
	0+yACYpUNOb4Kwh0pniBJDNHOAZAbgAabKosAKa4brOt+J7TonDTeJZzaSh4dJtiISrQ
	qcQsAUOpuETZQNoA5fGSik0TsRidEAI5hha1G7jm7UfwPXhZxw3cma5KknDRpflGkII4
	Mkqw==
X-Received: by 10.70.103.10 with SMTP id fs10mr7541304pdb.141.1431102079659;
	Fri, 08 May 2015 09:21:19 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:e1cb:38d2:138f:a180?
	([2601:9:3580:84c:e1cb:38d2:138f:a180])
	by mx.google.com with ESMTPSA id te4sm5629247pbc.88.2015.05.08.09.21.18
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 08 May 2015 09:21:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1431075674-1688-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Date: Fri, 8 May 2015 09:21:11 -0700
Message-Id: <6B7ABF87-0779-417E-88C3-C1FA1C96393E@gmail.com>
References: <1431075674-1688-1-git-send-email-lixin.fnst@cn.fujitsu.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 08 May 2015 16:22:26 -0000
X-Groupsio-MsgNum: 65303
Content-Type: multipart/signed;
	boundary="Apple-Mail=_76A6C8FE-6A0E-40B9-AAF1-3E1F667771B0";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_76A6C8FE-6A0E-40B9-AAF1-3E1F667771B0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 8, 2015, at 2:01 AM, Li xin <lixin.fnst@cn.fujitsu.com> wrote:
>=20
> Bug 3033 - T.c_iflag and T.tcgetattr fail when using pseudo ttys (on =
some systems).
> https://lsbbugs.linuxfoundation.org/show_bug.cgi?id=3D3033
>=20

This patch is ok. However two questions
1. what kernel version do you see it on and is kernel piece fixed too or =
is not required
2. Has this been submitted to glibc ?

> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
> .../glibc/glibc/tcsetattr.c-Fix-LSB-NG-Cases.patch | 69 =
++++++++++++++++++++++
> meta/recipes-core/glibc/glibc_2.21.bb              |  1 +
> 2 files changed, 70 insertions(+)
> create mode 100644 =
meta/recipes-core/glibc/glibc/tcsetattr.c-Fix-LSB-NG-Cases.patch
>=20
> diff --git =
a/meta/recipes-core/glibc/glibc/tcsetattr.c-Fix-LSB-NG-Cases.patch =
b/meta/recipes-core/glibc/glibc/tcsetattr.c-Fix-LSB-NG-Cases.patch
> new file mode 100644
> index 0000000..df0e61d
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/tcsetattr.c-Fix-LSB-NG-Cases.patch
> @@ -0,0 +1,69 @@
> +=46rom 9022ee975265b65f59782ea92b59eccc95774a88 Mon Sep 17 00:00:00 =
2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Fri, 8 May 2015 13:51:30 +0900
> +Subject: [PATCH] tcsetattr.c: Fix LSB NG Cases
> +
> +/tset/POSIX.os/devclass/tcgetattr/T.tcgetattr 1 2
> +/tset/POSIX.os/devclass/c_iflag/T.c_iflag 6 7 8 9
> +
> +This patch is from Fedora.
> +
> +Upstream-Status: pending.
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + sysdeps/unix/sysv/linux/tcsetattr.c | 32 =
+++++++++++++++++++++++++++++++-
> + 1 file changed, 31 insertions(+), 1 deletion(-)
> +
> +diff --git a/sysdeps/unix/sysv/linux/tcsetattr.c =
b/sysdeps/unix/sysv/linux/tcsetattr.c
> +index d7afc63..7cb2c61 100644
> +--- a/sysdeps/unix/sysv/linux/tcsetattr.c
> ++++ b/sysdeps/unix/sysv/linux/tcsetattr.c
> +@@ -48,6 +48,7 @@ tcsetattr (fd, optional_actions, termios_p)
> + {
> +   struct __kernel_termios k_termios;
> +   unsigned long int cmd;
> ++  int retval;
> +
> +   switch (optional_actions)
> +     {
> +@@ -79,6 +80,35 @@ tcsetattr (fd, optional_actions, termios_p)
> +   memcpy (&k_termios.c_cc[0], &termios_p->c_cc[0],
> + 	  __KERNEL_NCCS * sizeof (cc_t));
> +
> +-  return INLINE_SYSCALL (ioctl, 3, fd, cmd, &k_termios);
> ++  retval =3D INLINE_SYSCALL (ioctl, 3, fd, cmd, &k_termios);
> ++
> ++  if (retval =3D=3D 0 && cmd =3D=3D TCSETS)
> ++    {
> ++      /* The Linux kernel has a bug which silently ignore the =
invalid
> ++        c_cflag on pty. We have to check it here. */
> ++      int save =3D errno;
> ++      retval =3D INLINE_SYSCALL (ioctl, 3, fd, TCGETS, &k_termios);
> ++      if (retval)
> ++       {
> ++         /* We cannot verify if the setting is ok. We don't return
> ++            an error (?). */
> ++         __set_errno (save);
> ++         retval =3D 0;
> ++       }
> ++      else if ((termios_p->c_cflag & (PARENB | CREAD))
> ++              !=3D (k_termios.c_cflag & (PARENB | CREAD))
> ++              || ((termios_p->c_cflag & CSIZE)
> ++                  && ((termios_p->c_cflag & CSIZE)
> ++                      !=3D (k_termios.c_cflag & CSIZE))))
> ++       {
> ++         /* It looks like the Linux kernel silently changed the
> ++            PARENB/CREAD/CSIZE bits in c_cflag. Report it as an
> ++            error. */
> ++         __set_errno (EINVAL);
> ++         retval =3D -1;
> ++       }
> ++    }
> ++
> ++  return retval;
> + }
> + libc_hidden_def (tcsetattr)
> +--
> +1.8.4.2
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.21.bb =
b/meta/recipes-core/glibc/glibc_2.21.bb
> index 58a9601..a061b08 100644
> --- a/meta/recipes-core/glibc/glibc_2.21.bb
> +++ b/meta/recipes-core/glibc/glibc_2.21.bb
> @@ -27,6 +27,7 @@ SRC_URI =3D =
"git://sourceware.org/git/glibc.git;branch=3D${BRANCH} \
>            =
file://0001-yes-within-the-path-sets-wrong-config-variables.patch \
>            file://elf-Makefile-fix-a-typo.patch \
>            ${EGLIBCPATCHES} \
> +           file://tcsetattr.c-Fix-LSB-NG-Cases.patch \
>           "
> EGLIBCPATCHES =3D "\
>            file://timezone-re-written-tzselect-as-posix-sh.patch \
> --
> 1.8.4.2
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_76A6C8FE-6A0E-40B9-AAF1-3E1F667771B0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVM4n0ACgkQuwUzVZGdMxQMbwCdFYlYB0enclO+7Lbm2jTBpA2o
LucAn2YFLbNUDmXt+vgnJ5/GhDIYjtfe
=kH4N
-----END PGP SIGNATURE-----

--Apple-Mail=_76A6C8FE-6A0E-40B9-AAF1-3E1F667771B0--
