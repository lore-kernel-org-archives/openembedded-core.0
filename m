Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8BF8C60123
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 14:59:56 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id v138so73911708qka.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 07:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G+s7Of5EuoQ/XWHcZ1YwFRs7wigPsfgBybwwiQu/ktM=;
	b=SPQjEtXqUCG7tAm4NgGjyHejLAmJ2t6oSDBybCnwcFCuNahc81dE9VG/a2x3nLq660
	D3LHeFacqEyNjxrBZ67hN7WRvqcoSMrIEX2oqxiRum4KbMp6yPoOoCBBDx7yusrw/6M4
	iuVqpm04T8mqHY9aleXbx/ByjD0zSYMDRtN7DYWesyEbN6CUSS0a1IRlvZiJXJk+ydis
	HhvQBncO6Ocq7WPdJyMP4DfEJTRYOfylcAmp7MC4VJ84dJp09OdEMhx+TtPUf7URPtNZ
	3D1N5kBnKYcwm/TK9FKigmvCPXaROjxdaDAYoghAk/Fm2lA+V2yjCL+U4oJ/ryhXe4IR
	o14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G+s7Of5EuoQ/XWHcZ1YwFRs7wigPsfgBybwwiQu/ktM=;
	b=DfuLmzAAD7jUE326dxivhsFYHckiCSFvb9zT6ynTbtw+OCtzxfmpyHV6l8wzpdKbBB
	xS6GUQfoH5iz5Eg0pGrHT6xMt05XcmRXS17Iaq6NMvQ6T7j2XORpQpGPl5kNjmulLdIw
	qmvfTnFlTGUgp9GaeGIXm7FjYFg/kuUsHhPxVLa6JxpITQ9u+kLEA7CvajJ0js+xkNz/
	LHeXmW1izk9DX/Y896RBGdOJgvf4+lUvFKia1T4SVKdTGFHqGmlzTLVFXs2ny3zcwF9G
	pBCFMG1XPzmdViYDxvQuAbRTQ2yoyKnHpIH9M4KJeTSmNwpPlHa/9wFcu/Y9mth0mqNZ
	36og==
X-Gm-Message-State: ABUngvc/Yav4AsDromoGMiuu7QDy6BC74/sh3CTGFrXuw7wI5yLV6GVpvh1AaOecmSEoMr8PDE2NDJxHbgHBT/bc
X-Received: by 10.55.215.6 with SMTP id m6mr23438604qki.244.1477925997152;
	Mon, 31 Oct 2016 07:59:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Mon, 31 Oct 2016 07:59:36 -0700 (PDT)
In-Reply-To: <7cf154dd-ce37-d648-4f56-636e82a197c0@denx.de>
References: <20161020133514.3403-1-marex@denx.de>
	<CAJTo0LZeox5Xe6hpnH82JZLaMb1_LtuUjKpcZtmcLOAOnosSUg@mail.gmail.com>
	<016763e0-b2cb-0c2c-f0d0-219da1c1faa3@denx.de>
	<20161025183239.GF2494@denix.org>
	<83c5347a-3962-7b3b-30d3-d5ee876fc2aa@denx.de>
	<5811E899.6050000@phytec.de>
	<ae855dd3-d95b-8616-8b6b-a3cf1f0a5275@denx.de>
	<20161028021134.GK2494@denix.org>
	<c53d058c-c4f9-ac6f-8a55-bc3d78c180a1@denx.de>
	<CAJTo0LbtQGRnE_ET=1joJKk2V70UF=uK10TfCv=WLSbnT7BAkA@mail.gmail.com>
	<7cf154dd-ce37-d648-4f56-636e82a197c0@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 31 Oct 2016 14:59:36 +0000
Message-ID: <CAJTo0LZoN5QRB3pg0+kP0_tQqJ_WTzZuaH_FA-ijDtoY+mYHPg@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] u-boot: Update to 2016.09.01 release
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
X-List-Received-Date: Mon, 31 Oct 2016 15:00:00 -0000
Content-Type: multipart/alternative; boundary=001a1149dcbc10c05405402a76ac

--001a1149dcbc10c05405402a76ac
Content-Type: text/plain; charset=UTF-8

On 30 October 2016 at 18:18, Marek Vasut <marex@denx.de> wrote:

> So the simplest test would be to do the build of native u-boot-mkimage
> on, say, centos/fedora ?
>

No, a build on Debian (I've just replicated this on my own debian build
machine).  Literally just "bitbake u-boot-mkimage" fails to build.

Ross

--001a1149dcbc10c05405402a76ac
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 October 2016 at 18:18, Marek Vasut <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:marex@denx.de" target=3D"_blank">marex@denx.de</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div id=3D":1kd" class=3D"a3s aXjCH m1581=
6d1bd6106c5e">So the simplest test would be to do the build of native u-boo=
t-mkimage<br>
on, say, centos/fedora ?</div></blockquote></div><br>No, a build on Debian =
(I&#39;ve just replicated this on my own debian build machine).=C2=A0 Liter=
ally just &quot;bitbake u-boot-mkimage&quot; fails to build.</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1149dcbc10c05405402a76ac--
