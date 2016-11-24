Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id BCFE3719A9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 16:50:39 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id n21so54652359qka.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 08:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=85ZdaEprHcjEESqs5XTV4j4baFmzyHIBAZUmAVn4Khs=;
	b=Gx0uNQ1wh6GjIT1evaiNeCCwA3GLxiIAjyUXgMEzMakZj7kZTMyilCy6+GY4g1EQPP
	xPnPRz3TaqfhYp86uL90A0q+Deptt1Qmpqd6Cq7wvgw7SuN4MA9qMLUkfV/bu01Xrb7m
	Fpc1TjZqv5bPskohGhPGZLkfdnRf3Rk6+jot6h1mhQreQ01FdJAIRv2lY5/ruQd0I7qy
	aAcJ8Os8osiAVu6AKeR4ahTa6Wd613epVMn1D/xgMTRGHKoH6vsfDZ0zauM7H27qIu0r
	k2gyYuc4RsjZurw+kSe4F+LIeg0+tcdINEpveloK4fnO2FPLGFnmBsP7oivTDEjn63/J
	AMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=85ZdaEprHcjEESqs5XTV4j4baFmzyHIBAZUmAVn4Khs=;
	b=i5niDR/NTbEWHHmnZ1ihD1fNgJeQfyI/WjDwwKcpbvy+rHkH+GhkJ8zb/rS0UPp7X0
	UDWKHIzOmWDDVFZsc5yTqyc3KH4RMY6pBjSVfhcxd+Qnmm7FHEcgoAd1u78oSpMiyJtQ
	jfyg6LfTg733GlbesjIw/4orKKWhJ1oP9taEVFZ79+n2kT4D/Up/MLnOUNykWVXkM5Ut
	JHmgJ77E/H6LmAxgTpaV1SiTm6XqtwxNYfyXgSdEOTqLCEQu1kQfkbSnTD5MzHxX57lK
	SLMrOYxukTcR2gqc/67jhwLoSNapCqLNeyURj63317tcTG3etz0H87tqqkLAN2qF9g53
	uvPA==
X-Gm-Message-State: AKaTC03YzaexcmiBRwJZg64ZOMuo2wRzW+V2AkN5n/16hK4DIzb4RDOSmC3cedXL2pA5wfXRXFgaAT3JZIqME2bH
X-Received: by 10.55.106.134 with SMTP id f128mr3123031qkc.121.1480006241047; 
	Thu, 24 Nov 2016 08:50:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Thu, 24 Nov 2016 08:50:20 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1611231143100.13816@localhost.localdomain>
References: <alpine.LFD.2.20.1611230540200.7856@ca624034.mitel.com>
	<CAJTo0LZvk-Ssv3Bc5rSYSuYCm2rQma4Vwv2jvh5zdE7cCPE0Vg@mail.gmail.com>
	<alpine.LFD.2.20.1611230633180.8293@ca624034.mitel.com>
	<CAFkk2KRQ+vv+X9paB+ZLCuFobAVpXyi7gaV7P5kwgX3hja9Rhg@mail.gmail.com>
	<20161123150525.GA3265@jama>
	<alpine.LFD.2.20.1611231143100.13816@localhost.localdomain>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Nov 2016 16:50:20 +0000
Message-ID: <CAJTo0LYeGs2bfuR0QoRbp9cLhrJf39GuPCqFMcDyDctRzb7oWA@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: migrating simple tarballs over to OE recipes?
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
X-List-Received-Date: Thu, 24 Nov 2016 16:50:40 -0000
Content-Type: multipart/alternative; boundary=001a114fddf643690b05420ece7c

--001a114fddf643690b05420ece7c
Content-Type: text/plain; charset=UTF-8

On 23 November 2016 at 16:52, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

> what is the relationship between bin_package_do_install() and the
> EXPORTed do_install()? seems like an overriding/inheritance thing,
> yes?
>

Pretty much, that says that bin_package_do_install is this classes
do_install implementation.  This lets you inherit the class and override
do_install(), calling bin_package_do_install as required.  If you don't
provide an alternative implementation of do_install then
bin_package_do_install will be called.

This inheritance isn't used very often as generally it's sufficient to just
do_install_append() or _prepend().

Ross

--001a114fddf643690b05420ece7c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 November 2016 at 16:52, Robert P. J. Day <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1n6" cl=
ass=3D"a3s aXjCH m158922b16f528280">what is the relationship between bin_pa=
ckage_do_install() and the<br>
EXPORTed do_install()? seems like an overriding/inheritance thing,<br>
yes?<br></div></blockquote></div><br>Pretty much, that says that bin_packag=
e_do_install is this classes do_install implementation.=C2=A0 This lets you=
 inherit the class and override do_install(), calling bin_package_do_instal=
l as required.=C2=A0 If you don&#39;t provide an alternative implementation=
 of do_install then bin_package_do_install will be called.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">This inheritance isn&=
#39;t used very often as generally it&#39;s sufficient to just do_install_a=
ppend() or _prepend().</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a114fddf643690b05420ece7c--
