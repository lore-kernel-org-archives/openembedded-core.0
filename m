Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1EAF678568
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 18:14:45 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id q129-v6so7992471ywg.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 11:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iKUmICJnNJk68QJu4E8kSPlzVBsyE7JTES+wnylIfjI=;
	b=H6q0aOS6zuT3phCJc7pmhOFyoaF83bB9MPC3XXHk+/2a9nvBENDFN1E/nGVv9O3m1X
	B7k9nOSUXmvGPucrSfr6wFd3CUf2SC4YmB0j6sfs+jrjoTP2cBJlMrSlxDNFvKSBdwC5
	D9N6NzUuKHws/50V6OANXfxrIgs17RuGRLarpZgxcyAGqMfpyuheJLAKVv+y2VvR6Mph
	YOu07+oPWlhSaGCe91/sPDA2VjKyIx9ml+BGeUK959X8FgJxOBUD3NaR2mIVSUaSRHG+
	CuBnJj5FHtEKrce9xND2+jV6Bi02GYvyxXujl/P5/wV6+xd2+ChI04TJ/I424FC8Jr6f
	tfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iKUmICJnNJk68QJu4E8kSPlzVBsyE7JTES+wnylIfjI=;
	b=EdpkaPlC+V33jCBbQ5r9SycDRz4exEEQoOht9T4JbDojtZwnEbN5XOyIPFyw3Aexm2
	JsB/vQmiA0UN/UTCr/kGX4XCWWtQvGU+PB8Z35pYF3k9xRukGjhkNAHq9ddQDU/5DdNk
	4zBzdYDiAqKfLqK2H3N0M63xj7JYhftg3/Z380bs6T5jvr+VzAwXREkRbjW15mCeeWOl
	1VWAUysWxIVuvGpc+mYR3laOPfccgZIRxkOY0Ylh0ERMoXUjZ5G8PCWRusYqD78uet7o
	zKg9R/QXaXiVQnxjS/TtbRxEWZLIs6Q2BrMwNPjSTBUi472zzLr2mEp8RX3oM/exnmV1
	1Rvg==
X-Gm-Message-State: AOUpUlFRXtKjK5aSLNfr7H9XMC1a8rGpKhnBvWdPGHdEM/GWZAQ9Evd2
	NQ52ZA/7iTyaC6hSAf/LVrCMVPHKrH3mOLYMU/c=
X-Google-Smtp-Source: AAOMgpeb7VfuCY3tqII8jFyAKYTkf/pffzOoG7T0S48cUGJ1zzj6BFNdmrmB4+MuxX25BlPAD/qTXe5N5HkJH6kNVV8=
X-Received: by 2002:a0d:f7c3:: with SMTP id
	h186-v6mr66554ywf.272.1531419286859; 
	Thu, 12 Jul 2018 11:14:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAFeBWL6aUFRraua-xyf49HYvHq=BGMNcZrmo1k6GtpvCpYETSg@mail.gmail.com>
	<CAJTo0LYeM6ob7-d+FxNeFgLszvhry0=9Tcb90a-1vU+PXjFppQ@mail.gmail.com>
	<CAFeBWL7d02=O3SKdUYAPOmeJi1hgLyq56EVBO6hDTYmx0kjamw@mail.gmail.com>
	<CAJTo0LZfDvyMK91vy1D31nUAkHSJPrGqcqKUDd=HuJRoipUnVw@mail.gmail.com>
In-Reply-To: <CAJTo0LZfDvyMK91vy1D31nUAkHSJPrGqcqKUDd=HuJRoipUnVw@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Thu, 12 Jul 2018 14:14:32 -0400
Message-ID: <CAFeBWL402fLGhVZ9RhrMBkZ4Nti+oraWDJo0m-aK-HBY9uGrxA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Using IMAGE_INSTALL_remove and PNBLACKLIST
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
X-List-Received-Date: Thu, 12 Jul 2018 18:14:46 -0000
Content-Type: multipart/alternative; boundary="00000000000098776d0570d156c3"

--00000000000098776d0570d156c3
Content-Type: text/plain; charset="UTF-8"

Understood. Thanks!

On Thu, Jul 12, 2018 at 1:41 PM Burton, Ross <ross.burton@intel.com> wrote:

> Blacklist will just make a recipe unavailable, if another package
> depends on something it provides then you get a fatal error.
>
> IMAGE_INSTALL is the "top level" list of packages to install, if one
> of those is a packagegroup that depends on other packages then you
> can't remove those other packages.
>
> At this point you're either:
> 1) bbappending packagegroups to manipulate their dependencies, which
> can get silly, or
> 2) just writing a new image
>
> Ross
>
> On 12 July 2018 at 18:16, Adam Lee <adam.yh.lee@gmail.com> wrote:
> > Right, but I am simply and quickly trying to replicate TI provided SDK
> > image.
> > So RDEPENDS does not get handled by IMAGE_INSTALL_remove / PNBLACKLIST
> > combo, correct?
> >
> > Adam
> >
> > On Thu, Jul 12, 2018 at 12:20 PM Burton, Ross <ross.burton@intel.com>
> wrote:
> >>
> >> Write your own custom image which doesn't include
> >> packagegroup-arago-tisdk-addons?
> >>
> >> Ross
> >>
> >> On 12 July 2018 at 16:19, Adam Lee <adam.yh.lee@gmail.com> wrote:
> >> > I am attempting to exclude a package from my system image with this in
> >> > my
> >> > local.conf:
> >> >
> >> > IMAGE_INSTALL_remove += "tiovx-app-host-examples"
> >> > IMAGE_INSTALL_remove += "tiovx-lib-host"
> >> > IMAGE_INSTALL_remove += "tiovx-app-host"
> >> >
> >> > PNBLACKLIST[tiovx-lib-host] = "Build break"
> >> > PNBLACKLIST[tiovx-app-host] = "Build break"
> >> > PNBLACKLIST[tiovx-app-host-examples] = "Build break"
> >> >
> >> > My build is still failing unfortunately:
> >> >
> >> > ERROR: Nothing RPROVIDES 'tiovx-app-host-examples' (but
> >> >
> >> >
> /home/ylee/tisdk-20180718/tisdk/sources/meta-arago/meta-arago-distro/recipes-core/packagegroups/
> packagegroup-arago-tisdk-addons.bb
> >> > RDEPENDS on or otherwise requires it)
> >> > NOTE: Runtime target 'tiovx-app-host-examples' is unbuildable,
> >> > removing...
> >> > Missing or unbuildable dependency chain was:
> ['tiovx-app-host-examples']
> >> > ERROR: Required build target 'packagegroup-arago-tisdk-addons' has no
> >> > buildable providers.
> >> > Missing or unbuildable dependency chain was:
> >> > ['packagegroup-arago-tisdk-addons', 'tiovx-app-host-examples']
> >> >
> >> > Is there something else I have to do to eliminate a package that is
> >> > runtime
> >> > dependent? Thoughts?
> >> >
> >> > Adam
> >> >
> >> > --
> >> > _______________________________________________
> >> > Openembedded-core mailing list
> >> > Openembedded-core@lists.openembedded.org
> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >> >
>

--00000000000098776d0570d156c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Understood. Thanks!</div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr">On Thu, Jul 12, 2018 at 1:41 PM Burton, Ross &lt;<a href=3D"=
mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">Blacklist will just make a recipe unavailab=
le, if another package<br>
depends on something it provides then you get a fatal error.<br>
<br>
IMAGE_INSTALL is the &quot;top level&quot; list of packages to install, if =
one<br>
of those is a packagegroup that depends on other packages then you<br>
can&#39;t remove those other packages.<br>
<br>
At this point you&#39;re either:<br>
1) bbappending packagegroups to manipulate their dependencies, which<br>
can get silly, or<br>
2) just writing a new image<br>
<br>
Ross<br>
<br>
On 12 July 2018 at 18:16, Adam Lee &lt;<a href=3D"mailto:adam.yh.lee@gmail.=
com" target=3D"_blank">adam.yh.lee@gmail.com</a>&gt; wrote:<br>
&gt; Right, but I am simply and quickly trying to replicate TI provided SDK=
<br>
&gt; image.<br>
&gt; So RDEPENDS does not get handled by IMAGE_INSTALL_remove / PNBLACKLIST=
<br>
&gt; combo, correct?<br>
&gt;<br>
&gt; Adam<br>
&gt;<br>
&gt; On Thu, Jul 12, 2018 at 12:20 PM Burton, Ross &lt;<a href=3D"mailto:ro=
ss.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt; wrote:=
<br>
&gt;&gt;<br>
&gt;&gt; Write your own custom image which doesn&#39;t include<br>
&gt;&gt; packagegroup-arago-tisdk-addons?<br>
&gt;&gt;<br>
&gt;&gt; Ross<br>
&gt;&gt;<br>
&gt;&gt; On 12 July 2018 at 16:19, Adam Lee &lt;<a href=3D"mailto:adam.yh.l=
ee@gmail.com" target=3D"_blank">adam.yh.lee@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; I am attempting to exclude a package from my system image wit=
h this in<br>
&gt;&gt; &gt; my<br>
&gt;&gt; &gt; local.conf:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; IMAGE_INSTALL_remove +=3D &quot;tiovx-app-host-examples&quot;=
<br>
&gt;&gt; &gt; IMAGE_INSTALL_remove +=3D &quot;tiovx-lib-host&quot;<br>
&gt;&gt; &gt; IMAGE_INSTALL_remove +=3D &quot;tiovx-app-host&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; PNBLACKLIST[tiovx-lib-host] =3D &quot;Build break&quot;<br>
&gt;&gt; &gt; PNBLACKLIST[tiovx-app-host] =3D &quot;Build break&quot;<br>
&gt;&gt; &gt; PNBLACKLIST[tiovx-app-host-examples] =3D &quot;Build break&qu=
ot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; My build is still failing unfortunately:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ERROR: Nothing RPROVIDES &#39;tiovx-app-host-examples&#39; (b=
ut<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; /home/ylee/tisdk-20180718/tisdk/sources/meta-arago/meta-arago=
-distro/recipes-core/packagegroups/<a href=3D"http://packagegroup-arago-tis=
dk-addons.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-arago-tisdk=
-addons.bb</a><br>
&gt;&gt; &gt; RDEPENDS on or otherwise requires it)<br>
&gt;&gt; &gt; NOTE: Runtime target &#39;tiovx-app-host-examples&#39; is unb=
uildable,<br>
&gt;&gt; &gt; removing...<br>
&gt;&gt; &gt; Missing or unbuildable dependency chain was: [&#39;tiovx-app-=
host-examples&#39;]<br>
&gt;&gt; &gt; ERROR: Required build target &#39;packagegroup-arago-tisdk-ad=
dons&#39; has no<br>
&gt;&gt; &gt; buildable providers.<br>
&gt;&gt; &gt; Missing or unbuildable dependency chain was:<br>
&gt;&gt; &gt; [&#39;packagegroup-arago-tisdk-addons&#39;, &#39;tiovx-app-ho=
st-examples&#39;]<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Is there something else I have to do to eliminate a package t=
hat is<br>
&gt;&gt; &gt; runtime<br>
&gt;&gt; &gt; dependent? Thoughts?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Adam<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; _______________________________________________<br>
&gt;&gt; &gt; Openembedded-core mailing list<br>
&gt;&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/mailman/listinfo/openembedded-core</a><br>
&gt;&gt; &gt;<br>
</blockquote></div>

--00000000000098776d0570d156c3--
