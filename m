Return-Path: <frieder@konvera.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE448C7EE24
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 08:01:29 +0000 (UTC)
Subject: Re: [PATCH] fixup! fix: reproducible builds for initramfs and UKI img
To: openembedded-core@lists.openembedded.org
From: "Frieder Paape" <frieder@konvera.io>
X-Originating-Location: Aachen, North Rhine-Westphalia, DE (79.230.167.130)
X-Originating-Platform: Mac Firefox 113
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 06 Jun 2023 01:01:28 -0700
References: <76fc64335d45702735bf1c168cf67f6af5e2d47c.camel@linuxfoundation.org>
In-Reply-To: <76fc64335d45702735bf1c168cf67f6af5e2d47c.camel@linuxfoundation.org>
Message-ID: <27537.1686038488234786413@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="gLrT7RHYpGSv6Behlp1m"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 08:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182416

--gLrT7RHYpGSv6Behlp1m
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The failure happens because `touch` doesn't create a file if called with th=
e no-dereference option `-h`.
Removing `-h` from affected touch command.

Signed-off-by: Frieder Paape <frieder@konvera.io>
---
meta/classes-recipe/image_types.bbclass | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/=
image_types.bbclass
index f73b4d965e..023eb87537 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -150,7 +150,7 @@ IMAGE_CMD:cpio () {
ln -sf /sbin/init ${WORKDIR}/cpio_append/init
touch -h -r ${IMAGE_ROOTFS}/sbin/init ${WORKDIR}/cpio_append/init
else
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 touch -h -r ${IMAGE_ROOTFS} ${WORKD=
IR}/cpio_append/init
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 touch -r ${IMAGE_ROOTFS} ${WORKDIR}=
/cpio_append/init
fi
(cd=C2=A0 ${WORKDIR}/cpio_append && echo ./init | cpio --reproducible -oA -=
H newc -F ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
fi
--
2.39.2 (Apple Git-143)

--gLrT7RHYpGSv6Behlp1m
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The failure happens because `touch` doesn't create a file if called with th=
e no-dereference option `-h`.<br />Removing `-h` from affected touch comman=
d.<br /><br />Signed-off-by: Frieder Paape &lt;frieder@konvera.io&gt;<br />=
---<br />&nbsp;meta/classes-recipe/image_types.bbclass | 2 +-<br />&nbsp;1 =
file changed, 1 insertion(+), 1 deletion(-)<br /><br />diff --git a/meta/cl=
asses-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass<=
br />index f73b4d965e..023eb87537 100644<br />--- a/meta/classes-recipe/ima=
ge_types.bbclass<br />+++ b/meta/classes-recipe/image_types.bbclass<br />@@=
 -150,7 +150,7 @@ IMAGE_CMD:cpio () {<br />&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&=
nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ln -sf /sbin/init ${WORKD=
IR}/cpio_append/init<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; touch =
-h -r ${IMAGE_ROOTFS}/sbin/init ${WORKDIR}/cpio_append/init<br />&nbsp;&nbs=
p;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; else<br />-&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; touch -h -r ${IMAGE_ROOTFS} ${WORKDIR}/cpio_appen=
d/init<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; touch -r ${IMAGE_ROOTFS} =
${WORKDIR}/cpio_append/init<br />&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp=
; &nbsp;&nbsp;&nbsp; fi<br />&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &n=
bsp;&nbsp;&nbsp; (cd&nbsp; ${WORKDIR}/cpio_append &amp;&amp; echo ./init | =
cpio --reproducible -oA -H newc -F ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAM=
E_SUFFIX}.cpio)<br />&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; fi<br />--=
 <br />2.39.2 (Apple Git-143)

--gLrT7RHYpGSv6Behlp1m--

