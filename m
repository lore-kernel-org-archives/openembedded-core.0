Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id E20067F371
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 21:30:18 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id l9so7646337qtu.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 14:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vcoOFHoGvg+4vUwak2zJRE1rLXV1crSFqbj/UnJQdjo=;
	b=hFOQAR3NDqHbDPukKxJ8TWYvPmg7qIjR1QE0E6/aFaMbxX5ErOdX8TKV8Tic22W8lJ
	au4slHDlGlYLDpjdvfpREMJPvrjbLsIYNVzOFTQ57//WZD8JgG+8Usw1SblA3fqvJGjl
	/5ctjh88nktV1sEQd+6l+QrR6vI3ToW4DEFCDsZaABIA974gzk7mL3Ivbo4BPn78Ze/q
	lDoK0gwAHDmqK9DvBrqMZ2FCn5XbdoII7SvZ9vp8ogijbHvCrsPfKAT1gJIQND56mt/F
	psO/DxFo4WGwsK/RmqwWlxtjBfyoKDNYvYYraXODP43LVjOjFqM5zOCof7jxA1n4RDyR
	C/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vcoOFHoGvg+4vUwak2zJRE1rLXV1crSFqbj/UnJQdjo=;
	b=iyxgOhxvCloViSx2BYLbDf4bYKJdJ6nExfk6p8nzKFWOZwnf1ew2+VJiBxAqciA7zS
	jgLKgv5ueEHf19prLIeHeATeFPOnqbebWZI6X6K4kRvPLELVp+2cizPdPFsFc0n97knU
	ckL6iBgyOdQmlJgBkKAC/x6d35azuy7kK+ECVmn7d9tTz+hM8pExhSpl0YXZLcFu/CDt
	S8WC/LOyx35eDr1yPBQo3K0DOyjUPTvdbCTR5LtMlabGroUQoegj+A+fsCcTFV2cSLd4
	IjoAz1V/jlxivcYlisrrQHoG61pgmpv5GPrKOFRoQrsKH5FBXNA45Y5CdAmAJRLT0Ary
	eEdw==
X-Gm-Message-State: APjAAAU5e1FiZk44H6WZNYDp3LdCdd33KEewpyOlBBX52JokLXOfL7G2
	vuz6aqqvTn+4W/gpGrQXeLngHdsE7x7fpvzkknE=
X-Google-Smtp-Source: APXvYqwf/fTTJ4KclngHRrIDgvsQ+LVFndkJzZUaC7pufKYF4RknFF+zf4BiZEkvuVsRUoYn1OhITsGZaUvZGn8wEnM=
X-Received: by 2002:ac8:764f:: with SMTP id i15mr10360960qtr.194.1565991019103;
	Fri, 16 Aug 2019 14:30:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190816210605.62377-1-jason.wessel@windriver.com>
	<CAMKF1sqc4M-0ykKNhAao+sQk9WXwetqX4P6VLh44ypCv1LZKtA@mail.gmail.com>
	<283ea4a282885878d26308925690e3428a08c841.camel@linuxfoundation.org>
In-Reply-To: <283ea4a282885878d26308925690e3428a08c841.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Aug 2019 14:29:53 -0700
Message-ID: <CAMKF1sqMA37YFn4QRC7-60aKNoADsU7D8asW8Cmzu0zZhCe5iA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/2] cross-localedef-native: Add hardlink resolver from util-linux
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
X-List-Received-Date: Fri, 16 Aug 2019 21:30:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 16, 2019 at 2:25 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2019-08-16 at 14:22 -0700, Khem Raj wrote:
> > On Fri, Aug 16, 2019 at 2:06 PM Jason Wessel <
> > jason.wessel@windriver.com> wrote:
> > > The hard link resolver that is built into localedef cannot be run
> > > in
> > > parallel.  It will search sibling directories (which are be
> > > processed
> > > in parallel) and perform a creation of a .tmp file and remove the
> > > original and move the .tmp file in.  The problem is that if a probe
> > > occurs a hard link can be requested to the file that is being
> > > removed.
> > > This will lead to a stray copy or potentially, on a loaded system
> > > cause race condition which pseudo cannot deal with, where it is
> > > left
> > > with a hard link request to a file that no longer exists.  In this
> > > situation psuedo will inherit the permissions of what ever the
> > > target
> > > inode had to offer.
> > >
> > > In short, there are two problems:
> > >
> > >   1) You will be left with stray copies when using the hard link
> > >      resolution that is built in while running in parallel with
> > >      localedef.
> > >
> > >   2) When running under pseudo the possibility exists for uid/gid
> > >      leakage when the source file is removed before the hard link
> > > can
> > >      be completed.
> > >
> > > The solution is to call localedef with --no-hard-links and
> > > separately
> > > process the hardlinks at a later point.  To do this requires the
> > > inclusion of the hardlink utility found in modern versions of
> > > util-linux.  Most host systems do not have this, so it will be
> > > included with the cross-localedef binary.
> > >
> >
> > can we depend on util-linux-native for this ?
>
> This was discussed on IRC. We really really want to avoid that as a
> dependency if we care about build performance. Its really easy to just
> add that in but the implications are significant :(
>

A captured version of this utility would also mean that we have to
keep this in sync
for bug fixes and security fixes etc. which could also be considered
as expense, so
how much do we lose if util-linux-native is brought early into dependency chain?

> Cheers,
>
> Richard
>
>
>

