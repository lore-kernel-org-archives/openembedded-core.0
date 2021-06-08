Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.1576.1623170480236051207
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jun 2021 09:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QcbRQXsr;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: krussell7711@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 36-20020a9d0ba70000b02902e0a0a8fe36so20931911oth.8
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jun 2021 09:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wRF6LYwRPQwIqqgSYwviEbZrDuV64jNvvif0oeN1lPM=;
        b=QcbRQXsrB+0E3d95jlhQL+P+W0bk3RhAwx9CKRwQXjMZqqlo26+FiySDL5su8C+a0T
         RhdGFwM+x6Z41UrYjgaa8ZYXwICyza3BA3ryY730RCLprdjnzDopT7QuOq6TqxV5pwHG
         5Y9smQ8dzd+aLnl1Pz59nB02G+h4fKBrRyRxDLiQWqSnnOjaRhomNyTA6qvDwTNmdUyA
         xT8TWCPWl7sRG4FPvQ7yBoaeUi3Ej0sYDAPCmow1zdkSgOmkVRvoIvoSWObztZehiPet
         DnrOf4lvjTaUk9c/a1mHgFGA3Q/KSIeOwM6aNyx9pQtXHXok7JhixLqXTeZ6L54jCuMI
         DCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wRF6LYwRPQwIqqgSYwviEbZrDuV64jNvvif0oeN1lPM=;
        b=nyk5ZtWLNQyOcp0wgsurvQkYqHJS47jmzjRNl1VvwX7yMnJOP6kgnR65sit9uX0dfG
         ZpLlptDM8SVCYPTJ76/0txSzOkksQlYoHCEr6cMrVGifOFCZqRnPXJRgsR3UGVIDcGsp
         E7QCXwMBdshLuO05gICtoXMrMzdQlN6c54Pwwq4l0Ejt7zTn6p5kSTXW5Q6PsgpgZxAU
         0mTmj+t3HwOe9qPxo4ViUce6qfUAE4FjvARV3vC4Jxj9uRCcuhuOtCLpxoqs4QxE3U+o
         o9nkK+ueA+BgdM+kY71anyaEKMVzMtxFTl1JbTxK4TBbrXmV4o+LD9mPpmB7nn4PZKUE
         26PQ==
X-Gm-Message-State: AOAM530329UAInvw4MUSSLqtCSc0W9NzFAQwTbGbNawIfEClGzQKJH5R
	ZOAjODSE24644fy9OUa/yPDKrOIxWn2AwMaWQsg=
X-Google-Smtp-Source: ABdhPJyIT32S7vtFC16n46sJcT1GiXN1UCaHACNDDgKB36agAhtccdeUs2BUBEprDrgZfQLk661LxLMBrFZRJH0rH1Q=
X-Received: by 2002:a9d:4105:: with SMTP id o5mr18737777ote.20.1623170479464;
 Tue, 08 Jun 2021 09:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210607212558.86624-1-bkylerussell@gmail.com>
 <dccbc4111daf453cec3f7fe60e4da15d1c3e5306.camel@linuxfoundation.org>
 <CAFrQVPPHw0BpXUOXrhnYOeZHRBd=w=kEthVqbAVucRTyeiz7Fg@mail.gmail.com> <038c3cc612569f32f6b837ca389abad930fd76e5.camel@linuxfoundation.org>
In-Reply-To: <038c3cc612569f32f6b837ca389abad930fd76e5.camel@linuxfoundation.org>
From: bkylerussell@gmail.com
Date: Tue, 8 Jun 2021 12:41:07 -0400
Message-ID: <CAFrQVPMBdhnOMEg+xa5gXrOnutdwiGjid09urwKstx+kQZK6-g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lib: oe: utils: always append host gcc version to NATIVELSBSTRING
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Wes Lindauer <wesley.lindauer@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d6a5ef05c443d339"

--000000000000d6a5ef05c443d339
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 8, 2021 at 7:16 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> > > There were specific issues with gcc 4.8 and 4.9 which required
> separate sstate. Do we
> > > know which gcc version switched the default and can we force older
> gcc's to use the
> > > same default or does it not work? I'm wondering if we could split off
> a "nopic" verison
> > > of sstate for example for the older gccs?
> > >
> > gcc 6 introduced an --enable-default-pie configure option, but I'm not
> exactly sure where
> > between Ubuntu 16.04 and Ubuntu 18.04 they picked that configure option
> up.  Since packages
> > based on the older gcc already exist in sstate, I think we would have to
> force the newer
> > behavior on each affected package.
> >
> > I realize we can just swizzle the compiler flags on the affected
> packages to make things happy,
> > but it seemed like this approach had at least been considered before, so
> I thought I would at least
> > get some feedback.
>
> As Andrea points out, we did fix this with a global include file which
> should have
> handled the issue. Are you using a release which doesn't have that or not
> using
> the include through your own custom distro?
>

Yes indeed, nice find.  bitbake -e confirms I'm including
uninative-flags.inc.  I do think this is exactly the
same issue, but there's a different set of dependencies involved in my
chain.  As someone suggested earlier,
I can force -fPIE on the packages where this is a problem, so I could of
course do something similar for those
packages.

But I still feel like there's an underlying uninative limitation that's not
being addressed, or highlighted.  For example,
the SSTATE_MIRRORS documentation seems to imply that differentiating
between uninative based on native gcc
version is the normal/correct behavior, even though it's clear to me now
that the example was chosen specifically
for the 4.8/4.9 issue, not just the general case.

"When pointing to sstate build artifacts on another machine that uses a
different GCC version for native builds,
you must configure SSTATE_MIRROR with a regular expression that maps local
search paths to server paths.
The paths need to take into account NATIVELSBSTRING set by the uninative
class."
 -
https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#var-SSTATE_MIRRORS

But I suppose even similar versions of gcc across different supported
distros could be configured differently.
For example, warrior claims support for Ubuntu 16.04, 18.04, and Fedora 28,
but only Ubuntu 18.04 seems to
use --enable-default-pie based on gcc -v.  (Even newer Fedoras seem to not
use this flag.)

I guess we could have a "nopic" split like you suggested.  Or maybe
uninative itself should be hashed against
the native gcc configure args and version, since version by itself also
doesn't seem to be sufficient based on the
Fedora example above.  Neither one of those sounds particularly appealing
the more I think about it, so maybe
I'll just opt for fixing the packages like we've done for binutils-native.

--000000000000d6a5ef05c443d339
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, Jun 8, 2021 at 7:16 AM Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; &gt; There were specific issues with gcc 4.8 and 4.9 which required se=
parate sstate. Do we<br>
&gt; &gt; know which gcc version switched the default and can we force olde=
r gcc&#39;s to use the <br>
&gt; &gt; same default or does it not work? I&#39;m wondering if we could s=
plit off a &quot;nopic&quot; verison<br>
&gt; &gt; of sstate for example for the older gccs?<br>
&gt; &gt; <br>
&gt; gcc 6 introduced an --enable-default-pie configure option, but I&#39;m=
 not exactly sure where<br>
&gt; between Ubuntu 16.04 and Ubuntu 18.04 they picked that configure optio=
n up.=C2=A0 Since packages<br>
&gt; based on the older gcc already exist in sstate, I think we would have =
to force the newer<br>
&gt; behavior on each affected package.<br>
&gt; <br>
&gt; I realize we can just swizzle the compiler flags on the affected packa=
ges to make things happy,<br>
&gt; but it seemed like this approach had at least been considered before, =
so I thought I would at least<br>
&gt; get some feedback.<br>
<br>
As Andrea points out, we did fix this with a global include file which shou=
ld have<br>
handled the issue. Are you using a release which doesn&#39;t have that or n=
ot using<br>
the include through your own custom distro?<br></blockquote><div><br></div>=
<div>Yes indeed, nice find.=C2=A0 bitbake -e confirms I&#39;m including uni=
native-flags.inc.=C2=A0 I do think this is exactly the</div><div>same issue=
, but there&#39;s a different set of dependencies involved in my chain.=C2=
=A0 As someone suggested earlier,</div><div>I can force -fPIE on the packag=
es where this is a problem, so I could of course do something similar for t=
hose</div><div>packages.<br></div><div><br></div><div>But I still feel like=
 there&#39;s an underlying uninative limitation that&#39;s not being addres=
sed, or highlighted.=C2=A0 For example, <br></div><div>the SSTATE_MIRRORS d=
ocumentation seems to imply that differentiating between uninative based on=
 native gcc</div><div>version is the normal/correct behavior, even though i=
t&#39;s clear to me now that the example was chosen specifically</div><div>=
for the 4.8/4.9 issue, not just the general case.</div><div><br></div><div>=
&quot;When pointing to sstate build artifacts on another machine
                    that uses a different GCC version for native builds,</d=
iv><div>you must configure <code class=3D"gmail-filename">SSTATE_MIRROR</co=
de>
                    with a regular expression that maps local search paths
                    to server paths.</div><div>The paths need to take into =
account
                    <code class=3D"gmail-filename">NATIVELSBSTRING</code>
                    set by the
                    <code class=3D"gmail-filename">uninative</code>
                    class.&quot;</div><div>=C2=A0- <a href=3D"https://www.y=
octoproject.org/docs/current/mega-manual/mega-manual.html#var-SSTATE_MIRROR=
S">https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#v=
ar-SSTATE_MIRRORS</a></div><div><br></div>But I suppose even similar versio=
ns of gcc across different supported distros could be configured differentl=
y.</div><div class=3D"gmail_quote">For example, warrior claims support for =
Ubuntu 16.04, 18.04, and Fedora 28, but only Ubuntu 18.04 seems to</div><di=
v class=3D"gmail_quote">use --enable-default-pie based on gcc -v.=C2=A0 (Ev=
en newer Fedoras seem to not use this flag.)</div><div class=3D"gmail_quote=
"><br></div><div class=3D"gmail_quote">I guess we could have a &quot;nopic&=
quot; split like you suggested.=C2=A0 Or maybe uninative itself should be h=
ashed against</div><div class=3D"gmail_quote">the native gcc configure args=
 and version, since version by itself also doesn&#39;t seem to be sufficien=
t based on the</div><div class=3D"gmail_quote">Fedora example above.=C2=A0 =
Neither one of those sounds particularly appealing the more I think about i=
t, so maybe</div><div class=3D"gmail_quote">I&#39;ll just opt for fixing th=
e packages like we&#39;ve done for binutils-native.<br></div></div>

--000000000000d6a5ef05c443d339--
