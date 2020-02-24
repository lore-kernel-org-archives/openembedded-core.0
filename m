Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5392E615D7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 17:32:31 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id t14so156164wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 09:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=3v9766pZQ1S/RFS/ybz6yRiQhFR2SKi2Gn/xvyK2Z/0=;
	b=XaAItnRu790n95OdAlGnKxQjuMRnYJyAFX3AJZbu+zVLwzalYoBDGk4rbiwLi5Ew9F
	cIRQAOq7AZuCLR56Y/c5f09hQQZ1xHNRJaWe2hK7BQZIns4w/W401m73Yj6JbD3S53D+
	cQ8tHTpbvlbrK4oKud0pDuhWbPvpjI0Gk8q4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=3v9766pZQ1S/RFS/ybz6yRiQhFR2SKi2Gn/xvyK2Z/0=;
	b=AGvQklLRbkD/qM5E9J2i+raBjIv6ohl6o29kNnEj/8IL9qMUOk+HEiv1fLMpJeSmp8
	EHDy6RA0LhJ2wzo4zt+Yj2w7BKRH4gxnO2L2HuLw3K12BCtQv4FgDXzDpvZCZFg03Ln4
	Cno48vpEynffMSEEv1EO3qMs+a7f/M3bhbvoHAUBgR6UKVD6wtN8nKKODe4dQeEDAC6v
	HEj8MkqLjI23fXSTsWTmyTWPIwnxJsjqTBe1hmo0g2c9mFqyrLHcF/OKAKlvTD+nslL+
	FQjcy+CRMg8s1/Wc66+7COMn7jTLtUz85CAnfF5+TQIlDd11LfpNRkSQEJ0lPNN395Q1
	q4Yw==
X-Gm-Message-State: APjAAAWw9vtvr/DmGa1M9qC21yW9VDpYBwr/JJabAy0I2CK3aOhWPhqt
	glovm3TdIgft0W2l/g7T6Bmt/g==
X-Google-Smtp-Source: APXvYqzhN1Ky1EaYLONTfdJVqv75TaQQVpBi7miTs0OtLzCSrJB5CqVAk5vZ0kn9BtCP0pn7wDJPMA==
X-Received: by 2002:a7b:cd14:: with SMTP id f20mr118431wmj.43.1582565551776;
	Mon, 24 Feb 2020 09:32:31 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l6sm20755678wrn.26.2020.02.24.09.32.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 09:32:30 -0800 (PST)
Message-ID: <b14a0847fffc79809e5fcef86d82b5a8abf3f9a2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>, Adrian Bunk
	<bunk@stusta.de>
Date: Mon, 24 Feb 2020 17:32:29 +0000
In-Reply-To: <23c396de32bb98414dcb2aaec178e73079e000d3.camel@andred.net>
References: <20200224125955.26771-1-git@andred.net>
	<20200224134022.GB27036@localhost>
	<669ba509f1df86a8f2c7ea172aa8ff23d7449744.camel@linuxfoundation.org>
	<23c396de32bb98414dcb2aaec178e73079e000d3.camel@andred.net>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] bitbake.conf: omit XZ threads and RAM from sstate signatures
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
X-List-Received-Date: Mon, 24 Feb 2020 17:32:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2020-02-24 at 17:14 +0000, André Draszik wrote:
> On Mon, 2020-02-24 at 16:44 +0000, Richard Purdie wrote:
> > On Mon, 2020-02-24 at 15:40 +0200, Adrian Bunk wrote:
> > > On Mon, Feb 24, 2020 at 12:59:55PM +0000, André Draszik wrote:
> > > > The number of threads used, and the amount of memory allowed
> > > > to be used, should not affect sstate signatures, as they
> > > > don't affect the result.
> > > 
> > > Unfortunately they can affect the result.
> > 
> > I looked into this a bit and its complicated. The threads are used
> > to
> > compress chunks and their compression should be deterministic
> > whether
> > done serially or in parallel.
> > 
> > I did some tests and:
> > 
> > xz <file>
> > gave equivalent output to:
> > xz <file> --threads=1
> > 
> > and
> > 
> > xz <file> --threads=2
> > xz <file> --threads=5
> > xz <file> --threads=50
> > 
> > all give different identical output.
> > 
> > So if we force --threads >=2 we should have determinism?
> 
> How large were your files?

105MB total which should be enough as the largest xz block size is
32MB?

>  Given threaded operation works by operating in 'blocks', you should
> have a different number of blocks in your output.
> They're all compressed independently, so I don't see how the result
> could be identical, unless the block size is large enough for xz to
> not create as many blocks as you allowed via setting the upper limit
> on the # of threads.

I don't follow. The algorithm xz uses appears to be designed to give
consistent results regardless of numbers of threads. It gets split into
the same number of chunks. Each chunk is compressed independently, but
deterministically and then they're assembled in order. It doesn't
matter if the chunk is compressed in parallel or serially.

> > > > Otherwise, it becomes impossible to re-use sstate from
> > > > automated builders on developer's machines (as the former
> > > > might execute bitbake with certain constraints different
> > > > compared to developer's machines).
> > > > ...
> > > > -XZ_DEFAULTS ?= "--memlimit=50% --threads=${@oe.utils.cpu_count
> > > > ()}"
> > > > > Files are split into chunks, and chunks are compressed
> > > > individually
> > > > > in the
> > > > > pbzip2 case.
> > > > > pigz terminates each chunk with an empty block in the final
> > > > .gz file.
> > > > > 
> > > > > 
> > > > > Cheers,
> > > > > Andre'
> > > > > 
> > > > > 
> > > > ...
> > > 
> > > Threaded compression can result in slightly worse compression
> > > than single-threaded compression.
> > > 
> > > With memlimit the problem is actually the opposite way,
> > > and worse than what you were trying to fix:
> > > 
> > > When a developer hits memlimit during compression, the documented
> > > behavour of xz is to scale down the compression level.
> > > 
> > > I assume 50% wrongly gives the same sstate signature no matter
> > > how
> > > much RAM is installed on the local machine?
> > 
> > I did some tests locally and I could see different output checksums
> > depending on how much memory I gave xz.
> > 
> > Perhaps we should specify a specific high amount like 1GB?
> 
> If I understand the man page right, at compression level 9 (default
> in OE),
> each thread / block will use up to 674MiB of RAM, so a limit of 1GiB
> effectively reduces parallelism to 1.

Right, I agree that isn't feasible.

> > Does anyone know more about the internals and how to have this
> > behave "nicely" for our needs?
> 
> What are the needs specifically?

The project is aiming to have deterministic builds, our output for
given input metadata is binary identical.

> In my case, I have some defined builds that run on their own, so they
> are allowed to use all memory and a certain (lowish) number of
> threads.
> 
> I also have other builds where several can run in parallel, and xz
> would just be killed if all of them were allowed to use all RAM, so I
> have to reduce threads and memory consumption.
> 
> This of course means slower builds...
> 
> I don't want to penalise myself or anybody else by generally forcing
> a low number of threads either.

We didn't have resource issues on the autobuilder with xz but others
did report it and its why the memlimit was set. It would be better to
remove the memlimit for determinism really as far as I can tell and if
necessary throttle the threads count.

Maybe setting an upper limit of say 10 threads and a minimum of 2 might
given us what we need. Perhaps we just allow the number of xz threads
to be set independently?

> > FWIW we haven't seen variation on the autobuilder due to this as
> > far as
> > I know.
> 
> BTW, pigz and pbzip should have a similar thread related problem,
> according to the man pages, if you read between the lines.

Agreed. We have less of an issue with these as their use is much less
frequent. xz is used by deb and ipk for packaging.

Cheers,

Richard


