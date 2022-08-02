Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 134E3C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 07:47:51 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.3572.1659426466864002157
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 00:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jpjgJNWB;
 spf=pass (domain: gmail.com, ip: 209.85.160.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id bz13so9759897qtb.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 00:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KrH843M038Sues7aCeXUPMufeCfT9m7+5GL0HgK439Y=;
        b=jpjgJNWBSfNsDEjB19xcyKKjAXX49PeaWvOdfAjTE1btEd8q3LEm5mMZg3lQERbCzY
         d0XweDXpZKjvMpwPZxnjQohimJ57EyKKjTxRMLLakYuMh1Q5Ah2A9h8afWMi7EDeeziT
         KjYELZINfi5l5I4y2xwSHA6hJBVUUlMUaQGK8bGQjVuQEx9hlvy5FXb0qTNPSjCuNPbt
         XO5naZ+pxihQBq1rN2kktnEaBhpPC26ACFpFOfjErx505L9Ffv/Ifu11xzLoQxHQvw4I
         5jM+0rp0l1YS2rW8fP3xT25Q/0ufQVgizeLMcuW+3fT1t+Y0MTaGYs4mcTdaWqsU/7ZE
         DbXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KrH843M038Sues7aCeXUPMufeCfT9m7+5GL0HgK439Y=;
        b=6d/7AvBKN6qlW2wxgoilPMO9tBMtbO0wu4Vjte2DVOszpoNeYFclnqza5CQNyjkWH9
         shkw5U5WH3JkTKn2xv1NwKJKQMNcXcGUJkj8i2Y/HQxx+68RFx46LX+Q9xf5c3sxvoZa
         a6Vm+bSNWAqBIJe0s4vGwEAXp9zqVb1Pqwx6twChKKdzntwfvC0KYyJh3rki+ntN+luz
         sqJm+dPB1PCCyYTDnwUz6SVbSKWpu9JCrgiAoUv1wefOWnpk72alTMJMGY1FXMiSosyd
         9e99OHIJlvcjnYC982HbglyZw1TBevKH2icfIvSr//BocxIc/H1N8VBCimqryGQvXs8N
         60fg==
X-Gm-Message-State: AJIora+oxei1KzdP9cFBb77QYEza9OpF6naBwtbCQt5oCiCeYNPEd053
	CrjfzfYFFJK+4Mq8LbS4sxJd60YHBgTUoaUUyuI=
X-Google-Smtp-Source: 
 AGRyM1sCKViTR5AVcxnbLNRdkfRebBGWq/e0FtGWit4L+GzembB5scQjs0ubmF+nP1AHmw2QjbeojaS4749qfbSenc0=
X-Received: by 2002:a05:622a:1102:b0:31f:29ed:2e2 with SMTP id
 e2-20020a05622a110200b0031f29ed02e2mr17218082qty.54.1659426465812; Tue, 02
 Aug 2022 00:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <e0dab0cb-4eb9-78df-6854-8fdf1ba5d059@denx.de>
 <20220726131758.3371000-1-drew@moseleynet.net>
 <3562f626-f6ca-3573-cf0f-49374af11b80@gmail.com>
 <d008419a-f8a0-cf0a-7bee-66011b5e929d@denx.de>
In-Reply-To: <d008419a-f8a0-cf0a-7bee-66011b5e929d@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Aug 2022 08:47:34 +0100
Message-ID: 
 <CAMKF1soSmZCBvJHYM4GPSUUjg9SY+ZuRuVC7phro1YryVadd4w@mail.gmail.com>
Subject: Re: [OE-core][PATCH] rng-tools: Replace obsolete "wants
 systemd-udev-settle"
To: Claudius Heine <ch@denx.de>
Cc: Drew Moseley <drew.moseley@gmail.com>,
 openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000006934705e53d55a0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 07:47:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168770

--00000000000006934705e53d55a0
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 2, 2022 at 8:24 AM Claudius Heine <ch@denx.de> wrote:

> Hi Drew,
>
> On 2022-08-01 20:44, Drew Moseley wrote:
> > On 7/26/22 9:17 AM, drew.moseley@gmail.com wrote:
> >
> >> From: Drew Moseley <drew@moseleynet.net>
> >>
> >> The systemd-udev-settle service is listed as obsolete and does in
> >> some cases result in a significant boot time.  Replace that with
> >> "after systemd-modules-load" to allow the random source hardware
> >> to be loaded in the proper sequence.
> >>
> >> Before this change:
> >>
> >>     Startup finished in 4.025s (kernel) + 2min 13.236s (userspace) =
> >> 2min 17.262s
> >>     multi-user.target reached after 2min 8.153s in userspace
> >>
> >> After this change:
> >>
> >>     Startup finished in 3.956s (kernel) + 13.294s (userspace) = 17.250s
> >>     multi-user.target reached after 9.522s in userspace
> >>
> >> Signed-off-by: Drew Moseley <drew@moseleynet.net>
> >> ---
> >>   meta/recipes-support/rng-tools/rng-tools/rngd.service | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service
> >> b/meta/recipes-support/rng-tools/rng-tools/rngd.service
> >> index 568686e80e..e818cfcf78 100644
> >> --- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
> >> +++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
> >> @@ -3,7 +3,7 @@ Description=Hardware RNG Entropy Gatherer Daemon
> >>   DefaultDependencies=no
> >>   After=systemd-udev-settle.service
> >>   Before=sysinit.target shutdown.target
> >> -Wants=systemd-udev-settle.service
> >> +After=systemd-modules-load.service
> >>   Conflicts=shutdown.target
> >>   [Service]
> >
> >
> > Hi Khem, Claudius,
> >
> > Any thoughts on this change? Obviously I cannot verify if the original
> > hardware combination issue is resolved and unfortunately it sounds like
> > you cannot either but I'm using this successfully to work around the
> > delayed boots I was seeing here.
>
> Well as I said, `systemd-modules-load.service` just waits until all
> statically configured modules are loaded, however not until the
> `/dev/hwrng` device node is available. `systemd-udev-settle.service`
> waits until all udev rules are applied, and that means it includes
> loading of all dynamically loaded modules as well as executing code that
> creates symlinks, etc.
>
> Instead of waiting for modules to be loaded, that might be unrelated or
> waiting for all (mostly unrelated) udev rules to be settled, I think
> waiting directly for the `/dev/hwrng` device node might be more explicit
> and specific.
>

Yeah something more surgical and pointed

Requires=dev-hwrng.device
After=dev-hwrng.device


Might be worth trying



> regards,
> Claudius
>

--00000000000006934705e53d55a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Aug 2, 2022 at 8:24 AM Claudius Heine &lt;<a href=
=3D"mailto:ch@denx.de">ch@denx.de</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Hi Drew,<br>
<br>
On 2022-08-01 20:44, Drew Moseley wrote:<br>
&gt; On 7/26/22 9:17 AM, <a href=3D"mailto:drew.moseley@gmail.com" target=
=3D"_blank">drew.moseley@gmail.com</a> wrote:<br>
&gt; <br>
&gt;&gt; From: Drew Moseley &lt;<a href=3D"mailto:drew@moseleynet.net" targ=
et=3D"_blank">drew@moseleynet.net</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; The systemd-udev-settle service is listed as obsolete and does in<=
br>
&gt;&gt; some cases result in a significant boot time.=C2=A0 Replace that w=
ith<br>
&gt;&gt; &quot;after systemd-modules-load&quot; to allow the random source =
hardware<br>
&gt;&gt; to be loaded in the proper sequence.<br>
&gt;&gt;<br>
&gt;&gt; Before this change:<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Startup finished in 4.025s (kernel) + 2min 13.2=
36s (userspace) =3D <br>
&gt;&gt; 2min 17.262s<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 multi-user.target reached after 2min 8.153s in =
userspace<br>
&gt;&gt;<br>
&gt;&gt; After this change:<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Startup finished in 3.956s (kernel) + 13.294s (=
userspace) =3D 17.250s<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 multi-user.target reached after 9.522s in users=
pace<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Drew Moseley &lt;<a href=3D"mailto:drew@moseleynet.=
net" target=3D"_blank">drew@moseleynet.net</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 meta/recipes-support/rng-tools/rng-tools/rngd.service | 2 +=
-<br>
&gt;&gt; =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service=
 <br>
&gt;&gt; b/meta/recipes-support/rng-tools/rng-tools/rngd.service<br>
&gt;&gt; index 568686e80e..e818cfcf78 100644<br>
&gt;&gt; --- a/meta/recipes-support/rng-tools/rng-tools/rngd.service<br>
&gt;&gt; +++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service<br>
&gt;&gt; @@ -3,7 +3,7 @@ Description=3DHardware RNG Entropy Gatherer Daemon=
<br>
&gt;&gt; =C2=A0 DefaultDependencies=3Dno<br>
&gt;&gt; =C2=A0 After=3Dsystemd-udev-settle.service<br>
&gt;&gt; =C2=A0 Before=3Dsysinit.target shutdown.target<br>
&gt;&gt; -Wants=3Dsystemd-udev-settle.service<br>
&gt;&gt; +After=3Dsystemd-modules-load.service<br>
&gt;&gt; =C2=A0 Conflicts=3Dshutdown.target<br>
&gt;&gt; =C2=A0 [Service]<br>
&gt; <br>
&gt; <br>
&gt; Hi Khem, Claudius,<br>
&gt; <br>
&gt; Any thoughts on this change? Obviously I cannot verify if the original=
 <br>
&gt; hardware combination issue is resolved and unfortunately it sounds lik=
e <br>
&gt; you cannot either but I&#39;m using this successfully to work around t=
he <br>
&gt; delayed boots I was seeing here.<br>
<br>
Well as I said, `systemd-modules-load.service` just waits until all <br>
statically configured modules are loaded, however not until the <br>
`/dev/hwrng` device node is available. `systemd-udev-settle.service` <br>
waits until all udev rules are applied, and that means it includes <br>
loading of all dynamically loaded modules as well as executing code that <b=
r>
creates symlinks, etc.<br>
<br>
Instead of waiting for modules to be loaded, that might be unrelated or <br=
>
waiting for all (mostly unrelated) udev rules to be settled, I think <br>
waiting directly for the `/dev/hwrng` device node might be more explicit <b=
r>
and specific.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yeah something m=
ore surgical and pointed</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><pre style=3D"color:var(--highlight-color);margin-top:0px;margin-bottom:0p=
x;padding:var(--su12);border:0px;font-family:var(--ff-mono);font-stretch:in=
herit;line-height:var(--lh-md);font-size:var(--fs-body1);vertical-align:bas=
eline;box-sizing:inherit;width:auto;max-height:600px;overflow:auto;border-r=
adius:var(--br-md);word-wrap:normal" dir=3D"auto"><code style=3D"margin:0px=
;padding:0px;border:0px;font-family:var(--ff-mono);font-style:inherit;font-=
variant-caps:inherit;font-stretch:inherit;line-height:inherit;font-size:var=
(--fs-body1);vertical-align:baseline;box-sizing:inherit;white-space:inherit=
;color:var(--black-800);border-radius:0px">Requires=3Ddev-hwrng.device
After=3Ddev-hwrng.device</code></pre><pre style=3D"color:var(--highlight-co=
lor);margin-top:0px;margin-bottom:0px;padding:var(--su12);border:0px;font-f=
amily:var(--ff-mono);font-stretch:inherit;line-height:var(--lh-md);font-siz=
e:var(--fs-body1);vertical-align:baseline;box-sizing:inherit;width:auto;max=
-height:600px;overflow:auto;border-radius:var(--br-md);word-wrap:normal" di=
r=3D"auto"><code style=3D"margin:0px;padding:0px;border:0px;font-family:var=
(--ff-mono);font-style:inherit;font-variant-caps:inherit;font-stretch:inher=
it;line-height:inherit;font-size:var(--fs-body1);vertical-align:baseline;bo=
x-sizing:inherit;white-space:inherit;color:var(--black-800);border-radius:0=
px"><br></code></pre><pre style=3D"color:var(--highlight-color);margin-top:=
0px;margin-bottom:0px;padding:var(--su12);border:0px;font-family:var(--ff-m=
ono);font-stretch:inherit;line-height:var(--lh-md);font-size:var(--fs-body1=
);vertical-align:baseline;box-sizing:inherit;width:auto;max-height:600px;ov=
erflow:auto;border-radius:var(--br-md);word-wrap:normal" dir=3D"auto"><code=
 style=3D"margin:0px;padding:0px;border:0px;font-family:var(--ff-mono);font=
-style:inherit;font-variant-caps:inherit;font-stretch:inherit;line-height:i=
nherit;font-size:var(--fs-body1);vertical-align:baseline;box-sizing:inherit=
;white-space:inherit;color:var(--black-800);border-radius:0px">Might be wor=
th trying </code></pre><pre style=3D"color:var(--highlight-color);margin-to=
p:0px;margin-bottom:0px;padding:var(--su12);border:0px;font-family:var(--ff=
-mono);font-stretch:inherit;line-height:var(--lh-md);font-size:var(--fs-bod=
y1);vertical-align:baseline;box-sizing:inherit;width:auto;max-height:600px;=
overflow:auto;border-radius:var(--br-md);word-wrap:normal" dir=3D"auto"><co=
de style=3D"margin:0px;padding:0px;border:0px;font-family:var(--ff-mono);fo=
nt-style:inherit;font-variant-caps:inherit;font-stretch:inherit;line-height=
:inherit;font-size:var(--fs-body1);vertical-align:baseline;box-sizing:inher=
it;white-space:inherit;color:var(--black-800);border-radius:0px"><br></code=
></pre></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><br>
regards,<br>
Claudius<br>
</blockquote></div></div>

--00000000000006934705e53d55a0--

