Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21662.1793831307244298982
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 14:28:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Wh8BTG/A;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b118bea471so10620117b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 14:28:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793831306; cv=none;
        d=google.com; s=arc-20260327;
        b=GhQRymy2JJA7IIv3gWVrMlj11Go8afLU1DOVBMYkEtWKibMJUqIf4+RECkj3dWSBCG
         k+vlfzVIrEUl0Om0ETZ3gEOiHrQ3HTSaGsMyTPCgyoBiF0lBEj2C95mBW47dPdvayi9E
         GSpZSjhdYOiE9+uzkhhRbtLWXeMs9JHW41EnPkyFmeyrwkZ1FXr3JJ5W3OOWtEp5b7KM
         MJ036dwswHd3FecSjDnTFvfD1ZDnYDqd+gZvdD9eqbkVNU4R8KcKGIzzjx0trHBUdjhB
         y6ZkV+eLOsOal72xIWYqLZ7RTYucGXx2WuRe0KCBBAFeal0+wztxDPmaSy93q3ZTV+62
         RxRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=i1Cmy7EnV4CFo4Y/4hNnXQSH/3DX6j5QV58YEYcFzHQ=;
        fh=+D3J37xh5U87mQWj3fOBg7mJlGI04O28gCdEN7ZJhn8=;
        b=CUQyPY+HLmrHr/ktPFXKGdhhjPRCsCWfamKuPo//6ulNMeN60tUJlazd5qwvfSyIP+
         T47UfzjZ4FBoYu0sCt/0H1Uc/z9kfjW4rVWFBM5eGq8bo9SyFworM5Y6b4Zl1uTN7oMo
         Maj171HpTL8LBS2hDo++ZTmHFb7cG5RSRFMZyL9Z9hoOnZx1l5kl1a5i03zvQqtX/jUC
         2ggr6dI43SElfYBMuvoBwInjH9ApSfUIpIUX7oaNtzyZx1FNejGF13vIgAdBLAQsnr1U
         jOZk8BfypRn7trs7w2smZHnGoVrgVNlw1tmsKvfp5k1yk5IlWtg2mPKb6zAoeD7uES08
         6hDA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793831306; x=1794436106; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i1Cmy7EnV4CFo4Y/4hNnXQSH/3DX6j5QV58YEYcFzHQ=;
        b=Wh8BTG/AwqCKerqI8T4YM0rJao7e/Unpwshmzglfd8T2GoTYjOl9K6zc3dRSMvLH7F
         /VHae+sd/Ky6S9JOB7l1VsEgN5PERbYH9XwR5bUOaCVoQ3nf/mxfNiC79QFio/Ydmttk
         ZcW21PtRtGfMAHVoBuzg1l9386xog2N0cGci+O+q6D/ol93QEAzTDXS0Dyfpy0x1so6r
         6ahodX6u3bu6SRx2WeaxavnQIbkujbLcpO+XEWeAm5N/mP4TFURi4YK1oZHHXUOu28IK
         XRGBKIStog/nwJwSmzlmraKItPgFGOUzcZt1LnhdNZ9Gomz9NLkwB/Gm23wMeuTBvRQF
         79Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793831306; x=1794436106;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i1Cmy7EnV4CFo4Y/4hNnXQSH/3DX6j5QV58YEYcFzHQ=;
        b=ql/HrclGgxJIFgZJDd0cHs4QWs23brczfU1kTZGI+OwmwT2jngEZX+plLro9i9tZuE
         AHimYp90imq+5aUOU9a41cFTmj8pxr9ncmI5MTewP7QXk+HnndV5LM7UPs1v8esFSlNh
         NPNPRZpj9haJM1Yu+miP4vGIAaDFYwyDJ7fOyJxa1RwvmNWHgS1JQ+8F7SD8qHFJBbqb
         zie83QSga8MHuwm0b7tRWop49YDB+00Qni0iyUw0Eio/26efDPef54INhRaUaAEHPsm2
         0cweJkPmEQKBbseo6AEofhye8hyd8LMTQVi8ZMjhKVv331xvdkD6R0W1q27fy8t1cUMP
         CmCg==
X-Gm-Message-State: APuU4Z++bHANiT8QahRzO7dPkmwfwRWHrSChGF2zLea0VSdmwKlG9TM2
	qcGLTCuAlWcum4gUq1nQ546Yt4deeO7UqwA7O4IRQPwRTCUnVW7TepKExFE4cfPJTFtrx+y8sMo
	+u/nIl4LLjRbRxQmIPnrpdz3TO1dllJ0=
X-Gm-Gg: AYBFou3rQXHlHsDJE5P4vL1uhmuNSGgy08YGJp/3heQiZ9Ybi8qnlnv0ZQi8bDCcW1M
	L23hAfnL+m5i7ZiOLNdfAe9iXq17TybVFD2fBLWDVeclwhvTJICykxmQNdEz/7Xa52q5X9I28a4
	cL6VzT3darcNxKg+XEooqK0EWadX4HmQ3npPLTNsMoOAYRK7aaMrMgyTcUymKuwBpuhFDD//oO8
	MNOXqabNq7IVs0+JXuMM0Rb9xiJlyMzd6amiqwEaS+6U8PAhE/QL91Dn34UbjyNGzkVuFlgDHk+
	zOotgZAVfd6t+YVl5Cz0EWADWb/LHWF3xP+K70FvJuRqlFLZ8vIcPGYlcgGJiYbGl5VcHDjpiZ0
	OR17yKlKmbCCPeQkDYSOLvRnDHqbjRUv45ChhBbnMeG9itLwjpswnFekQzxxR9u4+VDIbwlHrRU
	JAo2rzkgClPCFI/vINPRTAWQpMscX8h0jZJEds5LBaoLgEIawmauzqBVwZDN+2LUwJ3Yo7ewCoN
	YXGgfCGut6MpL8EDQPWOvACrcJcRSVoGcmkuXfC2oipmr5FfOgTncPsTizMD0lPToQsYEXSHhTv
	DLc6u4/LYBO3EAr6k6MnQbJxEmREQMTOQkOo0/ifl0r5Ll46fTKIcilh5efOIdX7tQ==
X-Received: by 2002:a05:690c:7108:b0:8b0:c50c:2547 with SMTP id
 00721157ae682-8b2b67c9ebcmr125780427b3.66.1793831306143; Wed, 04 Nov 2026
 14:28:26 -0800 (PST)
MIME-Version: 1.0
References: <20261028051959.2975770-1-khem.raj@oss.qualcomm.com> <DMMQO5OTJXPD.WW6MQOZ8JTK2@smile.fr>
In-Reply-To: <DMMQO5OTJXPD.WW6MQOZ8JTK2@smile.fr>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Nov 2026 14:28:14 -0800
X-Gm-Features: AclHuK8q006H0bEYkH89GcFeVTQb01zmRE7B_YWarro6hvD914uBrKXzxtXhwNE
Message-ID: <CAMKF1sqsO6Dbjdh9LHiZ1zrG9AMM6m0tbjA1BZnE9XLd8CUjag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] musl: Keep clang from raising spurious FP exceptions
To: Yoann Congal <yoann.congal@smile.fr>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="000000000000ca2dd6065f7ae5b5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 22:28:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249413

--000000000000ca2dd6065f7ae5b5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am going to post v2 soon perhaps by end of this week and whatever lands
upstream I will update oe master. I would suggest to hold any stable branch
backport of this patch until then

On Wed, Nov 4, 2026, 1:19=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr> w=
rote:

> On Wed Oct 28, 2026 at 6:19 AM CET, Khem Raj via lists.openembedded.org
> wrote:
> > With clang built musl's math code assumes
> > floating point exceptions are never inspected and speculates FP
> > operations across branches. expm1() then evaluates both scaling
> > multiplies and selects one, raising a spurious OVERFLOW, and libc-test
> > math/expm1, expm1f, hypot, hypotf and sinh fail on qemuarm64.
> >
> > Pass -ffp-exception-behavior=3Dmaytrap from musl's configure when the
> > compiler accepts it. GCC does not accept it, so GCC builds are
> > unchanged.
> >
> > Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> > ---
> >  ...p-exception-behavior-maytrap-when-su.patch | 46 +++++++++++++++++++
> >  meta/recipes-core/musl/musl_git.bb            |  1 +
> >  2 files changed, 47 insertions(+)
> >  create mode 100644
> meta/recipes-core/musl/musl/0004-configure-use-ffp-exception-behavior-may=
trap-when-su.patch
> >
> > diff --git
> a/meta/recipes-core/musl/musl/0004-configure-use-ffp-exception-behavior-m=
aytrap-when-su.patch
> b/meta/recipes-core/musl/musl/0004-configure-use-ffp-exception-behavior-m=
aytrap-when-su.patch
> > new file mode 100644
> > index 0000000000..dfff81299b
> > --- /dev/null
> > +++
> b/meta/recipes-core/musl/musl/0004-configure-use-ffp-exception-behavior-m=
aytrap-when-su.patch
> > @@ -0,0 +1,46 @@
> > +From fe310a5e2fe6be3c28f800bde383d7df5aac4b49 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <khem.raj@oss.qualcomm.com>
> > +Date: Sun, 25 Oct 2026 21:54:26 -0700
> > +Subject: [PATCH] configure: use -ffp-exception-behavior=3Dmaytrap when
> supported
> > +
> > +The math library relies on floating point exception flags being raised
> > +exactly as the C code would raise them. GCC keeps that by default
> > +(-ftrapping-math), but clang assumes floating point exceptions are nev=
er
> > +inspected unless told otherwise, and may then evaluate both arms of a
> > +branch and select the result. Built with clang 23 for aarch64, expm1()
> > +computes both y*2.0*0x1p1023 and y*twopk for the k < 0 || k > 56 case
> > +and picks one with fcsel, so the unused multiply raises a spurious
> > +OVERFLOW. libc-test's math/expm1, expm1f, hypot, hypotf and sinh fail
> > +because of that.
> > +
> > +-ffp-exception-behavior=3Dmaytrap tells clang to avoid transformations
> > +that raise exceptions the original code would not raise. GCC does not
> > +accept the option, so tryflag leaves GCC builds unchanged.
> > +
> > +Upstream-Status: Submitted [
> https://www.openwall.com/lists/musl/2026/10/28/1]
> > +Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> > +---
> > + configure | 10 ++++++++++
> > + 1 file changed, 10 insertions(+)
>
> Hello Khem,
>
> I think this patch (now merged on master) is a good candidate for stable
> inclusion. But upstream seems to have rejected the patch[0]. Any advice
> on what to do regarding blacksail?
> Merge like this or wait for a fix that is accepted by upstream?
>
> Thanks!
>
> [0]: https://www.openwall.com/lists/musl/2026/10/28/2
> --
> Yoann Congal
> Smile ECS
>
>

--000000000000ca2dd6065f7ae5b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I am going to post v2 soon perhaps by end of this week an=
d whatever lands upstream I will update oe master. I would suggest to hold =
any stable branch backport of this patch until then=C2=A0</div><br><div cla=
ss=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Wed, Nov 4, 2026, 1:19=E2=80=AFPM Yoann Congal &lt;<a href=3D"mailto=
:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">On Wed Oct 28, 2026 at 6:19 AM=
 CET, Khem Raj via <a href=3D"http://lists.openembedded.org" rel=3D"norefer=
rer noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; With clang built musl&#39;s math code assumes<br>
&gt; floating point exceptions are never inspected and speculates FP<br>
&gt; operations across branches. expm1() then evaluates both scaling<br>
&gt; multiplies and selects one, raising a spurious OVERFLOW, and libc-test=
<br>
&gt; math/expm1, expm1f, hypot, hypotf and sinh fail on qemuarm64.<br>
&gt;<br>
&gt; Pass -ffp-exception-behavior=3Dmaytrap from musl&#39;s configure when =
the<br>
&gt; compiler accepts it. GCC does not accept it, so GCC builds are<br>
&gt; unchanged.<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcomm.co=
m" target=3D"_blank" rel=3D"noreferrer">khem.raj@oss.qualcomm.com</a>&gt;<b=
r>
&gt; ---<br>
&gt;=C2=A0 ...p-exception-behavior-maytrap-when-su.patch | 46 +++++++++++++=
++++++<br>
&gt;=C2=A0 meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">musl_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 47 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/musl/musl/0004-configure-us=
e-ffp-exception-behavior-maytrap-when-su.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/musl/musl/0004-configure-use-ffp-except=
ion-behavior-maytrap-when-su.patch b/meta/recipes-core/musl/musl/0004-confi=
gure-use-ffp-exception-behavior-maytrap-when-su.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..dfff81299b<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/musl/musl/0004-configure-use-ffp-exception-beh=
avior-maytrap-when-su.patch<br>
&gt; @@ -0,0 +1,46 @@<br>
&gt; +From fe310a5e2fe6be3c28f800bde383d7df5aac4b49 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcomm.com" targe=
t=3D"_blank" rel=3D"noreferrer">khem.raj@oss.qualcomm.com</a>&gt;<br>
&gt; +Date: Sun, 25 Oct 2026 21:54:26 -0700<br>
&gt; +Subject: [PATCH] configure: use -ffp-exception-behavior=3Dmaytrap whe=
n supported<br>
&gt; +<br>
&gt; +The math library relies on floating point exception flags being raise=
d<br>
&gt; +exactly as the C code would raise them. GCC keeps that by default<br>
&gt; +(-ftrapping-math), but clang assumes floating point exceptions are ne=
ver<br>
&gt; +inspected unless told otherwise, and may then evaluate both arms of a=
<br>
&gt; +branch and select the result. Built with clang 23 for aarch64, expm1(=
)<br>
&gt; +computes both y*2.0*0x1p1023 and y*twopk for the k &lt; 0 || k &gt; 5=
6 case<br>
&gt; +and picks one with fcsel, so the unused multiply raises a spurious<br=
>
&gt; +OVERFLOW. libc-test&#39;s math/expm1, expm1f, hypot, hypotf and sinh =
fail<br>
&gt; +because of that.<br>
&gt; +<br>
&gt; +-ffp-exception-behavior=3Dmaytrap tells clang to avoid transformation=
s<br>
&gt; +that raise exceptions the original code would not raise. GCC does not=
<br>
&gt; +accept the option, so tryflag leaves GCC builds unchanged.<br>
&gt; +<br>
&gt; +Upstream-Status: Submitted [<a href=3D"https://www.openwall.com/lists=
/musl/2026/10/28/1" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/www.openwall.com/lists/musl/2026/10/28/1</a>]<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcomm.c=
om" target=3D"_blank" rel=3D"noreferrer">khem.raj@oss.qualcomm.com</a>&gt;<=
br>
&gt; +---<br>
&gt; + configure | 10 ++++++++++<br>
&gt; + 1 file changed, 10 insertions(+)<br>
<br>
Hello Khem,<br>
<br>
I think this patch (now merged on master) is a good candidate for stable<br=
>
inclusion. But upstream seems to have rejected the patch[0]. Any advice<br>
on what to do regarding blacksail?<br>
Merge like this or wait for a fix that is accepted by upstream?<br>
<br>
Thanks!<br>
<br>
[0]: <a href=3D"https://www.openwall.com/lists/musl/2026/10/28/2" rel=3D"no=
referrer noreferrer" target=3D"_blank">https://www.openwall.com/lists/musl/=
2026/10/28/2</a><br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div>

--000000000000ca2dd6065f7ae5b5--
