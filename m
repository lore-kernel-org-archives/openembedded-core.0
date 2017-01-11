Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4954871AE4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 16:43:55 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id u25so598434120qki.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 08:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XKTLN4aQFxIQoxMc56UxFSDMRMDucfNCqXm5PYAnxaY=;
	b=Qvz0IUArABQlGjHmDJr+xYi4FX0N54LbNvWS4eVxw5L4cztpHTI6LEAgkkZwzNFs5L
	Vjy8UylS/XUg5AP4nPDm03jW1RaI47KS/shPspDc/Kl53xsDScNhbVeAIMxtZU8YtmZa
	cx4LkMkf8VWXBQgD/iSGRyTOVU4kRClQBpN7yfNXd4EBIq13gTJECacZL0Ak1CU7Sq1I
	XFYgvJaQf2ftyLEr8acyTXQPG2O0mcP34QYsDUljvFRLbHIdQIlCOxOHJAZYF3lRyYA1
	Kk0r9oUc1LW9H0SjQbtOTFlIGN0FULeKLyExf2VXpiVVCKOt/x/d32VHXdgaE6oRZ6/v
	jaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XKTLN4aQFxIQoxMc56UxFSDMRMDucfNCqXm5PYAnxaY=;
	b=nv9SOrDBdaP8pQDlPdkm6XPWFXr5jR+aeHOaMlzHSoI5n2r2+Pe4j3RBjrO8k93MYL
	QXOIzmNHk9u9amZT5s23GRuQkxE2nishH9x+VrAH2UP844ZYjs4a9WRbN5YY/EuzTR9I
	36EsMhElh8OmvPfaTZfZQhSPJrTHfTaSy3qx5VMy3rALFGpoJqS2oGLcQmjA2Z8xYxhS
	l74WD9uJv3oGfLC1xffKU5AgetP18lo5v8vfhxs0Tj/YrfVTHtDB0NJf6FcsSTPDZcuT
	TCugVK/plYjjvKKDJfTuRohnZG+MuGEimLRSV5nZHiZgIxuAj/ey8ioHyHP83msEiyeP
	odBQ==
X-Gm-Message-State: AIkVDXI+e+XmYBYkcJkY9W3WpF42eGpz0ozG7adeChaWMSgk9qV1CcnhTGJZdpP1n+lko7Q6v+sv6komife3WKHL
X-Received: by 10.55.176.194 with SMTP id z185mr8952027qke.26.1484153036246;
	Wed, 11 Jan 2017 08:43:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Wed, 11 Jan 2017 08:43:35 -0800 (PST)
In-Reply-To: <CAHiDW_FbM2goeKn8ZKY+LZO86tdpgESg8mfR1SiHAsBQRJRbCg@mail.gmail.com>
References: <20170103015528.29635-1-raj.khem@gmail.com>
	<CAJTo0LYyvqUP+gE=mcbkgF9u7ZEqDPEQL15=M6gtr=AtKL33tw@mail.gmail.com>
	<CAMKF1sotQbOB9TMCDqa8cNhiD3QsKdgrQmVzHcw=yCbywzeROQ@mail.gmail.com>
	<CAJTo0LYXVGGnC5XtTA-LDE9oRLK0693xvBnE=11ab+KczbE1hw@mail.gmail.com>
	<CAMKF1sp3bgSVF0+1YLMGtOeQNOVs7XxcM=etkckgbN6-kBvNJA@mail.gmail.com>
	<CAJTo0LbXmAGizX72qZ9LqLUeugoUmb_bM-B8zg-SvLvdwqUaLQ@mail.gmail.com>
	<CAHiDW_FbM2goeKn8ZKY+LZO86tdpgESg8mfR1SiHAsBQRJRbCg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Jan 2017 16:43:35 +0000
Message-ID: <CAJTo0LZW4xH4yahk7tDXdPLueKf0B_PZHgUyYmW37_X6rKwpRw@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
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
X-List-Received-Date: Wed, 11 Jan 2017 16:43:56 -0000
Content-Type: multipart/alternative; boundary=94eb2c060ce684a44b0545d44e47

--94eb2c060ce684a44b0545d44e47
Content-Type: text/plain; charset=UTF-8

On 11 January 2017 at 16:42, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> I did pretty much the same "fix" inside connman (defined
> __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0 everywhere the
> problem shows up) and it works... but should the hack be done somewhere in
> the toolchain instead?
>

I'm pretty convinced that musl's if.h should be defining it.

Ross

--94eb2c060ce684a44b0545d44e47
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 January 2017 at 16:42, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>I did pre=
tty much the same &quot;fix&quot; inside connman (defined __UAPI_DEF_IF_NET=
_DEVICE_<wbr>FLAGS_LOWER_UP_DORMANT_ECHO 0 everywhere the problem shows up)=
 and it works... but should the hack be done somewhere in the toolchain ins=
tead?</div><div></div></blockquote></div><br>I&#39;m pretty convinced that =
musl&#39;s if.h should be defining it.</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c060ce684a44b0545d44e47--
