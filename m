Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 07D297F376
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 17:54:16 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id 2so4237415vso.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 10:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jSc+q9pF2qsuXsJ2jvdtSC9eQDVlHMtyjvWgH5OBouQ=;
	b=rDw8k2/Ji7owMXTI/ednA9dsaWwnSS3FFdcaCCSF3a6R3kaqolVDHIfTLzD+5Whyd0
	MGxEvH1kSrvaxyVZA+fhFUUDqY8HkFwxOMXT2iWl6t9VlBx4mlKQIq3+ul7B2U1HpojC
	t0C1dLFdViwDTHHdSxjzrNVtYPdBt4LmhYik4LPLHLqVsBEfqb5QConTdlewlFxxerJQ
	om0hPk5K5VHTBscxWG0xGmNujmdmTYkpPt8CXBgE9ToyqsIxl1SmD5XTYF09f5WC3LD7
	JJDJtJZ28EwozK8tQ/MNhbiTi0dYrcQctw7OuJ/Cn2TN8N5TXkHqIvlwBu/A1t5xTaFe
	cmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jSc+q9pF2qsuXsJ2jvdtSC9eQDVlHMtyjvWgH5OBouQ=;
	b=MnMdbW3Kc+u4NnyGtxaQnp8MgLT5l7+YsQeC8RXj+F/80+pUmNKIZ+TbAwA6/ryRQQ
	YTlT+3X/7bqL8cqOlsY6Atb/caS87ED2ykZtQtEq0cobgio9Zwh4g2tbD9xDmEq4HFpC
	zfuMQAx8MSuyS6TOLrkIKTuls1Bc4OAJQGOPaU5RMU5pAw/ph0vaXsTvr1O1nk+CWev1
	XsLHRGX+7xzlFAKifTbTQYCMwv66gmCoWgn97lcB9IwwaOwVoGXtG49J9e6zzIiWh/pp
	KYowBVFV10VL5HgU/M04E/Ujma0C0cM6jh4P7tvySKK+pU/52qmVcPq23U6OLzxWc4Kv
	hl7g==
X-Gm-Message-State: APjAAAVo7g1VMC1pXY+UAD38L31f1z9c93T0+XjTrXvTZ971xJQLwXGH
	+7rxArHltazEVxcmCG9OchssSlkxyJc7mPylURg=
X-Google-Smtp-Source: APXvYqzV6HF9b6wITEBS7x7s2x4Ma1vioefTRrD/TlUHdTKJem0QkzRcTt/LjvGnstKvSIpXAlfB5rdc92/r5AEjCfY=
X-Received: by 2002:a67:12c1:: with SMTP id 184mr7325366vss.222.1565978057785; 
	Fri, 16 Aug 2019 10:54:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190815065343.5291-1-naveen.kumar.saini@intel.com>
	<7128b7d3-78c0-0a66-8e55-65fedeab2dd1@intel.com>
	<CA+chaQeeS+Ludz64ke19Hr5h1knrvbe769N5vhMQLH7=E_dmbQ@mail.gmail.com>
	<b2ae3b8bff8bf0c2f42d588841347ad8b6844ef6.camel@linuxfoundation.org>
	<CAJ86T=Ux9UQs3eVJR5NOyZYJMMDtNRHr-Nppq0d5D5JFMryaMw@mail.gmail.com>
	<dc6b8ca1-411e-4381-e4da-7907052eca28@gmail.com>
In-Reply-To: <dc6b8ca1-411e-4381-e4da-7907052eca28@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 16 Aug 2019 10:54:06 -0700
Message-ID: <CAJ86T=WQfeU0jGFy-qWSKTKkBqGSkC34yw6w1q9wwoUKoYNsnA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [warrior][PATCH] bitbake.conf: add git-lfs to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Fri, 16 Aug 2019 17:54:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 15, 2019 at 8:45 PM akuster808 <akuster808@gmail.com> wrote:
> On 8/15/19 2:31 PM, Andre McCurdy wrote:
> > On Thu, Aug 15, 2019 at 2:09 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >> On Thu, 2019-08-15 at 09:23 +0200, Martin Jansa wrote:
> >>> NAK
> >>>
> >>> Yes, the first part was merged in warrior and is correct.
> >>>
> >>> But this second part isn't good (you don't want git-lfs to sometimes
> >>> work and sometimes fail) and that's why it was rejected for master
> >>> and _shouldn't_ be merged to warrior. If you have recipes which need
> >>> git-lfs, then add it to normal HOSTTOOLS in your builds to make sure
> >>> it's always present when needed.
> >> I don't like the patch but it did merge to master.
> >>
> >> Building a git-lfs-native is a nightmare due to all its dependencies (I
> >> think its go based?) and there wasn't really any other way to sort it.
> > Upstream provides generic binaries for at least x86, x86-64 and ARM64:
> >
> >   https://github.com/git-lfs/git-lfs/releases
> >   https://github.com/git-lfs/git-lfs/releases/download/v2.8.0/git-lfs-linux-386-v2.8.0.tar.gz
> >   https://github.com/git-lfs/git-lfs/releases/download/v2.8.0/git-lfs-linux-amd64-v2.8.0.tar.gz
> >   https://github.com/git-lfs/git-lfs/releases/download/v2.8.0/git-lfs-linux-arm64-v2.8.0.tar.gz
> >
> > Would just downloading and installing the official upstream binaries be so bad?
>
> making a big change like this seems to be a no-go for a stable branch.

Right. This probably isn't suitable for the stable branch. It would
obviously be implemented first in master anyway.

Point was just that if we made use of the upstream binaries (which are
completely distro independent as far as I can tell?) then a
git-lfs-native recipe would transform from "a nightmare" to almost
trivial.

