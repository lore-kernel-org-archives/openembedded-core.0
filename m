Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFEDFECAAD5
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 11:03:04 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.2575.1662462177040343163
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 04:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22,
 mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout12.t-online.de (Postfix) with SMTP id 719E41ABE1
	for <openembedded-core@lists.openembedded.org>;
 Tue,  6 Sep 2022 13:01:43 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.37.201]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oVWKt-1OvvdJ0; Tue, 6 Sep 2022 13:01:43 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-mingw][PATCH] libsdl2.bbappend: disable vulkan support
Date: Tue,  6 Sep 2022 13:01:30 +0200
Message-Id: <20220906110130.3025181-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1662462103-01452C5E-EF72EBCD/0/0 CLEAN NORMAL
X-TOI-MSGID: 82ff7c72-aa43-4771-8e91-cf4b486c55e9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Sep 2022 11:03:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170346

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 recipes-graphics/libsdl2/libsdl2_%.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-graphics/libsdl2/libsdl2_%.bbappend b/recipes-graphi=
cs/libsdl2/libsdl2_%.bbappend
index 4f9cde1..33b851d 100644
--- a/recipes-graphics/libsdl2/libsdl2_%.bbappend
+++ b/recipes-graphics/libsdl2/libsdl2_%.bbappend
@@ -1,7 +1,7 @@
 # Need to disable X11 explictly as nativesdk-libxdmcp fails:
 # .libs/Fill.o:Fill.c:(.text+0x48): undefined reference to `_imp__recvfr=
om@24'
 # .libs/Flush.o:Flush.c:(.text+0x36): undefined reference to `_imp__send=
to@24'
-PACKAGECONFIG:remove:mingw32:class-nativesdk =3D "x11 opengl gles2"
+PACKAGECONFIG:remove:mingw32:class-nativesdk =3D "x11 opengl gles2 vulka=
n"
=20
 # libtool doesn't think it can link windres output (COFF) with libtool o=
bjects
 # (COFF) , but it can.  This might be because file misidentifies version=
.o:
--=20
2.34.1


