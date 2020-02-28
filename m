Return-Path: <brgl@bgdev.pl>
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 263D86077F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 07:12:29 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id f10so1869232ils.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 23:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ePKTf/TizzaW/TmrFFlZ6RLaXmI+U7dK+DVivMHmOKw=;
	b=ShKyAcvy6O4JrDOux7ZnJcl68v+KtmNvF6PQqwF/+Wwi/fw6GdBwyGBXmux7iJVTRe
	/ohQBPHktDnznEoFG9EHcjRH/PWWQwQWVlmDDLAcg+8cxxPSeUbS98Lce1ZBb9kNBDW7
	esMUDQbV4RxQI3WVzN+xoaUdnu7JA+krTmcoiOGBQp+tpUQYkpo3v1C7kwca0KRDF1Fy
	46UDPaLpNOkq3KLSgPZ6yEEy97fvlDcd9lleVAQF4X4yVBwDuzD1SgNeBRrzDS/rWURc
	Dl4Jg4A9l3/xHP2IdoxOjcpgaW9kjA9sdjd33YpsEXaG9q4GgvWynDGonqhkh71CbPgW
	JWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ePKTf/TizzaW/TmrFFlZ6RLaXmI+U7dK+DVivMHmOKw=;
	b=jJVDY0paDv/IHcIh3bN71oMb/CREeuuq4twY9CfUEuZN+UMKRlSAGOcYboQnLz1sR+
	m6HJEmzqy9/1r3Nb2n0oBL6QBNgoqXAYkSjdTdQt8bJERPeaHT+Gi7iJ1jvv2+Q9HMDb
	W5uBR1wNyioilfrgz1qVbyCpuMkqDG3QUpcy6I5WU4cyAY5/umoAf0tVfvsfr4uEW390
	CY7BBIZcRF3PigBc9cMSi9O8gKoEQlK/AF7m2n7A/2N+aKufFK87KIHCAYuvNLP1N0OB
	JU9vCLI/bRuEGU9GpjORH+hTWJcKOcNZEc0OHpBFI/TS6Q1vNDeUFD+l1G3RUqlw8jKC
	D2Sw==
X-Gm-Message-State: APjAAAUs9hxps8jP0ISjP/DzxhtjT+82STSkg8RPJWZmn7s6Av1+Hy6c
	hDMN2THLbOl7+Ie5P3K7qQAPIgjn7LxPlJehbFHuFA==
X-Google-Smtp-Source: APXvYqwSR/uNCwbHo0FpwzSIZAm73hDgwN+5h9t3HhZ9OKFoLXXTRZX8CDPZpA92St71x88xUuLQAkSSTpOmfNxg/ZY=
X-Received: by 2002:a92:8117:: with SMTP id e23mr575852ild.220.1582873950188; 
	Thu, 27 Feb 2020 23:12:30 -0800 (PST)
MIME-Version: 1.0
References: <20200224154549.17866-1-brgl@bgdev.pl>
	<8bf10a8d-3ea2-8f97-9d47-a3d37176c888@gmail.com>
In-Reply-To: <8bf10a8d-3ea2-8f97-9d47-a3d37176c888@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Feb 2020 08:12:18 +0100
Message-ID: <CAMRc=MfdWXsdRrFMSmPCGRPVCLsSi779oHT-JjvWjiU5WKeMmQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-security][PATCH] linux: drop the bbappend for linux v4.x series
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
X-List-Received-Date: Fri, 28 Feb 2020 07:12:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pon., 24 lut 2020 o 17:16 akuster808 <akuster808@gmail.com> napisa=C5=82(a)=
:
>
> wrong ml.
>
> should be yocto@list.yoctoproject.org
>
> On 2/24/20 7:45 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > v4.19 LTS has been dropped in poky in favor of v5.4. Drop the bbappend
> > from meta-security as right now the build fails.
>
> Thanks for the patch.  I saw this issue yesterday and you beat me to
> fixing it.
>

Hi Armin,

just a gentle ping as this is still broken - do you want me to resend
it to the right mailing list?

Bartosz

