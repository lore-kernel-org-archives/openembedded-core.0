Return-Path: <florian.amstutz@scs.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92FBC3064D
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 08:16:37 +0000 (UTC)
Subject: [PATCH] u-boot: Fix potential index error issues in do_deploy with multiple u-boot configurations
To: openembedded-core@lists.openembedded.org
From: "Florian Amstutz" <florian.amstutz@scs.ch>
X-Originating-Location: Malters, Lucerne, CH (178.197.211.131)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 02 Jul 2024 01:16:35 -0700
Message-ID: <ykBT.1719908195834561903.8Nny@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="ZWtGr2iolsc6YAoHOgYU"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 08:16:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201415

--ZWtGr2iolsc6YAoHOgYU
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

If i or j have not been unset in do_deploy:prepend functions, images are no=
t correctly
copied to DEPLOYDIR.

Signed-off-by: Florian Amstutz <florian.amstutz@scs.ch>
---
meta/recipes-bsp/u-boot/u-boot.inc | 1 +
1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc
index 54ea2e9e50..70fb192d6e 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -209,6 +209,7 @@ RDEPENDS:${PN} +=3D "${PN}-env"
do_deploy () {
if [ -n "${UBOOT_CONFIG}" ]
then
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0unset i j
for config in ${UBOOT_MACHINE}; do
i=3D$(expr $i + 1);
for type in ${UBOOT_CONFIG}; do
--
2.34.1

--ZWtGr2iolsc6YAoHOgYU
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

If i or j have not been unset in do_deploy:prepend functions, images are no=
t correctly<br />copied to DEPLOYDIR.<br /><br />Signed-off-by: Florian Ams=
tutz &lt;florian.amstutz@scs.ch&gt;<br />---<br />&nbsp;meta/recipes-bsp/u-=
boot/u-boot.inc | 1 +<br />&nbsp;1 file changed, 1 insertion(+)<br /><br />=
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc<br />index 54ea2e9e50..70fb192d6e 100644<br />--- a/meta/recipes-=
bsp/u-boot/u-boot.inc<br />+++ b/meta/recipes-bsp/u-boot/u-boot.inc<br />@@=
 -209,6 +209,7 @@ RDEPENDS:${PN} +=3D "${PN}-env"<br />&nbsp;do_deploy () {=
<br />&nbsp; &nbsp; &nbsp;if [ -n "${UBOOT_CONFIG}" ]<br />&nbsp; &nbsp; &n=
bsp;then<br />+ &nbsp; &nbsp; &nbsp; &nbsp;unset i j<br />&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;for config in ${UBOOT_MACHINE}; do<br />&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;i=3D$(expr $i + 1);<br />&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;for type in ${UBOOT_CONFIG}; do<br />--<br />2.=
34.1

--ZWtGr2iolsc6YAoHOgYU--

