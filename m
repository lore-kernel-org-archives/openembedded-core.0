Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15234.1794778898539790055
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 13:41:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=PjzjVDJE;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20261115214136ac3e72bc37000207c2-4sudqq@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20261115214136ac3e72bc37000207c2
        for <openembedded-core@lists.openembedded.org>;
        Sun, 15 Nov 2026 22:41:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=H4WZb2a9kyx/c7MBvWnmK8Nqr202at8TBJfx/cHIdzs=;
 b=PjzjVDJEtCAKxIyHLG0sB0/Kmzrhnn4SCb8MqB2fXpV/nNTfalkYqB62PxkAgoePTx2ykd
 Y1t17jmlS6rBo47BJyxn5pJ/1ObrO72NDxEIIlMjGsEbKuvpNNezA8WBasvE3vmh+sHUjTNp
 yOP8KYuCgBlPeTYKIVwMHirjUTYjaVgxZ8UgqH0XdPoggR74AXMdWXgThSQdC58XkLUZcVoz
 He1dgm1IwBBxA818wMCZutmDDBsgri/AQzKBXjLNMYgDi0I4n9QZZ69NyLWwIJRN1D7ESYCT
 CWzr30wtbe7/RO4x/Rldda4KhV0bXUpywf9gg74oxB8NAWN9F6ZlRIGQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH 4/7] libxrender: Upgrade 0.9.12 -> 0.9.13
Date: Sun, 15 Nov 2026 22:39:29 +0100
Message-ID: <20261115213932.1652076-4-peter.marko@siemens.com>
In-Reply-To: <20261115213932.1652076-1-peter.marko@siemens.com>
References: <20261115213932.1652076-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 21:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250286
Content-Type: text/plain; charset="utf-8"

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

libXrender 0.9.13
Check numSubpixel against numScreens to avoid OOB writes (CVE-2026-88807)
gitlab CI: drop the ci-fairy check-mr job
meson: Add option to build with meson

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: ac37616f068062e1d361f6e16e3c8274cf96caaa)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../xorg-lib/{libxrender_0.9.12.bb => libxrender_0.9.13.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxrender_0.9.12.bb => libxrender_0.9.13.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb b/meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb
rename to meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb
index e946d9dd41a..667f469e690 100644
--- a/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb
@@ -18,5 +18,5 @@ PE = "1"
 XORG_PN = "libXrender"
 
 BBCLASSEXTEND = "native nativesdk"
-SRC_URI[sha256sum] = "b832128da48b39c8d608224481743403ad1691bf4e554e4be9c174df171d1b97"
+SRC_URI[sha256sum] = "3fe88c609df6782e1e7af2e4de36b2563d70cd70ff7dcb1cda561ad64912bb64"
 
