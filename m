Return-Path: <vvavrychuk@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07BCCC433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 17:44:48 +0000 (UTC)
Subject: ERROR: Task (.../kernel-module-something.bb:do_package) failed with
 exit code '134'
To: openembedded-core@lists.openembedded.org
From: "Vasyl Vavrychuk" <vvavrychuk@gmail.com>
X-Originating-Location: Lviv, Lviv Oblast, UA (185.145.182.46)
X-Originating-Platform: Windows Chrome 94
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 27 Sep 2021 10:44:47 -0700
Message-ID: <W5wi.1632764687377274770.mOgu@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="AO2cut73mj9ORNoH4leC"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Sep 2021 17:44:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156395

--AO2cut73mj9ORNoH4leC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I have external kernel module recipe, let's call it=C2=A0kernel-module-some=
thing.bb.

Sometimes, it fails with

ERROR: Task (.../kernel-module-something.bb:do_package) failed with exit co=
de '134'

I have checked=C2=A0pseudo.log, it looks like this

inode mismatch: '.../kernel-module-something/1.0-r0/image/lib/modules/5.10.=
25-yocto-standard/extra/something.ko' ino 240205743 in db, 240631184 in req=
uest.
creat ignored for existing file '.../kernel-module-something/1.0-r0/image/l=
ib/modules/5.10.25-yocto-standard/extra/something.ko'.
inode mismatch: '.../kernel-module-something/1.0-r0/image/lib/modules/5.10.=
25-yocto-standard/extra/something.ko' ino 240205743 in db, 240631184 in req=
uest.
...
a lot of inode mismatch prints
...
inode mismatch: '.../kernel-module-something/1.0-r0/sstate-build-package/pa=
ckage/lib/modules/5.10.25-yocto-standard/extra/something.ko' ino 240207118 =
in db, 240631442 in request.
path mismatch [2 links]: ino 240631442 db '.../kernel-module-something/1.0-=
r0/sstate-build-package/packages-split/kernel-module-something-5.10.25-yoct=
o-standard/lib/modules/5.10.25-yocto-standard/extra/something.ko' req '.../=
kernel-module-something/1.0-r0/sstate-build-package/package/lib/modules/5.1=
0.25-yocto-standard/extra/something.ko'.

Can't debug it further since it is rarely reproducible, next run failure wi=
ll be some consequence of this, and after cleansstate this won't be reprodu=
cible for a while.

My recipe is simple:

inherit module

SRC_URI =3D " \
file://Kbuild \
file://Makefile \
file://something.c \
file://something.h \
"

S =3D "${WORKDIR}"

KERNEL_MODULE_AUTOLOAD =3D "something"

Using Yocto=C2=A03.1.10.

--AO2cut73mj9ORNoH4leC
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I have external kernel module recipe, let's call it&nbsp;kernel-module-some=
thing.bb.<br /><br />Sometimes, it fails with<br /><br />&nbsp; ERROR: Task=
 (.../kernel-module-something.bb:do_package) failed with exit code '134'<br=
 /><br />I have checked&nbsp;pseudo.log, it looks like this<br /><br />
<div>&nbsp; inode mismatch: '.../kernel-module-something/1.0-r0/image/lib/m=
odules/5.10.25-yocto-standard/extra/something.ko' ino 240205743 in db, 2406=
31184 in request.</div>
<div>&nbsp; creat ignored for existing file '.../kernel-module-something/1.=
0-r0/image/lib/modules/5.10.25-yocto-standard/extra/something.ko'.</div>
<div>&nbsp; inode mismatch: '.../kernel-module-something/1.0-r0/image/lib/m=
odules/5.10.25-yocto-standard/extra/something.ko' ino 240205743 in db, 2406=
31184 in request.</div>
<div>&nbsp; ...</div>
<div>&nbsp; a lot of inode mismatch prints</div>
<div>&nbsp; ...</div>
<div>&nbsp; inode mismatch: '.../kernel-module-something/1.0-r0/sstate-buil=
d-package/package/lib/modules/5.10.25-yocto-standard/extra/something.ko' in=
o 240207118 in db, 240631442 in request.</div>
<div>&nbsp; path mismatch [2 links]: ino 240631442 db '.../kernel-module-so=
mething/1.0-r0/sstate-build-package/packages-split/kernel-module-something-=
5.10.25-yocto-standard/lib/modules/5.10.25-yocto-standard/extra/something.k=
o' req '.../kernel-module-something/1.0-r0/sstate-build-package/package/lib=
/modules/5.10.25-yocto-standard/extra/something.ko'.</div>
<div>&nbsp;</div>
<div>Can't debug it further since it is rarely reproducible, next run failu=
re will be some consequence of this, and after cleansstate this won't be re=
producible for a while.<br /><br />My recipe is simple:<br /><br />
<div>&nbsp; inherit module</div>
<div>&nbsp;&nbsp;</div>
<div>&nbsp; SRC_URI =3D " \</div>
<div>&nbsp; &nbsp; file://Kbuild \</div>
<div>&nbsp; &nbsp; file://Makefile \</div>
<div>&nbsp; &nbsp; file://something.c \</div>
<div>&nbsp; &nbsp; file://something.h \</div>
<div>&nbsp; "</div>
<div>&nbsp;&nbsp;</div>
<div>&nbsp; S =3D "${WORKDIR}"</div>
<div>&nbsp;&nbsp;</div>
<div>&nbsp; KERNEL_MODULE_AUTOLOAD =3D "something"</div>
<div><br />Using Yocto&nbsp;3.1.10.</div>
</div>

--AO2cut73mj9ORNoH4leC--

