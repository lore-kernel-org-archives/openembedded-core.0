Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF6BDC433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 02:27:25 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.3021.1652927238138712279
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 19:27:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=WiYxq88K;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1652927238;
  x=1684463238;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eRqGvyPjfFGXbwdTdtElPwSQK+StXxvWzLM5o48BXac=;
  b=WiYxq88KfLjsOCM1S/uh8JcUKx4jOvIfDmb3SLj8heBO74ROmSDAWUSI
   C5Nzt9JdhmSOBUa6KZTqZpxsMQY+vCbTjDqBDmM9Az9Ggo7ZPym+mcIHJ
   yTAtnXFTJ2P1ywdViZNr53xI14ejWwYSSPzHFyZ98c62xHdlEx1LeI3u+
   73+k93e/XNy0fK6u4qi/Knvd3y31ikuzMqzbdNt7CJRm4eboxFw+AqHFN
   aqiokSOpmSuASE6Au4yxsRK/+Gf48cDV21NqGshnkJPeAtEoQhv5Z7rVq
   XQpnjtBwNZHBdQUpu3yI7uK+cYOfET9tQuQhmTW7kC2c2iwf73Zyj+aEM
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [master][kirkstone][PATCH] librsvg: Drop the dependency on libcroco
Date: Thu, 19 May 2022 04:27:12 +0200
Message-ID: <20220519022712.671-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 02:27:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165864

The dependency on libcroco was removed in version 2.48.0.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.54.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb
index 7bad2ed816..c784ec661b 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                    "
 
 SECTION = "x11/utils"
-DEPENDS = "cairo gdk-pixbuf glib-2.0 libcroco libxml2 pango python3-docutils-native"
+DEPENDS = "cairo gdk-pixbuf glib-2.0 libxml2 pango python3-docutils-native"
 BBCLASSEXTEND = "native nativesdk"
 
 inherit gnomebase pixbufcache upstream-version-is-even gobject-introspection rust vala gi-docgen

