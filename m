Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2C67F7C6AA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 11:32:00 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id q18so12952211wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 03:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=4xMoNTm6sGvWnWI/AY/ppmsr5cu/6SogGZl3ibOTsuA=;
	b=FRfCorK+EpJK+JznuEmdragRjSAlvo41ydZ/NSbUGuIl2jf1eop939GR670fatbqwQ
	kd7pKgdxMuow+XiWDnHKFKumT3aA9tmpTdvqaQ/yj5pcImDEXujhthFT1Qwr6c+EuMKN
	xhiW0THZ3CvTQlVFaP2Y1wlyMBtMcEvid7DVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=4xMoNTm6sGvWnWI/AY/ppmsr5cu/6SogGZl3ibOTsuA=;
	b=kaHTxGhhJVYWHYq550lT09skbNK+vi+KFKCc8QD9Y2bNHPSwLIw6N7T6OS8+BIp+6t
	E4/KVqqKEN+jiz01hj3v+F58ecoU5lzkMqaEVBSIbdHvcFNeQoXU0VRvnu+JdLLenvt5
	34pxkGRDWNqpXuVHuX7vopcOxdNDhMTuDgWEgRyx4d3+L5ZdeWKlQuSzVYKyGnnRXfX4
	gnEBTfTeK4U5v3+Na0VNG6Mj5dkAZZc/JyIpbcWGpWxjicAqwzYesKMquIjoGMCVCyyR
	9xUKrdyVlgij7ErOxhVP4o+W04pKP4nM3FcAxhhHVfnO8U4vgOHvgHya3jTli0Igyq6j
	dCTA==
X-Gm-Message-State: AHQUAuYVkVj67SngHrpBKlEGJidcKkwCXedUqbQVJVzy9S3xEFdtD7YT
	P5Gy3fMPSeob41OfctjArl6CVA==
X-Google-Smtp-Source: AHgI3Ia2v96sWAsi0DZUa5W91s39yRZYKorKILn7rA7hz+M5A8+TI0aa9EHvqg7I68Y1DbowJOb06w==
X-Received: by 2002:a5d:654a:: with SMTP id z10mr7704270wrv.280.1550316721614; 
	Sat, 16 Feb 2019 03:32:01 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h13sm10712095wrs.42.2019.02.16.03.31.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 16 Feb 2019 03:32:00 -0800 (PST)
Message-ID: <689a3e6f6f81d9f9e300ea5d0d0e9641f753d87b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 16 Feb 2019 11:31:59 +0000
In-Reply-To: <CAO5Uq5R=cFd3h4QLmF_b=5iJORG2C2Zo3BXwtDL2MkR+PfucCA@mail.gmail.com>
References: <1550178589-15839-1-git-send-email-alex.kiernan@gmail.com>
	<76d71f8af98a4ebe6154ff5b7ebb59ccf989408b.camel@linuxfoundation.org>
	<CAO5Uq5R=cFd3h4QLmF_b=5iJORG2C2Zo3BXwtDL2MkR+PfucCA@mail.gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bmap-tools: update from 3.4 to 3.5
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
X-List-Received-Date: Sat, 16 Feb 2019 11:32:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-02-16 at 09:25 +0000, Alex Kiernan wrote:
> On Fri, Feb 15, 2019 at 11:16 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2019-02-14 at 21:09 +0000, Alex Kiernan wrote:
> > > bmap-tools 3.5 was released August 2018 but has no release tarball,
> > > so
> > > switch to using the git fetcher. Also pull in the fix for
> > > StopIteration
> > > being transformed into RuntimeError for Python 3.7.
> > > 
> > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > 
> > Unfortunately this triggers a selftest failure:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/236
> > 
> > (ignore the virtgl piece, that is something else)
> > 
> > oe-selftest -r wic.Wic2.test_bmap_short
> > and
> > oe-selftest -r wic.Wic2.test_bmap_long
> > 
> > should reproduce. Might be as simple as a missing RDEPENDS.
> > 
> 
> Looks like it's gained a dependency on six. And thanks for the
> reproducing steps - I've never got to grips with that stuff before.
> 
> That said I'm struggling to get the tests to actually pass. I've
> added
> in python3-six to RDEPENDS, but it still fails with
> `ModuleNotFoundError: No module named 'six'`?

We appear to have walked into spools of razor wire :/

This is an open bug:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=10113

which I'm struggling to know how to fix.

What does appear to work locally is adding something like:

# We need the native dependency on python3-six at runtime
# See bug 10113
EXTRASYSROOTDEPTASK = ""
EXTRASYSROOTDEPTASK_class-native = "do_populate_sysroot"
do_populate_sysroot[rdeptask] = "${EXTRASYSROOTDEPTASK}"

Whether this is the right thing to do I'm less sure about.

It may be an idea to start introducing these dependencies where we need
them to fix bugs, until we can sort the problem properly in
native.bbclass.

Cheers,

Richard





