Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 99BEF7C5CB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 20:21:28 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id i13so3485318lfg.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Mar 2019 12:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=wWaUMnmix3I3XgJsfJa3pAvE+JnCb2pyoe4fy6mLXVM=;
	b=WwXJ376qGZ+e2fSFXXRNWV1Bfajr4GLF85N1SdnyWvYgB/7JTg7v+RlKUGKUsXRLNQ
	sQOs3390COd4acuOOfJFyDIQkWzrh+61N/3sEny2alCrtjRBhHyI7CsRYC48+/uypmkq
	HH4fo8NMK1nrhic+gx5z+c1eG3XcfV/RwfQYqUnXge9W7uwUhtaQGNbz20dnun0Dfb07
	70tOht/P30zIUlXdpj/8S9yvazrP1lZCC7bbBTZerj0X0xacTd997rLB8EkA/ev18Apl
	O1YpfWGwH/9wUsJGvqwmUvda6aMuLU+Ddnm9exJXrkG9ousPWe1+yWyxcnZsL93lGY5d
	w/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=wWaUMnmix3I3XgJsfJa3pAvE+JnCb2pyoe4fy6mLXVM=;
	b=aQAopRvrDM6I+HG9hf0zxj/kxJw1SDZrRml80MK2Cy92NoDi9FwvppRpArh9OerOnJ
	b3LLvDaqLFf7fiMpJtFOzmyv8xc+W0Zx9nhXO4LUwai6rFn/xCh3j+1TRx/o+GAHtxwU
	IWwRPDHPwGLEX6RxrtzLk+sVYGPF7k9ICTNfzK7JX8nkqbrDwhZPCLq1AXV5BnbhgTRt
	hnNY0BCCovYH/wBGe6xjadrSU3MJ9794LhWY36l+YhY3p5nMj5uk+hsYTkr6W8JsXWNj
	RXppUIGFt2f7bnC6iPGD6nSRwA+XoWeJLQe/l452cS3S0OF1ngiVRSQtvRX0OW9j374h
	w2Dw==
X-Gm-Message-State: APjAAAWNJCF6AEoZUPXaMU2qFnck/s9UuU3b9LK0m/2vKmjapTuy9Z+I
	4uD1Xr6ExN576cm2anxqIoTJ2PXIxAI=
X-Google-Smtp-Source: APXvYqyeHhFpttjV2ak5Oij/i1BnqDeczggU3/UWnQJCT90/nhhTS1101LyamxITyUp+CyZQ9/43iQ==
X-Received: by 2002:a19:ed19:: with SMTP id y25mr10380452lfy.51.1552076488549; 
	Fri, 08 Mar 2019 12:21:28 -0800 (PST)
Received: from [192.168.1.65] (95-27-45-82.broadband.corbina.ru. [95.27.45.82])
	by smtp.gmail.com with ESMTPSA id x16sm389881lfd.42.2019.03.08.12.21.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Mar 2019 12:21:27 -0800 (PST)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16D57)
In-Reply-To: <20190308193841.GA13393@localhost>
Date: Fri, 8 Mar 2019 23:21:26 +0300
Message-Id: <E3B36DFB-0727-41ED-9494-3997E768A865@gmail.com>
References: <20190308184939.22937-1-bunk@stusta.de>
	<CANNYZj-c+H9zqsj640ef+evBNQbi+6M1XAqJHaqu-_i5dHaxnA@mail.gmail.com>
	<20190308193841.GA13393@localhost>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][RFC][PATCH] Remove openssl10
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
X-List-Received-Date: Fri, 08 Mar 2019 20:21:29 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Perhaps you could grep meta-openembedded for openssl10? I do not have access=
 to a Linux machine for the next two weeks to check that, but I think there=E2=
=80=99s a few items there. Once meta-oe layers are free of openssl10 deps, t=
here is a better case for removing it.

Poky distro images have shipped without openssl10 for the past couple of rel=
eases as nothing pulls it in anymore, that doesn=E2=80=99t mean the recipe c=
an be dropped from oe-core.

Alex

> On 8 Mar 2019, at 22.38, Adrian Bunk <bunk@stusta.de> wrote:
>=20
>> On Fri, Mar 08, 2019 at 10:15:42PM +0300, Alexander Kanavin wrote:
>> This is premature. Plenty of recipes outside of oe-core still rely on
>> openssl10,
>> ...
>=20
> How many and which recipes actually?
>=20
> The upcoming releases of Debian and Ubuntu ship without OpenSSL 1.0.
>=20
>> Alex
>=20
> cu
> Adrian
>=20
> --=20
>=20
>       "Is there not promise of rain?" Ling Tan asked suddenly out
>        of the darkness. There had been need of rain for many days.
>       "Only a promise," Lao Er said.
>                                       Pearl S. Buck - Dragon Seed
>=20

