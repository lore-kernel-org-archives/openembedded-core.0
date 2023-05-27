Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8A8C77B7E
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 05:21:30 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.5542.1685164879178324180
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 22:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=QOb+SvkX;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f6dfc4e01fso15446405e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 22:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685164877; x=1687756877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U8UnSHet3bKo4VySFXEeD2Me3+d2EzICU0LnQONb1Tk=;
        b=QOb+SvkXR9zR2FW76dhZ6gjt5oMZWgmrmBIIuJ4fv4zvar2DJARLNnj402+tuyhhM6
         GES7s8GvrYISph5BYkRO/J9oOUGjR2QKuOO+H1Zl6tpEEZ0C/mSrbuYgtHrE1OZj+2V6
         k+d52ZRYiC9Ghct45wM8DxBEWg5MPKjxZQQn1FIld6twI+lBjJZyb+Qf6XT4+k85Aqba
         Cfj1lQFhEc0rgGIQGxKKGRg0lXhWqmgfZSehD/pTsTBGNswOrtFr8hW1Vp3TVjpm/1NX
         cvn6iekkT5/OtBzyyDunaNNvKBKOfzgTwraAoNF02+zlBeGEYgaYhULbL/6+YOOV8srQ
         f9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685164877; x=1687756877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U8UnSHet3bKo4VySFXEeD2Me3+d2EzICU0LnQONb1Tk=;
        b=fViGMXnZMGp+IeK8HOzs1GxAkOA3NpNi58AkVV8ROltZB80w8kewJJln0OlOkdWONB
         OpF6DLVr312JSR8PRGt42dAO+pWMRZtMgSsZlSvgWCT8l5zvuBSUS85LDmVDMvMG4Dcy
         YKgWSXC3kD+rTFKMPgUMh1A2mNzFBb6Pe1lFFFG0TcgVpnCdItsEqiBXs9FsEZlMvhVn
         kef5dFc0FQqiZyBq21Dqex+7zS84Xm5Qg9/kzypCCh6FeIHEqUeA0yNcYfSACtEmh+Tg
         MCAY90HIUmH/4KLUpdCDznwLHFABZzbx6HQm2RZOzarYgANX9Zpks3ENa49Woz1z0gCZ
         Pffg==
X-Gm-Message-State: AC+VfDxOkFslSV9XM5nABu4qWcFfczGyHYNwXDg2AoSH6GXlEv+x4tja
	2Bg4FaPtfd+fNn85LU8n0kXSb1J5CILRkC9OYfpRGqhCnxQ=
X-Google-Smtp-Source: ACHHUZ5obuLIOaPIPk9Yx2i/qR03V0C74IT7HJBeCdGp1E0wb/6y0WmTe+oRTxL0103cT1+u7j2znXBQ6NZd2lWVMbE=
X-Received: by 2002:adf:f150:0:b0:307:873d:2ea with SMTP id
 y16-20020adff150000000b00307873d02eamr3613838wro.47.1685164876903; Fri, 26
 May 2023 22:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230525102218.1613298-1-Martin.Jansa@gmail.com> <20230526180939464ac2f2@mail.local>
In-Reply-To: <20230526180939464ac2f2@mail.local>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 27 May 2023 07:21:05 +0200
Message-ID: <CA+chaQfAMp9O1+FhBtcO_x_t6iPo7PY8==9ECTPyVWvwSKAhTw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] image-artifact-names: include
 ${IMAGE_NAME_SUFFIX} directly in both ${IMAGE_NAME} and ${IMAGE_LINK_NAME}
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e03ac405fca6054c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 05:21:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181788

--000000000000e03ac405fca6054c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 8:09=E2=80=AFPM Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> Hello,
>
> The series causes oe-selftest failures:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5254/st=
eps/14/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/1468/s=
teps/14/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5225/st=
eps/14/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5175/st=
eps/14/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5217/st=
eps/14/logs/stdio


Hi,

I was able to reproduce it locally and it's caused by newer test (which
wasn't merged yet last time I've run selftest with these changes):
https://git.openembedded.org/openembedded-core/commit/?id=3D06af6795cf6f079=
362303bddb39a14459e228e72
which hardcodes the expected image name, I'll send fix for this shortly.

Cheers,


>
>
> 2023-05-25 17:24:13,622 - oe-selftest - INFO - FAIL:
> wic.Wic2.test_gpt_partition_name (subunit.RemotedTestCase)
> 2023-05-25 17:24:13,622 - oe-selftest - INFO -
> ----------------------------------------------------------------------
> 2023-05-25 17:24:13,623 - oe-selftest - INFO -
> testtools.testresult.real._StringException: Traceback (most recent call
> last):
>   File
> "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/self=
test/cases/wic.py",
> line 1362, in test_gpt_partition_name
>     self.assertTrue(os.path.exists(image_path))
>   File "/usr/lib64/python3.10/unittest/case.py", line 687, in assertTrue
>     raise self.failureException(msg)
> AssertionError: False is not true
>
> On 25/05/2023 12:22:17+0200, Martin Jansa wrote:
> > * ${IMAGE_NAME}${IMAGE_NAME_SUFFIX} is almost always used together
> already
> >   and when they aren't it's usually because of hardcoded '.rootfs' suff=
ix
> >
> > * it's a bit strange, because ${IMAGE_NAME_SUFFIX} is applied after the
> >   version from ${IMAGE_VERSION_SUFFIX}, if we move it to
> ${IMAGE_LINK_NAME}
> >   then it will be applied before the version and ${IMAGE_LINK_NAME}
> >   will be just the version-less symlink to latest built version.
> >
> > * it's not added to INITRAMFS_IMAGE_NAME as it assumes that all
> >   images used as initramfs will set IMAGE_NAME_SUFFIX to empty.
> >   Many already do as shown bellow, but you might need to extend
> >   this list in your layer.
> >
> > * this also allows to drop support for imgsuffix varflag, recipes which
> >   don't want to have .rootfs suffix can just set IMAGE_NAME_SUFFIX to
> >   empty and it will be consistently respected by both IMAGE_NAME and
> IMAGE_LINK_NAME
> >
> > * imgsuffix =3D d.getVarFlag("do_" + taskname, 'imgsuffix') or
> d.expand("${IMAGE_NAME_SUFFIX}.")
> >   is kind of terrible, notice trailing '.' after ${IMAGE_NAME_SUFFIX}
> >   while this dot was in imgsuffix in:
> >   do_bootimg[imgsuffix] =3D "."
> >
> >   but in both cases it's not really part of the imgsuffix, but the
> >   "extension" type separator as in dst variable:
> >
> >          dst =3D os.path.join(deploy_dir, link_name + "." + type)
> > -        src =3D img_name + imgsuffix + type
> > +        src =3D img_name + "." + type
> >
> > * for ubifs volumes move vname after IMAGE_NAME_SUFFIX
> >
> > * to better document these changes here is an example with default poky
> >   configuration with just:
> >   IMAGE_FSTYPES:append:pn-core-image-minimal =3D " live wic wic.vmdk ub=
i"
> >   MKUBIFS_ARGS =3D "-m 2048 -e 129024 -c 968 -x zlib"
> >   UBINIZE_ARGS =3D "-m 2048 -p 131072 -s 512"
> >   added in local.conf, so that deploy_dir has also some initramfs and
> more
> >   IMAGE_FSTYPES
> >
> > * "ls -lahi tmp/deploy/images/qemux86-64/"
> >   output after "bitbake core-image-minimal"
> >
> >   And deploy-dir is cleaned between runs with:
> >   bitbake -c clean core-image-minimal core-image-minimal-initramfs
> virtual/kernel grub-efi systemd-boot
> >
> >   The output confirms that the only change is ".rootfs" added not only
> >   in ext4 and manifest files, but also for hddimg, iso, qemuboot.conf
> >   testdata.json for both the actual artifacts as well as the symlinks
> >   while core-image-minimal-initramfs doesn't have them as
> IMAGE_NAME_SUFFIX
> >   was already set to empty there:
> > meta/classes-recipe/baremetal-image.bbclass:IMAGE_NAME_SUFFIX ?=3D ""
> > meta/recipes-core/images/core-image-minimal-initramfs.bb:IMAGE_NAME_SUF=
FIX
> ?=3D ""
> > meta/recipes-core/images/core-image-tiny-initramfs.bb:IMAGE_NAME_SUFFIX
> ?=3D ""
> > meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb:IMA=
GE_NAME_SUFFIX
> ?=3D ""
> > meta/recipes-extended/images/core-image-testcontroller-initramfs.bb:IMA=
GE_NAME_SUFFIX
> ?=3D ""
> >
> >   before these changes:
> > total 297M
> > 31269162 drwxr-xr-x 2 martin martin 4.0K Mar  7 19:19 .
> > 31263942 drwxr-xr-x 3 martin martin 4.0K Mar  7 12:53 ..
> > 35845703 lrwxrwxrwx 2 martin martin   77 Mar  7 12:27 bzImage ->
> bzImage--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110=
.bin
> > 35845704 -rw-r--r-- 2 martin martin  11M Mar  7 12:27
> bzImage--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110=
.bin
> > 35845702 lrwxrwxrwx 2 martin martin   77 Mar  7 12:27
> bzImage-qemux86-64.bin ->
> bzImage--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110=
.bin
> > 40236967 -rw-r--r-- 2 martin martin  13M Mar  7 19:19
> core-image-minimal-initramfs-qemux86-64-20230307181808.cpio.gz
> > 40203232 -rw-r--r-- 2 martin martin 1.1K Mar  7 19:19
> core-image-minimal-initramfs-qemux86-64-20230307181808.manifest
> > 40212700 -rw-r--r-- 2 martin martin 1.6K Mar  7 19:19
> core-image-minimal-initramfs-qemux86-64-20230307181808.qemuboot.conf
> > 40211556 -rw-r--r-- 2 martin martin 211K Mar  7 19:19
> core-image-minimal-initramfs-qemux86-64-20230307181808.testdata.json
> > 40236964 lrwxrwxrwx 2 martin martin   62 Mar  7 19:19
> core-image-minimal-initramfs-qemux86-64.cpio.gz ->
> core-image-minimal-initramfs-qemux86-64-20230307181808.cpio.gz
> > 40203235 lrwxrwxrwx 2 martin martin   63 Mar  7 19:19
> core-image-minimal-initramfs-qemux86-64.manifest ->
> core-image-minimal-initramfs-qemux86-64-20230307181808.manifest
> > 40212690 lrwxrwxrwx 2 martin martin   68 Mar  7 19:19
> core-image-minimal-initramfs-qemux86-64.qemuboot.conf ->
> core-image-minimal-initramfs-qemux86-64-20230307181808.qemuboot.conf
> > 40211560 lrwxrwxrwx 2 martin martin   68 Mar  7 19:19
> core-image-minimal-initramfs-qemux86-64.testdata.json ->
> core-image-minimal-initramfs-qemux86-64-20230307181808.testdata.json
> > 40237307 -rw-r--r-- 2 martin martin  57M Mar  7 19:19
> core-image-minimal-qemux86-64-20230307181808.hddimg
> > 40237329 -rw-r--r-- 2 martin martin  56M Mar  7 19:19
> core-image-minimal-qemux86-64-20230307181808.iso
> > 40220347 -rw-r--r-- 2 martin martin 1.6K Mar  7 19:19
> core-image-minimal-qemux86-64-20230307181808.qemuboot.conf
> > 40236942 -rw-r--r-- 2 martin martin  34M Mar  7 19:19
> core-image-minimal-qemux86-64-20230307181808.rootfs.ext4
> > 40211563 -rw-r--r-- 2 martin martin 1.2K Mar  7 19:19
> core-image-minimal-qemux86-64-20230307181808.rootfs.manifest
> > 40237206 -rw-r--r-- 2 martin martin  16M Mar  7 19:19
> core-image-minimal-qemux86-64-20230307181808.rootfs.tar.bz2
> > 40237216 -rw-r--r-- 2 martin martin  20M Mar  7 19:19
> core-image-minimal-qemux86-64-20230307181808.rootfs.ubi
> > 40224358 -rw-r--r-- 2 martin martin  19M Mar  7 19:19
> core-image-minimal-qemux86-64-20230307181808.rootfs.ubifs
> > 40360386 -rw-r--r-- 2 martin martin  73M Mar  7 19:19
> core-image-minimal-qemux86-64-20230307181808.rootfs.wic
> > 40237285 -rw-r--r-- 2 martin martin  35M Mar  7 19:19
> core-image-minimal-qemux86-64-20230307181808.rootfs.wic.vmdk
> > 40209866 -rw-r--r-- 2 martin martin 206K Mar  7 19:19
> core-image-minimal-qemux86-64-20230307181808.testdata.json
> > 40236946 lrwxrwxrwx 2 martin martin   56 Mar  7 19:19
> core-image-minimal-qemux86-64.ext4 ->
> core-image-minimal-qemux86-64-20230307181808.rootfs.ext4
> > 40237336 lrwxrwxrwx 2 martin martin   51 Mar  7 19:19
> core-image-minimal-qemux86-64.hddimg ->
> core-image-minimal-qemux86-64-20230307181808.hddimg
> > 40237337 lrwxrwxrwx 2 martin martin   48 Mar  7 19:19
> core-image-minimal-qemux86-64.iso ->
> core-image-minimal-qemux86-64-20230307181808.iso
> > 40211564 lrwxrwxrwx 2 martin martin   60 Mar  7 19:19
> core-image-minimal-qemux86-64.manifest ->
> core-image-minimal-qemux86-64-20230307181808.rootfs.manifest
> > 40220348 lrwxrwxrwx 2 martin martin   58 Mar  7 19:19
> core-image-minimal-qemux86-64.qemuboot.conf ->
> core-image-minimal-qemux86-64-20230307181808.qemuboot.conf
> > 40237205 lrwxrwxrwx 2 martin martin   59 Mar  7 19:19
> core-image-minimal-qemux86-64.tar.bz2 ->
> core-image-minimal-qemux86-64-20230307181808.rootfs.tar.bz2
> > 40209873 lrwxrwxrwx 2 martin martin   58 Mar  7 19:19
> core-image-minimal-qemux86-64.testdata.json ->
> core-image-minimal-qemux86-64-20230307181808.testdata.json
> > 40237217 lrwxrwxrwx 2 martin martin   55 Mar  7 19:19
> core-image-minimal-qemux86-64.ubi ->
> core-image-minimal-qemux86-64-20230307181808.rootfs.ubi
> > 40236771 lrwxrwxrwx 2 martin martin   57 Mar  7 19:19
> core-image-minimal-qemux86-64.ubifs ->
> core-image-minimal-qemux86-64-20230307181808.rootfs.ubifs
> > 40237287 lrwxrwxrwx 2 martin martin   55 Mar  7 19:19
> core-image-minimal-qemux86-64.wic ->
> core-image-minimal-qemux86-64-20230307181808.rootfs.wic
> > 40237286 lrwxrwxrwx 2 martin martin   60 Mar  7 19:19
> core-image-minimal-qemux86-64.wic.vmdk ->
> core-image-minimal-qemux86-64-20230307181808.rootfs.wic.vmdk
> > 40237192 -rw-r--r-- 2 martin martin 3.8K Mar  7 19:19
> core-image-minimal.env
> > 34458377 -rw-r--r-- 2 martin martin 616K Mar  7 17:55
> grub-efi-bootx64.efi
> > 34963606 -rwxr-xr-x 2 martin martin 103K Mar  6 22:02 linuxx64.efi.stub
> > 35845662 -rw-r--r-- 2 martin martin 8.2M Mar  7 12:27
> modules--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110=
.tgz
> > 35845701 lrwxrwxrwx 2 martin martin   77 Mar  7 12:27
> modules-qemux86-64.tgz ->
> modules--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110=
.tgz
> > 34963605 -rwxr-xr-x 2 martin martin 140K Mar  6 22:02 systemd-bootx64.e=
fi
> > 27651415 -rw-r--r-- 2 martin martin  274 Mar  7 19:19
> ubinize-core-image-minimal-qemux86-64-20230307181808.cfg
> >
> >   after these changes:
> > total 297M
> > 31269162 drwxr-xr-x 2 martin martin 4.0K Mar  7 19:16 .
> > 31263942 drwxr-xr-x 3 martin martin 4.0K Mar  7 12:53 ..
> > 39479266 lrwxrwxrwx 2 martin martin   77 Mar  7 12:27 bzImage ->
> bzImage--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110=
.bin
> > 39479267 -rw-r--r-- 2 martin martin  11M Mar  7 12:27
> bzImage--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110=
.bin
> > 39479264 lrwxrwxrwx 2 martin martin   77 Mar  7 12:27
> bzImage-qemux86-64.bin ->
> bzImage--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110=
.bin
> > 39648810 -rw-r--r-- 2 martin martin  13M Mar  7 19:15
> core-image-minimal-initramfs-qemux86-64-20230307181456.cpio.gz
> > 39638400 -rw-r--r-- 2 martin martin 1.1K Mar  7 19:15
> core-image-minimal-initramfs-qemux86-64-20230307181456.manifest
> > 39644650 -rw-r--r-- 2 martin martin 1.6K Mar  7 19:15
> core-image-minimal-initramfs-qemux86-64-20230307181456.qemuboot.conf
> > 39637657 -rw-r--r-- 2 martin martin 211K Mar  7 19:15
> core-image-minimal-initramfs-qemux86-64-20230307181456.testdata.json
> > 39648091 lrwxrwxrwx 2 martin martin   62 Mar  7 19:15
> core-image-minimal-initramfs-qemux86-64.cpio.gz ->
> core-image-minimal-initramfs-qemux86-64-20230307181456.cpio.gz
> > 39638401 lrwxrwxrwx 2 martin martin   63 Mar  7 19:15
> core-image-minimal-initramfs-qemux86-64.manifest ->
> core-image-minimal-initramfs-qemux86-64-20230307181456.manifest
> > 39644651 lrwxrwxrwx 2 martin martin   68 Mar  7 19:15
> core-image-minimal-initramfs-qemux86-64.qemuboot.conf ->
> core-image-minimal-initramfs-qemux86-64-20230307181456.qemuboot.conf
> > 39637662 lrwxrwxrwx 2 martin martin   68 Mar  7 19:15
> core-image-minimal-initramfs-qemux86-64.testdata.json ->
> core-image-minimal-initramfs-qemux86-64-20230307181456.testdata.json
> > 39654281 -rw-r--r-- 2 martin martin  34M Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs-20230307181456.ext4
> > 39656710 -rw-r--r-- 2 martin martin  57M Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs-20230307181456.hddimg
> > 39657112 -rw-r--r-- 2 martin martin  56M Mar  7 19:16
> core-image-minimal-qemux86-64.rootfs-20230307181456.iso
> > 39645313 -rw-r--r-- 2 martin martin 1.2K Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs-20230307181456.manifest
> > 39646013 -rw-r--r-- 2 martin martin 1.6K Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs-20230307181456.qemuboot.conf
> > 39656336 -rw-r--r-- 2 martin martin  16M Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs-20230307181456.tar.bz2
> > 39644408 -rw-r--r-- 2 martin martin 206K Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs-20230307181456.testdata.json
> > 39656583 -rw-r--r-- 2 martin martin  20M Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs-20230307181456.ubi
> > 39654124 -rw-r--r-- 2 martin martin  19M Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs-20230307181456.ubifs
> > 39802371 -rw-r--r-- 2 martin martin  73M Mar  7 19:16
> core-image-minimal-qemux86-64.rootfs-20230307181456.wic
> > 39657113 -rw-r--r-- 2 martin martin  35M Mar  7 19:16
> core-image-minimal-qemux86-64.rootfs-20230307181456.wic.vmdk
> > 39654412 lrwxrwxrwx 2 martin martin   56 Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs.ext4 ->
> core-image-minimal-qemux86-64.rootfs-20230307181456.ext4
> > 39657167 lrwxrwxrwx 2 martin martin   58 Mar  7 19:16
> core-image-minimal-qemux86-64.rootfs.hddimg ->
> core-image-minimal-qemux86-64.rootfs-20230307181456.hddimg
> > 39657168 lrwxrwxrwx 2 martin martin   55 Mar  7 19:16
> core-image-minimal-qemux86-64.rootfs.iso ->
> core-image-minimal-qemux86-64.rootfs-20230307181456.iso
> > 39645316 lrwxrwxrwx 2 martin martin   60 Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs.manifest ->
> core-image-minimal-qemux86-64.rootfs-20230307181456.manifest
> > 39646014 lrwxrwxrwx 2 martin martin   65 Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs.qemuboot.conf ->
> core-image-minimal-qemux86-64.rootfs-20230307181456.qemuboot.conf
> > 39656315 lrwxrwxrwx 2 martin martin   59 Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs.tar.bz2 ->
> core-image-minimal-qemux86-64.rootfs-20230307181456.tar.bz2
> > 39644406 lrwxrwxrwx 2 martin martin   65 Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs.testdata.json ->
> core-image-minimal-qemux86-64.rootfs-20230307181456.testdata.json
> > 39656584 lrwxrwxrwx 2 martin martin   55 Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs.ubi ->
> core-image-minimal-qemux86-64.rootfs-20230307181456.ubi
> > 39654775 lrwxrwxrwx 2 martin martin   57 Mar  7 19:15
> core-image-minimal-qemux86-64.rootfs.ubifs ->
> core-image-minimal-qemux86-64.rootfs-20230307181456.ubifs
> > 39657126 lrwxrwxrwx 2 martin martin   55 Mar  7 19:16
> core-image-minimal-qemux86-64.rootfs.wic ->
> core-image-minimal-qemux86-64.rootfs-20230307181456.wic
> > 39657088 lrwxrwxrwx 2 martin martin   60 Mar  7 19:16
> core-image-minimal-qemux86-64.rootfs.wic.vmdk ->
> core-image-minimal-qemux86-64.rootfs-20230307181456.wic.vmdk
> > 39654418 -rw-r--r-- 2 martin martin 3.8K Mar  7 19:15
> core-image-minimal.env
> > 39475732 -rw-r--r-- 2 martin martin 616K Mar  7 17:55
> grub-efi-bootx64.efi
> > 31507074 -rwxr-xr-x 2 martin martin 103K Mar  6 22:02 linuxx64.efi.stub
> > 39479261 -rw-r--r-- 2 martin martin 8.2M Mar  7 12:27
> modules--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110=
.tgz
> > 39479263 lrwxrwxrwx 2 martin martin   77 Mar  7 12:27
> modules-qemux86-64.tgz ->
> modules--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110=
.tgz
> > 31507058 -rwxr-xr-x 2 martin martin 140K Mar  6 22:02 systemd-bootx64.e=
fi
> > 27651415 -rw-r--r-- 2 martin martin  274 Mar  7 19:15
> ubinize-core-image-minimal-qemux86-64.rootfs-20230307181456.cfg
> >
> > [YOCTO #12937]
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  .../image-artifact-names.bbclass              |   3 +-
> >  meta/classes-recipe/image-live.bbclass        |   1 -
> >  meta/classes-recipe/image.bbclass             |   7 +-
> >  meta/classes-recipe/image_types.bbclass       | 108 +++++++++---------
> >  meta/classes-recipe/image_types_wic.bbclass   |   2 +-
> >  .../rootfs-postcommands.bbclass               |   2 +-
> >  meta/classes/cve-check.bbclass                |   4 +-
> >  meta/lib/oeqa/selftest/cases/fitimage.py      |   2 +
> >  .../images/build-appliance-image_15.0.0.bb    |   6 +-
> >  9 files changed, 68 insertions(+), 67 deletions(-)
> >
> > diff --git a/meta/classes-recipe/image-artifact-names.bbclass
> b/meta/classes-recipe/image-artifact-names.bbclass
> > index ac2376d59a..bc76ff0e16 100644
> > --- a/meta/classes-recipe/image-artifact-names.bbclass
> > +++ b/meta/classes-recipe/image-artifact-names.bbclass
> > @@ -12,9 +12,10 @@ IMAGE_BASENAME ?=3D "${PN}"
> >  IMAGE_VERSION_SUFFIX ?=3D "-${DATETIME}"
> >  IMAGE_VERSION_SUFFIX[vardepsexclude] +=3D "DATETIME SOURCE_DATE_EPOCH"
> >  IMAGE_NAME ?=3D "${IMAGE_LINK_NAME}${IMAGE_VERSION_SUFFIX}"
> > -IMAGE_LINK_NAME ?=3D "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}"
> > +IMAGE_LINK_NAME ?=3D
> "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_NAME_SUFFIX}"
> >
> >  # This needs to stay in sync with IMAGE_LINK_NAME, but with
> INITRAMFS_IMAGE instead of IMAGE_BASENAME
> > +# and without ${IMAGE_NAME_SUFFIX} which all initramfs images should
> set to empty
> >  INITRAMFS_IMAGE_NAME ?=3D
> "${@['${INITRAMFS_IMAGE}${IMAGE_MACHINE_SUFFIX}',
> ''][d.getVar('INITRAMFS_IMAGE') =3D=3D '']}"
> >
> >  # The default DEPLOY_DIR_IMAGE is ${MACHINE} directory:
> > diff --git a/meta/classes-recipe/image-live.bbclass
> b/meta/classes-recipe/image-live.bbclass
> > index 168774a464..95dd44a8c0 100644
> > --- a/meta/classes-recipe/image-live.bbclass
> > +++ b/meta/classes-recipe/image-live.bbclass
> > @@ -260,6 +260,5 @@ python do_bootimg() {
> >      bb.build.exec_func('create_symlinks', d)
> >  }
> >  do_bootimg[subimages] =3D "hddimg iso"
> > -do_bootimg[imgsuffix] =3D "."
> >
> >  addtask bootimg before do_image_complete after do_rootfs
> > diff --git a/meta/classes-recipe/image.bbclass
> b/meta/classes-recipe/image.bbclass
> > index e0dfba4a42..21b220a28d 100644
> > --- a/meta/classes-recipe/image.bbclass
> > +++ b/meta/classes-recipe/image.bbclass
> > @@ -480,14 +480,14 @@ python () {
> >                      if subimage not in subimages:
> >                          subimages.append(subimage)
> >                      if type not in alltypes:
> > -
> rm_tmp_images.add(localdata.expand("${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${t=
ype}"))
> > +
> rm_tmp_images.add(localdata.expand("${IMAGE_NAME}.${type}"))
> >
> >          for bt in basetypes[t]:
> >              gen_conversion_cmds(bt)
> >
> >          localdata.setVar('type', realt)
> >          if t not in alltypes:
> > -
> rm_tmp_images.add(localdata.expand("${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${t=
ype}"))
> > +            rm_tmp_images.add(localdata.expand("${IMAGE_NAME}.${type}"=
))
> >          else:
> >              subimages.append(realt)
> >
> > @@ -594,13 +594,12 @@ python create_symlinks() {
> >      manifest_name =3D d.getVar('IMAGE_MANIFEST')
> >      taskname =3D d.getVar("BB_CURRENTTASK")
> >      subimages =3D (d.getVarFlag("do_" + taskname, 'subimages', False) =
or
> "").split()
> > -    imgsuffix =3D d.getVarFlag("do_" + taskname, 'imgsuffix') or
> d.expand("${IMAGE_NAME_SUFFIX}.")
> >
> >      if not link_name:
> >          return
> >      for type in subimages:
> >          dst =3D os.path.join(deploy_dir, link_name + "." + type)
> > -        src =3D img_name + imgsuffix + type
> > +        src =3D img_name + "." + type
> >          if os.path.exists(os.path.join(deploy_dir, src)):
> >              bb.note("Creating symlink: %s -> %s" % (dst, src))
> >              if os.path.islink(dst):
> > diff --git a/meta/classes-recipe/image_types.bbclass
> b/meta/classes-recipe/image_types.bbclass
> > index bbddfaf272..16e9aef40e 100644
> > --- a/meta/classes-recipe/image_types.bbclass
> > +++ b/meta/classes-recipe/image_types.bbclass
> > @@ -66,9 +66,9 @@ ZIP_COMPRESSION_LEVEL ?=3D "-9"
> >  ZSTD_COMPRESSION_LEVEL ?=3D "-3"
> >
> >  JFFS2_SUM_EXTRA_ARGS ?=3D ""
> > -IMAGE_CMD:jffs2 =3D "mkfs.jffs2 --root=3D${IMAGE_ROOTFS} --faketime
> --output=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.jffs2
> ${EXTRA_IMAGECMD}"
> > +IMAGE_CMD:jffs2 =3D "mkfs.jffs2 --root=3D${IMAGE_ROOTFS} --faketime
> --output=3D${IMGDEPLOYDIR}/${IMAGE_NAME}.jffs2 ${EXTRA_IMAGECMD}"
> >
> > -IMAGE_CMD:cramfs =3D "mkfs.cramfs ${IMAGE_ROOTFS}
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cramfs ${EXTRA_IMAGECMD=
}"
> > +IMAGE_CMD:cramfs =3D "mkfs.cramfs ${IMAGE_ROOTFS}
> ${IMGDEPLOYDIR}/${IMAGE_NAME}.cramfs ${EXTRA_IMAGECMD}"
> >
> >  oe_mkext234fs () {
> >       fstype=3D$1
> > @@ -88,14 +88,14 @@ oe_mkext234fs () {
> >               eval COUNT=3D\"$MIN_COUNT\"
> >       fi
> >       # Create a sparse image block
> > -     bbdebug 1 Executing "dd if=3D/dev/zero
> of=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype
> seek=3D$ROOTFS_SIZE count=3D$COUNT bs=3D1024"
> > -     dd if=3D/dev/zero
> of=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype
> seek=3D$ROOTFS_SIZE count=3D$COUNT bs=3D1024
> > +     bbdebug 1 Executing "dd if=3D/dev/zero
> of=3D${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype seek=3D$ROOTFS_SIZE count=3D$C=
OUNT
> bs=3D1024"
> > +     dd if=3D/dev/zero of=3D${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype
> seek=3D$ROOTFS_SIZE count=3D$COUNT bs=3D1024
> >       bbdebug 1 "Actual Rootfs size:  `du -s ${IMAGE_ROOTFS}`"
> > -     bbdebug 1 "Actual Partition size: `stat -c '%s'
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype`"
> > -     bbdebug 1 Executing "mkfs.$fstype -F $extra_imagecmd
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d
> ${IMAGE_ROOTFS}"
> > -     mkfs.$fstype -F $extra_imagecmd
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d ${IMAGE_ROOT=
FS}
> > +     bbdebug 1 "Actual Partition size: `stat -c '%s'
> ${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype`"
> > +     bbdebug 1 Executing "mkfs.$fstype -F $extra_imagecmd
> ${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype -d ${IMAGE_ROOTFS}"
> > +     mkfs.$fstype -F $extra_imagecmd
> ${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype -d ${IMAGE_ROOTFS}
> >       # Error codes 0-3 indicate successfull operation of fsck (no
> errors or errors corrected)
> > -     fsck.$fstype -pvfD
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype || [ $? -le 3 ]
> > +     fsck.$fstype -pvfD ${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype || [ $?
> -le 3 ]
> >  }
> >
> >  IMAGE_CMD:ext2 =3D "oe_mkext234fs ext2 ${EXTRA_IMAGECMD}"
> > @@ -109,8 +109,8 @@ IMAGE_CMD:btrfs () {
> >               size=3D${MIN_BTRFS_SIZE}
> >               bbwarn "Rootfs size is too small for BTRFS. Filesystem
> will be extended to ${size}K"
> >       fi
> > -     dd if=3D/dev/zero
> of=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.btrfs seek=3D${siz=
e}
> count=3D0 bs=3D1024
> > -     mkfs.btrfs ${EXTRA_IMAGECMD} -r ${IMAGE_ROOTFS}
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.btrfs
> > +     dd if=3D/dev/zero of=3D${IMGDEPLOYDIR}/${IMAGE_NAME}.btrfs
> seek=3D${size} count=3D0 bs=3D1024
> > +     mkfs.btrfs ${EXTRA_IMAGECMD} -r ${IMAGE_ROOTFS}
> ${IMGDEPLOYDIR}/${IMAGE_NAME}.btrfs
> >  }
> >
> >  oe_mksquashfs () {
> > @@ -119,7 +119,7 @@ oe_mksquashfs () {
> >
> >      # Use the bitbake reproducible timestamp instead of the hardcoded
> squashfs one
> >      export SOURCE_DATE_EPOCH=3D$(stat -c '%Y' ${IMAGE_ROOTFS})
> > -    mksquashfs ${IMAGE_ROOTFS}
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs${comp:+-}${suf=
fix:-$comp}
> ${EXTRA_IMAGECMD} -noappend ${comp:+-comp }$comp
> > +    mksquashfs ${IMAGE_ROOTFS}
> ${IMGDEPLOYDIR}/${IMAGE_NAME}.squashfs${comp:+-}${suffix:-$comp}
> ${EXTRA_IMAGECMD} -noappend ${comp:+-comp }$comp
> >  }
> >  IMAGE_CMD:squashfs =3D "oe_mksquashfs"
> >  IMAGE_CMD:squashfs-xz =3D "oe_mksquashfs xz"
> > @@ -127,18 +127,18 @@ IMAGE_CMD:squashfs-lzo =3D "oe_mksquashfs lzo"
> >  IMAGE_CMD:squashfs-lz4 =3D "oe_mksquashfs lz4"
> >  IMAGE_CMD:squashfs-zst =3D "oe_mksquashfs zstd zst"
> >
> > -IMAGE_CMD:erofs =3D "mkfs.erofs ${EXTRA_IMAGECMD}
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.erofs ${IMAGE_ROOTFS}"
> > -IMAGE_CMD:erofs-lz4 =3D "mkfs.erofs -zlz4 ${EXTRA_IMAGECMD}
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.erofs-lz4 ${IMAGE_ROOTF=
S}"
> > -IMAGE_CMD:erofs-lz4hc =3D "mkfs.erofs -zlz4hc ${EXTRA_IMAGECMD}
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.erofs-lz4hc
> ${IMAGE_ROOTFS}"
> > +IMAGE_CMD:erofs =3D "mkfs.erofs ${EXTRA_IMAGECMD}
> ${IMGDEPLOYDIR}/${IMAGE_NAME}.erofs ${IMAGE_ROOTFS}"
> > +IMAGE_CMD:erofs-lz4 =3D "mkfs.erofs -zlz4 ${EXTRA_IMAGECMD}
> ${IMGDEPLOYDIR}/${IMAGE_NAME}.erofs-lz4 ${IMAGE_ROOTFS}"
> > +IMAGE_CMD:erofs-lz4hc =3D "mkfs.erofs -zlz4hc ${EXTRA_IMAGECMD}
> ${IMGDEPLOYDIR}/${IMAGE_NAME}.erofs-lz4hc ${IMAGE_ROOTFS}"
> >
> >
> >  IMAGE_CMD_TAR ?=3D "tar"
> >  # ignore return code 1 "file changed as we read it" as other tasks(e.g=
.
> do_image_wic) may be hardlinking rootfs
> > -IMAGE_CMD:tar =3D "${IMAGE_CMD_TAR} --sort=3Dname --format=3Dposix
> --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar
> -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
> > +IMAGE_CMD:tar =3D "${IMAGE_CMD_TAR} --sort=3Dname --format=3Dposix
> --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}.tar -C ${IMAGE_ROOTFS} =
.
> || [ $? -eq 1 ]"
> >
> >  do_image_cpio[cleandirs] +=3D "${WORKDIR}/cpio_append"
> >  IMAGE_CMD:cpio () {
> > -     (cd ${IMAGE_ROOTFS} && find . | sort | cpio --reproducible -o -H
> newc >${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
> > +     (cd ${IMAGE_ROOTFS} && find . | sort | cpio --reproducible -o -H
> newc >${IMGDEPLOYDIR}/${IMAGE_NAME}.cpio)
> >       # We only need the /init symlink if we're building the real
> >       # image. The -dbg image doesn't need it! By being clever
> >       # about this we also avoid 'touch' below failing, as it
> > @@ -151,7 +151,7 @@ IMAGE_CMD:cpio () {
> >                       else
> >                               touch ${WORKDIR}/cpio_append/init
> >                       fi
> > -                     (cd  ${WORKDIR}/cpio_append && echo ./init | cpio
> -oA -H newc -F ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
> > +                     (cd  ${WORKDIR}/cpio_append && echo ./init | cpio
> -oA -H newc -F ${IMGDEPLOYDIR}/${IMAGE_NAME}.cpio)
> >               fi
> >       fi
> >  }
> > @@ -166,7 +166,7 @@ write_ubi_config() {
> >       cat <<EOF > ubinize${vname}-${IMAGE_NAME}.cfg
> >  [ubifs]
> >  mode=3Dubi
> >
> -image=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.${UBI_=
IMGTYPE}
> > +image=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}.${UBI_IMGTYPE}
> >  vol_id=3D0
> >  vol_type=3D${UBI_VOLTYPE}
> >  vol_name=3D${UBI_VOLNAME}
> > @@ -191,9 +191,9 @@ multiubi_mkfs() {
> >       write_ubi_config "${vname}"
> >
> >       if [ -n "$vname" ]; then
> > -             mkfs.ubifs -r ${IMAGE_ROOTFS} -o
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs
> ${mkubifs_args}
> > +             mkfs.ubifs -r ${IMAGE_ROOTFS} -o
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}.ubifs ${mkubifs_args}
> >       fi
> > -     ubinize -o
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubi
> ${ubinize_args} ubinize${vname}-${IMAGE_NAME}.cfg
> > +     ubinize -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}.ubi
> ${ubinize_args} ubinize${vname}-${IMAGE_NAME}.cfg
> >
> >       # Cleanup cfg file
> >       mv ubinize${vname}-${IMAGE_NAME}.cfg ${IMGDEPLOYDIR}/
> > @@ -201,12 +201,12 @@ multiubi_mkfs() {
> >       # Create own symlinks for 'named' volumes
> >       if [ -n "$vname" ]; then
> >               cd ${IMGDEPLOYDIR}
> > -             if [ -e ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs ]=
;
> then
> > -                     ln -sf
> ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs \
> > +             if [ -e ${IMAGE_NAME}${vname}.ubifs ]; then
> > +                     ln -sf ${IMAGE_NAME}${vname}.ubifs \
> >                       ${IMAGE_LINK_NAME}${vname}.ubifs
> >               fi
> > -             if [ -e ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubi ];
> then
> > -                     ln -sf
> ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubi \
> > +             if [ -e ${IMAGE_NAME}${vname}.ubi ]; then
> > +                     ln -sf ${IMAGE_NAME}${vname}.ubi \
> >                       ${IMAGE_LINK_NAME}${vname}.ubi
> >               fi
> >               cd -
> > @@ -231,7 +231,7 @@ IMAGE_CMD:ubi () {
> >  }
> >  IMAGE_TYPEDEP:ubi =3D "${UBI_IMGTYPE}"
> >
> > -IMAGE_CMD:ubifs =3D "mkfs.ubifs -r ${IMAGE_ROOTFS} -o
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ubifs ${MKUBIFS_ARGS}"
> > +IMAGE_CMD:ubifs =3D "mkfs.ubifs -r ${IMAGE_ROOTFS} -o
> ${IMGDEPLOYDIR}/${IMAGE_NAME}.ubifs ${MKUBIFS_ARGS}"
> >
> >  MIN_F2FS_SIZE ?=3D "524288"
> >  IMAGE_CMD:f2fs () {
> > @@ -245,9 +245,9 @@ IMAGE_CMD:f2fs () {
> >               size=3D${MIN_F2FS_SIZE}
> >               bbwarn "Rootfs size is too small for F2FS. Filesystem wil=
l
> be extended to ${size}K"
> >       fi
> > -     dd if=3D/dev/zero
> of=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.f2fs seek=3D${size=
}
> count=3D0 bs=3D1024
> > -     mkfs.f2fs ${EXTRA_IMAGECMD}
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.f2fs
> > -     sload.f2fs -f ${IMAGE_ROOTFS}
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.f2fs
> > +     dd if=3D/dev/zero of=3D${IMGDEPLOYDIR}/${IMAGE_NAME}.f2fs seek=3D=
${size}
> count=3D0 bs=3D1024
> > +     mkfs.f2fs ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${IMAGE_NAME}.f2fs
> > +     sload.f2fs -f ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}.f2fs
> >  }
> >
> >  EXTRA_IMAGECMD =3D ""
> > @@ -313,32 +313,32 @@ IMAGE_TYPES:append:x86-64 =3D " hddimg iso"
> >  COMPRESSIONTYPES ?=3D ""
> >
> >  CONVERSIONTYPES =3D "gz bz2 lzma xz lz4 lzo zip 7zip zst sum md5sum
> sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx
> vdi qcow2 base64 gzsync zsync ${COMPRESSIONTYPES}"
> > -CONVERSION_CMD:lzma =3D "lzma -k -f -7
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> > -CONVERSION_CMD:gz =3D "gzip -f -9 -n -c --rsyncable
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
> > -CONVERSION_CMD:bz2 =3D "pbzip2 -f -k
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> > -CONVERSION_CMD:xz =3D "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_DEFAUL=
TS}
> --check=3D${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}=
 >
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
> > -CONVERSION_CMD:lz4 =3D "lz4 -9 -z -l
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
> > -CONVERSION_CMD:lzo =3D "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${ty=
pe}"
> > -CONVERSION_CMD:zip =3D "zip ${ZIP_COMPRESSION_LEVEL}
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zip
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> > -CONVERSION_CMD:7zip =3D "7za a -mx=3D${7ZIP_COMPRESSION_LEVEL}
> -mm=3D${7ZIP_COMPRESSION_METHOD}
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.${7ZIP_EXTENSION}
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> > -CONVERSION_CMD:zst =3D "zstd -f -k -T0 -c ${ZSTD_COMPRESSION_LEVEL}
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zst"
> > -CONVERSION_CMD:sum =3D "sumtool -i
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
> > -CONVERSION_CMD:md5sum =3D "md5sum
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.md5sum"
> > -CONVERSION_CMD:sha1sum =3D "sha1sum
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha1sum"
> > -CONVERSION_CMD:sha224sum =3D "sha224sum
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha224sum"
> > -CONVERSION_CMD:sha256sum =3D "sha256sum
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha256sum"
> > -CONVERSION_CMD:sha384sum =3D "sha384sum
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha384sum"
> > -CONVERSION_CMD:sha512sum =3D "sha512sum
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha512sum"
> > -CONVERSION_CMD:bmap =3D "bmaptool create
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.bmap"
> > -CONVERSION_CMD:u-boot =3D "mkimage -A ${UBOOT_ARCH} -O linux -T ramdis=
k
> -C none -n ${IMAGE_NAME} -d ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.u-boot"
> > -CONVERSION_CMD:vmdk =3D "qemu-img convert -O vmdk
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vmdk"
> > -CONVERSION_CMD:vhdx =3D "qemu-img convert -O vhdx -o subformat=3Ddynam=
ic
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vhdx"
> > -CONVERSION_CMD:vhd =3D "qemu-img convert -O vpc -o subformat=3Dfixed
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vhd"
> > -CONVERSION_CMD:vdi =3D "qemu-img convert -O vdi
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vdi"
> > -CONVERSION_CMD:qcow2 =3D "qemu-img convert -O qcow2
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.qcow2"
> > -CONVERSION_CMD:base64 =3D "base64
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.base64"
> > -CONVERSION_CMD:zsync =3D "zsyncmake_curl
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> > -CONVERSION_CMD:gzsync =3D "zsyncmake_curl -z
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> > +CONVERSION_CMD:lzma =3D "lzma -k -f -7 ${IMAGE_NAME}.${type}"
> > +CONVERSION_CMD:gz =3D "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}.${ty=
pe}
> > ${IMAGE_NAME}.${type}.gz"
> > +CONVERSION_CMD:bz2 =3D "pbzip2 -f -k ${IMAGE_NAME}.${type}"
> > +CONVERSION_CMD:xz =3D "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_DEFAUL=
TS}
> --check=3D${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.${type} >
> ${IMAGE_NAME}.${type}.xz"
> > +CONVERSION_CMD:lz4 =3D "lz4 -9 -z -l ${IMAGE_NAME}.${type}
> ${IMAGE_NAME}.${type}.lz4"
> > +CONVERSION_CMD:lzo =3D "lzop -9 ${IMAGE_NAME}.${type}"
> > +CONVERSION_CMD:zip =3D "zip ${ZIP_COMPRESSION_LEVEL}
> ${IMAGE_NAME}.${type}.zip ${IMAGE_NAME}.${type}"
> > +CONVERSION_CMD:7zip =3D "7za a -mx=3D${7ZIP_COMPRESSION_LEVEL}
> -mm=3D${7ZIP_COMPRESSION_METHOD} ${IMAGE_NAME}.${type}.${7ZIP_EXTENSION}
> ${IMAGE_NAME}.${type}"
> > +CONVERSION_CMD:zst =3D "zstd -f -k -T0 -c ${ZSTD_COMPRESSION_LEVEL}
> ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.zst"
> > +CONVERSION_CMD:sum =3D "sumtool -i ${IMAGE_NAME}.${type} -o
> ${IMAGE_NAME}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
> > +CONVERSION_CMD:md5sum =3D "md5sum ${IMAGE_NAME}.${type} >
> ${IMAGE_NAME}.${type}.md5sum"
> > +CONVERSION_CMD:sha1sum =3D "sha1sum ${IMAGE_NAME}.${type} >
> ${IMAGE_NAME}.${type}.sha1sum"
> > +CONVERSION_CMD:sha224sum =3D "sha224sum ${IMAGE_NAME}.${type} >
> ${IMAGE_NAME}.${type}.sha224sum"
> > +CONVERSION_CMD:sha256sum =3D "sha256sum ${IMAGE_NAME}.${type} >
> ${IMAGE_NAME}.${type}.sha256sum"
> > +CONVERSION_CMD:sha384sum =3D "sha384sum ${IMAGE_NAME}.${type} >
> ${IMAGE_NAME}.${type}.sha384sum"
> > +CONVERSION_CMD:sha512sum =3D "sha512sum ${IMAGE_NAME}.${type} >
> ${IMAGE_NAME}.${type}.sha512sum"
> > +CONVERSION_CMD:bmap =3D "bmaptool create ${IMAGE_NAME}.${type} -o
> ${IMAGE_NAME}.${type}.bmap"
> > +CONVERSION_CMD:u-boot =3D "mkimage -A ${UBOOT_ARCH} -O linux -T ramdis=
k
> -C none -n ${IMAGE_NAME} -d ${IMAGE_NAME}.${type}
> ${IMAGE_NAME}.${type}.u-boot"
> > +CONVERSION_CMD:vmdk =3D "qemu-img convert -O vmdk ${IMAGE_NAME}.${type=
}
> ${IMAGE_NAME}.${type}.vmdk"
> > +CONVERSION_CMD:vhdx =3D "qemu-img convert -O vhdx -o subformat=3Ddynam=
ic
> ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.vhdx"
> > +CONVERSION_CMD:vhd =3D "qemu-img convert -O vpc -o subformat=3Dfixed
> ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.vhd"
> > +CONVERSION_CMD:vdi =3D "qemu-img convert -O vdi ${IMAGE_NAME}.${type}
> ${IMAGE_NAME}.${type}.vdi"
> > +CONVERSION_CMD:qcow2 =3D "qemu-img convert -O qcow2 ${IMAGE_NAME}.${ty=
pe}
> ${IMAGE_NAME}.${type}.qcow2"
> > +CONVERSION_CMD:base64 =3D "base64 ${IMAGE_NAME}.${type} >
> ${IMAGE_NAME}.${type}.base64"
> > +CONVERSION_CMD:zsync =3D "zsyncmake_curl ${IMAGE_NAME}.${type}"
> > +CONVERSION_CMD:gzsync =3D "zsyncmake_curl -z ${IMAGE_NAME}.${type}"
> >  CONVERSION_DEPENDS_lzma =3D "xz-native"
> >  CONVERSION_DEPENDS_gz =3D "pigz-native"
> >  CONVERSION_DEPENDS_bz2 =3D "pbzip2-native"
> > diff --git a/meta/classes-recipe/image_types_wic.bbclass
> b/meta/classes-recipe/image_types_wic.bbclass
> > index be31fbf94f..669606da75 100644
> > --- a/meta/classes-recipe/image_types_wic.bbclass
> > +++ b/meta/classes-recipe/image_types_wic.bbclass
> > @@ -71,7 +71,7 @@ IMAGE_CMD:wic () {
> >               bbfatal "No kickstart files from WKS_FILES were found:
> ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
> >       fi
> >       BUILDDIR=3D"${TOPDIR}" PSEUDO_UNLOAD=3D1 wic create "$wks" --vars
> "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o
> "$build_wic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
> > -     mv "$build_wic/$(basename "${wks%.wks}")"*.direct
> "$out${IMAGE_NAME_SUFFIX}.wic"
> > +     mv "$build_wic/$(basename "${wks%.wks}")"*.direct "$out.wic"
> >  }
> >  IMAGE_CMD:wic[vardepsexclude] =3D "WKS_FULL_PATH WKS_FILES TOPDIR"
> >  do_image_wic[cleandirs] =3D "${WORKDIR}/build-wic"
> > diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass
> b/meta/classes-recipe/rootfs-postcommands.bbclass
> > index 690fa976aa..efc7c9562c 100644
> > --- a/meta/classes-recipe/rootfs-postcommands.bbclass
> > +++ b/meta/classes-recipe/rootfs-postcommands.bbclass
> > @@ -37,7 +37,7 @@ APPEND:append =3D
> '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", " ro
> >  ROOTFS_POSTPROCESS_COMMAND +=3D "write_image_test_data; "
> >
> >  # Write manifest
> > -IMAGE_MANIFEST =3D
> "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.manifest"
> > +IMAGE_MANIFEST =3D "${IMGDEPLOYDIR}/${IMAGE_NAME}.manifest"
> >  ROOTFS_POSTUNINSTALL_COMMAND =3D+ "write_image_manifest ; "
> >  # Set default postinst log file
> >  POSTINST_LOGFILE ?=3D "${localstatedir}/log/postinstall.log"
> > diff --git a/meta/classes/cve-check.bbclass
> b/meta/classes/cve-check.bbclass
> > index bd9e7e7445..f7abaf4f0c 100644
> > --- a/meta/classes/cve-check.bbclass
> > +++ b/meta/classes/cve-check.bbclass
> > @@ -48,8 +48,8 @@ CVE_CHECK_LOG_JSON ?=3D "${T}/cve.json"
> >  CVE_CHECK_DIR ??=3D "${DEPLOY_DIR}/cve"
> >  CVE_CHECK_RECIPE_FILE ?=3D "${CVE_CHECK_DIR}/${PN}"
> >  CVE_CHECK_RECIPE_FILE_JSON ?=3D "${CVE_CHECK_DIR}/${PN}_cve.json"
> > -CVE_CHECK_MANIFEST ?=3D
> "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cve"
> > -CVE_CHECK_MANIFEST_JSON ?=3D
> "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.json"
> > +CVE_CHECK_MANIFEST ?=3D "${IMGDEPLOYDIR}/${IMAGE_NAME}.cve"
> > +CVE_CHECK_MANIFEST_JSON ?=3D "${IMGDEPLOYDIR}/${IMAGE_NAME}.json"
> >  CVE_CHECK_COPY_FILES ??=3D "1"
> >  CVE_CHECK_CREATE_MANIFEST ??=3D "1"
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py
> b/meta/lib/oeqa/selftest/cases/fitimage.py
> > index 7bc171e02d..9383d0c4db 100644
> > --- a/meta/lib/oeqa/selftest/cases/fitimage.py
> > +++ b/meta/lib/oeqa/selftest/cases/fitimage.py
> > @@ -33,6 +33,8 @@ KERNEL_CLASSES =3D " kernel-fitimage "
> >  # RAM disk variables including load address and entrypoint for kernel
> and RAM disk
> >  IMAGE_FSTYPES +=3D "cpio.gz"
> >  INITRAMFS_IMAGE =3D "core-image-minimal"
> > +# core-image-minimal is used as initramfs here, drop the rootfs suffix
> > +IMAGE_NAME_SUFFIX:pn-core-image-minimal =3D ""
> >  UBOOT_RD_LOADADDRESS =3D "0x88000000"
> >  UBOOT_RD_ENTRYPOINT =3D "0x88000000"
> >  UBOOT_LOADADDRESS =3D "0x80080000"
> > diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> > index c68a57e1db..06605507c3 100644
> > --- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> > +++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> > @@ -133,9 +133,9 @@ create_bundle_files () {
> >       cd ${WORKDIR}
> >       mkdir -p Yocto_Build_Appliance
> >       cp *.vmx* Yocto_Build_Appliance
> > -     ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.wic.vmdk
> Yocto_Build_Appliance/Yocto_Build_Appliance.vmdk
> > -     ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.wic.vhdx
> Yocto_Build_Appliance/Yocto_Build_Appliance.vhdx
> > -     ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.wic.vhd
> Yocto_Build_Appliance/Yocto_Build_Appliance.vhd
> > +     ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}.wic.vmdk
> Yocto_Build_Appliance/Yocto_Build_Appliance.vmdk
> > +     ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}.wic.vhdx
> Yocto_Build_Appliance/Yocto_Build_Appliance.vhdx
> > +     ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}.wic.vhd
> Yocto_Build_Appliance/Yocto_Build_Appliance.vhd
> >       zip -r ${IMGDEPLOYDIR}/Yocto_Build_Appliance-${DATETIME}.zip
> Yocto_Build_Appliance
> >       ln -sf Yocto_Build_Appliance-${DATETIME}.zip
> ${IMGDEPLOYDIR}/Yocto_Build_Appliance.zip
> >  }
> > --
> > 2.40.1
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#181708):
> https://lists.openembedded.org/g/openembedded-core/message/181708
> > Mute This Topic: https://lists.openembedded.org/mt/99127017/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--000000000000e03ac405fca6054c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, May 26, 2023 at 8:09=E2=80=AFPM A=
lexandre Belloni &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com">alexa=
ndre.belloni@bootlin.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
The series causes oe-selftest failures:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/87/build=
s/5254/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5254/steps/14/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/127/buil=
ds/1468/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/127/builds/1468/steps/14/log=
s/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/79/build=
s/5225/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5225/steps/14/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/80/build=
s/5175/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5175/steps/14/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/86/build=
s/5217/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5217/steps/14/logs/=
stdio</a></blockquote><div><br></div><div>Hi,</div><div><br></div><div>I wa=
s able to reproduce it locally and it&#39;s caused by newer test (which was=
n&#39;t merged yet last time I&#39;ve run selftest with these changes):</di=
v><div><a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=
=3D06af6795cf6f079362303bddb39a14459e228e72">https://git.openembedded.org/o=
penembedded-core/commit/?id=3D06af6795cf6f079362303bddb39a14459e228e72</a><=
/div><div>which hardcodes the expected image name, I&#39;ll send fix for th=
is shortly.</div><div><br></div><div>Cheers,</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><br>
<br>
2023-05-25 17:24:13,622 - oe-selftest - INFO - FAIL: wic.Wic2.test_gpt_part=
ition_name (subunit.RemotedTestCase)<br>
2023-05-25 17:24:13,622 - oe-selftest - INFO - ----------------------------=
------------------------------------------<br>
2023-05-25 17:24:13,623 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):<br>
=C2=A0 File &quot;/home/pokybuild/yocto-worker/oe-selftest-fedora/build/met=
a/lib/oeqa/selftest/cases/wic.py&quot;, line 1362, in test_gpt_partition_na=
me<br>
=C2=A0 =C2=A0 self.assertTrue(os.path.exists(image_path))<br>
=C2=A0 File &quot;/usr/lib64/python3.10/unittest/case.py&quot;, line 687, i=
n assertTrue<br>
=C2=A0 =C2=A0 raise self.failureException(msg)<br>
AssertionError: False is not true<br>
<br>
On 25/05/2023 12:22:17+0200, Martin Jansa wrote:<br>
&gt; * ${IMAGE_NAME}${IMAGE_NAME_SUFFIX} is almost always used together alr=
eady<br>
&gt;=C2=A0 =C2=A0and when they aren&#39;t it&#39;s usually because of hardc=
oded &#39;.rootfs&#39; suffix<br>
&gt; <br>
&gt; * it&#39;s a bit strange, because ${IMAGE_NAME_SUFFIX} is applied afte=
r the<br>
&gt;=C2=A0 =C2=A0version from ${IMAGE_VERSION_SUFFIX}, if we move it to ${I=
MAGE_LINK_NAME}<br>
&gt;=C2=A0 =C2=A0then it will be applied before the version and ${IMAGE_LIN=
K_NAME}<br>
&gt;=C2=A0 =C2=A0will be just the version-less symlink to latest built vers=
ion.<br>
&gt; <br>
&gt; * it&#39;s not added to INITRAMFS_IMAGE_NAME as it assumes that all<br=
>
&gt;=C2=A0 =C2=A0images used as initramfs will set IMAGE_NAME_SUFFIX to emp=
ty.<br>
&gt;=C2=A0 =C2=A0Many already do as shown bellow, but you might need to ext=
end<br>
&gt;=C2=A0 =C2=A0this list in your layer.<br>
&gt; <br>
&gt; * this also allows to drop support for imgsuffix varflag, recipes whic=
h<br>
&gt;=C2=A0 =C2=A0don&#39;t want to have .rootfs suffix can just set IMAGE_N=
AME_SUFFIX to<br>
&gt;=C2=A0 =C2=A0empty and it will be consistently respected by both IMAGE_=
NAME and IMAGE_LINK_NAME<br>
&gt; <br>
&gt; * imgsuffix =3D d.getVarFlag(&quot;do_&quot; + taskname, &#39;imgsuffi=
x&#39;) or d.expand(&quot;${IMAGE_NAME_SUFFIX}.&quot;)<br>
&gt;=C2=A0 =C2=A0is kind of terrible, notice trailing &#39;.&#39; after ${I=
MAGE_NAME_SUFFIX}<br>
&gt;=C2=A0 =C2=A0while this dot was in imgsuffix in:<br>
&gt;=C2=A0 =C2=A0do_bootimg[imgsuffix] =3D &quot;.&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0but in both cases it&#39;s not really part of the imgsuffi=
x, but the<br>
&gt;=C2=A0 =C2=A0&quot;extension&quot; type separator as in dst variable:<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst =3D os.path.join(deploy_dir, lin=
k_name + &quot;.&quot; + type)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 src =3D img_name + imgsuffix + type<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 src =3D img_name + &quot;.&quot; + type<b=
r>
&gt; <br>
&gt; * for ubifs volumes move vname after IMAGE_NAME_SUFFIX<br>
&gt; <br>
&gt; * to better document these changes here is an example with default pok=
y<br>
&gt;=C2=A0 =C2=A0configuration with just:<br>
&gt;=C2=A0 =C2=A0IMAGE_FSTYPES:append:pn-core-image-minimal =3D &quot; live=
 wic wic.vmdk ubi&quot;<br>
&gt;=C2=A0 =C2=A0MKUBIFS_ARGS =3D &quot;-m 2048 -e 129024 -c 968 -x zlib&qu=
ot;<br>
&gt;=C2=A0 =C2=A0UBINIZE_ARGS =3D &quot;-m 2048 -p 131072 -s 512&quot;<br>
&gt;=C2=A0 =C2=A0added in local.conf, so that deploy_dir has also some init=
ramfs and more<br>
&gt;=C2=A0 =C2=A0IMAGE_FSTYPES<br>
&gt; <br>
&gt; * &quot;ls -lahi tmp/deploy/images/qemux86-64/&quot;<br>
&gt;=C2=A0 =C2=A0output after &quot;bitbake core-image-minimal&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0And deploy-dir is cleaned between runs with:<br>
&gt;=C2=A0 =C2=A0bitbake -c clean core-image-minimal core-image-minimal-ini=
tramfs virtual/kernel grub-efi systemd-boot<br>
&gt; <br>
&gt;=C2=A0 =C2=A0The output confirms that the only change is &quot;.rootfs&=
quot; added not only<br>
&gt;=C2=A0 =C2=A0in ext4 and manifest files, but also for hddimg, iso, qemu=
boot.conf<br>
&gt;=C2=A0 =C2=A0testdata.json for both the actual artifacts as well as the=
 symlinks<br>
&gt;=C2=A0 =C2=A0while core-image-minimal-initramfs doesn&#39;t have them a=
s IMAGE_NAME_SUFFIX<br>
&gt;=C2=A0 =C2=A0was already set to empty there:<br>
&gt; meta/classes-recipe/baremetal-image.bbclass:IMAGE_NAME_SUFFIX ?=3D &qu=
ot;&quot;<br>
&gt; meta/recipes-core/images/core-image-minimal-initramfs.bb:IMAGE_NAME_SU=
FFIX ?=3D &quot;&quot;<br>
&gt; meta/recipes-core/images/core-image-tiny-initramfs.bb:IMAGE_NAME_SUFFI=
X ?=3D &quot;&quot;<br>
&gt; meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb:IM=
AGE_NAME_SUFFIX ?=3D &quot;&quot;<br>
&gt; meta/recipes-extended/images/core-image-testcontroller-initramfs.bb:IM=
AGE_NAME_SUFFIX ?=3D &quot;&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0before these changes:<br>
&gt; total 297M<br>
&gt; 31269162 drwxr-xr-x 2 martin martin 4.0K Mar=C2=A0 7 19:19 .<br>
&gt; 31263942 drwxr-xr-x 3 martin martin 4.0K Mar=C2=A0 7 12:53 ..<br>
&gt; 35845703 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A077 Mar=C2=A0 7 12:27 b=
zImage -&gt; bzImage--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-202=
30307112110.bin<br>
&gt; 35845704 -rw-r--r-- 2 martin martin=C2=A0 11M Mar=C2=A0 7 12:27 bzImag=
e--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110.bin<br>
&gt; 35845702 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A077 Mar=C2=A0 7 12:27 b=
zImage-qemux86-64.bin -&gt; bzImage--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0=
-qemux86-64-20230307112110.bin<br>
&gt; 40236967 -rw-r--r-- 2 martin martin=C2=A0 13M Mar=C2=A0 7 19:19 core-i=
mage-minimal-initramfs-qemux86-64-20230307181808.cpio.gz<br>
&gt; 40203232 -rw-r--r-- 2 martin martin 1.1K Mar=C2=A0 7 19:19 core-image-=
minimal-initramfs-qemux86-64-20230307181808.manifest<br>
&gt; 40212700 -rw-r--r-- 2 martin martin 1.6K Mar=C2=A0 7 19:19 core-image-=
minimal-initramfs-qemux86-64-20230307181808.qemuboot.conf<br>
&gt; 40211556 -rw-r--r-- 2 martin martin 211K Mar=C2=A0 7 19:19 core-image-=
minimal-initramfs-qemux86-64-20230307181808.testdata.json<br>
&gt; 40236964 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A062 Mar=C2=A0 7 19:19 c=
ore-image-minimal-initramfs-qemux86-64.cpio.gz -&gt; core-image-minimal-ini=
tramfs-qemux86-64-20230307181808.cpio.gz<br>
&gt; 40203235 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A063 Mar=C2=A0 7 19:19 c=
ore-image-minimal-initramfs-qemux86-64.manifest -&gt; core-image-minimal-in=
itramfs-qemux86-64-20230307181808.manifest<br>
&gt; 40212690 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A068 Mar=C2=A0 7 19:19 c=
ore-image-minimal-initramfs-qemux86-64.qemuboot.conf -&gt; core-image-minim=
al-initramfs-qemux86-64-20230307181808.qemuboot.conf<br>
&gt; 40211560 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A068 Mar=C2=A0 7 19:19 c=
ore-image-minimal-initramfs-qemux86-64.testdata.json -&gt; core-image-minim=
al-initramfs-qemux86-64-20230307181808.testdata.json<br>
&gt; 40237307 -rw-r--r-- 2 martin martin=C2=A0 57M Mar=C2=A0 7 19:19 core-i=
mage-minimal-qemux86-64-20230307181808.hddimg<br>
&gt; 40237329 -rw-r--r-- 2 martin martin=C2=A0 56M Mar=C2=A0 7 19:19 core-i=
mage-minimal-qemux86-64-20230307181808.iso<br>
&gt; 40220347 -rw-r--r-- 2 martin martin 1.6K Mar=C2=A0 7 19:19 core-image-=
minimal-qemux86-64-20230307181808.qemuboot.conf<br>
&gt; 40236942 -rw-r--r-- 2 martin martin=C2=A0 34M Mar=C2=A0 7 19:19 core-i=
mage-minimal-qemux86-64-20230307181808.rootfs.ext4<br>
&gt; 40211563 -rw-r--r-- 2 martin martin 1.2K Mar=C2=A0 7 19:19 core-image-=
minimal-qemux86-64-20230307181808.rootfs.manifest<br>
&gt; 40237206 -rw-r--r-- 2 martin martin=C2=A0 16M Mar=C2=A0 7 19:19 core-i=
mage-minimal-qemux86-64-20230307181808.rootfs.tar.bz2<br>
&gt; 40237216 -rw-r--r-- 2 martin martin=C2=A0 20M Mar=C2=A0 7 19:19 core-i=
mage-minimal-qemux86-64-20230307181808.rootfs.ubi<br>
&gt; 40224358 -rw-r--r-- 2 martin martin=C2=A0 19M Mar=C2=A0 7 19:19 core-i=
mage-minimal-qemux86-64-20230307181808.rootfs.ubifs<br>
&gt; 40360386 -rw-r--r-- 2 martin martin=C2=A0 73M Mar=C2=A0 7 19:19 core-i=
mage-minimal-qemux86-64-20230307181808.rootfs.wic<br>
&gt; 40237285 -rw-r--r-- 2 martin martin=C2=A0 35M Mar=C2=A0 7 19:19 core-i=
mage-minimal-qemux86-64-20230307181808.rootfs.wic.vmdk<br>
&gt; 40209866 -rw-r--r-- 2 martin martin 206K Mar=C2=A0 7 19:19 core-image-=
minimal-qemux86-64-20230307181808.testdata.json<br>
&gt; 40236946 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A056 Mar=C2=A0 7 19:19 c=
ore-image-minimal-qemux86-64.ext4 -&gt; core-image-minimal-qemux86-64-20230=
307181808.rootfs.ext4<br>
&gt; 40237336 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A051 Mar=C2=A0 7 19:19 c=
ore-image-minimal-qemux86-64.hddimg -&gt; core-image-minimal-qemux86-64-202=
30307181808.hddimg<br>
&gt; 40237337 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A048 Mar=C2=A0 7 19:19 c=
ore-image-minimal-qemux86-64.iso -&gt; core-image-minimal-qemux86-64-202303=
07181808.iso<br>
&gt; 40211564 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A060 Mar=C2=A0 7 19:19 c=
ore-image-minimal-qemux86-64.manifest -&gt; core-image-minimal-qemux86-64-2=
0230307181808.rootfs.manifest<br>
&gt; 40220348 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A058 Mar=C2=A0 7 19:19 c=
ore-image-minimal-qemux86-64.qemuboot.conf -&gt; core-image-minimal-qemux86=
-64-20230307181808.qemuboot.conf<br>
&gt; 40237205 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A059 Mar=C2=A0 7 19:19 c=
ore-image-minimal-qemux86-64.tar.bz2 -&gt; core-image-minimal-qemux86-64-20=
230307181808.rootfs.tar.bz2<br>
&gt; 40209873 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A058 Mar=C2=A0 7 19:19 c=
ore-image-minimal-qemux86-64.testdata.json -&gt; core-image-minimal-qemux86=
-64-20230307181808.testdata.json<br>
&gt; 40237217 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A055 Mar=C2=A0 7 19:19 c=
ore-image-minimal-qemux86-64.ubi -&gt; core-image-minimal-qemux86-64-202303=
07181808.rootfs.ubi<br>
&gt; 40236771 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A057 Mar=C2=A0 7 19:19 c=
ore-image-minimal-qemux86-64.ubifs -&gt; core-image-minimal-qemux86-64-2023=
0307181808.rootfs.ubifs<br>
&gt; 40237287 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A055 Mar=C2=A0 7 19:19 c=
ore-image-minimal-qemux86-64.wic -&gt; core-image-minimal-qemux86-64-202303=
07181808.rootfs.wic<br>
&gt; 40237286 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A060 Mar=C2=A0 7 19:19 c=
ore-image-minimal-qemux86-64.wic.vmdk -&gt; core-image-minimal-qemux86-64-2=
0230307181808.rootfs.wic.vmdk<br>
&gt; 40237192 -rw-r--r-- 2 martin martin 3.8K Mar=C2=A0 7 19:19 core-image-=
minimal.env<br>
&gt; 34458377 -rw-r--r-- 2 martin martin 616K Mar=C2=A0 7 17:55 grub-efi-bo=
otx64.efi<br>
&gt; 34963606 -rwxr-xr-x 2 martin martin 103K Mar=C2=A0 6 22:02 linuxx64.ef=
i.stub<br>
&gt; 35845662 -rw-r--r-- 2 martin martin 8.2M Mar=C2=A0 7 12:27 modules--6.=
1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110.tgz<br>
&gt; 35845701 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A077 Mar=C2=A0 7 12:27 m=
odules-qemux86-64.tgz -&gt; modules--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0=
-qemux86-64-20230307112110.tgz<br>
&gt; 34963605 -rwxr-xr-x 2 martin martin 140K Mar=C2=A0 6 22:02 systemd-boo=
tx64.efi<br>
&gt; 27651415 -rw-r--r-- 2 martin martin=C2=A0 274 Mar=C2=A0 7 19:19 ubiniz=
e-core-image-minimal-qemux86-64-20230307181808.cfg<br>
&gt; <br>
&gt;=C2=A0 =C2=A0after these changes:<br>
&gt; total 297M<br>
&gt; 31269162 drwxr-xr-x 2 martin martin 4.0K Mar=C2=A0 7 19:16 .<br>
&gt; 31263942 drwxr-xr-x 3 martin martin 4.0K Mar=C2=A0 7 12:53 ..<br>
&gt; 39479266 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A077 Mar=C2=A0 7 12:27 b=
zImage -&gt; bzImage--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-202=
30307112110.bin<br>
&gt; 39479267 -rw-r--r-- 2 martin martin=C2=A0 11M Mar=C2=A0 7 12:27 bzImag=
e--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110.bin<br>
&gt; 39479264 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A077 Mar=C2=A0 7 12:27 b=
zImage-qemux86-64.bin -&gt; bzImage--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0=
-qemux86-64-20230307112110.bin<br>
&gt; 39648810 -rw-r--r-- 2 martin martin=C2=A0 13M Mar=C2=A0 7 19:15 core-i=
mage-minimal-initramfs-qemux86-64-20230307181456.cpio.gz<br>
&gt; 39638400 -rw-r--r-- 2 martin martin 1.1K Mar=C2=A0 7 19:15 core-image-=
minimal-initramfs-qemux86-64-20230307181456.manifest<br>
&gt; 39644650 -rw-r--r-- 2 martin martin 1.6K Mar=C2=A0 7 19:15 core-image-=
minimal-initramfs-qemux86-64-20230307181456.qemuboot.conf<br>
&gt; 39637657 -rw-r--r-- 2 martin martin 211K Mar=C2=A0 7 19:15 core-image-=
minimal-initramfs-qemux86-64-20230307181456.testdata.json<br>
&gt; 39648091 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A062 Mar=C2=A0 7 19:15 c=
ore-image-minimal-initramfs-qemux86-64.cpio.gz -&gt; core-image-minimal-ini=
tramfs-qemux86-64-20230307181456.cpio.gz<br>
&gt; 39638401 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A063 Mar=C2=A0 7 19:15 c=
ore-image-minimal-initramfs-qemux86-64.manifest -&gt; core-image-minimal-in=
itramfs-qemux86-64-20230307181456.manifest<br>
&gt; 39644651 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A068 Mar=C2=A0 7 19:15 c=
ore-image-minimal-initramfs-qemux86-64.qemuboot.conf -&gt; core-image-minim=
al-initramfs-qemux86-64-20230307181456.qemuboot.conf<br>
&gt; 39637662 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A068 Mar=C2=A0 7 19:15 c=
ore-image-minimal-initramfs-qemux86-64.testdata.json -&gt; core-image-minim=
al-initramfs-qemux86-64-20230307181456.testdata.json<br>
&gt; 39654281 -rw-r--r-- 2 martin martin=C2=A0 34M Mar=C2=A0 7 19:15 core-i=
mage-minimal-qemux86-64.rootfs-20230307181456.ext4<br>
&gt; 39656710 -rw-r--r-- 2 martin martin=C2=A0 57M Mar=C2=A0 7 19:15 core-i=
mage-minimal-qemux86-64.rootfs-20230307181456.hddimg<br>
&gt; 39657112 -rw-r--r-- 2 martin martin=C2=A0 56M Mar=C2=A0 7 19:16 core-i=
mage-minimal-qemux86-64.rootfs-20230307181456.iso<br>
&gt; 39645313 -rw-r--r-- 2 martin martin 1.2K Mar=C2=A0 7 19:15 core-image-=
minimal-qemux86-64.rootfs-20230307181456.manifest<br>
&gt; 39646013 -rw-r--r-- 2 martin martin 1.6K Mar=C2=A0 7 19:15 core-image-=
minimal-qemux86-64.rootfs-20230307181456.qemuboot.conf<br>
&gt; 39656336 -rw-r--r-- 2 martin martin=C2=A0 16M Mar=C2=A0 7 19:15 core-i=
mage-minimal-qemux86-64.rootfs-20230307181456.tar.bz2<br>
&gt; 39644408 -rw-r--r-- 2 martin martin 206K Mar=C2=A0 7 19:15 core-image-=
minimal-qemux86-64.rootfs-20230307181456.testdata.json<br>
&gt; 39656583 -rw-r--r-- 2 martin martin=C2=A0 20M Mar=C2=A0 7 19:15 core-i=
mage-minimal-qemux86-64.rootfs-20230307181456.ubi<br>
&gt; 39654124 -rw-r--r-- 2 martin martin=C2=A0 19M Mar=C2=A0 7 19:15 core-i=
mage-minimal-qemux86-64.rootfs-20230307181456.ubifs<br>
&gt; 39802371 -rw-r--r-- 2 martin martin=C2=A0 73M Mar=C2=A0 7 19:16 core-i=
mage-minimal-qemux86-64.rootfs-20230307181456.wic<br>
&gt; 39657113 -rw-r--r-- 2 martin martin=C2=A0 35M Mar=C2=A0 7 19:16 core-i=
mage-minimal-qemux86-64.rootfs-20230307181456.wic.vmdk<br>
&gt; 39654412 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A056 Mar=C2=A0 7 19:15 c=
ore-image-minimal-qemux86-64.rootfs.ext4 -&gt; core-image-minimal-qemux86-6=
4.rootfs-20230307181456.ext4<br>
&gt; 39657167 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A058 Mar=C2=A0 7 19:16 c=
ore-image-minimal-qemux86-64.rootfs.hddimg -&gt; core-image-minimal-qemux86=
-64.rootfs-20230307181456.hddimg<br>
&gt; 39657168 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A055 Mar=C2=A0 7 19:16 c=
ore-image-minimal-qemux86-64.rootfs.iso -&gt; core-image-minimal-qemux86-64=
.rootfs-20230307181456.iso<br>
&gt; 39645316 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A060 Mar=C2=A0 7 19:15 c=
ore-image-minimal-qemux86-64.rootfs.manifest -&gt; core-image-minimal-qemux=
86-64.rootfs-20230307181456.manifest<br>
&gt; 39646014 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A065 Mar=C2=A0 7 19:15 c=
ore-image-minimal-qemux86-64.rootfs.qemuboot.conf -&gt; core-image-minimal-=
qemux86-64.rootfs-20230307181456.qemuboot.conf<br>
&gt; 39656315 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A059 Mar=C2=A0 7 19:15 c=
ore-image-minimal-qemux86-64.rootfs.tar.bz2 -&gt; core-image-minimal-qemux8=
6-64.rootfs-20230307181456.tar.bz2<br>
&gt; 39644406 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A065 Mar=C2=A0 7 19:15 c=
ore-image-minimal-qemux86-64.rootfs.testdata.json -&gt; core-image-minimal-=
qemux86-64.rootfs-20230307181456.testdata.json<br>
&gt; 39656584 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A055 Mar=C2=A0 7 19:15 c=
ore-image-minimal-qemux86-64.rootfs.ubi -&gt; core-image-minimal-qemux86-64=
.rootfs-20230307181456.ubi<br>
&gt; 39654775 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A057 Mar=C2=A0 7 19:15 c=
ore-image-minimal-qemux86-64.rootfs.ubifs -&gt; core-image-minimal-qemux86-=
64.rootfs-20230307181456.ubifs<br>
&gt; 39657126 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A055 Mar=C2=A0 7 19:16 c=
ore-image-minimal-qemux86-64.rootfs.wic -&gt; core-image-minimal-qemux86-64=
.rootfs-20230307181456.wic<br>
&gt; 39657088 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A060 Mar=C2=A0 7 19:16 c=
ore-image-minimal-qemux86-64.rootfs.wic.vmdk -&gt; core-image-minimal-qemux=
86-64.rootfs-20230307181456.wic.vmdk<br>
&gt; 39654418 -rw-r--r-- 2 martin martin 3.8K Mar=C2=A0 7 19:15 core-image-=
minimal.env<br>
&gt; 39475732 -rw-r--r-- 2 martin martin 616K Mar=C2=A0 7 17:55 grub-efi-bo=
otx64.efi<br>
&gt; 31507074 -rwxr-xr-x 2 martin martin 103K Mar=C2=A0 6 22:02 linuxx64.ef=
i.stub<br>
&gt; 39479261 -rw-r--r-- 2 martin martin 8.2M Mar=C2=A0 7 12:27 modules--6.=
1.14+git0+e8d08fc4c0_b05ca3429c-r0.0-qemux86-64-20230307112110.tgz<br>
&gt; 39479263 lrwxrwxrwx 2 martin martin=C2=A0 =C2=A077 Mar=C2=A0 7 12:27 m=
odules-qemux86-64.tgz -&gt; modules--6.1.14+git0+e8d08fc4c0_b05ca3429c-r0.0=
-qemux86-64-20230307112110.tgz<br>
&gt; 31507058 -rwxr-xr-x 2 martin martin 140K Mar=C2=A0 6 22:02 systemd-boo=
tx64.efi<br>
&gt; 27651415 -rw-r--r-- 2 martin martin=C2=A0 274 Mar=C2=A0 7 19:15 ubiniz=
e-core-image-minimal-qemux86-64.rootfs-20230307181456.cfg<br>
&gt; <br>
&gt; [YOCTO #12937]<br>
&gt; <br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../image-artifact-names.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
&gt;=C2=A0 meta/classes-recipe/image-live.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A01 -<br>
&gt;=C2=A0 meta/classes-recipe/image.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 +-<br>
&gt;=C2=A0 meta/classes-recipe/image_types.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 108 +++++++++---------<br>
&gt;=C2=A0 meta/classes-recipe/image_types_wic.bbclass=C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +-<br>
&gt;=C2=A0 .../rootfs-postcommands.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 meta/classes/cve-check.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 meta/lib/oeqa/selftest/cases/fitimage.py=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 .../images/<a href=3D"http://build-appliance-image_15.0.0.bb" re=
l=3D"noreferrer" target=3D"_blank">build-appliance-image_15.0.0.bb</a>=C2=
=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 9 files changed, 68 insertions(+), 67 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes-recipe/image-artifact-names.bbclass b/meta/c=
lasses-recipe/image-artifact-names.bbclass<br>
&gt; index ac2376d59a..bc76ff0e16 100644<br>
&gt; --- a/meta/classes-recipe/image-artifact-names.bbclass<br>
&gt; +++ b/meta/classes-recipe/image-artifact-names.bbclass<br>
&gt; @@ -12,9 +12,10 @@ IMAGE_BASENAME ?=3D &quot;${PN}&quot;<br>
&gt;=C2=A0 IMAGE_VERSION_SUFFIX ?=3D &quot;-${DATETIME}&quot;<br>
&gt;=C2=A0 IMAGE_VERSION_SUFFIX[vardepsexclude] +=3D &quot;DATETIME SOURCE_=
DATE_EPOCH&quot;<br>
&gt;=C2=A0 IMAGE_NAME ?=3D &quot;${IMAGE_LINK_NAME}${IMAGE_VERSION_SUFFIX}&=
quot;<br>
&gt; -IMAGE_LINK_NAME ?=3D &quot;${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}&q=
uot;<br>
&gt; +IMAGE_LINK_NAME ?=3D &quot;${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${=
IMAGE_NAME_SUFFIX}&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # This needs to stay in sync with IMAGE_LINK_NAME, but with INIT=
RAMFS_IMAGE instead of IMAGE_BASENAME<br>
&gt; +# and without ${IMAGE_NAME_SUFFIX} which all initramfs images should =
set to empty<br>
&gt;=C2=A0 INITRAMFS_IMAGE_NAME ?=3D &quot;${@[&#39;${INITRAMFS_IMAGE}${IMA=
GE_MACHINE_SUFFIX}&#39;, &#39;&#39;][d.getVar(&#39;INITRAMFS_IMAGE&#39;) =
=3D=3D &#39;&#39;]}&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # The default DEPLOY_DIR_IMAGE is ${MACHINE} directory:<br>
&gt; diff --git a/meta/classes-recipe/image-live.bbclass b/meta/classes-rec=
ipe/image-live.bbclass<br>
&gt; index 168774a464..95dd44a8c0 100644<br>
&gt; --- a/meta/classes-recipe/image-live.bbclass<br>
&gt; +++ b/meta/classes-recipe/image-live.bbclass<br>
&gt; @@ -260,6 +260,5 @@ python do_bootimg() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bb.build.exec_func(&#39;create_symlinks&#39;, d)<b=
r>
&gt;=C2=A0 }<br>
&gt;=C2=A0 do_bootimg[subimages] =3D &quot;hddimg iso&quot;<br>
&gt; -do_bootimg[imgsuffix] =3D &quot;.&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 addtask bootimg before do_image_complete after do_rootfs<br>
&gt; diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/i=
mage.bbclass<br>
&gt; index e0dfba4a42..21b220a28d 100644<br>
&gt; --- a/meta/classes-recipe/image.bbclass<br>
&gt; +++ b/meta/classes-recipe/image.bbclass<br>
&gt; @@ -480,14 +480,14 @@ python () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if subimage not in subimages:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 subimages.append(subimage)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if type not in alltypes:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 rm_tmp_images.add(localdata.expand(&quot;${IMAGE_NAME}${IMAG=
E_NAME_SUFFIX}.${type}&quot;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 rm_tmp_images.add(localdata.expand(&quot;${IMAGE_NAME}.${typ=
e}&quot;))<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for bt in basetypes[t]:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_conversion_cmds(bt=
)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 localdata.setVar(&#39;type&#39;, rea=
lt)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if t not in alltypes:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm_tmp_images.add(localdata=
.expand(&quot;${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}&quot;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm_tmp_images.add(localdata=
.expand(&quot;${IMAGE_NAME}.${type}&quot;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subimages.append(realt=
)<br>
&gt;=C2=A0 <br>
&gt; @@ -594,13 +594,12 @@ python create_symlinks() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 manifest_name =3D d.getVar(&#39;IMAGE_MANIFEST&#39=
;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 taskname =3D d.getVar(&quot;BB_CURRENTTASK&quot;)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 subimages =3D (d.getVarFlag(&quot;do_&quot; + task=
name, &#39;subimages&#39;, False) or &quot;&quot;).split()<br>
&gt; -=C2=A0 =C2=A0 imgsuffix =3D d.getVarFlag(&quot;do_&quot; + taskname, =
&#39;imgsuffix&#39;) or d.expand(&quot;${IMAGE_NAME_SUFFIX}.&quot;)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if not link_name:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for type in subimages:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst =3D os.path.join(deploy_dir, lin=
k_name + &quot;.&quot; + type)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 src =3D img_name + imgsuffix + type<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 src =3D img_name + &quot;.&quot; + type<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(os.path.join(deplo=
y_dir, src)):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;Creating=
 symlink: %s -&gt; %s&quot; % (dst, src))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.islink(dst)=
:<br>
&gt; diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-re=
cipe/image_types.bbclass<br>
&gt; index bbddfaf272..16e9aef40e 100644<br>
&gt; --- a/meta/classes-recipe/image_types.bbclass<br>
&gt; +++ b/meta/classes-recipe/image_types.bbclass<br>
&gt; @@ -66,9 +66,9 @@ ZIP_COMPRESSION_LEVEL ?=3D &quot;-9&quot;<br>
&gt;=C2=A0 ZSTD_COMPRESSION_LEVEL ?=3D &quot;-3&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 JFFS2_SUM_EXTRA_ARGS ?=3D &quot;&quot;<br>
&gt; -IMAGE_CMD:jffs2 =3D &quot;mkfs.jffs2 --root=3D${IMAGE_ROOTFS} --faket=
ime --output=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.jffs2 ${EX=
TRA_IMAGECMD}&quot;<br>
&gt; +IMAGE_CMD:jffs2 =3D &quot;mkfs.jffs2 --root=3D${IMAGE_ROOTFS} --faket=
ime --output=3D${IMGDEPLOYDIR}/${IMAGE_NAME}.jffs2 ${EXTRA_IMAGECMD}&quot;<=
br>
&gt;=C2=A0 <br>
&gt; -IMAGE_CMD:cramfs =3D &quot;mkfs.cramfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR=
}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cramfs ${EXTRA_IMAGECMD}&quot;<br>
&gt; +IMAGE_CMD:cramfs =3D &quot;mkfs.cramfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR=
}/${IMAGE_NAME}.cramfs ${EXTRA_IMAGECMD}&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 oe_mkext234fs () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fstype=3D$1<br>
&gt; @@ -88,14 +88,14 @@ oe_mkext234fs () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eval COUNT=3D\&q=
uot;$MIN_COUNT\&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Create a sparse image block<br>
&gt; -=C2=A0 =C2=A0 =C2=A0bbdebug 1 Executing &quot;dd if=3D/dev/zero of=3D=
${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=3D$ROOTFS_SI=
ZE count=3D$COUNT bs=3D1024&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0dd if=3D/dev/zero of=3D${IMGDEPLOYDIR}/${IMAGE_NA=
ME}${IMAGE_NAME_SUFFIX}.$fstype seek=3D$ROOTFS_SIZE count=3D$COUNT bs=3D102=
4<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bbdebug 1 Executing &quot;dd if=3D/dev/zero of=3D=
${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype seek=3D$ROOTFS_SIZE count=3D$COUNT bs=
=3D1024&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dd if=3D/dev/zero of=3D${IMGDEPLOYDIR}/${IMAGE_NA=
ME}.$fstype seek=3D$ROOTFS_SIZE count=3D$COUNT bs=3D1024<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bbdebug 1 &quot;Actual Rootfs size:=C2=A0 `d=
u -s ${IMAGE_ROOTFS}`&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0bbdebug 1 &quot;Actual Partition size: `stat -c &=
#39;%s&#39; ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype`&quot=
;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0bbdebug 1 Executing &quot;mkfs.$fstype -F $extra_=
imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d ${IMA=
GE_ROOTFS}&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/$=
{IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d ${IMAGE_ROOTFS}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bbdebug 1 &quot;Actual Partition size: `stat -c &=
#39;%s&#39; ${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype`&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bbdebug 1 Executing &quot;mkfs.$fstype -F $extra_=
imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype -d ${IMAGE_ROOTFS}&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/$=
{IMAGE_NAME}.$fstype -d ${IMAGE_ROOTFS}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Error codes 0-3 indicate successfull opera=
tion of fsck (no errors or errors corrected)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0fsck.$fstype -pvfD ${IMGDEPLOYDIR}/${IMAGE_NAME}$=
{IMAGE_NAME_SUFFIX}.$fstype || [ $? -le 3 ]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fsck.$fstype -pvfD ${IMGDEPLOYDIR}/${IMAGE_NAME}.=
$fstype || [ $? -le 3 ]<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 IMAGE_CMD:ext2 =3D &quot;oe_mkext234fs ext2 ${EXTRA_IMAGECMD}&qu=
ot;<br>
&gt; @@ -109,8 +109,8 @@ IMAGE_CMD:btrfs () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size=3D${MIN_BTR=
FS_SIZE}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbwarn &quot;Roo=
tfs size is too small for BTRFS. Filesystem will be extended to ${size}K&qu=
ot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0dd if=3D/dev/zero of=3D${IMGDEPLOYDIR}/${IMAGE_NA=
ME}${IMAGE_NAME_SUFFIX}.btrfs seek=3D${size} count=3D0 bs=3D1024<br>
&gt; -=C2=A0 =C2=A0 =C2=A0mkfs.btrfs ${EXTRA_IMAGECMD} -r ${IMAGE_ROOTFS} $=
{IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.btrfs<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dd if=3D/dev/zero of=3D${IMGDEPLOYDIR}/${IMAGE_NA=
ME}.btrfs seek=3D${size} count=3D0 bs=3D1024<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mkfs.btrfs ${EXTRA_IMAGECMD} -r ${IMAGE_ROOTFS} $=
{IMGDEPLOYDIR}/${IMAGE_NAME}.btrfs<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 oe_mksquashfs () {<br>
&gt; @@ -119,7 +119,7 @@ oe_mksquashfs () {<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Use the bitbake reproducible timestamp instead o=
f the hardcoded squashfs one<br>
&gt;=C2=A0 =C2=A0 =C2=A0 export SOURCE_DATE_EPOCH=3D$(stat -c &#39;%Y&#39; =
${IMAGE_ROOTFS})<br>
&gt; -=C2=A0 =C2=A0 mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME=
}${IMAGE_NAME_SUFFIX}.squashfs${comp:+-}${suffix:-$comp} ${EXTRA_IMAGECMD} =
-noappend ${comp:+-comp }$comp<br>
&gt; +=C2=A0 =C2=A0 mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME=
}.squashfs${comp:+-}${suffix:-$comp} ${EXTRA_IMAGECMD} -noappend ${comp:+-c=
omp }$comp<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 IMAGE_CMD:squashfs =3D &quot;oe_mksquashfs&quot;<br>
&gt;=C2=A0 IMAGE_CMD:squashfs-xz =3D &quot;oe_mksquashfs xz&quot;<br>
&gt; @@ -127,18 +127,18 @@ IMAGE_CMD:squashfs-lzo =3D &quot;oe_mksquashfs l=
zo&quot;<br>
&gt;=C2=A0 IMAGE_CMD:squashfs-lz4 =3D &quot;oe_mksquashfs lz4&quot;<br>
&gt;=C2=A0 IMAGE_CMD:squashfs-zst =3D &quot;oe_mksquashfs zstd zst&quot;<br=
>
&gt;=C2=A0 <br>
&gt; -IMAGE_CMD:erofs =3D &quot;mkfs.erofs ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR=
}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.erofs ${IMAGE_ROOTFS}&quot;<br>
&gt; -IMAGE_CMD:erofs-lz4 =3D &quot;mkfs.erofs -zlz4 ${EXTRA_IMAGECMD} ${IM=
GDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.erofs-lz4 ${IMAGE_ROOTFS}&quo=
t;<br>
&gt; -IMAGE_CMD:erofs-lz4hc =3D &quot;mkfs.erofs -zlz4hc ${EXTRA_IMAGECMD} =
${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.erofs-lz4hc ${IMAGE_ROOTF=
S}&quot;<br>
&gt; +IMAGE_CMD:erofs =3D &quot;mkfs.erofs ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR=
}/${IMAGE_NAME}.erofs ${IMAGE_ROOTFS}&quot;<br>
&gt; +IMAGE_CMD:erofs-lz4 =3D &quot;mkfs.erofs -zlz4 ${EXTRA_IMAGECMD} ${IM=
GDEPLOYDIR}/${IMAGE_NAME}.erofs-lz4 ${IMAGE_ROOTFS}&quot;<br>
&gt; +IMAGE_CMD:erofs-lz4hc =3D &quot;mkfs.erofs -zlz4hc ${EXTRA_IMAGECMD} =
${IMGDEPLOYDIR}/${IMAGE_NAME}.erofs-lz4hc ${IMAGE_ROOTFS}&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 IMAGE_CMD_TAR ?=3D &quot;tar&quot;<br>
&gt;=C2=A0 # ignore return code 1 &quot;file changed as we read it&quot; as=
 other tasks(e.g. do_image_wic) may be hardlinking rootfs<br>
&gt; -IMAGE_CMD:tar =3D &quot;${IMAGE_CMD_TAR} --sort=3Dname --format=3Dpos=
ix --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ta=
r -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]&quot;<br>
&gt; +IMAGE_CMD:tar =3D &quot;${IMAGE_CMD_TAR} --sort=3Dname --format=3Dpos=
ix --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}.tar -C ${IMAGE_ROOTFS}=
 . || [ $? -eq 1 ]&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_image_cpio[cleandirs] +=3D &quot;${WORKDIR}/cpio_append&quot;=
<br>
&gt;=C2=A0 IMAGE_CMD:cpio () {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0(cd ${IMAGE_ROOTFS} &amp;&amp; find . | sort | cp=
io --reproducible -o -H newc &gt;${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_=
SUFFIX}.cpio)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0(cd ${IMAGE_ROOTFS} &amp;&amp; find . | sort | cp=
io --reproducible -o -H newc &gt;${IMGDEPLOYDIR}/${IMAGE_NAME}.cpio)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# We only need the /init symlink if we&#39;r=
e building the real<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# image. The -dbg image doesn&#39;t need it!=
 By being clever<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# about this we also avoid &#39;touch&#39; b=
elow failing, as it<br>
&gt; @@ -151,7 +151,7 @@ IMAGE_CMD:cpio () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0touch ${WORKDIR}/cpio_append/init<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0(cd=C2=A0 ${WORKDIR}/cpio_append &amp;&amp; echo ./init | cpio -oA -=
H newc -F ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0(cd=C2=A0 ${WORKDIR}/cpio_append &amp;&amp; echo ./init | cpio -oA -=
H newc -F ${IMGDEPLOYDIR}/${IMAGE_NAME}.cpio)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 }<br>
&gt; @@ -166,7 +166,7 @@ write_ubi_config() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cat &lt;&lt;EOF &gt; ubinize${vname}-${IMAGE=
_NAME}.cfg<br>
&gt;=C2=A0 [ubifs]<br>
&gt;=C2=A0 mode=3Dubi<br>
&gt; -image=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.${U=
BI_IMGTYPE}<br>
&gt; +image=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}.${UBI_IMGTYPE}<br>
&gt;=C2=A0 vol_id=3D0<br>
&gt;=C2=A0 vol_type=3D${UBI_VOLTYPE}<br>
&gt;=C2=A0 vol_name=3D${UBI_VOLNAME}<br>
&gt; @@ -191,9 +191,9 @@ multiubi_mkfs() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0write_ubi_config &quot;${vname}&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;$vname&quot; ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkfs.ubifs -r ${IMAGE=
_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs=
 ${mkubifs_args}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkfs.ubifs -r ${IMAGE=
_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}.ubifs ${mkubifs_args}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ubinize -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}$=
{IMAGE_NAME_SUFFIX}.ubi ${ubinize_args} ubinize${vname}-${IMAGE_NAME}.cfg<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0ubinize -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}.=
ubi ${ubinize_args} ubinize${vname}-${IMAGE_NAME}.cfg<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Cleanup cfg file<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mv ubinize${vname}-${IMAGE_NAME}.cfg ${IMGDE=
PLOYDIR}/<br>
&gt; @@ -201,12 +201,12 @@ multiubi_mkfs() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Create own symlinks for &#39;named&#39; vo=
lumes<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;$vname&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${IMGDEPLOYDI=
R}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e ${IMAGE_NAME}=
${vname}${IMAGE_NAME_SUFFIX}.ubifs ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ln -sf ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e ${IMAGE_NAME}=
${vname}.ubifs ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ln -sf ${IMAGE_NAME}${vname}.ubifs \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0${IMAGE_LINK_NAME}${vname}.ubifs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e ${IMAGE_NAME}=
${vname}${IMAGE_NAME_SUFFIX}.ubi ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ln -sf ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubi \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e ${IMAGE_NAME}=
${vname}.ubi ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ln -sf ${IMAGE_NAME}${vname}.ubi \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0${IMAGE_LINK_NAME}${vname}.ubi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd -<br>
&gt; @@ -231,7 +231,7 @@ IMAGE_CMD:ubi () {<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 IMAGE_TYPEDEP:ubi =3D &quot;${UBI_IMGTYPE}&quot;<br>
&gt;=C2=A0 <br>
&gt; -IMAGE_CMD:ubifs =3D &quot;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLO=
YDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ubifs ${MKUBIFS_ARGS}&quot;<br>
&gt; +IMAGE_CMD:ubifs =3D &quot;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLO=
YDIR}/${IMAGE_NAME}.ubifs ${MKUBIFS_ARGS}&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 MIN_F2FS_SIZE ?=3D &quot;524288&quot;<br>
&gt;=C2=A0 IMAGE_CMD:f2fs () {<br>
&gt; @@ -245,9 +245,9 @@ IMAGE_CMD:f2fs () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size=3D${MIN_F2F=
S_SIZE}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbwarn &quot;Roo=
tfs size is too small for F2FS. Filesystem will be extended to ${size}K&quo=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0dd if=3D/dev/zero of=3D${IMGDEPLOYDIR}/${IMAGE_NA=
ME}${IMAGE_NAME_SUFFIX}.f2fs seek=3D${size} count=3D0 bs=3D1024<br>
&gt; -=C2=A0 =C2=A0 =C2=A0mkfs.f2fs ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${IMA=
GE_NAME}${IMAGE_NAME_SUFFIX}.f2fs<br>
&gt; -=C2=A0 =C2=A0 =C2=A0sload.f2fs -f ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${I=
MAGE_NAME}${IMAGE_NAME_SUFFIX}.f2fs<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dd if=3D/dev/zero of=3D${IMGDEPLOYDIR}/${IMAGE_NA=
ME}.f2fs seek=3D${size} count=3D0 bs=3D1024<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mkfs.f2fs ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${IMA=
GE_NAME}.f2fs<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sload.f2fs -f ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${I=
MAGE_NAME}.f2fs<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 EXTRA_IMAGECMD =3D &quot;&quot;<br>
&gt; @@ -313,32 +313,32 @@ IMAGE_TYPES:append:x86-64 =3D &quot; hddimg iso&=
quot;<br>
&gt;=C2=A0 COMPRESSIONTYPES ?=3D &quot;&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 CONVERSIONTYPES =3D &quot;gz bz2 lzma xz lz4 lzo zip 7zip zst su=
m md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk v=
hd vhdx vdi qcow2 base64 gzsync zsync ${COMPRESSIONTYPES}&quot;<br>
&gt; -CONVERSION_CMD:lzma =3D &quot;lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME=
_SUFFIX}.${type}&quot;<br>
&gt; -CONVERSION_CMD:gz =3D &quot;gzip -f -9 -n -c --rsyncable ${IMAGE_NAME=
}${IMAGE_NAME_SUFFIX}.${type} &gt; ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type=
}.gz&quot;<br>
&gt; -CONVERSION_CMD:bz2 =3D &quot;pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_S=
UFFIX}.${type}&quot;<br>
&gt; -CONVERSION_CMD:xz =3D &quot;xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_=
DEFAULTS} --check=3D${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}=
.${type} &gt; ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz&quot;<br>
&gt; -CONVERSION_CMD:lz4 =3D &quot;lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_S=
UFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4&quot;<br>
&gt; -CONVERSION_CMD:lzo =3D &quot;lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX=
}.${type}&quot;<br>
&gt; -CONVERSION_CMD:zip =3D &quot;zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAM=
E}${IMAGE_NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type=
}&quot;<br>
&gt; -CONVERSION_CMD:7zip =3D &quot;7za a -mx=3D${7ZIP_COMPRESSION_LEVEL} -=
mm=3D${7ZIP_COMPRESSION_METHOD} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.$=
{7ZIP_EXTENSION} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}&quot;<br>
&gt; -CONVERSION_CMD:zst =3D &quot;zstd -f -k -T0 -c ${ZSTD_COMPRESSION_LEV=
EL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} &gt; ${IMAGE_NAME}${IMAGE_NAM=
E_SUFFIX}.${type}.zst&quot;<br>
&gt; -CONVERSION_CMD:sum =3D &quot;sumtool -i ${IMAGE_NAME}${IMAGE_NAME_SUF=
FIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_E=
XTRA_ARGS}&quot;<br>
&gt; -CONVERSION_CMD:md5sum =3D &quot;md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFF=
IX}.${type} &gt; ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.md5sum&quot;<br>
&gt; -CONVERSION_CMD:sha1sum =3D &quot;sha1sum ${IMAGE_NAME}${IMAGE_NAME_SU=
FFIX}.${type} &gt; ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha1sum&quot;<=
br>
&gt; -CONVERSION_CMD:sha224sum =3D &quot;sha224sum ${IMAGE_NAME}${IMAGE_NAM=
E_SUFFIX}.${type} &gt; ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha224sum&=
quot;<br>
&gt; -CONVERSION_CMD:sha256sum =3D &quot;sha256sum ${IMAGE_NAME}${IMAGE_NAM=
E_SUFFIX}.${type} &gt; ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha256sum&=
quot;<br>
&gt; -CONVERSION_CMD:sha384sum =3D &quot;sha384sum ${IMAGE_NAME}${IMAGE_NAM=
E_SUFFIX}.${type} &gt; ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha384sum&=
quot;<br>
&gt; -CONVERSION_CMD:sha512sum =3D &quot;sha512sum ${IMAGE_NAME}${IMAGE_NAM=
E_SUFFIX}.${type} &gt; ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha512sum&=
quot;<br>
&gt; -CONVERSION_CMD:bmap =3D &quot;bmaptool create ${IMAGE_NAME}${IMAGE_NA=
ME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.bmap&quot;<=
br>
&gt; -CONVERSION_CMD:u-boot =3D &quot;mkimage -A ${UBOOT_ARCH} -O linux -T =
ramdisk -C none -n ${IMAGE_NAME} -d ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${typ=
e} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.u-boot&quot;<br>
&gt; -CONVERSION_CMD:vmdk =3D &quot;qemu-img convert -O vmdk ${IMAGE_NAME}$=
{IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vmdk&=
quot;<br>
&gt; -CONVERSION_CMD:vhdx =3D &quot;qemu-img convert -O vhdx -o subformat=
=3Ddynamic ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_N=
AME_SUFFIX}.${type}.vhdx&quot;<br>
&gt; -CONVERSION_CMD:vhd =3D &quot;qemu-img convert -O vpc -o subformat=3Df=
ixed ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SU=
FFIX}.${type}.vhd&quot;<br>
&gt; -CONVERSION_CMD:vdi =3D &quot;qemu-img convert -O vdi ${IMAGE_NAME}${I=
MAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vdi&quo=
t;<br>
&gt; -CONVERSION_CMD:qcow2 =3D &quot;qemu-img convert -O qcow2 ${IMAGE_NAME=
}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.qco=
w2&quot;<br>
&gt; -CONVERSION_CMD:base64 =3D &quot;base64 ${IMAGE_NAME}${IMAGE_NAME_SUFF=
IX}.${type} &gt; ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.base64&quot;<br>
&gt; -CONVERSION_CMD:zsync =3D &quot;zsyncmake_curl ${IMAGE_NAME}${IMAGE_NA=
ME_SUFFIX}.${type}&quot;<br>
&gt; -CONVERSION_CMD:gzsync =3D &quot;zsyncmake_curl -z ${IMAGE_NAME}${IMAG=
E_NAME_SUFFIX}.${type}&quot;<br>
&gt; +CONVERSION_CMD:lzma =3D &quot;lzma -k -f -7 ${IMAGE_NAME}.${type}&quo=
t;<br>
&gt; +CONVERSION_CMD:gz =3D &quot;gzip -f -9 -n -c --rsyncable ${IMAGE_NAME=
}.${type} &gt; ${IMAGE_NAME}.${type}.gz&quot;<br>
&gt; +CONVERSION_CMD:bz2 =3D &quot;pbzip2 -f -k ${IMAGE_NAME}.${type}&quot;=
<br>
&gt; +CONVERSION_CMD:xz =3D &quot;xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_=
DEFAULTS} --check=3D${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.${type} &gt; ${IMAG=
E_NAME}.${type}.xz&quot;<br>
&gt; +CONVERSION_CMD:lz4 =3D &quot;lz4 -9 -z -l ${IMAGE_NAME}.${type} ${IMA=
GE_NAME}.${type}.lz4&quot;<br>
&gt; +CONVERSION_CMD:lzo =3D &quot;lzop -9 ${IMAGE_NAME}.${type}&quot;<br>
&gt; +CONVERSION_CMD:zip =3D &quot;zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAM=
E}.${type}.zip ${IMAGE_NAME}.${type}&quot;<br>
&gt; +CONVERSION_CMD:7zip =3D &quot;7za a -mx=3D${7ZIP_COMPRESSION_LEVEL} -=
mm=3D${7ZIP_COMPRESSION_METHOD} ${IMAGE_NAME}.${type}.${7ZIP_EXTENSION} ${I=
MAGE_NAME}.${type}&quot;<br>
&gt; +CONVERSION_CMD:zst =3D &quot;zstd -f -k -T0 -c ${ZSTD_COMPRESSION_LEV=
EL} ${IMAGE_NAME}.${type} &gt; ${IMAGE_NAME}.${type}.zst&quot;<br>
&gt; +CONVERSION_CMD:sum =3D &quot;sumtool -i ${IMAGE_NAME}.${type} -o ${IM=
AGE_NAME}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}&quot;<br>
&gt; +CONVERSION_CMD:md5sum =3D &quot;md5sum ${IMAGE_NAME}.${type} &gt; ${I=
MAGE_NAME}.${type}.md5sum&quot;<br>
&gt; +CONVERSION_CMD:sha1sum =3D &quot;sha1sum ${IMAGE_NAME}.${type} &gt; $=
{IMAGE_NAME}.${type}.sha1sum&quot;<br>
&gt; +CONVERSION_CMD:sha224sum =3D &quot;sha224sum ${IMAGE_NAME}.${type} &g=
t; ${IMAGE_NAME}.${type}.sha224sum&quot;<br>
&gt; +CONVERSION_CMD:sha256sum =3D &quot;sha256sum ${IMAGE_NAME}.${type} &g=
t; ${IMAGE_NAME}.${type}.sha256sum&quot;<br>
&gt; +CONVERSION_CMD:sha384sum =3D &quot;sha384sum ${IMAGE_NAME}.${type} &g=
t; ${IMAGE_NAME}.${type}.sha384sum&quot;<br>
&gt; +CONVERSION_CMD:sha512sum =3D &quot;sha512sum ${IMAGE_NAME}.${type} &g=
t; ${IMAGE_NAME}.${type}.sha512sum&quot;<br>
&gt; +CONVERSION_CMD:bmap =3D &quot;bmaptool create ${IMAGE_NAME}.${type} -=
o ${IMAGE_NAME}.${type}.bmap&quot;<br>
&gt; +CONVERSION_CMD:u-boot =3D &quot;mkimage -A ${UBOOT_ARCH} -O linux -T =
ramdisk -C none -n ${IMAGE_NAME} -d ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${t=
ype}.u-boot&quot;<br>
&gt; +CONVERSION_CMD:vmdk =3D &quot;qemu-img convert -O vmdk ${IMAGE_NAME}.=
${type} ${IMAGE_NAME}.${type}.vmdk&quot;<br>
&gt; +CONVERSION_CMD:vhdx =3D &quot;qemu-img convert -O vhdx -o subformat=
=3Ddynamic ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.vhdx&quot;<br>
&gt; +CONVERSION_CMD:vhd =3D &quot;qemu-img convert -O vpc -o subformat=3Df=
ixed ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.vhd&quot;<br>
&gt; +CONVERSION_CMD:vdi =3D &quot;qemu-img convert -O vdi ${IMAGE_NAME}.${=
type} ${IMAGE_NAME}.${type}.vdi&quot;<br>
&gt; +CONVERSION_CMD:qcow2 =3D &quot;qemu-img convert -O qcow2 ${IMAGE_NAME=
}.${type} ${IMAGE_NAME}.${type}.qcow2&quot;<br>
&gt; +CONVERSION_CMD:base64 =3D &quot;base64 ${IMAGE_NAME}.${type} &gt; ${I=
MAGE_NAME}.${type}.base64&quot;<br>
&gt; +CONVERSION_CMD:zsync =3D &quot;zsyncmake_curl ${IMAGE_NAME}.${type}&q=
uot;<br>
&gt; +CONVERSION_CMD:gzsync =3D &quot;zsyncmake_curl -z ${IMAGE_NAME}.${typ=
e}&quot;<br>
&gt;=C2=A0 CONVERSION_DEPENDS_lzma =3D &quot;xz-native&quot;<br>
&gt;=C2=A0 CONVERSION_DEPENDS_gz =3D &quot;pigz-native&quot;<br>
&gt;=C2=A0 CONVERSION_DEPENDS_bz2 =3D &quot;pbzip2-native&quot;<br>
&gt; diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classe=
s-recipe/image_types_wic.bbclass<br>
&gt; index be31fbf94f..669606da75 100644<br>
&gt; --- a/meta/classes-recipe/image_types_wic.bbclass<br>
&gt; +++ b/meta/classes-recipe/image_types_wic.bbclass<br>
&gt; @@ -71,7 +71,7 @@ IMAGE_CMD:wic () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal &quot;No=
 kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FI=
LE or WKS_FILES appropriately.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0BUILDDIR=3D&quot;${TOPDIR}&quot; PSEUDO_UNLO=
AD=3D1 wic create &quot;$wks&quot; --vars &quot;${STAGING_DIR}/${MACHINE}/i=
mgdata/&quot; -e &quot;${IMAGE_BASENAME}&quot; -o &quot;$build_wic/&quot; -=
w &quot;$tmp_wic&quot; ${WIC_CREATE_EXTRA_ARGS}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0mv &quot;$build_wic/$(basename &quot;${wks%.wks}&=
quot;)&quot;*.direct &quot;$out${IMAGE_NAME_SUFFIX}.wic&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mv &quot;$build_wic/$(basename &quot;${wks%.wks}&=
quot;)&quot;*.direct &quot;$out.wic&quot;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 IMAGE_CMD:wic[vardepsexclude] =3D &quot;WKS_FULL_PATH WKS_FILES =
TOPDIR&quot;<br>
&gt;=C2=A0 do_image_wic[cleandirs] =3D &quot;${WORKDIR}/build-wic&quot;<br>
&gt; diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/cl=
asses-recipe/rootfs-postcommands.bbclass<br>
&gt; index 690fa976aa..efc7c9562c 100644<br>
&gt; --- a/meta/classes-recipe/rootfs-postcommands.bbclass<br>
&gt; +++ b/meta/classes-recipe/rootfs-postcommands.bbclass<br>
&gt; @@ -37,7 +37,7 @@ APPEND:append =3D &#39;${@bb.utils.contains(&quot;IM=
AGE_FEATURES&quot;, &quot;read-only-rootfs&quot;, &quot; ro<br>
&gt;=C2=A0 ROOTFS_POSTPROCESS_COMMAND +=3D &quot;write_image_test_data; &qu=
ot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Write manifest<br>
&gt; -IMAGE_MANIFEST =3D &quot;${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SU=
FFIX}.manifest&quot;<br>
&gt; +IMAGE_MANIFEST =3D &quot;${IMGDEPLOYDIR}/${IMAGE_NAME}.manifest&quot;=
<br>
&gt;=C2=A0 ROOTFS_POSTUNINSTALL_COMMAND =3D+ &quot;write_image_manifest ; &=
quot;<br>
&gt;=C2=A0 # Set default postinst log file<br>
&gt;=C2=A0 POSTINST_LOGFILE ?=3D &quot;${localstatedir}/log/postinstall.log=
&quot;<br>
&gt; diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.b=
bclass<br>
&gt; index bd9e7e7445..f7abaf4f0c 100644<br>
&gt; --- a/meta/classes/cve-check.bbclass<br>
&gt; +++ b/meta/classes/cve-check.bbclass<br>
&gt; @@ -48,8 +48,8 @@ CVE_CHECK_LOG_JSON ?=3D &quot;${T}/cve.json&quot;<br=
>
&gt;=C2=A0 CVE_CHECK_DIR ??=3D &quot;${DEPLOY_DIR}/cve&quot;<br>
&gt;=C2=A0 CVE_CHECK_RECIPE_FILE ?=3D &quot;${CVE_CHECK_DIR}/${PN}&quot;<br=
>
&gt;=C2=A0 CVE_CHECK_RECIPE_FILE_JSON ?=3D &quot;${CVE_CHECK_DIR}/${PN}_cve=
.json&quot;<br>
&gt; -CVE_CHECK_MANIFEST ?=3D &quot;${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NA=
ME_SUFFIX}.cve&quot;<br>
&gt; -CVE_CHECK_MANIFEST_JSON ?=3D &quot;${IMGDEPLOYDIR}/${IMAGE_NAME}${IMA=
GE_NAME_SUFFIX}.json&quot;<br>
&gt; +CVE_CHECK_MANIFEST ?=3D &quot;${IMGDEPLOYDIR}/${IMAGE_NAME}.cve&quot;=
<br>
&gt; +CVE_CHECK_MANIFEST_JSON ?=3D &quot;${IMGDEPLOYDIR}/${IMAGE_NAME}.json=
&quot;<br>
&gt;=C2=A0 CVE_CHECK_COPY_FILES ??=3D &quot;1&quot;<br>
&gt;=C2=A0 CVE_CHECK_CREATE_MANIFEST ??=3D &quot;1&quot;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/=
selftest/cases/fitimage.py<br>
&gt; index 7bc171e02d..9383d0c4db 100644<br>
&gt; --- a/meta/lib/oeqa/selftest/cases/fitimage.py<br>
&gt; +++ b/meta/lib/oeqa/selftest/cases/fitimage.py<br>
&gt; @@ -33,6 +33,8 @@ KERNEL_CLASSES =3D &quot; kernel-fitimage &quot;<br>
&gt;=C2=A0 # RAM disk variables including load address and entrypoint for k=
ernel and RAM disk<br>
&gt;=C2=A0 IMAGE_FSTYPES +=3D &quot;cpio.gz&quot;<br>
&gt;=C2=A0 INITRAMFS_IMAGE =3D &quot;core-image-minimal&quot;<br>
&gt; +# core-image-minimal is used as initramfs here, drop the rootfs suffi=
x<br>
&gt; +IMAGE_NAME_SUFFIX:pn-core-image-minimal =3D &quot;&quot;<br>
&gt;=C2=A0 UBOOT_RD_LOADADDRESS =3D &quot;0x88000000&quot;<br>
&gt;=C2=A0 UBOOT_RD_ENTRYPOINT =3D &quot;0x88000000&quot;<br>
&gt;=C2=A0 UBOOT_LOADADDRESS =3D &quot;0x80080000&quot;<br>
&gt; diff --git a/meta/recipes-core/images/<a href=3D"http://build-applianc=
e-image_15.0.0.bb" rel=3D"noreferrer" target=3D"_blank">build-appliance-ima=
ge_15.0.0.bb</a> b/meta/recipes-core/images/<a href=3D"http://build-applian=
ce-image_15.0.0.bb" rel=3D"noreferrer" target=3D"_blank">build-appliance-im=
age_15.0.0.bb</a><br>
&gt; index c68a57e1db..06605507c3 100644<br>
&gt; --- a/meta/recipes-core/images/<a href=3D"http://build-appliance-image=
_15.0.0.bb" rel=3D"noreferrer" target=3D"_blank">build-appliance-image_15.0=
.0.bb</a><br>
&gt; +++ b/meta/recipes-core/images/<a href=3D"http://build-appliance-image=
_15.0.0.bb" rel=3D"noreferrer" target=3D"_blank">build-appliance-image_15.0=
.0.bb</a><br>
&gt; @@ -133,9 +133,9 @@ create_bundle_files () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${WORKDIR}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p Yocto_Build_Appliance<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cp *.vmx* Yocto_Build_Appliance<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_=
SUFFIX}.wic.vmdk Yocto_Build_Appliance/Yocto_Build_Appliance.vmdk<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_=
SUFFIX}.wic.vhdx Yocto_Build_Appliance/Yocto_Build_Appliance.vhdx<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_=
SUFFIX}.wic.vhd Yocto_Build_Appliance/Yocto_Build_Appliance.vhd<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}.wic.vmdk Yoc=
to_Build_Appliance/Yocto_Build_Appliance.vmdk<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}.wic.vhdx Yoc=
to_Build_Appliance/Yocto_Build_Appliance.vhdx<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}.wic.vhd Yoct=
o_Build_Appliance/Yocto_Build_Appliance.vhd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0zip -r ${IMGDEPLOYDIR}/Yocto_Build_Appliance=
-${DATETIME}.zip Yocto_Build_Appliance<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf Yocto_Build_Appliance-${DATETIME}.zip=
 ${IMGDEPLOYDIR}/Yocto_Build_Appliance.zip<br>
&gt;=C2=A0 }<br>
&gt; -- <br>
&gt; 2.40.1<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#181708): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/181708" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/181708</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99127017=
/3617179" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/99127017/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.belloni@boo=
tlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--000000000000e03ac405fca6054c--

