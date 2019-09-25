Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1843A7E08E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 03:19:07 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id j31so4822812qta.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 20:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=306fJx/ORRcGA+qZa1bz9Ywoiox4PhBaAAELE8a77i0=;
	b=eaJ4+CxbZ1+iKYowN9TdXbYIGBfwVKsuE7tpAkrjybbXw9aJCXYQLkkPFnaH6NELxC
	FeB0vTHkeejwMCFdbnfpM9H6uQtkNsbJPzd7W8paKfyPHKJHXVxmPXkp6I5jOgbkhkRL
	S68TjiHkZna2iTmX9xpLOReXqZOH0phzxFbE5IeeyfQI+evEfmnHNP1R5Gg/eGIdrveH
	GB+TXUIPXAej4iEscGoc9eKgRcer8C42Qy4x8Z5pFJHypuNKwfbLgnnRqUiTCu/ZXn+i
	1Obls6zU76j6Ogh9I/VOgEATErfTKeTYEOAmW3XbqJBMu1vzyhgHwECzwaqk2E5zSiGL
	EP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=306fJx/ORRcGA+qZa1bz9Ywoiox4PhBaAAELE8a77i0=;
	b=BZg6sW5JsqgyLf+vGTg/kLCIwhtaUZLodRjR6w85BDQTDu24WsaT3pUMXF5dFXAV2h
	9VsmRcffpcMdH6mgboL88+NCSE9BjhSP5ThjgB7FlnmA7onXNABorRjNCry+3LAhji2C
	EqXCO/uW7SM4/W1kjwLvbZrOO3jjJOtvgqzY+zXZYDK1U9K5a73E/iJZ1LNltJn0SSdp
	W8/dAHHgLd5jiRa/PDSnLoJi+2/rScZRO4EIG8kKehGcFaT/6rxS2SotMFgY3LNUBBgG
	39WMTmeUSctqBSjmKrEt1rpdkYN8NexvKQeiXe7lUBltB6acRq1yiBnufElK7ijC+8kf
	8F9w==
X-Gm-Message-State: APjAAAXM2knTu56i3fmR8japzm+IOwdaixY7DxokMwWpNNEmD1tKYpTy
	lyDeFgrNJeQw0KS4xOOTTsY4Mu9R9xNMcuP4LaM=
X-Google-Smtp-Source: APXvYqwbzGTv2/KQjdHqK2MELnGd5tlwLPsestwXODCAD8Gec/NajdMJQNeOw72DSNNM59q+hwKQisi/NMLeXvBRm+A=
X-Received: by 2002:ac8:e09:: with SMTP id a9mr3299757qti.88.1569381548492;
	Tue, 24 Sep 2019 20:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sqanCn50yNrGcUDyGZQu9fOXsRZkccvk4o+GvD6F5nPRg@mail.gmail.com>
	<CAKmqyKPkQAHM5+X0QfRAR1wneOe2o1ffBirz0boqv8PetCRVkQ@mail.gmail.com>
	<7e0cc8d45ea1b5556dccf61519de8e0d31575550.camel@wdc.com>
	<CAMKF1sp6hDii_4dH6nrr1VstobnP2sCpyNUy74eiOaJGqVKhNg@mail.gmail.com>
	<CAKmqyKOwPad=m_jN9u-0JmG6XxY86iHf-+QU-zdmPeXizoFfYQ@mail.gmail.com>
	<CAMKF1sqbaTfs9y9XT=S0f86_u-UWT=TQMt07qouKtSxzXcQhFg@mail.gmail.com>
	<CAKmqyKOebbJNoyExJzKd0hr1YTzmmf=4Y22ux9eKEd9vUh6qLg@mail.gmail.com>
In-Reply-To: <CAKmqyKOebbJNoyExJzKd0hr1YTzmmf=4Y22ux9eKEd9vUh6qLg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Sep 2019 20:18:54 -0700
Message-ID: <CAMKF1srZqHHriyD2f385d0EyF3rCno3BtzV6O3nTm99xk_j_uw@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: qemu 4.1 boot regression with riscv/musl
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
X-List-Received-Date: Wed, 25 Sep 2019 03:19:08 -0000
Content-Type: multipart/alternative; boundary="000000000000b70cd20593581d7b"

--000000000000b70cd20593581d7b
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 24, 2019 at 6:09 PM Alistair Francis <alistair23@gmail.com>
wrote:

> I raised the regression on the QEMU mailing list while I was preparing
> the revert for QEMU and Palmer pointed out this diff for musl:
>
> diff --git a/arch/riscv64/atomic_arch.h b/arch/riscv64/atomic_arch.h
> index c9765342..41ad4d04 100644
> --- a/arch/riscv64/atomic_arch.h
> +++ b/arch/riscv64/atomic_arch.h
> @@ -14,7 +14,7 @@ static inline int a_cas(volatile int *p, int t, int s)
>                 "       sc.w.aqrl %1, %4, (%2)\n"
>                 "       bnez %1, 1b\n"
>                 "1:"
> -               : "=&r"(old), "=r"(tmp)
> +               : "=&r"(old), "=&r"(tmp)
>                 : "r"(p), "r"(t), "r"(s)
>                 : "memory");
>         return old;
> @@ -31,7 +31,7 @@ static inline void *a_cas_p(volatile void *p, void
> *t, void *s)
>                 "       sc.d.aqrl %1, %4, (%2)\n"
>                 "       bnez %1, 1b\n"
>                 "1:"
> -               : "=&r"(old), "=r"(tmp)
> +               : "=&r"(old), "=&r"(tmp)
>                 : "r"(p), "r"(t), "r"(s)
>                 : "memory");
>         return old;
>
> This seems to fix the problem for me. Hopefully Palmer will prepare a
> patch then we can just cherry pick that (from the list) on musl in OE
> core.
>
> I'm not going to send out the QEMU revert patch.
>

This is fine I think we were discussing atomics at musl IRC I will take
this patch to discussions

>
> Alistair
>
> On Mon, Sep 23, 2019 at 10:12 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Please send a patch
> >
> > On Mon, Sep 23, 2019 at 9:58 PM Alistair Francis <alistair23@gmail.com>
> wrote:
> > >
> > > On Mon, Sep 23, 2019 at 7:11 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > On Mon, Sep 23, 2019 at 6:39 PM Alistair Francis
> > > > <Alistair.Francis@wdc.com> wrote:
> > > > >
> > > > > On Mon, 2019-09-23 at 17:59 -0700, Alistair Francis wrote:
> > > > > > On Mon, Sep 23, 2019 at 3:40 PM Khem Raj <raj.khem@gmail.com>
> wrote:
> > > > > > > Alistair,
> > > > > > >
> > > > > > > OE-core qemu upgrade to 4.1 has ended up with regressing
> musl/riscv
> > > > > > > port. I could pin point it to
> > > > > > >
> > > > > > >
> https://git.openembedded.org/openembedded-core/commit/?id=50a7dec95618080962e56fd347f505e691b7ad6f
> > > > > > >
> > > > > > > it works fine with 4.0, I havent looked further
> > > > > > >
> > > > > > > To reproduce
> > > > > > >
> > > > > > > build
> > > > > > > MACHINE=qemuriscv64 TCLIBC=musl  bitbake core-image-minimal
> > > > > > > TCLIBC=musl runqemu nographic
> > > > > >
> > > > > > Thanks, I can reproduce this and am bisecting QEMU now.
> > > > >
> > > > > This QEMU patch causes the failure. It reverts cleanly on master
> and
> > > > > that fixes the issue:
> > > > >
> > > > > RISC-V: Clear load reservations on context switch and SC
> > > > >
> > > > > This prevents a load reservation from being placed in one
> > > > > context/process,
> > > > > then being used in another, resulting in an SC succeeding
> incorrectly
> > > > > and
> > > > > breaking atomics.
> > > > >
> > > > > Signed-off-by: Joel Sing <joel@sing.id.au>
> > > > > Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> > > > > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > > > > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> > > > >
> > > > > I'll investigate a full solution tomorrow, in the mean time do you
> want
> > > > > to just revert the patch?
> > > >
> > > > yes lets use the revert for now, this will give you enough time to
> > > > investigate solution
> > > > since its riscv specific it will be low risk and we can even go to
> 3.0
> > > > release with it
> > >
> > > Do you want me to prepare a patch or do you want to do it?
> > >
> > > Alistair
> > >
> > > >
> > > > >
> > > > > Alistair
> > > > >
> > > > > >
> > > > > > Alistair
> > > > > >
> > > > > > > Thanks
> > > > > > > -Khem
> > > > > > > --
> > > > > > > _______________________________________________
> > > > > > > Openembedded-core mailing list
> > > > > > > Openembedded-core@lists.openembedded.org
> > > > > > >
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000b70cd20593581d7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Sep 24, 2019 at 6:09 PM Alistair Francis &lt;<a hre=
f=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">I raised the regression on the QEMU mail=
ing list while I was preparing<br>
the revert for QEMU and Palmer pointed out this diff for musl:<br>
<br>
diff --git a/arch/riscv64/atomic_arch.h b/arch/riscv64/atomic_arch.h<br>
index c9765342..41ad4d04 100644<br>
--- a/arch/riscv64/atomic_arch.h<br>
+++ b/arch/riscv64/atomic_arch.h<br>
@@ -14,7 +14,7 @@ static inline int a_cas(volatile int *p, int t, int s)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0sc.w.aqrl %1, %4, (%2)\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0bnez %1, 1b\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;1:&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;=3D&amp;r&q=
uot;(old), &quot;=3Dr&quot;(tmp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;=3D&amp;r&q=
uot;(old), &quot;=3D&amp;r&quot;(tmp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : &quot;r&quot;(p),=
 &quot;r&quot;(t), &quot;r&quot;(s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : &quot;memory&quot=
;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return old;<br>
@@ -31,7 +31,7 @@ static inline void *a_cas_p(volatile void *p, void<br>
*t, void *s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0sc.d.aqrl %1, %4, (%2)\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0bnez %1, 1b\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;1:&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;=3D&amp;r&q=
uot;(old), &quot;=3Dr&quot;(tmp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;=3D&amp;r&q=
uot;(old), &quot;=3D&amp;r&quot;(tmp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : &quot;r&quot;(p),=
 &quot;r&quot;(t), &quot;r&quot;(s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : &quot;memory&quot=
;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return old;<br>
<br>
This seems to fix the problem for me. Hopefully Palmer will prepare a<br>
patch then we can just cherry pick that (from the list) on musl in OE<br>
core.<br>
<br>
I&#39;m not going to send out the QEMU revert patch.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">This is fine I t=
hink we were discussing atomics at musl IRC I will take this patch to discu=
ssions=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Alistair<br>
<br>
On Mon, Sep 23, 2019 at 10:12 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Please send a patch<br>
&gt;<br>
&gt; On Mon, Sep 23, 2019 at 9:58 PM Alistair Francis &lt;<a href=3D"mailto=
:alistair23@gmail.com" target=3D"_blank">alistair23@gmail.com</a>&gt; wrote=
:<br>
&gt; &gt;<br>
&gt; &gt; On Mon, Sep 23, 2019 at 7:11 PM Khem Raj &lt;<a href=3D"mailto:ra=
j.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Mon, Sep 23, 2019 at 6:39 PM Alistair Francis<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:Alistair.Francis@wdc.com" target=3D"_b=
lank">Alistair.Francis@wdc.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Mon, 2019-09-23 at 17:59 -0700, Alistair Francis wro=
te:<br>
&gt; &gt; &gt; &gt; &gt; On Mon, Sep 23, 2019 at 3:40 PM Khem Raj &lt;<a hr=
ef=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&g=
t; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; Alistair,<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; OE-core qemu upgrade to 4.1 has ended up with=
 regressing musl/riscv<br>
&gt; &gt; &gt; &gt; &gt; &gt; port. I could pin point it to<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"https://git.openembedded.org/opene=
mbedded-core/commit/?id=3D50a7dec95618080962e56fd347f505e691b7ad6f" rel=3D"=
noreferrer" target=3D"_blank">https://git.openembedded.org/openembedded-cor=
e/commit/?id=3D50a7dec95618080962e56fd347f505e691b7ad6f</a><br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; it works fine with 4.0, I havent looked furth=
er<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; To reproduce<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; build<br>
&gt; &gt; &gt; &gt; &gt; &gt; MACHINE=3Dqemuriscv64 TCLIBC=3Dmusl=C2=A0 bit=
bake core-image-minimal<br>
&gt; &gt; &gt; &gt; &gt; &gt; TCLIBC=3Dmusl runqemu nographic<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Thanks, I can reproduce this and am bisecting QEMU=
 now.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This QEMU patch causes the failure. It reverts cleanly =
on master and<br>
&gt; &gt; &gt; &gt; that fixes the issue:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; RISC-V: Clear load reservations on context switch and S=
C<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This prevents a load reservation from being placed in o=
ne<br>
&gt; &gt; &gt; &gt; context/process,<br>
&gt; &gt; &gt; &gt; then being used in another, resulting in an SC succeedi=
ng incorrectly<br>
&gt; &gt; &gt; &gt; and<br>
&gt; &gt; &gt; &gt; breaking atomics.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Joel Sing &lt;<a href=3D"mailto:joel@sin=
g.id.au" target=3D"_blank">joel@sing.id.au</a>&gt;<br>
&gt; &gt; &gt; &gt; Reviewed-by: Palmer Dabbelt &lt;<a href=3D"mailto:palme=
r@sifive.com" target=3D"_blank">palmer@sifive.com</a>&gt;<br>
&gt; &gt; &gt; &gt; Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:ri=
chard.henderson@linaro.org" target=3D"_blank">richard.henderson@linaro.org<=
/a>&gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Palmer Dabbelt &lt;<a href=3D"mailto:pal=
mer@sifive.com" target=3D"_blank">palmer@sifive.com</a>&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I&#39;ll investigate a full solution tomorrow, in the m=
ean time do you want<br>
&gt; &gt; &gt; &gt; to just revert the patch?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; yes lets use the revert for now, this will give you enough t=
ime to<br>
&gt; &gt; &gt; investigate solution<br>
&gt; &gt; &gt; since its riscv specific it will be low risk and we can even=
 go to 3.0<br>
&gt; &gt; &gt; release with it<br>
&gt; &gt;<br>
&gt; &gt; Do you want me to prepare a patch or do you want to do it?<br>
&gt; &gt;<br>
&gt; &gt; Alistair<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Alistair<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Alistair<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Thanks<br>
&gt; &gt; &gt; &gt; &gt; &gt; -Khem<br>
&gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; &gt; _____________________________________________=
__<br>
&gt; &gt; &gt; &gt; &gt; &gt; Openembedded-core mailing list<br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"mailto:Openembedded-core@lists.ope=
nembedded.org" target=3D"_blank">Openembedded-core@lists.openembedded.org</=
a><br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"http://lists.openembedded.org/mail=
man/listinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http:/=
/lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000b70cd20593581d7b--
