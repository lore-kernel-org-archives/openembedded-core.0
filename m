Return-Path: <rwoodsmall@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id B3E556FFD7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 04:38:25 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id d62so104428398iof.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 May 2016 21:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=PijaSOByo64OBTX7jL0iGI6RNqRpXNQXlYG/o4GgWgQ=;
	b=Bz31o2z7T2rRFR06s/zNx6OHHwHUhwjjVqAqXmshC+OSUMoiFxhcEYUB2cJQNgLBzN
	Sac5Y6CxvoUDUMe1dwjUDnnHi/7AkdItWmAPFbjlMvkrEttcHL+8PHI6R948Jkqi1uYS
	iB5c6SLB1AzdlC7eYqBk9TqVuLOG1AcxHV71FNG1H/4InitQ+KzAdFbkub4kXwmmPGwb
	r64hlZUuFxUe5Cj27AIAJmVxuaf2snwX03XuslGnJUAvJ9orHS3rxbx/UZ+fU4X/M4et
	jRFLC+r0xVoVJGqnxDsXuJkMgqdS4jNrm99Vc2TxWQDWQhOXLjitqkbmLM7aX+Q82dpz
	hchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=PijaSOByo64OBTX7jL0iGI6RNqRpXNQXlYG/o4GgWgQ=;
	b=TvWILxFErue9Igr90WJTqyPU88CTWCDAK9Z8ow7p29JND2C6195WqOpgTvrUJAcAjM
	kZLnGxgVv8d8ZqifxB2A0IDB4W8+AUgWxLwhEtEkkW+R8EPChCaugPCllLQ5yQFaYw1F
	T6N2WyvlXBCPgFBFw2QPdTx2Udp5RyXyd5I+OMQlHonsXWaj8lz6mg61VemeLsLG7skN
	DrdCA/ICUv18Ae5bllqqEvsYPgD0LvaWw/fRaayQSLtX/U0ZaFjwoyCdSGlkZSU9MPwt
	QXkqU+j4tf1ruZuMVRLFl6DLzqbwsovBabRZ5aaoGOHLtPLSslZlANUU17RBKVbgrC7U
	G7LA==
X-Gm-Message-State: AOPr4FXaPQdpbp3SOPYaSSfVwFiyKcpigsDSUf7PvkP6W9Zhxcy4KEoECk2lvQo70fuc6T3KIa5O54IxZxuA2g==
MIME-Version: 1.0
X-Received: by 10.107.15.140 with SMTP id 12mr21581283iop.10.1462509506141;
	Thu, 05 May 2016 21:38:26 -0700 (PDT)
Received: by 10.79.13.9 with HTTP; Thu, 5 May 2016 21:38:26 -0700 (PDT)
In-Reply-To: <CAMKF1spYLh9=YybuH_aJ9QLhJ1=Ub79VMVgFpBv3QXuD8r2-9Q@mail.gmail.com>
References: <1462507108-17945-1-git-send-email-rwoodsmall@gmail.com>
	<CAMKF1spYLh9=YybuH_aJ9QLhJ1=Ub79VMVgFpBv3QXuD8r2-9Q@mail.gmail.com>
Date: Thu, 5 May 2016 23:38:26 -0500
Message-ID: <CAFL-KX8ffjqey04OTBCndwyP61i_mzcDY8tnGknRyA1edBTsWQ@mail.gmail.com>
From: ryan woodsmall <rwoodsmall@gmail.com>
To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 06 May 2016 04:38:26 -0000
Content-Type: multipart/alternative; boundary=001a113ee3fc9828470532250738

--001a113ee3fc9828470532250738
Content-Type: text/plain; charset=UTF-8

The idea is to build an as-close-to-stock-as-possible Poky (or another)
distro, but include support for static linking natively in the installed
OS. Some of the bits I build/ship, including standalone static cross and
native toolchains, target Poky as the stable reference source OS. The
poky-tiny definition with musl exists, but doesn't quite cover what I need,
and some externals are built outside of bitbake, the SDK and packaging
system, so static compilation limits required libraries and gives me some
confidence that I'll run on Poky.

It's not a big deal at all to do a custom Poky-based distro so I can head
down that path, but thought this might be useful. The default remains sane,
setting "--disable-static", but provides a knob to turn if the old feature
is needed. Apologies if I missed the point here!

On Thu, May 5, 2016 at 11:09 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
> On May 5, 2016 8:59 PM, "ryan woodsmall" <rwoodsmall@gmail.com> wrote:
> >
> > Static libraries are mostly usable in very small embedded systems.
> > The addiiton of musl-libc support allows very small "single binary"
> systems,
> > and static linking allows no shared lib deps on these types of builds.
> >
> > Signed-off-by: ryan woodsmall <rwoodsmall@gmail.com>
> > ---
> >  meta/conf/distro/include/no-static-libs.inc | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/conf/distro/include/no-static-libs.inc
> b/meta/conf/distro/include/no-static-libs.inc
> > index 13a7918..83472d5 100644
> > --- a/meta/conf/distro/include/no-static-libs.inc
> > +++ b/meta/conf/distro/include/no-static-libs.inc
> > @@ -1,4 +1,4 @@
> > -DISABLE_STATIC = " --disable-static"
> > +DISABLE_STATIC ?= " --disable-static"
> >
>
> I think this defeats the essense of this inc file. Not including this file
> in your distro as a policy is what you want
>
> >  # qemu aborts on unrecognised option
> >  DISABLE_STATIC_pn-qemu = ""
> > @@ -32,4 +32,4 @@ DISABLE_STATIC_pn-libusb1-native = ""
> >
> >  EXTRA_OECONF_append = "${DISABLE_STATIC}"
> >
> > -EXTRA_OECMAKE_append_pn-libical = "-DSHARED_ONLY=True"
> > +EXTRA_OECMAKE_append_pn-libical ?= "-DSHARED_ONLY=True"
> > --
> > 2.6.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113ee3fc9828470532250738
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The idea is to build an as-close-to-stock-as-possible Poky=
 (or another) distro, but include support for static linking natively in th=
e installed OS. Some of the bits I build/ship, including standalone static =
cross and native toolchains, target Poky as the stable reference source OS.=
 The poky-tiny definition with musl exists, but doesn&#39;t quite cover wha=
t I need, and some externals are built outside of bitbake, the SDK and pack=
aging system, so static compilation limits required libraries and gives me =
some confidence that I&#39;ll run on Poky.<div><br></div><div>It&#39;s not =
a big deal at all to do a custom Poky-based distro so I can head down that =
path, but thought this might be useful. The default remains sane, setting &=
quot;--disable-static&quot;, but provides a knob to turn if the old feature=
 is needed. Apologies if I missed the point here!</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Thu, May 5, 2016 at 11:09 PM=
, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D""><p dir=3D"ltr"><br>
On May 5, 2016 8:59 PM, &quot;ryan woodsmall&quot; &lt;<a href=3D"mailto:rw=
oodsmall@gmail.com" target=3D"_blank">rwoodsmall@gmail.com</a>&gt; wrote:<b=
r>
&gt;<br>
&gt; Static libraries are mostly usable in very small embedded systems.<br>
&gt; The addiiton of musl-libc support allows very small &quot;single binar=
y&quot; systems,<br>
&gt; and static linking allows no shared lib deps on these types of builds.=
<br>
&gt;<br>
&gt; Signed-off-by: ryan woodsmall &lt;<a href=3D"mailto:rwoodsmall@gmail.c=
om" target=3D"_blank">rwoodsmall@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/conf/distro/include/no-static-libs.inc | 4 ++--<br>
&gt; =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/d=
istro/include/no-static-libs.inc<br>
&gt; index 13a7918..83472d5 100644<br>
&gt; --- a/meta/conf/distro/include/no-static-libs.inc<br>
&gt; +++ b/meta/conf/distro/include/no-static-libs.inc<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -DISABLE_STATIC =3D &quot; --disable-static&quot;<br>
&gt; +DISABLE_STATIC ?=3D &quot; --disable-static&quot;<br>
&gt;</p>
</span><p dir=3D"ltr">I think this defeats the essense of this inc file. No=
t including this file in your distro as a policy is what you want</p>
<p dir=3D"ltr"><span class=3D"">&gt; =C2=A0# qemu aborts on unrecognised op=
tion<br>
&gt; =C2=A0DISABLE_STATIC_pn-qemu =3D &quot;&quot;<br>
&gt; @@ -32,4 +32,4 @@ DISABLE_STATIC_pn-libusb1-native =3D &quot;&quot;<br=
>
&gt;<br>
&gt; =C2=A0EXTRA_OECONF_append =3D &quot;${DISABLE_STATIC}&quot;<br>
&gt;<br>
&gt; -EXTRA_OECMAKE_append_pn-libical =3D &quot;-DSHARED_ONLY=3DTrue&quot;<=
br>
&gt; +EXTRA_OECMAKE_append_pn-libical ?=3D &quot;-DSHARED_ONLY=3DTrue&quot;=
<br>
&gt; --<br>
&gt; 2.6.4<br>
&gt;<br></span><span class=3D"HOEnZb"><font color=3D"#888888">
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core</a><br>
</font></span></p>
</blockquote></div><br></div>

--001a113ee3fc9828470532250738--
