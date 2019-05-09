Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8C3767D6A8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 13:48:53 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id d15so2073803ljc.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2019 06:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+17BKet/iUpDxo0cDpUrjWDeGQ64dyy4Wl94UdflGUw=;
	b=qHGaCvaJZNmEhLJkKA+VI1DGylY8dNWpBsKLZR4gPmrYhBgfUPH9KTfUeP8hMDvvVj
	LUEBEvXYPB/sWwz2gX1aehtfD41xZk9VJMWcDpDYGpjy7ydMxHm8KDvLifop7MSeMtQY
	E6J4rh4R63D5Mg1Nw/gs6SQ9TibsJ7762/My8MCkY/uoYFAtrwTA2b/w0IRTVP4HK6LQ
	xiJJOAnnpRuL1DgS1uRXbY8C00EvVNCqNJo+RwBIUbWo6ycupqkqzXkGUJtkh1bTs7Hg
	a1m0DNoQkHNSy9YY+kO95YJjLvVGKqHu7fugdv+WtEUscq4AzJBy2EPQTSwbYSea23Ox
	VtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+17BKet/iUpDxo0cDpUrjWDeGQ64dyy4Wl94UdflGUw=;
	b=CVn3WDsxVAOVeGEQtnU9jI41CYwPJ6PwnDEdsHo5SHq/oj4lnMfii2cjhY9ORxj4TB
	hjkllZ0Hsv1XUGpRbYdDmbOMEUyr8EWu295xM1dSxWtR+80gm/8BhUWmK2tKqcWYKCz5
	LNeOcsT7NGVFCe7P8d5CmOO0AMOqMP5YwrLbD6gDRFzbpTI73q/5C4CvwI39DYQPepZb
	Q9Sh2FKSkYERIZaZo11yuV1EguieUg37pSUx+o/5lJm6/+v2CPkqcryZWYDUaEpujlbq
	bhvRVvCF94rF6oXd399Rlmo/705jq/OrNS+vH5IOuwb5/mQReLHSMIAkSN9co2kOCkfC
	vbMQ==
X-Gm-Message-State: APjAAAVfuNFqDC3NmOGGjTrtOS1ChwphHLeDFS3bbNRPL5IvrMctKr2W
	mwnFZQcSDzNzrxwXf0EB7CJCxXXUjz6E3fox5uM=
X-Google-Smtp-Source: APXvYqxz9mZtom3D77d5bJGDUc05NFPLvIEzP4fd7DcuAUkVQHcZS62RqMrVWbMqqk4sNvhjnfmhTHZW9x6mqvKFlBI=
X-Received: by 2002:a2e:321a:: with SMTP id y26mr2604809ljy.109.1557409733612; 
	Thu, 09 May 2019 06:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190508115836.15758-1-paul@betafive.co.uk>
	<20190508115836.15758-3-paul@betafive.co.uk>
	<20190508130249.GA25917@localhost>
	<7a1b1694-9c7c-40eb-a998-343879c0283d@www.fastmail.com>
	<ba43a2fb-4c12-4b35-bb40-b58ccf18ad83@www.fastmail.com>
	<74876e92becd2c2b04831dc4776faabd87fc53c9.camel@linuxfoundation.org>
In-Reply-To: <74876e92becd2c2b04831dc4776faabd87fc53c9.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 9 May 2019 09:48:42 -0400
Message-ID: <CADkTA4O16TV+7Dj11c9MwjRGQWXSAto+L6Y3xbn4hu3U2D1NKA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Thu, 09 May 2019 13:48:53 -0000
Content-Type: multipart/alternative; boundary="000000000000f11ac1058874b520"

--000000000000f11ac1058874b520
Content-Type: text/plain; charset="UTF-8"

On Thu, May 9, 2019 at 9:43 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2019-05-09 at 08:08 -0400, Paul Barker wrote:
> > On Thu, 9 May 2019, at 11:13, Paul Barker wrote:
> > > On Wed, 8 May 2019, at 14:02, Adrian Bunk wrote:
> > > > On Wed, May 08, 2019 at 11:58:36AM +0000, paul@betafive.co.uk
> > > > wrote:
> > > > > ...
> > > > > +--- strace-4.26.orig/strace.c
> > > > > ++++ strace-4.26/strace.c
> > > > > +@@ -26,7 +26,7 @@
> > > > > + #include <locale.h>
> > > > > + #include <sys/utsname.h>
> > > > > + #ifdef HAVE_PRCTL
> > > > > +-# include <sys/prctl.h>
> > > > > ++# include <linux/prctl.h>
> > > > > + #endif
> > > > > + #include <asm/unistd.h>
> > > > > diff --git a/meta/recipes-devtools/strace/strace_4.26.bb
> > > > > b/meta/recipes-devtools/strace/strace_4.26.bb
> > > > > index 24f92c99e5..b71122babf 100644
> > > > > --- a/meta/recipes-devtools/strace/strace_4.26.bb
> > > > > +++ b/meta/recipes-devtools/strace/strace_4.26.bb
> > > > > @@ -15,6 +15,7 @@ SRC_URI = "
> > > > > https://strace.io/files/${PV}/strace-${PV}.tar.xz \
> > > > >             file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
> > > > >             file://0001-tests-sigaction-Check-for-mips-and-
> > > > > alpha-before-usin.patch \
> > > > >             file://0001-mips-o32-fix-build.patch \
> > > > > +           file://musl-fixes-armv8.patch \
> > > > >             "
> > > > > ...
> > > >
> > > > #include <sys/prctl.h> is the documented way for getting the
> > > > prototype
> > > > of prctl(), which cannot be in linux/prctl.h for obvious reasons.
> > > >
> > > > This patch creates the following problem:
> > > >
> > > > ../strace-4.26/strace.c: In function 'startup_child':
> > > > ../strace-4.26/strace.c:1355:3: warning: implicit declaration of
> > > > function 'prctl' [-Wimplicit-function-declaration]
> > > >    prctl(PR_SET_PTRACER, PR_SET_PTRACER_ANY);
> > > >    ^~~~~
> > > >
> > >
> > > Ah that's definitely not a solution then. I'll have to look into
> > > this
> > > further and see if I can come up with a v2 patch that doesn't
> > > cause
> > > this warning.
> > >
> >
> > So alpine fixes this by patching the linux headers:
> >
> https://git.alpinelinux.org/aports/tree/main/linux-headers/fix-aarch64-asm-ptrace.patch
> >
> > I think that should be acceptable here if we just do it when building
> > with musl libc.
> >
> > Any thoughts on that before I work up a v2 patch?
>
> This really needs to get fixed upstream. I don't mind a patch but only
> if its gone upstream, we don't want to be carrying patches to libc-
> headers.
>

I can live with that as well, we have carried them just for musl in the
past, but yes, we should at least know that someone is trying to upstream
it. I can't get the alpine linux git to come in right now, so I can't check
the referenced change to see how it looks.

I'm going to do new libc-headers when I get the -dev kernel up and running
with the 5.2-rc kernels, so I can watch to see that it continues to apply.
I can also do some extra build testing here, if you want the headers change
to come through my next pull request.

Bruce



>
> Cheers,
>
> Richard
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000f11ac1058874b520
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, May 9, 2019 at 9:43 AM Richard Purdie &lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">rich=
ard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">On Thu, 2019-05-09 at 08:08 -0400, Paul Barke=
r wrote:<br>
&gt; On Thu, 9 May 2019, at 11:13, Paul Barker wrote:<br>
&gt; &gt; On Wed, 8 May 2019, at 14:02, Adrian Bunk wrote:<br>
&gt; &gt; &gt; On Wed, May 08, 2019 at 11:58:36AM +0000, <a href=3D"mailto:=
paul@betafive.co.uk" target=3D"_blank">paul@betafive.co.uk</a><br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; ...<br>
&gt; &gt; &gt; &gt; +--- strace-4.26.orig/strace.c<br>
&gt; &gt; &gt; &gt; ++++ strace-4.26/strace.c<br>
&gt; &gt; &gt; &gt; +@@ -26,7 +26,7 @@<br>
&gt; &gt; &gt; &gt; + #include &lt;locale.h&gt;<br>
&gt; &gt; &gt; &gt; + #include &lt;sys/utsname.h&gt;<br>
&gt; &gt; &gt; &gt; + #ifdef HAVE_PRCTL<br>
&gt; &gt; &gt; &gt; +-# include &lt;sys/prctl.h&gt;<br>
&gt; &gt; &gt; &gt; ++# include &lt;linux/prctl.h&gt;<br>
&gt; &gt; &gt; &gt; + #endif<br>
&gt; &gt; &gt; &gt; + #include &lt;asm/unistd.h&gt;<br>
&gt; &gt; &gt; &gt; diff --git a/meta/recipes-devtools/strace/<a href=3D"ht=
tp://strace_4.26.bb" rel=3D"noreferrer" target=3D"_blank">strace_4.26.bb</a=
><br>
&gt; &gt; &gt; &gt; b/meta/recipes-devtools/strace/<a href=3D"http://strace=
_4.26.bb" rel=3D"noreferrer" target=3D"_blank">strace_4.26.bb</a><br>
&gt; &gt; &gt; &gt; index 24f92c99e5..b71122babf 100644<br>
&gt; &gt; &gt; &gt; --- a/meta/recipes-devtools/strace/<a href=3D"http://st=
race_4.26.bb" rel=3D"noreferrer" target=3D"_blank">strace_4.26.bb</a><br>
&gt; &gt; &gt; &gt; +++ b/meta/recipes-devtools/strace/<a href=3D"http://st=
race_4.26.bb" rel=3D"noreferrer" target=3D"_blank">strace_4.26.bb</a><br>
&gt; &gt; &gt; &gt; @@ -15,6 +15,7 @@ SRC_URI =3D &quot;<br>
&gt; &gt; &gt; &gt; <a href=3D"https://strace.io/files/$%7BPV%7D/strace-$%7=
BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://strace.io/files=
/${PV}/strace-${PV}.tar.xz</a> \<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0=
001-caps-abbrev.awk-fix-gawk-s-path.patch \<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0=
001-tests-sigaction-Check-for-mips-and-<br>
&gt; &gt; &gt; &gt; alpha-before-usin.patch \<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0=
001-mips-o32-fix-build.patch \<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://musl-f=
ixes-armv8.patch \<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<b=
r>
&gt; &gt; &gt; &gt; ...<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; #include &lt;sys/prctl.h&gt; is the documented way for getti=
ng the<br>
&gt; &gt; &gt; prototype <br>
&gt; &gt; &gt; of prctl(), which cannot be in linux/prctl.h for obvious rea=
sons.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; This patch creates the following problem:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; ../strace-4.26/strace.c: In function &#39;startup_child&#39;=
:<br>
&gt; &gt; &gt; ../strace-4.26/strace.c:1355:3: warning: implicit declaratio=
n of <br>
&gt; &gt; &gt; function &#39;prctl&#39; [-Wimplicit-function-declaration]<b=
r>
&gt; &gt; &gt;=C2=A0 =C2=A0 prctl(PR_SET_PTRACER, PR_SET_PTRACER_ANY);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 ^~~~~<br>
&gt; &gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; Ah that&#39;s definitely not a solution then. I&#39;ll have to lo=
ok into<br>
&gt; &gt; this <br>
&gt; &gt; further and see if I can come up with a v2 patch that doesn&#39;t=
<br>
&gt; &gt; cause <br>
&gt; &gt; this warning.<br>
&gt; &gt; <br>
&gt; <br>
&gt; So alpine fixes this by patching the linux headers: <br>
&gt; <a href=3D"https://git.alpinelinux.org/aports/tree/main/linux-headers/=
fix-aarch64-asm-ptrace.patch" rel=3D"noreferrer" target=3D"_blank">https://=
git.alpinelinux.org/aports/tree/main/linux-headers/fix-aarch64-asm-ptrace.p=
atch</a><br>
&gt; <br>
&gt; I think that should be acceptable here if we just do it when building<=
br>
&gt; with musl libc.<br>
&gt; <br>
&gt; Any thoughts on that before I work up a v2 patch?<br>
<br>
This really needs to get fixed upstream. I don&#39;t mind a patch but only<=
br>
if its gone upstream, we don&#39;t want to be carrying patches to libc-<br>
headers.<br></blockquote><div><br></div><div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">I can live with that as well, we have carried them=
 just for musl in the past, but yes, we should at least know that someone i=
s trying to upstream it. I can&#39;t get the alpine linux git to come in ri=
ght now, so I can&#39;t check the referenced change to see how it looks.</d=
iv><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">I&#39;m going to do new lib=
c-headers when I get the -dev kernel up and running with the 5.2-rc kernels=
, so I can watch to see that it continues to apply. I can also do some extr=
a build testing here, if you want the headers change to come through my nex=
t pull request.</div><div class=3D"gmail_default" style=3D"font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</di=
v><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"m_-3733819215945982634gmail_signature">- Thou shalt not follow th=
e NULL pointer, for chaos and madness await thee at its end<br>- &quot;Use =
the force Harry&quot; - Gandalf, Star Trek II<br><br></div></div>

--000000000000f11ac1058874b520--
