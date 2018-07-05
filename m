Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0E292789E1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 10:10:17 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id d74-v6so4543744vke.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 03:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=V5imqoCz/ZGkNqTdHG6zORAH4EBR6RgoZBSznYJ6Opo=;
	b=mg/DeqG0GqO59QHwFUgUGD0n7DP4GtMDrFswy5ASl9VaJY9a/fH44Tol486SvXFPE6
	cMfS41lRW8Lg4yGBvPuWTlV2OUu5rn8tcWVtcW7vkbfp4Rr6syNra/yLVM2aDLvXTCeX
	JppmSsqdV0MgCILN8pBJ5guKGtW75TS+utI58U0JdPUo5/iHVUxRysFI55bPQF+9Sfi6
	ZQpHYVUH6BGQ/sinNqLYOtjxV7E6UNFCs/Utc7WnZgG+hmbC3EGze297uYm1+tzq86kT
	RXM6+xgWTM0UTuAubfQtWgHQmIJ17p00Yv99UPF3+em9lnQ4VzYNS8w6J9xPFYnnvw4e
	SMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=V5imqoCz/ZGkNqTdHG6zORAH4EBR6RgoZBSznYJ6Opo=;
	b=E2LXsom1Ml1XpPjj5UNzEy3sWRKjWshy4OSMVZOHwOOkr/AibP9VJJQZ9uN6mpdkW4
	WJGFcrqFDEEMi3vjaGl5HpwGxwStKjyCUFeoIETd25b/6Alzw7Svl4XIJ4Zi+mgaBdy2
	sJfk6NoKxyChr1KQ+xaeTZoN6HxsI8eN5tLxMxTz1dHIUo7nJ9M9tqG0EOr+PLMOMiCZ
	MctDwBfGB+6hzkeoASzfqcG2SxDL8igfFANu8atcAtvaA+wzV5CYzG3ULxQ+xYcUWM1m
	PRCwHJ3v1CVV2ITO01SvDBofsXU7Q6Lh9/A2ZmjHKy9pHfMiJSlNzLWLYFmAaKC/HkZN
	caJA==
X-Gm-Message-State: APt69E1d0Tno2cuXcmzhy231EGZzo/kjRe1rt3+NIgxW8CO0Ggo5UEl0
	MlOUhGg6fAChnc5Zpkj4A4YE1ziAkSO15nm1nRg=
X-Google-Smtp-Source: AAOMgpdHUOx3zuRyioZBtrj+A1JGq/7inDM4Qc8rsuWziAj7fYVuvwPQkSKA4x+Qem6QyPlbPV7lbxwp9uG9jZlDcpw=
X-Received: by 2002:a1f:3cc5:: with SMTP id
	j188-v6mr2898358vka.156.1530785418841; 
	Thu, 05 Jul 2018 03:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <1530441211-30826-1-git-send-email-alex.kiernan@gmail.com>
	<6b743d05-aa53-bb1c-f96b-f604a77d2911@topic.nl>
	<CAO5Uq5QqToYKu21=eKb7esa-Otxp3epBsn6ExB33Zm0GhUSEiA@mail.gmail.com>
	<CAO5Uq5Qt9BV4gtROQrDW7+1Szs8226dPc7JnvrUszB0ZyA1LYg@mail.gmail.com>
	<536e0253544bf237adf96c6efd2c1712dda715a8.camel@linuxfoundation.org>
	<d3e8ee41-54be-3620-880f-86b067b0f35d@topic.nl>
In-Reply-To: <d3e8ee41-54be-3620-880f-86b067b0f35d@topic.nl>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 5 Jul 2018 11:10:07 +0100
Message-ID: <CAO5Uq5TiV-owc+7h5HJ+aeCHzxCt20FXjzyFPXQqWYcRA_BmQg@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssh: Add dependency on ssh for sftp
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
X-List-Received-Date: Thu, 05 Jul 2018 10:10:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 5, 2018 at 9:58 AM Mike Looijmans <mike.looijmans@topic.nl> wrote:
>
> On 02-07-18 23:13, Richard Purdie wrote:
> > On Mon, 2018-07-02 at 18:44 +0100, Alex Kiernan wrote:
> >> On Mon, Jul 2, 2018 at 4:06 PM Alex Kiernan <alex.kiernan@gmail.com>
> >> wrote:
> >>>
> >>> On Mon, Jul 2, 2018 at 3:55 PM Mike Looijmans <mike.looijmans@topic
> >>> .nl> wrote:
> >>>>
> >>>> The sftp-server runs fine using dropbear as SSH backend, I'd
> >>>> expect the same
> >>>> to be true for the client. Isn't that the case, and will the sftp
> >>>> client only
> >>>> work with openssh's ssh?
> >>>>
> >>>
> >>> Interesting question... I hadn't realised dropbear didn't have an
> >>> sftp
> >>> client, but it's clearly a supported combination:
> >>>
> >>> https://github.com/mkj/dropbear/blob/1656db9e58e7e8188e4ca27ae4892b
> >>> 14949c56a5/dbclient.1#L159
> >>>
> >>> I'll amend the patch so it depends on ssh not ${PN}-ssh since both
> >>> dropbear and openssh provide that.
> >>>
> >>
> >> Hmm... only that gets you this warning:
> >>
> >> NOTE: Multiple providers are available for runtime ssh (dropbear,
> >> openssh)
> >> Consider defining a PREFERRED_RPROVIDER entry to match ssh
> >>
> >> If you've not set it, which feels like a pretty poor upgrade
> >> experience; I'm not sure how best to deal with that.
> >
> > This is not an easy problem to solve. This is why we have the horrible
> > VIRTUAL-RUNTIME_* variables, I wish there were a better way...
> >
> > Basically, bitbake has to have some idea which one to build, letting
> > the package manager decide at do_rootfs time isn't really good enough
> > for deterministic builds.
>
> The dropbear/ssh choice seems to be one that is being postponed until image
> creation time. There's an IMAGE_FEATURE that appears to make the choice:
> IMAGE_FEATURES += "ssh-server-dropbear"
>
> Since you're building openssh already, there's no need to instruct bitbake to
> build more at package compile time.
>
> Using RDEPENDS and PREFERRED_RPROVIDER or VIRTUAL-RUNTIME will 'break' a lot
> of existing setups by installing the wrong ssh client without the engineer
> knowing about it. And it will also make it impossible to build two images with
> different choices. I can imaging you'd want to have a small size "recover"
> image with dropbear and a large size "full" image with openssh in the same
> build for the same machine and distro.
>

So, is the short answer, that there's no good answer and the status
quo is the way to leave it?

--
Alex Kiernan

