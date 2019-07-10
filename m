Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 275F77EF3F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 14:21:58 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id z15so1711655lfh.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 07:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=eDivmNMTTR15pdVhhwLKcNK4D05UMQ7jDb3w8o/OW/4=;
	b=DaLrsuVsnQQKI4BIic68RozbOIwJjd2OszpwEmbyQHBaRoGIlt3viek+Mg2x/D0Crd
	eGxa67sF9XJl/Ad3H0kKV0+TukE0gVaDFzTZGp0NKA9JE4fb3HuJ/I5DTZgYw3QH+gwM
	KkcV2SDgexmZKDbkUN7d7xW9mZzepf4A15TwiExDnO94MHVisiPlf3Aj2Hel/mgaa9qJ
	SajFxP/49QIIWCD3WWS+8Ib330xNJMBjJCrM566oC5fpMTqvpWKk1Vh3CixZlNsjMNnU
	BytiI+y2dsTee1LV8oun5mcZuZuoPUkfjrrl9X5gncsaNfQW/KdzzF5tEN3pY9jcuaA0
	lDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=eDivmNMTTR15pdVhhwLKcNK4D05UMQ7jDb3w8o/OW/4=;
	b=EaeAJq/pEl4EyvrX20BxDSuX9scYEvEwRbK9n25hd7TGDUNaO+3uGzjjVOz+3r1bMg
	Gz4Ipw/XsL4Yy/7sn0P3oC6s+w6aUyGM3/woNknj4e1ACwPwfYPNwwX5bxPQGGoLzeGS
	uwKtGUtV5CrZr63lrSarFmI8QfRSRRY84TtY6seCr0rBNvj8aRbohSeKAZ3WOl/YXTvw
	G+cPoQFRro/w4LG1g+BWHjteGfKNvCpL7m3kIvp0+pAj+jxJdR6MVcQMEUeMtnor1Z+S
	GEfeeyINjAvcDRJX1crreBXHC+cP3mVQ6rIqVkBL5/F8na0rhJLBcWnZJpAm8uZDqZFs
	zK+g==
X-Gm-Message-State: APjAAAWPrEU8bqBZxDbZu5+zNF++dKHRHBe/C1W5FmIekv7HtPhdqtQ/
	IgXHCiL43vY1y6nXyxG5RAtz0pDuf5dJzUxGCTc=
X-Google-Smtp-Source: APXvYqwEbYWVwKID2N+EU+xcl/9H6BXkitdx7Pu//Z9U0Gp8UJNeJA9jkqMuTzjGcK/7/w1B2fMTDwFYdAfPzjjQOys=
X-Received: by 2002:ac2:50cd:: with SMTP id h13mr15565416lfm.36.1562768518586; 
	Wed, 10 Jul 2019 07:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559220004.git.bruce.ashfield@gmail.com>
	<895d9d6d6e611652f3e144561811868b1df15cf6.1559220004.git.bruce.ashfield@gmail.com>
	<df9ca430-ee2a-5428-2528-28604e1b5bce@geanix.com>
In-Reply-To: <df9ca430-ee2a-5428-2528-28604e1b5bce@geanix.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 10 Jul 2019 10:21:47 -0400
Message-ID: <CADkTA4OpSXaKOvWO7uQr-ydpN5-jEwwQsvFUw9f26w_xLWyj5A@mail.gmail.com>
To: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/9] linux-yocto-dev: bump to v5.2-rc
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
X-List-Received-Date: Wed, 10 Jul 2019 14:21:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2019 at 10:15 AM Martin Hundeb=C3=B8ll <martin@geanix.com> =
wrote:
>
> Hi Bruce,
>
> On 30/05/2019 14.44, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >   meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipe=
s-kernel/linux/linux-yocto-dev.bb
> > index ae8c343008..3a055c12ad 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > @@ -30,7 +30,7 @@ SRC_URI =3D "git://git.yoctoproject.org/linux-yocto-d=
ev.git;branch=3D${KBRANCH};name
> >   SRCREV_machine ?=3D '${@oe.utils.conditional("PREFERRED_PROVIDER_virt=
ual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43=
dcc53970c60e", d)}'
> >   SRCREV_meta ?=3D '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual=
/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc=
53970c60e", d)}'
> >
> > -LINUX_VERSION ?=3D "5.0-rc+"
> > +LINUX_VERSION ?=3D "5.2-rc+"
> >   LINUX_VERSION_EXTENSION ?=3D "-yoctodev-${LINUX_KERNEL_TYPE}"
> >   PV =3D "${LINUX_VERSION}+git${SRCPV}"
>
> My own kernel recipe (more or less mainline) failed to build when I
> bumped to v5.2. It fails to generate the out-of-tree Makefile due to a
> missing dependency on `realpath`[1].
>
> The quick-fix is to add coreutils-native to DEPENDS, but I am not sure
> if this is what we want.
>
> Have you seen the same?

Nope, I haven't seen that. But then again, all my machines have
realpath available.

As you hinted, building all of coreutils as a dependency for the
kernel is a bit heavy. We could make
realpath a host requirement,  or otherwise, split out realpath (but
you'd still need to build coreutils, so
that really doesn't help).

I'd lean towards just making it a host requirement .. but I'm sure
Richard can advise better than me
on the pro's and con's of the options.

Bruce

>
> // Martin
>
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D48b5ffd1268788afb01525e71e864e901e9aa070



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

