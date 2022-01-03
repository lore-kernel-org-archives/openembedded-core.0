Return-Path: <joakim.roubert@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51998C433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 08:39:11 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.25089.1641199149220261958
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 00:39:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=VhYSJelO;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1641199149;
  x=1672735149;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rhfHqhzR5KDrDWMbYYEpcU1B9/dHejkaZVLTxAHJA44=;
  b=VhYSJelOICwM1VPBi8GilDt5Nnbi617G25pc1zbV0faU9jSVwBE7b9EU
   b8wOm0aDzGYM8XIgFxuQWHZKyDSVmnG6o6mOIOqcmXe7FLFk/pIQSZtAe
   0X1k9UZHFs6sel0mlOw6ujGxJNcJydukqHv+VHHTMwC08J62UoAqWm2aK
   P9PqVcIRQqgxBFz/KkdMgDdkUYlEA8HqhIEYh3JkMYSDJ8zNV09BE/kY7
   3Y7xpyyO3dKj8qqFVSD75vx6CMLOyqztut04DvnE5Lhf8D1IJZhaYk9ZV
   3o28k6eo7jliw/OlQ620bKu775HneB6inJkE3MkilcBmLinWtxFw9fUn6
   g==;
From: Joakim Roubert <joakim.roubert@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: Joakim Roubert <joakimr@axis.com>, Joakim Roubert
	<joakim.roubert@axis.com>
Subject: [OE-Core][PATCH v2] gstreamer1.0-plugins-bad: Add support for
 mpegtsmux
Date: Mon, 3 Jan 2022 09:38:50 +0100
Message-ID: <20220103083850.385326-1-joakim.roubert@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 08:39:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160115

From: Joakim Roubert <joakimr@axis.com>

When enabling srt one most likely also wants to use mpegtsmux.

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


