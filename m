Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.10563.1610035986987214104
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 08:13:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PLLQYw0L;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id t16so6201738wra.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Jan 2021 08:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RHG+0y/yJSC+IuOBxGPZtFd1/f7iWvECvvWsVrnwIWs=;
        b=PLLQYw0LSWkJVmRh4n3J85JdA4E/r32er+7MCO2RD4GZQrIJkar/NVMAy0KkhbpxWO
         3j08I4Epi8kw/RXQJ8m2j7WNbnphn5BVOKEyKxyH3pXGleZfVpfEmvxGXdetLPFKPTwR
         gwaAZJINot2OG79bUk8cKJXWxhzh99I6urqIRtnOTM9WLCN17/C3LbyxZugbF1+ZsdU9
         YOaFT7rZnbUJw/ddiL4aobp1LdyopsGqUZbGEMYUl3GjY7tw7oqKyPFN+0pbCuM0DW+d
         d3MQ2q1oGwuTZAY2k1kKhFeZg3OS0LEJPMhFD7oJFz6EvvLtdUu+mRnjXx2UVYZ/AEj8
         lEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RHG+0y/yJSC+IuOBxGPZtFd1/f7iWvECvvWsVrnwIWs=;
        b=UzH7F+FKCUCnyJ+/I5Ietk4EfnhvRE3pNoiiFSaFyaH3Cv7q+dSoFU57SQuZdYFA/Z
         0F5tl6M0g4KIA57WIG+rCp23XFmnaIiKTzzROyv25Fxo05x1AuzwdrjQNVEjK1bNDqb7
         LWIjB9NC2CN7v/dQvOa0LAiLrTWwiwPkTqm3d5v4ecUgRbfLahW+Z3ziM6TO5Vguro0M
         VvR/FoC0GRKNEGbKuFClTh9UKYp+Mg56Eb8phdTyKVnVY0YUQ8lgcMh2pFm5nznPUUSY
         6Bp9QKudKJ3yaTXYQU0X6WsRq6eti/wNJlPClxnmxjDrq3rg6ak/p9fG0aYt9dOgmA8f
         Xaqw==
X-Gm-Message-State: AOAM5334zJUInWb/FBp3IpX2dM/jfnPQtyipnWAT6LPFOv3xKxP+To+Z
	Pm4ixfh0xjpxVk9oJoJS3lZnBlFI14K5hmJIFD0=
X-Google-Smtp-Source: ABdhPJwcr3+YrDx0F8IBNXtkVAP+dSDMef2S0PXxjB6yvHNgP62D92VEfqOLDkIqlxosb6OdD9IAaEv1sputktYUsGE=
X-Received: by 2002:adf:c6c4:: with SMTP id c4mr9871217wrh.348.1610035985512;
 Thu, 07 Jan 2021 08:13:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1609934927.git.liezhi.yang@windriver.com>
 <0f8505614d5562aa94dea17eb6beea772c25e1d3.1609934927.git.liezhi.yang@windriver.com>
 <0dbe9f701d6c6344adb0561e10dc2aed8ddb4b7a.camel@linuxfoundation.org>
 <c37107e5-a877-8b85-46b8-c984466c31a6@windriver.com> <3966f6f4c6c748f36c73bfccaaa36fdea6b34e63.camel@linuxfoundation.org>
 <8eb45b12-acb2-ce3e-c821-3c381c1107f7@windriver.com>
In-Reply-To: <8eb45b12-acb2-ce3e-c821-3c381c1107f7@windriver.com>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Thu, 7 Jan 2021 10:12:54 -0600
Message-ID: <CAJdd5GYhJPMBc3nfiAA5aBm0wZyzYUuab_gR2pRCtcGfss6row@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] buildtools-tarball: Add nativesdk-ccache
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fdfccb05b851b6bd"

--000000000000fdfccb05b851b6bd
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 7, 2021, 5:00 AM Robert Yang <liezhi.yang@windriver.com> wrote:

> Hi RP,
>
> On 1/7/21 6:40 PM, Richard Purdie wrote:
> > On Thu, 2021-01-07 at 10:44 +0800, Robert Yang wrote:
> >> Hi RP,
> >>
> >> On 1/6/21 9:56 PM, Richard Purdie wrote:
> >>> On Wed, 2021-01-06 at 04:09 -0800, Robert Yang wrote:
> >>>> Add it to buildtools-tarball so that there will be a unify version of
> ccache,
> >>>> which can help avoid various compile errors.
> >>>>
> >>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >>>> ---
> >>>>    meta/recipes-core/meta/buildtools-tarball.bb | 1 +
> >>>>    1 file changed, 1 insertion(+)
> >>>>
> >>>> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb
> b/meta/recipes-core/meta/buildtools-tarball.bb
> >>>> index 9da81d55235..2ffdd7c7253 100644
> >>>> --- a/meta/recipes-core/meta/buildtools-tarball.bb
> >>>> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
> >>>> @@ -29,6 +29,7 @@ TOOLCHAIN_HOST_TASK ?= "\
> >>>>        nativesdk-rpcsvc-proto \
> >>>>        nativesdk-patch \
> >>>>        nativesdk-mtools \
> >>>> +    nativesdk-ccache \
> >>>>        "
> >>>
> >>> My view is we should not start to ship ccache with buildtools by
> >>> default. Its something that the user can install if they want/need it
> >>
> >>
> >> The problem is that user installed ccache may not work with our
> recipes, for
> >> example, we found the following recipes failed to build with ccache on
> different
> >> hosts:
> >>
> >> cdrtools-native
> >> fribidi
> >> rocksdb
> >>
> >>
> >> So have a fixed version of ccache can make sure the recipes work well,
> it also
> >> helps us to reproduce the errors easily when user reported a bug.
> >
> > I really do not want ccache in buildtools. If this is such a problem,
> > we need to work out how to resolve the circular dependency issues so
> > ccache-native can work again.
>
> There are two problems to use cache-native now:
> * ccache-native depends on cmake-native and zstd-native which makes it
> requires
>    more time to build, so it might be a bottleneck for the build
>
> * We need disable ccache-native for about 20 native recipes to resolve the
> circular dependency.
>
> It seems that there isn't a good way to fix the problem, or we have to
> disable
> ccache for native recipes, only make other recipes (cross, target and
> nativesdk)
> use ccache-native.
>
> Host's ccache isn't reliable from the history.
>

We had the same problem with icecream and solved it by building in a docker
container with the version of ice cream that we wanted FWIW.

Alternatively, I think it's possible to roll your own buildtools that has
ccache?


> // Robert
>
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
>
> 
>
>

--000000000000fdfccb05b851b6bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Jan 7, 2021, 5:00 AM Robert Yang &lt;<a href=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank" rel=3D"noreferrer"=
>liezhi.yang@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">Hi RP,<br>
<br>
On 1/7/21 6:40 PM, Richard Purdie wrote:<br>
&gt; On Thu, 2021-01-07 at 10:44 +0800, Robert Yang wrote:<br>
&gt;&gt; Hi RP,<br>
&gt;&gt;<br>
&gt;&gt; On 1/6/21 9:56 PM, Richard Purdie wrote:<br>
&gt;&gt;&gt; On Wed, 2021-01-06 at 04:09 -0800, Robert Yang wrote:<br>
&gt;&gt;&gt;&gt; Add it to buildtools-tarball so that there will be a unif=
y version of ccache,<br>
&gt;&gt;&gt;&gt; which can help avoid various compile errors.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.y=
ang@windriver.com" rel=3D"noreferrer noreferrer" target=3D"_blank">liezhi.y=
ang@windriver.com</a>&gt;<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0meta/recipes-core/meta/<a href=3D"http:=
//buildtools-tarball.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D=
"_blank">buildtools-tarball.bb</a> | 1 +<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A01 file changed, 1 insertion(+)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; diff --git a/meta/recipes-core/meta/<a href=3D"http://bui=
ldtools-tarball.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_bla=
nk">buildtools-tarball.bb</a> b/meta/recipes-core/meta/<a href=3D"http://bu=
ildtools-tarball.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_bl=
ank">buildtools-tarball.bb</a><br>
&gt;&gt;&gt;&gt; index 9da81d55235..2ffdd7c7253 100644<br>
&gt;&gt;&gt;&gt; --- a/meta/recipes-core/meta/<a href=3D"http://buildtools=
-tarball.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">bui=
ldtools-tarball.bb</a><br>
&gt;&gt;&gt;&gt; +++ b/meta/recipes-core/meta/<a href=3D"http://buildtools=
-tarball.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">bui=
ldtools-tarball.bb</a><br>
&gt;&gt;&gt;&gt; @@ -29,6 +29,7 @@ TOOLCHAIN_HOST_TASK ?=3D &quot;\<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nativesdk-rpcsv=
c-proto \<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nativesdk-patch=
 \<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nativesdk-mtool=
s \<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 nativesdk-ccache \<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; My view is we should not start to ship ccache with buildtools=
 by<br>
&gt;&gt;&gt; default. Its something that the user can install if they want=
/need it<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; The problem is that user installed ccache may not work with our r=
ecipes, for<br>
&gt;&gt; example, we found the following recipes failed to build with ccac=
he on different<br>
&gt;&gt; hosts:<br>
&gt;&gt;<br>
&gt;&gt; cdrtools-native<br>
&gt;&gt; fribidi<br>
&gt;&gt; rocksdb<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; So have a fixed version of ccache can make sure the recipes work =
well, it also<br>
&gt;&gt; helps us to reproduce the errors easily when user reported a bug.=
<br>
&gt; <br>
&gt; I really do not want ccache in buildtools. If this is such a problem,=
<br>
&gt; we need to work out how to resolve the circular dependency issues so<=
br>
&gt; ccache-native can work again.<br>
<br>
There are two problems to use cache-native now:<br>
* ccache-native depends on cmake-native and zstd-native which makes it req=
uires<br>
=C2=A0 =C2=A0more time to build, so it might be a bottleneck for the build=
<br>
<br>
* We need disable ccache-native for about 20 native recipes to resolve the=
 <br>
circular dependency.<br>
<br>
It seems that there isn&#39;t a good way to fix the problem, or we have to=
 disable<br>
ccache for native recipes, only make other recipes (cross, target and nati=
vesdk)<br>
use ccache-native.<br>
<br>
Host&#39;s ccache isn&#39;t reliable from the history.<br></blockquote></d=
iv></div><div dir=3D"auto"><br></div><div dir=3D"auto">We had the same prob=
lem with icecream and solved it by building in a docker container with the =
version of ice cream that we wanted FWIW.</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Alternatively, I think it&#39;s possible to roll your own=
 buildtools that has ccache?</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
// Robert<br>
<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Richard<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000fdfccb05b851b6bd--
