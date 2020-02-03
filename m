Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0A5BF60CD7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 20:26:46 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id d15so18306198iog.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 12:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rKHuafV1EDbVsZlt6N6kfprrQCebIE9pUHEyb+kEwd0=;
	b=TPsVKUP/ZHGXyv2O4W2gKa71Lp973vphCSpisFbbKnYq7nSTARh9h04EN/N7xwUV9l
	nVb53z3Jpd0pfbuRZ+HVt0SevB1Wa/CyJ4QQRoldZyLyzphl0d9JIOKQ9LHQ/AjmKE19
	b1aZ/9G8xhFm4UfmGZl7+csFiZ+AuTJ+vdjJ1QecccNLfUlBl3GGinYuDJZWja/4uNC7
	TfSDjSZNyi0mxZOEveybuqkYJRvq3KpA5rn0BBjVzWVjnROW/CeFOA9WzosvvDl+YGvZ
	v6lbSem8dDlAArXjldDS92hssXP0ruEvi2aexxUoUKTsb65LOhpVZepShQiI0y0rlx4L
	ozWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rKHuafV1EDbVsZlt6N6kfprrQCebIE9pUHEyb+kEwd0=;
	b=thFbrgy9okgTuLXaXoplmk3AUoCNTh9965MrP/tbUO9iwF6tDOwX3ZSSWvOnM2N0TQ
	Xz1tuWd3/3GbfPOy5c9px1AjkwVJ/wEdzi0wx1Vh+VXXZgoNU2BIK0GhkFV3KOUH21uX
	M2BreXO7lS4yrEofkMIOiMwKm7kdWCx28ZKEX7wZP1rVwtejiRddm77H1lGA3Rflh0YS
	PGiuf9aJ2Vlq1gmWHamgfVL7N5AUJbtsORchaRZ+YJvNKRovYfZoBgJeQyHugOgmNW9o
	qtb1XhR3zOGKoOm/ehNlAPtEZOvTN8JM6gTl0fEnN2AmHFJgpNtp9+c28LSSoB6Or6k6
	yGQg==
X-Gm-Message-State: APjAAAUbuRCrZ5xfR1q66IIuGj6QU2pZmUtTlVwzzSOiFerDiFbiBXF0
	Ii6mpbmK2diipOQbMxFIM1HDsWkevKRT6CYEOY83m7Bb
X-Google-Smtp-Source: APXvYqwrmJ9gBrpZdldrQ7xRC2bC89s5kWqlOfYCv4XgkXkBeMFM8gQcIDTofBErGRGofjXcoVpEkQn20/1/PE3YCnE=
X-Received: by 2002:a5e:c60a:: with SMTP id f10mr20558698iok.295.1580761608054;
	Mon, 03 Feb 2020 12:26:48 -0800 (PST)
MIME-Version: 1.0
References: <20200127231306.46105-1-alex.kiernan@gmail.com>
	<b672e48f8e33b9ea75b9772321f2db0951b38942.camel@linuxfoundation.org>
	<CAO5Uq5SGEmZCDvfMN=d=q_m40OohtLozOHBmRji8snYj4MZEeg@mail.gmail.com>
	<CAO5Uq5SG16CTCdNT1O7DgGc2Y4qUXrDU8VU1f9ox_WCL0a1kgg@mail.gmail.com>
In-Reply-To: <CAO5Uq5SG16CTCdNT1O7DgGc2Y4qUXrDU8VU1f9ox_WCL0a1kgg@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 3 Feb 2020 20:26:37 +0000
Message-ID: <CAO5Uq5THBhHjkOH+r-yP3Y3nJF2KdVetoffmd2Cvy0LzSKzD+g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Upgrade 243.2 -> 243.4-latest
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
X-List-Received-Date: Mon, 03 Feb 2020 20:26:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 3, 2020 at 7:55 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> Hi Richard
>
> On Mon, Feb 3, 2020 at 2:13 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >
> > On Mon, Feb 3, 2020 at 10:26 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Mon, 2020-01-27 at 23:13 +0000, Alex Kiernan wrote:
> > > > Update to latest on the 243 stable branch. This includes (amongst other
> > > > fixes) seccomp filter changes which fix failures with glibc 2.31, e.g.
> > > >
> > > >   systemd-journald[543]: Assertion 'clock_gettime(map_clock_id(clock_id), &ts) == 0' failed at src/basic/time-util.c:55, function now(). Aborting.
> > > >
> > > > Rebase 0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> > > >
> > > > Drop 0001-unit-file.c-consider-symlink-on-filesystems-like-NFS.patch,
> > > > fixed in 5c0224c7bf3c ("Handle d_type == DT_UNKNOWN correctly").
> > > >
> > > > Drop 0001-seccomp-more-comprehensive-protection-against-libsec.patch,
> > > > fixed in 70e8c1978a9a ("seccomp: real syscall numbers are >= 0").
> > >
> > > Unfortunately something in this causes:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/109/builds/412
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/413
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/1545
> > >
> >
> > That's disappointing...
> >
>
> I'm failing to reproduce this - am I right in thinking the error I
> should be looking for is this one:
>
> [ 3.997360] ide-cd: hdc: tray open
> [ 3.999321] print_req_error: I/O error, dev hdc, sector 8388592 flags 80700
>
> or some variation on it?
>
> I've got testimage running across a number of the images I think are
> the ones that are being run and I can't get any of them to fail.
>

Scratch that... it looks like one of the local changes is necessary to
cause this - I'd foolishly reused an external source tree rather than
just letting devtool deal with it.

-- 
Alex Kiernan

