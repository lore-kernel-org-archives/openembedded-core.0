Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6E42A606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 17:49:41 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id m101so110503853ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 10:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IzHKHifAx2Boj8AZIaz8OMYw27i4CkD1OtHnkd93n+M=;
	b=LCWZHMrK9lw2J8ZNy5NG58sDeeMhbiqs1iaPYy5Rvm8cnIkb8qmHfVJv2me5tRQLaK
	HF2QltAcUMOJkFwz4lx+JVVvX77Mu5ZFuk7A+m5+1ypJ0uSCLIX/CKOsRfZR6cghQuV9
	uNGKz514MfUy4xhIVPHlwUJWrcLyke70iF5s7uRhVDK/Vn8UCoAMOV7tnsbqn7dkOOme
	8xFH947ka9gltQiFr8ZYmoESECYWy874JRmelKbFw8U/8v7fXEjr9o07eHze9kKrQwaF
	QBj4ZV7r5X1rrg/W2ByvgYLNEexOmvFGDNN90Nw8Nneekue/kS5u94Bg16/8pn5ihqpr
	Hh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IzHKHifAx2Boj8AZIaz8OMYw27i4CkD1OtHnkd93n+M=;
	b=GWC3cugWVBZmzszhEXeqeJeFZ0Q+PA3bKq0sHaRXOyI4nTT7Ba8Imbuu3RllctlX8v
	c7N6xZKYSaKsgqlo12GEpXVafDdhvHvQaTeiQs1UCe0U3y2a+BzBdJ6M9ZZpSTasTVVg
	EmpMm9mRj+Kx92W90jvIMGQM224YeKmkUe00CwOlM3qPydhBjQfIFZJZLr7yoQiTHSc8
	xyNInHlGKNao1LRW3SZLksr36HwXbQsAT1hRB/1rTmb/OltwLPJaIOCdLtYLXt2Y7G2U
	ee+f8jEtdlunH4fD68QkFkRSqjmXUfPRnQQUqcg6SVYhr3rkl4q8ULtIP60vzbsGF9VP
	T0AA==
X-Gm-Message-State: ALyK8tJVKocdJyvE7u9x0msKukq3SntQQMuVlmojFwf83jQLsP2jEpckwRMdBBsd9MHoosrRojWDUIN5aJKqemri
X-Received: by 10.107.154.210 with SMTP id c201mr21439723ioe.99.1468604981813; 
	Fri, 15 Jul 2016 10:49:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Fri, 15 Jul 2016 10:49:22 -0700 (PDT)
In-Reply-To: <20160715163633.6854-3-eu@felipetonello.com>
References: <20160715163633.6854-1-eu@felipetonello.com>
	<20160715163633.6854-3-eu@felipetonello.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 15 Jul 2016 18:49:22 +0100
Message-ID: <CAJTo0LaHHZ98dgw9Sj8gAQ2Sz86gDWhxW799X2Y-k7q71UrNLQ@mail.gmail.com>
To: "Felipe F. Tonello" <eu@felipetonello.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] juce: Added support for JUCE framework
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
X-List-Received-Date: Fri, 15 Jul 2016 17:49:44 -0000
Content-Type: multipart/alternative; boundary=001a1140fab641bd970537b03e9f

--001a1140fab641bd970537b03e9f
Content-Type: text/plain; charset=UTF-8

On 15 July 2016 at 17:36, Felipe F. Tonello <eu@felipetonello.com> wrote:

> For TL;DRs: JUCE is a well known and widely used C++ Framework for audio
> applications. It has good support for Linux and ARM.
>

Getting new recipes into oe-core has a high bar.  Why would this be in
oe-core and not it's own layer, or part of meta-multimedia?

Ross

--001a1140fab641bd970537b03e9f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 July 2016 at 17:36, Felipe F. Tonello <span dir=3D"ltr">&lt;<a href=
=3D"mailto:eu@felipetonello.com" target=3D"_blank">eu@felipetonello.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1gq" class=
=3D"a3s aXjCH m155ef6c9bf214fe6">For TL;DRs: JUCE is a well known and widel=
y used C++ Framework for audio<br>
applications. It has good support for Linux and ARM.<br></div></blockquote>=
</div><br>Getting new recipes into oe-core has a high bar.=C2=A0 Why would =
this be in oe-core and not it&#39;s own layer, or part of meta-multimedia?<=
br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ro=
ss</div></div>

--001a1140fab641bd970537b03e9f--
