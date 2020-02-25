Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 90395616E1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 15:11:36 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id x1so1632447iop.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 07:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=wjqpKPG8rxK6Vm0MhqJDYjuMnxPZ6XVAhPNIjM2qLVE=;
	b=QWr1QdFkXGb2Q+1Lo5huN5ZxXN2cwtFjgACgTJd6IghQA2txPCGjLq1faxrAYUKv6o
	25OskzkNxtEPhC9LhYQutqTAie38U/J8C4YdIqAOIup3eqOtkKB6SHrCuZz+YIB3HG2Q
	Y9/JY8Xz5GQeIq8GEOFEs+rIHK28O7gmVPfpw7qdFHZm7uDkeUh3ekRONxhil+Y7TVs3
	0KceBVZPw+ThFnTdvpoNYhq12hVijYSTlcQQKIyL65clG15nM3bhHHuOnf1A7Na66SO2
	4REsdChGhj8YQIG9y2StDxXzazxsYeLI9LbRVD7Kn64uTiZtOHVP283uDf1XSCiyVpR+
	IvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=wjqpKPG8rxK6Vm0MhqJDYjuMnxPZ6XVAhPNIjM2qLVE=;
	b=erZTgjjVpwwErcqdYdvqvFqFGhhufMVDZph1xkgard33FzbQAlBBB5kncmQTejO0LG
	cK/5w8PuN/5OKosP8YveUNgJj8rQstGrLNu2hvzmWO+TMGtUIadiAOdFB5TIgcWHhb4g
	VChN++u9+gLA8lZIfaWR2DANQ7Cg298bapZjLXXGjlqCJ2zGVWgYVUUheLzVeEiN0OYy
	eqQbTShQADuVVftTc+Gp1SHmy39Ev4WnH31DYoPTNIF9u8nUXse3RBAqMhupJENUlWxa
	IQQmDl7jS9jOoyp0/KhLAj0EWizM+nZgtUrXqGeS2ZALYfQXffOom7ShVpSp4kW9M4Xq
	VvgQ==
X-Gm-Message-State: APjAAAWvXY/3Vb0GZEkhsrpWK+Gzo7x+bdDB8giapOx2B83dyGTDcxPu
	wdPAKWQjVAf3NqhTOwSpxNPw4XetkWte+7nf7aE=
X-Google-Smtp-Source: APXvYqycK5CtJGXI1lY0+FoxsmPdo1GOlUHss5DjDdbp8SqPB1zkpJs3Ju4Lr1gpdZFk7S7GSYy3b9Dvbh8hQaSECGk=
X-Received: by 2002:a6b:740c:: with SMTP id s12mr62890543iog.108.1582643497339;
	Tue, 25 Feb 2020 07:11:37 -0800 (PST)
MIME-Version: 1.0
References: <20200225054406.867243-1-raj.khem@gmail.com>
	<29622e48fc7ebf80aa002b2d1903f6d970af9d86.camel@linuxfoundation.org>
	<CALbNGRRvG9BT3noMne1c4Xc7ALJjT5KT+3eZtaMun=bT5g772A@mail.gmail.com>
	<0a3ecc0796a2737d8396d39c38bb08b2331ef08b.camel@linuxfoundation.org>
In-Reply-To: <0a3ecc0796a2737d8396d39c38bb08b2331ef08b.camel@linuxfoundation.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 25 Feb 2020 16:11:26 +0100
Message-ID: <CALbNGRS6dy2_3pbDoziJR+_AR_FnTpR75b9C8M9z4FtumeFAtQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mime,mime-xdg: Conflict with allarch
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
X-List-Received-Date: Tue, 25 Feb 2020 15:11:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2020 at 3:07 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2020-02-25 at 13:24 +0100, Andreas M=C3=BCller wrote:
> > On Tue, Feb 25, 2020 at 11:21 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Mon, 2020-02-24 at 21:44 -0800, Khem Raj wrote:
> > > > mime and mime-xdb classes add dependencies ( both runtime and
> > > > buildtime
> > > > ) on target packages, therefore recipes using allarch should not
> > > > inherit
> > > > mime/mime-xdg or vice-versa, this fixes subtle sstate mismatches
> > > >
> > > > [YOCTO #13805]
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > > > ---
> > > >  meta/classes/mime-xdg.bbclass | 5 +++++
> > > >  meta/classes/mime.bbclass     | 5 +++++
> > > >  2 files changed, 10 insertions(+)
> > >
> > > Is this the right way to fix this? mime info probably is arch
> > > independent, so should we be whitelisting some of the dependencies?
> > >
> > > Cheers,
> > >
> > > Richard
> > >
> > Khem and I had a short discussion about this [1]. His first approach
> > was to remove DEPENDS. As far as I remember the deps were added to
> > avoid QA warning.
> >
> > Honestly I never understood why these are spawned. If there is a fix /
> > workaround this could be reduced to rdeps which an be handled for
> > allarch.
> >
> > [1] https://github.com/YoeDistro/openembedded-core/commit/5605a9cf78c37=
31e2cc055cd4f8cc88a0b3d7e26
>
> I'd guess something like:
>
> SIGGEN_EXCLUDERECIPES_ABISAFE +=3D "\
>   shared-mime-info \
>   desktop-file-utils \
> "
>
> in layer.conf might be the correct fix. The other approach is just a
> workaround.

That would fix rdeps allarch -> cross only - right?. How to get rid of
the deps warning? @Khem: Do you have some logs showing what warning it
was exactly?

Andreas
>
> Cheers,
>
> Richard
>
>
>

