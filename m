Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B637C2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 10:28:47 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.10817.1643192925630085499
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 02:28:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=hllGzB2x;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-038.002.205.pools.vodafone-ip.de
 [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 026B6830D9;
	Wed, 26 Jan 2022 11:28:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643192924;
	bh=8OpkBr7KD/sEd9FTvzxr1fDcz0M9FyXMwR3T3wWAab4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hllGzB2xNhv9IRKguq+9n5hcJPGicXRMKrSY/z9ngISQU+SOODGLIjiB1peJpXOKs
	 /HaB92HKVOQLgY5EQlo6X3W6vSs8wKE7HcZAZjfiXRBR4BjfjnjqzZCMyP3K1KLtoC
	 QPI2H6rUbHPh3zmOpUbVX50SXPOFgIv6KNvVyITzXAM4x7ehBWskPAYArRw8E0HuEN
	 X3aSimy++SRwi9T65ac8NfaSzVyptk6VUDOUw8oiM0SjSINEtCrn6HEofDxsSPbo70
	 fBHPvSX+rNkZvj/YJh0xBfEcw1vT/NVZDKbv/2+hMgS57RENtpNQNqIakZrbQPSC34
	 9GuTfFJDZF0Gw==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Claudius Heine <ch@denx.de>
Subject: [OE-core][RFC PATCH 12/12] gst-devtools: 1.18.5 -> 1.20.0
Date: Wed, 26 Jan 2022 11:28:14 +0100
Message-Id: <20220126102814.4173943-13-ch@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126102814.4173943-1-ch@denx.de>
References: <20220126102814.4173943-1-ch@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 10:28:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160977

Signed-off-by: Claudius Heine <ch@denx.de>
---
 .../0001-connect-has-a-different-signature-on-musl.patch | 8 ++++----
 .../{gst-devtools_1.18.5.bb =3D> gst-devtools_1.20.0.bb}   | 9 ++++-----
 2 files changed, 8 insertions(+), 9 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.18.5.bb =3D> gs=
t-devtools_1.20.0.bb} (83%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-=
has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstream=
er/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index c0e4581358..ed0a6d387b 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-d=
ifferent-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-d=
ifferent-signature-on-musl.patch
@@ -12,13 +12,13 @@ Upstream-Status: Pending
=20
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- validate/plugins/fault_injection/socket_interposer.c | 7 ++++++-
+ subprojects/gst-devtools/validate/plugins/fault_injection/socket_interp=
oser.c | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
=20
-diff --git a/validate/plugins/fault_injection/socket_interposer.c b/vali=
date/plugins/fault_injection/socket_interposer.c
+diff --git a/subprojects/gst-devtools/validate/plugins/fault_injection/s=
ocket_interposer.c b/subprojects/gst-devtools/validate/plugins/fault_inje=
ction/socket_interposer.c
 index 53c1ebb..ad7adf8 100644
---- a/validate/plugins/fault_injection/socket_interposer.c
-+++ b/validate/plugins/fault_injection/socket_interposer.c
+--- a/subprojects/gst-devtools/validate/plugins/fault_injection/socket_i=
nterposer.c
++++ b/subprojects/gst-devtools/validate/plugins/fault_injection/socket_i=
nterposer.c
 @@ -100,10 +100,15 @@ socket_interposer_set_callback (struct sockaddr_in=
 *addrin,
  }
 =20
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.5.bb b/m=
eta/recipes-multimedia/gstreamer/gst-devtools_1.20.0.bb
similarity index 83%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.20.0.bb
index 1b46b89cb9..a8954a577b 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.0.bb
@@ -6,13 +6,12 @@ SECTION =3D "multimedia"
 LICENSE =3D "LGPLv2.1"
 LIC_FILES_CHKSUM =3D "file://validate/COPYING;md5=3Da6f89e2100d9b6cdffce=
a4f398e37343"
=20
-#S =3D "${WORKDIR}/gst-devtools-${PV}"
+require gstreamer1.0-source.inc
=20
-SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devt=
ools-${PV}.tar.xz \
-           file://0001-connect-has-a-different-signature-on-musl.patch \
-           "
+S =3D "${SRC_BASE}/subprojects/gst-devtools"
=20
-SRC_URI[sha256sum] =3D "fecffc86447daf5c2a06843c757a991d745caa2069446a0d=
746e99b13f7cb079"
+SRC_URI +=3D "file://0001-connect-has-a-different-signature-on-musl.patc=
h;patchdir=3D${SRC_BASE} \
+           "
=20
 DEPENDS =3D "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.=
0-plugins-base"
 RRECOMMENDS:${PN} =3D "git"
--=20
2.34.1


