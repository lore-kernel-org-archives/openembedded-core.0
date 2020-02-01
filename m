Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
	[209.85.222.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3154260630
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Feb 2020 10:42:24 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id 73so3548494uac.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Feb 2020 02:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vYuXx+O4NA78cB9WYGQ1ko4G3B/jkP9yJgek3D06awg=;
	b=SPaXwBpRqvaDXTYSLRpYCDWiRTK+htF3AYvNAfRjBQzAmC/OXrvCFGkfTSPW2+Rrwm
	vVhsr8MLv0GTIioPS9m8VTywL1LC9hF2CYPbAJSHVxtUB8PVrVIf6GsdWy5ZAIHE8ORn
	wuaEwIQTpT85mBTI25aEi0+C///x/GS4WSEnI73D3mksmAmgpdfavZ4APaleiNPZxShB
	fVqP7cCNRrsqyd4t+JUhGgKwX8594BbC86/vLlsHsG2wEixHIHlcjBRDnMI4uA76lUP+
	eewwGn6gnZ67Ntowg+880j1eVJu8YMmyvMYqB1MN0nC9DzywxAfIK+jC9G/3Udz2A0us
	maZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vYuXx+O4NA78cB9WYGQ1ko4G3B/jkP9yJgek3D06awg=;
	b=WvkAKqfH42Ho1cFW6H1cJkHCokSWr41SrdWR4mnQaPw28Z9brQfeff7U9f8IXCReKn
	VVszt/YPN9D1dR05jIqEMz2w6IXROv78FkhH3wX5dVhPTKRfomvtmpt8S3B4eVQNXABJ
	a3bAKzGjRgzIH05w4rK4a4r5jirAHehLiNLC/JK4chPTnVXoBq8ilS850KpDaeynHDI1
	OBTdbp4l723CwgXrTpfqbDy7IQVskFCf8SQxuA+X2YSAFWv+GAkSYqbpLU/ih3ms27Fg
	/s23vN5bDbdqhppnXMRdcL3JPbP1DQ4c89z+SUreZc+XEWLL4NnYmsmGZuJPmDrxBUeJ
	ZF7w==
X-Gm-Message-State: APjAAAUFnJYbWwg+wprZ/gK7psFO9i56VCCFMyij+OcM8tU/tVz7+fE1
	ZmcgL0ZvLH9mM+1qDGboaItgqCUbdWyuZlH+zfg=
X-Google-Smtp-Source: APXvYqywFQsewtpIoFB9r/9Q4BCIQ+9fUbxCzHDoHjIDfdjI4kcveAgH1xqKaEbHoG+GThBRCMyRd0+UeFp7XR+X8l8=
X-Received: by 2002:ab0:2006:: with SMTP id v6mr8386100uak.22.1580553745028;
	Sat, 01 Feb 2020 02:42:25 -0800 (PST)
MIME-Version: 1.0
References: <20200122054636.10681-1-anuj.mittal@intel.com>
	<2fa3f5b181b91e08037d3662fb48e26589c0a46f.camel@intel.com>
In-Reply-To: <2fa3f5b181b91e08037d3662fb48e26589c0a46f.camel@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 1 Feb 2020 11:42:13 +0100
Message-ID: <CANNYZj8mif1OATTus5B+b=NNS69HsQkNu1ozXjHJtgNemd1c4g@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] stress-ng: upgrade 0.10.15 -> 0.10.16
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
X-List-Received-Date: Sat, 01 Feb 2020 10:42:24 -0000
Content-Type: multipart/alternative; boundary="000000000000855ab7059d815888"

--000000000000855ab7059d815888
Content-Type: text/plain; charset="UTF-8"

I think the patches are in Ross's queue (ross/mut)? Hopefully it's not
forgotten :)

Alex

On Fri, 31 Jan 2020 at 10:32, Mittal, Anuj <anuj.mittal@intel.com> wrote:

> Ping
>
> On Wed, 2020-01-22 at 13:46 +0800, Anuj Mittal wrote:
> > Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > ---
> >  .../stress-ng/{stress-ng_0.10.15.bb => stress-ng_0.10.16.bb}  | 4
> > ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-extended/stress-ng/{stress-ng_0.10.15.bb =>
> > stress-ng_0.10.16.bb} (83%)
> >
> > diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.10.15.bb
> > b/meta/recipes-extended/stress-ng/stress-ng_0.10.16.bb
> > similarity index 83%
> > rename from meta/recipes-extended/stress-ng/stress-ng_0.10.15.bb
> > rename to meta/recipes-extended/stress-ng/stress-ng_0.10.16.bb
> > index 5402130fda..e67b82a527 100644
> > --- a/meta/recipes-extended/stress-ng/stress-ng_0.10.15.bb
> > +++ b/meta/recipes-extended/stress-ng/stress-ng_0.10.16.bb
> > @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "
> > file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> >  SRC_URI = "
> > https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
> >             file://0001-Do-not-preserve-ownership-when-installing-
> > example-jo.patch \
> >             "
> > -SRC_URI[md5sum] = "303a7276e3a9e3dd03be6cabc9e84a75"
> > -SRC_URI[sha256sum] =
> > "1d0ca8a2f287e13c2d36c01e874d16d67bcb368d8d26563324c9aaf0ddb100c1"
> > +SRC_URI[md5sum] = "a337cd5b1412c53c580e95ee2a9fc77b"
> > +SRC_URI[sha256sum] =
> > "eabfffcffcf53e67765181280456c204ad00214339cfdb3ee2769d58b4a7e304"
> >
> >  DEPENDS = "coreutils-native"
> >
> > --
> > 2.21.1
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000855ab7059d815888
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think the patches are in Ross&#39;s queue (ross/mut=
)? Hopefully it&#39;s not forgotten :)<br></div><div><br></div><div>Alex<br=
></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, 31 Jan 2020 at 10:32, Mittal, Anuj &lt;<a href=3D"mailto:anu=
j.mittal@intel.com">anuj.mittal@intel.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Ping<br>
<br>
On Wed, 2020-01-22 at 13:46 +0800, Anuj Mittal wrote:<br>
&gt; Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com=
" target=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../stress-ng/{<a href=3D"http://stress-ng_0.10.15.bb" rel=3D"no=
referrer" target=3D"_blank">stress-ng_0.10.15.bb</a> =3D&gt; <a href=3D"htt=
p://stress-ng_0.10.16.bb" rel=3D"noreferrer" target=3D"_blank">stress-ng_0.=
10.16.bb</a>}=C2=A0 | 4<br>
&gt; ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-extended/stress-ng/{<a href=3D"http://stress=
-ng_0.10.15.bb" rel=3D"noreferrer" target=3D"_blank">stress-ng_0.10.15.bb</=
a> =3D&gt;<br>
&gt; <a href=3D"http://stress-ng_0.10.16.bb" rel=3D"noreferrer" target=3D"_=
blank">stress-ng_0.10.16.bb</a>} (83%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-extended/stress-ng/<a href=3D"http://stress-=
ng_0.10.15.bb" rel=3D"noreferrer" target=3D"_blank">stress-ng_0.10.15.bb</a=
><br>
&gt; b/meta/recipes-extended/stress-ng/<a href=3D"http://stress-ng_0.10.16.=
bb" rel=3D"noreferrer" target=3D"_blank">stress-ng_0.10.16.bb</a><br>
&gt; similarity index 83%<br>
&gt; rename from meta/recipes-extended/stress-ng/<a href=3D"http://stress-n=
g_0.10.15.bb" rel=3D"noreferrer" target=3D"_blank">stress-ng_0.10.15.bb</a>=
<br>
&gt; rename to meta/recipes-extended/stress-ng/<a href=3D"http://stress-ng_=
0.10.16.bb" rel=3D"noreferrer" target=3D"_blank">stress-ng_0.10.16.bb</a><b=
r>
&gt; index 5402130fda..e67b82a527 100644<br>
&gt; --- a/meta/recipes-extended/stress-ng/<a href=3D"http://stress-ng_0.10=
.15.bb" rel=3D"noreferrer" target=3D"_blank">stress-ng_0.10.15.bb</a><br>
&gt; +++ b/meta/recipes-extended/stress-ng/<a href=3D"http://stress-ng_0.10=
.16.bb" rel=3D"noreferrer" target=3D"_blank">stress-ng_0.10.16.bb</a><br>
&gt; @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =3D &quot;<br>
&gt; file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<br>
&gt; <a href=3D"https://kernel.ubuntu.com/~cking/tarballs/$%7BBPN%7D/$%7BBP=
%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://kernel.ubuntu.com/=
~cking/tarballs/${BPN}/${BP}.tar.xz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Do-not-pres=
erve-ownership-when-installing-<br>
&gt; example-jo.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -SRC_URI[md5sum] =3D &quot;303a7276e3a9e3dd03be6cabc9e84a75&quot;<br>
&gt; -SRC_URI[sha256sum] =3D<br>
&gt; &quot;1d0ca8a2f287e13c2d36c01e874d16d67bcb368d8d26563324c9aaf0ddb100c1=
&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;a337cd5b1412c53c580e95ee2a9fc77b&quot;<br>
&gt; +SRC_URI[sha256sum] =3D<br>
&gt; &quot;eabfffcffcf53e67765181280456c204ad00214339cfdb3ee2769d58b4a7e304=
&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 DEPENDS =3D &quot;coreutils-native&quot;<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.21.1<br>
&gt; <br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000855ab7059d815888--
