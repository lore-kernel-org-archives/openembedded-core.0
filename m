Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C047A74D54
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 00:25:27 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id a67-v6so9711865wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 17:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mHvT98PFpwdLPXbE68Gw/anHBPwk91Xggyh4/5Nq82c=;
	b=KnZD7Ep+quQze7JyI5nNU0DhCQ5BHPTny3SVddGZIajEtIOEZDk4/A6hr4KzH9Fuzw
	N2KICsuvEqNfNJQbKr4cxuHaobNRW3DLzx5k/FLXojrG6q5B/yLE54+ZDiovqQW/rL0H
	8BLagB7BiOBm17WiHfH1vehO0TRCkInkPfnamC+744rvf9tTXj/vvCmMalbK1XOhIR7u
	Pbp+ETN8OvKodOhYAIUzhqEVhuU8bQ6i2ztGuITSjP4qFv3LWOFiQEf19eJhj3255Jw2
	aEKKsydJx5/Ze7ZweNPuDKN7Vb2ZcHHOPsqgUurHmgYOEcdpm9nLg2gPNcrzLrPeH+55
	A2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mHvT98PFpwdLPXbE68Gw/anHBPwk91Xggyh4/5Nq82c=;
	b=C9ZjDTYx8pnU6HxRjXP4OiSp+VHIdihRaN9fp0NlQqxGm5rXzHrtQb1/N7QxhbLPhl
	jA0xfxEvKz1IJ0HpFquZNM8e9sUAD+arXkIszUhZz2ic03q3P20OxumbAaSo3zaklorH
	YuU0Zv1KaX5oXLbMOjiu+ehSvkXabZnVzK/8VIjNKsRrEXz2vpOeeGFrreeZhH5OsiQy
	0YcW4u1fPHSRLyoPds2ECd7YwuYW2VNKBowxzwjEEZ7HFKewgt8/V+tU0saQ3zuUUZRR
	qRxIUYZq3+CRPc3VRtE1AXiv0EyIYgSXVZKZAX7EJhWNWqmXm7NlmMNjLNrnjfFKL3vD
	Bkwg==
X-Gm-Message-State: ALKqPwch/C42yNEGP+/pI+a+ddCz+95gdaCco/CQbiy74FS1HvchDpqr
	xrCB4hrRm8sqn7M44AYwGAUMUVy3Jq2QftbE41U=
X-Google-Smtp-Source: ADUXVKLkLhjlaY7/WlNEJMqIUnJcxCyfyok6Bhk0u9t0PGxQgGqIziElwE2wh6+PheJIVc1H1w2na2DwE7yA60bQEmM=
X-Received: by 2002:a2e:c41:: with SMTP id o1-v6mr84065ljd.87.1527207928212;
	Thu, 24 May 2018 17:25:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.51.7 with HTTP; Thu, 24 May 2018 17:25:27 -0700 (PDT)
In-Reply-To: <CAKmqyKNe0f4c4FiKMiRc+TSjsd-f5v0rJL36Bvw7aUvrUwccVg@mail.gmail.com>
References: <20180502204907.137185-1-alistair.francis@wdc.com>
	<53bbe673-b84c-e155-7edf-c497b90b7ad1@intel.com>
	<CADkTA4OEpSL+grTWxPKomoA0s2S8V6KuNfu3+kJUmy1zHCaTTg@mail.gmail.com>
	<CAKmqyKP-zowK6tSQkRTZOwbic1xg-7cGQiayha2BXHZ2v1UO+g@mail.gmail.com>
	<CAKmqyKNe0f4c4FiKMiRc+TSjsd-f5v0rJL36Bvw7aUvrUwccVg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 24 May 2018 20:25:27 -0400
Message-ID: <CADkTA4MJ8y=iT30XXnU+CuUu9oFv0SAaZa1nrAbgs0YwZp3gug@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes-kernel/linux: Enable NUMA Kconfig from MACHINE_FEATURES
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
X-List-Received-Date: Fri, 25 May 2018 00:25:28 -0000
Content-Type: multipart/alternative; boundary="0000000000000f325d056cfccecc"

--0000000000000f325d056cfccecc
Content-Type: text/plain; charset="UTF-8"

On Thu, May 24, 2018 at 8:20 PM, Alistair Francis <alistair23@gmail.com>
wrote:

> On Thu, May 24, 2018 at 4:30 PM, Alistair Francis <alistair23@gmail.com>
> wrote:
> > On Thu, May 24, 2018 at 5:27 AM, Bruce Ashfield
> > <bruce.ashfield@gmail.com> wrote:
> >>
> >>
> >> On Thu, May 24, 2018 at 5:45 AM, Anuj Mittal <anuj.mittal@intel.com>
> wrote:
> >>>
> >>> On 05/03/2018 04:49 AM, Alistair Francis wrote:
> >>> > +KERNEL_FEATURES_append = " ${@bb.utils.contains('MACHINE_FEATURES',
> >>> > 'numa', 'features/numa/numa.scc', '', d)}"
> >>>
> >>> Isn't this enough to pull in the required configuration from
> >>>
> >>>
> >>> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-
> cache/tree/features/numa/numa.cfg
> >>>
> >>> If numa.cfg is missing something in yocto-kernel-cache that should be
> >>> applied to all machines, perhaps these configurations should be added
> >>> there?
> >>
> >>
> >> Correct.
> >>
> >> I wanted to run with this patch myself before sending feedback. In
> fact, I
> >> think that the kernel-cache
> >> numa config fragments are being used anyway. But since I'm traveling, I
> >> haven't gotten to that yet.
> >>
> >> Alistair: if you drop your fragment, are you actually getting a failure
> >> during the kernel meta data task ?
> >
> > From memory I didn't see a failure, but I didn't see the NUMA support
> > in the kernel.
> >
> > I'll run a test now.
>
> It looks like the fragment isn't required.
>
> Do you want me to resend the patch with the config fragment removed or
> is something for this already in the works?
>

Go ahead and send the v2. You can add my Acked-by: Bruce Ashfield <
bruce.ashfield@windriver.com>
on v2 to show that I've reviewed it.

Cheers,

Bruce


>
> Alistair
>
> >
> > Alistair
> >
> >>
> >> I will resubmit my patches shortly that allow any kernel to leverage the
> >> shared config frags, so
> >> using the ones in the kernel cache definitely makes sense.
> >>
> >> Bruce
> >>
> >>
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>
> >>
> >>
> >>
> >> --
> >> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at
> >> its end"
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--0000000000000f325d056cfccecc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, May 24, 2018 at 8:20 PM, Alistair Francis <span dir=3D"ltr">&lt=
;<a href=3D"mailto:alistair23@gmail.com" target=3D"_blank">alistair23@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D=
"">On Thu, May 24, 2018 at 4:30 PM, Alistair Francis &lt;<a href=3D"mailto:=
alistair23@gmail.com">alistair23@gmail.com</a>&gt; wrote:<br>
&gt; On Thu, May 24, 2018 at 5:27 AM, Bruce Ashfield<br>
&gt; &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.c=
om</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Thu, May 24, 2018 at 5:45 AM, Anuj Mittal &lt;<a href=3D"mailto=
:anuj.mittal@intel.com">anuj.mittal@intel.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 05/03/2018 04:49 AM, Alistair Francis wrote:<br>
&gt;&gt;&gt; &gt; +KERNEL_FEATURES_append =3D &quot; ${@bb.utils.contains(&=
#39;MACHINE_<wbr>FEATURES&#39;,<br>
&gt;&gt;&gt; &gt; &#39;numa&#39;, &#39;features/numa/numa.scc&#39;, &#39;&#=
39;, d)}&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Isn&#39;t this enough to pull in the required configuration fr=
om<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; <a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/yocto-ke=
rnel-cache/tree/features/numa/numa.cfg" rel=3D"noreferrer" target=3D"_blank=
">https://git.yoctoproject.org/<wbr>cgit/cgit.cgi/yocto-kernel-<wbr>cache/t=
ree/features/numa/numa.<wbr>cfg</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; If numa.cfg is missing something in yocto-kernel-cache that sh=
ould be<br>
&gt;&gt;&gt; applied to all machines, perhaps these configurations should b=
e added<br>
&gt;&gt;&gt; there?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Correct.<br>
&gt;&gt;<br>
&gt;&gt; I wanted to run with this patch myself before sending feedback. In=
 fact, I<br>
&gt;&gt; think that the kernel-cache<br>
&gt;&gt; numa config fragments are being used anyway. But since I&#39;m tra=
veling, I<br>
&gt;&gt; haven&#39;t gotten to that yet.<br>
&gt;&gt;<br>
&gt;&gt; Alistair: if you drop your fragment, are you actually getting a fa=
ilure<br>
&gt;&gt; during the kernel meta data task ?<br>
&gt;<br>
&gt; From memory I didn&#39;t see a failure, but I didn&#39;t see the NUMA =
support<br>
&gt; in the kernel.<br>
&gt;<br>
&gt; I&#39;ll run a test now.<br>
<br>
</span>It looks like the fragment isn&#39;t required.<br>
<br>
Do you want me to resend the patch with the config fragment removed or<br>
is something for this already in the works?<br></blockquote><div><br></div>=
<div>Go ahead and send the v2. You can add my Acked-by: Bruce Ashfield &lt;=
<a href=3D"mailto:bruce.ashfield@windriver.com">bruce.ashfield@windriver.co=
m</a>&gt;</div><div>on v2 to show that I&#39;ve reviewed it.<br></div><div>=
<br></div><div>Cheers,</div><div><br></div><div>Bruce</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Alistair<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Alistair<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; I will resubmit my patches shortly that allow any kernel to levera=
ge the<br>
&gt;&gt; shared config frags, so<br>
&gt;&gt; using the ones in the kernel cache definitely makes sense.<br>
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; ______________________________<wbr>_________________<br>
&gt;&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Op=
enembedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/open=
embedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedd=
ed.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madnes=
s await thee at<br>
&gt;&gt; its end&quot;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; ______________________________<wbr>_________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openem=
bedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;&gt;<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--0000000000000f325d056cfccecc--
