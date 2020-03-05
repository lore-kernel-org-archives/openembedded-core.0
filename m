Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 22EAF61125
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 16:45:02 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id y204so4008023vsy.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2020 08:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7JBdvgDeYdKE/Sryvxno2uyCUb4OqDv8p69UKh+VVZ4=;
	b=dHJ8euUZfGFTUJYt0H/a3Y2xjiKShSxMXIQeh0GCSXD+SD70L+SK97b+C/NF7+vnyY
	va0ExVMCVTEv9Gbgpc1UFAw0I6inNKtLrLdWNxIqUyq+0dXR3W8kzulDVm5CR6u3Fup4
	JNmykfmX5JOmvgVWyyXc0LMNpMYObdy6yuLzJ8eOf/6ygp9lNoNEdPhoqexoKNm1Dbpw
	jXbG0yjlD9VeQcQzkhYLcbAWdj06u+LPDabg3hyXzTUG/lARkducsdw8y0g3PUgqOPOf
	VhBnYzEvQIGGnBRRgT2bqqLrItflgWpxXGr+WhOUBCwNBrzvLHLA3pT0WTs/Zk5QgUX+
	09pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7JBdvgDeYdKE/Sryvxno2uyCUb4OqDv8p69UKh+VVZ4=;
	b=Cyp2Qp8tm+cBftqyuQfGV9xOMx07upC9OkO1iSR4r3ig+qpW/eOOVFLc6dZifeDFet
	G5Hq6ybQOTwQxVvGUxA3aT9DRraKgurRhcLiqAUr8/R3+axv9cTos9d0CJJGJg+gFqz1
	9VZurGvx8M/MMnANcGs9477fM4a0exk3Gg6yezvKy2iH5mGQjH0hFsQKDqtQILGStsjF
	xk/oh3RWeCXzvwj35fLNuEFEUrMidQnKa4zOYGLUjaYky5O8T8QB9+GabJgjrCmYkjl1
	uaxjQ5KG+VU8/OQNrPmnCDcX7vTpPOp+60vPZ3fKfAc0ohpvAquS/20woBjqfkuBK7oI
	0sSQ==
X-Gm-Message-State: ANhLgQ1PD6PzS59SXgTazsbH7WDHNawYnlV1vioIyZqscakON7y/47Km
	b1cNGhMxf9M72jdRWxZOpzp3AmIHiN23AI+/WKvsyg==
X-Google-Smtp-Source: ADFU+vvPDlR3foNu8iyJ35C1q596GhXxic8BdCliE1PJiaXaHyj443gAkF8zI3oQryCF+K5RZs0bI/N+N5RfwR19eiI=
X-Received: by 2002:a05:6102:103:: with SMTP id
	z3mr5846992vsq.23.1583426703698; 
	Thu, 05 Mar 2020 08:45:03 -0800 (PST)
MIME-Version: 1.0
References: <20200304101307.31198-1-alex.kanavin@gmail.com>
	<e4bb4e709193acf371cf4c5afce4e6a8d1936a52.camel@andred.net>
In-Reply-To: <e4bb4e709193acf371cf4c5afce4e6a8d1936a52.camel@andred.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 Mar 2020 17:44:52 +0100
Message-ID: <CANNYZj_-om40Ejv2e8TpajUW=yhsedkyjPEJWi=BaY-qMvcw-Q@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-firmware: use 'make install' for installation
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
X-List-Received-Date: Thu, 05 Mar 2020 16:45:03 -0000
Content-Type: multipart/alternative; boundary="00000000000033ad8e05a01e427e"

--00000000000033ad8e05a01e427e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Right I think this should be easy to fix, we need to copy LICENSE.*
manually. I'll get to it soon.

Alex

On Thu, 5 Mar 2020 at 17:20, Andr=C3=A9 Draszik <git@andred.net> wrote:

> On Wed, 2020-03-04 at 11:13 +0100, Alexander Kanavin wrote:
> > Copying the source tree over was missing important symlinks
> > that since recent updates can only be created with make install.
>
> Thanks for the quick fix Alex, but unfortunately now all the -license
> packages
> are non-existent and image creation fails, because their install: target
> doesn't copy the license files.
>
> Cheers,
> Andre'
>
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  .../linux-firmware/linux-firmware_20200122.bb | 22 +------------------
> >  1 file changed, 1 insertion(+), 21 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux-firmware/
> linux-firmware_20200122.bb b/meta/recipes-kernel/linux-firmware/linux-
> > firmware_20200122.bb
> > index 0d1422cfca..f7198cb56a 100644
> > --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
> > +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
> > @@ -208,27 +208,7 @@ do_compile() {
> >  }
> >
> >  do_install() {
> > -     install -d  ${D}${nonarch_base_libdir}/firmware/
> > -     cp -r * ${D}${nonarch_base_libdir}/firmware/
> > -
> > -     # Avoid Makefile to be deployed
> > -     rm ${D}${nonarch_base_libdir}/firmware/Makefile
> > -
> > -     # Remove unbuild firmware which needs cmake and bash
> > -     rm ${D}${nonarch_base_libdir}/firmware/carl9170fw -rf
> > -
> > -     # Remove pointless bash script
> > -     rm ${D}${nonarch_base_libdir}/firmware/configure
> > -
> > -     # Remove python script used to check the WHENCE file
> > -     rm ${D}${nonarch_base_libdir}/firmware/check_whence.py
> > -
> > -     # Libertas sd8686
> > -     ln -sf libertas/sd8686_v9.bin
> ${D}${nonarch_base_libdir}/firmware/sd8686.bin
> > -     ln -sf libertas/sd8686_v9_helper.bin
> ${D}${nonarch_base_libdir}/firmware/sd8686_helper.bin
> > -
> > -     # fixup wl12xx location, after 2.6.37 the kernel searches a
> different location for it
> > -     ( cd ${D}${nonarch_base_libdir}/firmware ; ln -sf
> ti-connectivity/* . )
> > +        oe_runmake 'DESTDIR=3D${D}' install
> >  }
> >
> >
> > --
> > 2.25.1
> >
>
>

--00000000000033ad8e05a01e427e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Right I think this should be easy to fix, we need to =
copy LICENSE.* manually. I&#39;ll get to it soon.</div><div><br></div><div>=
Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, 5 Mar 2020 at 17:20, Andr=C3=A9 Draszik &lt;<a href=
=3D"mailto:git@andred.net">git@andred.net</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Wed, 2020-03-04 at 11:13 +0100,=
 Alexander Kanavin wrote:<br>
&gt; Copying the source tree over was missing important symlinks<br>
&gt; that since recent updates can only be created with make install.<br>
<br>
Thanks for the quick fix Alex, but unfortunately now all the -license packa=
ges<br>
are non-existent and image creation fails, because their install: target<br=
>
doesn&#39;t copy the license files.<br>
<br>
Cheers,<br>
Andre&#39;<br>
<br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../linux-firmware/<a href=3D"http://linux-firmware_20200122.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-firmware_20200122.bb</a> | 22 +=
------------------<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 21 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linu=
x-firmware_20200122.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware=
_20200122.bb</a> b/meta/recipes-kernel/linux-firmware/linux-<br>
&gt; <a href=3D"http://firmware_20200122.bb" rel=3D"noreferrer" target=3D"_=
blank">firmware_20200122.bb</a><br>
&gt; index 0d1422cfca..f7198cb56a 100644<br>
&gt; --- a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmw=
are_20200122.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_202001=
22.bb</a><br>
&gt; +++ b/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmw=
are_20200122.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_202001=
22.bb</a><br>
&gt; @@ -208,27 +208,7 @@ do_compile() {<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_install() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0install -d=C2=A0 ${D}${nonarch_base_libdir}/firmw=
are/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0cp -r * ${D}${nonarch_base_libdir}/firmware/<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# Avoid Makefile to be deployed<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm ${D}${nonarch_base_libdir}/firmware/Makefile<b=
r>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# Remove unbuild firmware which needs cmake and b=
ash<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm ${D}${nonarch_base_libdir}/firmware/carl9170fw=
 -rf<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# Remove pointless bash script<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm ${D}${nonarch_base_libdir}/firmware/configure<=
br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# Remove python script used to check the WHENCE f=
ile<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm ${D}${nonarch_base_libdir}/firmware/check_when=
ce.py<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# Libertas sd8686<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ln -sf libertas/sd8686_v9.bin ${D}${nonarch_base_=
libdir}/firmware/sd8686.bin<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ln -sf libertas/sd8686_v9_helper.bin ${D}${nonarc=
h_base_libdir}/firmware/sd8686_helper.bin<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# fixup wl12xx location, after 2.6.37 the kernel =
searches a different location for it<br>
&gt; -=C2=A0 =C2=A0 =C2=A0( cd ${D}${nonarch_base_libdir}/firmware ; ln -sf=
 ti-connectivity/* . )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake &#39;DESTDIR=3D${D}&#39; insta=
ll<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
<br>
</blockquote></div>

--00000000000033ad8e05a01e427e--
