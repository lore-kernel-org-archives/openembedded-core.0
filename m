Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id C404761221
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 17:54:30 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id p14so4806986edy.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 09:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fiovcG4E987DH/4G7Vijl0fez35LGnidU/TFF+wlPKo=;
	b=sdTaIVI/67N55QaezmjnzRxvlwvdddkPKq7RRER6ebBA9e2Wpc6nuOY74xPZuYjMYn
	1xr25YqZ8XLljCxjrlV2xX0qyrYy2Do88KQpwjAVbsXTYXI/3Kp9S9LJStPNunD4xwOe
	sAKsMtdkVKu7qEgn8IEsJtobAU8cIOkZZMKteSfOTABaNxtoyqU4ArtOMgfbDZ3L/LDB
	hDaO1Ou0O9ugcazBZOFfKyX9ipXXopm/howfTqAGQqJG1SCc/8nzgM4rEF22ydnsAcBo
	c+1zyO9rNVQ+qG5YaNX14ksYFcczP3mAm1vnwum3nXriDFaqSrHihezh67kEfCFm+0UG
	OGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fiovcG4E987DH/4G7Vijl0fez35LGnidU/TFF+wlPKo=;
	b=U26EiOJVTOG+J+xmbfeKjgMh0faUczijBJbpRfzb40F5r8hRgESgmdmPgNEjn9Zq6o
	UrnVqbjbx5MN/xKROcMKWKuNis9MV41qPu3+jb4ijH+5y77y8UPEKRm4JY/c0itH90ME
	YhDnVPoQB0/AQ3ly3NwkkI4eFYJKgSyRqYkhLyghoZn6ec1gSZ1swuoOD5NRcZuxUKXe
	Jq1nhSXp2o1oEPFRXoxG92rJMGb4wpKt9w23GBQcvVaQwkPn95Cd1NRLWWH20peD1DXC
	+wsG9g76YZKDHYcGlj/No5IXSRYZaQe3+zyGu2uLTX3XbkLABBSgx4pHyUTelwKjXz7Y
	ex3Q==
X-Gm-Message-State: APjAAAVdMYB3koFeG3BUc4WGw7Mx80EzpjkCUyLOzEtzEh08pS90r2oR
	o+4SQGTSYpemFnnCQFIbSY+wpxLvu4xS305WLHg=
X-Google-Smtp-Source: APXvYqwHDLy8cp0SiOoHohSJKDmpjjJZbq++1r5vpt7zrnmJsZlPfgqJVXB1RIc/t9OVUTllZ2HqTh2Afw75CCJr8fQ=
X-Received: by 2002:a50:ee8d:: with SMTP id f13mr440591edr.347.1582739671410; 
	Wed, 26 Feb 2020 09:54:31 -0800 (PST)
MIME-Version: 1.0
References: <20200224200202.61426-1-bruce.ashfield@gmail.com>
	<beec08fcb1f0b492dced91217f2fdd598228f87a.camel@linuxfoundation.org>
	<CADkTA4NCvFGgq=dDBPs=Mi5qUbFqZ6C7Xy=KJp71+EVw-CsvWQ@mail.gmail.com>
In-Reply-To: <CADkTA4NCvFGgq=dDBPs=Mi5qUbFqZ6C7Xy=KJp71+EVw-CsvWQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 26 Feb 2020 12:54:20 -0500
Message-ID: <CADkTA4PNSPdxqFUc7FwiwtUiRcGz4f0+idRb-n4rmyKQx46ZLw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto/5.2: update to v5.2.32
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
X-List-Received-Date: Wed, 26 Feb 2020 17:54:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 26, 2020 at 8:26 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Tue, Feb 25, 2020 at 11:47 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Mon, 2020-02-24 at 15:02 -0500, bruce.ashfield@gmail.com wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > Updating linux-yocto/5.2 to the latest korg -stable release that
> > > comprises
> > > the following commits:
> >
> > This was included in testing on the autobuilder and we saw:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/1612
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/315
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/1616
> >
> > and I'm not sure if they're from this?
>
> Me either.
>
> Hopefully one of the Wind River guys can have a look, otherwise, I'll
> poke at it next week.

I did spin up a patch of master + my version bump patch, and I am able
to complete the test locally (core-image-sato-sdk).

That permission denied error is very strange. I'll check the commits
to see if any of the scripts/Make* changed in that stable version, but
otherwise, I'm not seeing it and only have guesses as to how the
version bump could trigger that.

Cheers,

Bruce

>
> Cheers,
>
> Bruce
>
> >
> > Cheers,
> >
> > Richard
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

