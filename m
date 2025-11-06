Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C46E7CCFA13
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 20:07:21 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7115.1762459636902335646
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 12:07:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=mk6aoGat;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202511062007139c37f3361600020712-bvtc4r@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202511062007139c37f3361600020712
        for <openembedded-core@lists.openembedded.org>;
        Thu, 06 Nov 2025 21:07:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=+jikgY+REB+AeKPsk28zjGxn0vpaCnsmK8lLbrebZDo=;
 b=mk6aoGatmgwBy+gTGvoY1MbPNYD0D1M1P7GG+hyFP8SaZLZJSls+Lc71o+sZXBnSP0eP+u
 NcZQ0Gi6EQzeOlnPSuqpcqYv4dBnbmOXOMqEInfET3P9iueIKmze4PmwPUuPrx1v8KVyl0Mx
 FTsTYtzcvtszuxLP8Q2WdUPQm7DGt2/yu3EB7GSM7D0mVn2eUTiq+0vBW9Ny+3XNRngIT3Ke
 NsIhpnyAnNS7HmV68pGrp92IgGaM40HVx0V65G/q3IcjFtc824b1lJuYl69lDOlrXXSEZJV6
 jCTGYavecdOo3uDle3F9I6/NBuUXSyuZ9IQ2YPb+Q5aGlg4cR3hdYJow==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] curl: upgrade 8.16.0 -> 8.17.0
Date: Thu,  6 Nov 2025 21:07:10 +0100
Message-Id: <20251106200710.3082982-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 20:07:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225991

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2025-10966 per
https://curl.se/docs/CVE-2025-10966.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/curl/curl/no-test-timeout.patch         | 2 +-
 meta/recipes-support/curl/{curl_8.16.0.bb => curl_8.17.0.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_8.16.0.bb => curl_8.17.0.bb} (98%)

diff --git a/meta/recipes-support/curl/curl/no-test-timeout.patch b/meta/recipes-support/curl/curl/no-test-timeout.patch
index 5b901a6fe9e..34e46fed6dd 100644
--- a/meta/recipes-support/curl/curl/no-test-timeout.patch
+++ b/meta/recipes-support/curl/curl/no-test-timeout.patch
@@ -14,7 +14,7 @@ diff --git a/tests/servers.pm b/tests/servers.pm
 index d4472d5..9999938 100644
 --- a/tests/servers.pm
 +++ b/tests/servers.pm
-@@ -124,7 +124,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
+@@ -125,7 +125,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
  my $sshderror;   # for socks server, ssh daemon version error
  my %doesntrun;    # servers that don't work, identified by pidfile
  my %PORT = (nolisten => 47); # port we use for a local non-listening service
diff --git a/meta/recipes-support/curl/curl_8.16.0.bb b/meta/recipes-support/curl/curl_8.17.0.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_8.16.0.bb
rename to meta/recipes-support/curl/curl_8.17.0.bb
index c226670357d..32585070ebd 100644
--- a/meta/recipes-support/curl/curl_8.16.0.bb
+++ b/meta/recipes-support/curl/curl_8.17.0.bb
@@ -20,7 +20,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-curl.sh \
 "
 
-SRC_URI[sha256sum] = "40c8cddbcb6cc6251c03dea423a472a6cea4037be654ba5cf5dec6eb2d22ff1d"
+SRC_URI[sha256sum] = "955f6e729ad6b3566260e8fef68620e76ba3c31acf0a18524416a185acf77992"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"

