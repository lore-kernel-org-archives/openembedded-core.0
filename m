Return-Path: <florian.amstutz@scs.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D86C3064D
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 08:14:48 +0000 (UTC)
Subject: [kirkstone][PATCH] uboot-sign: Fix index error in concat_dtb_helper() with multiple configs
To: openembedded-core@lists.openembedded.org
From: "Florian Amstutz" <florian.amstutz@scs.ch>
X-Originating-Location: Malters, Lucerne, CH (178.197.211.131)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 02 Jul 2024 01:14:40 -0700
Message-ID: <JEms.1719908080585714390.toXE@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="qlThGS7C5KF3VoLYZLkB"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 08:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201414

--qlThGS7C5KF3VoLYZLkB
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Since j is not unset after the inner loop, the image will only be copied
for the first configuration.

Signed-off-by: Florian Amstutz <florian.amstutz@scs.ch>
---
meta/classes/uboot-sign.bbclass | 5 +++--
1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbcl=
ass
index 6bb4ddc600..5b75c8a3b0 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -137,8 +137,7 @@ concat_dtb_helper() {

if [ -n "${UBOOT_CONFIG}" ]
then
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=3D0
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 j=3D0
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unset i j
for config in ${UBOOT_MACHINE}; do
i=3D$(expr $i + 1);
for type in ${UBOOT_CONFIG}; do
@@ -148,7 +147,9 @@ concat_dtb_helper() {
cp ${UBOOT_IMAGE} ${B}/${CONFIG_B_PATH}/u-boot-$type.${UBOOT_SUFFIX}
fi
done
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unset j
done
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unset i
fi
else
bbwarn "Failure while adding public key to u-boot binary. Verified boot won=
't be available."
--
2.34.1

--qlThGS7C5KF3VoLYZLkB
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Since j is not unset after the inner loop, the image will only be copied<br=
 />for the first configuration.<br /><br /><br />Signed-off-by: Florian Ams=
tutz &lt;florian.amstutz@scs.ch&gt;<br />---<br />&nbsp;meta/classes/uboot-=
sign.bbclass | 5 +++--<br />&nbsp;1 file changed, 3 insertions(+), 2 deleti=
ons(-)<br /><br />diff --git a/meta/classes/uboot-sign.bbclass b/meta/class=
es/uboot-sign.bbclass<br />index 6bb4ddc600..5b75c8a3b0 100644<br />--- a/m=
eta/classes/uboot-sign.bbclass<br />+++ b/meta/classes/uboot-sign.bbclass<b=
r />@@ -137,8 +137,7 @@ concat_dtb_helper() {<br /><br />&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if [ -n "=
${UBOOT_CONFIG}" ]<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; then<br />- &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
i=3D0<br />- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; j=3D0<br />+ &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; unset i j<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; for config i=
n ${UBOOT_MACHINE}; do<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; i=3D$(expr $i + 1);<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; for type in ${UBOOT_CONFIG}; do<br />@@ -1=
48,7 +147,9 @@ concat_dtb_helper() {<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; cp ${UBOOT_IMAGE} ${B}/${CONFIG_B_PATH}/u-boot-$type.${UBOOT_S=
UFFIX}<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; fi<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; done<br />+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; unset j<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; do=
ne<br />+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; unset i<br />&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; fi<br />&nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; else<br />&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bbwar=
n "Failure while adding public key to u-boot binary. Verified boot won't be=
 available."<br />--<br />2.34.1

--qlThGS7C5KF3VoLYZLkB--

