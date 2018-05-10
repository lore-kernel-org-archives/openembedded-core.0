Return-Path: <kergoth@gmail.com>
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
	[74.125.82.196])
	by mail.openembedded.org (Postfix) with ESMTP id E14DC74845
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 17:57:40 +0000 (UTC)
Received: by mail-ot0-f196.google.com with SMTP id n1-v6so3284363otf.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 10:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=do8XZ45P1UPXx19m3QPsYKL7KxDM5u691f+gQ1vV3/E=;
	b=HRstxqcfVNuzIniV3slr+lApsSKhamrA6Y1Om8WLWJz2YXwL4MW3cNmy0nZlWV0aRX
	AYI1oFCQ/dSopX+noXq/XoORQtQmpxmqLn6mF36W0bqU0g5/z6nmxmOjqRPyNCqUsNso
	bOP1fhT1BHaxpIxy93bAlakHm2rnV+cNT22YwGsFtrsCDMj5THjbJU9kw4Lh2OIzeNRd
	COPb/hcCZFb8U9bc9cxfJ/4HB8VNfZddIJD+I3sxO0fuzJ7cxYe6sGkJmgkamidsjNpe
	B66NK5QfFdFW9zkfmYiX4+gZpNvLUf/GAwBXYZdXLAxs2ASVrcHm7etVwIUp9dRa6c32
	offQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=do8XZ45P1UPXx19m3QPsYKL7KxDM5u691f+gQ1vV3/E=;
	b=PSC5UdHHZks+eiC/ZRFHCDmKzsXd7KXGADRmJBSeNz5JTz6xgjmBSer0NV7EyhkM3T
	A64aMmGTBxasl0Bzqf4gfZkyGQFAC5OHZoOxtiFeJmpiocLOJRknP1w/n6ItsEoWRqOO
	gWJB16JpaYjG5ViwgLAE4UDsjluj5LwiDxib+Pkr05k7nYdk+f5AGOnLfjYpZO1Kp2X6
	EZxF62X4xG63QRTbDAB3RnUGurIYOt2vyDGDfcJr+Ca5QmcR1jbnQ37XNBijMJ8WcKdl
	4U8dEwtx8gwZZZvvSlZeR+DyZa+ZJ7+j1SQsm322Z2xSb6A6lBns/qN6L538BKEQopcw
	nhUw==
X-Gm-Message-State: ALKqPwcfnHeN14mF+oMwErbM0cpHrIPj++FY0puxJGDuvibFyEvaIWBV
	Y61hSiHne0sigOQqu017ZaR0nL9/tmpKJmfjujY=
X-Google-Smtp-Source: AB8JxZon7nUkiwECdVhPKTTPNf5mQXQz/mQ9fRWC5JMqP0p2ywaOKZr4eu5Tfo45wrEqsTJXoy8TlzV5L4SfIzOtgXs=
X-Received: by 2002:a9d:2a68:: with SMTP id
	t95-v6mr1700983ota.320.1525975061501; 
	Thu, 10 May 2018 10:57:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.91.17 with HTTP; Thu, 10 May 2018 10:57:21 -0700 (PDT)
In-Reply-To: <CACS+7ZSs9fdafLw8kBAytWXmgTV6jpbcFgf4jhwZk5_DwOpN3A@mail.gmail.com>
References: <1525922097-15292-1-git-send-email-armccurdy@gmail.com>
	<1525922097-15292-3-git-send-email-armccurdy@gmail.com>
	<86e5dada-7bd6-5cbb-95ff-0bf9ccdf0e1e@gmail.com>
	<CACS+7ZSzjg6f3jpEk+BHAs7XbmUGiPZN_P4HYcnNWvmvjKpYQw@mail.gmail.com>
	<CAJTo0LYyJ_=Tr1XTB8rW5O9-oQf7oNaguoaMq7y2cSC9Upcw1Q@mail.gmail.com>
	<CACS+7ZSs9fdafLw8kBAytWXmgTV6jpbcFgf4jhwZk5_DwOpN3A@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Thu, 10 May 2018 10:57:21 -0700
Message-ID: <CABcZAN=ta+fptEvqfLb73FXFkHri42xWY5U6GEt5m3rDFAexuw@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] bitbake.conf: drop _build-${BUILD_OS} over-ride
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
X-List-Received-Date: Thu, 10 May 2018 17:57:41 -0000
Content-Type: multipart/alternative; boundary="0000000000007a1f6b056bddc12d"

--0000000000007a1f6b056bddc12d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Even if bitbake could run on WSL, it=E2=80=99d be horribly slow. I/O on WSL=
 is
*terrible* right now, docker or a VM wipes the floor with it. I=E2=80=99m s=
ure
it=E2=80=99ll be viable eventually, though :)

On Thu, May 10, 2018 at 10:09 AM, Dan McGregor <danismostlikely@gmail.com>
wrote:

> On 10 May 2018 at 10:33, Burton, Ross <ross.burton@intel.com> wrote:
> > On 10 May 2018 at 16:47, Dan McGregor <danismostlikely@gmail.com> wrote=
:
> >> I'm with Khem. meta-darwin and meta-mingw are things, even if they
> >> haven't been updated in years. If interest arises they shouldn't have
> >> too many barriers to starting development again. I've also started to
> >> attempt to build on a FreeBSD host.
> >
> > meta-mingw builds Windows binaries from Linux and meta-darwin builds
> > Darwin binaries from Linux, so they're not relevant.
>
> Neat, I only took a quick look; I guess I misinterpreted their purposes.
>
> >
> > People *are* at least trying to use Windows Subsystem for Linux to
> > build Yocto on Windows, but I suspect as far as bitbake is concerned
> > that is Linux.  There's no practical way we can build on macOS right
> > now due to the recent security changes.
>
> When I tried, early in the WSL testing, bitbake wouldn't start due to
> some missing syscalls. inotify related, IIRC.
>
> >
> > Builds on BSD would be interesting, I'm curious as to how much breaks
> > from GNU userland expectations and whether the build override is
> > actually useful.
>
> The problem I'm running into right now is pseudo. FreeBSD uses a
> different API for extended attributes, so all the various xattr_...
> things don't work. I might need to make it depend on a port of the
> xattr wrappers.
>
> Outside of that, I've been using a FreeBSD hosted cross toolchain for
> embedded Linux for years. It works well on its own. Hopefully the
> build-* overrides will be helpful for the small differences I've
> noticed.
>
> >
> > Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--0000000000007a1f6b056bddc12d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Even if bitbake could run on WSL, it=E2=80=99d be horribly=
 slow. I/O on WSL is *terrible* right now, docker or a VM wipes the floor w=
ith it. I=E2=80=99m sure it=E2=80=99ll be viable eventually, though :)</div=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, May 10, =
2018 at 10:09 AM, Dan McGregor <span dir=3D"ltr">&lt;<a href=3D"mailto:dani=
smostlikely@gmail.com" target=3D"_blank">danismostlikely@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 10 May =
2018 at 10:33, Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ro=
ss.burton@intel.com</a>&gt; wrote:<br>
&gt; On 10 May 2018 at 16:47, Dan McGregor &lt;<a href=3D"mailto:danismostl=
ikely@gmail.com">danismostlikely@gmail.com</a>&gt; wrote:<br>
&gt;&gt; I&#39;m with Khem. meta-darwin and meta-mingw are things, even if =
they<br>
&gt;&gt; haven&#39;t been updated in years. If interest arises they shouldn=
&#39;t have<br>
&gt;&gt; too many barriers to starting development again. I&#39;ve also sta=
rted to<br>
&gt;&gt; attempt to build on a FreeBSD host.<br>
&gt;<br>
&gt; meta-mingw builds Windows binaries from Linux and meta-darwin builds<b=
r>
&gt; Darwin binaries from Linux, so they&#39;re not relevant.<br>
<br>
</span>Neat, I only took a quick look; I guess I misinterpreted their purpo=
ses.<br>
<span class=3D""><br>
&gt;<br>
&gt; People *are* at least trying to use Windows Subsystem for Linux to<br>
&gt; build Yocto on Windows, but I suspect as far as bitbake is concerned<b=
r>
&gt; that is Linux.=C2=A0 There&#39;s no practical way we can build on macO=
S right<br>
&gt; now due to the recent security changes.<br>
<br>
</span>When I tried, early in the WSL testing, bitbake wouldn&#39;t start d=
ue to<br>
some missing syscalls. inotify related, IIRC.<br>
<span class=3D""><br>
&gt;<br>
&gt; Builds on BSD would be interesting, I&#39;m curious as to how much bre=
aks<br>
&gt; from GNU userland expectations and whether the build override is<br>
&gt; actually useful.<br>
<br>
</span>The problem I&#39;m running into right now is pseudo. FreeBSD uses a=
<br>
different API for extended attributes, so all the various xattr_...<br>
things don&#39;t work. I might need to make it depend on a port of the<br>
xattr wrappers.<br>
<br>
Outside of that, I&#39;ve been using a FreeBSD hosted cross toolchain for<b=
r>
embedded Linux for years. It works well on its own. Hopefully the<br>
build-* overrides will be helpful for the small differences I&#39;ve<br>
noticed.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Ross<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot c=
om<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engine=
er, Mentor Graphics</div></div></div></div>
</div>

--0000000000007a1f6b056bddc12d--
