Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id A9DD3772CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 14:37:17 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id t184so49664653qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 06:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MfhdMzV4MCZ1r5IDPTeIKi5P4/L189cJCVXhu5oXBb8=;
	b=pG9wDAUJ7Y5Imx+ELt+wxMhNvGMzmVoiivPHbv4kdXATwjLKwAWSdoAjXdZFWSDmZH
	zj7/pcG6P7Ecm2CMKEGhBAoBxsj7GUaPPsP7DQ1YLl+ePEnd5jMYKyQJIbiVDybJe+nA
	xmSWU5wu1RR56wppHyWd8EVwSRS5mb8VR10wQDcue78n/cKHhBwrcbrfD6XgvBt5O1Y7
	B1iNvmToVzgx+1vu8yzmpglwH0fCwiTOZgYcyRrT75O0oTfdlFDWAK2Ki6zjymJ8dcMt
	ud0R/qPgeTjV2hPX+Ezrc46GVBpsOp26usbGQzJd9VD7H0rsmkYiJ6YDnhOqlQKkbZSG
	8YtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MfhdMzV4MCZ1r5IDPTeIKi5P4/L189cJCVXhu5oXBb8=;
	b=Zu0nnizUGPbo/XLKZAfB4sZLPnB3LyqcqkMOACY+i43RRV2qAYXBa0KjmcBqAf6ruc
	nkD2GmF9t9PocdQcbMCJRL1bRF32cS/zaAEMQrfndkPxDHYHT4CGEdFPOKYjOUu2NEWs
	v0LRdDkgE0+YBQAh/wigJknp/dlXP/ue9grDosNUU3BLpsLl4Vx/5+AQEg6Jt/kb/Hl8
	X7UaxjEoGRD5GJh53LFi1TAcKptB1G60dawIHhrO1w83Tb2NqBYj+tKRCRQag1IbDdPV
	dFMdDv9E/jcSHK64VGsF21Kfb/FGaDZIGYXCWR/5+jn+KplG6vbMlAOgMo97xtD46tRM
	jdmw==
X-Gm-Message-State: AIkVDXIF3DvKMGuHZbzAxbEvG3lUAYJQAlU2Qd1SUfUSBm4wGoTNh+oe1rUSnh0kHVmXCrYLDeilVCi+uybU7PPH
X-Received: by 10.55.75.17 with SMTP id y17mr5399589qka.26.1482244638496; Tue,
	20 Dec 2016 06:37:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 20 Dec 2016 06:36:58 -0800 (PST)
In-Reply-To: <CAMKF1sq7fePZCEaZdcN1P_VmZ3Sb8UNmAcCyUDALaRy0p7yfeg@mail.gmail.com>
References: <1481599839-114211-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<20161219152324.GA1056@openSUSE-i7.site>
	<CAJTo0LYV2qMTBVpm8ASDb7BdwwezWfysAn6fJbM7Xwh6FXCcyg@mail.gmail.com>
	<20161219214258.GA16333@openSUSE-i7.site>
	<CAJTo0La1zRwQspKAgPvRxaTryEZSjSSwXf+O0XLadAe5p0VnDA@mail.gmail.com>
	<CAJTo0LYuH==F4jbo3chSbaJHkCu8VWmOS+PxT3A6qwTzJoxwXA@mail.gmail.com>
	<CAHUNapSAEd4zuvQCna+QOMxaGDFck5OQbjvsVe6hr9voN7o1=w@mail.gmail.com>
	<CAMKF1sq7fePZCEaZdcN1P_VmZ3Sb8UNmAcCyUDALaRy0p7yfeg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Dec 2016 14:36:58 +0000
Message-ID: <CAJTo0LYgnXXpwKdFs-TLVSTsxUdNuqjgGRXPJHOqAjT7OMuFAw@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: 2.28.1 -> 2.29
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
X-List-Received-Date: Tue, 20 Dec 2016 14:37:19 -0000
Content-Type: multipart/alternative; boundary=001a114a88c8260306054417f97b

--001a114a88c8260306054417f97b
Content-Type: text/plain; charset=UTF-8

On 19 December 2016 at 22:12, Khem Raj <raj.khem@gmail.com> wrote:

> its detecting ncurses
>
> checking ncursesw... (v6) yes
> checking ncursesw/ncurses.h usability... yes
> checking ncursesw/ncurses.h presence... yes
> checking for ncursesw/ncurses.h... yes
> checking for ncurses.h... (cached) yes
> checking for use_default_colors in -lncursesw... yes
> checking for resizeterm in -lncursesw... yes
>

checking ncursesw... no
checking for initscr in -lncursesw... yes
checking ncursesw/ncurses.h usability... yes
checking ncursesw/ncurses.h presence... yes
checking for ncursesw/ncurses.h... yes
checking for ncurses.h... (cached) yes
checking for use_default_colors in -lncursesw... yes
checking for resizeterm in -lncursesw... yes

My guess is that it finds your host ncurses, whereas my build machine has
the bare minimum of headers installed on the host.  Can you look at
config.log to verify this?

Ross

--001a114a88c8260306054417f97b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 December 2016 at 22:12, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-st=
yle:solid;padding-left:1ex"><div id=3D"gmail-:188" class=3D"gmail-a3s gmail=
-aXjCH gmail-m1591925ac876651e">its detecting ncurses<br>
<br>
checking ncursesw... (v6) yes<br>
checking ncursesw/ncurses.h usability... yes<br>
checking ncursesw/ncurses.h presence... yes<br>
checking for ncursesw/ncurses.h... yes<br>
checking for ncurses.h... (cached) yes<br>
checking for use_default_colors in -lncursesw... yes<br>
checking for resizeterm in -lncursesw... yes<br></div></blockquote></div><b=
r><div class=3D"gmail_extra">checking ncursesw... no</div><div class=3D"gma=
il_extra">checking for initscr in -lncursesw... yes</div><div class=3D"gmai=
l_extra">checking ncursesw/ncurses.h usability... yes</div><div class=3D"gm=
ail_extra">checking ncursesw/ncurses.h presence... yes</div><div class=3D"g=
mail_extra">checking for ncursesw/ncurses.h... yes</div><div class=3D"gmail=
_extra">checking for ncurses.h... (cached) yes</div><div class=3D"gmail_ext=
ra">checking for use_default_colors in -lncursesw... yes</div><div class=3D=
"gmail_extra">checking for resizeterm in -lncursesw... yes</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">My guess is that it f=
inds your host ncurses, whereas my build machine has the bare minimum of he=
aders installed on the host.=C2=A0 Can you look at config.log to verify thi=
s?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ros=
s</div></div></div>

--001a114a88c8260306054417f97b--
