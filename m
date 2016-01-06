Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id A10DE65CBF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 10:04:53 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id 1so166956548ion.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jan 2016 02:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=PCvtuPPXDLfIoI7kOOjBtyaBFu4MAirPQsGn1jDtENA=;
	b=Wai0ip+y9e1cqWm3mYGJdW3B3y6ByJh18QE1AFYCzKTeqz3/Dh1nGI1uqz01yf4pT+
	WIEDwVBywRwmdBq2yqoXovDVRMVTg/tIepyUN4HvrfDBNnwFPfvTdjAb7Jol0wGlTTGB
	Eq+r6F4npNAVydbGnY5rgl0Nxjjnuz6wW3r0luaJZQPrjtMXRjJBmZxlRZg2LugOHJJk
	QtX6E7EpsTX/B7rntKX9lo2T431s9cXnfWQJwWfGMkpMZMqoiMGOXyQgvG2A8AVn+rGL
	xW4VTfqQlgsnzjdynKvfltN1+oBhfzeqyZdhSxCFtoPZc5mY41b2qv4/XP+/Pe08/Oyn
	RONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=PCvtuPPXDLfIoI7kOOjBtyaBFu4MAirPQsGn1jDtENA=;
	b=UgKUpnFaqMcA2hIrF4iWwVI6I/MsvFf8ytY9IQ9M+0evpu9azqZ39WOALP5om56YOg
	aSdz2h1jS6SkETOZw50RBAPZcgNPp8nIOUPegl59R3Su5jR/+mV460pvY9bHs8QuAoIF
	kV4+Jw/vPZojIkCoHVtyDnHONyRFwrAHUebdskv3SSgv0+Dc4AuKLmi+YTaILrQIT/2S
	mVY2yngNt/jbmnFpQfuZWrkivvG7dGjWlc5o5FvNJuf2zmB+Px11MbGAEvxWyjuTvwgs
	ytm14ZUOCf2Yopv2KK4oI6v/ZnloueV8il2mX8XYdfAgTbrKNRzfpGp82XHbNEH/j9V/
	EUOw==
X-Gm-Message-State: ALoCoQlf86sl5R4V1iXCsey3qan1lV/cmMC9BLxuPG46Gw+FuLmwjjXqlMMdfcHjSmrQd+Jd8fXKVHH8J1EWpxllefrMhclXTTTd5FYsi0wzkOmjg9iehuw=
X-Received: by 10.107.3.154 with SMTP id e26mr83249738ioi.99.1452074693924;
	Wed, 06 Jan 2016 02:04:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 6 Jan 2016 02:04:34 -0800 (PST)
In-Reply-To: <8AE765C7-71E0-46D1-A086-A86AEEFE3F6B@gmail.com>
References: <CAMKF1sqAGXMFx9re3YgB1u9aLPGRT9KRCR-0Drux=4P5igirWw@mail.gmail.com>
	<CAJTo0LbB02LR=6Yyy0-3=Hg1tjcdX=DmMKN2MEJqctnvi5n0Kg@mail.gmail.com>
	<A374083C-8331-42F2-A3F5-9D5EB49538F7@gmail.com>
	<2007809.DSH5DR9lFx@peggleto-mobl.ger.corp.intel.com>
	<8AE765C7-71E0-46D1-A086-A86AEEFE3F6B@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 6 Jan 2016 10:04:34 +0000
Message-ID: <CAJTo0LazG6N2L898BLyr0jCZ-Xv5UK=GBs0DoXP+AK4_geQouQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [RFT] glibc 2.23
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
X-List-Received-Date: Wed, 06 Jan 2016 10:04:54 -0000
Content-Type: multipart/alternative; boundary=001a113ec10a51b0780528a77c17

--001a113ec10a51b0780528a77c17
Content-Type: text/plain; charset=UTF-8

On 6 January 2016 at 03:16, Khem Raj <raj.khem@gmail.com> wrote:

> Same branch now has updated glibc patchset, if you have cycles please try
> once more.
>

Thanks Khem.  When meta-fsl-ppc doesn't cause several failures in every run
I'll re-fire it so we can actually get an all-green build!

Ross

--001a113ec10a51b0780528a77c17
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 January 2016 at 03:16, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div id=3D":1bn" class=3D"a3s" styl=
e=3D"overflow:hidden">Same branch now has updated glibc patchset, if you ha=
ve cycles please try once more.<br>
<div class=3D"HOEnZb"></div></div></blockquote></div><br>Thanks Khem.=C2=A0=
 When meta-fsl-ppc doesn&#39;t cause several failures in every run I&#39;ll=
 re-fire it so we can actually get an all-green build!</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ec10a51b0780528a77c17--
