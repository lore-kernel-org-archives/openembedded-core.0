Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D2EC00A8F
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 04:12:46 +0000 (UTC)
Subject: Re: [PATCH V5] kbd:Add ptest support
To: openembedded-core@lists.openembedded.org
From: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
X-Originating-Location: CN (223.111.68.150)
X-Originating-Platform: Windows Chrome 117
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 23 Oct 2023 21:12:45 -0700
References: <CANNYZj9rnOQ8BugHMLMzEGqFdHtHL+SkFmDjLvgNo8adO4VHVw@mail.gmail.com>
In-Reply-To: <CANNYZj9rnOQ8BugHMLMzEGqFdHtHL+SkFmDjLvgNo8adO4VHVw@mail.gmail.com>
Message-ID: <6763.1698120765303220209@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="cKFse2j3jDPSVjq8Vltu"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 04:12:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189635

--cKFse2j3jDPSVjq8Vltu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi=EF=BC=8C Alex

As you said, it is not-that-elegant bit of code.
But DATADIR is used as a part of CPPFLAGS for compiling c files in tests,
such as libkeymap/libkeymap-test01.c, libkbdfile/libkbdfile-test13.c and ot=
hers.
sample:

>=20
> libkeymap/libkeymap-test01.c: f =3D fopen( *DATADIR* "/data/libkeymap/cha=
rset-keymap0.map",
> "r"); libkeymap/libkeymap-test09.c:=C2=A0 =C2=A0setenv("LOADKEYS_INCLUDE_=
PATH",
> DATADIR "/data/libkeymap", 1);

libkeymap/ Makefile: (before reset)

>=20
> AM_CPPFLAGS =3D \
> $(CODE_COVERAGE_CPPFLAGS) \
> -I$(top_srcdir)/src/libcommon \
> -I$(top_srcdir)/src/libkbdfile \
> -I$(top_srcdir)/src/libkeymap \
> -DDATADIR=3D\"$(realpath $(top_srcdir))/tests\" \
> -DBUILDDIR=3D\"$(realpath $(builddir))\"
>=20

Best Regards,
Qiu Tingting

--cKFse2j3jDPSVjq8Vltu
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi=EF=BC=8C<span style=3D"white-space-collapse: preserve;">Alex<br /><br />=
As you said, it is </span><span style=3D"white-space-collapse: preserve;">n=
ot-that-elegant bit of code.</span><span style=3D"white-space-collapse: pre=
serve;"><br />But DATADIR is used as a part of </span>CPPFLAGS for compilin=
g<span style=3D"white-space-collapse: preserve;"> c files in tests, <br />s=
uch as libkeymap/libkeymap-test01.c, libkbdfile/libkbdfile-test13.c and oth=
ers.</span><br /><span style=3D"white-space-collapse: preserve;">sample:</s=
pan><br />
<blockquote><span style=3D"white-space-collapse: preserve;">libkeymap/libke=
ymap-test01.c: f =3D fopen(<strong>DATADIR</strong> "/data/libkeymap/charse=
t-keymap0.map", "r"); </span>libkeymap/libkeymap-test09.c:&nbsp; &nbsp;sete=
nv("LOADKEYS_INCLUDE_PATH", DATADIR "/data/libkeymap", 1);</blockquote>
<br /><span style=3D"white-space-collapse: preserve;">libkeymap/</span>Make=
file: (before reset)<br />
<blockquote>
<div>AM_CPPFLAGS =3D \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; $(CODE_COVERAGE_CPPFLAGS) \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; -I$(top_srcdir)/src/libcommon \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; -I$(top_srcdir)/src/libkbdfile \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; -I$(top_srcdir)/src/libkeymap \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; -DDATADIR=3D\"$(realpath $(top_srcdir))/te=
sts\" \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; -DBUILDDIR=3D\"$(realpath $(builddir))\"</=
div>
</blockquote>
<div>&nbsp;</div>
<span style=3D"white-space-collapse: preserve;">Best Regards,</span><br /><=
span style=3D"white-space-collapse: preserve;">Qiu Tingting</span>

--cKFse2j3jDPSVjq8Vltu--

