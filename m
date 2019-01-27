Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8BE7C7C35A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2019 01:10:59 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id t13so14800164qtn.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 17:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Egi4jfcnzwHCjFm+G6inK1QQcmHESrei9Fs9pWtYyyw=;
	b=n7G5HLylaQQ4VaOcMkpJBdoVdsZHigVfCfKM61BHjLmc6uJcbcFhgr9ZnlfuJqmRJr
	NLi/BH8v/8tNiVMrZTRzYp/rL/Z/WW7eW7lgByekfEFC7YpKjuHNG1jhkMzNfhr5fspn
	6hDZgBqYX2aV4KQxmrm1LlsvwYN+BueN3aTCev3xpGAXnsXQ0n7rsuoFB/PFG76dnt4u
	o1eRrb1q3yIjAt8dQaTIUAG63yRib9mHwk7IaMvi97IZar4Setvcg6xkoXZr4ZF1lUgj
	Jqz/BKvT7xf5huLUgSlRT5MKKT7Jfrmc+HOJ9tLrwMlYmmXoLUOM0ZXHMX8K59hANTJ7
	SF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Egi4jfcnzwHCjFm+G6inK1QQcmHESrei9Fs9pWtYyyw=;
	b=OpxdeyLsKHROog+mPmA0cl7e4gcV3iwXwkNRVqbAWCKbvwLYFhicgCoKZjS1JbIgpB
	VDwluMXr51eyJuoOS+LgiJHJLselqZ2r1jtSnnxJA473YHQk/gWRXAIXkm1unb0eo7xT
	9n1wD+zKyk2QCHm9Mg3PVlZlnIQBbpxOe0XcfdxiklfrKBVQOw5LWwQ9A/tj/0zb2MEq
	hksrUf9y3GkWUc+4SFThVZX49217MOUg8Dnw7ldmqTh9owiHCY0tzLjCJADBCQKlvXhL
	Yon/bCKJhdr9XEwI4bF1dyjhExEnnsXAYradEtMDdjoFRdQ/bwB5AVBdPaUWdh9l8yAK
	oG6Q==
X-Gm-Message-State: AJcUukcD5wykcRdLFtf71CKj1NaA6e7YXH+Lj3hvg6Yybz4MDX9JhB8V
	qkL4MUguRRqagP1U2UNZPZFMIh2oqSzO7E8OMIg=
X-Google-Smtp-Source: ALg8bN5h6hlu07VqpMQ6HEx9MV3XvXUoTH0574wCDYjHkvd+Fb2o+Kn4qfDJThja1yt0rBXF0xlsydZP4cVk6dxGWwA=
X-Received: by 2002:ac8:16d8:: with SMTP id y24mr16747638qtk.253.1548551460095;
	Sat, 26 Jan 2019 17:11:00 -0800 (PST)
MIME-Version: 1.0
References: <20190124223528.17455-1-alistair.francis@wdc.com>
	<30ebcccb5a7b406952657c5c6d031640e5f60a0a.camel@linuxfoundation.org>
In-Reply-To: <30ebcccb5a7b406952657c5c6d031640e5f60a0a.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Jan 2019 17:10:34 -0800
Message-ID: <CAMKF1sqCmskU=GmzXvHXVufnqdSieWmN8xvC4n9axNgL9GeM-g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] lubusb1: Add udev support
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
X-List-Received-Date: Sun, 27 Jan 2019 01:10:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 26, 2019 at 3:27 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2019-01-24 at 22:35 +0000, Alistair Francis wrote:
> > I don't see circular dependencies anymore between libusb1 and udev,
> > so
> > enable udev support for libusb1.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  meta/recipes-support/libusb/libusb1_1.0.22.bb | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-support/libusb/libusb1_1.0.22.bb
> > b/meta/recipes-support/libusb/libusb1_1.0.22.bb
> > index 0c6e116dd7..35c1d705b6 100644
> > --- a/meta/recipes-support/libusb/libusb1_1.0.22.bb
> > +++ b/meta/recipes-support/libusb/libusb1_1.0.22.bb
> > @@ -20,9 +20,10 @@ S = "${WORKDIR}/libusb-${PV}"
> >
> >  inherit autotools pkgconfig ptest
> >
> > -# Don't configure udev by default since it will cause a circular
> > -# dependecy with udev package, which depends on libusb
> > -EXTRA_OECONF = "--libdir=${base_libdir} --disable-udev"
> > +PACKAGECONFIG ??= "udev"
> > +PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
> > +
> > +EXTRA_OECONF = "--libdir=${base_libdir}"
>
> Fails in testing with:
>
> WARNING: Nothing PROVIDES 'nativesdk-udev' (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-quick/build/meta/recipes-support/libusb/libusb1_1.0.22.bb DEPENDS on or otherwise requires it). Close matches:
> WARNING: Nothing PROVIDES 'udev-native' (but virtual:native:/home/pokybuild/yocto-worker/a-quick/build/meta/recipes-support/libusb/libusb1_1.0.22.bb DEPENDS on or otherwise requires it). Close matches:
> WARNING: Nothing RPROVIDES 'nativesdk-libusb1-dev' (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-quick/build/meta/recipes-support/libusb/libusb1_1.0.22.bb RDEPENDS on or otherwise requires it)
> WARNING: Nothing RPROVIDES 'nativesdk-libusb1' (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-quick/build/meta/recipes-support/libusb/libusb1_1.0.22.bb RDEPENDS on or otherwise requires it)
>

I am seeing these fails too

> Before someone sends a patch creating a nativesdk-udev please think
> very carefully about whether a nativesdk-udev makes sense and what it
> may need to look like.

>
> Cheers,
>
> Richard
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

