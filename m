Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2E4987D8ED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 17:33:46 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id j11so5360644lfm.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 10:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=V0ecqmUeGQkgJUGRZKwb/PhKhbEYwHksaTcVnSflk98=;
	b=r82rNPXK46V/OLdOWnpifJudmmOpfSgZFDeG7y64/HL/FNvaj3DrrMfBxz8jvRsjIO
	ClNAz2qjmhUrQqG6XNdIvBhcj9tHSFlpn8SjBGCu7iLfm0Fvw+zgkX4DkgeNKhvD76gP
	SqACzo5MQhaj98N3RooGUIQ0frz5lF8HzC1XflWn9lzA18SIKetn8dKtrd9l2Buk625M
	NWKsH6jPKonW0SZAKTRJUBO+KDErYh0fk+dTu6ljTc3LumViLJs+HZ8WhsSnfCnPkUcQ
	qlfctXUaDgx+3Z5e1azAZ0nvNYomIY7ih/a3MU7NwKfEJDW76HA8cvMVlv0q+CtoT55r
	PM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=V0ecqmUeGQkgJUGRZKwb/PhKhbEYwHksaTcVnSflk98=;
	b=Mw3HVBEy3ZfbOO1J5UneawP7lHhLsBW9BIw5d0YUv0i3YYXSdLATvS6Xfv+B3+UUGn
	i/6cXsgBQHmoL+LFUDfTdzIZCCp13ht14QQ53gHGhTVjWF8rT1ns/l+sAUMcyTD2p1cF
	nKR4wWHlAsB5kC5ixmAaxBr+wtwXsU5kjA4ICYF086vgsOtGsoWztrDXPlFNJfRvc6pG
	Eua6lk9JtwJ/khjP4UUCoon9vme1+yUxnicoXyeEWG0j/Zd6m6v3dN3VbgGbeVZh3q0z
	Ls5xM3IPbCHLOBL9b6UUETvfXXhNQrL697Vyz3JHeKFDvz/6kAKjDdw6KxOXyjdKyl0Y
	Zrkg==
X-Gm-Message-State: APjAAAWM+aNnqkAx22aBNIuBW/B65j2dukdWg7jmj2M4Dz+kpHJlDn/s
	UeuKpEZwy/NkgZ22njnaHL1FQmoLWKgxGtYEUZQ=
X-Google-Smtp-Source: APXvYqzZBya9FaZosdby8gIh32spUHCTn1G2NiisEPXhR3CpbrAn16202DsCGBRttyyvRvyGDnzmsJ6gyZuAtFFCvp0=
X-Received: by 2002:a19:f512:: with SMTP id j18mr21906289lfb.48.1555004026593; 
	Thu, 11 Apr 2019 10:33:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190410172152.13509-1-alistair.francis@wdc.com>
	<eac980cd94a8d408a02f143f8ee9f2723655e819.camel@linuxfoundation.org>
	<20190411172654.GO2112@denix.org>
In-Reply-To: <20190411172654.GO2112@denix.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 11 Apr 2019 10:32:12 -0700
Message-ID: <CAKmqyKPZ0+NovkG2T6LS_dpD0h_JJ1QXbRiLQGYW5jsm-DVYuA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] u-boot: Upgrade from 2019.01 to 2019.04
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
X-List-Received-Date: Thu, 11 Apr 2019 17:33:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 10:27 AM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Thu, Apr 11, 2019 at 09:27:32AM +0100, Richard Purdie wrote:
> > On Wed, 2019-04-10 at 17:23 +0000, Alistair Francis wrote:
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2
> > > +-
> > >  .../{u-boot-fw-utils_2019.01.bb =3D> u-boot-fw-utils_2019.04.bb}  | =
0
> > >  .../u-boot/{u-boot-tools_2019.01.bb =3D> u-boot-tools_2019.04.bb} | =
0
> > >  .../recipes-bsp/u-boot/{u-boot_2019.01.bb =3D> u-boot_2019.04.bb} | =
0
> > >  4 files changed, 1 insertion(+), 1 deletion(-)
> > >  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2019.01.bb =3D> u-
> > > boot-fw-utils_2019.04.bb} (100%)
> > >  rename meta/recipes-bsp/u-boot/{u-boot-tools_2019.01.bb =3D> u-boot-
> > > tools_2019.04.bb} (100%)
> > >  rename meta/recipes-bsp/u-boot/{u-boot_2019.01.bb =3D> u-
> > > boot_2019.04.bb} (100%)
> >
> > Breaks beaglebone-yocto:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/490
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/46/builds/489
>
> Richard,
>
> This is quite interesting and surprisingly timely for me! Let me explain.
>
> Both of the above errors are not really specific to beaglebone or even u-=
boot.
> In both cases, the failure is this:
>
> | ERROR: _exec_cmd: install -m 0644 -D /home/pokybuild/yocto-worker/beagl=
ebone/build/build/tmp/deploy/images/beaglebone-yocto/u-boot.img /home/pokyb=
uild/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-poky-lin=
ux-gnueabi/core-image-sato-sdk-ptest/1.0-r0/deploy-core-image-sato-sdk-ptes=
t-image-complete/core-image-sato-sdk-ptest-beaglebone-yocto-20190410232147/=
tmp.wic.4xf3vi9f/boot.1/u-boot.img returned '1' instead of 0
> | output: install: cannot stat '/home/pokybuild/yocto-worker/beaglebone/b=
uild/build/tmp/deploy/images/beaglebone-yocto/u-boot.img': No such file or =
directory
> | ERROR: Function failed: do_image_wic (log file is located at /home/poky=
build/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-poky-li=
nux-gnueabi/core-image-sato-sdk-ptest/1.0-r0/temp/log.do_image_wic.41960)
>
> I recently received exactly the same error report internally and have bee=
n
> investigating it. Though it is against Thud, for a different platform and=
 with
> our own u-boot from meta-ti.
>
> It seems to be a race condition - wic is trying to assemble an image when
> u-boot binary is not yet ready. Usually on subsequent rebuilds when u-boo=
t
> needs to be rebuilt, but everything else is already available.
>
> Packaging for wic is set with IMAGE_BOOT_FILES =3D "u-boot.img", but the =
build
> dependency is special, as u-boot is not part of rootfs and is being set b=
y
> EXTRA_IMAGEDEPENDS =3D "u-boot":
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-yocto/tree/meta-yocto-bsp/=
conf/machine/beaglebone-yocto.conf
>
> Since wic jumps right into packaging u-boot.img and doesn't wait for it t=
o
> finish building/installing/deploying, it seems EXTRA_IMAGEDEPENDS is brok=
en.
> But it used to work prior to Thud. It appears it may have been broken her=
e:
> https://git.openembedded.org/openembedded-core/commit/?id=3Db54cdaea7844e=
e3bf0c39eb97cc7c4c17ed5818c
>
> While the above commit deals with licenses and manifests, removal of thes=
e
> lines is not clear:
>
> -    extra_depends =3D d.getVar("EXTRA_IMAGEDEPENDS")
> -    boot_depends =3D get_boot_dependencies(d)
> -    depends.extend(extra_depends.split())
> -    depends.extend(boot_depends)
> -    depends =3D list(set(depends))
>
> Could it have affected boot dependencies and EXTRA_IMAGEDEPENDS behavior?
> Please let me know if you need any more details. Thanks.

Interesting. I just managed to reproduce a build failure for the
beaglebone based on this patch. My build fail wasn't because of the
missing u-boot.img file like in the buildbot error but instead due to
an incorrect config file.

I have sent a patch with you both in CC that fixes the missing config
"beaglebone-yocto: Update u-boot config to match u-boot 19.04".
Without that patch u-boot 19.04 doesn't even compile, so I'm not sure
how the buildbot got far enough to complain about a missing .img file.

After reading your email it makes more sense. It does seem like wic is
trying to package the u-boot.img file too early.

Either way the "beaglebone-yocto: Update u-boot config to match u-boot
19.04" patch should be applied at the same time as this patch.

Alistair

>
> --
> Denys
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

