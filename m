Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 849347FE80
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2020 20:25:41 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id z14so5157185qkg.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2020 12:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9FP6GO+jW+WrTBLL+8OGCvL5sBjEMX+3QEQSfaXHMEU=;
	b=SpCX5yk6plCgUSCEa7ZXmYIrAXkxd0J5EgagBzZU/CMOJybTQKbUofvzXEAkJB+eJv
	/9VKT788pKNQpk8duLOYEWcpxiHGHQnGre+T8M2HIHplKVqOLAsXbLUzYEKN/SPGQudB
	vYueAOUgNQPJ18QQ8NHyUVt90oLL8Kz4T8f4u//BPOUi069mpRU4Iefk3lFhxFp+yQ90
	FqGR+PJ1l0U1AdDAeHdALvYmJgg1/tEs+vxIy1xH8TVz650bly2FfUAXmKEUsVyzDigz
	GB6gDq/MPiubMX7JuOIFsfyd8n11yBdarRip1FSXNUYRQktds674UZtvGnVIcPHzu2Sj
	XC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9FP6GO+jW+WrTBLL+8OGCvL5sBjEMX+3QEQSfaXHMEU=;
	b=AMozWruog8dpVweQk2dxsuCCm0lccICeUN/VDQppiugpbwK+qjFlV8yBNlbyerdNyU
	UBJeO3c7mhwMvapOlQhAZHxXORvOtWUO5QO02mVArPg5lg8Gufx22NMoP07iVuKXVPft
	fYq/jCUYa5HxuKXCTg0MFm6hy2tfg7xtLWP7D70vtFBlCPUZw1Yu6yD2K0d+3Wx44pmP
	29b31ljTQavwGE7Cun6FB54gz9xqbcL8wkdOwghgBpyJJpcnm6gW9ahviPJfTIaGsvy8
	UQSKq4x2iRpGwGH9pOFqYrrwxipkqk+kkC6JG/UWP1PtNteLXPRocoei3VbC2LFnp6nq
	o16Q==
X-Gm-Message-State: APjAAAVy0Ceef/Nc3wG2gQfuS8a53tGHz1o+wFEH/n35ZtbuA6bpDodk
	8RW4DaccAJFovyDUkItMyImRC2MNoh6jZm4SyiA=
X-Google-Smtp-Source: APXvYqxL14eD/GKVDFu8ro8YuR6VUqBz6ethM3cigZk4oOAtK94SglTByL3kvR0o3R/kuH4wCxEq/N5ALbbXHgqgPJw=
X-Received: by 2002:a37:bf82:: with SMTP id p124mr9421156qkf.337.1578774341969;
	Sat, 11 Jan 2020 12:25:41 -0800 (PST)
MIME-Version: 1.0
References: <20200110172938.3060002-1-raj.khem@gmail.com>
	<b5b04e547e8c4816109af537260e5cbdb86e3c0d.camel@linuxfoundation.org>
In-Reply-To: <b5b04e547e8c4816109af537260e5cbdb86e3c0d.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 11 Jan 2020 12:25:30 -0800
Message-ID: <CAMKF1srd9c8+yQO640y2rDFG=z17-9yAfsozYv7QPHMq44GprQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] qemuboot-mips: Enable VGA device
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
X-List-Received-Date: Sat, 11 Jan 2020 20:25:41 -0000
Content-Type: multipart/alternative; boundary="000000000000d56b6b059be30be7"

--000000000000d56b6b059be30be7
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 11, 2020 at 1:16 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2020-01-10 at 09:29 -0800, Khem Raj wrote:
> > This helps in booting weston images ( core-image-weston ) with fbdev
> > backend, without this westons initialization of fbdev backend fails
> > because it does not get correct frame buffer settings and exits
> > pre-maturely
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/conf/machine/include/qemuboot-mips.inc | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/meta/conf/machine/include/qemuboot-mips.inc
> b/meta/conf/machine/include/qemuboot-mips.inc
> > index 978820a2e0..52cb28a5d2 100644
> > --- a/meta/conf/machine/include/qemuboot-mips.inc
> > +++ b/meta/conf/machine/include/qemuboot-mips.inc
> > @@ -5,3 +5,8 @@ QB_KERNEL_CMDLINE_APPEND = "console=ttyS0 console=tty"
> >  QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
> >  # Add the 'virtio-rng-pci' device otherwise the guest may run out of
> entropy
> >  QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0
> -device virtio-rng-pci,rng=rng0"
> > +
> > +# For graphics to work we need to define the VGA device as well as the
> necessary USB devices
> > +QB_OPT_APPEND = "-show-cursor -device VGA,edid=on"
> > +QB_OPT_APPEND += "-device qemu-xhci -device usb-tablet -device usb-kbd"
> > +
>
> The change is probably good but it causes consistent failures in out
> testimage runs for mips and mips64:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/1429
> https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/196
> https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/1431
>
> all due to errors appearing in the logs.


Is it due to glibc 2.31 that we were discussing or a separate issue

>
>
> Cheers,
>
> Richard
>
>

--000000000000d56b6b059be30be7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Jan 11, 2020 at 1:16 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, 2020-=
01-10 at 09:29 -0800, Khem Raj wrote:<br>
&gt; This helps in booting weston images ( core-image-weston ) with fbdev<b=
r>
&gt; backend, without this westons initialization of fbdev backend fails<br=
>
&gt; because it does not get correct frame buffer settings and exits<br>
&gt; pre-maturely<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/machine/include/qemuboot-mips.inc | 5 +++++<br>
&gt;=C2=A0 1 file changed, 5 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/conf/machine/include/qemuboot-mips.inc b/meta/conf/m=
achine/include/qemuboot-mips.inc<br>
&gt; index 978820a2e0..52cb28a5d2 100644<br>
&gt; --- a/meta/conf/machine/include/qemuboot-mips.inc<br>
&gt; +++ b/meta/conf/machine/include/qemuboot-mips.inc<br>
&gt; @@ -5,3 +5,8 @@ QB_KERNEL_CMDLINE_APPEND =3D &quot;console=3DttyS0 con=
sole=3Dtty&quot;<br>
&gt;=C2=A0 QB_OPT_APPEND =3D &quot;-show-cursor -usb -device usb-tablet&quo=
t;<br>
&gt;=C2=A0 # Add the &#39;virtio-rng-pci&#39; device otherwise the guest ma=
y run out of entropy<br>
&gt;=C2=A0 QB_OPT_APPEND +=3D &quot;-object rng-random,filename=3D/dev/uran=
dom,id=3Drng0 -device virtio-rng-pci,rng=3Drng0&quot;<br>
&gt; +<br>
&gt; +# For graphics to work we need to define the VGA device as well as th=
e necessary USB devices<br>
&gt; +QB_OPT_APPEND =3D &quot;-show-cursor -device VGA,edid=3Don&quot;<br>
&gt; +QB_OPT_APPEND +=3D &quot;-device qemu-xhci -device usb-tablet -device=
 usb-kbd&quot;<br>
&gt; +<br>
<br>
The change is probably good but it causes consistent failures in out<br>
testimage runs for mips and mips64:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/60/build=
s/1429" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/60/builds/1429</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/102/buil=
ds/196" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/102/builds/196</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/74/build=
s/1431" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/74/builds/1431</a><br>
<br>
all due to errors appearing in the logs.</blockquote><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Is it due to glibc 2.31 that we were discussing or =
a separate issue=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--000000000000d56b6b059be30be7--
