Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id C7E2777029
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 13:37:42 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id y8so19389564igp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2016 05:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aAU+C5LgBpMgn8wzdqq9JbVl1RRfaMHBoIXg+aSFOmY=;
	b=kTOxvIBar2at0kT0lLbrvPGDmxPoAZ2E8SKIA0Vtd4F1ix1U5VhCuO4hMw4iIln0J7
	thhgrfxZI96HjUfvcbUrQUuxHQll/Yr+kGCVMYj6lGRK1cvJ9hErEOzRkY20+hcuJqXY
	p2PJSdYu4955LXMDR9lzjjDzlGsgGLRPIZ5KtVYiJispFHSbvUNBbXM1pneeAtbIAJ0j
	VX033iybIaMNc/7iPLkPx42BLj3rCQEBMEBj/yPkrFDVJzCUnRfmie0fq2hcQ3vcMtpw
	SF2pxhcRBwCR3BC2d+/+R0uEL57B+SRiNw3nXencDfPEftct14DmaSUQl76M/6eytYoF
	HwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aAU+C5LgBpMgn8wzdqq9JbVl1RRfaMHBoIXg+aSFOmY=;
	b=lf8qYW0wsEZvWwC6T/T8KGmW1Xxv2yEAjOFAMeD7wNRsAwddkzJM7J7eP5yeLrrKkm
	evAX8KL/MZykjJQ8k6D7A+sKLrxqZ1MmVRCIW67fArt6ot+3MNednHgz1V+AcsvypD0/
	5zdg7rqRhzqHD71dto5QscwQBfrH4GZayV9lAqNPHhta0/fOxDs1LL4B4tudyoU/6dn2
	XBEyIKAlyq/+hPoN4oe7Kj8m9MtcNIjLgMR++P9aaCEQUeGjClSxLCEP50rzPW9v2LwQ
	za2WI4owDnFB4SDFxXUY2Ws7H4nYybwrOe8xCDzn91FN7xhPi1sIn3lwqz+2Skoj6MlA
	U3mw==
X-Gm-Message-State: AD7BkJI3hM5EMEVIAy6ISJJZwt1O1wRBFKfiqfFEM+qwtN+/1BqggYP/ByhTXAU5lOPmiU7TvaOEMTqcSvXTxnp8
X-Received: by 10.50.126.8 with SMTP id mu8mr2938783igb.52.1457012262861; Thu,
	03 Mar 2016 05:37:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 3 Mar 2016 05:37:23 -0800 (PST)
In-Reply-To: <38408F728A334E9F9A452EFD2448CC8D@RD3>
References: <AB28D54196164B23BA942EBCF3204741@RD3>
	<20160224141143.GB2892@mbabyjoh-mobl.fi.intel.com>
	<2CD39F82881F465AAD78DBB61BCA369E@RD3>
	<CAJTo0LYMO4C9+rd1NG7mMmn4YfU6vRhuOYni4vvPAugoru=uwA@mail.gmail.com>
	<E744C7D53BB7428AB0FD15C117627D11@RD3>
	<20160226093319.GA4329@ad.chargestorm.se>
	<38408F728A334E9F9A452EFD2448CC8D@RD3>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 Mar 2016 13:37:23 +0000
Message-ID: <CAJTo0LbAoSeWVikqA4t9vXrbSnoiWwOWwLBLPtGPLwwr7E3w+g@mail.gmail.com>
To: winiston@futuraautomation.com
Cc: yocto texas <meta-ti@yoctoproject.org>,
	Anders Darander <anders@chargestorm.se>,
	Yocto layer <linux-yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [linux-yocto] How to integrate third party application software to yocto image
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
X-List-Received-Date: Thu, 03 Mar 2016 13:37:42 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bf5cac4c052d251a43

--047d7b1635bf5cac4c052d251a43
Content-Type: text/plain; charset=UTF-8

On 2 March 2016 at 08:52, <winiston@futuraautomation.com> wrote:

> ERROR: navit was skipped: Recipe is blacklisted: bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES
>

Your distro is using bluez5 but navit is using the
old/deprecated/unmaintained bluez4.

Ideally you create a new distro and change this, but for testing this in
your local.conf should be sufficient:

DISTRO_FEATURES_BACKFILL_CONSIDERED = "bluez5"

This will stop your distro from wanting to use bluez5 and will fall back to
bluez4, at which point navit will build.

Ross

--047d7b1635bf5cac4c052d251a43
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 March 2016 at 08:52,  <span dir=3D"ltr">&lt;<a href=3D"mailto:winiston=
@futuraautomation.com" target=3D"_blank">winiston@futuraautomation.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex"><span class=3D"">ERROR: navit was ski=
pped: Recipe is blacklisted: bluez5 conflicts with bluez4 and bluez5 is sel=
ected in DISTRO_FEATURES<br></span></blockquote></div><br>Your distro is us=
ing bluez5 but navit is using the old/deprecated/unmaintained bluez4.</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ideally you=
 create a new distro and change this, but for testing this in your local.co=
nf should be sufficient:</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">DISTRO_FEATURES_BACKFILL_CONSIDERED =3D &quot;bluez5&quo=
t;<br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>This will stop your distro from wanting to use bluez5 and will fall back t=
o bluez4, at which point navit will build.</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7b1635bf5cac4c052d251a43--
