Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id B106073180
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 11:53:19 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id l127so6918905iof.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 03:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=UjEHQ+D+5Yi2wi6WDq9QrDfRU4tRgugs+Gbb3TcufYM=;
	b=1kMJm99WhJFeGV6PWWal4IHJf5P8tFUGU+chafxz2CfsJYbJO0OVggVEAfjXgYnTa0
	OkhNfOkRLvsDz08gcFAP/eFuy02z9E/wUvqSMZFbqjDWDx8K1Cyj84OI4BCNvi1Ev14N
	iOGqtuAtYUGcVbHJF318xLwJfYJvSpHdI82e11eVEN3pmG6in0X93I25HCS8VbhD0GNu
	GA7AavfCdJYLwSPXr1Z0iJU1m5uW0tdd2VSkFD2W5/rk7O6/Om0FWwOwWE0XQ0p2abeX
	4pjI9G7GP6+tY8F4wwKFt3lFxGSDVnRGUl2Jp90lUjR9Prh6nr4hwaqfAXL/FvFtTy29
	VRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UjEHQ+D+5Yi2wi6WDq9QrDfRU4tRgugs+Gbb3TcufYM=;
	b=JOJArvCeSVTARrKeiWKf9yHsbGHLprcJFfmlgrpLNA0MbgCPoSz7L4uJIhz230t5kb
	S+98fBXVXAA86cDQ1018a3gqZ1Jv0zFD4TeQDFIgMu8F5HI2qvGF2R9UbJKpeovqhhJH
	BP0aj5YiEOp/twQELU8uax8mBwPolV08Xmaym9oc7FuJkTbyCJFaSlf6yZrpTrLHv281
	QD7Dzd43yvvmEwSlKjOitS//2xFW7sHstFuUBdEl8ssWJNigJkKZ0XOKinkXfESSi9b0
	/Nb1RIfuaCWwtDG0IyRRN2SknFUOkK7XHdwa8Dae31wzVvWTg7zZS32cVjHAt6AdWJQS
	SKtA==
X-Gm-Message-State: AG10YOQ+Ra4hrLyaU9pm32gDXXUukFsjSI8RwRyaZOP8aoJF7OEPCJSt7N8E85DWky09fGqsyc4VwhLyBi8Rog4A
X-Received: by 10.107.137.92 with SMTP id l89mr21692881iod.133.1455018800579; 
	Tue, 09 Feb 2016 03:53:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 9 Feb 2016 03:53:01 -0800 (PST)
In-Reply-To: <1455017471-6682-6-git-send-email-marex@denx.de>
References: <1455017471-6682-1-git-send-email-marex@denx.de>
	<1455017471-6682-6-git-send-email-marex@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Feb 2016 11:53:01 +0000
Message-ID: <CAJTo0LZ7fpKqnuyzWmQ02dw5DnKS4+XBbAEx=nNmZDi-Fq6+ZA@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] liburcu: Add nios2 support
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
X-List-Received-Date: Tue, 09 Feb 2016 11:53:22 -0000
Content-Type: multipart/alternative; boundary=001a113ebdb4c01be3052b54f673

--001a113ebdb4c01be3052b54f673
Content-Type: text/plain; charset=UTF-8

On 9 February 2016 at 11:31, Marek Vasut <marex@denx.de> wrote:

> -LIC_FILES_CHKSUM = "file://LICENSE;md5=0f060c30a27922ce9c0d557a639b4fa3 \
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e548d28737289d75a8f1e01ba2fd7825 \
>

Why did the license checksum change?

Ross

--001a113ebdb4c01be3052b54f673
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 February 2016 at 11:31, Marek Vasut <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:marex@denx.de" target=3D"_blank">marex@denx.de</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div id=3D":eu" class=3D"a3s" style=3D"ov=
erflow:hidden">-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D0f060c30a27=
922ce9c0d557a639b4fa3 \<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3De548d28737289d75a8f1e01ba2=
fd7825 \</div></blockquote></div><br>Why did the license checksum change?</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</d=
iv></div>

--001a113ebdb4c01be3052b54f673--
