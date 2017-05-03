Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id C0B5671B57
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 13:09:02 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id m36so136389233qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 May 2017 06:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f/hYf2k+xNFEZx4e+s75BJd7NY9mCc5/fbSFYpni0Lk=;
	b=AKRkg789xEqJNm++kLbFYJAHZgsOeFfjVsxLM0cEZhszOr6fxwT7+158CzVg/GkFa2
	6ejfFNAEf42/eTo/6rBslvHYbaP1Ij8FzSTOs8ksYRYfXdcppoisIwdmZ2Ip8IQ2gHeL
	c0X8LM76c31S0U/MuqGW9Ppx+WfprSWMOxaOLi5yMb+fND8NHMeGfBYK3ZyFqF7jKkIH
	e1zKzX+1p6dnRVDrIhuPRtMoFXuRhCBcUynCQunFr1OyHHPOV6yUhhIG0jvBD0JKuPBw
	YML8a7FQVjPfvpKDYybgPMxJ8Fxtiyuk4AdZg5ax7CgYY0gnPrOdX25JBKNQZ1Hd7i1w
	nbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f/hYf2k+xNFEZx4e+s75BJd7NY9mCc5/fbSFYpni0Lk=;
	b=hLPWHgWmOaPxcZTNo+HohMPRDA5dA1YpNhRplERclFUY1nfp2nQSSHhCG+hOYMnJTe
	qV839zcCGxZd5MsU8mHRU89oUQptvtDB6YIXv7vtgMP8Bp1gWZk1emik+rbs4Uq5/el0
	sEj/sTlsmguKH9mET6YZW2B2w9ew50xBw8AVc/byYGxwzvNPzuuvWoEU1nNdgNvveerM
	IM30vhbSgCJHaXRzQwrV1L9qLAhehY+Th1xSdG009teGDaRtigUFFBfeBGobGptQs/LN
	zQr30eWDeZpmYRl4aCFEnbaG7CpphB8ONazvYyL2EBQ7M4sz7NiGN6IK+hpHr0ng4JP+
	mt9w==
X-Gm-Message-State: AN3rC/5tEw54vZXPBvB18AkDIcsIHuI42Q/LlayrnV1ydlXxy0B+7hz9
	md/Z2+ezJO3btFwvQz3Iv6loGqYU1n+r
X-Received: by 10.200.46.26 with SMTP id r26mr34040418qta.197.1493816943831;
	Wed, 03 May 2017 06:09:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.136 with HTTP; Wed, 3 May 2017 06:08:43 -0700 (PDT)
In-Reply-To: <bb19f2d1d316485322c8962224ddafdf20cb04bb.1493815193.git-series.patrick.ohly@intel.com>
References: <1493813847.4241.251.camel@intel.com>
	<bb19f2d1d316485322c8962224ddafdf20cb04bb.1493815193.git-series.patrick.ohly@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 May 2017 14:08:43 +0100
Message-ID: <CAJTo0LZNYYvckGiHC_ouva5f5WN-7YPmBfBWmgWinfmo4N7+AA@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] QemuRunner: avoid tainting os.environ
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
X-List-Received-Date: Wed, 03 May 2017 13:09:03 -0000
Content-Type: multipart/alternative; boundary=001a114708cc4c0275054e9e5c7c

--001a114708cc4c0275054e9e5c7c
Content-Type: text/plain; charset=UTF-8

On 3 May 2017 at 13:40, Patrick Ohly <patrick.ohly@intel.com> wrote:

> +        env = dict(os.environ.items())
>

os.environ.copy() seems neater.

Ross

--001a114708cc4c0275054e9e5c7c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 May 2017 at 13:40, Patrick Ohly <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":12e" class=3D"a=
3s aXjCH m15bce544d7464e79">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env =3D dict(os.en=
viron.items())<br></div></blockquote></div><br>os.environ.copy() seems neat=
er.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ro=
ss</div></div>

--001a114708cc4c0275054e9e5c7c--
