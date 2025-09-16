Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB08CAC59B
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 15:58:27 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.2310.1758038298152104239
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 08:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout03.t-online.de (Postfix) with SMTP id 6D236F56E
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 17:58:16 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.44.62]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uyY4I-0N19pS0; Tue, 16 Sep 2025 17:58:10 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 2/2] gstreamer1.0-libav: depend on virtual/ffmpeg
Date: Tue, 16 Sep 2025 17:58:00 +0200
Message-ID: <20250916155800.3860178-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250916155800.3860178-1-f_l_k@t-online.de>
References: <20250916155800.3860178-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1758038290-31FF88B3-FFC29944/0/0 CLEAN NORMAL
X-TOI-MSGID: 1e2aed80-d7d3-4606-b67f-866facdd8347
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 15:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223571

use the new introduced virtual/ffmpeg provider

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.5.=
bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.5.bb
index c3ee529497..0fc1ce100d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.5.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] =3D "d6de05884ef42376dd8cde89940f7b5=
0ced96f4f6f52888e764cd8233e
=20
 S =3D "${UNPACKDIR}/gst-libav-${PV}"
=20
-DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base ffmpeg"
+DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base virtual/ffmpeg"
=20
 inherit meson pkgconfig upstream-version-is-even
=20
--=20
2.50.1


