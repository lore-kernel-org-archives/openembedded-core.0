Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id C528972F87
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 22:35:25 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id v127so7938225itd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 15:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NQUI8gUbTk9apBolPtKdWHROfLxst/0tkawsJLYUDoA=;
	b=RS8HwkF03pG8KvEDNnpIXtD6vseFXY9fvz/FHoBwe3Y9dKaan/NtsUQCY5Ef1k2ywQ
	EOa179mw2bsNBpESi+PhOYgECX+Zu2T44jEWpkbiowTzBfmUplXdFm4KzfqWFll2b7qU
	uTnKNE2fLWNc9vOakHDcfX2zB8irTKBArMITOd7Xo0XMgGab3sG2VSiQJN/byu0YcGFZ
	b/lx6IA5bGujmMxdV6svHDo6bX3cV7Vqq+9lp4H1X5ERtJFD6YEgHJyBTtKPv8U3hI2X
	fmUcCGtzTf/OmkrHs+patD9noWPOA38yI6e3TYO5BYaDqKIEeI+YMTJ4AfT4uWaOffCD
	0Fhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NQUI8gUbTk9apBolPtKdWHROfLxst/0tkawsJLYUDoA=;
	b=qcuRSvSkxMU7hxMAr8OGbaXHsLEF+re+pZlsRd9M+KwX3bHXqEreACuLBn+Xt00h83
	GTjE8uuI7ThLFSyZSAKUm+JRIDU/23a3ghTeFcQMgVHjtKEXBzG8ATGite9qD6tVcrq6
	LHL4geql0sorOcv+iLKNzk93+Szh1tHCKtiDomdN2euvn2xCNlMmshGG8BaKFfr2XtBy
	cuM2mEWR3cf2JlesxC9WVdte8ENKfP4atest+ZTUP9KXC/YEJ34EngQWo25LC+hME8Us
	9TpVAN2fltQi43a8+vGGuKLoKesGH07m34Wc1z7MwSZvq6aAclUjDGmJQZccR4nq/H/g
	sjxA==
X-Gm-Message-State: AIVw111jSfvqUztfiIMoq71K6LRiFR0GW9qlMWKpd7f+orXXsporHAoe
	UduQ3BJhwbt6+ARtTVTwUlwRGC9xQd01
X-Received: by 10.36.218.3 with SMTP id z3mr1400241itg.116.1500503726929; Wed,
	19 Jul 2017 15:35:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.178.143 with HTTP; Wed, 19 Jul 2017 15:35:06 -0700 (PDT)
In-Reply-To: <CAMKF1sop5dtZZ101eCSS=a7Sb1e9nz6sKXsPYNLDqa19MCj=ag@mail.gmail.com>
References: <1500417901-4667-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1spivq5cRcMDz-uehbqWRUzXyJf6TQ53sOtmFJu+_i1iqw@mail.gmail.com>
	<CAJ86T=XT9yufogwxMbV-0dW1ooYdvy5DOequ_X4fRQ7=nFWdOQ@mail.gmail.com>
	<CAMKF1soRVeHPLh_LFSxpcGG=1u1OcKvMv3yEifihP_Y7Y-eXUw@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B6119BDF6B@ORSMSX112.amr.corp.intel.com>
	<CAMKF1sop5dtZZ101eCSS=a7Sb1e9nz6sKXsPYNLDqa19MCj=ag@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Jul 2017 23:35:06 +0100
Message-ID: <CAJTo0LZRBNbU9-QmJ_ufVK3QFeHjXOMoj2G0hgnp+2eQk_82Jg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-7.inc: add new warning "Wnot-cross-compiler"
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
X-List-Received-Date: Wed, 19 Jul 2017 22:35:26 -0000
Content-Type: multipart/alternative; boundary="94eb2c0b0ad6a0d2400554b33f0a"

--94eb2c0b0ad6a0d2400554b33f0a
Content-Type: text/plain; charset="UTF-8"

On 19 July 2017 at 23:32, Khem Raj <raj.khem@gmail.com> wrote:

> it solves x86 specific issues alone
>

It solves host = target issues, so if you're building for ARM on an aarch64
server you can have the same issues.

Ross

--94eb2c0b0ad6a0d2400554b33f0a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 July 2017 at 23:32, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div id=3D":1n6" class=3D"a3s aXjCH m=
15d5cfc982cc3496">it solves x86 specific issues alone<br></div></blockquote=
></div><br>It solves host =3D target issues, so if you&#39;re building for =
ARM on an aarch64 server you can have the same issues.</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c0b0ad6a0d2400554b33f0a--
