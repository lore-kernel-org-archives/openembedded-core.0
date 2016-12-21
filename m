Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5AD0F601A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 23:05:48 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id t184so97063355qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 15:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DsjEeaiE/e+JhDvwCATmdzUWvAXRO9FdTIZ+K2ytZlg=;
	b=pl0kdK/Xy1sDq0rqmiTplMmmjm4STc9V7KFq4OPlyvy2p8jJQTHghVtntyTt45wtqF
	XTMjwpqt+0IRGCQv/6Tco3lWi1KuTwo6/z3owAG9H+0YmRMuo9vHtpNVevEOEkunwsS4
	J/9C57/PPqzvzOZ3V3bIIRBz1tbtohg5eiNAacNIqH6VXx35Mzu0t0i0yoy+bZgcqAhK
	WDEcYwaJjqMA1vgC8tGcX981i4VMxQXD+o2R+4Grfg9emzcXnkygBlEhaazQeeIkE7+y
	myGGIqYsSWMTvbZKJAyEA+KCB0wFhMAFm61dvfC/fi67ncNmMANX1ZLQqiIR8u/dz0eJ
	PhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DsjEeaiE/e+JhDvwCATmdzUWvAXRO9FdTIZ+K2ytZlg=;
	b=cAZCl+OAPCa/NzAm2735EPE6Umiose1Dd0Hwwlq6pNb/cytAeLpwlHoKhUIKZCKrw0
	961V/wcJRg3tLnml5NqArixCBmKY8Kz3aGrQZeFzbvDSjWOxx7dR+CJEwf5/7CSOAv/V
	9wMdt2qu5P+SKf6A/QD7HS8Dssukata6kTMNo+5YIGIvsgmBQCaRJduJdniuMcchO07r
	OgWxExeMjS5uG69yHt+W+446F2ARAfRvhLlWWl1eRRprw+u3QNueK6e1O1Ugbq/iunc2
	Ox300NJKWXmR4qsq/1Z+w9VwRRkg+D9Y7yQ5ZT7Gkr26odxUXUAIHJyKXF5krQFK5s2s
	3aeg==
X-Gm-Message-State: AIkVDXKlk219isFBH+W5LcLnm3b3isnhOtpuw97vBhOlVt6fJd7AU5Wpufrb2jQNd8uUJFXG3ST/GnEf4vhWwfwP
X-Received: by 10.55.106.134 with SMTP id f128mr7987509qkc.121.1482361549476; 
	Wed, 21 Dec 2016 15:05:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Wed, 21 Dec 2016 15:05:29 -0800 (PST)
In-Reply-To: <CAMKF1sqZjBsjwSkGQ0+pjpaYpxSxT9fcYC0J0KA_6_EPquh9dQ@mail.gmail.com>
References: <CAJTo0LaRcmKATHBTRzosaFGAOLGc6R_1ioZfGbr4CU_7zShN4A@mail.gmail.com>
	<CAMKF1sqZjBsjwSkGQ0+pjpaYpxSxT9fcYC0J0KA_6_EPquh9dQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Dec 2016 23:05:29 +0000
Message-ID: <CAJTo0La+8XsrPGY+wT9G8pf6cHTcEoiLX0QPH=Z4uUMA5XBv_w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Broadcom firmware alternatives
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
X-List-Received-Date: Wed, 21 Dec 2016 23:05:58 -0000
Content-Type: multipart/alternative; boundary=001a114fddf695fbdf0544333145

--001a114fddf695fbdf0544333145
Content-Type: text/plain; charset=UTF-8

On 21 December 2016 at 22:25, Khem Raj <raj.khem@gmail.com> wrote:

> arent they for different chipsets ? if they are not supersets then
> they should be able to
> live together.
>

Yes. they're different chipsets.

From https://wireless.wiki.kernel.org/en/users/drivers/brcm80211:

In kernel priors to v3.13 the SDIO driver used generic firmware names.
> Below are the instruction Use the nvram file installed in your system and
> copy it to /lib/firmware/brcm/brcmfmac-sdio.txt The firmware can be found
> in the linux-firmware repository.
> For 4329: cp brcm/brcmfmac4329.bin /lib/firmware/brcm/brcmfmac-sdio.bin
> For 4330: cp brcm/brcmfmac4330.bin /lib/firmware/brcm/brcmfmac-sdio.bin


Which makes me think that the non-versioned name was used by older drivers
for *all* chipsets, and you had to know what chipset you had to create the
right filename.  Modern kernels (post 3.13, January 2014 onwards) use
versioned firmware names so this is all redundant.

Ross

--001a114fddf695fbdf0544333145
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 December 2016 at 22:25, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-st=
yle:solid;padding-left:1ex"><div id=3D"gmail-:5jy" class=3D"gmail-a3s gmail=
-aXjCH gmail-m159237d93fbd9b59">arent they for different chipsets ? if they=
 are not supersets then<br>
they should be able to<br>
live together.<br></div></blockquote></div><br>Yes. they&#39;re different c=
hipsets.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">From=C2=A0<a href=3D"https://wireless.wiki.kernel.org/en/users/drivers/b=
rcm80211">https://wireless.wiki.kernel.org/en/users/drivers/brcm80211</a>:<=
/div><div class=3D"gmail_extra"><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:=
rgb(204,204,204);border-left-style:solid;padding-left:1ex">In kernel priors=
 to v3.13 the SDIO driver used generic firmware names. Below are the instru=
ction Use the nvram file installed in your system and copy it to /lib/firmw=
are/brcm/brcmfmac-sdio.txt The firmware can be found in the linux-firmware =
repository.<br>For 4329: cp brcm/brcmfmac4329.bin /lib/firmware/brcm/brcmfm=
ac-sdio.bin<br>For 4330: cp brcm/brcmfmac4330.bin /lib/firmware/brcm/brcmfm=
ac-sdio.bin</blockquote><div><br></div><div>Which makes me think that the n=
on-versioned name was used by older drivers for *all* chipsets, and you had=
 to know what chipset you had to create the right filename.=C2=A0 Modern ke=
rnels (post 3.13, January 2014 onwards) use versioned firmware names so thi=
s is all redundant.</div><div><br></div><div>Ross</div></div>

--001a114fddf695fbdf0544333145--
