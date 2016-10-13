Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id D56DA71A66
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 10:35:55 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id z65so79027945itc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 03:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IgdHg4DHAy9A7BBuvJTAFjd2A1FNl0r2VzZpHlHUqc0=;
	b=l5ZpdDL83k1pqZjyS81bpY+bycIVp7fHrYFz079TKU1iHrgJSxN+MmNhLpCQ4/nkok
	nRQRZPiifg8dAaC54qtJclJ+v6eTKYV3a5Buh/IFWpi5zTCQDuuGMU8quUCgxPjfa5OX
	QVcM+bcXnhtJK869gHqiRAIywk09BdY2mL+134Tyoxde4iYJp1DQCiZYTeuo5bFY45a5
	4dz2+wb2kyGai8alenMJgm7dP5SIsdwF6yvCQFywL1AnLZ3jgPqDHGGC+ieWMS9YenEl
	ySwdYciIiIswyhLknZ3uC1SaaiAg1aIMMZjWhWOO4Kaoi8lkQK8v6bL0HEDO+mJ+9J//
	hwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IgdHg4DHAy9A7BBuvJTAFjd2A1FNl0r2VzZpHlHUqc0=;
	b=mT1MjMmJ+QJbCZWKTTiS3+o1pankAaKfVNy9ZAyA0WZ9tB7/Ob/mIOzA4AVD7Q+AGC
	HP3azIuEXGAf36GZq6rApzeXN9rackY5N1Q+hZVyjKSDbZW+Cz0YXsrURHFISAdIxEeF
	vp9VHRKmQSZAjDIxxG2cY56n6bMVR2A6WYXypSYXm6j5p3ir6XKee0GScMQtVx1Al6zk
	SbOWQREgTKrwZwrNNxqZ6jI6nWwByU45vdcASPoa4vDx4xWbU7Pu/5baLQl+stCrlcwx
	VUWxoMKyMuOTRfPd1Bc/jzonWQc4Em/QOZg7ry+/YwI9mZ/+QIc2syfm3uJmIVy0Gsh/
	UdDQ==
X-Gm-Message-State: AA6/9Rl99oNECYjtHHScs8vfmUwMIODiPvn+/xVgwPOBhLJR6KPCaaThupyFbijUKgVrhSCWBJvDoGu6Z8cCTY8a
X-Received: by 10.36.200.85 with SMTP id w82mr6721072itf.29.1476354956626;
	Thu, 13 Oct 2016 03:35:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Thu, 13 Oct 2016 03:35:36 -0700 (PDT)
In-Reply-To: <HE1PR0401MB2682F8CDDB11A504A1703B2EE9DC0@HE1PR0401MB2682.eurprd04.prod.outlook.com>
References: <1476182952-15222-1-git-send-email-carol.zhu@nxp.com>
	<CAJTo0LaiX-F+0ZPeTs8jJ2GxT61WFi1aPYZ76RgUMAKCMiWaeA@mail.gmail.com>
	<HE1PR0401MB2682F8CDDB11A504A1703B2EE9DC0@HE1PR0401MB2682.eurprd04.prod.outlook.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Oct 2016 11:35:36 +0100
Message-ID: <CAJTo0LZ1NdDfTb72cH-vLrE=Q=kW6ksFQ5p7pnA3Tgoj0QZbaw@mail.gmail.com>
To: Carol Zhu <carol.zhu@nxp.com>
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
X-List-Received-Date: Thu, 13 Oct 2016 10:35:57 -0000
Content-Type: multipart/alternative; boundary=94eb2c05a3b4c0a3cf053ebcacd7

--94eb2c05a3b4c0a3cf053ebcacd7
Content-Type: text/plain; charset=UTF-8

On 13 October 2016 at 10:07, Carol Zhu <carol.zhu@nxp.com> wrote:

>       These gstreamer patches are bug fixing and all backported from
> higher version, so the risk is low.
>
>       Is that ok to integrate them into morty?
>
>
Once they've been proven in master and if the morty maintainer agrees, yes.

Ross

--94eb2c05a3b4c0a3cf053ebcacd7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 October 2016 at 10:07, Carol Zhu <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:carol.zhu@nxp.com" target=3D"_blank">carol.zhu@nxp.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><p class=3D"MsoNormal"><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#1f49=
7d">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 These gstreamer patches are bug fixing a=
nd all backported from higher version, so the risk is low.
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0I=
s that ok to integrate them into morty?<u></u><u></u></span></p>
<p class=3D"MsoNormal"></p></blockquote></div><br>Once they&#39;ve been pro=
ven in master and if the morty maintainer agrees, yes.</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c05a3b4c0a3cf053ebcacd7--
