Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 17AAC7D981
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 18:31:06 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id h18so5439645lfj.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 11:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=UTirlWwxOb+oWDZR4epRdtRI3cj+vuaUW3Yu9lkTL+I=;
	b=QaB8NHb/30HihqSKhIb4tgRpVIXeABNMfpURsp8qMUzFsw7niHwkrJynUJraxOCzi6
	pW3K8ChaADFjaC/2w4TapEW/UN3I7q4dGzN8Kk37vBj3r/FVT3RICgFMnztW1P1B56Xl
	yBiTQ9YKfIooTbB4VZa0j0lShMV12/id4W8l6tskzV2TSLqlLgX/rZFFa4v/wIw563xj
	CelzYTpMNaZSM849QZJfORv1DLthtzgaucBpv7d0gzLBXSskD0sisXvvRxwpHjXeL1Zu
	dDrJohBYGkrtZNaX+OFS2rEp6JiizHuPwlu1lIZGG1Fse/RJF1S0f3J103QOU7Oogrra
	wV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=UTirlWwxOb+oWDZR4epRdtRI3cj+vuaUW3Yu9lkTL+I=;
	b=gtfFFUta0WLy8oHkrWUlwvG823XvjUjMwjJ5lTTZxi9oO0koQgi/532oizPNTsmdFR
	qOBHX0Abf7FVFQRYc2RYBHIZ391TXYHPbaVZEAZkCN04x/qzxCaw/aE33hgC0rHtNGWX
	3KfaEr8qfS40FkOsnIFhv69DzpSDZ7fhXnc7Q7VxdNTldDN8SrC7scvgsHRHeWrGF2Vk
	ZkNttIZ6GDCVbArB7XCeLdmCQFZot6pqp/0477bppw8fJ8k9K06kERNP1ejHvLe1O2Be
	bBg9nLR0Xrnym6WhJIzALEtcdhSBPOp7T+72+woYrPFqKXmuf7TjpVpw2Jogfje1UlMp
	98sw==
X-Gm-Message-State: APjAAAU3oe3kS7lXE+IVf+QnS0VD8OXvfbzsayFkUKcpk78twmc23NDI
	PHhh/j4TBDt0F2XNal5G4PQmtDR1qQ8vLTYJunE=
X-Google-Smtp-Source: APXvYqyR8kdeOWkOUoe/j1pG5Gl2aHQZd0H60Ud009VYG+EQzOpdrpkRTT+wEYdN36K7Ucp1UYKD2Cvw6pzAR7+cweg=
X-Received: by 2002:ac2:41d8:: with SMTP id d24mr12960568lfi.56.1555007466499; 
	Thu, 11 Apr 2019 11:31:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190410172152.13509-1-alistair.francis@wdc.com>
	<eac980cd94a8d408a02f143f8ee9f2723655e819.camel@linuxfoundation.org>
	<20190411172654.GO2112@denix.org>
	<CAKmqyKPZ0+NovkG2T6LS_dpD0h_JJ1QXbRiLQGYW5jsm-DVYuA@mail.gmail.com>
	<20190411181136.GQ2112@denix.org>
In-Reply-To: <20190411181136.GQ2112@denix.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 11 Apr 2019 11:29:32 -0700
Message-ID: <CAKmqyKNNZ20ErfNsia51M0R5+RcqPYUmk3WaGa2BhQWvsPi=OA@mail.gmail.com>
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
X-List-Received-Date: Thu, 11 Apr 2019 18:31:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 11:11 AM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Thu, Apr 11, 2019 at 10:32:12AM -0700, Alistair Francis wrote:
> > On Thu, Apr 11, 2019 at 10:27 AM Denys Dmytriyenko <denis@denix.org> wr=
ote:
> > >
> > > On Thu, Apr 11, 2019 at 09:27:32AM +0100, Richard Purdie wrote:
> > > > On Wed, 2019-04-10 at 17:23 +0000, Alistair Francis wrote:
> > > > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > ---
> > > > >  meta/recipes-bsp/u-boot/u-boot-common.inc                       =
| 2
> > > > > +-
> > > > >  .../{u-boot-fw-utils_2019.01.bb =3D> u-boot-fw-utils_2019.04.bb}=
  | 0
> > > > >  .../u-boot/{u-boot-tools_2019.01.bb =3D> u-boot-tools_2019.04.bb=
} | 0
> > > > >  .../recipes-bsp/u-boot/{u-boot_2019.01.bb =3D> u-boot_2019.04.bb=
} | 0
> > > > >  4 files changed, 1 insertion(+), 1 deletion(-)
> > > > >  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2019.01.bb =3D> =
u-
> > > > > boot-fw-utils_2019.04.bb} (100%)
> > > > >  rename meta/recipes-bsp/u-boot/{u-boot-tools_2019.01.bb =3D> u-b=
oot-
> > > > > tools_2019.04.bb} (100%)
> > > > >  rename meta/recipes-bsp/u-boot/{u-boot_2019.01.bb =3D> u-
> > > > > boot_2019.04.bb} (100%)
> > > >
> > > > Breaks beaglebone-yocto:
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/4=
90
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/46/builds/4=
89
> > >
> > > Richard,
> > >
> > > This is quite interesting and surprisingly timely for me! Let me expl=
ain.
> > >
> > > Both of the above errors are not really specific to beaglebone or eve=
n u-boot.
> > > In both cases, the failure is this:
> > >
> > > | ERROR: _exec_cmd: install -m 0644 -D /home/pokybuild/yocto-worker/b=
eaglebone/build/build/tmp/deploy/images/beaglebone-yocto/u-boot.img /home/p=
okybuild/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-poky=
-linux-gnueabi/core-image-sato-sdk-ptest/1.0-r0/deploy-core-image-sato-sdk-=
ptest-image-complete/core-image-sato-sdk-ptest-beaglebone-yocto-20190410232=
147/tmp.wic.4xf3vi9f/boot.1/u-boot.img returned '1' instead of 0
> > > | output: install: cannot stat '/home/pokybuild/yocto-worker/beaglebo=
ne/build/build/tmp/deploy/images/beaglebone-yocto/u-boot.img': No such file=
 or directory
> > > | ERROR: Function failed: do_image_wic (log file is located at /home/=
pokybuild/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-pok=
y-linux-gnueabi/core-image-sato-sdk-ptest/1.0-r0/temp/log.do_image_wic.4196=
0)
> > >
> > > I recently received exactly the same error report internally and have=
 been
> > > investigating it. Though it is against Thud, for a different platform=
 and with
> > > our own u-boot from meta-ti.
> > >
> > > It seems to be a race condition - wic is trying to assemble an image =
when
> > > u-boot binary is not yet ready. Usually on subsequent rebuilds when u=
-boot
> > > needs to be rebuilt, but everything else is already available.
> > >
> > > Packaging for wic is set with IMAGE_BOOT_FILES =3D "u-boot.img", but =
the build
> > > dependency is special, as u-boot is not part of rootfs and is being s=
et by
> > > EXTRA_IMAGEDEPENDS =3D "u-boot":
> > > http://git.yoctoproject.org/cgit/cgit.cgi/meta-yocto/tree/meta-yocto-=
bsp/conf/machine/beaglebone-yocto.conf
> > >
> > > Since wic jumps right into packaging u-boot.img and doesn't wait for =
it to
> > > finish building/installing/deploying, it seems EXTRA_IMAGEDEPENDS is =
broken.
> > > But it used to work prior to Thud. It appears it may have been broken=
 here:
> > > https://git.openembedded.org/openembedded-core/commit/?id=3Db54cdaea7=
844ee3bf0c39eb97cc7c4c17ed5818c
> > >
> > > While the above commit deals with licenses and manifests, removal of =
these
> > > lines is not clear:
> > >
> > > -    extra_depends =3D d.getVar("EXTRA_IMAGEDEPENDS")
> > > -    boot_depends =3D get_boot_dependencies(d)
> > > -    depends.extend(extra_depends.split())
> > > -    depends.extend(boot_depends)
> > > -    depends =3D list(set(depends))
> > >
> > > Could it have affected boot dependencies and EXTRA_IMAGEDEPENDS behav=
ior?
> > > Please let me know if you need any more details. Thanks.
> >
> > Interesting. I just managed to reproduce a build failure for the
> > beaglebone based on this patch. My build fail wasn't because of the
> > missing u-boot.img file like in the buildbot error but instead due to
> > an incorrect config file.
> >
> > I have sent a patch with you both in CC that fixes the missing config
> > "beaglebone-yocto: Update u-boot config to match u-boot 19.04".
> > Without that patch u-boot 19.04 doesn't even compile, so I'm not sure
> > how the buildbot got far enough to complain about a missing .img file.
> >
> > After reading your email it makes more sense. It does seem like wic is
> > trying to package the u-boot.img file too early.
> >
> > Either way the "beaglebone-yocto: Update u-boot config to match u-boot
> > 19.04" patch should be applied at the same time as this patch.
>
> Yeah, I just acked your config patch. I was going to do the same myself. =
I
> provided some details in the reply and also referenced bug #13145 from th=
e
> bugzilla. I wonder if v2 would be possible to include all that in the com=
mit
> log? Thanks.

Done, just sent a v2.

>
> Anyway, that's separate from the wic issue we started discussing above :)

Great! So this patch and the other patch are ready to be merged :)

Alistair

>
> --
> Denys

