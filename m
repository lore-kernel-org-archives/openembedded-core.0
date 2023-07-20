Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49569EB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 10:21:55 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web11.9661.1689848512974058877
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 03:21:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Ndq+jcCh;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7835ae70e46so24946739f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 03:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689848512; x=1690453312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BaMaVqyYefoaOZzkE8M3B9lKV2zQc3DJeM7AFnWwYwk=;
        b=Ndq+jcChpbQVQwo/5MYQ0VqMRoCp+RfYq0W/v/zDb3YerKAuQAm7PtsVrI66vdBnLZ
         d5k/MkvjEcTF2R6NxjbOtx6C/OBefm3fLxtdx7fIupBzSfOP66Fe6Xd5Or4ruucdIOJk
         fTqKEj1RHIxyO03udBtDxv5R93Ey27DvH24Z686LSzdq6qaFn123aQM1EMm1e+fXeSez
         E4xkt9JgvHRRi6T8Urel24I69sxif2nbRxX7aWgAQbCEdzSKC/uxmQjV17mAuUjGsiX3
         6QwBNH9DpQqaryAQGBMhZoNr8O0Pjicr2goCJH3HV992UGAxJ/ctsLEMbdk8fdbBxSc+
         mqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689848512; x=1690453312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BaMaVqyYefoaOZzkE8M3B9lKV2zQc3DJeM7AFnWwYwk=;
        b=LSheGh+5Fcx2P8+xFPik/uatjEIlCzqBKck5V/sC3fi2gVHrN/2YKlpl8H3Q3FFyr0
         byQYBzCxLh/+rgnRkZtI2pUNtX7SrYhCrl2XDP4Yl2r18t8jWkJngBNN5tSWGLMIP2dz
         jyg8TLa8HotiBrm5AlAtokoDVKOAhi4HnOG7UfK4L5F8uT3IYYe+xRfa4byl/ETpSvx3
         ULLZCPGk/Bv6DWC5Rcs33UCB1M/TxQVI/dMV+9Wy1DhfWJkW49UVS7+xJMMoTL8/cBQY
         KKxYOLzVWI3AycqWNqubKb886J68V8GJf1ysakmwhVIrAYdAGj0lERTO/WQ2Lgh/UX5i
         Oblw==
X-Gm-Message-State: ABy/qLYu0Ko+J4eCQ4Cb+QaoC92mxwScPBxsjODvhs4TJIlJD2UOM3L6
	WatkYPPWEqIUlPiVkefFEw0CIj18S17jvx8C+Qw=
X-Google-Smtp-Source: APBJJlHmQ7qwqJv1LSBxD0ew+io3EW7UzUNhEPuUWctBD5bJcSuTPJBJ0/qRTFQeKrqYvtFShhmOo0PE/zcfuP7/kNA=
X-Received: by 2002:a6b:cf18:0:b0:783:58f4:2e2e with SMTP id
 o24-20020a6bcf18000000b0078358f42e2emr7414669ioa.0.1689848512105; Thu, 20 Jul
 2023 03:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230714140955.28052-1-alex.kiernan@gmail.com>
 <20230719123016beb329ff@mail.local> <177359505CCD363D.12709@lists.openembedded.org>
 <17735D2C3E01ECA8.30279@lists.openembedded.org>
In-Reply-To: <17735D2C3E01ECA8.30279@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 20 Jul 2023 11:21:41 +0100
Message-ID: <CAO5Uq5Q3gNBR-G1Zy7yrPYo3e6k-3hip=_W5-5zQJtKJDz+Tcg@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] eudev: Add group sgx to eudev package
To: alex.kiernan@gmail.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 10:21:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184629

On Wed, Jul 19, 2023 at 8:58=E2=80=AFPM Alex Kiernan via
lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Wed, Jul 19, 2023 at 7:48=E2=80=AFPM Alex Kiernan via
> lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > On Wed, Jul 19, 2023 at 1:30=E2=80=AFPM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > >
> > > Hello,
> > >
> > > I had a bit of trouble to find this but this causes the following
> > > oe-selftest failure:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/227=
4/steps/14/logs/stdio
> > >
> > > 2023-07-18 20:56:16,128 - oe-selftest - INFO - gdbserver.GdbServerTes=
t.test_gdb_server (subunit.RemotedTestCase)
> > > 2023-07-18 20:56:16,129 - oe-selftest - INFO -  ... ERROR
> > > Stderr:
> > > 2023-07-18 20:32:39,581 - oe-selftest - INFO - Adding: "include selft=
est.inc" in /home/pokybuild/yocto-worker/oe-selftest/build/build-st-836115/=
conf/local.conf
> > > 2023-07-18 20:32:39,582 - oe-selftest - INFO - Adding: "include bblay=
ers.inc" in bblayers.conf
> > > 2023-07-18 20:56:16,129 - oe-selftest - INFO - 14: 7/58 224/529 (269.=
86s) (0 failed) (gdbserver.GdbServerTest.test_gdb_server)
> > > 2023-07-18 20:56:16,129 - oe-selftest - INFO - testtools.testresult.r=
eal._StringException: Traceback (most recent call last):
> > >   File "/home/pokybuild/yocto-worker/oe-selftest/build/meta/lib/oeqa/=
selftest/cases/gdbserver.py", line 43, in test_gdb_server
> > >     shutil.unpack_archive(filename, debugfs)
> > >   File "/usr/lib64/python3.11/shutil.py", line 1323, in unpack_archiv=
e
> > >     func(filename, extract_dir, **kwargs)
> > >   File "/usr/lib64/python3.11/shutil.py", line 1244, in _unpack_tarfi=
le
> > >     tarobj.extractall(extract_dir, filter=3Dfilter)
> > >   File "/usr/lib64/python3.11/tarfile.py", line 2257, in extractall
> > >     self._extract_one(tarinfo, path, set_attrs=3Dnot tarinfo.isdir(),
> > >   File "/usr/lib64/python3.11/tarfile.py", line 2324, in _extract_one
> > >     self._handle_fatal_error(e)
> > >   File "/usr/lib64/python3.11/tarfile.py", line 2320, in _extract_one
> > >     self._extract_member(tarinfo, os.path.join(path, tarinfo.name),
> > >   File "/usr/lib64/python3.11/tarfile.py", line 2403, in _extract_mem=
ber
> > >     self.makefile(tarinfo, targetpath)
> > >   File "/usr/lib64/python3.11/tarfile.py", line 2448, in makefile
> > >     with bltn_open(targetpath, "wb") as target:
> > >          ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > PermissionError: [Errno 13] Permission denied: '/tmp/debugfs-j_xgxhkm=
/./etc/gshadow'
> > >
> >
> > That's interesting... really not sure why /etc/shadow doesn't trigger
> > this failure too (which is in the same set of tarballs). That said
> > I've no idea what the fix is, since this looks like collateral damage
> > rather than something which this change obviously broke. Will stare at
> > it a bit more.
> >
>
> If I read the pieces right, we do:
>
>         self._setup_dbg_rootfs(['/etc', '/var/lib/rpm',
> '/var/cache/dnf', '/var/lib/dnf'])
>
> I assume in order to prime the RPM config, which then copies gshadow
> (and the rest of /etc - ignoring that its not using ${sysconfdir}),
> which then causes this failure...
>
> Something like:
>
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index 890ba5f03984..a2e81afb4f09 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -162,6 +162,9 @@ class Rootfs(object, metaclass=3DABCMeta):
>              bb.note("  Install extra debug packages...")
>              self.pm.install(extra_debug_pkgs.split(), True)
>
> +        sysconfdir =3D self.image_rootfs + self.d.getVar('sysconfdir')
> +        shutil.rmtree(sysconfdir)
> +
>          bb.note("  Rename debug rootfs...")
>          try:
>              shutil.rmtree(self.image_rootfs + '-dbg')
>
> Would appear sensible, but it feels rather "nuclear" and is way out of
> my comfort zone of a proposed change!
>

Have sent a change to rework the way rpm is handled when building the
debugfs, which I think is the root cause of this failure.

> > > On 14/07/2023 15:09:55+0100, Alex Kiernan wrote:
> > > > Fix startup warning:
> > > >
> > > >   udevd[171]: specified group 'sgx' unknown
> > > >
> > > > This mirrors the change in bab455cd9b1b ("systemd: add group sgx to=
 udev
> > > > package") for systemd-udev.
> > > >
> > > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > > ---
> > > >
> > > >  meta/recipes-core/udev/eudev_3.2.12.bb | 5 ++++-
> > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/recipes-core/udev/eudev_3.2.12.bb b/meta/recipes-=
core/udev/eudev_3.2.12.bb
> > > > index 572ccecafd0c..4268bcc2c5de 100644
> > > > --- a/meta/recipes-core/udev/eudev_3.2.12.bb
> > > > +++ b/meta/recipes-core/udev/eudev_3.2.12.bb
> > > > @@ -18,7 +18,7 @@ SRC_URI[sha256sum] =3D "ccdd64ec3c381d3c3ed0e99d2=
e70d1f62988c7763de89ca7bdffafa5ea
> > > >
> > > >  GITHUB_BASE_URI =3D "https://github.com/eudev-project/eudev/releas=
es"
> > > >
> > > > -inherit autotools update-rc.d qemu pkgconfig features_check manpag=
es github-releases
> > > > +inherit autotools update-rc.d qemu pkgconfig features_check manpag=
es github-releases useradd
> > > >
> > > >  CONFLICT_DISTRO_FEATURES =3D "systemd"
> > > >
> > > > @@ -85,3 +85,6 @@ pkg_postinst:${PN}-hwdb () {
> > > >  pkg_prerm:${PN}-hwdb () {
> > > >       rm -f $D${sysconfdir}/udev/hwdb.bin
> > > >  }
> > > > +
> > > > +USERADD_PACKAGES =3D "${PN}"
> > > > +GROUPADD_PARAM:${PN} =3D "-r sgx"
> > > > --
> > > > 2.39.0
> > > >
> > >
> > > >
> > > >
> > > >
> > >
> > >
> > > --
> > > Alexandre Belloni, co-owner and COO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
> >
> >
> >
> > --
> > Alex Kiernan
> >
> >
> >
>
>
> --
> Alex Kiernan
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184600): https://lists.openembedded.org/g/openembedde=
d-core/message/184600
> Mute This Topic: https://lists.openembedded.org/mt/100141828/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Alex Kiernan

