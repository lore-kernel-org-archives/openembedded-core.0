Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7F39A6FF73
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 10:13:18 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id n189so84388905qke.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 03:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=C+l4i5rGT+2p0J2duIRAwuDZ3dlV1mrEcNXc12GZV10=;
	b=xqpOWUQM4wGEBe1RRPh9Uxcp8KdCmPKD425sHv/mFFsSrUBIbkWTyXk0CpNRGekCsR
	dteUncjLugviDWRNsBPM6Cn3yMpcCdtBXdGDKK78NQMD21/e5kfmHLKi2/fqL9RUK1uK
	majwH+bpBjQBOzEbCP9HN8qs4hPCpd5K25dtqLtqXtGsj5j48ldEHSEj5zPI135FXsSz
	B7vnq1aKDHuNk8JXbqKKO+3YhZEanVWca7xv84xqXOjLm+ZG297V2FxHQbehcPYBaFbb
	Ri/VdrW/kNxw1hzYc/4G/k/m8mnlQYWW6qBGV6K0aloLPT85FbDDTuT2L9PbNFDEHEXY
	fB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=C+l4i5rGT+2p0J2duIRAwuDZ3dlV1mrEcNXc12GZV10=;
	b=N5+JyGCHwcABak1/PPhf3XAL7v+y8PcViCr67lMRf45FT3om30NnZ6IO6uNYRmykG+
	3TGX0y5Gz1uULzF11o+mlXz0/GG/DIIm8uS/qEgQZv5O48PrUOgB4WpSdkwFz9M54XJU
	H6yjd4N9If0gVQB+wzqtsCkSm9/9cZewnlCLG9dbApuOyx3dpOCe4DTJBn65wJiPX7zF
	+EIJ13nfUV6lpb5jBgm5urV2WgZUi11824q9WhRdMW9/5T0lfaoWjWpsTBI+xaBFgyaD
	g8JAr6M0D+b2rG6/a5TCOIiijujvoGqgXd32FM0+QBVJQbi7GnvWdTbVjQhRubtBrr4u
	54ZA==
X-Gm-Message-State: ABUngvf3x2f6RvKTkOn5eqD7SKJAPUqdw2hItPViCq2ks7bCIW7E4wpOBQPW+nl78dYfEyjXw7PT2mZeaQMMfnKI
X-Received: by 10.55.198.132 with SMTP id s4mr7847741qkl.221.1476958400411;
	Thu, 20 Oct 2016 03:13:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Thu, 20 Oct 2016 03:13:00 -0700 (PDT)
In-Reply-To: <3e990c83-4b72-10a9-e7ce-4c5f014f12a4@denx.de>
References: <20161018215513.2873-1-marex@denx.de>
	<20161018215513.2873-4-marex@denx.de>
	<20161019201021.GP2494@denix.org>
	<26a26c16-7eaf-70c3-698e-164bdba67d8b@denx.de>
	<20161019211532.GV2494@denix.org>
	<CAJTo0LbWKZ1Ob1pQdUm4L4sLJX=CKDNifwHJpKSY_UVXoo-6Rw@mail.gmail.com>
	<3e990c83-4b72-10a9-e7ce-4c5f014f12a4@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Oct 2016 11:13:00 +0100
Message-ID: <CAJTo0LaqYfAtkKguHX39Pdqp97S58aWKW5+eWvimrCEWu8Wi0Q@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] u-boot: Drop PV altogether
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
X-List-Received-Date: Thu, 20 Oct 2016 10:13:19 -0000
Content-Type: multipart/alternative; boundary=001a11438fd0ce0f33053f492c3d

--001a11438fd0ce0f33053f492c3d
Content-Type: text/plain; charset=UTF-8

On 19 October 2016 at 23:53, Marek Vasut <marex@denx.de> wrote:

> OK, snap. Can you pick 1,2,3,5 so I don't have to resubmit them ? They
> should apply cleanly and they are pretty orthogonal from the 4/5.
>

1 is standalone and I've merged this into ross/mut already, but 3/4/5 are
all basically fixing problems in 2 so I think they should all be squashed
together.

Ross

--001a11438fd0ce0f33053f492c3d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 19 October 2016 at 23:53, Ma=
rek Vasut <span dir=3D"ltr">&lt;<a href=3D"mailto:marex@denx.de" target=3D"=
_blank">marex@denx.de</a>&gt;</span> wrote:<br><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div id=3D"m_-2891892708019812612:6su" class=
=3D"m_-2891892708019812612a3s m_-2891892708019812612aXjCH m_-28918927080198=
12612m157e00a4e5629710">OK, snap. Can you pick 1,2,3,5 so I don&#39;t have =
to resubmit them ? They<br>
should apply cleanly and they are pretty orthogonal from the 4/5.<br></div>=
</blockquote></div><br>1 is standalone and I&#39;ve merged this into ross/m=
ut already, but 3/4/5 are all basically fixing problems in 2 so I think the=
y should all be squashed together.</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a11438fd0ce0f33053f492c3d--
