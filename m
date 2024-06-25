Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8D8C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 18:41:04 +0000 (UTC)
Subject: Re: [PATCH] gobject-introspection: split tools and giscanner into a separate package
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudnimar@noxmedical.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 25 Jun 2024 11:41:02 -0700
References: <CANNYZj-sOYcMDhuMhrqOLUw_BrHnkBbW+9=b_jRZD30FvKFYzg@mail.gmail.com>
In-Reply-To: <CANNYZj-sOYcMDhuMhrqOLUw_BrHnkBbW+9=b_jRZD30FvKFYzg@mail.gmail.com>
Message-ID: <8366.1719340862322463704@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="s3dGI1DdyUlDe7wow7jd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 18:41:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201142

--s3dGI1DdyUlDe7wow7jd
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 09:02 AM, Alexander Kanavin wrote:

>=20
>=20
>> +RDEPENDS:${PN} =3D "python3-pickle python3-xml glib-2.0"
>=20
> I guess pickle and xml modules, and glib are needed only by the tools
> as well, so they should be moving to RDEPENDS:${PN}-tools too?

Hi Alex, after fixing the issue mentioned by Alexandre above, it looks like=
 we must keep glib-2.0 in RDEPENDS:${PN}.

Otherwise I get this error:
ERROR: gobject-introspection-1.80.1-r0 do_package_qa: QA Issue: /usr/lib/li=
bgirepository-1.0.so.1.0.0 contained in package gobject-introspection requi=
res libglib-2.0.so.0()(64bit), but no providers found in RDEPENDS:gobject-i=
ntrospection? [file-rdeps]
ERROR: gobject-introspection-1.80.1-r0 do_package_qa: QA Issue: /usr/lib/li=
bgirepository-1.0.so.1.0.0 contained in package gobject-introspection requi=
res libgobject-2.0.so.0()(64bit), but no providers found in RDEPENDS:gobjec=
t-introspection? [file-rdeps]
ERROR: gobject-introspection-1.80.1-r0 do_package_qa: QA Issue: /usr/lib/li=
bgirepository-1.0.so.1.0.0 contained in package gobject-introspection requi=
res libgmodule-2.0.so.0()(64bit), but no providers found in RDEPENDS:gobjec=
t-introspection? [file-rdeps]
ERROR: gobject-introspection-1.80.1-r0 do_package_qa: Fatal QA errors were =
found, failing task.
ERROR: Logfile of failure stored in: /home/builder/yocto/build/tmp-glibc/wo=
rk/core2-64-oe-linux/gobject-introspection/1.80.1/temp/log.do_package_qa.13=
75416
ERROR: Task (/home/builder/yocto/layers/openembedded-core/meta/recipes-gnom=
e/gobject-introspection/gobject-introspection_1.80.1.bb:do_package_qa) fail=
ed with exit code '1'

----

Moving python3-pickle and python3-xml to RDEPENDS:${PN}-tools seems to be O=
K.

--s3dGI1DdyUlDe7wow7jd
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 09:02 AM, Alexander Kanavin wrote:<br />
<blockquote>
<blockquote>+RDEPENDS:${PN} =3D "python3-pickle python3-xml glib-2.0"</bloc=
kquote>
I guess pickle and xml modules, and glib are needed only by the tools<br />=
as well, so they should be moving to RDEPENDS:${PN}-tools too?</blockquote>
Hi Alex, after fixing the issue mentioned by Alexandre above, it looks like=
 we must keep glib-2.0 in RDEPENDS:${PN}.&nbsp;<br /><br />Otherwise I get =
this error:<br />ERROR: gobject-introspection-1.80.1-r0 do_package_qa: QA I=
ssue: /usr/lib/libgirepository-1.0.so.1.0.0 contained in package gobject-in=
trospection requires libglib-2.0.so.0()(64bit), but no providers found in R=
DEPENDS:gobject-introspection? [file-rdeps]<br />ERROR: gobject-introspecti=
on-1.80.1-r0 do_package_qa: QA Issue: /usr/lib/libgirepository-1.0.so.1.0.0=
 contained in package gobject-introspection requires libgobject-2.0.so.0()(=
64bit), but no providers found in RDEPENDS:gobject-introspection? [file-rde=
ps]<br />ERROR: gobject-introspection-1.80.1-r0 do_package_qa: QA Issue: /u=
sr/lib/libgirepository-1.0.so.1.0.0 contained in package gobject-introspect=
ion requires libgmodule-2.0.so.0()(64bit), but no providers found in RDEPEN=
DS:gobject-introspection? [file-rdeps]<br />ERROR: gobject-introspection-1.=
80.1-r0 do_package_qa: Fatal QA errors were found, failing task.<br />ERROR=
: Logfile of failure stored in: /home/builder/yocto/build/tmp-glibc/work/co=
re2-64-oe-linux/gobject-introspection/1.80.1/temp/log.do_package_qa.1375416=
<br />ERROR: Task (/home/builder/yocto/layers/openembedded-core/meta/recipe=
s-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_package_qa=
) failed with exit code '1'<br /><br />----<br /><br />Moving python3-pickl=
e and python3-xml to RDEPENDS:${PN}-tools seems to be OK.

--s3dGI1DdyUlDe7wow7jd--

