Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id F3DEA71B45
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 16:49:07 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id a20so80818878qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2017 08:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mHx+6Xsly96IVilIZGA8zQUKsN6YL85ma+jEPsBbzlY=;
	b=i05SyA2zhmfjjrueWG/RNwR3GI7T50O9CQuqR0T6JH+oRLYytZ/tD51A+txL1Bu497
	nFjpBQ6j20eyaqmAuFY42XmHtHTvU9ra0u4xXCw2aVNpjF+N0k8D/5837w+2rDqzOScL
	Z6xPmjq0i3646KXu5T3QYm2PdgcAXp+6PAc1d7VOTxYrQR04y0Lglqrmi55tztWQDhoy
	BlYGA5vHpIA3xLwq0v2M28e8al+lPtCheugmde3eEOCeU3owARq9qBTh+66FUlJX9nU2
	s26wrGF2QOpf3HkvZACzgCFJQvzMEHPhVVCL8klWZWRbaDknJ0znH+FyVus2FGLE9P71
	HUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mHx+6Xsly96IVilIZGA8zQUKsN6YL85ma+jEPsBbzlY=;
	b=FIjNGAU1JQ8N1EqbRaFIfNAaFUiXaafRwYGlpvtwSJdn3QyHc6gyTdHwImI9O/6yle
	sT4RCshyZ7qXV863r86aYvzVkinGORjERFetBwQII7/jCLRIoeu8yYLdlGMF6e0/1YcG
	anbx1KwdKRjRvzvtcTNZP0uYHRpgCXak/e5c4Plr7L65ir5J3RLTEo+5pIsuqMLJOeKT
	SEqt0h0tCJ92ztHYfJRv8HuUr1FPpDtTI7S4X9F/wPGnH24oKYLEXdcwnPm8Jl7k1F8D
	m22IsojrBEd3zYYvif5QZnjKiqkYEeLiX4vyEft7JCdCuR/Y9XDDCkxv7Jw+YIVAq47E
	PAiw==
X-Gm-Message-State: AIkVDXJat1TQwyeJrPjeT6R5pSEMpz0PEsklvsCYCVZezRtHqt6QvHViYOru4EDHG/USJ9OcjPvIVi8j6exBhnea
X-Received: by 10.55.31.24 with SMTP id f24mr73084114qkf.221.1483721348455;
	Fri, 06 Jan 2017 08:49:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Fri, 6 Jan 2017 08:48:47 -0800 (PST)
In-Reply-To: <CAMKF1sotQbOB9TMCDqa8cNhiD3QsKdgrQmVzHcw=yCbywzeROQ@mail.gmail.com>
References: <20170103015528.29635-1-raj.khem@gmail.com>
	<CAJTo0LYyvqUP+gE=mcbkgF9u7ZEqDPEQL15=M6gtr=AtKL33tw@mail.gmail.com>
	<CAMKF1sotQbOB9TMCDqa8cNhiD3QsKdgrQmVzHcw=yCbywzeROQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Jan 2017 16:48:47 +0000
Message-ID: <CAJTo0LYXVGGnC5XtTA-LDE9oRLK0693xvBnE=11ab+KczbE1hw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: Upgrade to 1.1.16+ on master
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
X-List-Received-Date: Fri, 06 Jan 2017 16:49:11 -0000
Content-Type: multipart/alternative; boundary=001a1147e2baebe6bc05456fcbc6

--001a1147e2baebe6bc05456fcbc6
Content-Type: text/plain; charset=UTF-8

On 6 January 2017 at 16:44, Khem Raj <raj.khem@gmail.com> wrote:

> I think its the kernel 4.9 headers thats causing it not musl. Do you have
> that
> patch also staged along with this ?
>

Maybe. ;)

Ross

--001a1147e2baebe6bc05456fcbc6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 January 2017 at 16:44, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div id=3D":lw" class=3D"a3s aXjCH =
m15974aba9b304c3c">I think its the kernel 4.9 headers thats causing it not =
musl. Do you have that<br>
patch also staged along with this ?<br></div></blockquote></div><br>Maybe. =
;)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ros=
s</div></div>

--001a1147e2baebe6bc05456fcbc6--
