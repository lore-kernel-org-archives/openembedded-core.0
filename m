Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7A1BB607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 12:39:17 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id q130so260819937qke.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 04:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tmjQzF3f9/fZQhH3VeTjol2wE7IkFA8/H9Pgj4y5Aow=;
	b=KrhCSQTFOCRjooPZsc7Zd6mppVFc7YVxLaiufmAvf51KbgQ/b16IadAQP92e1e1eDZ
	H8VfSMLsMdQZesfX7oYY4aSfg/WX42b9Gm38DF6PCp3nKVrAzZzm5mbPwpw3EZTCjGxz
	RnhHi4vY2PTQopLyzRIL1yhTrWhU2Pcs5mmZbe5jft1Go52TPt3T8FQZEjIubvFTLudM
	qEct+z029OZdpF9w1hNBQbrUubw/lKR4KV8IPIzQV4Ligk5BgQ8tA+b+dI822BiD7nxh
	4MG8dmejeYDw5wrHeviGZsEf88728KlhOlzaoq5Fc9Afg6JedyZlWzP/5UModTKmvBU2
	LK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tmjQzF3f9/fZQhH3VeTjol2wE7IkFA8/H9Pgj4y5Aow=;
	b=HYsycjdvyClYmQDUY8ea9Goigg1l1W9VW8Rv4zJ2Opvqq6UKWEx/6hPWo23zUNKKLC
	rtoitaxblM0cQ5Ot05HHB9p6R6w+ETlBfJsyEXX40x48Mj/vajinXjOLunU8+AiBvjWO
	8r3yc+iUVTIV4y/pmuofPyxGIpEgydvYnklz4aptcArVPjpdGVYV5oOxvdEGE13KKNQx
	PLjd4mH8Ltv2wQ7r6AaFgjK2AYgI+By58duRoLQ3VyT0odArOdEqoWqz6pS0Pfimgbf/
	lPsyU7mB+wH+PiHXRhAMhZAG4UK7qrJMiPSLdxcxFbSJLyUSvU2ft9JYQ6QcUEJqsu0u
	xnSw==
X-Gm-Message-State: AKaTC02J1jcn50HW58nvYk1OtrGiiqeSDdkgk5yqwpGp/iRKPiYIKW5Iamlq6CdrSvUGhEWc56hzQ0DeKlKR9SMH
X-Received: by 10.55.31.157 with SMTP id n29mr9410996qkh.221.1479472758355;
	Fri, 18 Nov 2016 04:39:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Fri, 18 Nov 2016 04:38:57 -0800 (PST)
In-Reply-To: <20161116174748.26994-1-raj.khem@gmail.com>
References: <20161116174748.26994-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 18 Nov 2016 12:38:57 +0000
Message-ID: <CAJTo0LYgH6_T5Y-YO1Px5eyYFLiud9SQvG1vHGRoebwkhVhdKg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] systemd: Upgrade to 232
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
X-List-Received-Date: Fri, 18 Nov 2016 12:39:17 -0000
Content-Type: multipart/alternative; boundary=001a1147f22837be9905419298f7

--001a1147f22837be9905419298f7
Content-Type: text/plain; charset=UTF-8

On 16 November 2016 at 17:47, Khem Raj <raj.khem@gmail.com> wrote:

> * Drop support for rcS.d SysV init scripts.
>   These are prone to cause dependency loops, and almost all packages with
>   rcS scripts now ship a native systemd service.
>
> * Drop mount propagation patch, it only happens with libseccomp, OE doesnt
>   enable it
>
> * kdbus option has disappeared from configure
>
> * Ignore dev-so for PN now since systemd introduced private .so see
>   https://github.com/systemd/systemd/issues/3810
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>

Because systemd-boot basically include the systemd recipe, this breaks
systemd-boot.

Can we think up a way to handle systemd/systemd-boot without breaking every
upgrade?

Ross

--001a1147f22837be9905419298f7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 November 2016 at 17:47, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":211" class=3D"a3s aXj=
CH m1586e434069ed0cd">* Drop support for rcS.d SysV init scripts.<br>
=C2=A0 These are prone to cause dependency loops, and almost all packages w=
ith<br>
=C2=A0 rcS scripts now ship a native <span class=3D"il">systemd</span> serv=
ice.<br>
<br>
* Drop mount propagation patch, it only happens with libseccomp, OE doesnt<=
br>
=C2=A0 enable it<br>
<br>
* kdbus option has disappeared from configure<br>
<br>
* Ignore dev-so for PN now since <span class=3D"il">systemd</span> introduc=
ed private .so see<br>
=C2=A0 <a href=3D"https://github.com/systemd/systemd/issues/3810" rel=3D"no=
referrer" target=3D"_blank">https://github.com/<span class=3D"il">systemd</=
span>/<wbr><span class=3D"il">systemd</span>/issues/3810</a><br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;</div></blockquote></div><br>Because systemd-boot basicall=
y include the systemd recipe, this breaks systemd-boot.</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">Can we think up a way to =
handle systemd/systemd-boot without breaking every upgrade?</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1147f22837be9905419298f7--
