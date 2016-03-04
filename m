Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 04BF8731F1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 08:56:17 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id g6so6588049igt.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2016 00:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Zj20sHd2vMT1nqmB7fC0EzNtW2TZEHGVN4R/V3wxDqw=;
	b=fRhzdgMh/p4/igVaKrcsbbVUz3iV1Vo9jX0K7ikQHhw9dzdiCOLtmSLMVfakGOIHQI
	0E6P3o7W7/ZxeNEM7m26xCO5V7lx7TOMQESuKG5pLbVkXWhNHE/8PHUOp6ECF4hiwONn
	5ipZGj7v0E7vtwcXeKCyc4zoD/Ebjw2MKYOUuMlY9sE/BvERaljJDN1oGwcR8cKlfz8/
	dfzcnY18mj2fscZ301SPCganJiTgi1RokgwMpw95OysQsdKSRvKUV8pVBv8FpfVA9C7S
	Bzh56VY/fDfMBQLRYg1/IiVqRNvfkMi12ymqHN4jFg1tcAtuqOQAEeljOkZKbpOQ32KX
	421g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Zj20sHd2vMT1nqmB7fC0EzNtW2TZEHGVN4R/V3wxDqw=;
	b=mBMuU09K00kN1XfcizIT0wWzzGj02lrcovGks/hT+55p/GE3pAyea5z1jtYXjq+1qG
	ps9GB1N9SkUN8XtoRbkEN7/FNAa08dMm77e+sJ3rUYOwTs6lU3yR52PGQVg0rZ6NTTOo
	6zj7pj0iInXovcMAVb4iq9D1Cl3ahA6+B31e5V+vmBzKrz4xB+etepLNNJHwaYIsqAhR
	0RLNxzayRD9cdZdstlqTbPc+xk1IoG488+1DOPNNdJts530R4pE1aOw2B9FttyeGKzt4
	eh0L1XFTna6IgGLKqpfAWYwp2MSd7NEkFFYyubIfTOmV6wzsx3BIGlEAhX5xrtohCcZv
	GQ/w==
X-Gm-Message-State: AD7BkJKCxokfTfiIuPyjXOe6YRO/ICRz7FMXS/w9jeNadKYSYrZgM+3WEKtKbPGJlJKKSZV0pmup2HnL+fN39VYH
X-Received: by 10.50.43.226 with SMTP id z2mr2541060igl.78.1457081777792; Fri,
	04 Mar 2016 00:56:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 4 Mar 2016 00:55:58 -0800 (PST)
In-Reply-To: <25A507B472054F9B9002D68314A7C388@RD3>
References: <AB28D54196164B23BA942EBCF3204741@RD3>
	<20160224141143.GB2892@mbabyjoh-mobl.fi.intel.com>
	<2CD39F82881F465AAD78DBB61BCA369E@RD3>
	<CAJTo0LYMO4C9+rd1NG7mMmn4YfU6vRhuOYni4vvPAugoru=uwA@mail.gmail.com>
	<E744C7D53BB7428AB0FD15C117627D11@RD3>
	<20160226093319.GA4329@ad.chargestorm.se>
	<38408F728A334E9F9A452EFD2448CC8D@RD3>
	<CAJTo0LbAoSeWVikqA4t9vXrbSnoiWwOWwLBLPtGPLwwr7E3w+g@mail.gmail.com>
	<25A507B472054F9B9002D68314A7C388@RD3>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Mar 2016 08:55:58 +0000
Message-ID: <CAJTo0LYqPQDVoKdFPP4onF-V+0fJ3fZU5CAk_ao3QdbgN05RRA@mail.gmail.com>
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
X-List-Received-Date: Fri, 04 Mar 2016 08:56:18 -0000
Content-Type: multipart/alternative; boundary=047d7bfea0f4c67260052d35497b

--047d7bfea0f4c67260052d35497b
Content-Type: text/plain; charset=UTF-8

On 4 March 2016 at 04:23, <winiston@futuraautomation.com> wrote:

> ERROR: Nothing PROVIDES 'gd' (but
> /home/winiston/poky/meta/recipes-qt/navit/navit_svn.bb DEPENDS on or
> otherwise requires it). Close matches:
>

gd is part of meta-oe.  Instead of copying a few files and assuming that
you know what you're doing, add the entire layer to BBLAYERS.

Ross

--047d7bfea0f4c67260052d35497b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 March 2016 at 04:23,  <span dir=3D"ltr">&lt;<a href=3D"mailto:winiston=
@futuraautomation.com" target=3D"_blank">winiston@futuraautomation.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>ERROR: Nothing PRO=
VIDES &#39;gd&#39; (but=20
/home/winiston/poky/meta/recipes-qt/navit/<a href=3D"http://navit_svn.bb" t=
arget=3D"_blank">navit_svn.bb</a> DEPENDS on or otherwise=20
requires it). Close matches:</div>
<div></div></blockquote></div><br>gd is part of meta-oe.=C2=A0 Instead of c=
opying a few files and assuming that you know what you&#39;re doing, add th=
e entire layer to BBLAYERS.</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Ross</div></div>

--047d7bfea0f4c67260052d35497b--
