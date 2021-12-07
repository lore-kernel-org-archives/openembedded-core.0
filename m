Return-Path: <florian.amstutz@scs.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAFE0C433F5
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 13:11:09 +0000 (UTC)
Subject: [PATCH] systemd: Fix journal-gatewayd package name in
 USERADD_PACKAGES
To: openembedded-core@lists.openembedded.org
From: "Florian Amstutz" <florian.amstutz@scs.ch>
X-Originating-Location: Menziken, Aargau, CH (178.197.213.52)
X-Originating-Platform: Windows Chrome 96
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 07 Dec 2021 05:11:09 -0800
Message-ID: <ydBd.1638882669519638857.uXLB@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="GK7nPj83AqHdW5KHrn8G"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 13:11:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159303

--GK7nPj83AqHdW5KHrn8G
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The systemd-journal-gateway user and group are never added to an image sinc=
e the package name added to
USERADD_PACKES is wrong.

Signed-off-by: Florian Amstutz <florian.amstutz@scs.ch>
---
meta/recipes-core/systemd/systemd_249.7.bb | 4 ++--
1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_249.7.bb b/meta/recipes-core=
/systemd/systemd_249.7.bb
index 242a53d22a..53e7f6738d 100644
--- a/meta/recipes-core/systemd/systemd_249.7.bb
+++ b/meta/recipes-core/systemd/systemd_249.7.bb
@@ -391,7 +391,7 @@ SYSTEMD_PACKAGES =3D "${@bb.utils.contains('PACKAGECONF=
IG', 'binfmt', '${PN}-binfm
SYSTEMD_SERVICE:${PN}-binfmt =3D "systemd-binfmt.service"

USERADD_PACKAGES =3D "${PN} ${PN}-extra-utils \
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@b=
b.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-gateway', ''=
, d)} \
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@b=
b.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-gatewayd', '=
', d)} \
${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-remote',=
 '', d)} \
${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '${PN}-journal-uplo=
ad', '', d)} \
"
@@ -403,7 +403,7 @@ USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGE=
CONFIG', 'polkit', '--syste
USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'resolved',=
 '--system -d / -M --shell /sbin/nologin systemd-resolve;', '', d)}"
USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd'=
, '--system -d / -M --shell /sbin/nologin systemd-timesync;', '', d)}"
USERADD_PARAM:${PN}-extra-utils =3D "--system -d / -M --shell /sbin/nologin=
 systemd-bus-proxy"
-USERADD_PARAM:${PN}-journal-gateway =3D "--system -d / -M --shell /sbin/no=
login systemd-journal-gateway"
+USERADD_PARAM:${PN}-journal-gatewayd =3D "--system -d / -M --shell /sbin/n=
ologin systemd-journal-gateway"
USERADD_PARAM:${PN}-journal-remote =3D "--system -d / -M --shell /sbin/nolo=
gin systemd-journal-remote"
USERADD_PARAM:${PN}-journal-upload =3D "--system -d / -M --shell /sbin/nolo=
gin systemd-journal-upload"

--
2.25.1

--GK7nPj83AqHdW5KHrn8G
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>The systemd-journal-gateway user and group are never added to an image=
 since the package name added to</div>
<div>USERADD_PACKES is wrong.</div>
<div>&nbsp;</div>
<div>Signed-off-by: Florian Amstutz &lt;florian.amstutz@scs.ch&gt;</div>
<div>---</div>
<div>&nbsp;meta/recipes-core/systemd/systemd_249.7.bb | 4 ++--</div>
<div>&nbsp;1 file changed, 2 insertions(+), 2 deletions(-)</div>
<div>&nbsp;</div>
<div>diff --git a/meta/recipes-core/systemd/systemd_249.7.bb b/meta/recipes=
-core/systemd/systemd_249.7.bb</div>
<div>index 242a53d22a..53e7f6738d 100644</div>
<div>--- a/meta/recipes-core/systemd/systemd_249.7.bb</div>
<div>+++ b/meta/recipes-core/systemd/systemd_249.7.bb</div>
<div>@@ -391,7 +391,7 @@ SYSTEMD_PACKAGES =3D "${@bb.utils.contains('PACKAG=
ECONFIG', 'binfmt', '${PN}-binfm</div>
<div>&nbsp;SYSTEMD_SERVICE:${PN}-binfmt =3D "systemd-binfmt.service"</div>
<div>&nbsp;</div>
<div>&nbsp;USERADD_PACKAGES =3D "${PN} ${PN}-extra-utils \</div>
<div>-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-gateway=
', '', d)} \</div>
<div>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-gateway=
d', '', d)} \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-re=
mote', '', d)} \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '${PN}-journa=
l-upload', '', d)} \</div>
<div>&nbsp;"</div>
<div>@@ -403,7 +403,7 @@ USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PA=
CKAGECONFIG', 'polkit', '--syste</div>
<div>&nbsp;USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', =
'resolved', '--system -d / -M --shell /sbin/nologin systemd-resolve;', '', =
d)}"</div>
<div>&nbsp;USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', =
'timesyncd', '--system -d / -M --shell /sbin/nologin systemd-timesync;', ''=
, d)}"</div>
<div>&nbsp;USERADD_PARAM:${PN}-extra-utils =3D "--system -d / -M --shell /s=
bin/nologin systemd-bus-proxy"</div>
<div>-USERADD_PARAM:${PN}-journal-gateway =3D "--system -d / -M --shell /sb=
in/nologin systemd-journal-gateway"</div>
<div>+USERADD_PARAM:${PN}-journal-gatewayd =3D "--system -d / -M --shell /s=
bin/nologin systemd-journal-gateway"</div>
<div>&nbsp;USERADD_PARAM:${PN}-journal-remote =3D "--system -d / -M --shell=
 /sbin/nologin systemd-journal-remote"</div>
<div>&nbsp;USERADD_PARAM:${PN}-journal-upload =3D "--system -d / -M --shell=
 /sbin/nologin systemd-journal-upload"</div>
<div>&nbsp;</div>
<div>--&nbsp;</div>
<div>2.25.1</div>

--GK7nPj83AqHdW5KHrn8G--

