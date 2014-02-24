Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id B24496DC16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 14:30:03 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id hz1so6551212pad.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 06:30:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=TkIV67gXFqlCR/YO245vPgfU54zVH3tPbxEeFEhHIF8=;
	b=RCgBsQtwfzx1v+uqzKcRQOrMIsXa1BElhIim5+6cZBi0m4J0zD5KrlEvmRBRXbTh9A
	OotNzl3/3t/QUSedJriFWwC6ZNaRe9VbEx3v7wh8bA7x3sPhE2rUK1nn4LjqN42SxYpT
	7JuUcTzPV5Ta2VFK81lZHziyqjVpUbGl8js4AW1eTztGKIht1JL1leaF5tgsDFADv/S7
	ErGsMXLDumJyTRNxucui14wH3eQ5AuPpgbosfVxWXKENm6muZwkDyHkBA7Ct1cfnpkzW
	wSFbjcOKQFyzO1kjqwikllbahbDIPAIjjE18H5Uu+ER5U8ExSpWjux97SIePV64J2JJT
	f8xA==
X-Gm-Message-State: ALoCoQkgKBmn2KGtQT5enz7YdFFVs3rfK2oiO393eWbWLOBJYzcU/31cZAISCb3u8tgLITHvNqSQ
MIME-Version: 1.0
X-Received: by 10.68.249.100 with SMTP id yt4mr25404230pbc.165.1393252204968; 
	Mon, 24 Feb 2014 06:30:04 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.26.195 with HTTP; Mon, 24 Feb 2014 06:30:04 -0800 (PST)
In-Reply-To: <CAP71WjyOcDowMb_nv9+-pHsnMYhXoYmRi1tJOveZJ7V30otQOA@mail.gmail.com>
References: <CAOMwXhNMs7top-CBCDf8Hgsxxz7=oBocF6YjbC_PhH1PDgYG0Q@mail.gmail.com>
	<CAP71Wjy4kX15uoz=_42+zRKS7i91TYnGM=2u35+tNXf7CFoaww@mail.gmail.com>
	<CAOMwXhMxcr_EVZx4uVnnpGvcq2MrMchHVUL5ApBdC+4bH7q_Yg@mail.gmail.com>
	<CAP71WjwR9Lrb1QeHPEXLGnPe+vcEnYtgMDoQZW-eNayOMubbKQ@mail.gmail.com>
	<CAOMwXhMz+_KcMzY1Stwi2g8EyFg+8BVajqrrvAX7Xd02qVNG9g@mail.gmail.com>
	<CAP71WjxHc6+9DDGeQsuAc3Cv7qN+bfPgNT-ju01z6pje3Q2qEg@mail.gmail.com>
	<530B4609.7070307@mlbassoc.com>
	<CAP71Wjx=6Ux7CWmr4FJcLPyp0xah3jFO=7v6izNi2dfNNcWWYQ@mail.gmail.com>
	<CAOMwXhPiWGre5UiVtyVvVc2L7G3yf79LKF55VKwuLtTd6ZRBiw@mail.gmail.com>
	<CAP71WjyOcDowMb_nv9+-pHsnMYhXoYmRi1tJOveZJ7V30otQOA@mail.gmail.com>
Date: Mon, 24 Feb 2014 14:30:04 +0000
X-Google-Sender-Auth: YpUYReIK2e_5ZvO2ZlqV2pGUasA
Message-ID: <CAOMwXhPouMY3twDeLYTAj8PXZVnRwBqfTNHt952aeqN-8+qfAg@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Gary Thomas <gary@mlbassoc.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Conf notes
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
X-List-Received-Date: Mon, 24 Feb 2014 14:30:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 24, 2014 at 2:13 PM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> On Mon, Feb 24, 2014 at 3:09 PM, Laszlo Papp <lpapp@kde.org> wrote:
>> It works with dylan, too?
>
> yep. same output using:
>
> commit e2bb4a70a99a057d45316bbac65d6044ea54c484
> Author: Chen Qi <Qi.Chen@windriver.com>
> Date:   Sat Nov 16 03:19:55 2013 +0000
>
>     subversion: fix build problem when sysroot contains '-D' or '-I'

Right, we use 9.0.0, so it is not the same. This would be the same:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tag/?id=dylan-9.0.0

I have tried it now at least 5-10 times, including full build
directory removal. It just does not work.

Fwiw, we do not depend on the yocto layer at all; only core. Not sure
if that matters.

