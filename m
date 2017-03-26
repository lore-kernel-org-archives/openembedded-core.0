Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
	[209.85.161.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9CB9277A50
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Mar 2017 17:10:04 +0000 (UTC)
Received: by mail-yw0-f181.google.com with SMTP id v76so18281550ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Mar 2017 10:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xsSK1ctJGFjZQrVPhDOkbXah8vRh2g8G+9qztEG8g4I=;
	b=FfAtKE+9LzzycCUXhj2daulHfgjNPeMSprlTqTYiS1xXEEYxWFPDWcQQ4XXtxoouye
	kRiJYjX0PajnD/QMGsk2yIctM8miQfOX9O8QW0laBGP0/n+6OXcygMQ1cDVCp5IvDZ5H
	/MvLftdvNCCQdc6B7RTWZbfvEbz07zvCEkMOptACWFHYhPMm9iSPjzk8puXuA4VtB6o+
	ec3zQmzTWC4Q/BrvhbTbjCIW+u/rjXHkMBrNHvgIVBoeHBLEIQgH2Nsty7dE4HVfUN34
	ozG7RMeY1Iw/2ZPzAUEFv7HZ0yikqrOIt6bIrtw8vLpx/44rdkNsJDTwnX0b+u8qqhYN
	XCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xsSK1ctJGFjZQrVPhDOkbXah8vRh2g8G+9qztEG8g4I=;
	b=NFCOANW2sFWPliECDZoOBSGylJ35sYzXxLGXe/yC1aMhYcKgNLX9fo7bogoTMgQS6u
	rcmyGzkYlFHPmtzeInhQQ1Ok/72AL2MUEhzca5xRGYlBjH5x/iY+CFe+BPl/2a+v3TUp
	Rw0caseOA+s6e7aHo1Ac9OhZ5uyTc4aFc+gXac24fZibyTFnOnPyzqiH9tCqnRIrik6U
	HQZvAfMtW0A3+S3dYqRuuJgGby+6mV779V+7apYwiVB2Zo0GpgagoyyJmGfxsjin1zQe
	8Rkfva7pagN5DQtlPjyzH63Ans+/m1QBrONdZrKveWG13rFWLq4IdSzHSE8ji3nDKdxu
	6bwQ==
X-Gm-Message-State: AFeK/H2YmMQXu8FTo8YX0AwpHPGf05u03N8LJDqINHhVOiOrDonCg0M7pENnKZlAPcaKY9AjzW8u8vZfh2c319mb
X-Received: by 10.37.221.134 with SMTP id u128mr13151741ybg.51.1490548205493; 
	Sun, 26 Mar 2017 10:10:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.81.136 with HTTP; Sun, 26 Mar 2017 10:09:35 -0700 (PDT)
In-Reply-To: <d33381889bbb46db8e6f4f2190b2d1f4@XBOX02.axis.com>
References: <CAJ86T=WhxRaQ42=2bsFVZpeLhrZo2XwZBYoWp=f42tyebo2=2A@mail.gmail.com>
	<1490287404.13980.231.camel@linuxfoundation.org>
	<f67e1ac46aff43cfb085fd76fe0f60c6@XBOX02.axis.com>
	<1490437627.13980.248.camel@linuxfoundation.org>
	<d33381889bbb46db8e6f4f2190b2d1f4@XBOX02.axis.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Sun, 26 Mar 2017 20:09:35 +0300
Message-ID: <CAHiDW_EF_yzWm9-wgjyLidA-W2=Yq-sqRhHFXQFD2LtqSuz2Gw@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Using MACHINE_FEATURES in a native recipe
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
X-List-Received-Date: Sun, 26 Mar 2017 17:10:06 -0000
Content-Type: multipart/alternative; boundary=001a114bcea44f35c3054ba54c99

--001a114bcea44f35c3054ba54c99
Content-Type: text/plain; charset=UTF-8

On 25 March 2017 at 17:34, Peter Kjellerstedt <peter.kjellerstedt@axis.com>
wrote:

> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Richard Purdie
> > Sent: den 25 mars 2017 11:27
> > To: Peter Kjellerstedt; Andre McCurdy; OE Core mailing list
> > Subject: Re: [OE-core] Using MACHINE_FEATURES in a native recipe
> >
> > On Fri, 2017-03-24 at 15:10 +0000, Peter Kjellerstedt wrote:
> > > Even though I agree this is a good change and that it should be done,
> > > I wonder if we can either hold it off until after Pyro has been
> > > released or make it possible to avoid it? The reason for this is that
> > > I know that this change will require a huge amount of development
> > > work for us, something that will not be possible to do in the time
> > > frame left until Pyro is released. Or alternatively we will have to
> > > copy native.bbclass to our layers and maintain a fork of it, which
> > > sucks...
> > >
> > > The reason for this is that our unit test framework is based on
> > > building all our own packages as native, but still configured via,
> > > amongst others, MACHINE_FEATURES as if building for the real target.
> > > This will of course not work anymore if MACHINE_FEATURES is set to ""
> > > with no way of overriding it.
> >
> > I'm afraid I only saw this after I merged it :(
>
> No worries. I'll backport native.bbclass to our layers for now.
>
> > I appreciate its a pain but I do think the change is the right thing to
> > do (maybe with a corresponding DISTRO_FEATURES one too). Hopefully we
> > can find a way that lets you work around it somehow...
>
> I agree that cleaning MACHINE_FEATURES is the right thing to do. However,
> I am not so sure about DISTRO_FEATURES. After all, the native tools are
> part of the distro as well and there may be reasons to build them
> differently based on enabled features in the distro.
>

It's possible but I've not found a single reason yet... If someone has a
hunch about a distro feature actually affecting a native tool, please
mention in https://bugzilla.yoctoproject.org/show_bug.cgi?id=11239

Jussi

--001a114bcea44f35c3054ba54c99
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
5 March 2017 at 17:34, Peter Kjellerstedt <span dir=3D"ltr">&lt;<a href=3D"=
mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.kjellerstedt@ax=
is.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><span class=3D"gmail-">&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core-bounces@lists.openembedded.o=
rg">openembedded-core-bounces@<wbr>lists.openembedded.org</a><br>
&gt; [mailto:<a href=3D"mailto:openembedded-core-bounces@lists.openembedded=
.org">openembedded-core-<wbr>bounces@lists.openembedded.org</a><wbr>] On Be=
half Of<br>
&gt; Richard Purdie<br>
</span><span class=3D"gmail-">&gt; Sent: den 25 mars 2017 11:27<br>
&gt; To: Peter Kjellerstedt; Andre McCurdy; OE Core mailing list<br>
&gt; Subject: Re: [OE-core] Using MACHINE_FEATURES in a native recipe<br>
&gt;<br>
</span><span class=3D"gmail-">&gt; On Fri, 2017-03-24 at 15:10 +0000, Peter=
 Kjellerstedt wrote:<br>
&gt; &gt; Even though I agree this is a good change and that it should be d=
one,<br>
&gt; &gt; I wonder if we can either hold it off until after Pyro has been<b=
r>
&gt; &gt; released or make it possible to avoid it? The reason for this is =
that<br>
&gt; &gt; I know that this change will require a huge amount of development=
<br>
&gt; &gt; work for us, something that will not be possible to do in the tim=
e<br>
&gt; &gt; frame left until Pyro is released. Or alternatively we will have =
to<br>
&gt; &gt; copy native.bbclass to our layers and maintain a fork of it, whic=
h<br>
&gt; &gt; sucks...<br>
&gt; &gt;<br>
&gt; &gt; The reason for this is that our unit test framework is based on<b=
r>
&gt; &gt; building all our own packages as native, but still configured via=
,<br>
&gt; &gt; amongst others, MACHINE_FEATURES as if building for the real targ=
et.<br>
&gt; &gt; This will of course not work anymore if MACHINE_FEATURES is set t=
o &quot;&quot;<br>
&gt; &gt; with no way of overriding it.<br>
&gt;<br>
&gt; I&#39;m afraid I only saw this after I merged it :(<br>
<br>
</span>No worries. I&#39;ll backport native.bbclass to our layers for now.<=
br>
<span class=3D"gmail-"><br>
&gt; I appreciate its a pain but I do think the change is the right thing t=
o<br>
&gt; do (maybe with a corresponding DISTRO_FEATURES one too). Hopefully we<=
br>
&gt; can find a way that lets you work around it somehow...<br>
<br>
</span>I agree that cleaning MACHINE_FEATURES is the right thing to do. How=
ever,<br>
I am not so sure about DISTRO_FEATURES. After all, the native tools are<br>
part of the distro as well and there may be reasons to build them<br>
differently based on enabled features in the distro.<br></blockquote><div><=
br></div><div>It&#39;s possible but I&#39;ve not found a single reason yet.=
.. If someone has a hunch about a distro feature actually affecting a nativ=
e tool, please mention in <a href=3D"https://bugzilla.yoctoproject.org/show=
_bug.cgi?id=3D11239">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D11=
239</a>=C2=A0</div><div>=C2=A0</div><div>Jussi</div></div></div></div>

--001a114bcea44f35c3054ba54c99--
