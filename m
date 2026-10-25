Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25390.1792944228067776669
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2026 09:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DQCWi/uc;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b09e07e149so17993897b3.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 09:03:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792944227; cv=none;
        d=google.com; s=arc-20260327;
        b=ExaIOEQVNq/V63Do2RimE/Yw2v/n3rukQNKIZYgl8o7KzqYqneGqqn3UMXo/69nf4y
         V6ZI/N0TtnsZG4s1BTD15DGuhzylg7W/WN+IYNmneVMJ03J/4hfupBDWnZ85zEOL/az2
         ew8qgrgqLY7mBnHuFOcpgXWer2d5+dc8kkehIO8Fpj5FD8xRYaOP3NTbDfVBQrbGU2QD
         v8x6ClslDMsiSZ5hwlojamyYjeAp/G6n3Fby3EAUHURNZfsLEx7jB+Aw3vhL40N8FYer
         I1v5nO1DfeP0/Hmf9b+6Iw0gipL4VnuOF9BwUDGBdRYe88pKwV6FNxWbY2ZX3LNE18pv
         LAKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Wk0cj+9DgYTYzI5Mez4uz3rT+0bgscxo+Vyz+SJg54A=;
        fh=TtWEwYxAhL06BO0lrR+38mEnZFJSo94qJHK6mW5fsWE=;
        b=mONDM8pESSowds/r5JZZw0yGEf9NTEQR9pcCiQDTpzX3o8O7TvFKxU2HMQbXF0jNWk
         50xD4NXBE/uEpc39FmUvMx2k40UAVgx1Xlh0pOTEuGwXVPXj1vhslWn1GXh9lxt3jZf/
         TypSfElrWoz5/3fKlCuv5vIqPVeRiZXdgMA9FFZs2HYQmChFivldb/v0Tv3tqTeg+trs
         8AZVWlwJsTMCf0eLm60QiZC7AwOdsiYa8d6cm6KwQy5ALp43g1/KReqhu9XykcPCuh+1
         1c9hp1U/5qT++MsIg12WLkeMAE2t7mfQjmZCZAbKmnnaQR5WDoDLDo1bQaJLnZYU7DWS
         fQhw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792944227; x=1793549027; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wk0cj+9DgYTYzI5Mez4uz3rT+0bgscxo+Vyz+SJg54A=;
        b=DQCWi/uc69D0rxhn3RxfwtJEW1KTJIjQsJXKnhHsXe5IEyfGDCFtPHRSRmOe8QzmqQ
         y8hI3fVFdJpKl5/6VdDYugzlUcgejnOLwA52nY3Ahc1SM6sQgcv/P7qg/A3FwurBULvy
         L5H4bMe71ipOPJLX5iocLYc1h2CWXnHOWkO2XhguTxkLvCS5D5GfY8MrwCaDmQzWC63/
         f87F8SYSBlEXyJk2WM9ZtjXqUksy4q4WDSa+6Ah4zF4BOK3QqebL9V7hYTKqpBNRPgW0
         WO2caNCn3nD1K/33HAGjiAsJSyvzQtvXRAvM6tIo0DR69iT5uX3Tv9iCboDkdXTK2pRC
         glRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792944227; x=1793549027;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wk0cj+9DgYTYzI5Mez4uz3rT+0bgscxo+Vyz+SJg54A=;
        b=y2Ta0xenT5razBUnLn3oKTMI2/rD+hVbT7wuP4uUx85ai2f1vEHPfz15BpRa2cW5dY
         5v68TKd+a7sZ4jDRdV27peW9Fh90f/4EhzA+C6/nk8Vmuol315MxbMCetdJI2HVWljnC
         BpwCsXJ23h54UIjxPpE/2nQOd8NxqT/K7HA7yi11AoFJCFLtBZrSiJa9eUUcvjZb6ooR
         fYS5KO/GynWPirpSVUQ+CcTRRm6L/qnENaHP+a9Nr0lYcBBfORE2TvOxgeORurv/TOIa
         JQycCLc3zAC0O+c7jemgpGNQJsMY1ah64qr8AmAyIWDlODJApjNIQE2oqdShb1yLNjoU
         LILQ==
X-Gm-Message-State: AFq9FYIkLVfFA+LidWpnaCZXJJzw1FYundSI/Q7ljQLdFbXI2TSryu+J
	pIRLj49rvuABbd/8bnthAC6Z3uxzYnujDIhshcZzOCe2qQdLY2e3hjBk/MM1PPaVVsqZIMhwHDz
	F8ehsmqnBaPSwEkusgy0V1rx4azqwdsazVQ==
X-Gm-Gg: AYBFou1A5ot9UruZAuX2iNynpnNLH4ZMc7JUpo9HzAp4i8E3CFsYItcCLpJz5tBTHMu
	zDvq96vAFGv/uidCdNdTgO+bHaubQCbAgZU/qQcRvIm2qnJ7NdeDqs+fMK7YzxigsK51yF7/G2P
	A/JMxYwAkPK9s7Zba1wVxyLiIyP+OwB7NGfnwyuRJzgbRY5tbyJcZTAXddhTrQOLMxC5t6jonr6
	yWv1xTRsJHXa98LtaZAj3kVdgIQPiHCn8SfeiA4wNpLBaivDiVFgu7ssRlzagXEozf63CVyQe0Z
	YrKMzwfnXS9Fcgg+i29JBTzrimmEAr0/6z1aUfFfqdOYxXRiOG2PtbGWf159wx0B3rQr+UoSP/0
	IKIYdEaqeEbk9yme9OixmImFW5mY2GE6UZiPhF7F1tcdyBe9EC6DMLq0amiAZGobJI212BhZg47
	g8alVT/bt0KoTO4P01jsfwTOP1pqa86Re5JVfOwNNnkxc1N/a7IBLAlwMaE64fY0YHYecL+eJsL
	mcKkQ248+RAmkRB0Et2Z+5u75CeWrUKxXzJDlYlxrAtmieLU7m/Xx8lG7cDSObHkyJtNkJPEt0q
	0W4LdswLjG3UK0dqjhktYcxSReJEIQqKyeJiQL503rC+5VgTXDdRL1s8lnNDj2RRd4G/dGfJbPo
	P3J80Cji3Mq8svwpQn5+kqKrw5m5XNY7eAHDgRWE0acI=
X-Received: by 2002:a05:690c:585:b0:8b0:9eab:b77c with SMTP id
 00721157ae682-8b166bd8ca8mr29762237b3.55.1792944226967; Sun, 25 Oct 2026
 09:03:46 -0700 (PDT)
MIME-Version: 1.0
References: <20261025065645.1993425-1-khem.raj@oss.qualcomm.com> <49205f5f-53b5-4874-aac6-4cbd908d5eab@kernel.crashing.org>
In-Reply-To: <49205f5f-53b5-4874-aac6-4cbd908d5eab@kernel.crashing.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 25 Oct 2026 09:03:20 -0700
X-Gm-Features: AclHuK9qo5wdl-je1_RrBDm2JsWuIwF_hhM9QWMHYGlkE0njKUii5aQwy4vfWVM
Message-ID: <CAMKF1srsmxXYiZ0iax6FGA2TnUZPBPL704nzwHOvH8sFM8THjw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemuriscv64: Enable the Vector extension in the kernel
To: mark.hatle@kernel.crashing.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c0234b065eac5b28"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 16:03:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248609

--000000000000c0234b065eac5b28
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 8:17=E2=80=AFAM Mark Hatle via lists.openembedded.o=
rg
<mark.hatle=3Dkernel.crashing.org@lists.openembedded.org> wrote:

>
>
> On 10/25/26 1:56 AM, Khem Raj via lists.openembedded.org wrote:
> > QB_CPU defaults to rva23s64, which mandates V, but linux-yocto only
> > enables CONFIG_RISCV_ISA_V when TUNE_FEATURES contains 'v', and
> > riscv-isa-clear.scc turns it off otherwise. With the default rv64gc
> > tune the kernel therefore runs without V support and any userspace
> > vector instruction raises SIGILL, even code that selects RVV at
> > runtime.
> >
> > Append riscv-isa-v.scc to KERNEL_FEATURES_RISCV so it lands after
> > riscv-isa-clear.scc. Userspace keeps the rv64gc tune and stays
> > portable; the kernel detects V at boot, so this is harmless on CPUs
> > without it.
>
> This doesn't make sense to me.  If we want a default configuration to
> include
> vector, then we need to select an ISA that includes vector extensions.
>

Yes, at this point, we do not have many SBCs which is using rva23gv ISA
except
k3 maybe handful of others, so changing qemu defaults to use RVV by default
will
mean we are not covering the current widely used ISA as default but there
are packages
which need vectorization. So its enabling rvv in kernel but
keeps the userspace ABI to still be rv64gc.

Bumping default tune for qemuriscv64 to use rv64gcv is straight forward
however, it
does mean coverage moves to rva23 and newer. I am fine with this as well.
 would be good for others to chime in.


>
> Same with userspace, if anything is using vector instructions it should b=
e
> using
> a vector based tune.
>
> --Mark
>
> > Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> > ---
> >   meta/conf/machine/qemuriscv64.conf | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/meta/conf/machine/qemuriscv64.conf
> b/meta/conf/machine/qemuriscv64.conf
> > index a753af0576..0aacfa378f 100644
> > --- a/meta/conf/machine/qemuriscv64.conf
> > +++ b/meta/conf/machine/qemuriscv64.conf
> > @@ -6,6 +6,11 @@ require conf/machine/include/riscv/qemuriscv.inc
> >
> >   XVISOR_PLAT =3D "riscv/virt64"
> >
> > +# The default QB_CPU (rva23s64) has the Vector extension, so enable it
> in the
> > +# kernel even though the default tune is rv64gc, userspace can then us=
e
> V at
> > +# runtime. Appending here places it after riscv-isa-clear.scc, which
> disables V.
> > +KERNEL_FEATURES_RISCV:append =3D " arch/riscv/tunes/riscv-isa-v.scc"
> > +
> >   EXTRA_IMAGEDEPENDS +=3D "u-boot"
> >   UBOOT_MACHINE =3D "qemu-riscv64_smode_defconfig"
> >   UBOOT_ELF =3D "u-boot"
> >
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#248607):
> https://lists.openembedded.org/g/openembedded-core/message/248607
> Mute This Topic: https://lists.openembedded.org/mt/121924427/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c0234b065eac5b28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Oct 25,=
 2026 at 8:17=E2=80=AFAM Mark Hatle via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;mark.hatle=3D<a href=3D"mailto:kernel=
.crashing.org@lists.openembedded.org">kernel.crashing.org@lists.openembedde=
d.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
<br>
On 10/25/26 1:56 AM, Khem Raj via <a href=3D"http://lists.openembedded.org"=
 rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; QB_CPU defaults to rva23s64, which mandates V, but linux-yocto only<br=
>
&gt; enables CONFIG_RISCV_ISA_V when TUNE_FEATURES contains &#39;v&#39;, an=
d<br>
&gt; riscv-isa-clear.scc turns it off otherwise. With the default rv64gc<br=
>
&gt; tune the kernel therefore runs without V support and any userspace<br>
&gt; vector instruction raises SIGILL, even code that selects RVV at<br>
&gt; runtime.<br>
&gt; <br>
&gt; Append riscv-isa-v.scc to KERNEL_FEATURES_RISCV so it lands after<br>
&gt; riscv-isa-clear.scc. Userspace keeps the rv64gc tune and stays<br>
&gt; portable; the kernel detects V at boot, so this is harmless on CPUs<br=
>
&gt; without it.<br>
<br>
This doesn&#39;t make sense to me.=C2=A0 If we want a default configuration=
 to include <br>
vector, then we need to select an ISA that includes vector extensions.<br><=
/blockquote><div><br></div><div>Yes, at this point, we do not have many SBC=
s which is using rva23gv ISA except</div><div>k3 maybe handful of others, s=
o changing qemu defaults to use RVV by default will</div><div>mean we are n=
ot covering the current widely used ISA as default but there are packages</=
div><div>which need vectorization. So its enabling=C2=A0rvv=C2=A0in kernel =
but</div><div>keeps the userspace ABI to still be rv64gc.</div><div><br></d=
iv><div>Bumping default tune for qemuriscv64 to use rv64gcv is straight for=
ward however, it</div><div>does mean coverage moves to rva23 and newer. I a=
m fine with this as well.=C2=A0</div><div><span style=3D"background-color:t=
ransparent">=C2=A0would be good for others to chime in.=C2=A0</span></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Same with userspace, if anything is using vector instructions it should be =
using <br>
a vector based tune.<br>
<br>
--Mark<br>
<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcomm.co=
m" target=3D"_blank">khem.raj@oss.qualcomm.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/conf/machine/qemuriscv64.conf | 5 +++++<br>
&gt;=C2=A0 =C2=A01 file changed, 5 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/conf/machine/qemuriscv64.conf b/meta/conf/machine/qe=
muriscv64.conf<br>
&gt; index a753af0576..0aacfa378f 100644<br>
&gt; --- a/meta/conf/machine/qemuriscv64.conf<br>
&gt; +++ b/meta/conf/machine/qemuriscv64.conf<br>
&gt; @@ -6,6 +6,11 @@ require conf/machine/include/riscv/qemuriscv.inc<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0XVISOR_PLAT =3D &quot;riscv/virt64&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +# The default QB_CPU (rva23s64) has the Vector extension, so enable i=
t in the<br>
&gt; +# kernel even though the default tune is rv64gc, userspace can then u=
se V at<br>
&gt; +# runtime. Appending here places it after riscv-isa-clear.scc, which =
disables V.<br>
&gt; +KERNEL_FEATURES_RISCV:append =3D &quot; arch/riscv/tunes/riscv-isa-v.=
scc&quot;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0EXTRA_IMAGEDEPENDS +=3D &quot;u-boot&quot;<br>
&gt;=C2=A0 =C2=A0UBOOT_MACHINE =3D &quot;qemu-riscv64_smode_defconfig&quot;=
<br>
&gt;=C2=A0 =C2=A0UBOOT_ELF =3D &quot;u-boot&quot;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#248607): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/248607" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/248607</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121924427/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121924427/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000c0234b065eac5b28--
