Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 770F97F847
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2019 23:15:20 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id v8so5670040lfa.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2019 15:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6eOp9dmE9ZSGSA0nGmQZe3TchLO6FxGUwv9WePcNbTE=;
	b=YRwxIBabuxclzg0UL/kSf41aGBXDI9hU7+9duVbC9p3wIgB3pk/EBZN95UGG3B9XtG
	H0AEvoMBGmfdvy0nhx2YJ+eWJI+pMSvKaLvRADOgPM7BP5BQt5CZcu17EAxUHyEvnZk2
	HhYhPunFeHFZdV/ZNfYdqRBWzXaBDyv+cpWdCMuSjb+wz/9ZrQarBT3UgOgWg1QCaHAd
	yRJCKxcbYdER0h2+62dLSlBs8Gano0dkBiSSyWyM1sJcGCF1kMzEHeQd/sAQCMC5hGjF
	roWVVyLAdA6mEGN5mi5LfR36mUJnRCB9YBFqSAqVQEwh9neHv2CozG7McT6/y0Usx+67
	AqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6eOp9dmE9ZSGSA0nGmQZe3TchLO6FxGUwv9WePcNbTE=;
	b=jcsZjzcotwZWRL2FjMzCA0UiQbd6xGFDcqJ0ZHR+4S7ask+72O9OniF2lSamt/9z5D
	Q3nBGjjN8wC86KXd2f4XAtsSwni3YwNuNC6oA+WRt3kMCJtDbVnYjEq5FlhLrHQlInu7
	AqZCwA+akAEgaJJlWv6JCrNjwEkxUhE2u0BSSasFD7Z9h//e6ymYjqUKnMxFpSUmjoLz
	GagaMwpBxKPYOhl8NOb0/FtRnW57fbpel+tl5Q2GPbV5r9cf6Jd/WgpPArfFktUBYTEK
	9p/Y7G1Xp0lODLXjJuvpdAAZQseN9c9oz+QLZ7nuPhBzbQ8Uv0g29RKsp9Q8ngyBdKgK
	fyeg==
X-Gm-Message-State: APjAAAVMlI/e/1hNlJMpQAFX8FVq3q5yTCuOLuOQDu0zerMn44B76KWk
	9qLEgpuc5+wbRKn+otVhi5rQ1R1iEBO+4dalndM=
X-Google-Smtp-Source: APXvYqx2UJw+muqcrcccC5FycW3Xg3hVyHFFu8XMEq+YemiGA4xr9irwwGBeebAt+4wapCWSxLUXG5Uw8l6KiD2jgRI=
X-Received: by 2002:ac2:533a:: with SMTP id f26mr7206052lfh.86.1573254921115; 
	Fri, 08 Nov 2019 15:15:21 -0800 (PST)
MIME-Version: 1.0
References: <20191106181819.12517-1-alistair.francis@wdc.com>
	<20191106221250.GD14721@localhost>
	<CA+aJhH3s7NhB-4YspmXrvrcG4py1=i2fJXg=seWPkJzosqVFGQ@mail.gmail.com>
	<CAKmqyKNVrqT9hHQxp38=72bBkz405P=6UJFPODxr5OLt_GSqDA@mail.gmail.com>
	<20191108202438.GA21138@localhost>
	<023265d217840d956c5e54d12591d7cfdd0442b5.camel@linuxfoundation.org>
In-Reply-To: <023265d217840d956c5e54d12591d7cfdd0442b5.camel@linuxfoundation.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 8 Nov 2019 15:14:54 -0800
Message-ID: <CAKmqyKNENL0De4uJqDDn-04-QZb2za6NXt2e+yU9fWZAY6jpMg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH 1/2] tune-riscv: Add support for hard and soft float
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
X-List-Received-Date: Fri, 08 Nov 2019 23:15:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 8, 2019 at 3:07 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2019-11-08 at 22:24 +0200, Adrian Bunk wrote:
> > Especially when looking at the arm64 situation I am wondering
> > whether the best option might be to throw away the tunes mess and let
> > the user write the compiler options directly.
>
> OE once did that. I think anyone who lived through it would say that
> the current situation *is* an improvement over a free-for-all.
>
> This is mainly as at least we're now consistent whereas before the same
> thing had different names in each BSP.
>
> I don't know what the answer is but I don't want to go back to that!

Ha ok. I won't argue with that.

I can just carry the patch locally, so I'm not in a rush to get this
in. I have reached out to Rich (musl maintainer) to see if he has any
ideas.

Alistair

>
> Cheers,
>
> Richard
>
>
>

