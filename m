Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2B44F7F93B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 00:27:36 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id t5so15784174ljk.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 16:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LNkBGYVJ+lcjbB4NDuIwyHkAvNk8LfKWSa9jnoNfCdc=;
	b=qOfQRTpbKMRtQ1gnx0LqbRL7WatX9O0qFXyNNynw688hRJHFKOfy1jbgdyeTWboHPD
	PbGv3nqelwXRlaFvO9ICfgJjaLHuf8WemXlIRS9HMcqOvNnEFDAmsy9ObfBOT1tsYYVr
	cPZ3N7Pv1AdzEDBvhyKiVjsnBpqx4DY0h4SyQPi1KkfzWPyYXP/AeLRb1Um3gP3bm90m
	Z6dc4KkL7uzb+fAI/K6Yo6VG649bcy/w/SKDdqvxQs96LScIWOtp3WJnRM6ImqiUvCxk
	lL4FYTlgX/RYLqeSaqpmrw5DZZEl3+GHEZ5ZGzqAqcs0o6uFEAiEn8/7fbTEYv1FWhX/
	xeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LNkBGYVJ+lcjbB4NDuIwyHkAvNk8LfKWSa9jnoNfCdc=;
	b=Li9avcuCoH41cbxOPXJpb2KRGowxXB8a2+nrQKBnpH8iR1E8FhoVybaD33UHNpawn2
	jnWjUiE2uHY896pwKTgSRCcnHJrvQ39LyFPV7lJl+YgBUO0iiNZzrMKyfvECYcxseEHR
	27sXjeP5UXcdfC6xr7ms1hXsz1hBbsOO9cTgPgWzjNU/eq3TDib0QpN3PbUJR97iSALc
	/aN4aY1PUVLcv6CMPzuGBZD+2w/PS8b9veyqjNf7GY3qAJZfqbvkC5v9IDHdTDrF8GVc
	baTn5AxqK09cm8GKAqxNDkIHPQg1PzV/r+SSHJUfJT9CON+bwVU8uieDuckSdrUCSsSb
	uViA==
X-Gm-Message-State: APjAAAXvaueOucLLhMB52lPZQphBWAS188Bx0Ba+DL21vCNzsogLsghU
	1rRDRIko2JQ6AzVqp2VfVIvrMQL2bF6gwRCfEuw=
X-Google-Smtp-Source: APXvYqyWug0eZlS1RmjNN2P0xtk7zWhikoEEPMEWPXhPtgy7xwxudr2gB/vVRwEZBWbhD2OckiZLAugmHif25W5JtU0=
X-Received: by 2002:a2e:b54d:: with SMTP id a13mr18215223ljn.4.1573518456783; 
	Mon, 11 Nov 2019 16:27:36 -0800 (PST)
MIME-Version: 1.0
References: <20191106181819.12517-1-alistair.francis@wdc.com>
	<20191106221250.GD14721@localhost>
	<CA+aJhH3s7NhB-4YspmXrvrcG4py1=i2fJXg=seWPkJzosqVFGQ@mail.gmail.com>
	<CAKmqyKNVrqT9hHQxp38=72bBkz405P=6UJFPODxr5OLt_GSqDA@mail.gmail.com>
	<20191108202438.GA21138@localhost>
	<023265d217840d956c5e54d12591d7cfdd0442b5.camel@linuxfoundation.org>
	<CAKmqyKNENL0De4uJqDDn-04-QZb2za6NXt2e+yU9fWZAY6jpMg@mail.gmail.com>
In-Reply-To: <CAKmqyKNENL0De4uJqDDn-04-QZb2za6NXt2e+yU9fWZAY6jpMg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 11 Nov 2019 16:21:48 -0800
Message-ID: <CAKmqyKMagAEJUSnhM2H_YwQewLEPA1H-Kp1nn4HP9nOgmbwZvg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH 1/2] tune-riscv: Add support for hard and soft float
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
X-List-Received-Date: Tue, 12 Nov 2019 00:27:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 8, 2019 at 3:14 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Fri, Nov 8, 2019 at 3:07 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Fri, 2019-11-08 at 22:24 +0200, Adrian Bunk wrote:
> > > Especially when looking at the arm64 situation I am wondering
> > > whether the best option might be to throw away the tunes mess and let
> > > the user write the compiler options directly.
> >
> > OE once did that. I think anyone who lived through it would say that
> > the current situation *is* an improvement over a free-for-all.
> >
> > This is mainly as at least we're now consistent whereas before the same
> > thing had different names in each BSP.
> >
> > I don't know what the answer is but I don't want to go back to that!
>
> Ha ok. I won't argue with that.
>
> I can just carry the patch locally, so I'm not in a rush to get this
> in. I have reached out to Rich (musl maintainer) to see if he has any
> ideas.

I just realised I got my wires crossed here, ignore this.

Alistair

>
> Alistair
>
> >
> > Cheers,
> >
> > Richard
> >
> >
> >

