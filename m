Return-Path: <a1ba.omarov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C322C54E58
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 18:51:40 +0000 (UTC)
Subject: [PATCH] sbc: add PACKAGECONFIG tester to make libsndfile1 optional
To: openembedded-core@lists.openembedded.org
From: "Alibek Omarov" <a1ba.omarov@gmail.com>
X-Originating-Location: Helsinki, Uusimaa, FI (135.181.76.187)
X-Originating-Platform: Linux Firefox 116
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 23 Mar 2024 11:51:33 -0700
Message-ID: <902V.1711219893327416786.MIfH@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="hcl2Y1nsvKWpZYqDIDmo"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Mar 2024 18:51:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197466

--hcl2Y1nsvKWpZYqDIDmo
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Noticed that enabling sbc brought libsndfile1->{flac,libogg,vorb
is,etc} chain
dependency. As it wasn't really used by anything critical, made this depend=
ency
optional.

Fixes: fc6375426f94 ("sbc: SBC audio codec")
Signed-off-by: Alibek Omarov < a1ba.omarov@gmail.com >
---
meta/recipes-multimedia/sbc/ s bc_2.0.bb ( http://sbc_2.0.bb ) | 5 +++--
1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/sbc/ sbc_2.0.bb ( http://sbc_2.0.bb ) =
b/meta/recipes-multimedia/sbc/ sbc_2.0.bb ( http://sbc_2.0.bb )
index d25be9e80c..2b1e2d0441 100644
--- a/meta/recipes-multimedia/sbc/ sbc_2.0.bb ( http://sbc_2.0.bb )
+++ b/meta/recipes-multimedia/sbc/ sbc_2.0.bb ( http://sbc_2.0.bb )
@@ -10,13 +10,14 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae 1=
ff87c09e5b7ccc2c4ca7e \
file://src/sbcenc.c; beginline=3D1;endline=3D24;md5=3D08e 7a70b127f4100ff2c=
d7d629147d8d \
file://sbc/sbc.h;beginline=3D1; endline=3D26;md5=3D0f57d0df22b0d40 746bdd29=
805a4361b"

-DEPENDS =3D "libsndfile1"
-
SRC_URI =3D "${KERNELORG_MIRROR}/linux/blu etooth/${BP}.tar.xz"

SRC_URI[sha256sum] =3D "8f12368e1dbbf55e14536520473cf b338c84b392939cc9b642=
98360fd4a 07992"

inherit autotools pkgconfig

+PACKAGECONFIG ??=3D "tester"
+PACKAGECONFIG[tester] =3D ",--disable-tester,libsndfile1 "
+
PACKAGES =3D+ "${PN}-examples"
FILES:${PN}-examples +=3D "${bindir}/*"
--
2.34.1

--hcl2Y1nsvKWpZYqDIDmo
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Noticed that enabling sbc brought libsndfile1-&gt;{flac,libogg,vorb
<div id=3D":ow" class=3D"a3s aiL "><wbr />is,etc} chain<br />dependency. As=
 it wasn't really used by anything critical, made this dependency<br />opti=
onal.<br /><br />Fixes: fc6375426f94 ("sbc: SBC audio codec")<br />Signed-o=
ff-by: Alibek Omarov &lt;<a href=3D"mailto:a1ba.omarov@gmail.com" target=3D=
"_blank" rel=3D"noopener">a1ba.omarov@gmail.com</a>&gt;<br />---<br />&nbsp=
;meta/recipes-multimedia/sbc/<a href=3D"http://sbc_2.0.bb" target=3D"_blank=
" rel=3D"noopener noreferrer" data-saferedirecturl=3D"https://www.google.co=
m/url?q=3Dhttp://sbc_2.0.bb&amp;source=3Dgmail&amp;ust=3D1711306200794000&a=
mp;usg=3DAOvVaw1DSwTXmODeuNtRhx3KywIB">s<wbr />bc_2.0.bb</a> | 5 +++--<br /=
>&nbsp;1 file changed, 3 insertions(+), 2 deletions(-)<br /><br />diff --gi=
t a/meta/recipes-multimedia/sbc/<a href=3D"http://sbc_2.0.bb" target=3D"_bl=
ank" rel=3D"noopener noreferrer" data-saferedirecturl=3D"https://www.google=
.com/url?q=3Dhttp://sbc_2.0.bb&amp;source=3Dgmail&amp;ust=3D171130620079400=
0&amp;usg=3DAOvVaw1DSwTXmODeuNtRhx3KywIB"><wbr />sbc_2.0.bb</a> b/meta/reci=
pes-multimedia/sbc/<a href=3D"http://sbc_2.0.bb" target=3D"_blank" rel=3D"n=
oopener noreferrer" data-saferedirecturl=3D"https://www.google.com/url?q=3D=
http://sbc_2.0.bb&amp;source=3Dgmail&amp;ust=3D1711306200794000&amp;usg=3DA=
OvVaw1DSwTXmODeuNtRhx3KywIB"><wbr />sbc_2.0.bb</a><br />index d25be9e80c..2=
b1e2d0441 100644<br />--- a/meta/recipes-multimedia/sbc/<a href=3D"http://s=
bc_2.0.bb" target=3D"_blank" rel=3D"noopener noreferrer" data-saferedirectu=
rl=3D"https://www.google.com/url?q=3Dhttp://sbc_2.0.bb&amp;source=3Dgmail&a=
mp;ust=3D1711306200794000&amp;usg=3DAOvVaw1DSwTXmODeuNtRhx3KywIB"><wbr />sb=
c_2.0.bb</a><br />+++ b/meta/recipes-multimedia/sbc/<a href=3D"http://sbc_2=
.0.bb" target=3D"_blank" rel=3D"noopener noreferrer" data-saferedirecturl=
=3D"https://www.google.com/url?q=3Dhttp://sbc_2.0.bb&amp;source=3Dgmail&amp=
;ust=3D1711306200794000&amp;usg=3DAOvVaw1DSwTXmODeuNtRhx3KywIB"><wbr />sbc_=
2.0.bb</a><br />@@ -10,13 +10,14 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md=
5=3D12f884d2ae<wbr />1ff87c09e5b7ccc2c4ca7e \<br />&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://src/sbcenc.c;<wb=
r />beginline=3D1;endline=3D24;md5=3D08e<wbr />7a70b127f4100ff2cd7d629147d8=
d \<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;file://sbc/sbc.h;beginline=3D1;<wbr />endline=3D26;md5=3D0f57d0df=
22b0d40<wbr />746bdd29805a4361b"<br /><br />-DEPENDS =3D "libsndfile1"<br /=
>-<br />&nbsp;SRC_URI =3D "${KERNELORG_MIRROR}/linux/blu<wbr />etooth/${BP}=
.tar.xz"<br /><br />&nbsp;SRC_URI[sha256sum] =3D "8f12368e1dbbf55e145365204=
73cf<wbr />b338c84b392939cc9b64298360fd4a<wbr />07992"<br /><br />&nbsp;inh=
erit autotools pkgconfig<br /><br />+PACKAGECONFIG ??=3D "tester"<br />+PAC=
KAGECONFIG[tester] =3D ",--disable-tester,libsndfile1<wbr />"<br />+<br />&=
nbsp;PACKAGES =3D+ "${PN}-examples"<br />&nbsp;FILES:${PN}-examples +=3D "$=
{bindir}/*"<span style=3D"color: #888888;"><br />-- <br />2.34.1</span></di=
v>

--hcl2Y1nsvKWpZYqDIDmo--

