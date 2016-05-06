Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id B4F4E6FFD7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 04:43:22 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id 77so45179447pfv.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 May 2016 21:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=q8UppBwAuTHKGhefN80cZ3N7iW1uSR33KXFVkHUXBqg=;
	b=zwIj9EEUkwyt84UzhFmepTOOTQQe5iO8lPbVyTQdfup3I0fzWpPOt9d9C1ZfBwtLYC
	ZVM/Q9g3kXb1Qeo3ex0mHhGR9sIKmPrXiJv3jTunE20RQliBNEFxSEDgFmF79SBE0EX3
	IG3slzoPphiIoFHKf6VolJWt224wtqCIXQKBxvxeWRoJKR7Jy6NEmqu9+UR6Rrqee8TT
	fXah+0NGlNYGfD70DQVwo+H4StSlG19wtVx8mbGQ3NWgK9rzPXKkT2BHYSMHmY0Nq1xo
	eJ3AknL4kqva7kLuz/241Va1jxzQbGllmvWgJUJMtrtMHYKXW/rF7LsYR7oE9FpDJKRy
	c7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=q8UppBwAuTHKGhefN80cZ3N7iW1uSR33KXFVkHUXBqg=;
	b=bjF+pQruG2hLRIwUap1CdzkpKZam94L+aL976gGsr8gXLrw/hm9PYNwLyOFJ5yJPK6
	ecMr3cnGQCl+YR6bOA5Ok/fo9xT6EPDOm6PRIJ3CTT1XFokPNDtSf8OwrmyQwU+vz4D4
	hduQ1ugQ15UysaDcbpzoY2qTYd6LIxAWw7iRRydBOz48pwnne+KQNgEtqF/Fr334SEE1
	Ob+ytjv/9Wf2HtTDsay51tbSeBzvD7UJC5vgRqVyBK2tAF78bpSnQ0Zzr4DfrUTrnaZ9
	CyoO/HYG4piI4VKtr3YLvkw/wY6sNsV/5dr2w6v7qM1OE6wjOnxh/WFFR2T4Ga3Mgerc
	8rrw==
X-Gm-Message-State: AOPr4FWIuwK95Cz+GP5a9UrCup8J5sfGWV0FDkzQbnCPCdmq8rv2f+0761z2xhNEROsqAg==
X-Received: by 10.98.92.66 with SMTP id q63mr26071096pfb.21.1462509803205;
	Thu, 05 May 2016 21:43:23 -0700 (PDT)
Received: from ?IPv6:2601:641:c001:6120:4901:d1a1:94e0:302?
	([2601:641:c001:6120:4901:d1a1:94e0:302])
	by smtp.gmail.com with ESMTPSA id
	199sm17213917pfc.15.2016.05.05.21.43.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 May 2016 21:43:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAFL-KX8ffjqey04OTBCndwyP61i_mzcDY8tnGknRyA1edBTsWQ@mail.gmail.com>
Date: Thu, 5 May 2016 21:43:17 -0700
Message-Id: <958AAFA9-CD4A-491A-9C4E-062693C87DD0@gmail.com>
References: <1462507108-17945-1-git-send-email-rwoodsmall@gmail.com>
	<CAMKF1spYLh9=YybuH_aJ9QLhJ1=Ub79VMVgFpBv3QXuD8r2-9Q@mail.gmail.com>
	<CAFL-KX8ffjqey04OTBCndwyP61i_mzcDY8tnGknRyA1edBTsWQ@mail.gmail.com>
To: ryan woodsmall <rwoodsmall@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Make static lib builds (DISABLE_STATIC) configurable from local.conf
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
X-List-Received-Date: Fri, 06 May 2016 04:43:22 -0000
X-Groupsio-MsgNum: 81654
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F8C1543B-3E8F-49E6-B00E-0C3046F4EF6E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_F8C1543B-3E8F-49E6-B00E-0C3046F4EF6E
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_AA0C3B8E-BADC-47B5-A0F6-F7E6E6D27EAC"

--Apple-Mail=_AA0C3B8E-BADC-47B5-A0F6-F7E6E6D27EAC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 5, 2016, at 9:38 PM, ryan woodsmall <rwoodsmall@gmail.com> =
wrote:
>=20
> The idea is to build an as-close-to-stock-as-possible Poky (or =
another) distro, but include support for static linking natively in the =
installed OS.

In this case, you will call it poky but it will be far from poky. So its =
better to either define your own distro config based on poky, it also =
helps you when you ask
questions on mailing list. If you say I am using poky and make such =
changes you will miss to inform and people will not be able to reproduce =
your
issues.

> Some of the bits I build/ship, including standalone static cross and =
native toolchains, target Poky as the stable reference source OS. The =
poky-tiny definition with musl exists, but doesn't quite cover what I =
need, and some externals are built outside of bitbake, the SDK and =
packaging system, so static compilation limits required libraries and =
gives me some confidence that I'll run on Poky.

I think poky-tiny policy to let  use static libs can be considered and I =
would encourage you to submit patch for poky tiny to let do that.

>=20
> It's not a big deal at all to do a custom Poky-based distro so I can =
head down that path, but thought this might be useful. The default =
remains sane, setting "--disable-static", but provides a knob to turn if =
the old feature is needed. Apologies if I missed the point here!
>=20
> On Thu, May 5, 2016 at 11:09 PM, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
>=20
> On May 5, 2016 8:59 PM, "ryan woodsmall" <rwoodsmall@gmail.com =
<mailto:rwoodsmall@gmail.com>> wrote:
> >
> > Static libraries are mostly usable in very small embedded systems.
> > The addiiton of musl-libc support allows very small "single binary" =
systems,
> > and static linking allows no shared lib deps on these types of =
builds.
> >
> > Signed-off-by: ryan woodsmall <rwoodsmall@gmail.com =
<mailto:rwoodsmall@gmail.com>>
> > ---
> >  meta/conf/distro/include/no-static-libs.inc | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/conf/distro/include/no-static-libs.inc =
b/meta/conf/distro/include/no-static-libs.inc
> > index 13a7918..83472d5 100644
> > --- a/meta/conf/distro/include/no-static-libs.inc
> > +++ b/meta/conf/distro/include/no-static-libs.inc
> > @@ -1,4 +1,4 @@
> > -DISABLE_STATIC =3D " --disable-static"
> > +DISABLE_STATIC ?=3D " --disable-static"
> >
>=20
> I think this defeats the essense of this inc file. Not including this =
file in your distro as a policy is what you want
>=20
> >  # qemu aborts on unrecognised option
> >  DISABLE_STATIC_pn-qemu =3D ""
> > @@ -32,4 +32,4 @@ DISABLE_STATIC_pn-libusb1-native =3D ""
> >
> >  EXTRA_OECONF_append =3D "${DISABLE_STATIC}"
> >
> > -EXTRA_OECMAKE_append_pn-libical =3D "-DSHARED_ONLY=3DTrue"
> > +EXTRA_OECMAKE_append_pn-libical ?=3D "-DSHARED_ONLY=3DTrue"
> > --
> > 2.6.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core =
<http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_AA0C3B8E-BADC-47B5-A0F6-F7E6E6D27EAC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On May 5, 2016, at 9:38 PM, ryan woodsmall &lt;<a =
href=3D"mailto:rwoodsmall@gmail.com" =
class=3D"">rwoodsmall@gmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D"">The idea is to build an as-close-to-stock-as-possible Poky =
(or another) distro, but include support for static linking natively in =
the installed OS. </div></div></blockquote><div><br =
class=3D""></div><div>In this case, you will call it poky but it will be =
far from poky. So its better to either define your own distro config =
based on poky, it also helps you when you ask</div><div>questions on =
mailing list. If you say I am using poky and make such changes you will =
miss to inform and people will not be able to reproduce =
your</div><div>issues.&nbsp;</div><br class=3D""><blockquote type=3D"cite"=
 class=3D""><div class=3D""><div dir=3D"ltr" class=3D"">Some of the bits =
I build/ship, including standalone static cross and native toolchains, =
target Poky as the stable reference source OS. The poky-tiny definition =
with musl exists, but doesn't quite cover what I need, and some =
externals are built outside of bitbake, the SDK and packaging system, so =
static compilation limits required libraries and gives me some =
confidence that I'll run on Poky.</div></div></blockquote><div><br =
class=3D""></div><div>I think poky-tiny policy to let &nbsp;use static =
libs can be considered and I would encourage you to submit patch for =
poky tiny to let do that.</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div class=3D""><br=
 class=3D""></div><div class=3D"">It's not a big deal at all to do a =
custom Poky-based distro so I can head down that path, but thought this =
might be useful. The default remains sane, setting "--disable-static", =
but provides a knob to turn if the old feature is needed. Apologies if I =
missed the point here!</div></div><div class=3D"gmail_extra"><br =
class=3D""><div class=3D"gmail_quote">On Thu, May 5, 2016 at 11:09 PM, =
Khem Raj <span dir=3D"ltr" class=3D"">&lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" =
class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><p =
dir=3D"ltr" class=3D""><br class=3D"">
On May 5, 2016 8:59 PM, "ryan woodsmall" &lt;<a =
href=3D"mailto:rwoodsmall@gmail.com" target=3D"_blank" =
class=3D"">rwoodsmall@gmail.com</a>&gt; wrote:<br class=3D"">
&gt;<br class=3D"">
&gt; Static libraries are mostly usable in very small embedded =
systems.<br class=3D"">
&gt; The addiiton of musl-libc support allows very small "single binary" =
systems,<br class=3D"">
&gt; and static linking allows no shared lib deps on these types of =
builds.<br class=3D"">
&gt;<br class=3D"">
&gt; Signed-off-by: ryan woodsmall &lt;<a =
href=3D"mailto:rwoodsmall@gmail.com" target=3D"_blank" =
class=3D"">rwoodsmall@gmail.com</a>&gt;<br class=3D"">
&gt; ---<br class=3D"">
&gt; &nbsp;meta/conf/distro/include/no-static-libs.inc | 4 ++--<br =
class=3D"">
&gt; &nbsp;1 file changed, 2 insertions(+), 2 deletions(-)<br class=3D"">
&gt;<br class=3D"">
&gt; diff --git a/meta/conf/distro/include/no-static-libs.inc =
b/meta/conf/distro/include/no-static-libs.inc<br class=3D"">
&gt; index 13a7918..83472d5 100644<br class=3D"">
&gt; --- a/meta/conf/distro/include/no-static-libs.inc<br class=3D"">
&gt; +++ b/meta/conf/distro/include/no-static-libs.inc<br class=3D"">
&gt; @@ -1,4 +1,4 @@<br class=3D"">
&gt; -DISABLE_STATIC =3D " --disable-static"<br class=3D"">
&gt; +DISABLE_STATIC ?=3D " --disable-static"<br class=3D"">
&gt;</p>
</span><p dir=3D"ltr" class=3D"">I think this defeats the essense of =
this inc file. Not including this file in your distro as a policy is =
what you want</p><p dir=3D"ltr" class=3D""><span class=3D"">&gt; &nbsp;# =
qemu aborts on unrecognised option<br class=3D"">
&gt; &nbsp;DISABLE_STATIC_pn-qemu =3D ""<br class=3D"">
&gt; @@ -32,4 +32,4 @@ DISABLE_STATIC_pn-libusb1-native =3D ""<br =
class=3D"">
&gt;<br class=3D"">
&gt; &nbsp;EXTRA_OECONF_append =3D "${DISABLE_STATIC}"<br class=3D"">
&gt;<br class=3D"">
&gt; -EXTRA_OECMAKE_append_pn-libical =3D "-DSHARED_ONLY=3DTrue"<br =
class=3D"">
&gt; +EXTRA_OECMAKE_append_pn-libical ?=3D "-DSHARED_ONLY=3DTrue"<br =
class=3D"">
&gt; --<br class=3D"">
&gt; 2.6.4<br class=3D"">
&gt;<br class=3D""></span><span class=3D"HOEnZb"><font color=3D"#888888" =
class=3D"">
&gt; --<br class=3D"">
&gt; _______________________________________________<br class=3D"">
&gt; Openembedded-core mailing list<br class=3D"">
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" =
target=3D"_blank" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br class=3D"">
&gt; <a =
href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core" =
target=3D"_blank" =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e</a><br class=3D"">
</font></span></p>
</blockquote></div><br class=3D""></div>
-- <br class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_AA0C3B8E-BADC-47B5-A0F6-F7E6E6D27EAC--

--Apple-Mail=_F8C1543B-3E8F-49E6-B00E-0C3046F4EF6E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcsIOkACgkQuwUzVZGdMxTk7ACePWoZMKOU97YQeFjrJXwRM1Vp
JXQAnR0WYf4AC19g/tH2s17J/wDH4tn5
=NVhr
-----END PGP SIGNATURE-----

--Apple-Mail=_F8C1543B-3E8F-49E6-B00E-0C3046F4EF6E--
