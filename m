Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id E0E767C38B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2019 12:07:06 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p6so10797249wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2019 04:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=zJHsd19SbQYVRvShNFU4B4rhaUG1UwQX9sKfIAo1P/I=;
	b=Y/6Ijbnra8x7vgd0eVfr3DxfV0a5aZMxbvOKWt6XFdndIY04UUjmGrFETiouU2YkB3
	MEkICVPY88gnpaWH7fEg8wNMMAA/tPLG2MAU5nRfGAt1X0z428XOnXqevRCIZQIKTJDc
	DJE2YLrhVLD8pYS/3RMeRGjM+SSH/1HE5IG9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=zJHsd19SbQYVRvShNFU4B4rhaUG1UwQX9sKfIAo1P/I=;
	b=RotDyC6pQx8Ei9llRgfXakBDN20ZZyvDgPb56H4C+c1AQgjAUBdCak4wyurVtB+Tg3
	Sy4EZ/GqxjNFqISHOVeFMkuB8vwf0LV7vBFzOtezauqgAlsoQYw7lVLvqeZKVvK9LM6P
	vwMsKYRqGADu7pIwA4kHb0+lJJrSmC6Gf7sDwKrUDZVyI26HPmDfhyLv3Z02OH3KqZwG
	ZsTUKygWpwRgeqqUvPXdg5VTtusyTEHThtMsmaCNbofXNJ4aEW3Npllz7XbadlC+9MXa
	v+xdO+iB9Eqam710Fb67IJ6GBqXays05GW1PeBHXnlKlGraVUgk+DchLI6JN0U1LGziK
	Z85g==
X-Gm-Message-State: AJcUukek3+a9T7EGpUHV4zWGPn3gcFYhPrzimOYU4Ij3TqaxepkbtmPr
	AF+Muxng2nB0LXUKWDxzQfMp6A==
X-Google-Smtp-Source: ALg8bN4esO40tvCeOgKpdcohCmp7c2VMcL6CEjiMRkXdYpIuUM5EyKUrf0rQAkRnLwJwSr7A/5OuqQ==
X-Received: by 2002:a1c:410b:: with SMTP id o11mr13555236wma.109.1548590827365;
	Sun, 27 Jan 2019 04:07:07 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t12sm104886625wrr.65.2019.01.27.04.07.05
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 27 Jan 2019 04:07:06 -0800 (PST)
Message-ID: <065b814a6d339bfc054b24fe8199044e6747e337.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alistair Francis <alistair23@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Jan 2019 12:07:05 +0000
In-Reply-To: <CAKmqyKNGxQuHsKndq9tNDNj8jmYdhBWHnaqM8Rc2h5OeZM_bZQ@mail.gmail.com>
References: <20190124223528.17455-1-alistair.francis@wdc.com>
	<30ebcccb5a7b406952657c5c6d031640e5f60a0a.camel@linuxfoundation.org>
	<CAMKF1sqCmskU=GmzXvHXVufnqdSieWmN8xvC4n9axNgL9GeM-g@mail.gmail.com>
	<CAKmqyKNGxQuHsKndq9tNDNj8jmYdhBWHnaqM8Rc2h5OeZM_bZQ@mail.gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
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
X-List-Received-Date: Sun, 27 Jan 2019 12:07:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-01-26 at 23:15 -0800, Alistair Francis wrote:
> On Sat, Jan 26, 2019 at 5:11 PM Khem Raj <raj.khem@gmail.com> wrote:
> > On Sat, Jan 26, 2019 at 3:27 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Thu, 2019-01-24 at 22:35 +0000, Alistair Francis wrote:
> > > > I don't see circular dependencies anymore between libusb1 and
> > > > udev,
> > > > so
> > > > enable udev support for libusb1.
> > > > 
> > > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > > ---
> > > >  meta/recipes-support/libusb/libusb1_1.0.22.bb | 7 ++++---
> > > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/meta/recipes-support/libusb/libusb1_1.0.22.bb
> > > > b/meta/recipes-support/libusb/libusb1_1.0.22.bb
> > > > index 0c6e116dd7..35c1d705b6 100644
> > > > --- a/meta/recipes-support/libusb/libusb1_1.0.22.bb
> > > > +++ b/meta/recipes-support/libusb/libusb1_1.0.22.bb
> > > > @@ -20,9 +20,10 @@ S = "${WORKDIR}/libusb-${PV}"
> > > > 
> > > >  inherit autotools pkgconfig ptest
> > > > 
> > > > -# Don't configure udev by default since it will cause a
> > > > circular
> > > > -# dependecy with udev package, which depends on libusb
> > > > -EXTRA_OECONF = "--libdir=${base_libdir} --disable-udev"
> > > > +PACKAGECONFIG ??= "udev"
> > > > +PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
> > > > +
> > > > +EXTRA_OECONF = "--libdir=${base_libdir}"
> > > 
> > > Fails in testing with:
> > > 
> > > WARNING: Nothing PROVIDES 'nativesdk-udev' (but
> > > virtual:nativesdk:/home/pokybuild/yocto-worker/a-
> > > quick/build/meta/recipes-support/libusb/libusb1_1.0.22.bb DEPENDS
> > > on or otherwise requires it). Close matches:
> > > WARNING: Nothing PROVIDES 'udev-native' (but
> > > virtual:native:/home/pokybuild/yocto-worker/a-
> > > quick/build/meta/recipes-support/libusb/libusb1_1.0.22.bb DEPENDS
> > > on or otherwise requires it). Close matches:
> > > WARNING: Nothing RPROVIDES 'nativesdk-libusb1-dev' (but
> > > virtual:nativesdk:/home/pokybuild/yocto-worker/a-
> > > quick/build/meta/recipes-support/libusb/libusb1_1.0.22.bb
> > > RDEPENDS on or otherwise requires it)
> > > WARNING: Nothing RPROVIDES 'nativesdk-libusb1' (but
> > > virtual:nativesdk:/home/pokybuild/yocto-worker/a-
> > > quick/build/meta/recipes-support/libusb/libusb1_1.0.22.bb
> > > RDEPENDS on or otherwise requires it)
> > > 
> > 
> > I am seeing these fails too
> > 
> > > Before someone sends a patch creating a nativesdk-udev please
> > > think
> > > very carefully about whether a nativesdk-udev makes sense and
> > > what it
> > > may need to look like.
> 
> What about just disabling the packageconfig for nativesdk? Would that
> be a better option?

Probably easier but what functionality are we missing out on in libusb
and do we need it? This might limit the functionality of tools in the
SDK?

That said, we've been without this so far so you have to wonder how
useful it is even on target...

Cheers,

Richard



