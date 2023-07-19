Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB578C0015E
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 19:58:56 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.5101.1689796729596619343
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 12:58:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rfXfWyDY;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-78363cc070aso397889239f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 12:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689796729; x=1692388729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJcHH6itQ6T7i+dv3ihYaQQAi7xM8HEAyWi6Rw0XB6s=;
        b=rfXfWyDY2a5R12I3zPx1u6cY3Va3RwO1fT4itKb21GHICM26B3psjDe6bDCNWm4ue9
         JqhUrL9lw3nk53X5HuK++z4PLC0TyHlszooFY3TtOlSgLdJURE8QODluPjJ/gC/Hk72E
         TbB5VJcl3i2NtlJwJ5bXCVChNVttynhO0kKH6a9JAI/2fYHkvPpidRx2XfwB0s0xHT0e
         /n9Fik+04InWIph0TTJLkzrMjXLenr4HEMYSJCzvEFo+raao5PcuGc48dPgkZfakW+4Q
         8VL2SIctYgfRfRkopxdfxXUVBMuFTVLXR8VMpZ0h3T7KHt1m9qrBnj8sfPWt2PMxu1OU
         qHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689796729; x=1692388729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJcHH6itQ6T7i+dv3ihYaQQAi7xM8HEAyWi6Rw0XB6s=;
        b=MhvoGQ/mN6V1Xi+RGMfxvzQfzzR6kGhdAzUpKDHDDow5m5uwU6f63J4p07dlAffc5E
         DwrGK9WEEi5l8/fBR8TdJ1/0DeyfMv+DdXjnvqha7rP40hPtT9MKtQGzW7ObAv36FShb
         WS+S+POkAwaMew1tJiuh24ks17TEL9B5SdG3KGnKVLTd2oRw+3dCQ20igzVCxKO0i368
         2vNWoCie4/2PYvbT2ZQVUbvVV7nD1xVoKQa1F3OqWfYIb/VJNoUo6miymjj5zExYKxwg
         dRiH0kwN1D2o5UbRwuW5S3twWLo2WarkPAs9RWNHhxfR0dylvtB7zQ8ntPQMppf/Lfd+
         WKrw==
X-Gm-Message-State: ABy/qLaC5OdUDq4+9dYXQVyiLgPb903YD8RwGCDYTzNmP8go6ZEoe+s+
	mgfJ88Zu/U0mVpJlitIzfvW1ElR204jfoyOSZgU=
X-Google-Smtp-Source: APBJJlEw7lQKGa2duaGWoenkpHOpCN3/gT0SJfuVRWow2ZeKzb3BSnEL2JfjdzopcdbGOAysOks0+zXUj6dlh8Ey8J4=
X-Received: by 2002:a6b:750f:0:b0:783:72d4:8c38 with SMTP id
 l15-20020a6b750f000000b0078372d48c38mr3451377ioh.13.1689796728661; Wed, 19
 Jul 2023 12:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230714140955.28052-1-alex.kiernan@gmail.com>
 <20230719123016beb329ff@mail.local> <177359505CCD363D.12709@lists.openembedded.org>
In-Reply-To: <177359505CCD363D.12709@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 19 Jul 2023 20:58:37 +0100
Message-ID: <CAO5Uq5RTe1TrKXR5yPRkkfVr24L9FupGy5tS2S00kONnTHoz3w@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] eudev: Add group sgx to eudev package
To: alex.kiernan@gmail.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 19:58:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184600

On Wed, Jul 19, 2023 at 7:48=E2=80=AFPM Alex Kiernan via
lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Wed, Jul 19, 2023 at 1:30=E2=80=AFPM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > Hello,
> >
> > I had a bit of trouble to find this but this causes the following
> > oe-selftest failure:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/2274/=
steps/14/logs/stdio
> >
> > 2023-07-18 20:56:16,128 - oe-selftest - INFO - gdbserver.GdbServerTest.=
test_gdb_server (subunit.RemotedTestCase)
> > 2023-07-18 20:56:16,129 - oe-selftest - INFO -  ... ERROR
> > Stderr:
> > 2023-07-18 20:32:39,581 - oe-selftest - INFO - Adding: "include selftes=
t.inc" in /home/pokybuild/yocto-worker/oe-selftest/build/build-st-836115/co=
nf/local.conf
> > 2023-07-18 20:32:39,582 - oe-selftest - INFO - Adding: "include bblayer=
s.inc" in bblayers.conf
> > 2023-07-18 20:56:16,129 - oe-selftest - INFO - 14: 7/58 224/529 (269.86=
s) (0 failed) (gdbserver.GdbServerTest.test_gdb_server)
> > 2023-07-18 20:56:16,129 - oe-selftest - INFO - testtools.testresult.rea=
l._StringException: Traceback (most recent call last):
> >   File "/home/pokybuild/yocto-worker/oe-selftest/build/meta/lib/oeqa/se=
lftest/cases/gdbserver.py", line 43, in test_gdb_server
> >     shutil.unpack_archive(filename, debugfs)
> >   File "/usr/lib64/python3.11/shutil.py", line 1323, in unpack_archive
> >     func(filename, extract_dir, **kwargs)
> >   File "/usr/lib64/python3.11/shutil.py", line 1244, in _unpack_tarfile
> >     tarobj.extractall(extract_dir, filter=3Dfilter)
> >   File "/usr/lib64/python3.11/tarfile.py", line 2257, in extractall
> >     self._extract_one(tarinfo, path, set_attrs=3Dnot tarinfo.isdir(),
> >   File "/usr/lib64/python3.11/tarfile.py", line 2324, in _extract_one
> >     self._handle_fatal_error(e)
> >   File "/usr/lib64/python3.11/tarfile.py", line 2320, in _extract_one
> >     self._extract_member(tarinfo, os.path.join(path, tarinfo.name),
> >   File "/usr/lib64/python3.11/tarfile.py", line 2403, in _extract_membe=
r
> >     self.makefile(tarinfo, targetpath)
> >   File "/usr/lib64/python3.11/tarfile.py", line 2448, in makefile
> >     with bltn_open(targetpath, "wb") as target:
> >          ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > PermissionError: [Errno 13] Permission denied: '/tmp/debugfs-j_xgxhkm/.=
/etc/gshadow'
> >
>
> That's interesting... really not sure why /etc/shadow doesn't trigger
> this failure too (which is in the same set of tarballs). That said
> I've no idea what the fix is, since this looks like collateral damage
> rather than something which this change obviously broke. Will stare at
> it a bit more.
>

If I read the pieces right, we do:

        self._setup_dbg_rootfs(['/etc', '/var/lib/rpm',
'/var/cache/dnf', '/var/lib/dnf'])

I assume in order to prime the RPM config, which then copies gshadow
(and the rest of /etc - ignoring that its not using ${sysconfdir}),
which then causes this failure...

Something like:

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 890ba5f03984..a2e81afb4f09 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -162,6 +162,9 @@ class Rootfs(object, metaclass=3DABCMeta):
             bb.note("  Install extra debug packages...")
             self.pm.install(extra_debug_pkgs.split(), True)

+        sysconfdir =3D self.image_rootfs + self.d.getVar('sysconfdir')
+        shutil.rmtree(sysconfdir)
+
         bb.note("  Rename debug rootfs...")
         try:
             shutil.rmtree(self.image_rootfs + '-dbg')

Would appear sensible, but it feels rather "nuclear" and is way out of
my comfort zone of a proposed change!

> > On 14/07/2023 15:09:55+0100, Alex Kiernan wrote:
> > > Fix startup warning:
> > >
> > >   udevd[171]: specified group 'sgx' unknown
> > >
> > > This mirrors the change in bab455cd9b1b ("systemd: add group sgx to u=
dev
> > > package") for systemd-udev.
> > >
> > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > ---
> > >
> > >  meta/recipes-core/udev/eudev_3.2.12.bb | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-core/udev/eudev_3.2.12.bb b/meta/recipes-co=
re/udev/eudev_3.2.12.bb
> > > index 572ccecafd0c..4268bcc2c5de 100644
> > > --- a/meta/recipes-core/udev/eudev_3.2.12.bb
> > > +++ b/meta/recipes-core/udev/eudev_3.2.12.bb
> > > @@ -18,7 +18,7 @@ SRC_URI[sha256sum] =3D "ccdd64ec3c381d3c3ed0e99d2e7=
0d1f62988c7763de89ca7bdffafa5ea
> > >
> > >  GITHUB_BASE_URI =3D "https://github.com/eudev-project/eudev/releases=
"
> > >
> > > -inherit autotools update-rc.d qemu pkgconfig features_check manpages=
 github-releases
> > > +inherit autotools update-rc.d qemu pkgconfig features_check manpages=
 github-releases useradd
> > >
> > >  CONFLICT_DISTRO_FEATURES =3D "systemd"
> > >
> > > @@ -85,3 +85,6 @@ pkg_postinst:${PN}-hwdb () {
> > >  pkg_prerm:${PN}-hwdb () {
> > >       rm -f $D${sysconfdir}/udev/hwdb.bin
> > >  }
> > > +
> > > +USERADD_PACKAGES =3D "${PN}"
> > > +GROUPADD_PARAM:${PN} =3D "-r sgx"
> > > --
> > > 2.39.0
> > >
> >
> > >
> > >
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
>
>
> --
> Alex Kiernan
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184593): https://lists.openembedded.org/g/openembedde=
d-core/message/184593
> Mute This Topic: https://lists.openembedded.org/mt/100141828/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Alex Kiernan

