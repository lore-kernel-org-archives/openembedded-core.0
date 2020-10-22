Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web10.1429.1603400889476750738
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 14:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KrpzhNn5;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id w27so4405212ejb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 14:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qS/zIbzoaIcJaCxyZuhisJkuZ0LYBpI6VISnoT1bE8Y=;
        b=KrpzhNn5bdK+q0gVSWxxf9MLrkqQoMdMpawxPE3ijPddh7m+O516L9RQgZ4dqypVf7
         D07S+5+6g+xy2g3hjGCdQCLY0l00wInQwJSz+SHStEowQLRLC3YoqHGKbFevq5UrdQkq
         rnxlDUpvxygDb9LlbBi75Zc+aU1Dnr8ZBugu7eSUIYEEwRjg5EoHPU1HwXtgkCkoLole
         vEKqwHJjad5xEVIC9Us05fWdWpeqjaiUueb09UcnD7vIOA75N9CtYgMQqRNeDB3FYwrB
         3rsuHgj2+6+EPLu9KPqxyDXPXssZGYQ0blBG+ATF2vxdmTAoCgQ1ksC0HZ8gyEpDkK/A
         3/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qS/zIbzoaIcJaCxyZuhisJkuZ0LYBpI6VISnoT1bE8Y=;
        b=IxvkA7LWQX79Ug3U5G6Q7jSFQj9inBT8l7h7JURfCPXLSM+0UTLxOdUq7L7xPMgRMo
         LBOREpJdJns/dUQv9w90c1nyZJITQ3ub2SVOi04+ofCHMw7ZrCERgoMkU9t29+KY3TY4
         9ChPwEO1Fgg1mdRsDe0zFfgd39rEoo2BubussvjRXGd8HnxniM39UH35HFYHwFSZdM2o
         cJtfN67rakeiz5zXGQImk/PetnDD8yOj4n2XQOr0Bl6UWRZb60gQjBj5DjTMfGts5Yf+
         h2A42WoHOg7rwqAgQiOuMF7OJ8+hruPFU+mBV2qOykotBRDGcs/8VbQfFaKA81hRHC9m
         d98Q==
X-Gm-Message-State: AOAM533oWyfWR4o6XIaeqeIOa4AFc1HVYbv+QBHyw3L+8aKp1V3xzSWB
	FiEfo9t4xE95OqtAWHEmy/PzbyFW7SsXCJoLIzM=
X-Google-Smtp-Source: ABdhPJz/6X4hub6kfW+UzRVCXtyB045OZVoORuYXMVZQZCUKuuzBZagUdtCoBoAajhbiQM3EsNlnrMQ7toXnLXC0xd0=
X-Received: by 2002:a17:906:ca54:: with SMTP id jx20mr4380918ejb.541.1603400887900;
 Thu, 22 Oct 2020 14:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201016095531.140098-1-Martin.Jansa@gmail.com>
 <20201016095531.140098-2-Martin.Jansa@gmail.com> <CAJ86T=WdocqoYgd_nZ0M8mn372ERZsDG_Lrh26HuWzSwtYfW3g@mail.gmail.com>
In-Reply-To: <CAJ86T=WdocqoYgd_nZ0M8mn372ERZsDG_Lrh26HuWzSwtYfW3g@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 22 Oct 2020 23:07:56 +0200
Message-ID: <CA+chaQd4MjKnzk=Po2UFwY=sB_2NgMbrQjvDEYsjuR4=EOea1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] tune-ep9312.inc: add t suffix for thumb to PACKAGE_EXTRA_ARCHS_tune-ep9312
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005b201705b248dc84"

--0000000000005b201705b248dc84
Content-Type: text/plain; charset="UTF-8"

I think you're reading it backwards (or I wrote it backwards?).

"t" wasn't added before, because "armv4" isn't in TUNE_FEATURES.

But since you have changed feature-arm-thumb.inc to use armv4 OVERRIDE, the
"t" is added and tune-ep9212 got broken.

See the removed comment in the tune file which explains why it wasn't using
"t" suffix in PACKAGE_EXTRA_ARCHS_tune-ep9312 before.

On Thu, Oct 22, 2020 at 9:26 PM Andre McCurdy <armccurdy@gmail.com> wrote:

> On Fri, Oct 16, 2020 at 2:55 AM Martin Jansa <Martin.Jansa@gmail.com>
> wrote:
> >
> > * broken since:
> >   commit 805dd4807d322dc70cef97edd68fdb3142b60fb1
> >   Author: Andre McCurdy <armccurdy@gmail.com>
> >   Date:   Fri Aug 23 13:51:36 2019 -0700
> >
> >     feature-arm-thumb.inc: fix ARM_THUMB_SUFFIX
> >
> > * since this commit the 't' suffix is set ARM_THUMB_SUFFIX by
> >   armv4 override (which does apply for ep9312 tune) instead of
>
> This doesn't sound right. The armv4 override is being added to
> MACHINEOVERRIDES (it's even shown in the patch context below). Is that
> somehow not working?
>
> >   armv4 in TUNE_FEATURES - so the comment in the file was no
> >   longer correct and ep9312 wasn't usable
> >
> > * fixes:
> >   scripts/tune/log.fake-ep9312:    Error, the PACKAGE_ARCHS variable
> (all any noarch arm armv4 armv4t ep9312 fake_ep9312) for DEFAULTTUNE
> (ep9312) does not contain TUNE_PKGARCH (ep9312t).
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/conf/machine/include/tune-ep9312.inc | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/meta/conf/machine/include/tune-ep9312.inc
> b/meta/conf/machine/include/tune-ep9312.inc
> > index 11fd266ba0..5e1a0e5791 100644
> > --- a/meta/conf/machine/include/tune-ep9312.inc
> > +++ b/meta/conf/machine/include/tune-ep9312.inc
> > @@ -8,6 +8,5 @@ MACHINEOVERRIDES =.
> "${@bb.utils.contains('TUNE_FEATURES', 'ep9312', 'armv4:', '
> >
> >  AVAILTUNES += "ep9312"
> >  ARMPKGARCH_tune-ep9312 = "ep9312"
> > -# this tune does not include TUNE_FEATURES_tune-armv4t, so there is no
> armv4 TUNE_FEATURES => no 't' in ARMPKGSFX_THUMB
> >  TUNE_FEATURES_tune-ep9312 = "thumb ep9312"
> > -PACKAGE_EXTRA_ARCHS_tune-ep9312 = "${PACKAGE_EXTRA_ARCHS_tune-armv4t}
> ep9312"
> > +PACKAGE_EXTRA_ARCHS_tune-ep9312 = "${PACKAGE_EXTRA_ARCHS_tune-armv4t}
> ep9312t"
> > --
> > 2.25.1
> >
> >
> > 
> >
>

--0000000000005b201705b248dc84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think you&#39;re reading it backwards (or I wrote it bac=
kwards?).<div><br></div><div>&quot;t&quot; wasn&#39;t added before, because=
 &quot;armv4&quot; isn&#39;t in TUNE_FEATURES.</div><div><br></div><div>But=
 since you have changed=C2=A0<span style=3D"color:rgb(80,0,80)">feature-arm=
-thumb.inc to use armv4 OVERRIDE, the &quot;t&quot; is added and tune-ep921=
2 got broken.</span></div><div><span style=3D"color:rgb(80,0,80)"><br></spa=
n></div><div><span style=3D"color:rgb(80,0,80)">See the removed comment in =
the tune file which explains why it wasn&#39;t using &quot;t&quot; suffix i=
n=C2=A0</span><span style=3D"color:rgb(80,0,80)">PACKAGE_EXTRA_ARCHS_tune-e=
p93</span><span style=3D"color:rgb(80,0,80)">12 before.</span></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu,=
 Oct 22, 2020 at 9:26 PM Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmai=
l.com">armccurdy@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Fri, Oct 16, 2020 at 2:55 AM Martin Jansa &lt;=
<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gm=
ail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; * broken since:<br>
&gt;=C2=A0 =C2=A0commit 805dd4807d322dc70cef97edd68fdb3142b60fb1<br>
&gt;=C2=A0 =C2=A0Author: Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gma=
il.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0Date:=C2=A0 =C2=A0Fri Aug 23 13:51:36 2019 -0700<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0feature-arm-thumb.inc: fix ARM_THUMB_SUFFIX<br>
&gt;<br>
&gt; * since this commit the &#39;t&#39; suffix is set ARM_THUMB_SUFFIX by=
<br>
&gt;=C2=A0 =C2=A0armv4 override (which does apply for ep9312 tune) instead=
 of<br>
<br>
This doesn&#39;t sound right. The armv4 override is being added to<br>
MACHINEOVERRIDES (it&#39;s even shown in the patch context below). Is that=
<br>
somehow not working?<br>
<br>
&gt;=C2=A0 =C2=A0armv4 in TUNE_FEATURES - so the comment in the file was n=
o<br>
&gt;=C2=A0 =C2=A0longer correct and ep9312 wasn&#39;t usable<br>
&gt;<br>
&gt; * fixes:<br>
&gt;=C2=A0 =C2=A0scripts/tune/log.fake-ep9312:=C2=A0 =C2=A0 Error, the PAC=
KAGE_ARCHS variable (all any noarch arm armv4 armv4t ep9312 fake_ep9312) fo=
r DEFAULTTUNE (ep9312) does not contain TUNE_PKGARCH (ep9312t).<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/machine/include/tune-ep9312.inc | 3 +--<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/conf/machine/include/tune-ep9312.inc b/meta/conf/ma=
chine/include/tune-ep9312.inc<br>
&gt; index 11fd266ba0..5e1a0e5791 100644<br>
&gt; --- a/meta/conf/machine/include/tune-ep9312.inc<br>
&gt; +++ b/meta/conf/machine/include/tune-ep9312.inc<br>
&gt; @@ -8,6 +8,5 @@ MACHINEOVERRIDES =3D. &quot;${@bb.utils.contains(&#39=
;TUNE_FEATURES&#39;, &#39;ep9312&#39;, &#39;armv4:&#39;, &#39;<br>
&gt;<br>
&gt;=C2=A0 AVAILTUNES +=3D &quot;ep9312&quot;<br>
&gt;=C2=A0 ARMPKGARCH_tune-ep9312 =3D &quot;ep9312&quot;<br>
&gt; -# this tune does not include TUNE_FEATURES_tune-armv4t, so there is =
no armv4 TUNE_FEATURES =3D&gt; no &#39;t&#39; in ARMPKGSFX_THUMB<br>
&gt;=C2=A0 TUNE_FEATURES_tune-ep9312 =3D &quot;thumb ep9312&quot;<br>
&gt; -PACKAGE_EXTRA_ARCHS_tune-ep9312 =3D &quot;${PACKAGE_EXTRA_ARCHS_tune=
-armv4t} ep9312&quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS_tune-ep9312 =3D &quot;${PACKAGE_EXTRA_ARCHS_tune=
-armv4t} ep9312t&quot;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div>

--0000000000005b201705b248dc84--
