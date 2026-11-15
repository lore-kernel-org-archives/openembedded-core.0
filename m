Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15455.1794778972776991846
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 13:42:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=A+fYb2Ak;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20261115214250f71204c3b2000207da-ofimrn@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20261115214250f71204c3b2000207da
        for <openembedded-core@lists.openembedded.org>;
        Sun, 15 Nov 2026 22:42:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=uNxnWmoeM5GcVFJtlqiHdo/8EtDg1NcryK5Y+n6uDsU=;
 b=A+fYb2Akw5WXqxQm3xCrxdp9uHz4W/mRV8jqTLxXdMteyqJapE0RkiJ+RIMCh4LopQtK6i
 j+ODwXJ1DhJFuuL/yRu7g/y/Mi27AzdJJe0CshDYnP0eZluU3wwn5aXNhngg1Fi81nG7vVCP
 K69sZDpq/1RfOj4nG4hP3yM6JX04QOVE5KyPo3jdfWsAlVl+1Ga7jg0YY0W9oIvWyiQe+tJl
 yjwIg/9PErAWz9a+Xeyju5LzR5KdQ5sIl32FS59ok+ad3NU+t/RYyPTzzD+mv5qoWdwjlNmv
 yT19CMCaPd3R4+FluQyMPazckTcUilHboh20zl6glZ3XvPF5M/GOpOLw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 5/9] libxtst: Upgrade 1.2.5 -> 1.2.6
Date: Sun, 15 Nov 2026 22:39:39 +0100
Message-ID: <20261115213944.1653468-5-peter.marko@siemens.com>
In-Reply-To: <20261115213944.1653468-1-peter.marko@siemens.com>
References: <20261115213944.1653468-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 21:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250294
Content-Type: text/plain; charset="utf-8"

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

libXtst 1.2.6
parse_reply_call_callback: reject zero-progress RECORD reply elements
parse_reply_call_callback: check element size against remaining reply buffer
gitlab CI: drop the ci-fairy check-mr job

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 39e26025d22d408ca4d6bb36e80e506ac4da0848)
Handles CVE-2026-109088 and CVE-2026-94286.
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../xorg-lib/{libxtst_1.2.5.bb => libxtst_1.2.6.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxtst_1.2.5.bb => libxtst_1.2.6.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb b/meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb
rename to meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb
index df381b7d65..a59c5c6996 100644
--- a/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb
@@ -15,6 +15,6 @@ PROVIDES = "xtst"
 PE = "1"
 
 XORG_PN = "libXtst"
-SRC_URI[sha256sum] = "b50d4c25b97009a744706c1039c598f4d8e64910c9fde381994e1cae235d9242"
+SRC_URI[sha256sum] = "f94f0b37c07d80d877f3eda2c2405cc7e62aa9842f6310354aa349e3d66a4fe5"
 
 BBCLASSEXTEND = "native nativesdk"
