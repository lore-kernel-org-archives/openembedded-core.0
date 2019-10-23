Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id DDE0B7CECE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 21:00:30 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id y127so17306310lfc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 14:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xLqC2UG18d4E2z8FAvpy8JVk0SNStBndvtJnfbWGQRk=;
	b=SA9fPRuxAH3G3naonS+N3vNeLohHYXQrQbwV8ze+63holCqRmsmXfiGe2lgmsVM6kU
	rSxrL/fnACtkdxaDH9eSMjivoIR84x/wKqfchB1KaYMQQXE4/Vt9LVSW2RJ88QKCX/jJ
	oEV44WXJjM80/foffODctHpgysdNEAD/n0/bC0rLwnPCgT6svS6mNiqkh5Tkc1RFNYjA
	L+iKS4mZYQlJI9ZQBM4SrhL5RVuhNhU0FDvAgDWyazjFH7QEbtwTBxhKpXRzXBnkXn77
	EWQxDYRaMNLZrBr6udWmUd4HGaxt5Xe+vKquVX6fXf/NU8K0E5AAL67+3Is0HC9mPClS
	Lwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xLqC2UG18d4E2z8FAvpy8JVk0SNStBndvtJnfbWGQRk=;
	b=ct0ky7fBEgkfVGIn8ENEWfh48utvIuCZEgSdcWuL6ZhAf3sXmWxY4ZQ58HRlu4jwKk
	nNUKnySMZuOixmkU7sQkJKyBbyzEiGUo7B0fdKLUZ1FrEe43Bhg1BHn5LTH50V+/iYvQ
	oXkhVVX/NcdvbrRBfTjflTr6V5pTpH5i1lNJexh/t4s7BsJ6XvA3MrdDw6ew52PN3Tjx
	1nq95QrE6qsF0refAO9DokKMUEvqP4y96L5osfv+jO4MsgEMNeQyVjk02+9H8gH3axKO
	5bQKJzwmuNKC36zLCDwSLhTm1RjqzhdA8bv8G3dZMygE0ZKLw/SnrsFiD4VpMAVQcCCr
	R+gQ==
X-Gm-Message-State: APjAAAVkndXRLMSSHhyZNJ4dBy8iVmrfzCyUvBKGWurP2OpiGrHabvcg
	ltMSh3oFIQrFbLqqpIDtxsePqKQH47ilfCITlqY=
X-Google-Smtp-Source: APXvYqzwQksUk7KeKYMjbpLqAEccVmlbczhE1mZ7nZ1ymR395Fd4lGYy1f8zavf595ND5jhBP3BA2SrX/DBqbVZmh+Q=
X-Received: by 2002:a19:f018:: with SMTP id p24mr12869180lfc.93.1571864431436; 
	Wed, 23 Oct 2019 14:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20191012165433.24511-1-alistair@alistair23.me>
	<CAKmqyKMtXBO6Z2NUC5ewYwYOHneorfrbiMJOf6PZfsg7hybR1Q@mail.gmail.com>
	<926a535b1b0b32de2bae2ebb393401c79525b97a.camel@linuxfoundation.org>
In-Reply-To: <926a535b1b0b32de2bae2ebb393401c79525b97a.camel@linuxfoundation.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 23 Oct 2019 13:55:13 -0700
Message-ID: <CAKmqyKNUhcTNp2_C8EMM=Kdq6M+s+bAJwhP_9YpkxO=edKyE+g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade to 19.2.1
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
X-List-Received-Date: Wed, 23 Oct 2019 21:00:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 23, 2019 at 12:46 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2019-10-22 at 15:07 -0700, Alistair Francis wrote:
> > On Sat, Oct 12, 2019 at 9:54 AM Alistair Francis <
> > alistair@alistair23.me> wrote:
> > > Upgrade mesa and mesa-gl to 19.2.1.
> > >
> > > The license hash change was a trivial new line removal.
> > >
> > > The glx-tls option was removed as it isn't included in the
> > > meson.build
> > > file.
> > >
> > > The -Dasm=false was removed as it also is no longer included.
> > >
> > > Signed-off-by: Alistair Francis <alistair@alistair23.me>
> >
> > Ping!
>
> It caused multiple failures on the autobuilder:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1160
> (musl-qemux86)
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1162
> (musl-qemux86-64)
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/1141
> (libsdl2 compile fail)
> https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/40
> (libsdl2 compile fail)

I wasn't about to reproduce these, but I'm guessing the musl failures
are from the glx-tls patch being dropped, so I have added the new
elf-tls back, hopefully that fixes it.

Alistair

>
> Cheers,
>
> Richard
>

