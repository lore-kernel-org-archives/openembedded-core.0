Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F74EB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 08:40:05 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.3895.1689583197590094283
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 01:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ZPEgDQ1Y;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-31434226a2eso4356491f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 01:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689583196; x=1692175196;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mqx4nSrQc9zT3otXi8BSYWHybEBlJkyVZu0qYAAlwbk=;
        b=ZPEgDQ1YmoSCSJq+ND1W8HjV/9kJraGfaQX9qR2F3b7VXjEok2RdpZsAqcoLLTNIIN
         V/tGxPE2z6Fu222fZ0sG36tE0Z424g9DabGGBtuPaEwUtmYjOOjl4IpK6IEQRkw/+oHa
         BN5TYLb12DkQ57TfzSsMbROMIhpoNZipoZuj8tz7l6zbiqVdAHSTVFNcJOIQd2tNx0Dt
         +vcq8k5J1CBVUsevGQH/EFgW9Fy6DfJ6LSdhldYIQZsFZZXRkA7nFvtHoOo6im92/OtF
         IzBat3Ph7rMU5b2poJ2J2JL6x3h7lL11Qrt3l0c9eHB/6yJDoaaEZMSLkm3TXFGlYICe
         SJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689583196; x=1692175196;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mqx4nSrQc9zT3otXi8BSYWHybEBlJkyVZu0qYAAlwbk=;
        b=QztNp//njYbwKbCcBXhdsvlfffaxTk+WJaNNDyDNVw9Xy+jLA9tBiNGyHJgVs365iD
         c9ArSl+6qDQ+repHTjOtt9GCOYBmfiGLZyLw/TZGlYrocc0mc/BsGYDKr+3/Z84rOcte
         N9D+F4kVvoxIQhAAo9RBV34XRoii3JFwyhK78VsvC/xLi5cgh69/dRNHZRbkARrlCK0q
         kNCm2aXeboxxADfcThFLTK0X9KChyNGPhkUja7V+d90584BJPKD4PUe8Mx+CQnH0srGm
         oJklTPp3sT/860aBrGHOGwee66U7t5SPaKmjGrmgWXASxIqvEX7QLCEg91liBpNWLjxs
         6FzA==
X-Gm-Message-State: ABy/qLY8DFtyE99PrFLH4zVpmsnlkgigdArX7pG4KmyXDggv1cgFCWSo
	3HgYUZNN6Fb3gAutXkIX/kV/y71VKSZrGq8orbU=
X-Google-Smtp-Source: APBJJlEfXValkUD8aJK+SXLA9J6hbFGmjidQk+FDVKk1V/WztMiCyf+7eYZC27bPZIEpibE0Dv01v+afp6O88cqlIOc=
X-Received: by 2002:adf:e644:0:b0:316:ef23:9276 with SMTP id
 b4-20020adfe644000000b00316ef239276mr9542747wrn.52.1689583195650; Mon, 17 Jul
 2023 01:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689373875.git.steve@sakoman.com> <7272fe3663fd9eb6144138f6b090075af6eecaed.1689373876.git.steve@sakoman.com>
In-Reply-To: <7272fe3663fd9eb6144138f6b090075af6eecaed.1689373876.git.steve@sakoman.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 17 Jul 2023 10:38:56 +0200
Message-ID: <CA+chaQdH1xn8WMmgip89Gae=m6nM1ONEDWzXoB8-GzskfpGv6Q@mail.gmail.com>
Subject: Re: [OE-core][mickledore 26/26] image-artifact-names: include
 ${IMAGE_NAME_SUFFIX} directly in both ${IMAGE_NAME} and ${IMAGE_LINK_NAME}
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000031fe0e0600aabe5c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 08:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184435

--00000000000031fe0e0600aabe5c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This isn't backwards compatible and various BSP might need small adjustment
to work correctly with this.

Please don't backport this one.

On Sat, Jul 15, 2023 at 12:34=E2=80=AFAM Steve Sakoman <steve@sakoman.com> =
wrote:

> From: Martin Jansa <Martin.Jansa@gmail.com>
>
> * ${IMAGE_NAME}${IMAGE_NAME_SUFFIX} is almost always used together alread=
y
>   and when they aren't it's usually because of hardcoded '.rootfs' suffix
>
> * it's a bit strange, because ${IMAGE_NAME_SUFFIX} is applied after the
>   version from ${IMAGE_VERSION_SUFFIX}, if we move it to ${IMAGE_LINK_NAM=
E}
>   then it will be applied before the version and ${IMAGE_LINK_NAME}
>   will be just the version-less symlink to latest built version.
>
> * it's not added to INITRAMFS_IMAGE_NAME as it assumes that all
>   images used as initramfs will set IMAGE_NAME_SUFFIX to empty.
>   Many already do as shown bellow, but you might need to extend
>   this list in your layer.
>
> * this also allows to drop support for imgsuffix varflag, recipes which
>   don't want to have .rootfs suffix can just set IMAGE_NAME_SUFFIX to
>   empty and it will be consistently respected by both IMAGE_NAME and
> IMAGE_LINK_NAME
>
> * imgsuffix =3D d.getVarFlag("do_" + taskname, 'imgsuffix') or
> d.expand("${IMAGE_NAME_SUFFIX}.")
>   is kind of terrible, notice trailing '.' after ${IMAGE_NAME_SUFFIX}
>   while this dot was in imgsuffix in:
>   do_bootimg[imgsuffix] =3D "."
>
>   but in both cases it's not really part of the imgsuffix, but the
>   "extension" type separator as in dst variable:
>
>          dst =3D os.path.join(deploy_dir, link_name + "." + type)
> -        src =3D img_name + imgsuffix + type
> +        src =3D img_name + "." + type
>
> * for ubifs volumes move vname after IMAGE_NAME_SUFFIX
>
> * to better document these changes here is an example with default poky
>   configuration with just:
>   IMAGE_FSTYPES:append:pn-core-image-minimal =3D " live wic wic.vmdk ubi"
>   MKUBIFS_ARGS =3D "-m 2048 -e 129024 -c 968 -x zlib"
>   UBINIZE_ARGS =3D "-m 2048 -p 131072 -s 512"
>   added in local.conf, so that deploy_dir has also some initramfs and mor=
e
>   IMAGE_FSTYPES
>
> * "ls -lahi tmp/deploy/images/qemux86-64/"
>   output after "bitbake core-image-minimal"
>
>   And deploy-dir is cleaned between runs with:
>   bitbake -c clean core-image-minimal core-image-minimal-initramfs
> virtual/kernel grub-efi systemd-boot
>
>   The output confirms that the only change is ".rootfs" added not only
>   in ext4 and manifest files, but also for hddimg, iso, qemuboot.conf
>   testdata.json for both the actual artifacts as well as the symlinks
>   while core-image-minimal-initramfs doesn't have them as IMAGE_NAME_SUFF=
IX
>   was already set to empty there:
> meta/classes-recipe/baremetal-image.bbclass:IMAGE_NAME_SUFFIX ?=3D ""
> meta/recipes-core/images/core-image-minimal-initramfs.bb:IMAGE_NAME_SUFFI=
X
> ?=3D ""
> meta/recipes-core/images/core-image-tiny-initramfs.bb:IMAGE_NAME_SUFFIX
> ?=3D ""
> meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb:IMAGE=
_NAME_SUFFIX
> ?=3D ""
> meta/recipes-extended/images/core-image-testcontroller-initramfs.bb:IMAGE=
_NAME_SUFFIX
> ?=3D ""
>
>   before these changes:
> total 297M
> 31269162 drwxr-xr-x 2 martin martin 4.0K Mar  7 19:19 .
> 31263942 drwxr-xr-x 3 martin martin 4.0K Mar  7 12:53 ..
> 35845703 lrwxrwxrwx 2 martin martin   77 Mar  7 12:27 bzImage ->
> bzImage--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110=
.bin
> 35845704 -rw-r--r-- 2 martin martin  11M Mar  7 12:27
> bzImage--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110=
.bin
> 35845702 lrwxrwxrwx 2 martin martin   77 Mar  7 12:27
> bzImage-qemux86-64.bin ->
> bzImage--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110=
.bin
> 40236967 -rw-r--r-- 2 martin martin  13M Mar  7 19:19
> core-image-minimal-initramfs-qemux86-64-20230307181808.cpio.gz
> 40203232 -rw-r--r-- 2 martin martin 1.1K Mar  7 19:19
> core-image-minimal-initramfs-qemux86-64-20230307181808.manifest
> 40212700 -rw-r--r-- 2 martin martin 1.6K Mar  7 19:19
> core-image-minimal-initramfs-qemux86-64-20230307181808.qemuboot.conf
> 40211556 -rw-r--r-- 2 martin martin 211K Mar  7 19:19
> core-image-minimal-initramfs-qemux86-64-20230307181808.testdata.json
> 40236964 lrwxrwxrwx 2 martin martin   62 Mar  7 19:19
> core-image-minimal-initramfs-qemux86-64.cpio.gz ->
> core-image-minimal-initramfs-qemux86-64-20230307181808.cpio.gz
> 40203235 lrwxrwxrwx 2 martin martin   63 Mar  7 19:19
> core-image-minimal-initramfs-qemux86-64.manifest ->
> core-image-minimal-initramfs-qemux86-64-20230307181808.manifest
> 40212690 lrwxrwxrwx 2 martin martin   68 Mar  7 19:19
> core-image-minimal-initramfs-qemux86-64.qemuboot.conf ->
> core-image-minimal-initramfs-qemux86-64-20230307181808.qemuboot.conf
> 40211560 lrwxrwxrwx 2 martin martin   68 Mar  7 19:19
> core-image-minimal-initramfs-qemux86-64.testdata.json ->
> core-image-minimal-initramfs-qemux86-64-20230307181808.testdata.json
> 40237307 -rw-r--r-- 2 martin martin  57M Mar  7 19:19
> core-image-minimal-qemux86-64-20230307181808.hddimg
> 40237329 -rw-r--r-- 2 martin martin  56M Mar  7 19:19
> core-image-minimal-qemux86-64-20230307181808.iso
> 40220347 -rw-r--r-- 2 martin martin 1.6K Mar  7 19:19
> core-image-minimal-qemux86-64-20230307181808.qemuboot.conf
> 40236942 -rw-r--r-- 2 martin martin  34M Mar  7 19:19
> core-image-minimal-qemux86-64-20230307181808.rootfs.ext4
> 40211563 -rw-r--r-- 2 martin martin 1.2K Mar  7 19:19
> core-image-minimal-qemux86-64-20230307181808.rootfs.manifest
> 40237206 -rw-r--r-- 2 martin martin  16M Mar  7 19:19
> core-image-minimal-qemux86-64-20230307181808.rootfs.tar.bz2
> 40237216 -rw-r--r-- 2 martin martin  20M Mar  7 19:19
> core-image-minimal-qemux86-64-20230307181808.rootfs.ubi
> 40224358 -rw-r--r-- 2 martin martin  19M Mar  7 19:19
> core-image-minimal-qemux86-64-20230307181808.rootfs.ubifs
> 40360386 -rw-r--r-- 2 martin martin  73M Mar  7 19:19
> core-image-minimal-qemux86-64-20230307181808.rootfs.wic
> 40237285 -rw-r--r-- 2 martin martin  35M Mar  7 19:19
> core-image-minimal-qemux86-64-20230307181808.rootfs.wic.vmdk
> 40209866 -rw-r--r-- 2 martin martin 206K Mar  7 19:19
> core-image-minimal-qemux86-64-20230307181808.testdata.json
> 40236946 lrwxrwxrwx 2 martin martin   56 Mar  7 19:19
> core-image-minimal-qemux86-64.ext4 ->
> core-image-minimal-qemux86-64-20230307181808.rootfs.ext4
> 40237336 lrwxrwxrwx 2 martin martin   51 Mar  7 19:19
> core-image-minimal-qemux86-64.hddimg ->
> core-image-minimal-qemux86-64-20230307181808.hddimg
> 40237337 lrwxrwxrwx 2 martin martin   48 Mar  7 19:19
> core-image-minimal-qemux86-64.iso ->
> core-image-minimal-qemux86-64-20230307181808.iso
> 40211564 lrwxrwxrwx 2 martin martin   60 Mar  7 19:19
> core-image-minimal-qemux86-64.manifest ->
> core-image-minimal-qemux86-64-20230307181808.rootfs.manifest
> 40220348 lrwxrwxrwx 2 martin martin   58 Mar  7 19:19
> core-image-minimal-qemux86-64.qemuboot.conf ->
> core-image-minimal-qemux86-64-20230307181808.qemuboot.conf
> 40237205 lrwxrwxrwx 2 martin martin   59 Mar  7 19:19
> core-image-minimal-qemux86-64.tar.bz2 ->
> core-image-minimal-qemux86-64-20230307181808.rootfs.tar.bz2
> 40209873 lrwxrwxrwx 2 martin martin   58 Mar  7 19:19
> core-image-minimal-qemux86-64.testdata.json ->
> core-image-minimal-qemux86-64-20230307181808.testdata.json
> 40237217 lrwxrwxrwx 2 martin martin   55 Mar  7 19:19
> core-image-minimal-qemux86-64.ubi ->
> core-image-minimal-qemux86-64-20230307181808.rootfs.ubi
> 40236771 lrwxrwxrwx 2 martin martin   57 Mar  7 19:19
> core-image-minimal-qemux86-64.ubifs ->
> core-image-minimal-qemux86-64-20230307181808.rootfs.ubifs
> 40237287 lrwxrwxrwx 2 martin martin   55 Mar  7 19:19
> core-image-minimal-qemux86-64.wic ->
> core-image-minimal-qemux86-64-20230307181808.rootfs.wic
> 40237286 lrwxrwxrwx 2 martin martin   60 Mar  7 19:19
> core-image-minimal-qemux86-64.wic.vmdk ->
> core-image-minimal-qemux86-64-20230307181808.rootfs.wic.vmdk
> 40237192 -rw-r--r-- 2 martin martin 3.8K Mar  7 19:19
> core-image-minimal.env
> 34458377 -rw-r--r-- 2 martin martin 616K Mar  7 17:55 grub-efi-bootx64.ef=
i
> 34963606 -rwxr-xr-x 2 martin martin 103K Mar  6 22:02 linuxx64.efi.stub
> 35845662 -rw-r--r-- 2 martin martin 8.2M Mar  7 12:27
> modules--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110=
.tgz
> 35845701 lrwxrwxrwx 2 martin martin   77 Mar  7 12:27
> modules-qemux86-64.tgz ->
> modules--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110=
.tgz
> 34963605 -rwxr-xr-x 2 martin martin 140K Mar  6 22:02 systemd-bootx64.efi
> 27651415 -rw-r--r-- 2 martin martin  274 Mar  7 19:19
> ubinize-core-image-minimal-qemux86-64-20230307181808.cfg
>
>   after these changes:
> total 297M
> 31269162 drwxr-xr-x 2 martin martin 4.0K Mar  7 19:16 .
> 31263942 drwxr-xr-x 3 martin martin 4.0K Mar  7 12:53 ..
> 39479266 lrwxrwxrwx 2 martin martin   77 Mar  7 12:27 bzImage ->
> bzImage--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110=
.bin
> 39479267 -rw-r--r-- 2 martin martin  11M Mar  7 12:27
> bzImage--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110=
.bin
> 39479264 lrwxrwxrwx 2 martin martin   77 Mar  7 12:27
> bzImage-qemux86-64.bin ->
> bzImage--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110=
.bin
> 39648810 -rw-r--r-- 2 martin martin  13M Mar  7 19:15
> core-image-minimal-initramfs-qemux86-64-20230307181456.cpio.gz
> 39638400 -rw-r--r-- 2 martin martin 1.1K Mar  7 19:15
> core-image-minimal-initramfs-qemux86-64-20230307181456.manifest
> 39644650 -rw-r--r-- 2 martin martin 1.6K Mar  7 19:15
> core-image-minimal-initramfs-qemux86-64-20230307181456.qemuboot.conf
> 39637657 -rw-r--r-- 2 martin martin 211K Mar  7 19:15
> core-image-minimal-initramfs-qemux86-64-20230307181456.testdata.json
> 39648091 lrwxrwxrwx 2 martin martin   62 Mar  7 19:15
> core-image-minimal-initramfs-qemux86-64.cpio.gz ->
> core-image-minimal-initramfs-qemux86-64-20230307181456.cpio.gz
> 39638401 lrwxrwxrwx 2 martin martin   63 Mar  7 19:15
> core-image-minimal-initramfs-qemux86-64.manifest ->
> core-image-minimal-initramfs-qemux86-64-20230307181456.manifest
> 39644651 lrwxrwxrwx 2 martin martin   68 Mar  7 19:15
> core-image-minimal-initramfs-qemux86-64.qemuboot.conf ->
> core-image-minimal-initramfs-qemux86-64-20230307181456.qemuboot.conf
> 39637662 lrwxrwxrwx 2 martin martin   68 Mar  7 19:15
> core-image-minimal-initramfs-qemux86-64.testdata.json ->
> core-image-minimal-initramfs-qemux86-64-20230307181456.testdata.json
> 39654281 -rw-r--r-- 2 martin martin  34M Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs-20230307181456.ext4
> 39656710 -rw-r--r-- 2 martin martin  57M Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs-20230307181456.hddimg
> 39657112 -rw-r--r-- 2 martin martin  56M Mar  7 19:16
> core-image-minimal-qemux86-64.rootfs-20230307181456.iso
> 39645313 -rw-r--r-- 2 martin martin 1.2K Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs-20230307181456.manifest
> 39646013 -rw-r--r-- 2 martin martin 1.6K Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs-20230307181456.qemuboot.conf
> 39656336 -rw-r--r-- 2 martin martin  16M Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs-20230307181456.tar.bz2
> 39644408 -rw-r--r-- 2 martin martin 206K Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs-20230307181456.testdata.json
> 39656583 -rw-r--r-- 2 martin martin  20M Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs-20230307181456.ubi
> 39654124 -rw-r--r-- 2 martin martin  19M Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs-20230307181456.ubifs
> 39802371 -rw-r--r-- 2 martin martin  73M Mar  7 19:16
> core-image-minimal-qemux86-64.rootfs-20230307181456.wic
> 39657113 -rw-r--r-- 2 martin martin  35M Mar  7 19:16
> core-image-minimal-qemux86-64.rootfs-20230307181456.wic.vmdk
> 39654412 lrwxrwxrwx 2 martin martin   56 Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs.ext4 ->
> core-image-minimal-qemux86-64.rootfs-20230307181456.ext4
> 39657167 lrwxrwxrwx 2 martin martin   58 Mar  7 19:16
> core-image-minimal-qemux86-64.rootfs.hddimg ->
> core-image-minimal-qemux86-64.rootfs-20230307181456.hddimg
> 39657168 lrwxrwxrwx 2 martin martin   55 Mar  7 19:16
> core-image-minimal-qemux86-64.rootfs.iso ->
> core-image-minimal-qemux86-64.rootfs-20230307181456.iso
> 39645316 lrwxrwxrwx 2 martin martin   60 Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs.manifest ->
> core-image-minimal-qemux86-64.rootfs-20230307181456.manifest
> 39646014 lrwxrwxrwx 2 martin martin   65 Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs.qemuboot.conf ->
> core-image-minimal-qemux86-64.rootfs-20230307181456.qemuboot.conf
> 39656315 lrwxrwxrwx 2 martin martin   59 Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs.tar.bz2 ->
> core-image-minimal-qemux86-64.rootfs-20230307181456.tar.bz2
> 39644406 lrwxrwxrwx 2 martin martin   65 Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs.testdata.json ->
> core-image-minimal-qemux86-64.rootfs-20230307181456.testdata.json
> 39656584 lrwxrwxrwx 2 martin martin   55 Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs.ubi ->
> core-image-minimal-qemux86-64.rootfs-20230307181456.ubi
> 39654775 lrwxrwxrwx 2 martin martin   57 Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs.ubifs ->
> core-image-minimal-qemux86-64.rootfs-20230307181456.ubifs
> 39657126 lrwxrwxrwx 2 martin martin   55 Mar  7 19:16
> core-image-minimal-qemux86-64.rootfs.wic ->
> core-image-minimal-qemux86-64.rootfs-20230307181456.wic
> 39657088 lrwxrwxrwx 2 martin martin   60 Mar  7 19:16
> core-image-minimal-qemux86-64.rootfs.wic.vmdk ->
> core-image-minimal-qemux86-64.rootfs-20230307181456.wic.vmdk
> 39654418 -rw-r--r-- 2 martin martin 3.8K Mar  7 19:15
> core-image-minimal.env
> 39475732 -rw-r--r-- 2 martin martin 616K Mar  7 17:55 grub-efi-bootx64.ef=
i
> 31507074 -rwxr-xr-x 2 martin martin 103K Mar  6 22:02 linuxx64.efi.stub
> 39479261 -rw-r--r-- 2 martin martin 8.2M Mar  7 12:27
> modules--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110=
.tgz
> 39479263 lrwxrwxrwx 2 martin martin   77 Mar  7 12:27
> modules-qemux86-64.tgz ->
> modules--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110=
.tgz
> 31507058 -rwxr-xr-x 2 martin martin 140K Mar  6 22:02 systemd-bootx64.efi
> 27651415 -rw-r--r-- 2 martin martin  274 Mar  7 19:15
> ubinize-core-image-minimal-qemux86-64.rootfs-20230307181456.cfg
>
> [YOCTO #12937]
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> (cherry picked from commit 26d97acc71379ab6702fa54a23b6542a3f51779c)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  .../image-artifact-names.bbclass              |   3 +-
>  meta/classes-recipe/image-live.bbclass        |   1 -
>  meta/classes-recipe/image.bbclass             |   7 +-
>  meta/classes-recipe/image_types.bbclass       | 108 +++++++++---------
>  meta/classes-recipe/image_types_wic.bbclass   |   2 +-
>  .../rootfs-postcommands.bbclass               |   2 +-
>  meta/classes/cve-check.bbclass                |   4 +-
>  meta/lib/oeqa/selftest/cases/fitimage.py      |   2 +
>  .../images/build-appliance-image_15.0.0.bb    |   6 +-
>  9 files changed, 68 insertions(+), 67 deletions(-)
>
> diff --git a/meta/classes-recipe/image-artifact-names.bbclass
> b/meta/classes-recipe/image-artifact-names.bbclass
> index ac2376d59a..bc76ff0e16 100644
> --- a/meta/classes-recipe/image-artifact-names.bbclass
> +++ b/meta/classes-recipe/image-artifact-names.bbclass
> @@ -12,9 +12,10 @@ IMAGE_BASENAME ?=3D "${PN}"
>  IMAGE_VERSION_SUFFIX ?=3D "-${DATETIME}"
>  IMAGE_VERSION_SUFFIX[vardepsexclude] +=3D "DATETIME SOURCE_DATE_EPOCH"
>  IMAGE_NAME ?=3D "${IMAGE_LINK_NAME}${IMAGE_VERSION_SUFFIX}"
> -IMAGE_LINK_NAME ?=3D "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}"
> +IMAGE_LINK_NAME ?=3D
> "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_NAME_SUFFIX}"
>
>  # This needs to stay in sync with IMAGE_LINK_NAME, but with
> INITRAMFS_IMAGE instead of IMAGE_BASENAME
> +# and without ${IMAGE_NAME_SUFFIX} which all initramfs images should set
> to empty
>  INITRAMFS_IMAGE_NAME ?=3D "${@['${INITRAMFS_IMAGE}${IMAGE_MACHINE_SUFFIX=
}',
> ''][d.getVar('INITRAMFS_IMAGE') =3D=3D '']}"
>
>  # The default DEPLOY_DIR_IMAGE is ${MACHINE} directory:
> diff --git a/meta/classes-recipe/image-live.bbclass
> b/meta/classes-recipe/image-live.bbclass
> index 168774a464..95dd44a8c0 100644
> --- a/meta/classes-recipe/image-live.bbclass
> +++ b/meta/classes-recipe/image-live.bbclass
> @@ -260,6 +260,5 @@ python do_bootimg() {
>      bb.build.exec_func('create_symlinks', d)
>  }
>  do_bootimg[subimages] =3D "hddimg iso"
> -do_bootimg[imgsuffix] =3D "."
>
>  addtask bootimg before do_image_complete after do_rootfs
> diff --git a/meta/classes-recipe/image.bbclass
> b/meta/classes-recipe/image.bbclass
> index e0dfba4a42..21b220a28d 100644
> --- a/meta/classes-recipe/image.bbclass
> +++ b/meta/classes-recipe/image.bbclass
> @@ -480,14 +480,14 @@ python () {
>                      if subimage not in subimages:
>                          subimages.append(subimage)
>                      if type not in alltypes:
> -
> rm_tmp_images.add(localdata.expand("${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${t=
ype}"))
> +
> rm_tmp_images.add(localdata.expand("${IMAGE_NAME}.${type}"))
>
>          for bt in basetypes[t]:
>              gen_conversion_cmds(bt)
>
>          localdata.setVar('type', realt)
>          if t not in alltypes:
> -
> rm_tmp_images.add(localdata.expand("${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${t=
ype}"))
> +            rm_tmp_images.add(localdata.expand("${IMAGE_NAME}.${type}"))
>          else:
>              subimages.append(realt)
>
> @@ -594,13 +594,12 @@ python create_symlinks() {
>      manifest_name =3D d.getVar('IMAGE_MANIFEST')
>      taskname =3D d.getVar("BB_CURRENTTASK")
>      subimages =3D (d.getVarFlag("do_" + taskname, 'subimages', False) or
> "").split()
> -    imgsuffix =3D d.getVarFlag("do_" + taskname, 'imgsuffix') or
> d.expand("${IMAGE_NAME_SUFFIX}.")
>
>      if not link_name:
>          return
>      for type in subimages:
>          dst =3D os.path.join(deploy_dir, link_name + "." + type)
> -        src =3D img_name + imgsuffix + type
> +        src =3D img_name + "." + type
>          if os.path.exists(os.path.join(deploy_dir, src)):
>              bb.note("Creating symlink: %s -> %s" % (dst, src))
>              if os.path.islink(dst):
> diff --git a/meta/classes-recipe/image_types.bbclass
> b/meta/classes-recipe/image_types.bbclass
> index 023eb87537..fdee835e7c 100644
> --- a/meta/classes-recipe/image_types.bbclass
> +++ b/meta/classes-recipe/image_types.bbclass
> @@ -66,9 +66,9 @@ ZIP_COMPRESSION_LEVEL ?=3D "-9"
>  ZSTD_COMPRESSION_LEVEL ?=3D "-3"
>
>  JFFS2_SUM_EXTRA_ARGS ?=3D ""
> -IMAGE_CMD:jffs2 =3D "mkfs.jffs2 --root=3D${IMAGE_ROOTFS} --faketime
> --output=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.jffs2
> ${EXTRA_IMAGECMD}"
> +IMAGE_CMD:jffs2 =3D "mkfs.jffs2 --root=3D${IMAGE_ROOTFS} --faketime
> --output=3D${IMGDEPLOYDIR}/${IMAGE_NAME}.jffs2 ${EXTRA_IMAGECMD}"
>
> -IMAGE_CMD:cramfs =3D "mkfs.cramfs ${IMAGE_ROOTFS}
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cramfs ${EXTRA_IMAGECMD=
}"
> +IMAGE_CMD:cramfs =3D "mkfs.cramfs ${IMAGE_ROOTFS}
> ${IMGDEPLOYDIR}/${IMAGE_NAME}.cramfs ${EXTRA_IMAGECMD}"
>
>  oe_mkext234fs () {
>         fstype=3D$1
> @@ -88,14 +88,14 @@ oe_mkext234fs () {
>                 eval COUNT=3D\"$MIN_COUNT\"
>         fi
>         # Create a sparse image block
> -       bbdebug 1 Executing "dd if=3D/dev/zero
> of=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype
> seek=3D$ROOTFS_SIZE count=3D$COUNT bs=3D1024"
> -       dd if=3D/dev/zero
> of=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype
> seek=3D$ROOTFS_SIZE count=3D$COUNT bs=3D1024
> +       bbdebug 1 Executing "dd if=3D/dev/zero
> of=3D${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype seek=3D$ROOTFS_SIZE count=3D$C=
OUNT
> bs=3D1024"
> +       dd if=3D/dev/zero of=3D${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype
> seek=3D$ROOTFS_SIZE count=3D$COUNT bs=3D1024
>         bbdebug 1 "Actual Rootfs size:  `du -s ${IMAGE_ROOTFS}`"
> -       bbdebug 1 "Actual Partition size: `stat -c '%s'
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype`"
> -       bbdebug 1 Executing "mkfs.$fstype -F $extra_imagecmd
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d
> ${IMAGE_ROOTFS}"
> -       mkfs.$fstype -F $extra_imagecmd
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d ${IMAGE_ROOT=
FS}
> +       bbdebug 1 "Actual Partition size: `stat -c '%s'
> ${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype`"
> +       bbdebug 1 Executing "mkfs.$fstype -F $extra_imagecmd
> ${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype -d ${IMAGE_ROOTFS}"
> +       mkfs.$fstype -F $extra_imagecmd
> ${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype -d ${IMAGE_ROOTFS}
>         # Error codes 0-3 indicate successfull operation of fsck (no
> errors or errors corrected)
> -       fsck.$fstype -pvfD
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype || [ $? -le 3 ]
> +       fsck.$fstype -pvfD ${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype || [ $?
> -le 3 ]
>  }
>
>  IMAGE_CMD:ext2 =3D "oe_mkext234fs ext2 ${EXTRA_IMAGECMD}"
> @@ -109,8 +109,8 @@ IMAGE_CMD:btrfs () {
>                 size=3D${MIN_BTRFS_SIZE}
>                 bbwarn "Rootfs size is too small for BTRFS. Filesystem
> will be extended to ${size}K"
>         fi
> -       dd if=3D/dev/zero
> of=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.btrfs seek=3D${siz=
e}
> count=3D0 bs=3D1024
> -       mkfs.btrfs ${EXTRA_IMAGECMD} -r ${IMAGE_ROOTFS}
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.btrfs
> +       dd if=3D/dev/zero of=3D${IMGDEPLOYDIR}/${IMAGE_NAME}.btrfs
> seek=3D${size} count=3D0 bs=3D1024
> +       mkfs.btrfs ${EXTRA_IMAGECMD} -r ${IMAGE_ROOTFS}
> ${IMGDEPLOYDIR}/${IMAGE_NAME}.btrfs
>  }
>
>  oe_mksquashfs () {
> @@ -119,7 +119,7 @@ oe_mksquashfs () {
>
>      # Use the bitbake reproducible timestamp instead of the hardcoded
> squashfs one
>      export SOURCE_DATE_EPOCH=3D$(stat -c '%Y' ${IMAGE_ROOTFS})
> -    mksquashfs ${IMAGE_ROOTFS}
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs${comp:+-}${suf=
fix:-$comp}
> ${EXTRA_IMAGECMD} -noappend ${comp:+-comp }$comp
> +    mksquashfs ${IMAGE_ROOTFS}
> ${IMGDEPLOYDIR}/${IMAGE_NAME}.squashfs${comp:+-}${suffix:-$comp}
> ${EXTRA_IMAGECMD} -noappend ${comp:+-comp }$comp
>  }
>  IMAGE_CMD:squashfs =3D "oe_mksquashfs"
>  IMAGE_CMD:squashfs-xz =3D "oe_mksquashfs xz"
> @@ -127,18 +127,18 @@ IMAGE_CMD:squashfs-lzo =3D "oe_mksquashfs lzo"
>  IMAGE_CMD:squashfs-lz4 =3D "oe_mksquashfs lz4"
>  IMAGE_CMD:squashfs-zst =3D "oe_mksquashfs zstd zst"
>
> -IMAGE_CMD:erofs =3D "mkfs.erofs ${EXTRA_IMAGECMD}
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.erofs ${IMAGE_ROOTFS}"
> -IMAGE_CMD:erofs-lz4 =3D "mkfs.erofs -zlz4 ${EXTRA_IMAGECMD}
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.erofs-lz4 ${IMAGE_ROOTF=
S}"
> -IMAGE_CMD:erofs-lz4hc =3D "mkfs.erofs -zlz4hc ${EXTRA_IMAGECMD}
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.erofs-lz4hc
> ${IMAGE_ROOTFS}"
> +IMAGE_CMD:erofs =3D "mkfs.erofs ${EXTRA_IMAGECMD}
> ${IMGDEPLOYDIR}/${IMAGE_NAME}.erofs ${IMAGE_ROOTFS}"
> +IMAGE_CMD:erofs-lz4 =3D "mkfs.erofs -zlz4 ${EXTRA_IMAGECMD}
> ${IMGDEPLOYDIR}/${IMAGE_NAME}.erofs-lz4 ${IMAGE_ROOTFS}"
> +IMAGE_CMD:erofs-lz4hc =3D "mkfs.erofs -zlz4hc ${EXTRA_IMAGECMD}
> ${IMGDEPLOYDIR}/${IMAGE_NAME}.erofs-lz4hc ${IMAGE_ROOTFS}"
>
>
>  IMAGE_CMD_TAR ?=3D "tar"
>  # ignore return code 1 "file changed as we read it" as other tasks(e.g.
> do_image_wic) may be hardlinking rootfs
> -IMAGE_CMD:tar =3D "${IMAGE_CMD_TAR} --sort=3Dname --format=3Dposix
> --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar
> -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
> +IMAGE_CMD:tar =3D "${IMAGE_CMD_TAR} --sort=3Dname --format=3Dposix
> --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}.tar -C ${IMAGE_ROOTFS} =
.
> || [ $? -eq 1 ]"
>
>  do_image_cpio[cleandirs] +=3D "${WORKDIR}/cpio_append"
>  IMAGE_CMD:cpio () {
> -       (cd ${IMAGE_ROOTFS} && find . | sort | cpio --reproducible -o -H
> newc >${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
> +       (cd ${IMAGE_ROOTFS} && find . | sort | cpio --reproducible -o -H
> newc >${IMGDEPLOYDIR}/${IMAGE_NAME}.cpio)
>         # We only need the /init symlink if we're building the real
>         # image. The -dbg image doesn't need it! By being clever
>         # about this we also avoid 'touch' below failing, as it
> @@ -152,7 +152,7 @@ IMAGE_CMD:cpio () {
>                         else
>                                  touch -r ${IMAGE_ROOTFS}
> ${WORKDIR}/cpio_append/init
>                         fi
> -                       (cd  ${WORKDIR}/cpio_append && echo ./init | cpio
> --reproducible -oA -H newc -F
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
> +                       (cd  ${WORKDIR}/cpio_append && echo ./init | cpio
> --reproducible -oA -H newc -F ${IMGDEPLOYDIR}/${IMAGE_NAME}.cpio)
>                 fi
>         fi
>  }
> @@ -167,7 +167,7 @@ write_ubi_config() {
>         cat <<EOF > ubinize${vname}-${IMAGE_NAME}.cfg
>  [ubifs]
>  mode=3Dubi
>
> -image=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.${UBI_=
IMGTYPE}
> +image=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}.${UBI_IMGTYPE}
>  vol_id=3D0
>  vol_type=3D${UBI_VOLTYPE}
>  vol_name=3D${UBI_VOLNAME}
> @@ -192,9 +192,9 @@ multiubi_mkfs() {
>         write_ubi_config "${vname}"
>
>         if [ -n "$vname" ]; then
> -               mkfs.ubifs -r ${IMAGE_ROOTFS} -o
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs
> ${mkubifs_args}
> +               mkfs.ubifs -r ${IMAGE_ROOTFS} -o
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}.ubifs ${mkubifs_args}
>         fi
> -       ubinize -o
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubi
> ${ubinize_args} ubinize${vname}-${IMAGE_NAME}.cfg
> +       ubinize -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}.ubi
> ${ubinize_args} ubinize${vname}-${IMAGE_NAME}.cfg
>
>         # Cleanup cfg file
>         mv ubinize${vname}-${IMAGE_NAME}.cfg ${IMGDEPLOYDIR}/
> @@ -202,12 +202,12 @@ multiubi_mkfs() {
>         # Create own symlinks for 'named' volumes
>         if [ -n "$vname" ]; then
>                 cd ${IMGDEPLOYDIR}
> -               if [ -e ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs ]=
;
> then
> -                       ln -sf
> ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs \
> +               if [ -e ${IMAGE_NAME}${vname}.ubifs ]; then
> +                       ln -sf ${IMAGE_NAME}${vname}.ubifs \
>                         ${IMAGE_LINK_NAME}${vname}.ubifs
>                 fi
> -               if [ -e ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubi ];
> then
> -                       ln -sf
> ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubi \
> +               if [ -e ${IMAGE_NAME}${vname}.ubi ]; then
> +                       ln -sf ${IMAGE_NAME}${vname}.ubi \
>                         ${IMAGE_LINK_NAME}${vname}.ubi
>                 fi
>                 cd -
> @@ -232,7 +232,7 @@ IMAGE_CMD:ubi () {
>  }
>  IMAGE_TYPEDEP:ubi =3D "${UBI_IMGTYPE}"
>
> -IMAGE_CMD:ubifs =3D "mkfs.ubifs -r ${IMAGE_ROOTFS} -o
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ubifs ${MKUBIFS_ARGS}"
> +IMAGE_CMD:ubifs =3D "mkfs.ubifs -r ${IMAGE_ROOTFS} -o
> ${IMGDEPLOYDIR}/${IMAGE_NAME}.ubifs ${MKUBIFS_ARGS}"
>
>  MIN_F2FS_SIZE ?=3D "524288"
>  IMAGE_CMD:f2fs () {
> @@ -246,9 +246,9 @@ IMAGE_CMD:f2fs () {
>                 size=3D${MIN_F2FS_SIZE}
>                 bbwarn "Rootfs size is too small for F2FS. Filesystem wil=
l
> be extended to ${size}K"
>         fi
> -       dd if=3D/dev/zero
> of=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.f2fs seek=3D${size=
}
> count=3D0 bs=3D1024
> -       mkfs.f2fs ${EXTRA_IMAGECMD}
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.f2fs
> -       sload.f2fs -f ${IMAGE_ROOTFS}
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.f2fs
> +       dd if=3D/dev/zero of=3D${IMGDEPLOYDIR}/${IMAGE_NAME}.f2fs seek=3D=
${size}
> count=3D0 bs=3D1024
> +       mkfs.f2fs ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${IMAGE_NAME}.f2fs
> +       sload.f2fs -f ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}.f2fs
>  }
>
>  EXTRA_IMAGECMD =3D ""
> @@ -314,32 +314,32 @@ IMAGE_TYPES:append:x86-64 =3D " hddimg iso"
>  COMPRESSIONTYPES ?=3D ""
>
>  CONVERSIONTYPES =3D "gz bz2 lzma xz lz4 lzo zip 7zip zst sum md5sum sha1=
sum
> sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi qco=
w2
> base64 gzsync zsync ${COMPRESSIONTYPES}"
> -CONVERSION_CMD:lzma =3D "lzma -k -f -7
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> -CONVERSION_CMD:gz =3D "gzip -f -9 -n -c --rsyncable
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
> -CONVERSION_CMD:bz2 =3D "pbzip2 -f -k
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> -CONVERSION_CMD:xz =3D "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_DEFAULTS=
}
> --check=3D${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}=
 >
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
> -CONVERSION_CMD:lz4 =3D "lz4 -9 -z -l
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
> -CONVERSION_CMD:lzo =3D "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type=
}"
> -CONVERSION_CMD:zip =3D "zip ${ZIP_COMPRESSION_LEVEL}
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zip
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> -CONVERSION_CMD:7zip =3D "7za a -mx=3D${7ZIP_COMPRESSION_LEVEL}
> -mm=3D${7ZIP_COMPRESSION_METHOD}
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.${7ZIP_EXTENSION}
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> -CONVERSION_CMD:zst =3D "zstd -f -k -T0 -c ${ZSTD_COMPRESSION_LEVEL}
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zst"
> -CONVERSION_CMD:sum =3D "sumtool -i
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
> -CONVERSION_CMD:md5sum =3D "md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${ty=
pe}
> > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.md5sum"
> -CONVERSION_CMD:sha1sum =3D "sha1sum
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha1sum"
> -CONVERSION_CMD:sha224sum =3D "sha224sum
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha224sum"
> -CONVERSION_CMD:sha256sum =3D "sha256sum
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha256sum"
> -CONVERSION_CMD:sha384sum =3D "sha384sum
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha384sum"
> -CONVERSION_CMD:sha512sum =3D "sha512sum
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha512sum"
> -CONVERSION_CMD:bmap =3D "bmaptool create
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.bmap"
> -CONVERSION_CMD:u-boot =3D "mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk =
-C
> none -n ${IMAGE_NAME} -d ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.u-boot"
> -CONVERSION_CMD:vmdk =3D "qemu-img convert -O vmdk
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vmdk"
> -CONVERSION_CMD:vhdx =3D "qemu-img convert -O vhdx -o subformat=3Ddynamic
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vhdx"
> -CONVERSION_CMD:vhd =3D "qemu-img convert -O vpc -o subformat=3Dfixed
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vhd"
> -CONVERSION_CMD:vdi =3D "qemu-img convert -O vdi
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vdi"
> -CONVERSION_CMD:qcow2 =3D "qemu-img convert -O qcow2
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.qcow2"
> -CONVERSION_CMD:base64 =3D "base64 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${ty=
pe}
> > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.base64"
> -CONVERSION_CMD:zsync =3D "zsyncmake_curl
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> -CONVERSION_CMD:gzsync =3D "zsyncmake_curl -z
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> +CONVERSION_CMD:lzma =3D "lzma -k -f -7 ${IMAGE_NAME}.${type}"
> +CONVERSION_CMD:gz =3D "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}.${type=
} >
> ${IMAGE_NAME}.${type}.gz"
> +CONVERSION_CMD:bz2 =3D "pbzip2 -f -k ${IMAGE_NAME}.${type}"
> +CONVERSION_CMD:xz =3D "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_DEFAULTS=
}
> --check=3D${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.${type} >
> ${IMAGE_NAME}.${type}.xz"
> +CONVERSION_CMD:lz4 =3D "lz4 -9 -z -l ${IMAGE_NAME}.${type}
> ${IMAGE_NAME}.${type}.lz4"
> +CONVERSION_CMD:lzo =3D "lzop -9 ${IMAGE_NAME}.${type}"
> +CONVERSION_CMD:zip =3D "zip ${ZIP_COMPRESSION_LEVEL}
> ${IMAGE_NAME}.${type}.zip ${IMAGE_NAME}.${type}"
> +CONVERSION_CMD:7zip =3D "7za a -mx=3D${7ZIP_COMPRESSION_LEVEL}
> -mm=3D${7ZIP_COMPRESSION_METHOD} ${IMAGE_NAME}.${type}.${7ZIP_EXTENSION}
> ${IMAGE_NAME}.${type}"
> +CONVERSION_CMD:zst =3D "zstd -f -k -T0 -c ${ZSTD_COMPRESSION_LEVEL}
> ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.zst"
> +CONVERSION_CMD:sum =3D "sumtool -i ${IMAGE_NAME}.${type} -o
> ${IMAGE_NAME}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
> +CONVERSION_CMD:md5sum =3D "md5sum ${IMAGE_NAME}.${type} >
> ${IMAGE_NAME}.${type}.md5sum"
> +CONVERSION_CMD:sha1sum =3D "sha1sum ${IMAGE_NAME}.${type} >
> ${IMAGE_NAME}.${type}.sha1sum"
> +CONVERSION_CMD:sha224sum =3D "sha224sum ${IMAGE_NAME}.${type} >
> ${IMAGE_NAME}.${type}.sha224sum"
> +CONVERSION_CMD:sha256sum =3D "sha256sum ${IMAGE_NAME}.${type} >
> ${IMAGE_NAME}.${type}.sha256sum"
> +CONVERSION_CMD:sha384sum =3D "sha384sum ${IMAGE_NAME}.${type} >
> ${IMAGE_NAME}.${type}.sha384sum"
> +CONVERSION_CMD:sha512sum =3D "sha512sum ${IMAGE_NAME}.${type} >
> ${IMAGE_NAME}.${type}.sha512sum"
> +CONVERSION_CMD:bmap =3D "bmaptool create ${IMAGE_NAME}.${type} -o
> ${IMAGE_NAME}.${type}.bmap"
> +CONVERSION_CMD:u-boot =3D "mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk =
-C
> none -n ${IMAGE_NAME} -d ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.u-bo=
ot"
> +CONVERSION_CMD:vmdk =3D "qemu-img convert -O vmdk ${IMAGE_NAME}.${type}
> ${IMAGE_NAME}.${type}.vmdk"
> +CONVERSION_CMD:vhdx =3D "qemu-img convert -O vhdx -o subformat=3Ddynamic
> ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.vhdx"
> +CONVERSION_CMD:vhd =3D "qemu-img convert -O vpc -o subformat=3Dfixed
> ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.vhd"
> +CONVERSION_CMD:vdi =3D "qemu-img convert -O vdi ${IMAGE_NAME}.${type}
> ${IMAGE_NAME}.${type}.vdi"
> +CONVERSION_CMD:qcow2 =3D "qemu-img convert -O qcow2 ${IMAGE_NAME}.${type=
}
> ${IMAGE_NAME}.${type}.qcow2"
> +CONVERSION_CMD:base64 =3D "base64 ${IMAGE_NAME}.${type} >
> ${IMAGE_NAME}.${type}.base64"
> +CONVERSION_CMD:zsync =3D "zsyncmake_curl ${IMAGE_NAME}.${type}"
> +CONVERSION_CMD:gzsync =3D "zsyncmake_curl -z ${IMAGE_NAME}.${type}"
>  CONVERSION_DEPENDS_lzma =3D "xz-native"
>  CONVERSION_DEPENDS_gz =3D "pigz-native"
>  CONVERSION_DEPENDS_bz2 =3D "pbzip2-native"
> diff --git a/meta/classes-recipe/image_types_wic.bbclass
> b/meta/classes-recipe/image_types_wic.bbclass
> index c339b9bdfb..528a91bf5e 100644
> --- a/meta/classes-recipe/image_types_wic.bbclass
> +++ b/meta/classes-recipe/image_types_wic.bbclass
> @@ -71,7 +71,7 @@ IMAGE_CMD:wic () {
>                 bbfatal "No kickstart files from WKS_FILES were found:
> ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
>         fi
>         BUILDDIR=3D"${TOPDIR}" PSEUDO_UNLOAD=3D1 wic create "$wks" --vars
> "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o
> "$build_wic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
> -       mv "$build_wic/$(basename "${wks%.wks}")"*.direct
> "$out${IMAGE_NAME_SUFFIX}.wic"
> +       mv "$build_wic/$(basename "${wks%.wks}")"*.direct "$out.wic"
>  }
>  IMAGE_CMD:wic[vardepsexclude] =3D "WKS_FULL_PATH WKS_FILES TOPDIR"
>  do_image_wic[cleandirs] =3D "${WORKDIR}/build-wic"
> diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass
> b/meta/classes-recipe/rootfs-postcommands.bbclass
> index 7538c8b0b5..db90693dd0 100644
> --- a/meta/classes-recipe/rootfs-postcommands.bbclass
> +++ b/meta/classes-recipe/rootfs-postcommands.bbclass
> @@ -37,7 +37,7 @@ APPEND:append =3D '${@bb.utils.contains("IMAGE_FEATURES=
",
> "read-only-rootfs", " ro
>  ROOTFS_POSTPROCESS_COMMAND +=3D "write_image_test_data; "
>
>  # Write manifest
> -IMAGE_MANIFEST =3D
> "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.manifest"
> +IMAGE_MANIFEST =3D "${IMGDEPLOYDIR}/${IMAGE_NAME}.manifest"
>  ROOTFS_POSTUNINSTALL_COMMAND =3D+ "write_image_manifest ; "
>  # Set default postinst log file
>  POSTINST_LOGFILE ?=3D "${localstatedir}/log/postinstall.log"
> diff --git a/meta/classes/cve-check.bbclass
> b/meta/classes/cve-check.bbclass
> index bd9e7e7445..f7abaf4f0c 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -48,8 +48,8 @@ CVE_CHECK_LOG_JSON ?=3D "${T}/cve.json"
>  CVE_CHECK_DIR ??=3D "${DEPLOY_DIR}/cve"
>  CVE_CHECK_RECIPE_FILE ?=3D "${CVE_CHECK_DIR}/${PN}"
>  CVE_CHECK_RECIPE_FILE_JSON ?=3D "${CVE_CHECK_DIR}/${PN}_cve.json"
> -CVE_CHECK_MANIFEST ?=3D
> "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cve"
> -CVE_CHECK_MANIFEST_JSON ?=3D
> "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.json"
> +CVE_CHECK_MANIFEST ?=3D "${IMGDEPLOYDIR}/${IMAGE_NAME}.cve"
> +CVE_CHECK_MANIFEST_JSON ?=3D "${IMGDEPLOYDIR}/${IMAGE_NAME}.json"
>  CVE_CHECK_COPY_FILES ??=3D "1"
>  CVE_CHECK_CREATE_MANIFEST ??=3D "1"
>
> diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py
> b/meta/lib/oeqa/selftest/cases/fitimage.py
> index 7bc171e02d..9383d0c4db 100644
> --- a/meta/lib/oeqa/selftest/cases/fitimage.py
> +++ b/meta/lib/oeqa/selftest/cases/fitimage.py
> @@ -33,6 +33,8 @@ KERNEL_CLASSES =3D " kernel-fitimage "
>  # RAM disk variables including load address and entrypoint for kernel an=
d
> RAM disk
>  IMAGE_FSTYPES +=3D "cpio.gz"
>  INITRAMFS_IMAGE =3D "core-image-minimal"
> +# core-image-minimal is used as initramfs here, drop the rootfs suffix
> +IMAGE_NAME_SUFFIX:pn-core-image-minimal =3D ""
>  UBOOT_RD_LOADADDRESS =3D "0x88000000"
>  UBOOT_RD_ENTRYPOINT =3D "0x88000000"
>  UBOOT_LOADADDRESS =3D "0x80080000"
> diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> index a5d42f26e2..1019e53993 100644
> --- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> +++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> @@ -133,9 +133,9 @@ create_bundle_files () {
>         cd ${WORKDIR}
>         mkdir -p Yocto_Build_Appliance
>         cp *.vmx* Yocto_Build_Appliance
> -       ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.wic.vmdk
> Yocto_Build_Appliance/Yocto_Build_Appliance.vmdk
> -       ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.wic.vhdx
> Yocto_Build_Appliance/Yocto_Build_Appliance.vhdx
> -       ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.wic.vhd
> Yocto_Build_Appliance/Yocto_Build_Appliance.vhd
> +       ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}.wic.vmdk
> Yocto_Build_Appliance/Yocto_Build_Appliance.vmdk
> +       ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}.wic.vhdx
> Yocto_Build_Appliance/Yocto_Build_Appliance.vhdx
> +       ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}.wic.vhd
> Yocto_Build_Appliance/Yocto_Build_Appliance.vhd
>         zip -r ${IMGDEPLOYDIR}/Yocto_Build_Appliance-${DATETIME}.zip
> Yocto_Build_Appliance
>         ln -sf Yocto_Build_Appliance-${DATETIME}.zip
> ${IMGDEPLOYDIR}/Yocto_Build_Appliance.zip
>  }
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184308):
> https://lists.openembedded.org/g/openembedded-core/message/184308
> Mute This Topic: https://lists.openembedded.org/mt/100151266/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000031fe0e0600aabe5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This isn&#39;t backwards compatible and various BSP might =
need small adjustment to work correctly with this.<div><br></div><div>Pleas=
e don&#39;t backport this one.</div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 15, 2023 at 12:34=E2=80=AFA=
M Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">F=
rom: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_=
blank">Martin.Jansa@gmail.com</a>&gt;<br>
<br>
* ${IMAGE_NAME}${IMAGE_NAME_SUFFIX} is almost always used together already<=
br>
=C2=A0 and when they aren&#39;t it&#39;s usually because of hardcoded &#39;=
.rootfs&#39; suffix<br>
<br>
* it&#39;s a bit strange, because ${IMAGE_NAME_SUFFIX} is applied after the=
<br>
=C2=A0 version from ${IMAGE_VERSION_SUFFIX}, if we move it to ${IMAGE_LINK_=
NAME}<br>
=C2=A0 then it will be applied before the version and ${IMAGE_LINK_NAME}<br=
>
=C2=A0 will be just the version-less symlink to latest built version.<br>
<br>
* it&#39;s not added to INITRAMFS_IMAGE_NAME as it assumes that all<br>
=C2=A0 images used as initramfs will set IMAGE_NAME_SUFFIX to empty.<br>
=C2=A0 Many already do as shown bellow, but you might need to extend<br>
=C2=A0 this list in your layer.<br>
<br>
* this also allows to drop support for imgsuffix varflag, recipes which<br>
=C2=A0 don&#39;t want to have .rootfs suffix can just set IMAGE_NAME_SUFFIX=
 to<br>
=C2=A0 empty and it will be consistently respected by both IMAGE_NAME and I=
MAGE_LINK_NAME<br>
<br>
* imgsuffix =3D d.getVarFlag(&quot;do_&quot; + taskname, &#39;imgsuffix&#39=
;) or d.expand(&quot;${IMAGE_NAME_SUFFIX}.&quot;)<br>
=C2=A0 is kind of terrible, notice trailing &#39;.&#39; after ${IMAGE_NAME_=
SUFFIX}<br>
=C2=A0 while this dot was in imgsuffix in:<br>
=C2=A0 do_bootimg[imgsuffix] =3D &quot;.&quot;<br>
<br>
=C2=A0 but in both cases it&#39;s not really part of the imgsuffix, but the=
<br>
=C2=A0 &quot;extension&quot; type separator as in dst variable:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dst =3D os.path.join(deploy_dir, link_nam=
e + &quot;.&quot; + type)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 src =3D img_name + imgsuffix + type<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 src =3D img_name + &quot;.&quot; + type<br>
<br>
* for ubifs volumes move vname after IMAGE_NAME_SUFFIX<br>
<br>
* to better document these changes here is an example with default poky<br>
=C2=A0 configuration with just:<br>
=C2=A0 IMAGE_FSTYPES:append:pn-core-image-minimal =3D &quot; live wic wic.v=
mdk ubi&quot;<br>
=C2=A0 MKUBIFS_ARGS =3D &quot;-m 2048 -e 129024 -c 968 -x zlib&quot;<br>
=C2=A0 UBINIZE_ARGS =3D &quot;-m 2048 -p 131072 -s 512&quot;<br>
=C2=A0 added in local.conf, so that deploy_dir has also some initramfs and =
more<br>
=C2=A0 IMAGE_FSTYPES<br>
<br>
* &quot;ls -lahi tmp/deploy/images/qemux86-64/&quot;<br>
=C2=A0 output after &quot;bitbake core-image-minimal&quot;<br>
<br>
=C2=A0 And deploy-dir is cleaned between runs with:<br>
=C2=A0 bitbake -c clean core-image-minimal core-image-minimal-initramfs vir=
tual/kernel grub-efi systemd-boot<br>
<br>
=C2=A0 The output confirms that the only change is &quot;.rootfs&quot; adde=
d not only<br>
=C2=A0 in ext4 and manifest files, but also for hddimg, iso, qemuboot.conf<=
br>
=C2=A0 testdata.json for both the actual artifacts as well as the symlinks<=
br>
=C2=A0 while core-image-minimal-initramfs doesn&#39;t have them as IMAGE_NA=
ME_SUFFIX<br>
=C2=A0 was already set to empty there:<br>
meta/classes-recipe/baremetal-image.bbclass:IMAGE_NAME_SUFFIX ?=3D &quot;&q=
uot;<br>
meta/recipes-core/images/core-image-minimal-initramfs.bb:IMAGE_NAME_SUFFIX =
?=3D &quot;&quot;<br>
meta/recipes-core/images/core-image-tiny-initramfs.bb:IMAGE_NAME_SUFFIX ?=
=3D &quot;&quot;<br>
meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb:IMAGE_N=
AME_SUFFIX ?=3D &quot;&quot;<br>
meta/recipes-extended/images/core-image-testcontroller-initramfs.bb:IMAGE_N=
AME_SUFFIX ?=3D &quot;&quot;<br>
<br>
=C2=A0 before these changes:<br>
total 297M<br>
31269162 drwxr-xr-x 2 martin martin 4.0K Mar=C2=A0 7 19:19 .<br>
31263942 drwxr-xr-x 3 martin martin 4.0K Mar=C2=A0 7 12:53 ..<br>
35845703 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A077 Mar=C2=A0 7 12:27 bzImag=
e -&gt; bzImage--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307=
112110.bin<br>
35845704 -rw-r--r-- 2 martin martin=C2=A0 11M Mar=C2=A0 7 12:27 bzImage--6.=
1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110.bin<br>
35845702 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A077 Mar=C2=A0 7 12:27 bzImag=
e-qemux86-64.bin -&gt; bzImage--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemu=
x86-64-20230307112110.bin<br>
40236967 -rw-r--r-- 2 martin martin=C2=A0 13M Mar=C2=A0 7 19:19 core-image-=
minimal-initramfs-qemux86-64-20230307181808.cpio.gz<br>
40203232 -rw-r--r-- 2 martin martin 1.1K Mar=C2=A0 7 19:19 core-image-minim=
al-initramfs-qemux86-64-20230307181808.manifest<br>
40212700 -rw-r--r-- 2 martin martin 1.6K Mar=C2=A0 7 19:19 core-image-minim=
al-initramfs-qemux86-64-20230307181808.qemuboot.conf<br>
40211556 -rw-r--r-- 2 martin martin 211K Mar=C2=A0 7 19:19 core-image-minim=
al-initramfs-qemux86-64-20230307181808.testdata.json<br>
40236964 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A062 Mar=C2=A0 7 19:19 core-i=
mage-minimal-initramfs-qemux86-64.cpio.gz -&gt; core-image-minimal-initramf=
s-qemux86-64-20230307181808.cpio.gz<br>
40203235 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A063 Mar=C2=A0 7 19:19 core-i=
mage-minimal-initramfs-qemux86-64.manifest -&gt; core-image-minimal-initram=
fs-qemux86-64-20230307181808.manifest<br>
40212690 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A068 Mar=C2=A0 7 19:19 core-i=
mage-minimal-initramfs-qemux86-64.qemuboot.conf -&gt; core-image-minimal-in=
itramfs-qemux86-64-20230307181808.qemuboot.conf<br>
40211560 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A068 Mar=C2=A0 7 19:19 core-i=
mage-minimal-initramfs-qemux86-64.testdata.json -&gt; core-image-minimal-in=
itramfs-qemux86-64-20230307181808.testdata.json<br>
40237307 -rw-r--r-- 2 martin martin=C2=A0 57M Mar=C2=A0 7 19:19 core-image-=
minimal-qemux86-64-20230307181808.hddimg<br>
40237329 -rw-r--r-- 2 martin martin=C2=A0 56M Mar=C2=A0 7 19:19 core-image-=
minimal-qemux86-64-20230307181808.iso<br>
40220347 -rw-r--r-- 2 martin martin 1.6K Mar=C2=A0 7 19:19 core-image-minim=
al-qemux86-64-20230307181808.qemuboot.conf<br>
40236942 -rw-r--r-- 2 martin martin=C2=A0 34M Mar=C2=A0 7 19:19 core-image-=
minimal-qemux86-64-20230307181808.rootfs.ext4<br>
40211563 -rw-r--r-- 2 martin martin 1.2K Mar=C2=A0 7 19:19 core-image-minim=
al-qemux86-64-20230307181808.rootfs.manifest<br>
40237206 -rw-r--r-- 2 martin martin=C2=A0 16M Mar=C2=A0 7 19:19 core-image-=
minimal-qemux86-64-20230307181808.rootfs.tar.bz2<br>
40237216 -rw-r--r-- 2 martin martin=C2=A0 20M Mar=C2=A0 7 19:19 core-image-=
minimal-qemux86-64-20230307181808.rootfs.ubi<br>
40224358 -rw-r--r-- 2 martin martin=C2=A0 19M Mar=C2=A0 7 19:19 core-image-=
minimal-qemux86-64-20230307181808.rootfs.ubifs<br>
40360386 -rw-r--r-- 2 martin martin=C2=A0 73M Mar=C2=A0 7 19:19 core-image-=
minimal-qemux86-64-20230307181808.rootfs.wic<br>
40237285 -rw-r--r-- 2 martin martin=C2=A0 35M Mar=C2=A0 7 19:19 core-image-=
minimal-qemux86-64-20230307181808.rootfs.wic.vmdk<br>
40209866 -rw-r--r-- 2 martin martin 206K Mar=C2=A0 7 19:19 core-image-minim=
al-qemux86-64-20230307181808.testdata.json<br>
40236946 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A056 Mar=C2=A0 7 19:19 core-i=
mage-minimal-qemux86-64.ext4 -&gt; core-image-minimal-qemux86-64-2023030718=
1808.rootfs.ext4<br>
40237336 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A051 Mar=C2=A0 7 19:19 core-i=
mage-minimal-qemux86-64.hddimg -&gt; core-image-minimal-qemux86-64-20230307=
181808.hddimg<br>
40237337 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A048 Mar=C2=A0 7 19:19 core-i=
mage-minimal-qemux86-64.iso -&gt; core-image-minimal-qemux86-64-20230307181=
808.iso<br>
40211564 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A060 Mar=C2=A0 7 19:19 core-i=
mage-minimal-qemux86-64.manifest -&gt; core-image-minimal-qemux86-64-202303=
07181808.rootfs.manifest<br>
40220348 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A058 Mar=C2=A0 7 19:19 core-i=
mage-minimal-qemux86-64.qemuboot.conf -&gt; core-image-minimal-qemux86-64-2=
0230307181808.qemuboot.conf<br>
40237205 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A059 Mar=C2=A0 7 19:19 core-i=
mage-minimal-qemux86-64.tar.bz2 -&gt; core-image-minimal-qemux86-64-2023030=
7181808.rootfs.tar.bz2<br>
40209873 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A058 Mar=C2=A0 7 19:19 core-i=
mage-minimal-qemux86-64.testdata.json -&gt; core-image-minimal-qemux86-64-2=
0230307181808.testdata.json<br>
40237217 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A055 Mar=C2=A0 7 19:19 core-i=
mage-minimal-qemux86-64.ubi -&gt; core-image-minimal-qemux86-64-20230307181=
808.rootfs.ubi<br>
40236771 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A057 Mar=C2=A0 7 19:19 core-i=
mage-minimal-qemux86-64.ubifs -&gt; core-image-minimal-qemux86-64-202303071=
81808.rootfs.ubifs<br>
40237287 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A055 Mar=C2=A0 7 19:19 core-i=
mage-minimal-qemux86-64.wic -&gt; core-image-minimal-qemux86-64-20230307181=
808.rootfs.wic<br>
40237286 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A060 Mar=C2=A0 7 19:19 core-i=
mage-minimal-qemux86-64.wic.vmdk -&gt; core-image-minimal-qemux86-64-202303=
07181808.rootfs.wic.vmdk<br>
40237192 -rw-r--r-- 2 martin martin 3.8K Mar=C2=A0 7 19:19 core-image-minim=
al.env<br>
34458377 -rw-r--r-- 2 martin martin 616K Mar=C2=A0 7 17:55 grub-efi-bootx64=
.efi<br>
34963606 -rwxr-xr-x 2 martin martin 103K Mar=C2=A0 6 22:02 linuxx64.efi.stu=
b<br>
35845662 -rw-r--r-- 2 martin martin 8.2M Mar=C2=A0 7 12:27 modules--6.1.14+=
git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110.tgz<br>
35845701 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A077 Mar=C2=A0 7 12:27 module=
s-qemux86-64.tgz -&gt; modules--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemu=
x86-64-20230307112110.tgz<br>
34963605 -rwxr-xr-x 2 martin martin 140K Mar=C2=A0 6 22:02 systemd-bootx64.=
efi<br>
27651415 -rw-r--r-- 2 martin martin=C2=A0 274 Mar=C2=A0 7 19:19 ubinize-cor=
e-image-minimal-qemux86-64-20230307181808.cfg<br>
<br>
=C2=A0 after these changes:<br>
total 297M<br>
31269162 drwxr-xr-x 2 martin martin 4.0K Mar=C2=A0 7 19:16 .<br>
31263942 drwxr-xr-x 3 martin martin 4.0K Mar=C2=A0 7 12:53 ..<br>
39479266 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A077 Mar=C2=A0 7 12:27 bzImag=
e -&gt; bzImage--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307=
112110.bin<br>
39479267 -rw-r--r-- 2 martin martin=C2=A0 11M Mar=C2=A0 7 12:27 bzImage--6.=
1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110.bin<br>
39479264 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A077 Mar=C2=A0 7 12:27 bzImag=
e-qemux86-64.bin -&gt; bzImage--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemu=
x86-64-20230307112110.bin<br>
39648810 -rw-r--r-- 2 martin martin=C2=A0 13M Mar=C2=A0 7 19:15 core-image-=
minimal-initramfs-qemux86-64-20230307181456.cpio.gz<br>
39638400 -rw-r--r-- 2 martin martin 1.1K Mar=C2=A0 7 19:15 core-image-minim=
al-initramfs-qemux86-64-20230307181456.manifest<br>
39644650 -rw-r--r-- 2 martin martin 1.6K Mar=C2=A0 7 19:15 core-image-minim=
al-initramfs-qemux86-64-20230307181456.qemuboot.conf<br>
39637657 -rw-r--r-- 2 martin martin 211K Mar=C2=A0 7 19:15 core-image-minim=
al-initramfs-qemux86-64-20230307181456.testdata.json<br>
39648091 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A062 Mar=C2=A0 7 19:15 core-i=
mage-minimal-initramfs-qemux86-64.cpio.gz -&gt; core-image-minimal-initramf=
s-qemux86-64-20230307181456.cpio.gz<br>
39638401 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A063 Mar=C2=A0 7 19:15 core-i=
mage-minimal-initramfs-qemux86-64.manifest -&gt; core-image-minimal-initram=
fs-qemux86-64-20230307181456.manifest<br>
39644651 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A068 Mar=C2=A0 7 19:15 core-i=
mage-minimal-initramfs-qemux86-64.qemuboot.conf -&gt; core-image-minimal-in=
itramfs-qemux86-64-20230307181456.qemuboot.conf<br>
39637662 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A068 Mar=C2=A0 7 19:15 core-i=
mage-minimal-initramfs-qemux86-64.testdata.json -&gt; core-image-minimal-in=
itramfs-qemux86-64-20230307181456.testdata.json<br>
39654281 -rw-r--r-- 2 martin martin=C2=A0 34M Mar=C2=A0 7 19:15 core-image-=
minimal-qemux86-64.rootfs-20230307181456.ext4<br>
39656710 -rw-r--r-- 2 martin martin=C2=A0 57M Mar=C2=A0 7 19:15 core-image-=
minimal-qemux86-64.rootfs-20230307181456.hddimg<br>
39657112 -rw-r--r-- 2 martin martin=C2=A0 56M Mar=C2=A0 7 19:16 core-image-=
minimal-qemux86-64.rootfs-20230307181456.iso<br>
39645313 -rw-r--r-- 2 martin martin 1.2K Mar=C2=A0 7 19:15 core-image-minim=
al-qemux86-64.rootfs-20230307181456.manifest<br>
39646013 -rw-r--r-- 2 martin martin 1.6K Mar=C2=A0 7 19:15 core-image-minim=
al-qemux86-64.rootfs-20230307181456.qemuboot.conf<br>
39656336 -rw-r--r-- 2 martin martin=C2=A0 16M Mar=C2=A0 7 19:15 core-image-=
minimal-qemux86-64.rootfs-20230307181456.tar.bz2<br>
39644408 -rw-r--r-- 2 martin martin 206K Mar=C2=A0 7 19:15 core-image-minim=
al-qemux86-64.rootfs-20230307181456.testdata.json<br>
39656583 -rw-r--r-- 2 martin martin=C2=A0 20M Mar=C2=A0 7 19:15 core-image-=
minimal-qemux86-64.rootfs-20230307181456.ubi<br>
39654124 -rw-r--r-- 2 martin martin=C2=A0 19M Mar=C2=A0 7 19:15 core-image-=
minimal-qemux86-64.rootfs-20230307181456.ubifs<br>
39802371 -rw-r--r-- 2 martin martin=C2=A0 73M Mar=C2=A0 7 19:16 core-image-=
minimal-qemux86-64.rootfs-20230307181456.wic<br>
39657113 -rw-r--r-- 2 martin martin=C2=A0 35M Mar=C2=A0 7 19:16 core-image-=
minimal-qemux86-64.rootfs-20230307181456.wic.vmdk<br>
39654412 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A056 Mar=C2=A0 7 19:15 core-i=
mage-minimal-qemux86-64.rootfs.ext4 -&gt; core-image-minimal-qemux86-64.roo=
tfs-20230307181456.ext4<br>
39657167 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A058 Mar=C2=A0 7 19:16 core-i=
mage-minimal-qemux86-64.rootfs.hddimg -&gt; core-image-minimal-qemux86-64.r=
ootfs-20230307181456.hddimg<br>
39657168 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A055 Mar=C2=A0 7 19:16 core-i=
mage-minimal-qemux86-64.rootfs.iso -&gt; core-image-minimal-qemux86-64.root=
fs-20230307181456.iso<br>
39645316 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A060 Mar=C2=A0 7 19:15 core-i=
mage-minimal-qemux86-64.rootfs.manifest -&gt; core-image-minimal-qemux86-64=
.rootfs-20230307181456.manifest<br>
39646014 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A065 Mar=C2=A0 7 19:15 core-i=
mage-minimal-qemux86-64.rootfs.qemuboot.conf -&gt; core-image-minimal-qemux=
86-64.rootfs-20230307181456.qemuboot.conf<br>
39656315 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A059 Mar=C2=A0 7 19:15 core-i=
mage-minimal-qemux86-64.rootfs.tar.bz2 -&gt; core-image-minimal-qemux86-64.=
rootfs-20230307181456.tar.bz2<br>
39644406 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A065 Mar=C2=A0 7 19:15 core-i=
mage-minimal-qemux86-64.rootfs.testdata.json -&gt; core-image-minimal-qemux=
86-64.rootfs-20230307181456.testdata.json<br>
39656584 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A055 Mar=C2=A0 7 19:15 core-i=
mage-minimal-qemux86-64.rootfs.ubi -&gt; core-image-minimal-qemux86-64.root=
fs-20230307181456.ubi<br>
39654775 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A057 Mar=C2=A0 7 19:15 core-i=
mage-minimal-qemux86-64.rootfs.ubifs -&gt; core-image-minimal-qemux86-64.ro=
otfs-20230307181456.ubifs<br>
39657126 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A055 Mar=C2=A0 7 19:16 core-i=
mage-minimal-qemux86-64.rootfs.wic -&gt; core-image-minimal-qemux86-64.root=
fs-20230307181456.wic<br>
39657088 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A060 Mar=C2=A0 7 19:16 core-i=
mage-minimal-qemux86-64.rootfs.wic.vmdk -&gt; core-image-minimal-qemux86-64=
.rootfs-20230307181456.wic.vmdk<br>
39654418 -rw-r--r-- 2 martin martin 3.8K Mar=C2=A0 7 19:15 core-image-minim=
al.env<br>
39475732 -rw-r--r-- 2 martin martin 616K Mar=C2=A0 7 17:55 grub-efi-bootx64=
.efi<br>
31507074 -rwxr-xr-x 2 martin martin 103K Mar=C2=A0 6 22:02 linuxx64.efi.stu=
b<br>
39479261 -rw-r--r-- 2 martin martin 8.2M Mar=C2=A0 7 12:27 modules--6.1.14+=
git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110.tgz<br>
39479263 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A077 Mar=C2=A0 7 12:27 module=
s-qemux86-64.tgz -&gt; modules--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemu=
x86-64-20230307112110.tgz<br>
31507058 -rwxr-xr-x 2 martin martin 140K Mar=C2=A0 6 22:02 systemd-bootx64.=
efi<br>
27651415 -rw-r--r-- 2 martin martin=C2=A0 274 Mar=C2=A0 7 19:15 ubinize-cor=
e-image-minimal-qemux86-64.rootfs-20230307181456.cfg<br>
<br>
[YOCTO #12937]<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
Signed-off-by: Alexandre Belloni &lt;<a href=3D"mailto:alexandre.belloni@bo=
otlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>&gt;<br>
(cherry picked from commit 26d97acc71379ab6702fa54a23b6542a3f51779c)<br>
Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" targe=
t=3D"_blank">steve@sakoman.com</a>&gt;<br>
---<br>
=C2=A0.../image-artifact-names.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0meta/classes-recipe/image-live.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A01 -<br>
=C2=A0meta/classes-recipe/image.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A07 +-<br>
=C2=A0meta/classes-recipe/image_types.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
08 +++++++++---------<br>
=C2=A0meta/classes-recipe/image_types_wic.bbclass=C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +-<br>
=C2=A0.../rootfs-postcommands.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0meta/classes/cve-check.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0meta/lib/oeqa/selftest/cases/fitimage.py=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +<br>
=C2=A0.../images/<a href=3D"http://build-appliance-image_15.0.0.bb" rel=3D"=
noreferrer" target=3D"_blank">build-appliance-image_15.0.0.bb</a>=C2=A0 =C2=
=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A09 files changed, 68 insertions(+), 67 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/image-artifact-names.bbclass b/meta/classe=
s-recipe/image-artifact-names.bbclass<br>
index ac2376d59a..bc76ff0e16 100644<br>
--- a/meta/classes-recipe/image-artifact-names.bbclass<br>
+++ b/meta/classes-recipe/image-artifact-names.bbclass<br>
@@ -12,9 +12,10 @@ IMAGE_BASENAME ?=3D &quot;${PN}&quot;<br>
=C2=A0IMAGE_VERSION_SUFFIX ?=3D &quot;-${DATETIME}&quot;<br>
=C2=A0IMAGE_VERSION_SUFFIX[vardepsexclude] +=3D &quot;DATETIME SOURCE_DATE_=
EPOCH&quot;<br>
=C2=A0IMAGE_NAME ?=3D &quot;${IMAGE_LINK_NAME}${IMAGE_VERSION_SUFFIX}&quot;=
<br>
-IMAGE_LINK_NAME ?=3D &quot;${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}&quot;<=
br>
+IMAGE_LINK_NAME ?=3D &quot;${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE=
_NAME_SUFFIX}&quot;<br>
<br>
=C2=A0# This needs to stay in sync with IMAGE_LINK_NAME, but with INITRAMFS=
_IMAGE instead of IMAGE_BASENAME<br>
+# and without ${IMAGE_NAME_SUFFIX} which all initramfs images should set t=
o empty<br>
=C2=A0INITRAMFS_IMAGE_NAME ?=3D &quot;${@[&#39;${INITRAMFS_IMAGE}${IMAGE_MA=
CHINE_SUFFIX}&#39;, &#39;&#39;][d.getVar(&#39;INITRAMFS_IMAGE&#39;) =3D=3D =
&#39;&#39;]}&quot;<br>
<br>
=C2=A0# The default DEPLOY_DIR_IMAGE is ${MACHINE} directory:<br>
diff --git a/meta/classes-recipe/image-live.bbclass b/meta/classes-recipe/i=
mage-live.bbclass<br>
index 168774a464..95dd44a8c0 100644<br>
--- a/meta/classes-recipe/image-live.bbclass<br>
+++ b/meta/classes-recipe/image-live.bbclass<br>
@@ -260,6 +260,5 @@ python do_bootimg() {<br>
=C2=A0 =C2=A0 =C2=A0bb.build.exec_func(&#39;create_symlinks&#39;, d)<br>
=C2=A0}<br>
=C2=A0do_bootimg[subimages] =3D &quot;hddimg iso&quot;<br>
-do_bootimg[imgsuffix] =3D &quot;.&quot;<br>
<br>
=C2=A0addtask bootimg before do_image_complete after do_rootfs<br>
diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.=
bbclass<br>
index e0dfba4a42..21b220a28d 100644<br>
--- a/meta/classes-recipe/image.bbclass<br>
+++ b/meta/classes-recipe/image.bbclass<br>
@@ -480,14 +480,14 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if subimage not in subimages:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0subimages.append(subimage)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if type not in alltypes:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rm_tmp_images.add(localdata.expand(&quot;${IMAGE_NAME}${IMAGE_NA=
ME_SUFFIX}.${type}&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rm_tmp_images.add(localdata.expand(&quot;${IMAGE_NAME}.${type}&q=
uot;))<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for bt in basetypes[t]:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_conversion_cmds(bt)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0localdata.setVar(&#39;type&#39;, realt)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if t not in alltypes:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm_tmp_images.add(localdata.expa=
nd(&quot;${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm_tmp_images.add(localdata.expa=
nd(&quot;${IMAGE_NAME}.${type}&quot;))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subimages.append(realt)<br>
<br>
@@ -594,13 +594,12 @@ python create_symlinks() {<br>
=C2=A0 =C2=A0 =C2=A0manifest_name =3D d.getVar(&#39;IMAGE_MANIFEST&#39;)<br=
>
=C2=A0 =C2=A0 =C2=A0taskname =3D d.getVar(&quot;BB_CURRENTTASK&quot;)<br>
=C2=A0 =C2=A0 =C2=A0subimages =3D (d.getVarFlag(&quot;do_&quot; + taskname,=
 &#39;subimages&#39;, False) or &quot;&quot;).split()<br>
-=C2=A0 =C2=A0 imgsuffix =3D d.getVarFlag(&quot;do_&quot; + taskname, &#39;=
imgsuffix&#39;) or d.expand(&quot;${IMAGE_NAME_SUFFIX}.&quot;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0if not link_name:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
=C2=A0 =C2=A0 =C2=A0for type in subimages:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dst =3D os.path.join(deploy_dir, link_nam=
e + &quot;.&quot; + type)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 src =3D img_name + imgsuffix + type<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 src =3D img_name + &quot;.&quot; + type<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.exists(os.path.join(deploy_dir=
, src)):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(&quot;Creating syml=
ink: %s -&gt; %s&quot; % (dst, src))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.islink(dst):<br>
diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/=
image_types.bbclass<br>
index 023eb87537..fdee835e7c 100644<br>
--- a/meta/classes-recipe/image_types.bbclass<br>
+++ b/meta/classes-recipe/image_types.bbclass<br>
@@ -66,9 +66,9 @@ ZIP_COMPRESSION_LEVEL ?=3D &quot;-9&quot;<br>
=C2=A0ZSTD_COMPRESSION_LEVEL ?=3D &quot;-3&quot;<br>
<br>
=C2=A0JFFS2_SUM_EXTRA_ARGS ?=3D &quot;&quot;<br>
-IMAGE_CMD:jffs2 =3D &quot;mkfs.jffs2 --root=3D${IMAGE_ROOTFS} --faketime -=
-output=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.jffs2 ${EXTRA_I=
MAGECMD}&quot;<br>
+IMAGE_CMD:jffs2 =3D &quot;mkfs.jffs2 --root=3D${IMAGE_ROOTFS} --faketime -=
-output=3D${IMGDEPLOYDIR}/${IMAGE_NAME}.jffs2 ${EXTRA_IMAGECMD}&quot;<br>
<br>
-IMAGE_CMD:cramfs =3D &quot;mkfs.cramfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${I=
MAGE_NAME}${IMAGE_NAME_SUFFIX}.cramfs ${EXTRA_IMAGECMD}&quot;<br>
+IMAGE_CMD:cramfs =3D &quot;mkfs.cramfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${I=
MAGE_NAME}.cramfs ${EXTRA_IMAGECMD}&quot;<br>
<br>
=C2=A0oe_mkext234fs () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fstype=3D$1<br>
@@ -88,14 +88,14 @@ oe_mkext234fs () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eval COUNT=3D\&quot=
;$MIN_COUNT\&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Create a sparse image block<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bbdebug 1 Executing &quot;dd if=3D/dev/zero of=
=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=3D$ROOTFS=
_SIZE count=3D$COUNT bs=3D1024&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dd if=3D/dev/zero of=3D${IMGDEPLOYDIR}/${IMAGE_=
NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=3D$ROOTFS_SIZE count=3D$COUNT bs=3D1=
024<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bbdebug 1 Executing &quot;dd if=3D/dev/zero of=
=3D${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype seek=3D$ROOTFS_SIZE count=3D$COUNT=
 bs=3D1024&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dd if=3D/dev/zero of=3D${IMGDEPLOYDIR}/${IMAGE_=
NAME}.$fstype seek=3D$ROOTFS_SIZE count=3D$COUNT bs=3D1024<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbdebug 1 &quot;Actual Rootfs size:=C2=A0 `du -=
s ${IMAGE_ROOTFS}`&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bbdebug 1 &quot;Actual Partition size: `stat -c=
 &#39;%s&#39; ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype`&qu=
ot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bbdebug 1 Executing &quot;mkfs.$fstype -F $extr=
a_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d ${I=
MAGE_ROOTFS}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}=
/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d ${IMAGE_ROOTFS}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bbdebug 1 &quot;Actual Partition size: `stat -c=
 &#39;%s&#39; ${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype`&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bbdebug 1 Executing &quot;mkfs.$fstype -F $extr=
a_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype -d ${IMAGE_ROOTFS}&quot;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}=
/${IMAGE_NAME}.$fstype -d ${IMAGE_ROOTFS}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Error codes 0-3 indicate successfull operatio=
n of fsck (no errors or errors corrected)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fsck.$fstype -pvfD ${IMGDEPLOYDIR}/${IMAGE_NAME=
}${IMAGE_NAME_SUFFIX}.$fstype || [ $? -le 3 ]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fsck.$fstype -pvfD ${IMGDEPLOYDIR}/${IMAGE_NAME=
}.$fstype || [ $? -le 3 ]<br>
=C2=A0}<br>
<br>
=C2=A0IMAGE_CMD:ext2 =3D &quot;oe_mkext234fs ext2 ${EXTRA_IMAGECMD}&quot;<b=
r>
@@ -109,8 +109,8 @@ IMAGE_CMD:btrfs () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size=3D${MIN_BTRFS_=
SIZE}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbwarn &quot;Rootfs=
 size is too small for BTRFS. Filesystem will be extended to ${size}K&quot;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dd if=3D/dev/zero of=3D${IMGDEPLOYDIR}/${IMAGE_=
NAME}${IMAGE_NAME_SUFFIX}.btrfs seek=3D${size} count=3D0 bs=3D1024<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkfs.btrfs ${EXTRA_IMAGECMD} -r ${IMAGE_ROOTFS}=
 ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.btrfs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dd if=3D/dev/zero of=3D${IMGDEPLOYDIR}/${IMAGE_=
NAME}.btrfs seek=3D${size} count=3D0 bs=3D1024<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkfs.btrfs ${EXTRA_IMAGECMD} -r ${IMAGE_ROOTFS}=
 ${IMGDEPLOYDIR}/${IMAGE_NAME}.btrfs<br>
=C2=A0}<br>
<br>
=C2=A0oe_mksquashfs () {<br>
@@ -119,7 +119,7 @@ oe_mksquashfs () {<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Use the bitbake reproducible timestamp instead of the=
 hardcoded squashfs one<br>
=C2=A0 =C2=A0 =C2=A0export SOURCE_DATE_EPOCH=3D$(stat -c &#39;%Y&#39; ${IMA=
GE_ROOTFS})<br>
-=C2=A0 =C2=A0 mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IM=
AGE_NAME_SUFFIX}.squashfs${comp:+-}${suffix:-$comp} ${EXTRA_IMAGECMD} -noap=
pend ${comp:+-comp }$comp<br>
+=C2=A0 =C2=A0 mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}.squ=
ashfs${comp:+-}${suffix:-$comp} ${EXTRA_IMAGECMD} -noappend ${comp:+-comp }=
$comp<br>
=C2=A0}<br>
=C2=A0IMAGE_CMD:squashfs =3D &quot;oe_mksquashfs&quot;<br>
=C2=A0IMAGE_CMD:squashfs-xz =3D &quot;oe_mksquashfs xz&quot;<br>
@@ -127,18 +127,18 @@ IMAGE_CMD:squashfs-lzo =3D &quot;oe_mksquashfs lzo&qu=
ot;<br>
=C2=A0IMAGE_CMD:squashfs-lz4 =3D &quot;oe_mksquashfs lz4&quot;<br>
=C2=A0IMAGE_CMD:squashfs-zst =3D &quot;oe_mksquashfs zstd zst&quot;<br>
<br>
-IMAGE_CMD:erofs =3D &quot;mkfs.erofs ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${I=
MAGE_NAME}${IMAGE_NAME_SUFFIX}.erofs ${IMAGE_ROOTFS}&quot;<br>
-IMAGE_CMD:erofs-lz4 =3D &quot;mkfs.erofs -zlz4 ${EXTRA_IMAGECMD} ${IMGDEPL=
OYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.erofs-lz4 ${IMAGE_ROOTFS}&quot;<br=
>
-IMAGE_CMD:erofs-lz4hc =3D &quot;mkfs.erofs -zlz4hc ${EXTRA_IMAGECMD} ${IMG=
DEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.erofs-lz4hc ${IMAGE_ROOTFS}&qu=
ot;<br>
+IMAGE_CMD:erofs =3D &quot;mkfs.erofs ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${I=
MAGE_NAME}.erofs ${IMAGE_ROOTFS}&quot;<br>
+IMAGE_CMD:erofs-lz4 =3D &quot;mkfs.erofs -zlz4 ${EXTRA_IMAGECMD} ${IMGDEPL=
OYDIR}/${IMAGE_NAME}.erofs-lz4 ${IMAGE_ROOTFS}&quot;<br>
+IMAGE_CMD:erofs-lz4hc =3D &quot;mkfs.erofs -zlz4hc ${EXTRA_IMAGECMD} ${IMG=
DEPLOYDIR}/${IMAGE_NAME}.erofs-lz4hc ${IMAGE_ROOTFS}&quot;<br>
<br>
<br>
=C2=A0IMAGE_CMD_TAR ?=3D &quot;tar&quot;<br>
=C2=A0# ignore return code 1 &quot;file changed as we read it&quot; as othe=
r tasks(e.g. do_image_wic) may be hardlinking rootfs<br>
-IMAGE_CMD:tar =3D &quot;${IMAGE_CMD_TAR} --sort=3Dname --format=3Dposix --=
numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C =
${IMAGE_ROOTFS} . || [ $? -eq 1 ]&quot;<br>
+IMAGE_CMD:tar =3D &quot;${IMAGE_CMD_TAR} --sort=3Dname --format=3Dposix --=
numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}.tar -C ${IMAGE_ROOTFS} . ||=
 [ $? -eq 1 ]&quot;<br>
<br>
=C2=A0do_image_cpio[cleandirs] +=3D &quot;${WORKDIR}/cpio_append&quot;<br>
=C2=A0IMAGE_CMD:cpio () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ${IMAGE_ROOTFS} &amp;&amp; find . | sort | =
cpio --reproducible -o -H newc &gt;${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAM=
E_SUFFIX}.cpio)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ${IMAGE_ROOTFS} &amp;&amp; find . | sort | =
cpio --reproducible -o -H newc &gt;${IMGDEPLOYDIR}/${IMAGE_NAME}.cpio)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We only need the /init symlink if we&#39;re b=
uilding the real<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # image. The -dbg image doesn&#39;t need it! By=
 being clever<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # about this we also avoid &#39;touch&#39; belo=
w failing, as it<br>
@@ -152,7 +152,7 @@ IMAGE_CMD:cpio () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0touch -r ${IMAGE_ROOTFS} ${WOR=
KDIR}/cpio_append/init<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(cd=C2=A0 ${WORKDIR}/cpio_append &amp;&amp; echo ./init | cpio --=
reproducible -oA -H newc -F ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFI=
X}.cpio)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(cd=C2=A0 ${WORKDIR}/cpio_append &amp;&amp; echo ./init | cpio --=
reproducible -oA -H newc -F ${IMGDEPLOYDIR}/${IMAGE_NAME}.cpio)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
@@ -167,7 +167,7 @@ write_ubi_config() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &lt;&lt;EOF &gt; ubinize${vname}-${IMAGE_NA=
ME}.cfg<br>
=C2=A0[ubifs]<br>
=C2=A0mode=3Dubi<br>
-image=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.${UBI_IM=
GTYPE}<br>
+image=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}.${UBI_IMGTYPE}<br>
=C2=A0vol_id=3D0<br>
=C2=A0vol_type=3D${UBI_VOLTYPE}<br>
=C2=A0vol_name=3D${UBI_VOLNAME}<br>
@@ -192,9 +192,9 @@ multiubi_mkfs() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_ubi_config &quot;${vname}&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;$vname&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkfs.ubifs -r ${IMA=
GE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubi=
fs ${mkubifs_args}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkfs.ubifs -r ${IMA=
GE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}.ubifs ${mkubifs_args}<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ubinize -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname=
}${IMAGE_NAME_SUFFIX}.ubi ${ubinize_args} ubinize${vname}-${IMAGE_NAME}.cfg=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ubinize -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname=
}.ubi ${ubinize_args} ubinize${vname}-${IMAGE_NAME}.cfg<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Cleanup cfg file<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ubinize${vname}-${IMAGE_NAME}.cfg ${IMGDEPLO=
YDIR}/<br>
@@ -202,12 +202,12 @@ multiubi_mkfs() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Create own symlinks for &#39;named&#39; volum=
es<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;$vname&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${IMGDEPLOYDIR}<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e ${IMAGE_NAM=
E}${vname}${IMAGE_NAME_SUFFIX}.ubifs ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ln -sf ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e ${IMAGE_NAM=
E}${vname}.ubifs ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ln -sf ${IMAGE_NAME}${vname}.ubifs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ${IMAGE_LINK_NAME}${vname}.ubifs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e ${IMAGE_NAM=
E}${vname}${IMAGE_NAME_SUFFIX}.ubi ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ln -sf ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubi \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e ${IMAGE_NAM=
E}${vname}.ubi ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ln -sf ${IMAGE_NAME}${vname}.ubi \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ${IMAGE_LINK_NAME}${vname}.ubi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd -<br>
@@ -232,7 +232,7 @@ IMAGE_CMD:ubi () {<br>
=C2=A0}<br>
=C2=A0IMAGE_TYPEDEP:ubi =3D &quot;${UBI_IMGTYPE}&quot;<br>
<br>
-IMAGE_CMD:ubifs =3D &quot;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}=
/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ubifs ${MKUBIFS_ARGS}&quot;<br>
+IMAGE_CMD:ubifs =3D &quot;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}=
/${IMAGE_NAME}.ubifs ${MKUBIFS_ARGS}&quot;<br>
<br>
=C2=A0MIN_F2FS_SIZE ?=3D &quot;524288&quot;<br>
=C2=A0IMAGE_CMD:f2fs () {<br>
@@ -246,9 +246,9 @@ IMAGE_CMD:f2fs () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size=3D${MIN_F2FS_S=
IZE}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbwarn &quot;Rootfs=
 size is too small for F2FS. Filesystem will be extended to ${size}K&quot;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dd if=3D/dev/zero of=3D${IMGDEPLOYDIR}/${IMAGE_=
NAME}${IMAGE_NAME_SUFFIX}.f2fs seek=3D${size} count=3D0 bs=3D1024<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkfs.f2fs ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${I=
MAGE_NAME}${IMAGE_NAME_SUFFIX}.f2fs<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sload.f2fs -f ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/$=
{IMAGE_NAME}${IMAGE_NAME_SUFFIX}.f2fs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dd if=3D/dev/zero of=3D${IMGDEPLOYDIR}/${IMAGE_=
NAME}.f2fs seek=3D${size} count=3D0 bs=3D1024<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkfs.f2fs ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${I=
MAGE_NAME}.f2fs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sload.f2fs -f ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/$=
{IMAGE_NAME}.f2fs<br>
=C2=A0}<br>
<br>
=C2=A0EXTRA_IMAGECMD =3D &quot;&quot;<br>
@@ -314,32 +314,32 @@ IMAGE_TYPES:append:x86-64 =3D &quot; hddimg iso&quot;=
<br>
=C2=A0COMPRESSIONTYPES ?=3D &quot;&quot;<br>
<br>
=C2=A0CONVERSIONTYPES =3D &quot;gz bz2 lzma xz lz4 lzo zip 7zip zst sum md5=
sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vh=
dx vdi qcow2 base64 gzsync zsync ${COMPRESSIONTYPES}&quot;<br>
-CONVERSION_CMD:lzma =3D &quot;lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFF=
IX}.${type}&quot;<br>
-CONVERSION_CMD:gz =3D &quot;gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}${IM=
AGE_NAME_SUFFIX}.${type} &gt; ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz&=
quot;<br>
-CONVERSION_CMD:bz2 =3D &quot;pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX=
}.${type}&quot;<br>
-CONVERSION_CMD:xz =3D &quot;xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_DEFAU=
LTS} --check=3D${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${ty=
pe} &gt; ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz&quot;<br>
-CONVERSION_CMD:lz4 =3D &quot;lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX=
}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4&quot;<br>
-CONVERSION_CMD:lzo =3D &quot;lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${t=
ype}&quot;<br>
-CONVERSION_CMD:zip =3D &quot;zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${I=
MAGE_NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}&quo=
t;<br>
-CONVERSION_CMD:7zip =3D &quot;7za a -mx=3D${7ZIP_COMPRESSION_LEVEL} -mm=3D=
${7ZIP_COMPRESSION_METHOD} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.${7ZIP=
_EXTENSION} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}&quot;<br>
-CONVERSION_CMD:zst =3D &quot;zstd -f -k -T0 -c ${ZSTD_COMPRESSION_LEVEL} $=
{IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} &gt; ${IMAGE_NAME}${IMAGE_NAME_SUF=
FIX}.${type}.zst&quot;<br>
-CONVERSION_CMD:sum =3D &quot;sumtool -i ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.=
${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_EXTRA_=
ARGS}&quot;<br>
-CONVERSION_CMD:md5sum =3D &quot;md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$=
{type} &gt; ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.md5sum&quot;<br>
-CONVERSION_CMD:sha1sum =3D &quot;sha1sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}=
.${type} &gt; ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha1sum&quot;<br>
-CONVERSION_CMD:sha224sum =3D &quot;sha224sum ${IMAGE_NAME}${IMAGE_NAME_SUF=
FIX}.${type} &gt; ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha224sum&quot;=
<br>
-CONVERSION_CMD:sha256sum =3D &quot;sha256sum ${IMAGE_NAME}${IMAGE_NAME_SUF=
FIX}.${type} &gt; ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha256sum&quot;=
<br>
-CONVERSION_CMD:sha384sum =3D &quot;sha384sum ${IMAGE_NAME}${IMAGE_NAME_SUF=
FIX}.${type} &gt; ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha384sum&quot;=
<br>
-CONVERSION_CMD:sha512sum =3D &quot;sha512sum ${IMAGE_NAME}${IMAGE_NAME_SUF=
FIX}.${type} &gt; ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha512sum&quot;=
<br>
-CONVERSION_CMD:bmap =3D &quot;bmaptool create ${IMAGE_NAME}${IMAGE_NAME_SU=
FFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.bmap&quot;<br>
-CONVERSION_CMD:u-boot =3D &quot;mkimage -A ${UBOOT_ARCH} -O linux -T ramdi=
sk -C none -n ${IMAGE_NAME} -d ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${=
IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.u-boot&quot;<br>
-CONVERSION_CMD:vmdk =3D &quot;qemu-img convert -O vmdk ${IMAGE_NAME}${IMAG=
E_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vmdk&quot;=
<br>
-CONVERSION_CMD:vhdx =3D &quot;qemu-img convert -O vhdx -o subformat=3Ddyna=
mic ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUF=
FIX}.${type}.vhdx&quot;<br>
-CONVERSION_CMD:vhd =3D &quot;qemu-img convert -O vpc -o subformat=3Dfixed =
${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}=
.${type}.vhd&quot;<br>
-CONVERSION_CMD:vdi =3D &quot;qemu-img convert -O vdi ${IMAGE_NAME}${IMAGE_=
NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vdi&quot;<br=
>
-CONVERSION_CMD:qcow2 =3D &quot;qemu-img convert -O qcow2 ${IMAGE_NAME}${IM=
AGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.qcow2&qu=
ot;<br>
-CONVERSION_CMD:base64 =3D &quot;base64 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$=
{type} &gt; ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.base64&quot;<br>
-CONVERSION_CMD:zsync =3D &quot;zsyncmake_curl ${IMAGE_NAME}${IMAGE_NAME_SU=
FFIX}.${type}&quot;<br>
-CONVERSION_CMD:gzsync =3D &quot;zsyncmake_curl -z ${IMAGE_NAME}${IMAGE_NAM=
E_SUFFIX}.${type}&quot;<br>
+CONVERSION_CMD:lzma =3D &quot;lzma -k -f -7 ${IMAGE_NAME}.${type}&quot;<br=
>
+CONVERSION_CMD:gz =3D &quot;gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}.${t=
ype} &gt; ${IMAGE_NAME}.${type}.gz&quot;<br>
+CONVERSION_CMD:bz2 =3D &quot;pbzip2 -f -k ${IMAGE_NAME}.${type}&quot;<br>
+CONVERSION_CMD:xz =3D &quot;xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_DEFAU=
LTS} --check=3D${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.${type} &gt; ${IMAGE_NAM=
E}.${type}.xz&quot;<br>
+CONVERSION_CMD:lz4 =3D &quot;lz4 -9 -z -l ${IMAGE_NAME}.${type} ${IMAGE_NA=
ME}.${type}.lz4&quot;<br>
+CONVERSION_CMD:lzo =3D &quot;lzop -9 ${IMAGE_NAME}.${type}&quot;<br>
+CONVERSION_CMD:zip =3D &quot;zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}.${=
type}.zip ${IMAGE_NAME}.${type}&quot;<br>
+CONVERSION_CMD:7zip =3D &quot;7za a -mx=3D${7ZIP_COMPRESSION_LEVEL} -mm=3D=
${7ZIP_COMPRESSION_METHOD} ${IMAGE_NAME}.${type}.${7ZIP_EXTENSION} ${IMAGE_=
NAME}.${type}&quot;<br>
+CONVERSION_CMD:zst =3D &quot;zstd -f -k -T0 -c ${ZSTD_COMPRESSION_LEVEL} $=
{IMAGE_NAME}.${type} &gt; ${IMAGE_NAME}.${type}.zst&quot;<br>
+CONVERSION_CMD:sum =3D &quot;sumtool -i ${IMAGE_NAME}.${type} -o ${IMAGE_N=
AME}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}&quot;<br>
+CONVERSION_CMD:md5sum =3D &quot;md5sum ${IMAGE_NAME}.${type} &gt; ${IMAGE_=
NAME}.${type}.md5sum&quot;<br>
+CONVERSION_CMD:sha1sum =3D &quot;sha1sum ${IMAGE_NAME}.${type} &gt; ${IMAG=
E_NAME}.${type}.sha1sum&quot;<br>
+CONVERSION_CMD:sha224sum =3D &quot;sha224sum ${IMAGE_NAME}.${type} &gt; ${=
IMAGE_NAME}.${type}.sha224sum&quot;<br>
+CONVERSION_CMD:sha256sum =3D &quot;sha256sum ${IMAGE_NAME}.${type} &gt; ${=
IMAGE_NAME}.${type}.sha256sum&quot;<br>
+CONVERSION_CMD:sha384sum =3D &quot;sha384sum ${IMAGE_NAME}.${type} &gt; ${=
IMAGE_NAME}.${type}.sha384sum&quot;<br>
+CONVERSION_CMD:sha512sum =3D &quot;sha512sum ${IMAGE_NAME}.${type} &gt; ${=
IMAGE_NAME}.${type}.sha512sum&quot;<br>
+CONVERSION_CMD:bmap =3D &quot;bmaptool create ${IMAGE_NAME}.${type} -o ${I=
MAGE_NAME}.${type}.bmap&quot;<br>
+CONVERSION_CMD:u-boot =3D &quot;mkimage -A ${UBOOT_ARCH} -O linux -T ramdi=
sk -C none -n ${IMAGE_NAME} -d ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.=
u-boot&quot;<br>
+CONVERSION_CMD:vmdk =3D &quot;qemu-img convert -O vmdk ${IMAGE_NAME}.${typ=
e} ${IMAGE_NAME}.${type}.vmdk&quot;<br>
+CONVERSION_CMD:vhdx =3D &quot;qemu-img convert -O vhdx -o subformat=3Ddyna=
mic ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.vhdx&quot;<br>
+CONVERSION_CMD:vhd =3D &quot;qemu-img convert -O vpc -o subformat=3Dfixed =
${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.vhd&quot;<br>
+CONVERSION_CMD:vdi =3D &quot;qemu-img convert -O vdi ${IMAGE_NAME}.${type}=
 ${IMAGE_NAME}.${type}.vdi&quot;<br>
+CONVERSION_CMD:qcow2 =3D &quot;qemu-img convert -O qcow2 ${IMAGE_NAME}.${t=
ype} ${IMAGE_NAME}.${type}.qcow2&quot;<br>
+CONVERSION_CMD:base64 =3D &quot;base64 ${IMAGE_NAME}.${type} &gt; ${IMAGE_=
NAME}.${type}.base64&quot;<br>
+CONVERSION_CMD:zsync =3D &quot;zsyncmake_curl ${IMAGE_NAME}.${type}&quot;<=
br>
+CONVERSION_CMD:gzsync =3D &quot;zsyncmake_curl -z ${IMAGE_NAME}.${type}&qu=
ot;<br>
=C2=A0CONVERSION_DEPENDS_lzma =3D &quot;xz-native&quot;<br>
=C2=A0CONVERSION_DEPENDS_gz =3D &quot;pigz-native&quot;<br>
=C2=A0CONVERSION_DEPENDS_bz2 =3D &quot;pbzip2-native&quot;<br>
diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-rec=
ipe/image_types_wic.bbclass<br>
index c339b9bdfb..528a91bf5e 100644<br>
--- a/meta/classes-recipe/image_types_wic.bbclass<br>
+++ b/meta/classes-recipe/image_types_wic.bbclass<br>
@@ -71,7 +71,7 @@ IMAGE_CMD:wic () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbfatal &quot;No ki=
ckstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE =
or WKS_FILES appropriately.&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 BUILDDIR=3D&quot;${TOPDIR}&quot; PSEUDO_UNLOAD=
=3D1 wic create &quot;$wks&quot; --vars &quot;${STAGING_DIR}/${MACHINE}/img=
data/&quot; -e &quot;${IMAGE_BASENAME}&quot; -o &quot;$build_wic/&quot; -w =
&quot;$tmp_wic&quot; ${WIC_CREATE_EXTRA_ARGS}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mv &quot;$build_wic/$(basename &quot;${wks%.wks=
}&quot;)&quot;*.direct &quot;$out${IMAGE_NAME_SUFFIX}.wic&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mv &quot;$build_wic/$(basename &quot;${wks%.wks=
}&quot;)&quot;*.direct &quot;$out.wic&quot;<br>
=C2=A0}<br>
=C2=A0IMAGE_CMD:wic[vardepsexclude] =3D &quot;WKS_FULL_PATH WKS_FILES TOPDI=
R&quot;<br>
=C2=A0do_image_wic[cleandirs] =3D &quot;${WORKDIR}/build-wic&quot;<br>
diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes=
-recipe/rootfs-postcommands.bbclass<br>
index 7538c8b0b5..db90693dd0 100644<br>
--- a/meta/classes-recipe/rootfs-postcommands.bbclass<br>
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass<br>
@@ -37,7 +37,7 @@ APPEND:append =3D &#39;${@bb.utils.contains(&quot;IMAGE_F=
EATURES&quot;, &quot;read-only-rootfs&quot;, &quot; ro<br>
=C2=A0ROOTFS_POSTPROCESS_COMMAND +=3D &quot;write_image_test_data; &quot;<b=
r>
<br>
=C2=A0# Write manifest<br>
-IMAGE_MANIFEST =3D &quot;${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}=
.manifest&quot;<br>
+IMAGE_MANIFEST =3D &quot;${IMGDEPLOYDIR}/${IMAGE_NAME}.manifest&quot;<br>
=C2=A0ROOTFS_POSTUNINSTALL_COMMAND =3D+ &quot;write_image_manifest ; &quot;=
<br>
=C2=A0# Set default postinst log file<br>
=C2=A0POSTINST_LOGFILE ?=3D &quot;${localstatedir}/log/postinstall.log&quot=
;<br>
diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s<br>
index bd9e7e7445..f7abaf4f0c 100644<br>
--- a/meta/classes/cve-check.bbclass<br>
+++ b/meta/classes/cve-check.bbclass<br>
@@ -48,8 +48,8 @@ CVE_CHECK_LOG_JSON ?=3D &quot;${T}/cve.json&quot;<br>
=C2=A0CVE_CHECK_DIR ??=3D &quot;${DEPLOY_DIR}/cve&quot;<br>
=C2=A0CVE_CHECK_RECIPE_FILE ?=3D &quot;${CVE_CHECK_DIR}/${PN}&quot;<br>
=C2=A0CVE_CHECK_RECIPE_FILE_JSON ?=3D &quot;${CVE_CHECK_DIR}/${PN}_cve.json=
&quot;<br>
-CVE_CHECK_MANIFEST ?=3D &quot;${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SU=
FFIX}.cve&quot;<br>
-CVE_CHECK_MANIFEST_JSON ?=3D &quot;${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NA=
ME_SUFFIX}.json&quot;<br>
+CVE_CHECK_MANIFEST ?=3D &quot;${IMGDEPLOYDIR}/${IMAGE_NAME}.cve&quot;<br>
+CVE_CHECK_MANIFEST_JSON ?=3D &quot;${IMGDEPLOYDIR}/${IMAGE_NAME}.json&quot=
;<br>
=C2=A0CVE_CHECK_COPY_FILES ??=3D &quot;1&quot;<br>
=C2=A0CVE_CHECK_CREATE_MANIFEST ??=3D &quot;1&quot;<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selft=
est/cases/fitimage.py<br>
index 7bc171e02d..9383d0c4db 100644<br>
--- a/meta/lib/oeqa/selftest/cases/fitimage.py<br>
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py<br>
@@ -33,6 +33,8 @@ KERNEL_CLASSES =3D &quot; kernel-fitimage &quot;<br>
=C2=A0# RAM disk variables including load address and entrypoint for kernel=
 and RAM disk<br>
=C2=A0IMAGE_FSTYPES +=3D &quot;cpio.gz&quot;<br>
=C2=A0INITRAMFS_IMAGE =3D &quot;core-image-minimal&quot;<br>
+# core-image-minimal is used as initramfs here, drop the rootfs suffix<br>
+IMAGE_NAME_SUFFIX:pn-core-image-minimal =3D &quot;&quot;<br>
=C2=A0UBOOT_RD_LOADADDRESS =3D &quot;0x88000000&quot;<br>
=C2=A0UBOOT_RD_ENTRYPOINT =3D &quot;0x88000000&quot;<br>
=C2=A0UBOOT_LOADADDRESS =3D &quot;0x80080000&quot;<br>
diff --git a/meta/recipes-core/images/<a href=3D"http://build-appliance-ima=
ge_15.0.0.bb" rel=3D"noreferrer" target=3D"_blank">build-appliance-image_15=
.0.0.bb</a> b/meta/recipes-core/images/<a href=3D"http://build-appliance-im=
age_15.0.0.bb" rel=3D"noreferrer" target=3D"_blank">build-appliance-image_1=
5.0.0.bb</a><br>
index a5d42f26e2..1019e53993 100644<br>
--- a/meta/recipes-core/images/<a href=3D"http://build-appliance-image_15.0=
.0.bb" rel=3D"noreferrer" target=3D"_blank">build-appliance-image_15.0.0.bb=
</a><br>
+++ b/meta/recipes-core/images/<a href=3D"http://build-appliance-image_15.0=
.0.bb" rel=3D"noreferrer" target=3D"_blank">build-appliance-image_15.0.0.bb=
</a><br>
@@ -133,9 +133,9 @@ create_bundle_files () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${WORKDIR}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p Yocto_Build_Appliance<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp *.vmx* Yocto_Build_Appliance<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAM=
E_SUFFIX}.wic.vmdk Yocto_Build_Appliance/Yocto_Build_Appliance.vmdk<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAM=
E_SUFFIX}.wic.vhdx Yocto_Build_Appliance/Yocto_Build_Appliance.vhdx<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAM=
E_SUFFIX}.wic.vhd Yocto_Build_Appliance/Yocto_Build_Appliance.vhd<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}.wic.vmdk Y=
octo_Build_Appliance/Yocto_Build_Appliance.vmdk<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}.wic.vhdx Y=
octo_Build_Appliance/Yocto_Build_Appliance.vhdx<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}.wic.vhd Yo=
cto_Build_Appliance/Yocto_Build_Appliance.vhd<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 zip -r ${IMGDEPLOYDIR}/Yocto_Build_Appliance-${=
DATETIME}.zip Yocto_Build_Appliance<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf Yocto_Build_Appliance-${DATETIME}.zip ${=
IMGDEPLOYDIR}/Yocto_Build_Appliance.zip<br>
=C2=A0}<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#184308): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/184308" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/184308</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100151266/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100151266/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000031fe0e0600aabe5c--

