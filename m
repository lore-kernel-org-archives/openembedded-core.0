Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id C9E6B6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 20:58:37 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id k142so225451935oib.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2016 13:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=O8UZ+rAojI9OPPYK+2dGAeeYSednxhSFoafvPENJZII=;
	b=ZEz55CSNVy9RLhTcGFee9AaknhWrVmivc2XNApknTI5XdW0Wdy0aiUQlYL1dAueVg4
	oLm+C/ODVM7w6abcB8Yr3YO2l5f9wDKz727ICWL5HJUHCblIzlyZDTpI27XFSLXLkqn4
	pbQYYuRBgr96nUHEPCwFSVyOd2bA9s993d3CDV+htgyJrsEK56+HYyHL/uzHlF63Iw0t
	Q+FQb13eiOukYtNG+k2V7J9FCcRPiKbFVQar51u/FfeyI10leMVwHoW9WbFJnhz1acZu
	EgmOQEf2srOHmeD1aPXB+m+gP3If3C+jV1Apdx/Jj2hbUbBKaKJsRur89T7qfvpJPSPA
	Vr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=O8UZ+rAojI9OPPYK+2dGAeeYSednxhSFoafvPENJZII=;
	b=TzuY63rIboXzkx9Ai6EwqvnZEak6xq5t1OIzXvM6Ax/+8fnUKBEOkq/CeRLLcw5VhN
	obn3zWTkG+cG0BxCEvcsKRjUCQ2Jd8bg7Mtvmh46C72vX+gHr2jgcbIF6rKf1C/s1enG
	6RPtflE12863mK59+F5t+lp4mOUejW4wpCpwuxT6i4Q4AhoiubZKSm+BEtHBbVH93095
	Htg96qgqBBVpaILZ934cBKm1xvaXclrSUkLWBY6mhcHLVqFUhCO0epyrrqji919+s3jF
	smiMNm8FAlcp/kdkKhmJ3D2Jpw9u0bGzlEWKnBNvrqfV5BkRKH5zBrwl18VgA7uUdv+2
	T0jA==
X-Gm-Message-State: AOPr4FV2267SX5ElARjFhPcr5YRkrRHwX/HuhL+ROTrawxf+994ogXcaJ3A2IvGw//skMkzL5+t4f6uablk7Pg==
MIME-Version: 1.0
X-Received: by 10.202.196.72 with SMTP id u69mr14246723oif.116.1462827518214; 
	Mon, 09 May 2016 13:58:38 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Mon, 9 May 2016 13:58:38 -0700 (PDT)
In-Reply-To: <2777859.s7KusZZa7x@peggleto-mobl.ger.corp.intel.com>
References: <cover.1462768634.git.paul.eggleton@linux.intel.com>
	<29259d2220b8e6e577a3efaa160b77e3366fb6d5.1462768634.git.paul.eggleton@linux.intel.com>
	<CADkTA4MGn2Ju0X-AKeyOJ0ba-kZ6v8XGDr2JcPk5zXWADzyMnA@mail.gmail.com>
	<2777859.s7KusZZa7x@peggleto-mobl.ger.corp.intel.com>
Date: Mon, 9 May 2016 16:58:38 -0400
Message-ID: <CADkTA4NDup8ztA0uf9N-dCtgTMn1Z4DXPvpN5sjbMsDwver2+w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 6/6] classes/image: check kernel config supports IMAGE_FSTYPES items
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
X-List-Received-Date: Mon, 09 May 2016 20:58:38 -0000
Content-Type: multipart/alternative; boundary=001a11352a4e974a5905326f1282

--001a11352a4e974a5905326f1282
Content-Type: text/plain; charset=UTF-8

On Mon, May 9, 2016 at 4:45 PM, Paul Eggleton <paul.eggleton@linux.intel.com
> wrote:

> Hi Bruce,
>
> On Mon, 09 May 2016 08:05:06 Bruce Ashfield wrote:
> > On Mon, May 9, 2016 at 12:43 AM, Paul Eggleton <
> > paul.eggleton@linux.intel.com> wrote:
> > > A lot of the IMAGE_FSTYPES items require the appropriate filesystem
> > > driver to be enabled in the kernel configuration; e.g. in order to read
> > > a btrfs filesystem, the kernel must enable CONFIG_BTRFS_FS. Add a check
> > > to ensure that is the case.
> >
> > So what's the overall design for this ? Is it documented anywhere ? This
> is
> > something that we talked about a couple of years and I have reservations
> and
> > objections to the current implementation.
> >
> > .. but since I can only see bits and chunks of patches, I'd rather read
> > something complete and offer some more detailed feedback.
> >
> > Bottom line: I see a slippery slope to tightly specified option that
> depend
> > on kernel versions, I see kernel options sprayed all over layers, etc,
> etc.
> > Which is exactly what we've been trying to avoid with the centralized
> kernel
> > meta-data, and again, there's a mechanism that I finished early this
> year to
> > extend those options to any kernel, enforce, warn, error, etc .. but now,
> > I'll just toss it into the bin.
>
> There's no design written out beyond what you see in the associated bug:
>
>   https://bugzilla.yoctoproject.org/show_bug.cgi?id=5574
>
> The situation I am trying to avoid is the exact one mentioned by a
> commenter
> on that bug - which is that if I build my rootfs in a particular way, and
> couple it with a particular kernel configuration, I want the build system
> to
> tell me if those are going to be incompatible. The current situation where
> the
> you don't find out until the system doesn't boot (and you may not get any
> meaningful error message at that point anyway) isn't great.
>
> You mention hardware in your reply to Chris, but this mostly isn't about
> hardware - it's about dependencies on software features of the kernel from
>

I only brought up h/w to point out the slippery slope, and that if you are
going to
solve one class of options, eventually it will lead to someone asking for
others
and then the ability to set them. We then have a tight binding and
distributed
knowledge of the kernel specifics.


> userspace. I'm perfectly happy if we go for alternative solution, but to my
> mind whatever solution we come up with needs to be something whereby if you
> enable something in userspace that the kernel as currently configured isn't
> going to be able to support, you at least get a warning at build time.
>

What you describe is almost exactly what KERNEL_FEATURES + the existing
Kconfig
audit does. That mechanism does the audit for software and h/w features via
a level
of abstraction (the name of the feature, versus the kernel options
themselves).

I'm about 75% of the way to extended that to any kernel (not just
linux-yocto) and
exposing the "required" and "optional" kconfig support (that has been
around for
about 1.5 years .. just no one has asked for it :D

That's why I'm trying to understand what exactly is missing and is being
solved
here, so I can decide whether to drop my changes or not.

Bruce


>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11352a4e974a5905326f1282
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, May 9, 2016 at 4:45 PM, Paul Eggleton <span dir=3D"ltr">&lt;<a =
href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.egglet=
on@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
Hi Bruce,<br>
<span class=3D""><br>
On Mon, 09 May 2016 08:05:06 Bruce Ashfield wrote:<br>
&gt; On Mon, May 9, 2016 at 12:43 AM, Paul Eggleton &lt;<br>
&gt; <a href=3D"mailto:paul.eggleton@linux.intel.com">paul.eggleton@linux.i=
ntel.com</a>&gt; wrote:<br>
&gt; &gt; A lot of the IMAGE_FSTYPES items require the appropriate filesyst=
em<br>
&gt; &gt; driver to be enabled in the kernel configuration; e.g. in order t=
o read<br>
&gt; &gt; a btrfs filesystem, the kernel must enable CONFIG_BTRFS_FS. Add a=
 check<br>
&gt; &gt; to ensure that is the case.<br>
&gt;<br>
&gt; So what&#39;s the overall design for this ? Is it documented anywhere =
? This is<br>
&gt; something that we talked about a couple of years and I have reservatio=
ns and<br>
&gt; objections to the current implementation.<br>
&gt;<br>
&gt; .. but since I can only see bits and chunks of patches, I&#39;d rather=
 read<br>
&gt; something complete and offer some more detailed feedback.<br>
&gt;<br>
&gt; Bottom line: I see a slippery slope to tightly specified option that d=
epend<br>
&gt; on kernel versions, I see kernel options sprayed all over layers, etc,=
 etc.<br>
&gt; Which is exactly what we&#39;ve been trying to avoid with the centrali=
zed kernel<br>
&gt; meta-data, and again, there&#39;s a mechanism that I finished early th=
is year to<br>
&gt; extend those options to any kernel, enforce, warn, error, etc .. but n=
ow,<br>
&gt; I&#39;ll just toss it into the bin.<br>
<br>
</span>There&#39;s no design written out beyond what you see in the associa=
ted bug:<br>
<br>
=C2=A0 <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5574"=
 rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/sho=
w_bug.cgi?id=3D5574</a><br>
<br>
The situation I am trying to avoid is the exact one mentioned by a commente=
r<br>
on that bug - which is that if I build my rootfs in a particular way, and<b=
r>
couple it with a particular kernel configuration, I want the build system t=
o<br>
tell me if those are going to be incompatible. The current situation where =
the<br>
you don&#39;t find out until the system doesn&#39;t boot (and you may not g=
et any<br>
meaningful error message at that point anyway) isn&#39;t great.<br>
<br>
You mention hardware in your reply to Chris, but this mostly isn&#39;t abou=
t<br>
hardware - it&#39;s about dependencies on software features of the kernel f=
rom<br></blockquote><div><br></div><div>I only brought up h/w to point out =
the slippery slope, and that if you are going to</div><div>solve one class =
of options, eventually it will lead to someone asking for others</div><div>=
and then the ability to set them. We then have a tight binding and distribu=
ted</div><div>knowledge of the kernel specifics.</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">
userspace. I&#39;m perfectly happy if we go for alternative solution, but t=
o my<br>
mind whatever solution we come up with needs to be something whereby if you=
<br>
enable something in userspace that the kernel as currently configured isn&#=
39;t<br>
going to be able to support, you at least get a warning at build time.<br><=
/blockquote><div><br></div><div>What you describe is almost exactly what KE=
RNEL_FEATURES + the existing Kconfig</div><div>audit does. That mechanism d=
oes the audit for software and h/w features via a level</div><div>of abstra=
ction (the name of the feature, versus the kernel options themselves).</div=
><div><br></div><div>I&#39;m about 75% of the way to extended that to any k=
ernel (not just linux-yocto) and</div><div>exposing the &quot;required&quot=
; and &quot;optional&quot; kconfig support (that has been around for</div><=
div>about 1.5 years .. just no one has asked for it :D</div><div><br></div>=
<div>That&#39;s why I&#39;m trying to understand what exactly is missing an=
d is being solved</div><div>here, so I can decide whether to drop my change=
s or not.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
<br>
Cheers,<br>
Paul<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a11352a4e974a5905326f1282--
