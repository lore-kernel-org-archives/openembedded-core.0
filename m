Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 15DEA7DFEF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 14:07:25 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id y19so1663416lfy.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2019 07:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ahrrli7pFxLBZ8FHFhqSmkA2ybYS9L52EifqHTgUmdw=;
	b=o+XjjTaf7Kbokswvd1J+dSuFIM7U8Pm03PXbo9pG4FB+wmY9TxFtT3Lv7xHOqSjD1H
	oynNbAwbTVIvPZZTZCF42CfiGdM3bvequmrGXx3wth3NAB5QnYMqRiMSq2ATJxBG4Vdw
	N6xWApYjz9Zpv1eOmlWQxYlca7Y+NK4665i3DyXLs4QljxjZrvQ570KcB/P4chhgfvcr
	DLddtw0kJAw0EX8ASu52ZQSjU5tOG1slK9lieyIAo/sLvinrWuiTT8Eb4QkE2qKPun/j
	mM7cShSmJsgQDqAFg0jxABjkM2QWMI581FuCr0E6ycjagwDQfpb22/d2XpcDi0h6WNDJ
	RkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ahrrli7pFxLBZ8FHFhqSmkA2ybYS9L52EifqHTgUmdw=;
	b=QG6cfTm/8vr63RT0AOAYmZTYRr+8g/JlQjw894R2j1KTYXVX0KjBj7NnNCpagNRXEM
	Gd3lrxmC19iHD/bydtlPDw/0kyBJjV7Q4KmrVgudR/Bkw4AZh96eL7cFTZo8a/e7VnaL
	VGdHujPycJfzw9Mgc/zn9ghpBuKrSgsFGlscg9sNm/fqZj19WEBeGIUb181yJvNLZVBw
	rUzS8Q61QIZP+EPcfN6B9PEBrVCniUKVrDUIgraNJCVIGfRe/72+NmbeDy5UX3vF1yzY
	l0dAsaACHA2uGflNWZsOr2ivJoLvNqHwgYi0qBWMRMZrXWMlTRRbFr65EM/JkEnj7amj
	+RHQ==
X-Gm-Message-State: APjAAAX1hpBAdP/vzdfuICAYBDVy9b+uXK+P1eFVov1OLDw1kX+DHKPb
	4Dwc5BxDEVI5T2RyAIXH4q9AydPRrHX0+gE0m4M=
X-Google-Smtp-Source: APXvYqyYm+fL2EZNFUPSRAjBImNmGhihTmYkqXXPXZL+LKlzoUSToO562mBqN1H9owg/9Td9THyC13oiekFRFOQsMes=
X-Received: by 2002:ac2:4217:: with SMTP id y23mr2645505lfh.134.1557410846274; 
	Thu, 09 May 2019 07:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190508115836.15758-1-paul@betafive.co.uk>
	<20190508115836.15758-3-paul@betafive.co.uk>
	<20190508130249.GA25917@localhost>
	<7a1b1694-9c7c-40eb-a998-343879c0283d@www.fastmail.com>
	<ba43a2fb-4c12-4b35-bb40-b58ccf18ad83@www.fastmail.com>
	<74876e92becd2c2b04831dc4776faabd87fc53c9.camel@linuxfoundation.org>
	<CADkTA4O16TV+7Dj11c9MwjRGQWXSAto+L6Y3xbn4hu3U2D1NKA@mail.gmail.com>
	<eca8b6ab-8d60-4a83-b0b2-9803913f4895@www.fastmail.com>
In-Reply-To: <eca8b6ab-8d60-4a83-b0b2-9803913f4895@www.fastmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 9 May 2019 10:07:14 -0400
Message-ID: <CADkTA4MtXToXhg=XE1pR-V0sy_5rwr0cu=_imsapyKFOJKxP1Q@mail.gmail.com>
To: Paul Barker <paul@betafive.co.uk>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] strace: Fix aarch64 build with musl
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
X-List-Received-Date: Thu, 09 May 2019 14:07:26 -0000
Content-Type: multipart/alternative; boundary="00000000000042fd3c058874f889"

--00000000000042fd3c058874f889
Content-Type: text/plain; charset="UTF-8"

On Thu, May 9, 2019 at 10:00 AM Paul Barker <paul@betafive.co.uk> wrote:

> On Thu, 9 May 2019, at 14:48, Bruce Ashfield wrote:
> >
> >
> > On Thu, May 9, 2019 at 9:43 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Thu, 2019-05-09 at 08:08 -0400, Paul Barker wrote:
> > >  > On Thu, 9 May 2019, at 11:13, Paul Barker wrote:
> > >  > > On Wed, 8 May 2019, at 14:02, Adrian Bunk wrote:
> > >  > > > On Wed, May 08, 2019 at 11:58:36AM +0000, paul@betafive.co.uk
> > >  > > > wrote:
> > >  > > > > ...
> > >  > > > > +--- strace-4.26.orig/strace.c
> > >  > > > > ++++ strace-4.26/strace.c
> > >  > > > > +@@ -26,7 +26,7 @@
> > >  > > > > + #include <locale.h>
> > >  > > > > + #include <sys/utsname.h>
> > >  > > > > + #ifdef HAVE_PRCTL
> > >  > > > > +-# include <sys/prctl.h>
> > >  > > > > ++# include <linux/prctl.h>
> > >  > > > > + #endif
> > >  > > > > + #include <asm/unistd.h>
> > >  > > > > diff --git a/meta/recipes-devtools/strace/strace_4.26.bb
> > >  > > > > b/meta/recipes-devtools/strace/strace_4.26.bb
> > >  > > > > index 24f92c99e5..b71122babf 100644
> > >  > > > > --- a/meta/recipes-devtools/strace/strace_4.26.bb
> > >  > > > > +++ b/meta/recipes-devtools/strace/strace_4.26.bb
> > >  > > > > @@ -15,6 +15,7 @@ SRC_URI = "
> > >  > > > > https://strace.io/files/${PV}/strace-${PV}.tar.xz <
> https://strace.io/files/$%7BPV%7D/strace-$%7BPV%7D.tar.xz> \
> > >  > > > > file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
> > >  > > > > file://0001-tests-sigaction-Check-for-mips-and-
> > >  > > > > alpha-before-usin.patch \
> > >  > > > > file://0001-mips-o32-fix-build.patch \
> > >  > > > > + file://musl-fixes-armv8.patch \
> > >  > > > > "
> > >  > > > > ...
> > >  > > >
> > >  > > > #include <sys/prctl.h> is the documented way for getting the
> > >  > > > prototype
> > >  > > > of prctl(), which cannot be in linux/prctl.h for obvious
> reasons.
> > >  > > >
> > >  > > > This patch creates the following problem:
> > >  > > >
> > >  > > > ../strace-4.26/strace.c: In function 'startup_child':
> > >  > > > ../strace-4.26/strace.c:1355:3: warning: implicit declaration
> of
> > >  > > > function 'prctl' [-Wimplicit-function-declaration]
> > >  > > > prctl(PR_SET_PTRACER, PR_SET_PTRACER_ANY);
> > >  > > > ^~~~~
> > >  > > >
> > >  > >
> > >  > > Ah that's definitely not a solution then. I'll have to look into
> > >  > > this
> > >  > > further and see if I can come up with a v2 patch that doesn't
> > >  > > cause
> > >  > > this warning.
> > >  > >
> > >  >
> > >  > So alpine fixes this by patching the linux headers:
> > >  >
> https://git.alpinelinux.org/aports/tree/main/linux-headers/fix-aarch64-asm-ptrace.patch
> > >  >
> > >  > I think that should be acceptable here if we just do it when
> building
> > >  > with musl libc.
> > >  >
> > >  > Any thoughts on that before I work up a v2 patch?
> > >
> > >  This really needs to get fixed upstream. I don't mind a patch but only
> > >  if its gone upstream, we don't want to be carrying patches to libc-
> > >  headers.
> >
> > I can live with that as well, we have carried them just for musl in the
> > past, but yes, we should at least know that someone is trying to
> > upstream it. I can't get the alpine linux git to come in right now, so
> > I can't check the referenced change to see how it looks.
> >
> > I'm going to do new libc-headers when I get the -dev kernel up and
> > running with the 5.2-rc kernels, so I can watch to see that it
> > continues to apply. I can also do some extra build testing here, if you
> > want the headers change to come through my next pull request.
> >
>
> There's a lot of redefinition between musl and the kernel headers that
> hasn't been reconciled yet (see
> https://www.spinics.net/lists/y2038/msg03836.html for some discussion) so
> I think there's much more to be done upstream than just fixing this one
> instance.
>

Agreed. There's a long, bikeshedding, philosophical debate about musl and
headers that is always ongoing (not this discussion, that is not my
comment). But if this one instance is a small change, I think it is worth
carrying, the amount of musl patches to libc-headers has fluctuated over
time, so this is no different. We can only deal with the problems we are
seeing in our builds (I state the obvious).



>
> I'm now dropping the `#include <linux/prctl.h>` line in
> arch/arm64/include/uapi/asm/ptrace.h (
> https://github.com/torvalds/linux/blob/v5.1/arch/arm64/include/uapi/asm/ptrace.h#L68)
> in linux-libc-headers and that's giving working builds for me but I'm not
> sure how universally it can be applied. I'm happy to carry that as a
> bbappend in our distro layer for now but that will leave strace broke on
> aarch64 when using musl for others.
>
>
I'm still ok with patching it out of the headers, build tests would shake
any issues out, but I can't see there being too many.

Bruce



> Thanks,
>
> --
> Paul Barker
> Managing Director & Principal Engineer
> Beta Five Ltd
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000042fd3c058874f889
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, May 9, 2019 at 10:00 AM Paul Barker &lt;<a =
href=3D"mailto:paul@betafive.co.uk">paul@betafive.co.uk</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 9 May 2019, =
at 14:48, Bruce Ashfield wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Thu, May 9, 2019 at 9:43 AM Richard Purdie <br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; On Thu, 2019-05-09 at 08:08 -0400, Paul Barker wrote:<br>
&gt; &gt;=C2=A0 &gt; On Thu, 9 May 2019, at 11:13, Paul Barker wrote:<br>
&gt; &gt;=C2=A0 &gt; &gt; On Wed, 8 May 2019, at 14:02, Adrian Bunk wrote:<=
br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; On Wed, May 08, 2019 at 11:58:36AM +0000, <a=
 href=3D"mailto:paul@betafive.co.uk" target=3D"_blank">paul@betafive.co.uk<=
/a><br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; wrote:<br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; &gt; ...<br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; &gt; +--- strace-4.26.orig/strace.c<br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; &gt; ++++ strace-4.26/strace.c<br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; &gt; +@@ -26,7 +26,7 @@<br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; &gt; + #include &lt;locale.h&gt;<br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; &gt; + #include &lt;sys/utsname.h&gt;<br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; &gt; + #ifdef HAVE_PRCTL<br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; &gt; +-# include &lt;sys/prctl.h&gt;<br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; &gt; ++# include &lt;linux/prctl.h&gt;<br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; &gt; + #endif<br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; &gt; + #include &lt;asm/unistd.h&gt;<br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; &gt; diff --git a/meta/recipes-devtools/stra=
ce/<a href=3D"http://strace_4.26.bb" rel=3D"noreferrer" target=3D"_blank">s=
trace_4.26.bb</a><br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; &gt; b/meta/recipes-devtools/strace/<a href=
=3D"http://strace_4.26.bb" rel=3D"noreferrer" target=3D"_blank">strace_4.26=
.bb</a><br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; &gt; index 24f92c99e5..b71122babf 100644<br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; &gt; --- a/meta/recipes-devtools/strace/<a h=
ref=3D"http://strace_4.26.bb" rel=3D"noreferrer" target=3D"_blank">strace_4=
.26.bb</a><br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; &gt; +++ b/meta/recipes-devtools/strace/<a h=
ref=3D"http://strace_4.26.bb" rel=3D"noreferrer" target=3D"_blank">strace_4=
.26.bb</a><br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; &gt; @@ -15,6 +15,7 @@ SRC_URI =3D &quot;<br=
>
&gt; &gt;=C2=A0 &gt; &gt; &gt; &gt; <a href=3D"https://strace.io/files/$%7B=
PV%7D/strace-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https:/=
/strace.io/files/${PV}/strace-${PV}.tar.xz</a> &lt;<a href=3D"https://strac=
e.io/files/$%7BPV%7D/strace-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"=
_blank">https://strace.io/files/$%7BPV%7D/strace-$%7BPV%7D.tar.xz</a>&gt; \=
<br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; &gt; file://0001-caps-abbrev.awk-fix-gawk-s-=
path.patch \<br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; &gt; file://0001-tests-sigaction-Check-for-m=
ips-and-<br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; &gt; alpha-before-usin.patch \<br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; &gt; file://0001-mips-o32-fix-build.patch \<=
br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; &gt; + file://musl-fixes-armv8.patch \<br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; &gt; &quot;<br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; &gt; ...<br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; <br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; #include &lt;sys/prctl.h&gt; is the document=
ed way for getting the<br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; prototype <br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; of prctl(), which cannot be in linux/prctl.h=
 for obvious reasons.<br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; <br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; This patch creates the following problem:<br=
>
&gt; &gt;=C2=A0 &gt; &gt; &gt; <br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; ../strace-4.26/strace.c: In function &#39;st=
artup_child&#39;:<br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; ../strace-4.26/strace.c:1355:3: warning: imp=
licit declaration of <br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; function &#39;prctl&#39; [-Wimplicit-functio=
n-declaration]<br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; prctl(PR_SET_PTRACER, PR_SET_PTRACER_ANY);<b=
r>
&gt; &gt;=C2=A0 &gt; &gt; &gt; ^~~~~<br>
&gt; &gt;=C2=A0 &gt; &gt; &gt; <br>
&gt; &gt;=C2=A0 &gt; &gt; <br>
&gt; &gt;=C2=A0 &gt; &gt; Ah that&#39;s definitely not a solution then. I&#=
39;ll have to look into<br>
&gt; &gt;=C2=A0 &gt; &gt; this <br>
&gt; &gt;=C2=A0 &gt; &gt; further and see if I can come up with a v2 patch =
that doesn&#39;t<br>
&gt; &gt;=C2=A0 &gt; &gt; cause <br>
&gt; &gt;=C2=A0 &gt; &gt; this warning.<br>
&gt; &gt;=C2=A0 &gt; &gt; <br>
&gt; &gt;=C2=A0 &gt; <br>
&gt; &gt;=C2=A0 &gt; So alpine fixes this by patching the linux headers: <b=
r>
&gt; &gt;=C2=A0 &gt; <a href=3D"https://git.alpinelinux.org/aports/tree/mai=
n/linux-headers/fix-aarch64-asm-ptrace.patch" rel=3D"noreferrer" target=3D"=
_blank">https://git.alpinelinux.org/aports/tree/main/linux-headers/fix-aarc=
h64-asm-ptrace.patch</a><br>
&gt; &gt;=C2=A0 &gt; <br>
&gt; &gt;=C2=A0 &gt; I think that should be acceptable here if we just do i=
t when building<br>
&gt; &gt;=C2=A0 &gt; with musl libc.<br>
&gt; &gt;=C2=A0 &gt; <br>
&gt; &gt;=C2=A0 &gt; Any thoughts on that before I work up a v2 patch?<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 This really needs to get fixed upstream. I don&#39;t mind a=
 patch but only<br>
&gt; &gt;=C2=A0 if its gone upstream, we don&#39;t want to be carrying patc=
hes to libc-<br>
&gt; &gt;=C2=A0 headers.<br>
&gt; <br>
&gt; I can live with that as well, we have carried them just for musl in th=
e <br>
&gt; past, but yes, we should at least know that someone is trying to <br>
&gt; upstream it. I can&#39;t get the alpine linux git to come in right now=
, so <br>
&gt; I can&#39;t check the referenced change to see how it looks.<br>
&gt; <br>
&gt; I&#39;m going to do new libc-headers when I get the -dev kernel up and=
 <br>
&gt; running with the 5.2-rc kernels, so I can watch to see that it <br>
&gt; continues to apply. I can also do some extra build testing here, if yo=
u <br>
&gt; want the headers change to come through my next pull request.<br>
&gt; <br>
<br>
There&#39;s a lot of redefinition between musl and the kernel headers that =
hasn&#39;t been reconciled yet (see <a href=3D"https://www.spinics.net/list=
s/y2038/msg03836.html" rel=3D"noreferrer" target=3D"_blank">https://www.spi=
nics.net/lists/y2038/msg03836.html</a> for some discussion) so I think ther=
e&#39;s much more to be done upstream than just fixing this one instance.<b=
r></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">Agreed. There&#39;s a long, bikeshedding, philosophical deba=
te about musl and headers that is always ongoing (not this discussion, that=
 is not my comment). But if this one instance is a small change, I think it=
 is worth carrying, the amount of musl patches to libc-headers has fluctuat=
ed over time, so this is no different. We can only deal with the problems w=
e are seeing in our builds (I state the obvious).</div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I&#39;m now dropping the `#include &lt;linux/prctl.h&gt;` line in arch/arm6=
4/include/uapi/asm/ptrace.h (<a href=3D"https://github.com/torvalds/linux/b=
lob/v5.1/arch/arm64/include/uapi/asm/ptrace.h#L68" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/torvalds/linux/blob/v5.1/arch/arm64/include=
/uapi/asm/ptrace.h#L68</a>) in linux-libc-headers and that&#39;s giving wor=
king builds for me but I&#39;m not sure how universally it can be applied. =
I&#39;m happy to carry that as a bbappend in our distro layer for now but t=
hat will leave strace broke on aarch64 when using musl for others.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">I&#39;m still ok with patching it out of the headers, buil=
d tests would shake any issues out, but I can&#39;t see there being too man=
y.=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Thanks,<br>
<br>
-- <br>
Paul Barker<br>
Managing Director &amp; Principal Engineer<br>
Beta Five Ltd<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--00000000000042fd3c058874f889--
