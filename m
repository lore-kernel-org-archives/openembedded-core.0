Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id ADEC27DFD3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 08:56:40 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id h4so2420599wre.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 01:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JKv7ZMGiuHKD+JDX/iK49pOMBKRcJjIoSKmFSv1eK7Q=;
	b=qmLdBVojnqFC+AN9FqqQb6494xjXMXwdOfdKVPDjq+/6tqVr13SaOu3CrSnC3w21wK
	FEHu9C3dMwfZqv39vdWUJQj3dtMiT6xWqkmbK8vWlJcs0oJJ3C9N93nZso8OGayv+Lwg
	ujtbXt0n8+0U9qDb1aG5luydG0kQbfab/K2J3YhPWVFvrhVmVIWTR2LJNcHoQP3dDByM
	jGxeydejYW3KkO2tUIhe73A1Gktkn6NFVpLV63ODCtUq34MPpO/tCgmswPbPaTsc3HSf
	oePXVmVVbMhNl0pVDgSKkWg3MvZhH9CrsONaUZ/FN34Inp9hEbQvNnrwIDTbG5p0DCay
	WLQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JKv7ZMGiuHKD+JDX/iK49pOMBKRcJjIoSKmFSv1eK7Q=;
	b=qN10I9xBzrTbOvzIf4CeGJqXbOxquIYWIS4lX7yNoimexkZLW0AAZccRZzEvc/8ict
	WOqRwbauiQIN4+zpor+/vUsxQUFGiKXtAZWxw4ps6Q19tGFfFt3hiKO5oWadXjgKm9i4
	zyIjQ1GosdhryTVqWGoKzXFzP5meah+Hob0NUlG2rsDCPgbpnSkJ7zzjMQ/wGckGMEA3
	upD7QABhn5IZEQRw5IviGLJgaRF6dxc/eUYPLtPD2eMJKoRCogTi6PVxZyFRlr6ilNd/
	wYMu3OsYIAwpyf6DTK3Unfz0IcyvsAaDQCFivTFECjUPGghfrCF4qw8H5LsQZFsi+sEp
	wdrQ==
X-Gm-Message-State: APjAAAXoESnBxX7akfdqcKcnKJjtWBoSg4b4gnY6Eh3ONXcJTH3djADi
	Bw8dWDW15FxssLKxRmtNkVr79BE3Fh7ZBBddDgg=
X-Google-Smtp-Source: APXvYqxrbzWuOZ41qgCBRuWDwvMhMqcjm8qk8BppHG0OE4fFQ1BGT6s7Z1G4biwYEY60Vb3MEmr3ZWqExGi7/NI49lM=
X-Received: by 2002:adf:eb89:: with SMTP id t9mr26294419wrn.109.1557997001296; 
	Thu, 16 May 2019 01:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <1557948156-10879-1-git-send-email-liu.ming50@gmail.com>
	<9c2a9bbda97c6540061fd7a945f9d3eba0f1453c.camel@linuxfoundation.org>
In-Reply-To: <9c2a9bbda97c6540061fd7a945f9d3eba0f1453c.camel@linuxfoundation.org>
From: Ming Liu <liu.ming50@gmail.com>
Date: Thu, 16 May 2019 10:56:30 +0200
Message-ID: <CALatG=6FxLPZi00XyRWrbrcsZcnYxjqCJ_ogJK_7q9BwLBWLtg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Stefan Agner <stefan.agner@toradex.com>, Luka Pivk <luka.pivk@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta: handle UBOOT_CONFIG in image.bbclass
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
X-List-Received-Date: Thu, 16 May 2019 08:56:40 -0000
Content-Type: multipart/alternative; boundary="000000000000d2d2880588fd71cf"

--000000000000d2d2880588fd71cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Richard:

> I'd imagine the code is designed so you'd inherit uboot-config in the
machine and this therefore could be made to work as is.

Yes, that probably is how the author intended it to be used, but
unfortunately, that's not how it's being used in BSP layers, that fact is,
in most BSP meta layers, they do not put it into INHERIT, only u-boot
recipes are inheriting uboot-config.

I am on board there is no need to set IMAGE_FSTYPES in
uboot-config.bbclass, maybe we should drop it from UBOOT_CONFIG and it
would be like: 'UBOOT_CONFIG =3D "config,,binary"', there will be a empty
item in the middle, so the BSP meta layers would work as usual.

Will send a V2 if you agree with this.

//Ming Liu

Richard Purdie <richard.purdie@linuxfoundation.org> =E6=96=BC 2019=E5=B9=B4=
5=E6=9C=8816=E6=97=A5 =E9=80=B1=E5=9B=9B
=E4=B8=8A=E5=8D=8810:23=E5=AF=AB=E9=81=93=EF=BC=9A

> On Wed, 2019-05-15 at 21:22 +0200, liu.ming50@gmail.com wrote:
> > From: Ming Liu <liu.ming50@gmail.com>
> >
> > The code dealing with IMAGE_FSTYPES in uboot-config.bbclass would not
> > take any effect since it's in a uboot particular class, but it's not
> > being inherited by any image recipes.
> >
> > Move the IMAGE_FSTYPES handling part to image.bbclass would make it
> > really work.
> >
> > Also drop some trivial debug code.
> >
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > ---
> >  meta/classes/image.bbclass        | 12 ++++++++++++
> >  meta/classes/uboot-config.bbclass | 17 ++++-------------
> >  meta/conf/documentation.conf      |  2 +-
> >  3 files changed, 17 insertions(+), 14 deletions(-)
>
> This doesn't make sense, if we want to set IMAGE_FSTYPES, lets just set
> that.
>
> I'd imagine the code is designed so you'd inherit uboot-config in the
> machine and this therefore could be made to work as is.
>
> Moving the code to image.bbclass is the wrong thing to do though and
> I'd question whether we want UBOOT_CONFIG doing this at all...
>
> Cheers,
>
> Richard
>
>

--000000000000d2d2880588fd71cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi, Richard:</div><div><br></div><di=
v>&gt; I&#39;d imagine the code is designed so you&#39;d inherit uboot-conf=
ig in the machine and this therefore could be made to work as is.</div><div=
><br></div><div>Yes, that probably is how the author intended it to be used=
, but unfortunately, that&#39;s not how it&#39;s being used in BSP layers, =
that fact is, in most BSP meta layers, they do not put it into INHERIT, onl=
y u-boot recipes are inheriting uboot-config.</div><div><br></div><div>I am=
 on board there is no need to set IMAGE_FSTYPES in uboot-config.bbclass, ma=
ybe we should drop it from UBOOT_CONFIG and it would be like: &#39;UBOOT_CO=
NFIG =3D &quot;config,,binary&quot;&#39;, there will be a empty item in the=
 middle, so the BSP meta layers would work as usual.</div><div><br></div><d=
iv>Will send a V2 if you agree with this.</div><div><br></div><div>//Ming L=
iu</div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org">richard.purdie@linuxfoundation.org</a>&gt; =E6=96=BC 2019=E5=
=B9=B45=E6=9C=8816=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8810:23=E5=
=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Wed, 2019-05-15 at 21:22 +0200, <a href=3D"mailto:liu.ming50@=
gmail.com" target=3D"_blank">liu.ming50@gmail.com</a> wrote:<br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_=
blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; <br>
&gt; The code dealing with IMAGE_FSTYPES in uboot-config.bbclass would not<=
br>
&gt; take any effect since it&#39;s in a uboot particular class, but it&#39=
;s not<br>
&gt; being inherited by any image recipes.<br>
&gt; <br>
&gt; Move the IMAGE_FSTYPES handling part to image.bbclass would make it<br=
>
&gt; really work.<br>
&gt; <br>
&gt; Also drop some trivial debug code.<br>
&gt; <br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" ta=
rget=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/image.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 +++++=
+++++++<br>
&gt;=C2=A0 meta/classes/uboot-config.bbclass | 17 ++++-------------<br>
&gt;=C2=A0 meta/conf/documentation.conf=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br=
>
&gt;=C2=A0 3 files changed, 17 insertions(+), 14 deletions(-)<br>
<br>
This doesn&#39;t make sense, if we want to set IMAGE_FSTYPES, lets just set=
<br>
that.<br>
<br>
I&#39;d imagine the code is designed so you&#39;d inherit uboot-config in t=
he<br>
machine and this therefore could be made to work as is.<br>
<br>
Moving the code to image.bbclass is the wrong thing to do though and<br>
I&#39;d question whether we want UBOOT_CONFIG doing this at all...<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--000000000000d2d2880588fd71cf--
