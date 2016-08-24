Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id B12E3731FA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 13:14:09 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id v123so1121747qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 06:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ondooSwB6rUuDa2kQw8CQiiDJFCNzKwhUEE1Shi3Cig=;
	b=S12b5JCLsZtl0eudGDBz8WdQagncQ/+8X/s6FScbhneHsb1Vm/+Q5oO67MixX13rdO
	Dp2bFwxOldcNUkm2zTSKGqD8jSxOgr8go6X0YgjIVmU/aRwS+h4xVywPUQDpvEr+Qqmu
	9q37wfkZroeajt9p/yqLYnd7EuhsqBdL6933jT9NNT7V/eg95lHxYfZe9wGoWiYPC7S2
	4rerhuv2R1xfTmBiC5a1rkcSJqZB+YGgj3lRSLX6kECtNHDyi/Z6OZ7veOVLtisas8KZ
	9LtLq+8hksRZqvGvPilOdJstfohZFrTJTHYltQxy8Z1OOKTfmXhMLwdP6U6dViSgHJ8t
	kI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ondooSwB6rUuDa2kQw8CQiiDJFCNzKwhUEE1Shi3Cig=;
	b=Eicy7JCS8nMeK+6Bw1bdQ1yv/p2R84nsIto9iwxjHiFb8reSjhlyLAn6Q/kiR6On8M
	FhOLCXf8O1blIP3BT4SNq3dPI769r6QLpKVEKmKX/vRluMano1rqWZ5PxAWpBAgQQDuQ
	d//NZY7jKJHv0GHTf5o7wnOiyt11UPo+Rasy5vM0n3qOlZ84+OI2LgMHT22iwbZ7OP55
	MAV6o5v96yGxmgWkKzcBR89xbu3rZu8t0nQozBHQT3E2p8SfCFoGr9Ip8Y8onef1ClNO
	KNUhUNQGK41w3gBcgeNFS4BjP5ZaOWSjozGepwCTCMOm5McRSeGoXUN1vCBIjdHwKCNt
	oJew==
X-Gm-Message-State: AE9vXwNrq1WywQ2XChTn6hmekbPEjTfRqGEYg2GNBj+nCvR+4mkAlK93hnMEIkttq5VgwuzcMsDwbqRDPi3wCg==
X-Received: by 10.55.161.215 with SMTP id k206mr3484063qke.278.1472044448894; 
	Wed, 24 Aug 2016 06:14:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.50.137 with HTTP; Wed, 24 Aug 2016 06:14:08 -0700 (PDT)
In-Reply-To: <1472037952.16712.129.camel@linuxfoundation.org>
References: <cover.1471281772.git.bruce@zedd.org>
	<a68dd58391c30a64e3b0830152b0ffbce04f90cb.1471281772.git.bruce@zedd.org>
	<1471533301.16712.11.camel@linuxfoundation.org>
	<19315d97-49eb-da07-d137-c28d51b3e7d0@windriver.com>
	<1471533645.16712.13.camel@linuxfoundation.org>
	<4baf8dd3-5bb8-aef8-a339-0aad7224329a@windriver.com>
	<1472037952.16712.129.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 24 Aug 2016 09:14:08 -0400
Message-ID: <CADkTA4Myc1r2P9EE2M2Uy96cYMPoidaCXgC8BRghtEiSeNr_zw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] linux-yocto/4.1: bump to v4.1.29
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
X-List-Received-Date: Wed, 24 Aug 2016 13:14:10 -0000
Content-Type: multipart/alternative; boundary=94eb2c052ed478739e053ad10e7f

--94eb2c052ed478739e053ad10e7f
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 24, 2016 at 7:25 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2016-08-19 at 10:57 -0400, Bruce Ashfield wrote:
> > On 2016-08-18 11:20 AM, Richard Purdie wrote:
> > > On Thu, 2016-08-18 at 11:16 -0400, Bruce Ashfield wrote:
> > > > On 2016-08-18 11:15 AM, Richard Purdie wrote:
> > > > > On Mon, 2016-08-15 at 14:26 -0400, Bruce Ashfield wrote:
> > > > > > Integrating the korg 4.1.29 -stable release
> > > > > >
> > > > > > Signed-off-by: Bruce Ashfield <bruce@zedd.org>
> > > > > > ---
> > > > > >  meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++--
> > > > > > -
> > > > > >  meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++--
> > > > > > -
> > > > > >  meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20
> > > > > > ++++++++++---
> > > > > > -------
> > > > > >  3 files changed, 16 insertions(+), 16 deletions(-)
> > > > >
> > > > > FWIW since the update before this one, we've seen a lot of
> > > > > instability
> > > > > in ppc:
> > > > >
> > > > > https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-
> > > > > lsb/
> > > > > builds/881/steps/Running%20Sanity%20Tests/logs/stdio
> > > > >
> > > > > basically the network seems very flaky. Doesn't happen every
> > > > > time
> > > > > but
> > > > > we are seeing a rising number of these kinds of 'random'
> > > > > failures.
> > > > > Are
> > > > > there any ppc changes or fixes which look like they're
> > > > > responsible,
> > > > > I'm
> > > > > pretty sure its something 4.1 kernel related...
> > > > >
> > > > > The update also triggered a new 'error' for amd_nb in the error
> > > > > log
> > > > > parsing which I just whitelisted, probably from some change in
> > > > > the
> > > > > configuration options enabled.
> > > >
> > > > I have a 4.1.30 update queued locally, and I'll double check to
> > > > see
> > > > what may have changed in the configuration that could explain any
> > > > new warnings or instability.
> > >
> > > Just to be clear, the amb_nd change was on qemux86* on 4.1
> > >
> > > https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64-l
> > > sb/builds/911/steps/Running%20Sanity%20Tests/logs/stdio
> > >
> > > fixed with:
> > >
> > > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=26b0657b2f7875
> > > 1e60df6e695d5bc0dd703a5bc2
> >
> > I had a look at this, and I don't have a root cause for why this is
> > just popping up now. I'm trying to track down an older build, so I
> > can
> > compare the .configs.
> >
> > The kernel code, and Kconfig files themselves haven't changed in some
> > time, and the symbol in question AMD_NB is default 'y' if the
> > dependencies are met. We include cfg/amd.scc in all of the qemux86*
> > builds, so it gets enabled (as it should have before).
> >
> > I could force that option off, but the whitelist is an appropriate
> > fix,
> > since this is an interaction between qemu and the kernel, whereas the
> > files that include amd.scc are targeted at a range of platforms.
> >
> > >
> > > The ppc issue is a separate one.
> >
> > I've been blasting away on my 4.1.30 qemuppc build, and I'm not
> > seeing
> > anything yet, but I will keep trying.
>
> Its still going on even with the recent updates:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-lsb/
> builds/889/steps/Running%20Sanity%20Tests/logs/stdio
>
> Seems the network works intermittently, dropping connections...
>

Hmm.

I've had a qemuppc up and running for 3 days now, doing transfers of files
from my server, and yet my network hasn't dropped.
I'll continue trying to figure this out.

Bruce


>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c052ed478739e053ad10e7f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Aug 24, 2016 at 7:25 AM, Richard Purdie <span dir=3D"ltr">&lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">rich=
ard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On Fri, 2016-08-19 at=
 10:57 -0400, Bruce Ashfield wrote:<br>
&gt; On 2016-08-18 11:20 AM, Richard Purdie wrote:<br>
&gt; &gt; On Thu, 2016-08-18 at 11:16 -0400, Bruce Ashfield wrote:<br>
&gt; &gt; &gt; On 2016-08-18 11:15 AM, Richard Purdie wrote:<br>
&gt; &gt; &gt; &gt; On Mon, 2016-08-15 at 14:26 -0400, Bruce Ashfield wrote=
:<br>
&gt; &gt; &gt; &gt; &gt; Integrating the korg 4.1.29 -stable release<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailt=
o:bruce@zedd.org">bruce@zedd.org</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://=
linux-yocto-rt_4.1.bb" rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yoct=
o-rt_4.1.bb</a>=C2=A0 =C2=A0|=C2=A0 6 +++--<br>
&gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://=
linux-yocto-tiny_4.1.bb" rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yo=
cto-tiny_4.1.bb</a> |=C2=A0 6 +++--<br>
&gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://=
linux-yocto_4.1.bb" rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto_4=
.1.bb</a>=C2=A0 =C2=A0 =C2=A0 | 20<br>
&gt; &gt; &gt; &gt; &gt; ++++++++++---<br>
&gt; &gt; &gt; &gt; &gt; -------<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 3 files changed, 16 insertions(+), 16 deleti=
ons(-)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; FWIW since the update before this one, we&#39;ve seen a=
 lot of<br>
&gt; &gt; &gt; &gt; instability<br>
&gt; &gt; &gt; &gt; in ppc:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/main/bu=
ilders/nightly-ppc-" rel=3D"noreferrer" target=3D"_blank">https://autobuild=
er.<wbr>yoctoproject.org/main/<wbr>builders/nightly-ppc-</a><br>
&gt; &gt; &gt; &gt; lsb/<br>
&gt; &gt; &gt; &gt; builds/881/steps/Running%<wbr>20Sanity%20Tests/logs/std=
io<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; basically the network seems very flaky. Doesn&#39;t hap=
pen every<br>
&gt; &gt; &gt; &gt; time<br>
&gt; &gt; &gt; &gt; but<br>
&gt; &gt; &gt; &gt; we are seeing a rising number of these kinds of &#39;ra=
ndom&#39;<br>
&gt; &gt; &gt; &gt; failures.<br>
&gt; &gt; &gt; &gt; Are<br>
&gt; &gt; &gt; &gt; there any ppc changes or fixes which look like they&#39=
;re<br>
&gt; &gt; &gt; &gt; responsible,<br>
&gt; &gt; &gt; &gt; I&#39;m<br>
&gt; &gt; &gt; &gt; pretty sure its something 4.1 kernel related...<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; The update also triggered a new &#39;error&#39; for amd=
_nb in the error<br>
&gt; &gt; &gt; &gt; log<br>
&gt; &gt; &gt; &gt; parsing which I just whitelisted, probably from some ch=
ange in<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; configuration options enabled.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I have a 4.1.30 update queued locally, and I&#39;ll double c=
heck to<br>
&gt; &gt; &gt; see<br>
&gt; &gt; &gt; what may have changed in the configuration that could explai=
n any<br>
&gt; &gt; &gt; new warnings or instability.<br>
&gt; &gt;<br>
&gt; &gt; Just to be clear, the amb_nd change was on qemux86* on 4.1<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/main/builders/nig=
htly-x86-64-l" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.<wb=
r>yoctoproject.org/main/<wbr>builders/nightly-x86-64-l</a><br>
&gt; &gt; sb/builds/911/steps/Running%<wbr>20Sanity%20Tests/logs/stdio<br>
&gt; &gt;<br>
&gt; &gt; fixed with:<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=
=3D26b0657b2f7875" rel=3D"noreferrer" target=3D"_blank">http://git.yoctopro=
ject.org/<wbr>cgit.cgi/poky/commit/?id=3D<wbr>26b0657b2f7875</a><br>
&gt; &gt; 1e60df6e695d5bc0dd703a5bc2<br>
&gt;<br>
&gt; I had a look at this, and I don&#39;t have a root cause for why this i=
s<br>
&gt; just popping up now. I&#39;m trying to track down an older build, so I=
<br>
&gt; can<br>
&gt; compare the .configs.<br>
&gt;<br>
&gt; The kernel code, and Kconfig files themselves haven&#39;t changed in s=
ome<br>
&gt; time, and the symbol in question AMD_NB is default &#39;y&#39; if the<=
br>
&gt; dependencies are met. We include cfg/amd.scc in all of the qemux86*<br=
>
&gt; builds, so it gets enabled (as it should have before).<br>
&gt;<br>
&gt; I could force that option off, but the whitelist is an appropriate<br>
&gt; fix,<br>
&gt; since this is an interaction between qemu and the kernel, whereas the<=
br>
&gt; files that include amd.scc are targeted at a range of platforms.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; The ppc issue is a separate one.<br>
&gt;<br>
&gt; I&#39;ve been blasting away on my 4.1.30 qemuppc build, and I&#39;m no=
t<br>
&gt; seeing<br>
&gt; anything yet, but I will keep trying.<br>
<br>
</div></div>Its still going on even with the recent updates:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-l=
sb/builds/889/steps/Running%20Sanity%20Tests/logs/stdio" rel=3D"noreferrer"=
 target=3D"_blank">https://autobuilder.<wbr>yoctoproject.org/main/<wbr>buil=
ders/nightly-ppc-lsb/<wbr>builds/889/steps/Running%<wbr>20Sanity%20Tests/lo=
gs/stdio</a><br>
<br>
Seems the network works intermittently, dropping connections...<br></blockq=
uote><div><br></div><div>Hmm.<br><br></div><div>I&#39;ve had a qemuppc up a=
nd running for 3 days now, doing transfers of files from my server, and yet=
 my network hasn&#39;t dropped.<br></div><div>I&#39;ll continue trying to f=
igure this out.<br><br></div><div>Bruce<br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5"><br>
Cheers,<br>
<br>
Richard<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--94eb2c052ed478739e053ad10e7f--
