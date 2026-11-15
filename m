Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15451.1794778967557186217
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 13:42:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=oVpGQ/Rk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20261115214245705d8778e50002075e-2sus78@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20261115214245705d8778e50002075e
        for <openembedded-core@lists.openembedded.org>;
        Sun, 15 Nov 2026 22:42:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=5yg/a7GO+gngTE4KbhqWeN0r5cqKkWgh/+TdLeq7FTU=;
 b=oVpGQ/RkedVVV1N158/BXfKf1KdejmisE2kzS2Ns3wZ92iL4xkd3Jzj+LUwewQ7iTROOhT
 IVxSVBOqK5/FUobEt5Uh0qiIQ7/ra1iH0NyGeCxGuCxMnIiqrQ2U+DJsMM2TbIPFgyt5r4iq
 p4rTv5ALnWJZtZ6ot0pzdxaodwqof7mt8vx84hnhZxPQ5uB7HHMzNOL9j445RXOIVNa0LNb3
 Dnl2nxIvP2wpxkz4lvhkRJwYBE6Lmv+MkWvh/yhOPifdx1HuzUWwkSmvss4VOMHYNfXEkHLa
 HaeX38UiKY+ZvY6jKZZp2HqeALAAHt/Lm4yP3TNbNqoBHlQ4djcA0hOQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 4/9] libxrender: Upgrade 0.9.12 -> 0.9.13
Date: Sun, 15 Nov 2026 22:39:38 +0100
Message-ID: <20261115213944.1653468-4-peter.marko@siemens.com>
In-Reply-To: <20261115213944.1653468-1-peter.marko@siemens.com>
References: <20261115213944.1653468-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 21:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250293
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
index e946d9dd41..667f469e69 100644
--- a/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb
@@ -18,5 +18,5 @@ PE = "1"
 XORG_PN = "libXrender"
 
 BBCLASSEXTEND = "native nativesdk"
-SRC_URI[sha256sum] = "b832128da48b39c8d608224481743403ad1691bf4e554e4be9c174df171d1b97"
+SRC_URI[sha256sum] = "3fe88c609df6782e1e7af2e4de36b2563d70cd70ff7dcb1cda561ad64912bb64"
 
