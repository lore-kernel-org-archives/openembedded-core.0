Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C7A7C001B0
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 18:48:16 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.3444.1689792486706846107
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 11:48:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Mzv9T0n+;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7835e5fa459so310236639f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 11:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689792486; x=1692384486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOC44+9YX/vsMnZVAelzBeo4BU6JATVesxeeQf8zkMQ=;
        b=Mzv9T0n+odjfdLLxs92d95F58xQSxzQ8ZUqUppknHxMvKxhx90zjgUieaT5STNulsB
         /RcQ/4KVH9EsP+d43z3zieSSgUkn20M6gmRVK6UMoy9FMiNxB3PTOhSUoD3NA3PaqWTt
         Vi9tUVkJydlaBEibcuLbw5AAgRGng2hEul+9hCZSbmNfhFJ4+MrJwxwywQAGxdjSXrtT
         gYTLsf7UWfZ7xKnAyFS6uEuuyuWGIjJSsCKDl9+LiBrWgp3pjlGWtc5awzokZIodFQ1R
         SxNjqewP3l8JtTw/RZSSuR0oDMuFaj3tF73iLpkqWecXoXfLOxtbjmGHnLPempJZcgvA
         QFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689792486; x=1692384486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOC44+9YX/vsMnZVAelzBeo4BU6JATVesxeeQf8zkMQ=;
        b=U6Z6MqWHQ6e0oQ/JOZDifmHA/VXbVSVlvHsPnQeV5+Cfq/nojsL5Zgbur9KE5MvmN/
         pyAz8TXnef2x1WIhL1M4ilZSJ27MC0y/i/5g9b3XHUx3yU2xXxlVwpMKVYoQbwUL55qG
         MsaLL48F6TSZHuifrA2afBBx3Cb+v5AzOs5AirP4ql74SnbsbrDggIpGy/TN+A2sW1FA
         pZw0lgNynaztVAVCBZujmRGy6vxuPs0x7HO+ghKnjWeqkEWqo2Lwe0/Ak3zoafs2Lgg6
         vZh2TxZQr5SiMjh17wmSzw9FFRJ3MxHBZ7hJTSOk9tWvkmh4qFK5ybXAM510ehSUAzMg
         bztw==
X-Gm-Message-State: ABy/qLaSVciSjVR6o8+h1jdcgZHb5P7+ZdsEuBZtED+l4BH9qc2BYqpu
	94xTcOZNinMK/ihkrSQCZmHkf5OdiLV+xdpRLn8Q+iBB
X-Google-Smtp-Source: APBJJlHSQteKWtl8wV7us8zi3SZAHQnAbUfKdN0tInCVa/i7NL+IL7wmiMZPH7BIdcqkR6AfRglL7h8DUtRJS8ZQzcw=
X-Received: by 2002:a5e:c912:0:b0:786:fd8e:760b with SMTP id
 z18-20020a5ec912000000b00786fd8e760bmr315276iol.11.1689792485627; Wed, 19 Jul
 2023 11:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230714140955.28052-1-alex.kiernan@gmail.com> <20230719123016beb329ff@mail.local>
In-Reply-To: <20230719123016beb329ff@mail.local>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 19 Jul 2023 19:47:55 +0100
Message-ID: <CAO5Uq5TncjdurCdc3U_jFbSNeOFd5EuTPC8xyngxOtvgFamxYw@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] eudev: Add group sgx to eudev package
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 18:48:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184593

On Wed, Jul 19, 2023 at 1:30=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> I had a bit of trouble to find this but this causes the following
> oe-selftest failure:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/2274/st=
eps/14/logs/stdio
>
> 2023-07-18 20:56:16,128 - oe-selftest - INFO - gdbserver.GdbServerTest.te=
st_gdb_server (subunit.RemotedTestCase)
> 2023-07-18 20:56:16,129 - oe-selftest - INFO -  ... ERROR
> Stderr:
> 2023-07-18 20:32:39,581 - oe-selftest - INFO - Adding: "include selftest.=
inc" in /home/pokybuild/yocto-worker/oe-selftest/build/build-st-836115/conf=
/local.conf
> 2023-07-18 20:32:39,582 - oe-selftest - INFO - Adding: "include bblayers.=
inc" in bblayers.conf
> 2023-07-18 20:56:16,129 - oe-selftest - INFO - 14: 7/58 224/529 (269.86s)=
 (0 failed) (gdbserver.GdbServerTest.test_gdb_server)
> 2023-07-18 20:56:16,129 - oe-selftest - INFO - testtools.testresult.real.=
_StringException: Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/oe-selftest/build/meta/lib/oeqa/self=
test/cases/gdbserver.py", line 43, in test_gdb_server
>     shutil.unpack_archive(filename, debugfs)
>   File "/usr/lib64/python3.11/shutil.py", line 1323, in unpack_archive
>     func(filename, extract_dir, **kwargs)
>   File "/usr/lib64/python3.11/shutil.py", line 1244, in _unpack_tarfile
>     tarobj.extractall(extract_dir, filter=3Dfilter)
>   File "/usr/lib64/python3.11/tarfile.py", line 2257, in extractall
>     self._extract_one(tarinfo, path, set_attrs=3Dnot tarinfo.isdir(),
>   File "/usr/lib64/python3.11/tarfile.py", line 2324, in _extract_one
>     self._handle_fatal_error(e)
>   File "/usr/lib64/python3.11/tarfile.py", line 2320, in _extract_one
>     self._extract_member(tarinfo, os.path.join(path, tarinfo.name),
>   File "/usr/lib64/python3.11/tarfile.py", line 2403, in _extract_member
>     self.makefile(tarinfo, targetpath)
>   File "/usr/lib64/python3.11/tarfile.py", line 2448, in makefile
>     with bltn_open(targetpath, "wb") as target:
>          ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> PermissionError: [Errno 13] Permission denied: '/tmp/debugfs-j_xgxhkm/./e=
tc/gshadow'
>

That's interesting... really not sure why /etc/shadow doesn't trigger
this failure too (which is in the same set of tarballs). That said
I've no idea what the fix is, since this looks like collateral damage
rather than something which this change obviously broke. Will stare at
it a bit more.

> On 14/07/2023 15:09:55+0100, Alex Kiernan wrote:
> > Fix startup warning:
> >
> >   udevd[171]: specified group 'sgx' unknown
> >
> > This mirrors the change in bab455cd9b1b ("systemd: add group sgx to ude=
v
> > package") for systemd-udev.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> >  meta/recipes-core/udev/eudev_3.2.12.bb | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/udev/eudev_3.2.12.bb b/meta/recipes-core=
/udev/eudev_3.2.12.bb
> > index 572ccecafd0c..4268bcc2c5de 100644
> > --- a/meta/recipes-core/udev/eudev_3.2.12.bb
> > +++ b/meta/recipes-core/udev/eudev_3.2.12.bb
> > @@ -18,7 +18,7 @@ SRC_URI[sha256sum] =3D "ccdd64ec3c381d3c3ed0e99d2e70d=
1f62988c7763de89ca7bdffafa5ea
> >
> >  GITHUB_BASE_URI =3D "https://github.com/eudev-project/eudev/releases"
> >
> > -inherit autotools update-rc.d qemu pkgconfig features_check manpages g=
ithub-releases
> > +inherit autotools update-rc.d qemu pkgconfig features_check manpages g=
ithub-releases useradd
> >
> >  CONFLICT_DISTRO_FEATURES =3D "systemd"
> >
> > @@ -85,3 +85,6 @@ pkg_postinst:${PN}-hwdb () {
> >  pkg_prerm:${PN}-hwdb () {
> >       rm -f $D${sysconfdir}/udev/hwdb.bin
> >  }
> > +
> > +USERADD_PACKAGES =3D "${PN}"
> > +GROUPADD_PARAM:${PN} =3D "-r sgx"
> > --
> > 2.39.0
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#184267): https://lists.openembedded.org/g/openembed=
ded-core/message/184267
> > Mute This Topic: https://lists.openembedded.org/mt/100141828/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--
Alex Kiernan

