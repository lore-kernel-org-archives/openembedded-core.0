Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8255C021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 18:57:13 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.2017.1739473026282338366
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 10:57:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=GnyJUM5S;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202502131857027764e900a1f7a602b8-vfa2g7@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202502131857027764e900a1f7a602b8
        for <openembedded-core@lists.openembedded.org>;
        Thu, 13 Feb 2025 19:57:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=LzFMaV1EKUqLC9HRv0mM10NTJBdKgEEMs03AWRvIqkE=;
 b=GnyJUM5SoVOo20OjmZvtKBIprkyR/BE3XcS2y2JaauvI/SMpoZqnBKGU1kzqpNSiF1rq3N
 lB3C0iw2l7WjLssmSS42NXqNW6uLusgsEBUq913loQGFTcVPIyjutqqxVE6erCNjv/Avp45p
 14C5C/8sGbUqlhxQtnyzfCzVqba2OV79SwMKCx+eaWXZcWSY49/SFbytoSJ9+d8vIixAKWt5
 WOJVwYCy5zK+0xk6MJEQKwyo3+0PrhVbqEdoOyC8iUPSk1iwY6ypt07a7t9AgOSWIHMwXPpi
 E2bkW60M4qXw4n/XpGkJiI0PiURLW+kzwH1O3nsZ+P73Ytz5cR1DgOtQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] curl: upgrade 8.12.0 -> 8.12.1
Date: Thu, 13 Feb 2025 19:56:09 +0100
Message-Id: <20250213185609.1873389-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 18:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211363

From: Peter Marko <peter.marko@siemens.com>

Rebase patch which needs it.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/curl/curl/no-test-timeout.patch         | 2 +-
 meta/recipes-support/curl/{curl_8.12.0.bb => curl_8.12.1.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_8.12.0.bb => curl_8.12.1.bb} (98%)

diff --git a/meta/recipes-support/curl/curl/no-test-timeout.patch b/meta/recipes-support/curl/curl/no-test-timeout.patch
index fe8efbe612..677d177302 100644
--- a/meta/recipes-support/curl/curl/no-test-timeout.patch
+++ b/meta/recipes-support/curl/curl/no-test-timeout.patch
@@ -14,7 +14,7 @@ diff --git a/tests/servers.pm b/tests/servers.pm
 index d4472d5..9999938 100644
 --- a/tests/servers.pm
 +++ b/tests/servers.pm
-@@ -122,7 +122,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
+@@ -123,7 +123,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
  my $sshderror;   # for socks server, ssh daemon version error
  my %doesntrun;    # servers that don't work, identified by pidfile
  my %PORT = (nolisten => 47); # port we use for a local non-listening service
diff --git a/meta/recipes-support/curl/curl_8.12.0.bb b/meta/recipes-support/curl/curl_8.12.1.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_8.12.0.bb
rename to meta/recipes-support/curl/curl_8.12.1.bb
index 7b5e6350ba..1e9e5a0229 100644
--- a/meta/recipes-support/curl/curl_8.12.0.bb
+++ b/meta/recipes-support/curl/curl_8.12.1.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
     file://disable-tests \
     file://no-test-timeout.patch \
 "
-SRC_URI[sha256sum] = "9a4628c764be6b1a9909567c13e8e771041609df43b2158fcac4e05ea7097e5d"
+SRC_URI[sha256sum] = "0341f1ed97a26c811abaebd37d62b833956792b7607ea3f15d001613c76de202"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"

