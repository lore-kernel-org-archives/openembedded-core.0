Return-Path: <mike@foundries.io>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 296857D202
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2019 22:22:22 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id e80so11429061ote.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2019 15:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8Qs9Y7s3+yBNIjNDCais2mOjXgwmEzaLf1cfHlDadGg=;
	b=rIXYfT8RFgEyXTtkksKIQ35t5lIpLc/qtprLAsoWDwpHW2Jb9qvrL4rHY43NEC2IgU
	Ejt5IspIIF+BzTNHmYGbASsliXnyg0UddUEgoZdOMAsyTMHBV9FeWpvqFaNr/n/aBUml
	nm3SysKzFK3ZBrlFkhnKbn8m/FcOS8ByWolGlFwPpGtcuWS3beKNl2RVVHEWLnOMQ/I+
	iBrsJNZ5bZ5uSglNyFE1sVtc28Jnb4sbqofs2mLorr+1atSnRKdLMtgA8N819KCzhkkO
	PBepn5JAehhCDZ8IBNWiC32YauLxh6eBtnI2rOIoqa6nDgk9+Rvz07+0tWso8LxJ0er5
	QajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8Qs9Y7s3+yBNIjNDCais2mOjXgwmEzaLf1cfHlDadGg=;
	b=pptw2CCQRYh5pzxiQ0Sj6wZcOpid6eV43T6Ywux/FR5CcH3XjUifnB9LcaYyX/aEkM
	RmLz9eSqbeRFeDasCmJ7t5xpTW5exc0Kq4CF49+KPly9z3W1h13Hz4pH7VCd6DCVfw6o
	plx1noJxzSA9vL8BpmQ81rJ9diaxxxw+ug5ETppmKohUOoZL5AieekJM5Yw0KgztKnQs
	DBXchehqYsdoGFpfuKwMQI5KDe4ywxNztGtEPggg8GPK9C0N/rLd+RudsaFhityJwKic
	Xeli5wUI8krElIhF5VHBu0BWmDdNG1lVbYyuj728geGbPMBFZeewLQ11q3fHrps3oecR
	Xu0g==
X-Gm-Message-State: APjAAAVYszOrzl229JTvV6iXRggMsBbFjstxvcNVPQFZehM1Fao2R7Kn
	ir62IWNWnMKGmACwj2Hk1dVQ8ct4E2r76hzaCY/E8A==
X-Google-Smtp-Source: APXvYqxmXQiElz8/rHSP46rndxMv+CRRRjPwLORtKqaMZTagBuT8jGsye8GUaMKjDRH36iKV9mTPBSQizm8xLbWAAAo=
X-Received: by 2002:a9d:5d03:: with SMTP id b3mr40370667oti.268.1555194143610; 
	Sat, 13 Apr 2019 15:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190412054625.9447-1-mike@foundries.io>
	<CAKmqyKPW93Z5ovf3kLe3VteXNEr0Z45YUNShakwcCN7bJvnG9Q@mail.gmail.com>
	<2cc02705-6ee2-cf74-1e87-7865b6d790b1@foundries.io>
	<CAKmqyKNkz0cYrPddfQocs66N8QBMHFGsn_fSpcrj3_j5kXGC6g@mail.gmail.com>
In-Reply-To: <CAKmqyKNkz0cYrPddfQocs66N8QBMHFGsn_fSpcrj3_j5kXGC6g@mail.gmail.com>
From: Michael Scott <mike@foundries.io>
Date: Sat, 13 Apr 2019 15:22:12 -0700
Message-ID: <CAOBVRDYfqpwXcX6SNuVnrKhAOqjBD6f8DNdHeUu8TbjAN5nEfw@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-fitimage: support RISC-V
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
X-List-Received-Date: Sat, 13 Apr 2019 22:22:23 -0000
Content-Type: multipart/alternative; boundary="0000000000007caf4d058670dade"

--0000000000007caf4d058670dade
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 13, 2019, 1:49 PM Alistair Francis <alistair23@gmail.com> wrote=
:

> On Fri, Apr 12, 2019 at 9:56 PM Michael Scott <mike@foundries.io> wrote:
> >
> >
> > On 4/12/19 10:17 AM, Alistair Francis wrote:
> > > On Thu, Apr 11, 2019 at 10:46 PM Michael Scott <mike@foundries.io>
> wrote:
> > >> Support RISC-V kernel image, using the "Image" target.
> > >>
> > >> This change allows RISC-V support for fitImage via the following
> > >> flow: OpenSBI -> u-boot (as payload) -> Linux kernel (as fitImage
> > >> with ramdisk and dtb).
> > >>
> > >> This was tested using QEMU RISC-V 64-bit.
> > > Do you mind sharing how you tested this? I would be interested in
> > > trying this as well.
> > The current OE-based manifest for the Foundries.io Linux microPlatform
> > is found here (v42):
> > https://github.com/foundriesio/lmp-manifest
> >
> > However, I think you're interested in seeing the
> > opensbi/u-boot/fit-image work for qemuriscv64, and that won't land unti=
l
> > v43 (along with kernel 5.0.6 update).
> >
> > It should be ready in a few days.  I can send you a private ping then,
> > if you'd like.
>
> If you wouldn't mind that would be great! I'm interested in adding FIT
> image OpenSBI -> u-boot -> Linux boot support to meta-riscv.
>

Ah, in that case it's fairly easy.  We're using master branch meta-riscv
with this PR: https://github.com/foundriesio/meta-lmp/pull/27

- Mike


> Alistair
>
> >
> > The documentation is here:
> > https://docs.foundries.io/latest/reference/linux-building.html
> >
> > - Mike
> >
> > >
> > > Alistair
> > >
> > >> Signed-off-by: Michael Scott <mike@foundries.io>
> > >> ---
> > >>   meta/classes/kernel-fitimage.bbclass | 2 ++
> > >>   1 file changed, 2 insertions(+)
> > >>
> > >> diff --git a/meta/classes/kernel-fitimage.bbclass
> b/meta/classes/kernel-fitimage.bbclass
> > >> index 2517d75746..2820ff9689 100644
> > >> --- a/meta/classes/kernel-fitimage.bbclass
> > >> +++ b/meta/classes/kernel-fitimage.bbclass
> > >> @@ -10,6 +10,8 @@ python __anonymous () {
> > >>           uarch =3D d.getVar("UBOOT_ARCH")
> > >>           if uarch =3D=3D "arm64":
> > >>               replacementtype =3D "Image"
> > >> +        elif uarch =3D=3D "riscv":
> > >> +            replacementtype =3D "Image"
> > >>           elif uarch =3D=3D "mips":
> > >>               replacementtype =3D "vmlinuz.bin"
> > >>           elif uarch =3D=3D "x86":
> > >> --
> > >> 2.21.0
> > >>
> > >> --
> > >> _______________________________________________
> > >> Openembedded-core mailing list
> > >> Openembedded-core@lists.openembedded.org
> > >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> > --
> > Michael Scott
> > Embedded Software Engineer at Foundries.io
> > "microPlatforms=E2=84=A2 for Connected Products"
> > E: mike@foundries.io
> > W: https://www.foundries.io
> >
>

--0000000000007caf4d058670dade
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sat, Apr 13, 2019, 1:49 PM Alistair Francis &lt;<a =
href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">On Fri, Apr 12, 2019 at 9:56 PM Micha=
el Scott &lt;<a href=3D"mailto:mike@foundries.io" target=3D"_blank" rel=3D"=
noreferrer">mike@foundries.io</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 4/12/19 10:17 AM, Alistair Francis wrote:<br>
&gt; &gt; On Thu, Apr 11, 2019 at 10:46 PM Michael Scott &lt;<a href=3D"mai=
lto:mike@foundries.io" target=3D"_blank" rel=3D"noreferrer">mike@foundries.=
io</a>&gt; wrote:<br>
&gt; &gt;&gt; Support RISC-V kernel image, using the &quot;Image&quot; targ=
et.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; This change allows RISC-V support for fitImage via the follow=
ing<br>
&gt; &gt;&gt; flow: OpenSBI -&gt; u-boot (as payload) -&gt; Linux kernel (a=
s fitImage<br>
&gt; &gt;&gt; with ramdisk and dtb).<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; This was tested using QEMU RISC-V 64-bit.<br>
&gt; &gt; Do you mind sharing how you tested this? I would be interested in=
<br>
&gt; &gt; trying this as well.<br>
&gt; The current OE-based manifest for the Foundries.io Linux microPlatform=
<br>
&gt; is found here (v42):<br>
&gt; <a href=3D"https://github.com/foundriesio/lmp-manifest" rel=3D"norefer=
rer noreferrer" target=3D"_blank">https://github.com/foundriesio/lmp-manife=
st</a><br>
&gt;<br>
&gt; However, I think you&#39;re interested in seeing the<br>
&gt; opensbi/u-boot/fit-image work for qemuriscv64, and that won&#39;t land=
 until<br>
&gt; v43 (along with kernel 5.0.6 update).<br>
&gt;<br>
&gt; It should be ready in a few days.=C2=A0 I can send you a private ping =
then,<br>
&gt; if you&#39;d like.<br>
<br>
If you wouldn&#39;t mind that would be great! I&#39;m interested in adding =
FIT<br>
image OpenSBI -&gt; u-boot -&gt; Linux boot support to meta-riscv.<br></blo=
ckquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Ah, in th=
at case it&#39;s fairly easy.=C2=A0 We&#39;re using master branch meta-risc=
v with this PR:=C2=A0<a href=3D"https://github.com/foundriesio/meta-lmp/pul=
l/27">https://github.com/foundriesio/meta-lmp/pull/27</a></div><div dir=3D"=
auto"><br></div><div dir=3D"auto">- Mike</div><div dir=3D"auto"><br></div><=
div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Alistair<br>
<br>
&gt;<br>
&gt; The documentation is here:<br>
&gt; <a href=3D"https://docs.foundries.io/latest/reference/linux-building.h=
tml" rel=3D"noreferrer noreferrer" target=3D"_blank">https://docs.foundries=
.io/latest/reference/linux-building.html</a><br>
&gt;<br>
&gt; - Mike<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Alistair<br>
&gt; &gt;<br>
&gt; &gt;&gt; Signed-off-by: Michael Scott &lt;<a href=3D"mailto:mike@found=
ries.io" target=3D"_blank" rel=3D"noreferrer">mike@foundries.io</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;=C2=A0 =C2=A0meta/classes/kernel-fitimage.bbclass | 2 ++<br>
&gt; &gt;&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/clas=
ses/kernel-fitimage.bbclass<br>
&gt; &gt;&gt; index 2517d75746..2820ff9689 100644<br>
&gt; &gt;&gt; --- a/meta/classes/kernel-fitimage.bbclass<br>
&gt; &gt;&gt; +++ b/meta/classes/kernel-fitimage.bbclass<br>
&gt; &gt;&gt; @@ -10,6 +10,8 @@ python __anonymous () {<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uarch =3D d.getVar(&q=
uot;UBOOT_ARCH&quot;)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if uarch =3D=3D &quot=
;arm64&quot;:<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0replace=
menttype =3D &quot;Image&quot;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif uarch =3D=3D &quot;riscv&qu=
ot;:<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 replacementtype =
=3D &quot;Image&quot;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif uarch =3D=3D &qu=
ot;mips&quot;:<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0replace=
menttype =3D &quot;vmlinuz.bin&quot;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif uarch =3D=3D &qu=
ot;x86&quot;:<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; 2.21.0<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; _______________________________________________<br>
&gt; &gt;&gt; Openembedded-core mailing list<br>
&gt; &gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" t=
arget=3D"_blank" rel=3D"noreferrer">Openembedded-core@lists.openembedded.or=
g</a><br>
&gt; &gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer noreferrer" target=3D"_blank">http://list=
s.openembedded.org/mailman/listinfo/openembedded-core</a><br>
&gt;<br>
&gt; --<br>
&gt; Michael Scott<br>
&gt; Embedded Software Engineer at Foundries.io<br>
&gt; &quot;microPlatforms=E2=84=A2 for Connected Products&quot;<br>
&gt; E: <a href=3D"mailto:mike@foundries.io" target=3D"_blank" rel=3D"noref=
errer">mike@foundries.io</a><br>
&gt; W: <a href=3D"https://www.foundries.io" rel=3D"noreferrer noreferrer" =
target=3D"_blank">https://www.foundries.io</a><br>
&gt;<br>
</blockquote></div></div></div>

--0000000000007caf4d058670dade--
