Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31528.1795562761574016639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 15:26:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=W6aDNMjX;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20261124232558b65e1db906000207bd-hmv5d2@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20261124232558b65e1db906000207bd
        for <openembedded-core@lists.openembedded.org>;
        Wed, 25 Nov 2026 00:25:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=F/Ou3+sF6F/qrIz53EdHKBmS3LEzWz7stM7W1d1U1X8=;
 b=W6aDNMjXvosYCTENfvJOtYH7ssP1E2ytBzoWjfp9ffezin4seTInBtKp8f5I8PVp5qqMr0
 OhF4He9xqJMsa6L9W28rOUmzf/M1fXcfedsVZLM7iIgf94Q7xoTn9GT7A3P54SlfcI4N/VoL
 yr6ftPPVf9457TBUPfR3n5R9apHgVYRh//5Ta4iFwTHVaPj50BrRvo//xtHvS3v0d/ve2wv6
 tp7HrLrgDwkG8w4b160xVr/hhtbXC6N4TgTIg/RKAsRd9zbfQLRMa5pHC8rIt4yyc/C46aqM
 DO0wYQCsSdQDNeR9Tz2ViO0kAT4LtgdZzzrGRHDu/YbkPVQPBiEVXpLg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] ruby: upgrade 4.0.9 -> 4.0.10
Date: Wed, 25 Nov 2026 00:25:25 +0100
Message-ID: <20261124232525.2811988-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 23:26:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251126
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2026-132825 (and 6 other GHSA vulnerabilities).

Release notes:
* https://github.com/ruby/ruby/releases/tag/v4.0.10

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/ruby/{ruby_4.0.9.bb => ruby_4.0.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ruby/{ruby_4.0.9.bb => ruby_4.0.10.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby_4.0.9.bb b/meta/recipes-devtools/ruby/ruby_4.0.10.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_4.0.9.bb
rename to meta/recipes-devtools/ruby/ruby_4.0.10.bb
index 8c3f8fdf68..3151cbbccf 100644
--- a/meta/recipes-devtools/ruby/ruby_4.0.9.bb
+++ b/meta/recipes-devtools/ruby/ruby_4.0.10.bb
@@ -49,7 +49,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "c35350682ff050b79702d57ade4516e7336063f510155d19fb2fb5b3f3909511"
+SRC_URI[sha256sum] = "b53eef3371fa5d3e3b74340edcd015f06d5d8853968d4e539a5264fce41ed9f1"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
