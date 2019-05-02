Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id BE2CA7D592
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 May 2019 03:01:59 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id p20so870590qtc.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 May 2019 20:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hHegYxWCVjtDvLrH4pS3TQO+IlM8n5waoJ5fzHM7nX0=;
	b=Tyl71DBkfuG/ZKag5mfEoVXQMAmSO4J9sCPN7VgIZQ4R4sx/f1K3g++31rlAD6oxfZ
	VSbtoLXOBwBfWgvRNv88HcwhwA4JhSge4xJKPKKXLH/0UPHTy+nsJrjKMZGJGavlnwB0
	AbUvNyVDXPpm19XOR7Zkfgls6mREY7mYUau0ECWB2/s5/39gRE/kWzMdvxO/hbY6dINb
	0nxoipO5mYptoqtwB9yUFtnAUW1vNy4TIcMZ+UFLrjgoC6erJ84jzqLmVxSf9+pQjU2P
	LCQfaU4SwRPJRmQOXCxZsHCbYHaXEbiZmxJXELx+kifGB6pYIvko2UORwkJqscRdofON
	FUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hHegYxWCVjtDvLrH4pS3TQO+IlM8n5waoJ5fzHM7nX0=;
	b=tPhVi1Dh0V5xZuFSXa5Zu46lnZpc6phO0IyWdJd8REpW+NS8DvT2P5E0UaVjTNWvUz
	z4ORk5snJPSJeY44/NUdT+nxPaKkCeHjhKgKBbYWOt0r0zQg+CfZok/E2ydS+1is2FL7
	kpuJIIlugU1qI/TMin3MWCToEedm1+TleabSb9srE1XkE0+oikMh3TWj2wTwwr0Irv4q
	oaCMBPX5XmYyLPVlspkELCLIpp4uVZaolhK3dBZK6jgVUmSAf59eoPU/t40gKAfdl8NR
	K1S1ktjRdE6mkx9RiQwTXf71J+LCIR8NonwCEjSW+SZxZdoLQnMXmkjxd1OQgsO7/8ig
	p8yQ==
X-Gm-Message-State: APjAAAW/v2DrgOzKstSTbDgbiXY/qW7WrNPX9gCZ4b1CkILn5jb9naD+
	axk6aaeCj0rJLEVk/lr/eTXefdG7DxyI+QsMoFU=
X-Google-Smtp-Source: APXvYqyeJsipPWJmfCZW6VpHPLN8U2uSiHCJFbrW3oOWGlM45jtPcJY5tkzLeQQxr0+SKEbgLT7huntI9Mv9Ag9TKbM=
X-Received: by 2002:ac8:810:: with SMTP id u16mr1244294qth.254.1556766120305; 
	Wed, 01 May 2019 20:02:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190430192414.43383-1-raj.khem@gmail.com>
	<593bdf6b788838c82d73a7bd7b8cce01a185ba13.camel@linuxfoundation.org>
In-Reply-To: <593bdf6b788838c82d73a7bd7b8cce01a185ba13.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 May 2019 20:01:34 -0700
Message-ID: <CAMKF1sqEcbCW22kAMtDsv8sU8KVv0hkkbJXE0hs_MV7zeY5yXw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT][PATCH] gcc-9.0: Add recipes for upcoming gcc 9.0 release in mid-2019
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
X-List-Received-Date: Thu, 02 May 2019 03:02:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 1, 2019 at 4:34 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2019-04-30 at 12:24 -0700, Khem Raj wrote:
> > Its already in RC phase now.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> I ran this on the autobuilder:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/429
> http://errors.yoctoproject.org/Errors/Details/238976/
>
> Basic summary:
>
> a) gcc-source needs a maintainers.inc entry (selftest fail)

I will fix that in next rev.

> b) fortran selftest is broken

some more details on this would be helpful.

> c) mdadm fails to compile

Yes, this appeared in my builds too but got ignored since recent
builds are using clang
but I will look into fixing it.

> d) runtime test gpp2 fails
> e) systemd fails to compile
> f) on target runtime g++ compile tests fail

The headers include problem is interesting I will see if I can reproduce it.

>
>
> error from f and d look related:
>
> Exception: Command cd ~/buildtest/lzip-1.19; make  failed with exit
> code 2: g++  -Wall -W -O2 -c -o arg_parser.o arg_parser.cc
> arg_parser.cc:20:10: fatal error: cstring: No such file or directory
>    20 | #include <cstring>
>       |          ^~~~~~~~~
> compilation terminated.
>
>
> DEBUG: Partial data from SSH call: /tmp/test.cpp:1:10: fatal error:
> limits: No such file or directory
>     1 | #include <limits>
>       |          ^~~~~~~~
> compilation terminated.
>
> DEBUG: time: 1556703543.2447464, endtime: 1556703843.2447433
>
> RESULTS - buildlzip.BuildLzipTest.test_lzip - Testcase 206: ERROR (0.79s)
> RESULTS - gcc.GccCompileTest.test_gpp2_compile - Testcase 1142: FAILED (0.71s)
>
> Build will look a lot happier with the on target C++ headers fixed! Not
> too bad for a first pass :)
>

This is because we can build master branch easily for toolchain
recipes. so a lot
of pre-emptive work has happened already

> Cheers,
>
> Richard
>

