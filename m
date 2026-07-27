Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABC0C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 08:13:54 +0000 (UTC)
Subject: Re: [PATCH v9 0/8] rpm: 4.20.1 -> 6.0.2
To: openembedded-core@lists.openembedded.org
From: "Adam Duskett" <adam.duskett@amarulasolutions.com>
X-Originating-Location: Almere Stad, Flevoland, NL (77.250.178.78)
X-Originating-Platform: Linux Firefox 153
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 27 Jul 2026 01:13:52 -0700
References: <CANNYZj-hrPf-CVJwTaEJ6dgUuWnipYKKiPZ3r_t1_HPYhCKvYg@mail.gmail.com> <20260724200424.954199-1-sumanth.gavini@windriver.com> <795cb8804b9aaed451b12b6691c2f0d584e9bb62.camel@linuxfoundation.org>
In-Reply-To: <795cb8804b9aaed451b12b6691c2f0d584e9bb62.camel@linuxfoundation.org>
Message-ID: <1062711.1785140032111276477@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="LtqL13sQO6iuS96nFmCN"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 08:13:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242061

--LtqL13sQO6iuS96nFmCN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I also get libarchive ptest building failures:
```
sections -fdata-sections -fvisibility=3Dhidden -D__LIBARCHIVE_ENABLE_VISIBI=
LITY -c -o libarchive/test/test-test_sparse_basic.o `test -f 'libarchive/te=
st/test_sparse_basic.c' || echo '../sources/libarchive-3.8.8/'`libarchive/t=
est/test_sparse_basic.c
| ../sources/libarchive-3.8.8/libarchive/test/test_read_set_format.c: In fu=
nction 'test_read_append_rpm_filter':
| ../sources/libarchive-3.8.8/libarchive/test/test_read_set_format.c:353:37=
: error: 'ARCHIVE_FILTER_RPM' undeclared (first use in this function); did =
you mean 'ARCHIVE_FILTER_UU'?
| =C2=A0=C2=A0353 | =C2=A0=C2=A0r =3D archive_read_append_filter(a, ARCHIVE=
_FILTER_RPM);
| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^~~~~~~~~~~~~~~~~~
| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ARCHIVE_FILTER_UU
| ../sources/libarchive-3.8.8/libarchive/test/test_read_set_format.c:353:37=
: note: each undeclared identifier is reported only once for each function =
it appears in
| make[2]: *** [Makefile:15465: libarchive/test/test-test_read_set_format.o=
] Error 1
```

--LtqL13sQO6iuS96nFmCN
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>I also get libarchive ptest building failures:</div>
<div>```</div>
<div><span style=3D"font-family: monospace;"><span style=3D"color: #000000;=
 background-color: #ffffff;" data-darkreader-inline-color=3D"" data-darkrea=
der-inline-bgcolor=3D"">sections -fdata-sections -fvisibility=3Dhidden -D__=
LIBARCHIVE_ENABLE_VISIBILITY -c -o libarchive/test/test-test_sparse_basic.o=
 `test -f 'libarchive/test/test_sparse_basic.c' || echo '../sources/libarch=
ive-3.8.8/'`libarchive/test/test_sparse_basic.c</span><span style=3D"color:=
 #000000; background-color: #ffffff;" data-darkreader-inline-color=3D"" dat=
a-darkreader-inline-bgcolor=3D""> </span><br /><span style=3D"color: #00000=
0; background-color: #ffffff;" data-darkreader-inline-color=3D"" data-darkr=
eader-inline-bgcolor=3D"">| ../sources/libarchive-3.8.8/libarchive/test/tes=
t_read_set_format.c: In function 'test_read_append_rpm_filter':</span><span=
 style=3D"color: #000000; background-color: #ffffff;" data-darkreader-inlin=
e-color=3D"" data-darkreader-inline-bgcolor=3D""> </span><br /><span style=
=3D"color: #000000; background-color: #ffffff;" data-darkreader-inline-colo=
r=3D"" data-darkreader-inline-bgcolor=3D"">| ../sources/libarchive-3.8.8/li=
barchive/test/test_read_set_format.c:353:37: error: 'ARCHIVE_FILTER_RPM' un=
declared (first use in this function); did you mean 'ARCHIVE_FILTER_UU'?</s=
pan><span style=3D"color: #000000; background-color: #ffffff;" data-darkrea=
der-inline-color=3D"" data-darkreader-inline-bgcolor=3D""> </span><br /><sp=
an style=3D"color: #000000; background-color: #ffffff;" data-darkreader-inl=
ine-color=3D"" data-darkreader-inline-bgcolor=3D"">| &nbsp;&nbsp;353 | &nbs=
p;&nbsp;r =3D archive_read_append_filter(a, ARCHIVE_FILTER_RPM);</span><spa=
n style=3D"color: #000000; background-color: #ffffff;" data-darkreader-inli=
ne-color=3D"" data-darkreader-inline-bgcolor=3D""> </span><br /><span style=
=3D"color: #000000; background-color: #ffffff;" data-darkreader-inline-colo=
r=3D"" data-darkreader-inline-bgcolor=3D"">| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;^=
~~~~~~~~~~~~~~~~~</span><span style=3D"color: #000000; background-color: #f=
fffff;" data-darkreader-inline-color=3D"" data-darkreader-inline-bgcolor=3D=
""> </span><br /><span style=3D"color: #000000; background-color: #ffffff;"=
 data-darkreader-inline-color=3D"" data-darkreader-inline-bgcolor=3D"">| &n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;ARCHIVE_FILTER_UU</span><span style=3D"color: #0=
00000; background-color: #ffffff;" data-darkreader-inline-color=3D"" data-d=
arkreader-inline-bgcolor=3D""> </span><br /><span style=3D"color: #000000; =
background-color: #ffffff;" data-darkreader-inline-color=3D"" data-darkread=
er-inline-bgcolor=3D"">| ../sources/libarchive-3.8.8/libarchive/test/test_r=
ead_set_format.c:353:37: note: each undeclared identifier is reported only =
once for each function it appears in</span><span style=3D"color: #000000; b=
ackground-color: #ffffff;" data-darkreader-inline-color=3D"" data-darkreade=
r-inline-bgcolor=3D""> </span><br /><span style=3D"color: #000000; backgrou=
nd-color: #ffffff;" data-darkreader-inline-color=3D"" data-darkreader-inlin=
e-bgcolor=3D"">| make[2]: *** [Makefile:15465: libarchive/test/test-test_re=
ad_set_format.o] Error 1</span><br /><span style=3D"color: #000000; backgro=
und-color: #ffffff;" data-darkreader-inline-color=3D"" data-darkreader-inli=
ne-bgcolor=3D""></span>```</span></div>
<div>&nbsp;</div>
<div>&nbsp;</div>

--LtqL13sQO6iuS96nFmCN--

