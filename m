Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id A8CB260722
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 04:52:47 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id q2so5542361pap.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 21:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=K6rO+8ADAeMJZSVXUJ93OMPYet80DkmIz2kZUO5dlBU=;
	b=Sk4Z4KMSfbaZ6T4imDDzThaMQZaI/5LcIl2TujgiB6YP9UNdXJR3NYN3KGbh3masex
	cHl5ayOBnUT+HHddDDQTH9RjbixAsCzO8km2RdRR3R9B4k6+0uyHMUXAlavt7itffb68
	C+TrcMiUxTyINlHbdeG8oRyVWq3hjof7CuQzCfCpOwquLGHS2TygbdihMjR2LatK+AJC
	hxS/1YafAr6CLNfOvvtpqQvFrUzP4V2V7EzUedDj3DewO5QCIgHugxduhh65VS2ABYvO
	/l/YRS3l8RbJXUaSmsJ7m84DZM98qjuxqo/vZL6L6x3lUQkLayqXCk5gz5lEe+bAyLPs
	b77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=K6rO+8ADAeMJZSVXUJ93OMPYet80DkmIz2kZUO5dlBU=;
	b=L7CcmoeH8uzvaFNAvTQ2iJk6lHW3lBXbTSknDbBjrbqov9Tf7H7GivivjM8qOSlZNU
	4L4PuEkdlrYdogVzAtREKEbS4ryWcjoAkYDPQIIHM4JvpByoUYQU/LZNYCMM94EMSYnU
	IJj7vBOvhYLlMkKZj4/MvJtmKc+hJzCTmY8ZMsQ/ZrYeL+4YGxWWADTA4/sdWu478WTi
	vpKIXD7SxZ/ZDjK4otEk7Dg0ZvhlB+mIDaRqeqxcDX1ik0etTqXouukvlwMAO6Bpcaga
	2f7eF8P9Wip6oAMA/jVu/DefSCItUUk68kD2cbyteE3ZAbg4eLW57C+OygT6REH4n4/m
	BOew==
X-Gm-Message-State: ALyK8tKfl6bjueVtpotacwEIuNN9NHTlUyXEO8LsQzkyCCDDjprqMwRe+z1Hr8N7pZEJdQ==
X-Received: by 10.66.160.41 with SMTP id xh9mr28983281pab.85.1468558367704;
	Thu, 14 Jul 2016 21:52:47 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:484e:ddb0:204b:d826?
	([2601:646:8882:b8c:484e:ddb0:204b:d826])
	by smtp.gmail.com with ESMTPSA id ln4sm607648pab.38.2016.07.14.21.52.46
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Jul 2016 21:52:46 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CANx9H-Caj+kFjyx2gHaXcCTM8_A_JKUxfb2xx=OuXhwg_cCHPg@mail.gmail.com>
Date: Thu, 14 Jul 2016 21:52:40 -0700
Message-Id: <F55C0DF8-841D-4E79-A9FB-584A55D92459@gmail.com>
References: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
	<65069865417cc8d9a7d9f5a16daecebb2b3d4fe0.1468546499.git.timothy.t.orling@linux.intel.com>
	<55FCD1E3-857F-4E09-801F-5EA1A96F2FF9@gmail.com>
	<CANx9H-Caj+kFjyx2gHaXcCTM8_A_JKUxfb2xx=OuXhwg_cCHPg@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [krogoth][PATCH 6/8] binutils: disable werror on native build
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
X-List-Received-Date: Fri, 15 Jul 2016 04:52:49 -0000
X-Groupsio-MsgNum: 84539
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1E9E0AA3-F190-4DF5-85FA-D7C05E42823F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1E9E0AA3-F190-4DF5-85FA-D7C05E42823F
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_DAE04652-9054-41E3-A598-88733C82A60F"

--Apple-Mail=_DAE04652-9054-41E3-A598-88733C82A60F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jul 14, 2016, at 8:58 PM, Tim Orling <ticotimo@gmail.com> wrote:
>=20
> Hi Khem,
>=20
> Can you elaborate? What am I missing or unaware of? Happy to keep =
digging!

Can you try building an SDK ?

>=20
> --Tim
>=20
> On Thursday, July 14, 2016, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
>=20
> > On Jul 14, 2016, at 6:49 PM, Tim Orling =
<timothy.t.orling@linux.intel.com <javascript:;>> wrote:
> >
> > From: Dan McGregor <dan.mcgregor@usask.ca <javascript:;>>
> >
> > It's disabled on cross builds, and it's needed for gcc 6
> >
> > (=46rom OE-Core rev: ce1b37e29dc89b67dc698e856007b59faa16c4df)
> >
> > Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca <javascript:;>>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org =
<javascript:;>>
> > ---
> > meta/recipes-devtools/binutils/binutils_2.26.bb =
<http://binutils_2.26.bb/> | 3 ++-
> > 1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/binutils/binutils_2.26.bb =
<http://binutils_2.26.bb/> =
b/meta/recipes-devtools/binutils/binutils_2.26.bb =
<http://binutils_2.26.bb/>
> > index b70ffbf..e976bad 100644
> > --- a/meta/recipes-devtools/binutils/binutils_2.26.bb =
<http://binutils_2.26.bb/>
> > +++ b/meta/recipes-devtools/binutils/binutils_2.26.bb =
<http://binutils_2.26.bb/>
> > @@ -13,7 +13,8 @@ EXTRA_OECONF +=3D "--with-sysroot=3D/ \
> > EXTRA_OECONF_class-native =3D "--enable-targets=3Dall \
> >                              --enable-64-bit-bfd \
> >                              --enable-install-libiberty \
> > -                             --enable-install-libbfd"
> > +                             --enable-install-libbfd \
> > +                             --disable-werror=E2=80=9D
>=20
> How about other flavors of binutils ?
>=20
> >
> > do_install_class-native () {
> >       autotools_do_install
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org <javascript:;>
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core =
<http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>=20


--Apple-Mail=_DAE04652-9054-41E3-A598-88733C82A60F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jul 14, 2016, at 8:58 PM, Tim Orling &lt;<a =
href=3D"mailto:ticotimo@gmail.com" class=3D"">ticotimo@gmail.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D"">Hi =
Khem,<div class=3D""><br class=3D""></div><div class=3D"">Can you =
elaborate? What am I missing or unaware of? Happy to keep =
digging!</div></div></blockquote><div><br class=3D""></div><div>Can you =
try building an SDK ?</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><div class=3D""><br class=3D""></div><div =
class=3D"">--Tim<br class=3D""><div class=3D""><br class=3D"">On =
Thursday, July 14, 2016, Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com" class=3D"">raj.khem@gmail.com</a>&gt; =
wrote:<br class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br class=3D"">
&gt; On Jul 14, 2016, at 6:49 PM, Tim Orling &lt;<a href=3D"javascript:;" =
onclick=3D"_e(event, 'cvml', 'timothy.t.orling@linux.intel.com')" =
class=3D"">timothy.t.orling@linux.intel.com</a>&gt; wrote:<br class=3D"">
&gt;<br class=3D"">
&gt; From: Dan McGregor &lt;<a href=3D"javascript:;" onclick=3D"_e(event, =
'cvml', 'dan.mcgregor@usask.ca')" =
class=3D"">dan.mcgregor@usask.ca</a>&gt;<br class=3D"">
&gt;<br class=3D"">
&gt; It's disabled on cross builds, and it's needed for gcc 6<br =
class=3D"">
&gt;<br class=3D"">
&gt; (=46rom OE-Core rev: ce1b37e29dc89b67dc698e856007b59faa16c4df)<br =
class=3D"">
&gt;<br class=3D"">
&gt; Signed-off-by: Dan McGregor &lt;<a href=3D"javascript:;" =
onclick=3D"_e(event, 'cvml', 'dan.mcgregor@usask.ca')" =
class=3D"">dan.mcgregor@usask.ca</a>&gt;<br class=3D"">
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"javascript:;" =
onclick=3D"_e(event, 'cvml', 'richard.purdie@linuxfoundation.org')" =
class=3D"">richard.purdie@linuxfoundation.org</a>&gt;<br class=3D"">
&gt; ---<br class=3D"">
&gt; meta/recipes-devtools/binutils/<a href=3D"http://binutils_2.26.bb/" =
target=3D"_blank" class=3D"">binutils_2.26.bb</a> | 3 ++-<br class=3D"">
&gt; 1 file changed, 2 insertions(+), 1 deletion(-)<br class=3D"">
&gt;<br class=3D"">
&gt; diff --git a/meta/recipes-devtools/binutils/<a =
href=3D"http://binutils_2.26.bb/" target=3D"_blank" =
class=3D"">binutils_2.26.bb</a> b/meta/recipes-devtools/binutils/<a =
href=3D"http://binutils_2.26.bb/" target=3D"_blank" =
class=3D"">binutils_2.26.bb</a><br class=3D"">
&gt; index b70ffbf..e976bad 100644<br class=3D"">
&gt; --- a/meta/recipes-devtools/binutils/<a =
href=3D"http://binutils_2.26.bb/" target=3D"_blank" =
class=3D"">binutils_2.26.bb</a><br class=3D"">
&gt; +++ b/meta/recipes-devtools/binutils/<a =
href=3D"http://binutils_2.26.bb/" target=3D"_blank" =
class=3D"">binutils_2.26.bb</a><br class=3D"">
&gt; @@ -13,7 +13,8 @@ EXTRA_OECONF +=3D "--with-sysroot=3D/ \<br =
class=3D"">
&gt; EXTRA_OECONF_class-native =3D "--enable-targets=3Dall \<br =
class=3D"">
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; --enable-64-bit-bfd \<br =
class=3D"">
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; --enable-install-libiberty =
\<br class=3D"">
&gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;--enable-install-libbfd"<br =
class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;--enable-install-libbfd \<br =
class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;--disable-werror=E2=80=9D<br =
class=3D"">
<br class=3D"">
How about other flavors of binutils ?<br class=3D"">
<br class=3D"">
&gt;<br class=3D"">
&gt; do_install_class-native () {<br class=3D"">
&gt;&nbsp; &nbsp; &nbsp; &nbsp;autotools_do_install<br class=3D"">
&gt; --<br class=3D"">
&gt; 2.7.4<br class=3D"">
&gt;<br class=3D"">
&gt; --<br class=3D"">
&gt; _______________________________________________<br class=3D"">
&gt; Openembedded-core mailing list<br class=3D"">
&gt; <a href=3D"javascript:;" onclick=3D"_e(event, 'cvml', =
'Openembedded-core@lists.openembedded.org')" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br class=3D"">
&gt; <a =
href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core" =
target=3D"_blank" =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e</a><br class=3D"">
<br class=3D"">
</blockquote></div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_DAE04652-9054-41E3-A598-88733C82A60F--

--Apple-Mail=_1E9E0AA3-F190-4DF5-85FA-D7C05E42823F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleIbB0ACgkQuwUzVZGdMxT0qACfW9197XDwmvIQpOp8jNgRNUA7
HmcAn0Ad19I/SyJD+7Z1/K6HWJ1m1Pe3
=zgLl
-----END PGP SIGNATURE-----

--Apple-Mail=_1E9E0AA3-F190-4DF5-85FA-D7C05E42823F--
