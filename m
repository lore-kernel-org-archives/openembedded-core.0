Return-Path: <joakim.roubert@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA5CC433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 08:31:30 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.25300.1641198688800646920
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 00:31:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=LMq0NnZL;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1641198690;
  x=1672734690;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MtAUwDTJumKaLrFmiNYFNaftkCU2ms8GZ8k9jxpDkHs=;
  b=LMq0NnZLQcghywzSn68Y3hSL+3uRGlaEmu85dZZgeE9Gf6gUg1x3G3gX
   vdx8yApqpXF3vyniMQxLiDqgqEUMhjBgG7aCdgSc3GaJ7pDLsCRa3NSkn
   vKrqfnZZjW8yOEtHCX5+WKEpEWplZvG+O8lwSTbbl8IZtu0Yc22imdIgr
   LsJ/jw6CEhEY2Auent+6Kei9ayZMM0Q2Pr/6gzr7LjheK6qP2/oNg/31W
   liQ7NUIWartIcI2UCTGJvQytmYQZtdPnQRra8JN+Jf1bPx6mWyQLtrBI0
   aU+E7qXD63yVu1A2P9E4Az8cgOaEp2DWDbvJULLJFFfWxocdzf07ToEnx
   A==;
From: Joakim Roubert <joakim.roubert@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: Joakim Roubert <joakimr@axis.com>, Joakim Roubert
	<joakim.roubert@axis.com>
Subject: [PATCH] gstreamer1.0-plugins-bad: Add support for mpegtsmux
Date: Mon, 3 Jan 2022 09:31:03 +0100
Message-ID: <20220103083103.384767-1-joakim.roubert@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 08:31:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160114

From: Joakim Roubert <joakimr@axis.com>

When enabling srt one most likely also want to use mpegtsmux.

Signed-off-by: Joakim Roubert <joakim.roubert@axis.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb                 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb
index f90dff693d..9233c3bec1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb
@@ -65,6 +65,7 @@ PACKAGECONFIG[libmms]          = "-Dlibmms=enabled,-Dlibmms=disabled,libmms"
 PACKAGECONFIG[libssh2]         = "-Dcurl-ssh2=enabled,-Dcurl-ssh2=disabled,libssh2"
 PACKAGECONFIG[lcms2]           = "-Dcolormanagement=enabled,-Dcolormanagement=disabled,lcms"
 PACKAGECONFIG[modplug]         = "-Dmodplug=enabled,-Dmodplug=disabled,libmodplug"
+PACKAGECONFIG[mpegtsmux]       = "-Dmpegtsmux=enabled,-Dmpegtsmux=disabled""
 PACKAGECONFIG[msdk]            = "-Dmsdk=enabled,-Dmsdk=disabled,intel-mediasdk"
 PACKAGECONFIG[neon]            = "-Dneon=enabled,-Dneon=disabled,neon"
 PACKAGECONFIG[openal]          = "-Dopenal=enabled,-Dopenal=disabled,openal-soft"
-- 
2.30.2


