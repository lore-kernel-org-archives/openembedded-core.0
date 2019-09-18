Return-Path: <dbaryshkov@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id D86B490102
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 09:04:46 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id n190so3664698pgn.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 02:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=iHQ0XZZzJ9+Vqg/QzO/ssiLZA/LxKNFVwnMOf0Rexmo=;
	b=aVTetDJx1nhLiVaA9I9k76xQnwscXV83SqjNJe5Tah0To/ojqP8WNjUYLfvkOQvTPw
	nhKLTM+I2GgF7I2KGITtypG0+iNPHwyaMMeRImxHFEwPA7Ydq3uMdqwcRuiYiDSUV/KW
	tVto9IBKLh/B+lOrVwY59yGQi1bBOJZsDl503jUE/DVSvadUhyZZhwGjV3YS5+Qa1M0O
	YNC20OZnREyBDzzImfEhtfiksN94SBuPZTq9pH6y06JcAq46tti3Y09mb+9GzBbUvpF4
	8aXphqy+wWh3kxGRY/kMrg3JVOeRnr/WpkMCuQHpj6GT9x1wIXN3nna/zYWJKAdU8X0w
	5O2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=iHQ0XZZzJ9+Vqg/QzO/ssiLZA/LxKNFVwnMOf0Rexmo=;
	b=LTptzmQh4l54nT41rueP7VbhxLP4sf3yit7yH7Sh6LG5skz70+mx0BiXv6KyaKMExG
	smpS3c9dhYyg1z6YSf2B5F0i15MeOPdQCXeKPJDOins+JQgZn7UPZTfWTsOAIKpeRr28
	d2u5IKAoZDITQieb2gLaBcnxwnAXTGfCSxsqtj8it3xXIhlt6HveGONN7N9BhA6oZszX
	bfBe0K4T106ntBhwAogKwBUhQY6oqyTfxvVq282pwovs9lApBtAceVMllE2SiZlVtzcP
	QwF7WVb0GtPbHrB7EkL1NCDbKRumWbszgEE2Ikjz5/1350rJQOtDSLhQIz97RRnHGV+2
	qS1Q==
X-Gm-Message-State: APjAAAWlnWXFbVhT6ZkJA4isMZZWuU2McCvJF7Q5b0i64P6nHaWhIh07
	WTwqBMBLbSEXnGHZIPNfWqEhza4peMb5T6h7Ayn2YA==
X-Google-Smtp-Source: APXvYqzDl3fciOFWvRiayvINd9YK1ert4FUvzMdPSv2+cneQhcxFGPfXoyPHFf2K6YaLC9DOza4aefh2VbU8pA41LnM=
X-Received: by 2002:a63:f907:: with SMTP id h7mr2983518pgi.418.1568797487465; 
	Wed, 18 Sep 2019 02:04:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190917153613.4954-1-dbaryshkov@gmail.com>
	<8efc4f66f7509b3cc4235939f542858051b61b8a.camel@linuxfoundation.org>
In-Reply-To: <8efc4f66f7509b3cc4235939f542858051b61b8a.camel@linuxfoundation.org>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Wed, 18 Sep 2019 12:04:35 +0300
Message-ID: <CALT56yOx98GPrNCZTMLbShmMvTZz3v4v3Ei5L6Wuvh62Mps6Hg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/9] uefi.conf: add config file holding configuration for UEFI applications
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
X-List-Received-Date: Wed, 18 Sep 2019 09:04:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

=D1=81=D1=80, 18 =D1=81=D0=B5=D0=BD=D1=82. 2019 =D0=B3. =D0=B2 01:16, Richa=
rd Purdie
<richard.purdie@linuxfoundation.org>:
>
> On Tue, 2019-09-17 at 18:36 +0300, dbaryshkov@gmail.com wrote:
> > From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
> >
> > Create new config file defining common variables for all UEFI-related
> > packages (bootloaders, test applications, etc).
> >
> > Signed-off-by: Dmitry Eremin-Solenikov <
> > dmitry_eremin-solenikov@mentor.com>
> > ---
> >  meta/conf/uefi.conf | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >  create mode 100644 meta/conf/uefi.conf
>
> This is heading in the right direction however if we're going to try
> and clean things up I've concluded we need to do it properly and get it
> right.
>
> Now I understand more about how this configuration file is being used,
> should it be called image-uefi.conf ?

Fine, I will rename the conf file

> I feel really strongly that we do not want an uefi.bbclass, its simply
> not warranted and will just continue to expand the current mess of
> classes. If all we need it for is some functions, those functions
> should be added elsewhere.

As those EFI_PROVIDER bootloader classes are called only form
live-vm-common, maybe I should just add them to live-vm-common and
make individual classes _append those functions?

> I'm also on the lookout for tests of these kinds of codepaths. Code is
> much more likely to be accepted if tests are added for it. I'm not
> quite sure what would make most sense here in this case buts its a
> general point I will be pushing for going forward.

What kind of tests would you like? This code already exists and is
called as a part of any live image generation.

--=20
With best wishes
Dmitry

