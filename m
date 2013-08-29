Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id DE1E96BD26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:14:32 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id w6so889746lbh.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=uvQdf7N9IJt8FAKTET9DRZdknAOFVCpAKf9myI4yg30=;
	b=Xe9IgMksIINSyz4EQeTc+OPuvzWHJg+2nbM28YxJJ8fkrkgL+5+uju1FKR3l0bwY36
	ALlhPVBHKuTDtaDNA0f7q/NNDccq0taTcptT1EGIYI9EyjDVyLAvB1eZ6di2z6NN0Rzy
	h1dCrGWCkFt4G/Oe1bgSlptY4VK6sf/WN21Z8ePB51PlIEw7iIImoo2vBo3i5j/FFgI2
	YXsOz/dUi6mx3DuB+BbudulPTmb/KCi2ydJvgX/US+Egx/Dce3y7ael8P9GuoAhGwgSE
	xN6tc/hoxDPVptINKzNzONJEdZ/MAKQset/K8KRBEBGlgrK1xLc49ty4xuGTlRXcSGMk
	bBng==
X-Received: by 10.112.155.228 with SMTP id vz4mr2075083lbb.41.1377792872437;
	Thu, 29 Aug 2013 09:14:32 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.53.197 with HTTP; Thu, 29 Aug 2013 09:14:12 -0700 (PDT)
In-Reply-To: <1377777433.32502.71.camel@ted>
References: <alpine.DEB.2.02.1308290628130.4283@oneiric>
	<20130829104913.GM3544@jama>
	<alpine.DEB.2.02.1308290657140.5063@oneiric>
	<20130829112725.GN3544@jama>
	<alpine.DEB.2.02.1308290733210.5515@oneiric>
	<1377776979.28077.88.camel@phil-desktop.brightsign>
	<1377777433.32502.71.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 29 Aug 2013 09:14:12 -0700
X-Google-Sender-Auth: yXeywqY3l_0DlzdcYnK_iHyCOPI
Message-ID: <CABcZANn3HfQ1RYxGO0_3MCwXCRdz3RmfYEPcMvaw+ufXEp2tig@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: appears to be inconsistency re: base-files between oe-core and meta-angstrom
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
X-List-Received-Date: Thu, 29 Aug 2013 16:14:33 -0000
Content-Type: multipart/alternative; boundary=089e01229724bc600604e51866de

--089e01229724bc600604e51866de
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 29, 2013 at 4:57 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2013-08-29 at 12:49 +0100, Phil Blundell wrote:
> > On Thu, 2013-08-29 at 07:37 -0400, Robert P. J. Day wrote:
> > >   distroless. i realize i *could* set a value for DISTRO, but it would
> > > seem that i shouldn't have to in order to avoid a build error.
> >
> > Well, either you're using angstrom or you aren't.  If you do want to use
> > it then you ought to set DISTRO appropriately, and if you don't want to
> > use it then you probably oughtn't to have the angstrom layer included at
> > all.
> >
> > Trying to use the angstrom .bbappends and files with a different (or no)
> > distro configuration will give you a set of metadata that's neither one
> > thing nor the other and, even if you didn't get a build error, there's
> > no guarantee that the resulting image would actually work.
>
> I'm not sure I agree. Ideally layers should be includable without
> turning on behaviour unless it is enabled. This is why we have things
> like an array of OVERRIDES to chose from.
>
> So I'd actually suggest this is a bug in the angstrom layer. There are
> also other layers which probably have issues, maybe including meta-yocto
> but we should fix them.
>
> I'll go further and suggest that Yocto Project Compatible status might
> depend on this in future (the current questions suggest it should be the
> case already).
>

I agree wholeheartedly with this. Distro and BSP layers really need to be
leveraging OVERRIDES for anything distro or machine specific.
-- 
Christopher Larson

--089e01229724bc600604e51866de
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Aug 29, 2013 at 4:57 AM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Thu, 2013-08-29 at 12:4=
9 +0100, Phil Blundell wrote:<br>
&gt; On Thu, 2013-08-29 at 07:37 -0400, Robert P. J. Day wrote:<br>
&gt; &gt; =C2=A0 distroless. i realize i *could* set a value for DISTRO, bu=
t it would<br>
&gt; &gt; seem that i shouldn&#39;t have to in order to avoid a build error=
.<br>
&gt;<br>
&gt; Well, either you&#39;re using angstrom or you aren&#39;t. =C2=A0If you=
 do want to use<br>
&gt; it then you ought to set DISTRO appropriately, and if you don&#39;t wa=
nt to<br>
&gt; use it then you probably oughtn&#39;t to have the angstrom layer inclu=
ded at<br>
&gt; all.<br>
&gt;<br>
&gt; Trying to use the angstrom .bbappends and files with a different (or n=
o)<br>
&gt; distro configuration will give you a set of metadata that&#39;s neithe=
r one<br>
&gt; thing nor the other and, even if you didn&#39;t get a build error, the=
re&#39;s<br>
&gt; no guarantee that the resulting image would actually work.<br>
<br>
</div>I&#39;m not sure I agree. Ideally layers should be includable without=
<br>
turning on behaviour unless it is enabled. This is why we have things<br>
like an array of OVERRIDES to chose from.<br>
<br>
So I&#39;d actually suggest this is a bug in the angstrom layer. There are<=
br>
also other layers which probably have issues, maybe including meta-yocto<br=
>
but we should fix them.<br>
<br>
I&#39;ll go further and suggest that Yocto Project Compatible status might<=
br>
depend on this in future (the current questions suggest it should be the<br=
>
case already).<br></blockquote></div><br>I agree wholeheartedly with this. =
Distro and BSP layers really need to be leveraging OVERRIDES for anything d=
istro or machine specific.<br>-- <br>Christopher Larson</div></div>

--089e01229724bc600604e51866de--
