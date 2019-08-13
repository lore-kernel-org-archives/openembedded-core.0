Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 40E676C23A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 08:34:19 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id 31so106978494wrm.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 01:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=miaIxY3YNI3kCTb7zsZiYfc7QCfjkSbRmGcrnWoYWBs=;
	b=FPJcgD4KMnxoaQ2a0oFrNuyjmzIlNPq75cB69vniHR7IV4qr8xHEFcBuc9A6PCXVxS
	RHXFbrjENsObx4GiWgaq00V5K3hLUtx3tOR2VKSj8g0PEj9BRHvlT4J2InNIgn6suuk7
	DTMhc7S7/PhGqaXOfNfhtj8Ivs/64UlusLAWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=miaIxY3YNI3kCTb7zsZiYfc7QCfjkSbRmGcrnWoYWBs=;
	b=U4/grrNYWXEBefTZCexPpCcB7qYovBPiSkf1SXcGyVqxgUkK9m2cV6tDBhKbBG4gzU
	Ht5dB/QAu+dHzQB6V/QzPbjMVENArk/5zltpWDeLwS1ooLrdd3V7pthNnd0i2qlnfxE2
	YJHCy3ypurClwRemTRyWHyyO0dMy8rwur+OApuX9zXyYGNQmQwAVzFAh5WzCdsSYoBrb
	TaxBJEe6wBG22OB8ryIvjQaU+hNdcHzEVA2uVh+Psy2TT1wTtEbhkgUjEonpY2rK/wfZ
	Mh0iAn9vULf2IBhClYSdBu0jDEQZ4bbozZLJ4f/AHojeA+6YRscXaCM0phmIqmzYY69l
	10BA==
X-Gm-Message-State: APjAAAWmEaFYdBFSk/gZLKt4TrlXuDMMZJPk9JlIhOK8VjHvJ0EigGod
	SJZ97TyQuSP3O4IoFTaMP2DPDA==
X-Google-Smtp-Source: APXvYqxHPg97XoT/0yIF1tK60i2Q/RRW2qAMWTwjnk9erbN++kXFv3DoG/KBWCB2Fl58XzXNlgZs9A==
X-Received: by 2002:adf:f646:: with SMTP id x6mr47833465wrp.18.1565685259895; 
	Tue, 13 Aug 2019 01:34:19 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id b26sm759422wmj.14.2019.08.13.01.34.18
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 13 Aug 2019 01:34:19 -0700 (PDT)
Message-ID: <72c38e8826111b832afe9df09ab350b099918f8b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2019 09:34:17 +0100
In-Reply-To: <20190812134903.55045-2-alex.kanavin@gmail.com>
References: <20190812134903.55045-1-alex.kanavin@gmail.com>
	<20190812134903.55045-2-alex.kanavin@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] python3-numpy: update to 1.17.0
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
X-List-Received-Date: Tue, 13 Aug 2019 08:34:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-08-12 at 15:49 +0200, Alexander Kanavin wrote:
> Rebase files/0001-Don-t-search-usr-and-so-on-for-libraries-by-
> default-.patch
> 
> License-Update: clarified license for
> numpy/core/src/multiarray/dragon4.c (it is MIT)
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...-and-so-on-for-libraries-by-default-.patch | 47 ++++++++---------
> --
>  ...up.py-remove-the-detection-of-x86-ta.patch | 32 +++++++++++++
>  .../python-numpy/python-numpy.inc             |  9 ++--
>  ...umpy_1.16.3.bb => python3-numpy_1.17.0.bb} |  0
>  4 files changed, 57 insertions(+), 31 deletions(-)
>  create mode 100644 meta/recipes-devtools/python-numpy/files/0001-
> numpy-random-setup.py-remove-the-detection-of-x86-ta.patch
>  rename meta/recipes-devtools/python-numpy/{python3-numpy_1.16.3.bb
> => python3-numpy_1.17.0.bb} (100%)

This doesn't build on opensuse 42.3:

https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/907

Its numpy-native and looks like it might be the old compiler :(

Cheers,

Richard


