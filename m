Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 88F3C7E294
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 21:00:08 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id g16so60636iom.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 14:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=D3UXdFOyNGdQc6ip+fj1ExtiJocPIaZqUsdN9E3Uxow=;
	b=DSY53pQU7dAZY089Qpk2f3U1cPeGXLGx5nD72/Kt/erBDiomvwAcxJZ8NG0LTsLyRH
	Gps3046zW73cdYAb/7E5JxuRoAReC5RwlsCqa3rBcxDEgw8jSZam+AFoFStXjg5kqXJ2
	mLLheGg3F8C6h3Rhg5tE3zeYZmZRmYFbdG11D/aR6dnUKtKdT6ejrPT2MYKHGeNtecjd
	ogbB0AiUEeb8RbF2Gq689kchNIoy0alFu98fpm30xarAgY38ECYi3iKQ2mph2+oJxBsv
	0oOGTnRiQLULxHTTA4uPdY9qxH4Z321KfhUIcvpoTPjrwRn0wG+QRiVqcpDWOl5nXdkA
	2nCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=D3UXdFOyNGdQc6ip+fj1ExtiJocPIaZqUsdN9E3Uxow=;
	b=jTNn7KgpDdu4Eyhk2G60+TuyfMZRKtdhWegvdclfkGuxcK7dQ4TsGbbv/kBhlk+dP9
	VOvKSliEsqtqBTYIAtykgo2STTlGI9TsL83GrZH2A9MPzZLqnvNwd4v9mC1m7ZnPVANG
	zReJ7h4HsT3rOLNiaxeHg3KXPmjibXBdizirMqXOG8x50jMhs7ufFOugCf6rm0r9HCrS
	xUOfoDBabfBS9vriuwB3JMYBVwufLhwCpOIOiFYprSL9VjvczYQ0oKm6U8kqJkEfMHMD
	oeY2il2D5vSDgJSKxNldfr/n5GWqpWlYPzDr9fFQH33RadaurWucnqN59Q/iEeoTxP3E
	wasQ==
X-Gm-Message-State: APjAAAWk6Ezhv6aVvnbPD0WUjDruVak2zZm6mOWXcOFMTHyyfz9wrO9r
	v0gdih6vd+h7BlBf5DxIbL0WAaOjYiKbEMxw8RE=
X-Google-Smtp-Source: APXvYqw2Pag8xjkX5zqBi8KZ5aXOAf8CaP+I5azZ4QpI2w/6EymLEiFgdFJPaf4oyoP8NX/nQKYOKNPnGZ5pmOI3lpM=
X-Received: by 2002:a05:6602:4f:: with SMTP id
	z15mr6913617ioz.108.1558472409516; 
	Tue, 21 May 2019 14:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190521090032.14859-1-schnitzeltony@gmail.com>
	<20190521090032.14859-2-schnitzeltony@gmail.com>
	<03af571c3019042cff91f2703b15edb139661144.camel@linuxfoundation.org>
	<CALbNGRQjahbkMzBmqFG4QQE4moF-qTFJrDDMzBVUnXBCTwGFMA@mail.gmail.com>
	<b182fad0b95201771a7c01ab2d71aaba73810399.camel@linuxfoundation.org>
In-Reply-To: <b182fad0b95201771a7c01ab2d71aaba73810399.camel@linuxfoundation.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 21 May 2019 22:59:57 +0200
Message-ID: <CALbNGRRcmwVcVD3ytdb32RkmgyFTLJ3dsKiC+iLDK36s1DBwGw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] python-six: put python2/3 variant together
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
X-List-Received-Date: Tue, 21 May 2019 21:00:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 21, 2019 at 8:38 PM <richard.purdie@linuxfoundation.org> wrote:
> > No sorry mozjs uses old crap in their configurations scripts nobody
> > else does (python which) and ask for python2 explicitly.
>
> I've been giving this a bit more thought and its our intent to try and
> remove python2 from OE-Core entirely so adding py2 modules back seems
> like a backwards step.
>
> I think this will therefore need to go to one of the other layers,
> painful as that might be from an include perspective.
Yeah a new burden out of thin air is born. You know what I do: Create
my own layers and am happy as I am with my other layers.

Bye

Andreas
>
> Upstream are only going to keep py2 compatibility to the end of the
> year, if that so the recipes will have to fork sooner or later anyway.
>
> Cheers,
>
> Richard
>
>
>

