Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 24C3460765
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 12:26:30 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id j37so22502623ioo.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 05:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FrHJnucx2fHHJEq6qzWerFNE5PcvWUnlYT14+7tAYiY=;
	b=TIqxjMZ4Pw2x3tmcbDzvPw0j0xcQTrZ2ZRatYFmSpvSb4wPSfNkMgmXQkdzokpd2r5
	A6DNyPZriovfkwMPUxaJ76d8V8HEgbrew6hB8QTjW4p5kwP7FHTIXL290NqSOHD+w5Ra
	CbnTb+hjjoH9xnXmKwFkhgkc3nHYWDYi9fxd/H+QP8dMEYig+UXOEgh0e36hicspf3Yp
	VmFzXfsPSej5l7zFJXrq/2VnAFI84bdddlqxtqwbjQoVtkx37wraA7BVGDyNoVlsZj14
	FfX+0MjvIT+vSrV3Nc2cAJD/UTYicTepY4zrFV1BSSYzF3pyaE1P/dkKZzGeZDaTaF/X
	cEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FrHJnucx2fHHJEq6qzWerFNE5PcvWUnlYT14+7tAYiY=;
	b=YCzfFVco6QLtAwQezAeqcc2xEl8VxAC+PBlDA0RZ1gu6IJhsVCheSH4dTAJcR+uCvk
	oP1BgTRRXXx622ld/6YiiGv7Xc8meQ1hbgJN/PsxaolGnwSG0Yl0xL2CQWbj5dle60vN
	NgSiIhmqbfOWpDpoLz1rAWIuAcBV0yL5g4A32bwyJERgkX/gDd64M1XZUD+Jya+wN+dd
	RRe78F8GR++ZSJ1dHCqTSaJENuc5ImYaj5Ue3U0KX8MuIS7dSveGF9NzPwxZq1ZZo2kk
	LIRVNCpI9TaIPn7WvPaRhn4aPJv1RwKvSGvRPLyjJ/ndZjMumn/sDymMB7CEzFfqV1fQ
	tGyw==
X-Gm-Message-State: AA6/9RnIVt40kioMkF07+H0fRw72Z4zQQgbnHhSEBK196Vbly8+TvYi3xiwJuyydYbZyl9qmZ6oHVHrIDfvSsgL4
X-Received: by 10.107.138.15 with SMTP id m15mr5593867iod.127.1476188792126;
	Tue, 11 Oct 2016 05:26:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Tue, 11 Oct 2016 05:26:11 -0700 (PDT)
In-Reply-To: <1476182952-15222-1-git-send-email-carol.zhu@nxp.com>
References: <1476182952-15222-1-git-send-email-carol.zhu@nxp.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Oct 2016 13:26:11 +0100
Message-ID: <CAJTo0LaiX-F+0ZPeTs8jJ2GxT61WFi1aPYZ76RgUMAKCMiWaeA@mail.gmail.com>
To: Yuqing Zhu <carol.zhu@nxp.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH 0/4] Add patches for gstreamer1.0-plugins-bad V1.8.3
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
X-List-Received-Date: Tue, 11 Oct 2016 12:26:31 -0000
Content-Type: multipart/alternative; boundary=001a113feb3c93915c053e95fc32

--001a113feb3c93915c053e95fc32
Content-Type: text/plain; charset=UTF-8

On 11 October 2016 at 11:49, Yuqing Zhu <carol.zhu@nxp.com> wrote:

> -Support video rotation by using transform matrix
>
> -Fix wrong attribute list type for EGL 1.5
>
> -Fix horizontal/vertical flip matrizes
>
> -Fix glimagesink cannot show frame when connect to qmlglsrc
>

We're about to roll RC1 of 2.2, so I think these will have to wait until
2.3 opens for patches.

Ross

--001a113feb3c93915c053e95fc32
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 October 2016 at 11:49, Yuqing Zhu <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:carol.zhu@nxp.com" target=3D"_blank">carol.zhu@nxp.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":5qm" class=3D"a3s aXjC=
H m157b383d2ad8f865">-Support video rotation by using transform matrix<br>
<br>
-Fix wrong attribute list type for EGL 1.5<br>
<br>
-Fix horizontal/vertical flip matrizes<br>
<br>
-Fix glimagesink cannot show frame when connect to qmlglsrc<br></div></bloc=
kquote></div><br>We&#39;re about to roll RC1 of 2.2, so I think these will =
have to wait until 2.3 opens for patches.</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113feb3c93915c053e95fc32--
