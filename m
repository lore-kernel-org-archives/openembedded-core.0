Return-Path: <andrea.adami@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 062E06D147
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 16:31:57 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id p6so6836932pgh.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 09:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=TqUdY6rrxYApM9V1e+s3lrW7kYKH2uA+WBZSZBeG/iU=;
	b=lbCWJ9wqmX5FEiCIBQv5Qwksl3l53H4Z2NmVfziR3gTbU04LClw+dUCthaTvNIYcQN
	Dg7coKPRSJ8cckZgRS0QXrOwgVktu+JRIqVibhXsrn6bdsUUfI1Lxd6P7XoRg5t3qF3G
	r2Yd8leidUDLF1RK49FxCKGmPgP47rnIM1/mLwnDj1/mzV4q+hxYcZHNM9V7+WxfAgxl
	RzFdA/I7Z+eg7PSdQrQiNZsYyRo1BnMpd9qC7F0iHEbLwWpDoc2B+K2mKa4Pmp0699Ns
	M0riC5nv6A+KikuVTmE9wJuxiw0A1PJQKdzh4Q1vag/W91VGFV/5sGtj0Yq2YOhIKT8f
	eF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=TqUdY6rrxYApM9V1e+s3lrW7kYKH2uA+WBZSZBeG/iU=;
	b=f8532a4++LSWjeYNHjyeEwn4uRP9kjDPkD65gUnAe2+y+RJWQlPm0XQUxtQFuOEyOU
	hwQMtk8cpTE9oEP7R2zuEyIg8sNLdpKm+Ah+HJ+GXvnBWlehDlhTEjvCyUO4JMFMWYgt
	aBNzThVyo4cfL64fSciYNTX6o5MAzgnS9o5Mu93KutoA7v88WJ7/G6z/DC2rXDPEBL2f
	hsU/SZ1SLHD8olwwmiIiDqbOnJQLg6IXHAb5i6qTVJZffQvEQs7ycgpUmOFM7+IcdsRZ
	aYlcP6GhSUN9gwPzbb56C/WsOlJB7go/DcqqENhCeTcWukelup6aMaOyh5ZbQOlkqUCi
	LzsQ==
X-Gm-Message-State: APjAAAVEo8eVuYbY9fUR/FZK7HSTDFgQ1re8+ZKqy7S5pszZ/fu9LYok
	IAVQDIdmWiQBUFhVO84i+kKG2q3bLfr8p76Y7zg=
X-Google-Smtp-Source: APXvYqwM5jpL4A3O4nIMmgl2wBibtYAuBjYLZBWJKwwmJfs20zF/GxG3Vry4PooPGDno3St1tNUx/+r5Dy7f3LKJFmM=
X-Received: by 2002:a65:5c4b:: with SMTP id v11mr23661605pgr.411.1553531519206;
	Mon, 25 Mar 2019 09:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <CALbNGRRm1QAgY2MHbTUA_Ly9L_Kt6ZzkR55jArkCE53G=ts8tA@mail.gmail.com>
	<CAMKF1sri_7L8sb95L5BjD3d2iMJq4PnqK+pD0XnTibUpwogpsQ@mail.gmail.com>
	<20190323211604.GA20793@localhost>
	<CALbNGRQPtnNLSVhDzXgnvn-2VNPPMfQTY5vDdwM3xr5iVcGofg@mail.gmail.com>
	<20190323215336.GA22469@localhost>
	<CALbNGRScKq9gCQWbU2wchSvQ3cf2aRNnn5601fOATuKMdVOFCA@mail.gmail.com>
	<CAAQYJAsLQFn3VrB7gSTkytA8Rm-1GkKLBLHHpVzonpqykrHnRg@mail.gmail.com>
	<20190325161004.GB484@localhost>
In-Reply-To: <20190325161004.GB484@localhost>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Mon, 25 Mar 2019 17:31:47 +0100
Message-ID: <CAAQYJAsR=cXSGnG6Z0hsfZHP0ZSqVh36Wb=shwY69LeahBCiPA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: musl thoughts
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
X-List-Received-Date: Mon, 25 Mar 2019 16:31:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2019 at 5:10 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Mon, Mar 25, 2019 at 04:36:44PM +0100, Andrea Adami wrote:
> > On Sat, Mar 23, 2019 at 11:00 PM Andreas M=C3=BCller <schnitzeltony@gma=
il.com> wrote:
> > >
> > > On Sat, Mar 23, 2019 at 10:53 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > >
> > > > On Sat, Mar 23, 2019 at 10:22:15PM +0100, Andreas M=C3=BCller wrote=
:
> > > > > On Sat, Mar 23, 2019 at 10:16 PM Adrian Bunk <bunk@stusta.de> wro=
te:
> > > > > >
> > > > > > On Fri, Mar 22, 2019 at 03:18:01PM -0700, Khem Raj wrote:
> > > > > > >...
> > > > > > > There are certain design aspects of musl which are actually t=
urning
> > > > > > > out to be good
> > > > > > > e.g. there is no __MUSL__ define, so non-portable code can no=
t be
> > > > > > > hidden which is a good thing,
> > > > > > >...
> > > > > >
> > > > > > Please take a closer look at some of the musl changes to NM tha=
t made
> > > > > > upgrading NM so hard for Andreas.
> > > > > >
> > > > > > +#if defined(__GLIBC__)
> > > > > >  #include <net/ethernet.h>
> > > > > > +#else /* musl libc */
> > > > > > +#define ETH_ALEN       6               /* Octets in one ethern=
et addr   */
> > > > > > +#endif
> >...
> >
> > Hi,
>
> Hi Andrea,
>
> > I am jumping in a little late to take side with Khem :)
> >
> > What happens now is that more 'bad' sources (written to suit glibc and
> > thus not portable) are discovered by the wider base of developers and
> > autobuilders.
> >...
>
> but this does not apply to this example, which is a problem between
> musl itself and the kernel headers.
>
> Code can expect #include <foo.h> to work for any headers, and with any
> order of these headers. If it does not, the 'bad' sources are whatever
> sources provide the headers in question.
>
> musl does provide net/ethernet.h, but including it causes a compile
> error here.

Adrian,

I don't know in this specific case, you do surely know better about
kernel/headers than me :)
Strangely I remember one issue with net/if.h and netinet/in.h with
kexec-tools and musl: maybe there is really something too special with
those net headers.

Switching the order of the headers did solve back then
https://git.openembedded.org/meta-openembedded/commit/meta-initramfs/recipe=
s-kernel/kexec?id=3Db97358d5a3568deb2a5e939019bb2acef053e53f

Sorry for the OT


Cheers
Andrea



>
> > As Khem said, this just needs time and efforts to clean up and
> > upstream the patches.
>
> Any sane upstream will refuse such patches that add musl-specific hacks
> with the wrong define to work around problems in musl itself.
>
> > Cheers
> > Andrea
>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

