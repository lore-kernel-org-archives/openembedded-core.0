Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id CF6A37828D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 12:11:55 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id y65so614247qka.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 05:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nWH/2KRPq5lkj44zz+6Que6/22F9pQ9IEdMOo3vXeiI=;
	b=JPHZShCtBpgt1JDqMfg2u8oClfEpGtmO8xyYAjVVv4uPixh5hcmN0dR0y/XaSXZCdc
	C9PO6Wse7ZoyHFFY3RHC0U9Xb6IhNJKbV2Qn+pwmKxs7fT4MD2dvsCcMaCm299gMzi7o
	4jAiwHM2IbvKq2F/Rl2ildie0xmpmTXvWYH0gGWw4TDN0jPQHnrtGl8Rjl181a/4D4Ju
	2aTjLPqRrCfT6nrSr/tUqVwoKHfKDLJwDSK1nxmnn4gjR6ih+/0ni/ZEJZMnS0bkKW/o
	ny3/lUTYz+yP+KsTb4GD/6b8nLw+Wdk2LUQgMONnqrOi0M20qOBSS4WzchPtU0/VwCDj
	nL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nWH/2KRPq5lkj44zz+6Que6/22F9pQ9IEdMOo3vXeiI=;
	b=nvk8bZJhXVNQK8mxLEfm41EVqjKmQKqIWAe5kuWskzbxDgq53J4BB9OX1kEAzZ73Lo
	t6xwM6PQInRm/6YjzeSOG/MojfZZUX5y7qzDazDa1fKfL/D8R109w+J7Xb5lQKpmrbJO
	1SIEfcNS/7wF1bJQ7tVP/r0BRwTbSc192qqcZXmqPVc8jNaD1bRHYAtpvfe51E5jZe/j
	xUDw6b2tJzKjfLTJd3OR2f1ca8o4rTnLMQy8fVrlda1XukhBrWkA1QA3SeciU/u3uXzd
	nb5xmQECKaQaTpYciseidNFF3Q41u4EAhnEbAOJyb67Z6xEozBDrOo6Coorvz35TW7dc
	pl3g==
X-Gm-Message-State: AHYfb5jK5soi3gSKJ2ItqcNsz3RJKddO4f4UgDX0IPODHq8cJlBoWiWN
	wOmg/SKAN1kRwLyDPZDt4sajBQlgjw==
X-Received: by 10.55.162.194 with SMTP id l185mr9978100qke.265.1503317516451; 
	Mon, 21 Aug 2017 05:11:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.194.139 with HTTP; Mon, 21 Aug 2017 05:11:55 -0700 (PDT)
In-Reply-To: <1503315733.32591.61.camel@linuxfoundation.org>
References: <cover.1503283308.git.bruce.ashfield@windriver.com>
	<1503315733.32591.61.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 21 Aug 2017 08:11:55 -0400
Message-ID: <CADkTA4MLW_ALkySF9TS4=1N63YYRuTx8AN+-3s_gHhEhFES25w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 21 Aug 2017 12:11:56 -0000
Content-Type: multipart/alternative; boundary="001a114d838c8d88cf0557426239"

--001a114d838c8d88cf0557426239
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 21, 2017 at 7:42 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2017-08-20 at 22:58 -0400, Bruce Ashfield wrote:
> > Hi all,
> >
> > Here's the collected set of kernel changes that are ready for the M3
> > builds.
> >
> > We have some kernel meta data changes:
> >
> >   kernel-yocto: configuration updates: x86 features
> >   linux-yocto/4.1: fix fsl-ls10xx sdhci
> >   linux-yocto: add usb-net configs by default
> >
> > Some bug fixes:
> >
> >   kernel-yocto: ensure that only valid BSPs are built
> >   linux-yocto/4.10: CVE & misc fixes
> >
> > And the important changes are the addition of the 4.12 kernel + libc
> > headers
> > and the removal of the 4.1 kernel.
> >
> > I also have some -stable updates queued for the active kernel
> > versions, but
> > they will come out once this series has made it into the tree, since
> > I'm
> > trying to isolate any 4.12 issues from other -stable updates.
> >
> > I built and booted all the qemu targets for 4.12, and have built for
> > core-image-sato, core-image-kernel-dev, glibc and muslc for all of
> > the
> > architectures. My testing didn't pick up any regressions, but I was
> > battling
> > some other build errors (non kernel related) during my testing, so I
> > can
> > never be 100% sure.
> >
> > I've sent patches to poky to remove/bump any references to the 4.1
> > kernel
> > .. if I've missed any, I'm sure people will shout.
>
> I added an extra patch for the ones you missed in meta-yocto-bsp ;-)
>
> Also, https://autobuilder.yocto.io/builders/build-appliance/builds/425/
> steps/BuildImages_1/logs/stdio
>
> Error:
>  Problem: conflicting requests
>   - nothing provides /bin/awk needed by kernel-devsrc-1.0-r0.0.qemux86_64
>

Hmm. I've built that exact combination on two different builders in the
past week
and have never seen this.

How do I find out about the environment on that machine ? Because I'm not
going
to be able to reproduce it here.

Bruce


>
> Cheers,
>
> Richard
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114d838c8d88cf0557426239
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Aug 21, 2017 at 7:42 AM, Richard Purdie <span dir=3D"ltr">&lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">rich=
ard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On Sun, 2017-08-20 at=
 22:58 -0400, Bruce Ashfield wrote:<br>
&gt; Hi all,<br>
&gt;<br>
&gt; Here&#39;s the collected set of kernel changes that are ready for the =
M3<br>
&gt; builds.<br>
&gt;<br>
&gt; We have some kernel meta data changes:<br>
&gt;<br>
&gt; =C2=A0 kernel-yocto: configuration updates: x86 features<br>
&gt; =C2=A0 linux-yocto/4.1: fix fsl-ls10xx sdhci<br>
&gt; =C2=A0 linux-yocto: add usb-net configs by default<br>
&gt;<br>
&gt; Some bug fixes:<br>
&gt;<br>
&gt; =C2=A0 kernel-yocto: ensure that only valid BSPs are built<br>
&gt; =C2=A0 linux-yocto/4.10: CVE &amp; misc fixes<br>
&gt;<br>
&gt; And the important changes are the addition of the 4.12 kernel + libc<b=
r>
&gt; headers<br>
&gt; and the removal of the 4.1 kernel.<br>
&gt;<br>
&gt; I also have some -stable updates queued for the active kernel<br>
&gt; versions, but<br>
&gt; they will come out once this series has made it into the tree, since<b=
r>
&gt; I&#39;m<br>
&gt; trying to isolate any 4.12 issues from other -stable updates.<br>
&gt;<br>
&gt; I built and booted all the qemu targets for 4.12, and have built for<b=
r>
&gt; core-image-sato, core-image-kernel-dev, glibc and muslc for all of<br>
&gt; the<br>
&gt; architectures. My testing didn&#39;t pick up any regressions, but I wa=
s<br>
&gt; battling<br>
&gt; some other build errors (non kernel related) during my testing, so I<b=
r>
&gt; can<br>
&gt; never be 100% sure.<br>
&gt;<br>
&gt; I&#39;ve sent patches to poky to remove/bump any references to the 4.1=
<br>
&gt; kernel<br>
&gt; .. if I&#39;ve missed any, I&#39;m sure people will shout.<br>
<br>
</div></div>I added an extra patch for the ones you missed in meta-yocto-bs=
p ;-)<br>
<br>
Also,=C2=A0<a href=3D"https://autobuilder.yocto.io/builders/build-appliance=
/builds/425/
steps/BuildImages_1/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https:=
//autobuilder.<wbr>yocto.io/builders/build-<wbr>appliance/builds/425/<br>
steps/BuildImages_1/logs/stdio</a><br>
<br>
Error:=C2=A0<br>
=C2=A0Problem: conflicting requests<br>
=C2=A0 - nothing provides /bin/awk needed by kernel-devsrc-1.0-r0.0.<wbr>qe=
mux86_64<br></blockquote><div><br></div><div>Hmm. I&#39;ve built that exact=
 combination on two different builders in the past week</div><div>and have =
never seen this.</div><div><br></div><div>How do I find out about the envir=
onment on that machine ? Because I&#39;m not going</div><div>to be able to =
reproduce it here.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--001a114d838c8d88cf0557426239--
