Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id B11027CB9E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 18:33:19 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id z14so2207404oid.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 10:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4cwUAKm+pQWfPJ4M96A2FRgZ+ys9dYrJwhpy2Aatcvo=;
	b=IgMU3CD4L3yGrJXnukJOWjkFc7YJazZa7bBOR1xHOor7Wwa5QpGA/d8uFee+C24LJ/
	eMFlQ/1YqkAkwVbhRLro0smc8IiL2B+3gqgumq8CbeMu8SMq6CXMOt8zvu0Zv5+kX8Xp
	8crYFicdHR60zKs5pVHBTZ+3HIPrenP80ydpj01xElYj9UdNJgHMiHuEi1J3Ei8ZARM0
	0tAjZmzoVKy0H+Te+EA5uUwEovyUphJytGky2F/4fMaOTTI5UEeIShEbB0ASAUO8FIPb
	fBkigmP+YAaV9kydspk3n0ERC6kZUlq9DnJgtJrocCs+cFsPSPNALaGsSAsnnbggqGXU
	R9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4cwUAKm+pQWfPJ4M96A2FRgZ+ys9dYrJwhpy2Aatcvo=;
	b=WC0UuKzbgC7p1/H1mTcrDlOt4Uyk/Y3THApW2uleOQSBgNQZ8HyWAEvOLHZ8o6++mS
	Br7AAyCghk8aYHGdUXzz3lVkRRZDVRr1nG7/iQP9qjCqO/Degh7Zujukt6XOUB+v/+Ck
	U8C/xMY1SqwVhxBcT+Ts/rxvojgTXhMkIxHmx+TDDQejcYPJ2/kkhZjq7xir67VFtjJi
	OXummIxdnXy/R1X371U+H37MigK7D9ME0+sdjvhHPszF9uJERlwBtJxDXyTEnBJuz5CI
	pu1hCpTIvEE6vIA6UBJOQiX86GBiI2IP9fsMyQG40k0wnbYJNMR765psgT0J8EYIPx/x
	+xmA==
X-Gm-Message-State: AHQUAuZMd3HFIleY0YquFZeT+0ELLmczJkOEembPXpsg5YtK/vDz6YF/
	RLxievfb/6MYcxiCXn/DbV7N7h3lbwd4xxfqjbBCREqVlqw=
X-Google-Smtp-Source: AHgI3IZFJa83nwh2sIj7e5SDVVypJcuf7Rd0YiFsf1ey8rvvl4o/B7YipZ7IIR0AH1f1FshaFw3sObSycr7NBDteyto=
X-Received: by 2002:aca:bb46:: with SMTP id l67mr9918085oif.119.1550774000587; 
	Thu, 21 Feb 2019 10:33:20 -0800 (PST)
MIME-Version: 1.0
References: <cover.1550755109.git.tanuk@iki.fi>
	<CANNYZj8f0SMDZd3wryCZ0A2=RjLfOAR6q5=bLsV+QgWDakJ_7g@mail.gmail.com>
	<CANNYZj-8euMhvqpAwHoZfofAm=FdCtJSb9i7QOMiTGMhv=322w@mail.gmail.com>
	<236c2e06d12bde612ffa2399cedb9bbfce7dd5dc.camel@iki.fi>
	<CANNYZj-PdeoHukCN7_i8RgZDYRCS3dc3xWDhKXvuienyNzUFVA@mail.gmail.com>
In-Reply-To: <CANNYZj-PdeoHukCN7_i8RgZDYRCS3dc3xWDhKXvuienyNzUFVA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 Feb 2019 19:33:08 +0100
Message-ID: <CANNYZj85xGjdwMLRc3EzWzyZh6xBc+-GKhM5hwyxf3uXjS5epw@mail.gmail.com>
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] alsa recipe updates
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
X-List-Received-Date: Thu, 21 Feb 2019 18:33:19 -0000
Content-Type: text/plain; charset="UTF-8"

ftp://ftp.alsa.org seems inaccessible or unstable:

https://autobuilder.yoctoproject.org/typhoon/#/builders/70/builds/317/steps/7/logs/step1b
(also can't open it on my local machine)
and generally we prefer http:// sources over ftp, if available.

Alsa does have one: https://www.alsa-project.org/files/

so can you please resend with SRC_URIs changed to use it? (also for
alsa-tools and everywhere where the ftp is currently used)

Alex

On Thu, 21 Feb 2019 at 19:09, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Bah, and I often point out to people that they should read *my* cover letters :)
> Thanks!
>
> Alex
>
> On Thu, 21 Feb 2019 at 17:41, Tanu Kaskinen <tanuk@iki.fi> wrote:
> >
> > Richard already sent the update for sbc, so I left it out. As for alsa-
> > tools, if you read the cover letter in more detail, you'll find the
> > answer there :) (Spoiler: I'll send it, but it's not ready yet.)
> >
> > -- Tanu
> >
> > On Thu, 2019-02-21 at 15:57 +0100, Alexander Kanavin wrote:
> > > (Also sbc needs an update, I think)
> > >
> > > Alex
> > >
> > >
> > > On Thu, 21 Feb 2019 at 15:56, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > > > Thanks! Will you be also sending an update to alsa-tools?
> > > >
> > > > Alex
> > > >
> > > > On Thu, 21 Feb 2019 at 14:34, Tanu Kaskinen <tanuk@iki.fi> wrote:
> > > > > The following changes since commit f15ceac287c094abdeda64b03628455d92e0ce74:
> > > > >
> > > > >   libdrm: Upgrade 2.4.96 -> 2.4.97 (2019-02-20 21:22:28 +0000)
> > > > >
> > > > > are available in the Git repository at:
> > > > >
> > > > >   git://git.openembedded.org/openembedded-core-contrib tanuk/updates
> > > > >   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=tanuk/updates
> > > > >
> > > > >
> > > > > The alsa-tools update is missing, because the recipe upgrade deadline is
> > > > > near and the changes in alsa-tools look like a potential rabbit hole.
> > > > > I'll send the alsa-tools update separately when it's ready. The main
> > > > > change in alsa-tools is that the hwmixvolume program got ported from
> > > > > PyGTK to gobject-introspection, and from GTK2 to GTK3. I doubt anyone
> > > > > actually is using that program, it's not even built by default.
> > > > >
> > > > >
> > > > > Tanu Kaskinen (3):
> > > > >   alsa-lib: 1.1.6 -> 1.1.8
> > > > >   alsa-plugins: 1.1.6 -> 1.1.8
> > > > >   alsa-utils: 1.1.6 -> 1.1.8
> > > > >
> > > > >  .../{alsa-lib_1.1.6.bb => alsa-lib_1.1.8.bb}  |  4 +-
> > > > >  ...plugins_1.1.6.bb => alsa-plugins_1.1.8.bb} | 84 +++++++++++++++++--
> > > > >  ...s_1.1.6.bb => alsa-utils-scripts_1.1.8.bb} |  0
> > > > >  ...lsa-utils_1.1.6.bb => alsa-utils_1.1.8.bb} | 10 +--
> > > > >  .../recipes-multimedia/ffmpeg/ffmpeg_4.1.1.bb |  2 +-
> > > > >  5 files changed, 85 insertions(+), 15 deletions(-)
> > > > >  rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.6.bb => alsa-lib_1.1.8.bb} (88%)
> > > > >  rename meta/recipes-multimedia/alsa/{alsa-plugins_1.1.6.bb => alsa-plugins_1.1.8.bb} (51%)
> > > > >  rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.1.6.bb => alsa-utils-scripts_1.1.8.bb} (100%)
> > > > >  rename meta/recipes-multimedia/alsa/{alsa-utils_1.1.6.bb => alsa-utils_1.1.8.bb} (92%)
> > > > >
> > > > > --
> > > > > 2.20.1
> > > > >
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-core mailing list
> > > > > Openembedded-core@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > --
> > Tanu
> >
> > https://www.patreon.com/tanuk
> > https://liberapay.com/tanuk
> >

