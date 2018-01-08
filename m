Return-Path: <alistair23@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2FD327016E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jan 2018 23:46:14 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b141so17284543wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jan 2018 15:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bE19mVhpUgJnjyhVzj79OnhQSx5Qeo58ZWKtImLSm0Q=;
	b=NtcFOGUPuoY65pDY35/cnywCTByLBIwvFJ4Fnu8AqXDnaYtXx6WPlCIchU5OKirhHV
	3B5YeXFqHA+g23MHSBK5Gva0QGlCmW4+YDBhKnopzpdwyn7EXjhtUUOw2Ku6eAWPw6G6
	w3jkALcdqiDFlW1vzGJw+JGqOOF9osH9NaHUmWjsBVq2nFQctJA0nNnVBmaH0Hfsnoik
	fUV/pUW0mZzMwVYbmPSnfxts6pxzOC00H39UaEB5evW6nLmJPSkgEZMuB4/WdK4VeaMu
	dCS0+DZeDmlMFgntW/tEBJmjGS+SpnzGLZIV09sWDUBaGTmEFB+TlcExgSakFdFK+Tt6
	ecbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bE19mVhpUgJnjyhVzj79OnhQSx5Qeo58ZWKtImLSm0Q=;
	b=grNcnThlxBfW/tPg+RQlZSsudQSM0BIix3own2MKaOlOz+iMvyF9xP8c1q0yBPlf3q
	dl5LD5yR0XCVbJAcRL86gFKhAIcorh0jvnB0z6USIc4dAh4bhceohXNUMR/veLCSmx8X
	Uc9fZCWCxiu69pHk5BMkF49H0H2jMaRyWN/rnpX+3U5Z1MSKwHGNhOSOlDC7I6k69PUr
	SuDKHqWJKopqXh6ZzABWX8qBLgLyXsVGr8ksE4OnrK7EBNg35t34XWKcYEAyeqni9ucA
	mkDEQHbeTNinQjqG+2t3DEu1eD+VOmLWXcbWDZYB8En/cogcshHqnewALb80yPexa0dJ
	Mczw==
X-Gm-Message-State: AKGB3mL5orDjxAiJ5OdI6fNqfNyTHB3q5ri2JcNihPF8kupOdi2GG9Nt
	rvFzd8MB6NY91WSV8OWYk3VieB42XcSqLS5Tt0U=
X-Google-Smtp-Source: ACJfBovIUp72WaST8C5Svd9P33pdDUdqsy7+hJEcjFlyoj8bnWc8eEqmeBu899KvmGEnMDz2n2uu9KeKGo3xXygA6N8=
X-Received: by 10.28.208.79 with SMTP id h76mr9450069wmg.77.1515455175951;
	Mon, 08 Jan 2018 15:46:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Mon, 8 Jan 2018 15:45:45 -0800 (PST)
In-Reply-To: <1515233731.29722.20.camel@linuxfoundation.org>
References: <20171221215634.26019-1-alistair.francis@xilinx.com>
	<CAKmqyKO0DpoCCzDzoJf9WELTE0fcE7rRS279xbLLPVV5bvff6A@mail.gmail.com>
	<1515055530.5525.176.camel@linuxfoundation.org>
	<CAKmqyKMGTAJuocNKid-mnSAg-bbtoaTH7ih8JjsA-DP5aRYHdA@mail.gmail.com>
	<1515198127.29722.16.camel@linuxfoundation.org>
	<CAKmqyKO8P6uYTLxDM4xAFCxHA7+Hi9xkTqabJ1FSeGfLRXZpOQ@mail.gmail.com>
	<1515233731.29722.20.camel@linuxfoundation.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Jan 2018 15:45:45 -0800
Message-ID: <CAKmqyKOHCqmYs=_o0S=F3LCmw=VOPE2NMmczVDgxe8o0=bcocA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: vineethchowz.chowdary@xilinx.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] receipes-devtools: QEMU: Bump to version 2.11.0
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
X-List-Received-Date: Mon, 08 Jan 2018 23:46:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 6, 2018 at 2:15 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2018-01-05 at 18:18 -0800, Alistair Francis wrote:
>> On Fri, Jan 5, 2018 at 4:22 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > > Do you have an easy way to reproduce this hang?
>> > Was this a musl build you tried to reproduce in?
>> Ah, it was not. I'll have to figure out how to do a musl build next
>> week and try again.
>
> TCLIBC="musl"

Thanks. Unfortunately I'm still unable to build at all on master so I
can't reproduce the hang.

Alistair

>
> Cheers,
>
> Richard
>
>

