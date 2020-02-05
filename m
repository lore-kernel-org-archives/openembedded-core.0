Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id BA7E760699
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 14:45:50 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a9so3102870wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 06:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=WNMzYGntWv5rsCaQsqePwrcE4qYJfEZGzx9zMLLVu4Y=;
	b=AAe5QeUaWmjpuvAr6YXku6STT3kuH64vXCTbQvuGtSeAq0lkvC2eypYvtlPcaeTyfH
	GQwWrSfm0GWfeUwpjI73i2q2tZ+6+dDwaJe/ONBhd0UPWz3jMKcc0upPSQg6ZjMLaPyZ
	/zP9gzUWgpuCFnn1MaohaQg+nh46uCJOBflIN+CzjmI6hG+rjWYODuyfur8a3hzgb2Gv
	XW6JuCcrIoHe9YefOA3eVpbSxoXTaZSSqDWNf+V5vMU9hZb/7eSk4PoLFlNMgujG6UDV
	YMp05NtP9rDxLu+bTzXq1J6FhNUeyjA9L0DhZacG5FoJ5lGNmfyCvwn3Ur7T2Qg8plGo
	Ub+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=WNMzYGntWv5rsCaQsqePwrcE4qYJfEZGzx9zMLLVu4Y=;
	b=lCzuAYI6flh68n5JlAcl7Jz4YadU1wvHMjNMaX7qYhNs+SLybvTD8+cJB8syuDbhLM
	IPpr+hxfXPFmyUflNIzJNBsEeuKN/63IGkUxJFQkPV54vzhcQkYSsX1jxsdp3gqjfCWH
	bPfVxzB2lSpG9/fDmc8Di4NZywAm+sRtRFDLGCzVUBh3wz5HyKdtkulWuBdFfmUmrjvX
	jnH5GFd/EREpWhVot6l2TqdgQiGpdaVacNrYLxk5osBZzqgm5Qqr8WIyU6apa0Clw7Ph
	eaNs3VrX/yq7Y54ZeppKK3xIj+8CKBZOiKTzYwJ3zz5Dg/1GOWoSxsgsqPfWk4o6Y9H4
	yRcw==
X-Gm-Message-State: APjAAAVejYDFSmD24Ejstq2n8YbDa8h9ulaQUjitSv/0T2dV5PrsoOY9
	AcKSvuLviilxlhqfa0OtBwg=
X-Google-Smtp-Source: APXvYqy1SW/7aEmovA5OMzywSut8T2+h3o3yqiuOG/ueU9w/chIMBI0c5rRHTkexg/nMxVF3TpVnfQ==
X-Received: by 2002:a05:600c:1009:: with SMTP id
	c9mr5981859wmc.162.1580913951274; 
	Wed, 05 Feb 2020 06:45:51 -0800 (PST)
Received: from localhost ([109.238.218.228])
	by smtp.gmail.com with ESMTPSA id e1sm26116wrt.84.2020.02.05.06.45.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 06:45:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 5 Feb 2020 15:45:49 +0100
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20200205144549.3cif3xrxuoxrrjfh@jama>
References: <20200205024241.27828-1-Martin.Jansa@gmail.com>
	<20200205024241.27828-4-Martin.Jansa@gmail.com>
	<CADkTA4P-C8xPVcscM3DfUJ28KR19gcHW7s1X-dbU-5FN68+DaA@mail.gmail.com>
	<CA+chaQfTcJNTnEo-kexWvM0tyq_UN2nh0rvsFO9OiB4JvN=HAQ@mail.gmail.com>
	<CADkTA4NtWnMqxygpsfwEuQ6pcJR=3QOuE9K1wmmLp4boTsHaBA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4NtWnMqxygpsfwEuQ6pcJR=3QOuE9K1wmmLp4boTsHaBA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] kern-tools-native: use more common S value and oe_runmake
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
X-List-Received-Date: Wed, 05 Feb 2020 14:45:51 -0000
X-Groupsio-MsgNum: 134550
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="t2mxf6zgmywp5jwc"
Content-Disposition: inline

--t2mxf6zgmywp5jwc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2020 at 09:39:25AM -0500, Bruce Ashfield wrote:
> On Wed, Feb 5, 2020 at 8:57 AM Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> >
> > OK, the patchdir cleanup won't be needed as you've already applied that=
 .patch file in the repo.
> >
> > But I have forgot to update LIC_FILES_CHKSUM, which shouldn't have the =
"git/" anymore as it's relative to ${S}.
> >
> > LIC_FILES_CHKSUM =3D "file://tools/kgit;beginline=3D5;endline=3D9;md5=
=3D9c30e971d435e249624278c3e343e501"
> >
> > Please adjust in your consolidated pull requests.
>=20
> Absolutely, I tweaked and squashed it here.
>=20
> But I've definitely taken the cleanups, since there's no valid reason
> to make it so hard to patch (even if I grab and merge things).

BTW there is still another issue with gold enabled builds in runtime

When running "bitbake -k -c testimage core-image-sato-sdk-ptest" to test my=
 artifacts changes I've noticed:

Stopped HTTPService on 0.0.0.0:0
Traceback (most recent call last):
  File "/OE/build/oe-core/openembedded-core/meta/lib/oeqa/core/decorator/__=
init__.py", line 36, in wrapped_f
    return func(*args, **kwargs)
  File "/OE/build/oe-core/openembedded-core/meta/lib/oeqa/core/decorator/__=
init__.py", line 36, in wrapped_f
    return func(*args, **kwargs)
  File "/OE/build/oe-core/openembedded-core/meta/lib/oeqa/core/decorator/__=
init__.py", line 36, in wrapped_f
    return func(*args, **kwargs)
  [Previous line repeated 2 more times]
  File "/OE/build/oe-core/openembedded-core/meta/lib/oeqa/runtime/cases/ker=
nelmodule.py", line 46, in test_kernel_module
    self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
AssertionError: 2 !=3D 0 : cd /usr/src/kernel && make scripts prepare
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.[ch]
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTLD  scripts/kconfig/conf
scripts/kconfig/conf  --syncconfig Kconfig
scripts/Kconfig.include:39:  gold linker 'ld' not supported
make[2]: *** [scripts/kconfig/Makefile:73: syncconfig] Error 1
make[1]: *** [Makefile:567: syncconfig] Error 2
make: *** [Makefile:678: include/config/auto.conf.cmd] Error 2
make: *** [include/config/auto.conf.cmd] Deleting file 'include/config/tris=
tate.conf'

Looks like kernelmodule.py also needs to be adjusted to pass KERNEL_LD as L=
D.

Regards,

> > On Wed, Feb 5, 2020 at 3:54 AM Bruce Ashfield <bruce.ashfield@gmail.com=
> wrote:
> >>
> >> On Tue, Feb 4, 2020 at 9:42 PM Martin Jansa <martin.jansa@gmail.com> w=
rote:
> >> >
> >> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> > ---
> >> >  .../kern-tools/kern-tools-native_git.bb               | 11 +++++++-=
---
> >> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >> >
> >> > diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb=
 b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> >> > index 8053483355..28080e510f 100644
> >> > --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> >> > +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> >> > @@ -11,16 +11,19 @@ PV =3D "0.2+git${SRCPV}"
> >> >  inherit native
> >> >
> >> >  SRC_URI =3D "git://git.yoctoproject.org/yocto-kernel-tools.git"
> >> > -S =3D "${WORKDIR}"
> >> > +S =3D "${WORKDIR}/git"
> >>
> >> While not common, this was on purpose.  This isn't something that is
> >> typically patched, it is something I queue and bump for release.
> >>
> >> So I'm ok with the cleanup, but I'll drop the patch tweaking part when
> >> I queue for test, since I'll have the patch already in the repo.
> >>
> >> Bruce
> >>
> >> >  UPSTREAM_CHECK_COMMITS =3D "1"
> >> >
> >> > +do_configure() {
> >> > +       :
> >> > +}
> >> > +
> >> >  do_compile() {
> >> >         :
> >> >  }
> >> >
> >> >  do_install() {
> >> > -       cd ${S}/git
> >> > -       make DESTDIR=3D${D}${bindir} install
> >> > +       oe_runmake DESTDIR=3D${D}${bindir} install
> >> >  }
> >> >
> >> > -SRC_URI +=3D "file://0001-merge_config.sh-pass-LD-variable-from-she=
ll-environm.patch;patchdir=3Dgit"
> >> > +SRC_URI +=3D "file://0001-merge_config.sh-pass-LD-variable-from-she=
ll-environm.patch"
> >> > --
> >> > 2.20.1
> >> >
> >>
> >>
> >> --
> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end
> >> - "Use the force Harry" - Gandalf, Star Trek II
>=20
>=20
>=20
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

--t2mxf6zgmywp5jwc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXjrVHQAKCRA3VSO3ZXaA
HHI2AJ9shrk4hKUISva3uLEGFrU7+FcIUQCfVemjQCLd+2ABnkHcrOgmeTFNQUw=
=6JAR
-----END PGP SIGNATURE-----

--t2mxf6zgmywp5jwc--
