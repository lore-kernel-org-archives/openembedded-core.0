Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2D11771B31
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 00:33:27 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i189so8961916wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 17:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mHwrAwSHvpEK1I1rTmSl5e/+uOAodIcf/6XWyvIUymg=;
	b=por7NhkVjZxv8Y4H42zLpao1lxBGWpMkAtsx0+Za7ZlTYfQSU8eIna6H15VV4AGM61
	Bo0VfuVhlus4iodn68k8j6QwZ9W+syXWTeQx8pkLghnN3oVOZV4Paarsfolu+Zr/Vabu
	Pu6xND5wb98Xddpmd3K4SnXWOPOAthKQXamu0Hd07YmNp7MVThs1kXWmh1yn+Mvh2vzo
	MfXi6L4Q2gPpK3fkIVBzPGUkbqNX+wGpMANp3IsGWT/xrbLS2uY4umm9MQDqm+C3wKmV
	nhIV0ioSquf11b1qJ7j8DC5nYrrQv8qhD6o/LPgwKmDVXfsO6sx6UUZAzbpALRffkwtI
	ieUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mHwrAwSHvpEK1I1rTmSl5e/+uOAodIcf/6XWyvIUymg=;
	b=JGmw1gjxhJ1x1RWUCc3X2J3a7+U8mFRqQOSL8Vldzer+aIlcNZiHV3CYWUhWsOu9kn
	fyzuMTL71wSfvgbqkmaOti0zeRwxU0LRL9re+vBtPxYCandEbpsys3mjV1aKHaipd1LP
	bIC9NszIWzN6cTNTlZdaUrWXIobuAX9hjgB3cqyPCsKnAMr+u0sUGbqd86xzTjyCt5nx
	tJ5Wtc6lpf33RwAjI9Jav/arERgO+M+r5G/flUYlpOmW18rjFd7emyBIEsCG86RjZ4oA
	vOLiioUvwLTZhyfrKbY7OmbPnjyg7aNhRTCQaW7Tn7n6pzZTlXC0oyKOw0A48/UFrlXc
	NhJQ==
X-Gm-Message-State: AElRT7G63NumAR7Nf27Fwr2pIOP+shsuL0KnDI/UPuAFWlO6J5XCkDia
	WsT+HW1/zl5wF+d61VympDNOrhLaR7ImVlydkN8=
X-Google-Smtp-Source: AG47ELvG5jh3v9De4zzS3TIXdfPxBrHgXh0McAbzTOmZlkNs8Ldhx4Ci1F6SF2stxp/qCRVRJabb1aRnL4ldapU4QCA=
X-Received: by 10.28.170.205 with SMTP id t196mr10354996wme.42.1521851608830; 
	Fri, 23 Mar 2018 17:33:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Fri, 23 Mar 2018 17:33:28 -0700 (PDT)
In-Reply-To: <20180323185655.51d96c05@seebsdell>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
	<lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180323112820.12bc94a4@seebsdell>
	<CAJTo0LYfzA2i6GwJA0mODvNse8gy+=gYBk-T9dAUbR65bAVDZA@mail.gmail.com>
	<20180323114939.218c0607@seebsdell>
	<1521848850.11431.36.camel@linuxfoundation.org>
	<20180323185655.51d96c05@seebsdell>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 23 Mar 2018 17:33:28 -0700
Message-ID: <CAJ86T=W63x0epGUXyORsaXG-KEV41fcF5xaECaEXPG6zhyox_A@mail.gmail.com>
To: Seebs <seebs@seebs.net>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: pseudo: host user contamination
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
X-List-Received-Date: Sat, 24 Mar 2018 00:33:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 23, 2018 at 4:56 PM, Seebs <seebs@seebs.net> wrote:
> On Fri, 23 Mar 2018 23:47:30 +0000
> Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>> On Fri, 2018-03-23 at 11:49 -0500, Seebs wrote:
>> > On Fri, 23 Mar 2018 16:30:55 +0000
>> > "Burton, Ross" <ross.burton@intel.com> wrote:
>> > > Because in GNU's infinite wisdom they're using renameat2() to do
>> > > atomic renames in the mv command, and as renameat2 isn't in the
>> > > headers for F27 it just does a syscall directly. This is in
>> > > upstream
>> > > coreutils so once they make a release, everyone gets it.
>> > UGH.
>> >
>> > I... am really unsure whether it's possible to catch that, because
>> > I really, really, don't want to try to intercept raw syscall()
>> > calls. I don't think that ends well.
>>
>> Just out of interest for my education, why is that a really bad idea?
>> Loops, e.g. with memory allocation issues?
>
> Potentially. We rely pretty heavily on the assumption that an *actual*
> syscall can go through.
>
> Although... Actually, I don't even know if this is an actual syscall.
> This could be an actual glibc wrapper around the syscall interface,
> just like all the others, which is not the *actual* raw syscall or
> whatever,

It looks like coreutils calls into gnulib, which calls the libc's
syscall wrapper:

  http://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=blob;f=lib/renameat2.c;h=a295ec33f33dfe14e1d29cfae5d2c36e82d01ef4;hb=HEAD#l74

Interposing the libc syscall wrapper doesn't seem to scary if you can
transparently pass on everything apart from syscall(SYS_renameat2,
...) ?

> and... I have no idea how often that is or isn't hit.
>
> It's totally possible it would work, but basically, I have a pretty
> good intuition of when something sounds brittle and error-prone, and
> trying to trap syscall() sounds brittle and error-prone and might work
> today but not next week...

