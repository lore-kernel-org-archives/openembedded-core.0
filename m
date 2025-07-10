Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB39DC83F1A
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 22:11:50 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.1219.1752185502308315655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jul 2025 15:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ETXwtfnk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20250710221140b2234a673fe39b9cb7-owpzo6@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250710221140b2234a673fe39b9cb7
        for <openembedded-core@lists.openembedded.org>;
        Fri, 11 Jul 2025 00:11:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=RMfluZUHoYne4Y/v+VlqSLYaEPvv8XEf+jka4fu2R9g=;
 b=ETXwtfnkqTbDViAaVbJrzvWaTrfBuDTmiOFKUuubU6muv3dOqy/J4TZZ+gEp8wYHNlbSqW
 ZhdJzWf8wgqHuabtSnsN8bP5mdgh1yAxjSoJ/0qM1DRF3S2DV2L2aMOF+GHZL76u7NvX0TPn
 B0THPk73SOUA2yhy/wXb25a6C6qJVafbwcaCcv4HcQK5ru3FDm9OkKd3lEXa/RFe4JvFtJNK
 1KHTUTbT4zmq4rJ0JRvhdzzgtLCDJX/G8vFVLlfSWcC3vnUNafMtpcj5ifIy0RuYk64uCk6Q
 KyZ9E2QJfa0zv/tnW2tRbobMXMnSQkn1fuxnPcQX4DrZEgJS9rrpEE4g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] openssl: upgrade 3.2.4 -> 3.2.5
Date: Fri, 11 Jul 2025 00:10:53 +0200
Message-Id: <20250710221053.2418550-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 22:11:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220131

From: Peter Marko <peter.marko@siemens.com>

Release information:
https://github.com/openssl/openssl/blob/openssl-3.2/NEWS.md#major-changes-between-openssl-324-and-openssl-325-1-jul-2025

Handles CVE-2025-27587.

Refresh patches.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../openssl/0001-Configure-do-not-tweak-mips-cflags.patch       | 2 +-
 .../openssl/{openssl_3.2.4.bb => openssl_3.2.5.bb}              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.2.4.bb => openssl_3.2.5.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
index 3f6ab97795..153bb1e843 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
@@ -20,7 +20,7 @@ diff --git a/Configure b/Configure
 index 4569952..adf019b 100755
 --- a/Configure
 +++ b/Configure
-@@ -1485,16 +1485,6 @@ if ($target =~ /^mingw/ && `$config{CC} --target-help 2>&1` =~ m/-mno-cygwin/m)
+@@ -1486,16 +1486,6 @@ if ($target =~ /^mingw/ && `$config{CC} --target-help 2>&1` =~ m/-mno-cygwin/m)
          push @{$config{shared_ldflag}}, "-mno-cygwin";
          }
  
diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.4.bb b/meta/recipes-connectivity/openssl/openssl_3.2.5.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.2.4.bb
rename to meta/recipes-connectivity/openssl/openssl_3.2.5.bb
index c4ad80e734..ca2c0d18bc 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.4.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.5.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "b23ad7fd9f73e43ad1767e636040e88ba7c9e5775bfa5618436a0dd2c17c3716"
+SRC_URI[sha256sum] = "b36347d024a0f5bd09fefcd6af7a58bb30946080eb8ce8f7be78562190d09879"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"

