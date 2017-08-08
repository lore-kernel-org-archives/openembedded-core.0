Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4E36B6E668
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 11:26:22 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id c74so12499622iod.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Aug 2017 04:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8DOMxUXGPNuKsZSEbJPSSSfpGK7Ex/RxiISA2awR6+0=;
	b=rOQZs3LDMARc8L1W5/07uMpzmtSYWKaDSV8xK0RgcIm3lWNMmqdxQCIu6wwJptOTay
	OMf88vMa0ZOoeMm3dcNmG7l2j4dDxkGcjPHZUHam7d0NAlV/PkcDmw+c7BJvMMOxf0hQ
	oXTKAR3DS9YnFLrlyDOcMiJVQVVNoSAxFd9AWDJOLxybCuhYrx20hyC2hHOy79TjDtr2
	fL9v7xS5DTC+756CxZIO1xAOxsZqE0DSCJkWnerHLy8UdtQB9jkYTbXbxpio6ooKBrC1
	sWEPk7OC4c4nJarkDpfBpCfwR8w4mG9bqOQk7tphzPDR8ylag0eZY2SIjca5KIWBgchJ
	nnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8DOMxUXGPNuKsZSEbJPSSSfpGK7Ex/RxiISA2awR6+0=;
	b=nA9i2c3HesF4HChMYn7GEBC5e6sooqcrUgqV6rALMtd4SLRyjETAwH0WlsHHt/pPAX
	f2kIu0NxI7l6jECS7qWD3CIINQIrkd2znvM3YooY5h0oiBnyuNOhgW7FBVN7oUc7aYoy
	HdvSWra0QvbLIapPfu+8CSKwg2J2Yd5OdboEjE8zUow3/Pk/WaF5g2Yh265xBQS+k/IS
	TNBjkFiXjw6FDdvjEX6/aldQDgX68f2w7zVmhHpCIoh/77eJebhbUj2KwNJ7NYGQW4n5
	LxkUlM7Iu3CZyBDkib0du349PIdlPFcIpwQknxyKx2m1bBQx2H2uxNeRqsEJ/vPzPzra
	7BSA==
X-Gm-Message-State: AHYfb5gfmBL7eDkr+3ItQuKCLRptY1id06JPSJVKa3DrejbdwpzyDSia
	KrWyJSertGVpQdYLhjWq+udA2HSBK3Md
X-Received: by 10.107.25.137 with SMTP id 131mr3076701ioz.153.1502191584378;
	Tue, 08 Aug 2017 04:26:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.141.19 with HTTP; Tue, 8 Aug 2017 04:25:53 -0700 (PDT)
In-Reply-To: <81ac9233-1a45-185d-1a83-a6be11db1f3c@windriver.com>
References: <1501506693-13285-1-git-send-email-zhe.he@windriver.com>
	<81ac9233-1a45-185d-1a83-a6be11db1f3c@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 8 Aug 2017 14:25:53 +0300
Message-ID: <CAHiDW_HBhnb4RWo+LFhO433-j3UrJfG7ezVTBmDAuMy52cidOw@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemux86 qemux86-64: Enable pci
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
X-List-Received-Date: Tue, 08 Aug 2017 11:26:23 -0000
Content-Type: multipart/alternative; boundary="001a113fd62ec597db05563c3b4f"

--001a113fd62ec597db05563c3b4f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch is in the master-next branch: that's a good indication it'll
move to master when master is next updated (assuming no problems come up in
testing).

  Jussi

On 8 August 2017 at 13:53, He Zhe <zhe.he@windriver.com> wrote:

> Ping.
>
> On 2017=E5=B9=B407=E6=9C=8831=E6=97=A5 21:11, zhe.he@windriver.com wrote:
> > From: He Zhe <zhe.he@windriver.com>
> >
> > lspci and some other software require "pci" in MACHINE_FEATURES and PCI
> > is valid in the qemux86* context.
> >
> > Signed-off-by: He Zhe <zhe.he@windriver.com>
> > ---
> >  meta/conf/machine/qemux86-64.conf | 2 +-
> >  meta/conf/machine/qemux86.conf    | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/conf/machine/qemux86-64.conf
> b/meta/conf/machine/qemux86-64.conf
> > index 4f30033..9f78191 100644
> > --- a/meta/conf/machine/qemux86-64.conf
> > +++ b/meta/conf/machine/qemux86-64.conf
> > @@ -28,7 +28,7 @@ XSERVER =3D "xserver-xorg \
> >             xserver-xorg-module-libint10 \
> >             "
> >
> > -MACHINE_FEATURES +=3D "x86"
> > +MACHINE_FEATURES +=3D "x86 pci"
> >
> >  MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "v86d"
> >
> > diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/
> qemux86.conf
> > index e232947..d778fa7 100644
> > --- a/meta/conf/machine/qemux86.conf
> > +++ b/meta/conf/machine/qemux86.conf
> > @@ -27,7 +27,7 @@ XSERVER =3D "xserver-xorg \
> >             xserver-xorg-module-libint10 \
> >             "
> >
> > -MACHINE_FEATURES +=3D "x86"
> > +MACHINE_FEATURES +=3D "x86 pci"
> >
> >  MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "v86d"
> >
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113fd62ec597db05563c3b4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div>This patch is in the master-next branch: th=
at&#39;s a good indication it&#39;ll move to master when master is next upd=
ated (assuming no problems come up in testing).<div><br></div><div>=C2=A0 J=
ussi<br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 8 Augu=
st 2017 at 13:53, He Zhe <span dir=3D"ltr">&lt;<a href=3D"mailto:zhe.he@win=
driver.com" target=3D"_blank">zhe.he@windriver.com</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">Ping.<br>
<div class=3D"m_-8957092801567660091HOEnZb"><div class=3D"m_-89570928015676=
60091h5"><br>
On 2017=E5=B9=B407=E6=9C=8831=E6=97=A5 21:11, <a href=3D"mailto:zhe.he@wind=
river.com" target=3D"_blank">zhe.he@windriver.com</a> wrote:<br>
&gt; From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D"_bl=
ank">zhe.he@windriver.com</a>&gt;<br>
&gt;<br>
&gt; lspci and some other software require &quot;pci&quot; in MACHINE_FEATU=
RES and PCI<br>
&gt; is valid in the qemux86* context.<br>
&gt;<br>
&gt; Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" targ=
et=3D"_blank">zhe.he@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/machine/qemux86-64.c<wbr>onf | 2 +-<br>
&gt;=C2=A0 meta/conf/machine/qemux86.<wbr>conf=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/conf/machine/qemux86-64<wbr>.conf b/meta/conf/machin=
e/qemux86-64<wbr>.conf<br>
&gt; index 4f30033..9f78191 100644<br>
&gt; --- a/meta/conf/machine/qemux86-64<wbr>.conf<br>
&gt; +++ b/meta/conf/machine/qemux86-64<wbr>.conf<br>
&gt; @@ -28,7 +28,7 @@ XSERVER =3D &quot;xserver-xorg \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xserver-xorg-module-lib=
int10 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt; -MACHINE_FEATURES +=3D &quot;x86&quot;<br>
&gt; +MACHINE_FEATURES +=3D &quot;x86 pci&quot;<br>
&gt;<br>
&gt;=C2=A0 MACHINE_ESSENTIAL_EXTRA_RDEPEN<wbr>DS +=3D &quot;v86d&quot;<br>
&gt;<br>
&gt; diff --git a/meta/conf/machine/<a href=3D"http://qemux86.co">qemux86.c=
o</a><wbr>nf b/meta/conf/machine/<a href=3D"http://qemux86.co">qemux86.co</=
a><wbr>nf<br>
&gt; index e232947..d778fa7 100644<br>
&gt; --- a/meta/conf/machine/<a href=3D"http://qemux86.co">qemux86.co</a><w=
br>nf<br>
&gt; +++ b/meta/conf/machine/<a href=3D"http://qemux86.co">qemux86.co</a><w=
br>nf<br>
&gt; @@ -27,7 +27,7 @@ XSERVER =3D &quot;xserver-xorg \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xserver-xorg-module-lib=
int10 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt; -MACHINE_FEATURES +=3D &quot;x86&quot;<br>
&gt; +MACHINE_FEATURES +=3D &quot;x86 pci&quot;<br>
&gt;<br>
&gt;=C2=A0 MACHINE_ESSENTIAL_EXTRA_RDEPEN<wbr>DS +=3D &quot;v86d&quot;<br>
&gt;<br>
<br>
--<br>
</div></div><div class=3D"m_-8957092801567660091HOEnZb"><div class=3D"m_-89=
57092801567660091h5">______________________________<wbr>_________________<b=
r>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div></div></div>

--001a113fd62ec597db05563c3b4f--
