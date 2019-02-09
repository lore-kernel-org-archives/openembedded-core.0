Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8DD1379CE4
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Feb 2019 06:46:23 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id a48so6599370qtb.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 22:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=z47jhGPC1mVUHEppKNPfKc4clhBgnd6TJYMEnQ0mRVI=;
	b=blpDyQtGDJeFU3HHPknkttcJgJl1JI3PSfnjTkz1YBzx+5Ru/IRRJThz6L8lo2jrrM
	ZMCBikzwjJFkgEs4NqyDQ7vt5Har5JrGIUP5i6L8pL9i2Gh7TRZwIwvHM4HlI1t9vjEr
	0kxMGzu02d1Ca/FRrRCRK+hsQZTlL831nxKugsJkaaL9/V5Z1FiEl8Haz4j3n0TK+GhF
	d3nrjM6C8BycLo/pHTnNEJRlT3VUvRkTR5gTKA1bHUyXBRHTyJbnlJddvvNcncd5K6BG
	V/YMb3eH7s6YaxB14kidbZ7SyxEhU7ye+UZYFhE+6FimwkM7L63CrqthzVcyWhCFzWmA
	izpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=z47jhGPC1mVUHEppKNPfKc4clhBgnd6TJYMEnQ0mRVI=;
	b=CNRX7opRF7RxQ1dtozJgoCOZZ+HneNFSP3fsL2CWyfXe3LgJJwDHjtkvHf418qQj0J
	xeBm/i1VAXMFz0F/iBBJ7/7PWDoLp6kvsiTBQgD2H6sjDLL0cQsga/e0xbQweO6mddoC
	2Qhz/+KJWM8qL4+5XISImoBdw6w949sl92i3RgpOWHK5q2Ryl74pwnnX2JZvAT9uS7pS
	vhHvovQTkO+5mMozVEdUpCqn8gYHsBW9AjteaXE32q1BDtJu7ZYRaHoxYOdGHIWx5LhZ
	TwhHd9QuphFzcnPwBENhRt8+8HLu8nN0q1jvppDYzcg9jhNdIti8iLrbBnx0QjKMqOgW
	qHSw==
X-Gm-Message-State: AHQUAua2hst4DZjdHq4x2MiV/5jmqxV5Y7DOh87sT9qy9cN7+LVtm7fO
	gP6G3VyMWDA/X9wEGa2wd2pAy0VGPbFmrqFuVX0=
X-Google-Smtp-Source: AHgI3IagIXC16cZJh8+4PL/zh7KCE0NyGjeC+fZSSrra6/EUH2uhBmSvV3zXRru91sXD+XaOkPzjcc2eg/wtvxC6bnc=
X-Received: by 2002:ad4:41d0:: with SMTP id a16mr19227010qvq.55.1549694783866; 
	Fri, 08 Feb 2019 22:46:23 -0800 (PST)
MIME-Version: 1.0
References: <20190209012850.17425-1-raj.khem@gmail.com>
	<CAJ86T=Ug9meGkuDsg2=meaqB=rephcMCkgiu3Dw3Qd476yrsRw@mail.gmail.com>
In-Reply-To: <CAJ86T=Ug9meGkuDsg2=meaqB=rephcMCkgiu3Dw3Qd476yrsRw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Feb 2019 22:45:57 -0800
Message-ID: <CAMKF1so5Hw17zEhJ8JZxSWMM9btYSE63Pfn42bh+x=yOH=TJoQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types.bbclass: Set 70% RAM memory usage limit for xz
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
X-List-Received-Date: Sat, 09 Feb 2019 06:46:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 8, 2019 at 7:27 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Fri, Feb 8, 2019 at 5:29 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > when building with opkg backend and huge packages e.g. chromium/llvm all
> > going in parallel, memory pressure causes xz to catapult with
> >
> > do_package_write_ipk: Failed to create package, opkg-build failed with: xz: (stdin): Cannot allocate memory
> >
> > since there are many tasks going on in parallel, xz adds to memory pressure
> > and it wants it all, put an upper limit for memory xz can use
> >
> > We add a variable XZ_MAXRAM with 70% of RAM limit and can be customized
> > if builders have more memory one can set it like
> >
> > XZMAX_RAM = "-M 0"
>
> This needs a little more explanation. How does a change to command
> used to create .xz images help when running out of memory in
> do_package_write_ipk? Doesn't the image get created a lot later?
>

its not related to image alone. xz is used in various places e.g.
opkgs switched to
using xz as default compression format recently, so every ipk creation
task involves
xz, and you might be in multiple of ipk creation tasks based on task parallelism

hope that clarifies. If not feel free to ask more

> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> > ---
> >  meta/classes/image_types.bbclass | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> > index 70bd315306..9c8ea0643c 100644
> > --- a/meta/classes/image_types.bbclass
> > +++ b/meta/classes/image_types.bbclass
> > @@ -57,6 +57,7 @@ def imagetypes_getdepends(d):
> >  XZ_COMPRESSION_LEVEL ?= "-3"
> >  XZ_INTEGRITY_CHECK ?= "crc32"
> >  XZ_THREADS ?= "-T 0"
> > +XZ_MAXRAM ?= "-M 70%"
> >
> >  ZIP_COMPRESSION_LEVEL ?= "-9"
> >
> > @@ -284,7 +285,7 @@ CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum sha224sum sha25
> >  CONVERSION_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> >  CONVERSION_CMD_gz = "pigz -f -9 -n -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
> >  CONVERSION_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> > -CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
> > +CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} ${XZ_MAXRAM} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
> >  CONVERSION_CMD_lz4 = "lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
> >  CONVERSION_CMD_lzo = "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> >  CONVERSION_CMD_zip = "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

