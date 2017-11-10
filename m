Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 944DC7866D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 16:23:48 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id f187so2283660itb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 08:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Pgy7JHaX3b/XNJMD4KsFwdf27VnmWSWbbA45oQPJP94=;
	b=H0xI7oI94uUPGkh7tw4Lx2a91rQxJFM3lb7coarWAejxWlidWyp/O+QxtOcTPowaAN
	ct0Avn3Syey/Y1TJFxS83UxGYPV0A9Zuk9nQOkfUMUMh+IvL3eoyAf4J04gGfFZh1nWY
	URaYsXKrpjDEMlPRyOLEkwQIFmDcG8rzVVOiOnjzTU0pkK7IZdGegxmfYdiVq4KQ7DTu
	C7Fn+Q0ije34GuDGMHUbU0LAPp5azQn6sGnDkMRwpMNbkOIVmR9+f9dsZhHBmLKPZH6M
	eK/Vnf12STEqb5oSOzS9uusqIpS+mCGPDZwPu7OptdCEu7iUtQHyVVHGgPVCQDxb95UY
	Vcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Pgy7JHaX3b/XNJMD4KsFwdf27VnmWSWbbA45oQPJP94=;
	b=gEuZqcB930KIOcWo/xOdMJ2LDCapACshvVYFp4bqnquAj613JgFhCyrYPAIGBT/POT
	T38TsfPfB4a3km7oji1c8Hwrl3AC7EsZkvco2+S2qbDU/3elv3WGHWf+AeoZgBS7Rr5S
	aUFTOpAc0GbARz4y75oyUUGf9xsYc4435gx0/idSa+TAHdygBIAAfBSttbBe/CUxGaeM
	UN5ytiuCafCnLA9E6KNpQUePRDzT/5QAKe8SmxS2VGrTKDq+7ARPVrpoRS6X9MnGJOby
	tJcnAQB++HPG5zIe7ml6dGpNJqjjCUfSI9ZZIsbyPEiCDjSuUI98x/SDQEstznPrS36n
	i7JA==
X-Gm-Message-State: AJaThX4EC1DoEB/gYlQIoaP2vdpY5mBbmDHcmtaFOyxtd7wBuy+T+LPG
	rztEr1llKTh0o1r3jdQJN4B5kgl6y9u+/JV05UmBJA==
X-Google-Smtp-Source: AGs4zMamrFbs8I3B+A/aFOncVU1aFxHuTM23gwrzHg9gSdAFzuYxWFvNqIoPG+K4BglurvdmQYtqdt0dy9eK1exsZZc=
X-Received: by 10.36.125.76 with SMTP id b73mr1116208itc.10.1510331029875;
	Fri, 10 Nov 2017 08:23:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Fri, 10 Nov 2017 08:23:29 -0800 (PST)
In-Reply-To: <bc025692-5c78-739a-ba9e-41f070f07f95@advancedtelematic.com>
References: <20171109140310.659-1-patrick@advancedtelematic.com>
	<CAJTo0LYvfRJ_Abmp=jcUPhjJjiJ8PPx2mnV08b83MR_xpAwiAA@mail.gmail.com>
	<bc025692-5c78-739a-ba9e-41f070f07f95@advancedtelematic.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Nov 2017 16:23:29 +0000
Message-ID: <CAJTo0LZ7T0DxpgCcjmdsb4D0y6n1UhNv4n58Kv-L-9EUdGMqDQ@mail.gmail.com>
To: Patrick Vacek <patrick@advancedtelematic.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ca-certificates: Add /etc to SYSROOT_DIRS
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
X-List-Received-Date: Fri, 10 Nov 2017 16:23:49 -0000
Content-Type: multipart/alternative; boundary="001a1144417487a1fb055da35837"

--001a1144417487a1fb055da35837
Content-Type: text/plain; charset="UTF-8"

Yes, please.

Ross

On 10 November 2017 at 16:22, Patrick Vacek <patrick@advancedtelematic.com>
wrote:

> On 10.11.2017 17:05, Burton, Ross wrote:
> > On 9 November 2017 at 14:03, Patrick Vacek
> > <patrick@advancedtelematic.com <mailto:patrick@advancedtelematic.com>>
> > wrote:
> >
> >     +SYSROOT_DIRS_class-native += "/etc"
> >
> >
> > ${sysconfdir}, surely, to cater for people who change the paths.
>
> That does make sense now that you mention it. I naively followed the
> literal advice from here:
>
> https://www.yoctoproject.org/docs/current/ref-manual/ref-
> manual.html#ref-tasks-populate_sysroot
>
> Shall I make an updated patch?
>
> Thanks,
> Patrick
>

--001a1144417487a1fb055da35837
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, please.<div><br></div><div>Ross</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On 10 November 2017 at 16:2=
2, Patrick Vacek <span dir=3D"ltr">&lt;<a href=3D"mailto:patrick@advancedte=
lematic.com" target=3D"_blank">patrick@advancedtelematic.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 10.11.2017 17=
:05, Burton, Ross wrote:<br>
</span><span class=3D"">&gt; On 9 November 2017 at 14:03, Patrick Vacek<br>
</span>&gt; &lt;<a href=3D"mailto:patrick@advancedtelematic.com">patrick@ad=
vancedtelematic.com</a> &lt;mailto:<a href=3D"mailto:patrick@advancedtelema=
tic.com">patrick@<wbr>advancedtelematic.com</a>&gt;&gt;<br>
<span class=3D"im HOEnZb">&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+SYSROOT_DIRS_class-native +=3D &quot;/etc&quot;<br=
>
&gt;<br>
&gt;<br>
&gt; ${sysconfdir}, surely, to cater for people who change the paths.<br>
<br>
</span><div class=3D"HOEnZb"><div class=3D"h5">That does make sense now tha=
t you mention it. I naively followed the<br>
literal advice from here:<br>
<br>
<a href=3D"https://www.yoctoproject.org/docs/current/ref-manual/ref-manual.=
html#ref-tasks-populate_sysroot" rel=3D"noreferrer" target=3D"_blank">https=
://www.yoctoproject.org/<wbr>docs/current/ref-manual/ref-<wbr>manual.html#r=
ef-tasks-<wbr>populate_sysroot</a><br>
<br>
Shall I make an updated patch?<br>
<br>
Thanks,<br>
Patrick<br>
</div></div></blockquote></div><br></div>

--001a1144417487a1fb055da35837--
