Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id BD8306C102
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 10:22:12 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t124so15780071wma.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 03:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=AwewCwlgoXvpjC26iw2zcEqCWZhyKcZODHLbPEkUbF0=;
	b=hNJ+kvOQOm9C9RfvSbVJbnSdqij4GBS+IikJTtUWvA2niw4VVqMkxvEHEbF6nka6AH
	dH4YLkYzWvXnBmbu42RqEjcI8044MvXmdX2OEYooRIxbR2evET8Ea7+8tdH7NR9LFTHq
	L7TCP+mghZeyxtqBs4VKM+SQyITsZWopmMOqTGpRitWdKMy2zv8oiR4m+rO65X1r1LWU
	m2w8h5v4WEPAmxm4hlg5rKumXNNv1gCDMrJB54m2uqNy1iDvsZz/wSIw4lx9VHg/XmR3
	b13xa6xO1isB8PF+bednmr2CUAkmjybr85HDSTaF0Teo7jqSUYR7kDgrtSgfIKpdKULN
	ySRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=AwewCwlgoXvpjC26iw2zcEqCWZhyKcZODHLbPEkUbF0=;
	b=ioiESUKwKu16jkdg5WgVsNUAbNokYpCOD6xOje6mctrkKyWaipn3Ziquu6wt0U6eVO
	WwQjAj7ULliYuUvSLUPWXqqFq6/D100WqbyNBO3eG1lSedaBshXRywBWWDQ4N7y/218E
	sO1K4SlI0e9ITA2kSjR2aZ4p5kkdM0W6bOts6ShFJszn7BdSNZEUGBc5hhahVkvq08Kq
	VFtW8HTH6AkKxWGwrNVj4MRK/QVLsDI2BKtpxIQT2Gprq3jvn7v7BLsg1BFT6ysSLXYh
	gO5QyXVVZ8WFTReEmVkzkAxGs0XTFo09/h50S7xHwymYUrPSv2ZozGX7xt2UgCOO4wYu
	wg5A==
X-Gm-Message-State: APjAAAV+SmPnr18BUEmg7M7SJdjMV3v2qw4qQF0qr9Cuyu8amvlofWl0
	tQqhGjAd4BsvxxtE05dpiJ9yFkXFwug=
X-Google-Smtp-Source: APXvYqwvuThyBSV15C97NHn/TJIIK5y50gMoLHyzwMB/opWywmPMScJuUMuPJL2qNYnBM2/VMkgASA==
X-Received: by 2002:a7b:c752:: with SMTP id w18mr2978856wmk.97.1552990933312; 
	Tue, 19 Mar 2019 03:22:13 -0700 (PDT)
Received: from ?IPv6:2a01:598:b00a:dc3f:92c:a996:7b40:80e6?
	([2a01:598:b00a:dc3f:92c:a996:7b40:80e6])
	by smtp.gmail.com with ESMTPSA id
	d16sm8550698wru.49.2019.03.19.03.22.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 03:22:12 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16D57)
In-Reply-To: <20190319085532.GF1994@jama>
Date: Tue, 19 Mar 2019 11:22:11 +0100
Message-Id: <D3413079-663B-47D2-8550-658159790D3B@gmail.com>
References: <cover.1552962581.git.akuster808@gmail.com>
	<20190319085532.GF1994@jama>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/26] thud patch review
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
X-List-Received-Date: Tue, 19 Mar 2019 10:22:13 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

The commit you refer to changes the dependency from 1.1.0 to 1.1.1, so ca-ce=
rtificates currently in thud already needs 1.1.

Alex

> On 19 Mar 2019, at 9.55, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
>> On Mon, Mar 18, 2019 at 07:36:29PM -0700, Armin Kuster wrote:
>> Responses should be made by Wed March 20th 22:00:00 UTC 2019
>>=20
>> The following changes since commit f5a57e939e626a5b7c6de5b51799ca602ed355=
ed:
>>=20
>>  mesa: ship /etc/drirc in mesa-megadriver (2019-03-05 22:24:13 +0000)
>>=20
>> are available in the git repository at:
>>=20
>>  git://git.yoctoproject.org/poky-contrib stable/thud-next
>>  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dstable/thud-n=
ext
>>=20
>> Alexander Kanavin (1):
>>  ca-certificates: upgrade 20180409 -> 20190110
>=20
> This depends on openssl >=3D 1.1.1 since:
> https://salsa.debian.org/debian/ca-certificates/commit/d5e425c8405448e5034=
d1e16ca52be6a10cb3334
> some people might not use new openssl with thud.
>=20
> More detail in:
> http://lists.openembedded.org/pipermail/openembedded-core/2019-March/28023=
4.html
>=20
> Cheers,
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

