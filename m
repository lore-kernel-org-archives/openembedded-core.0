Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 150B9C83F17
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 22:10:41 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.1200.1752185434455188708
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jul 2025 15:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=nNXdeUlu;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20250710221030b38251ddff4c497578-ljj7uj@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20250710221030b38251ddff4c497578
        for <openembedded-core@lists.openembedded.org>;
        Fri, 11 Jul 2025 00:10:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=3/D8ajkRRODgQXgO3NbcfDK9zYeXcC+j4csy2nxgI0Y=;
 b=nNXdeUluA1eVlwEVIt2JvAp62EXfUSCMvbx5/a90qj4Z7LfCq7hZqJYq09ApngMVLCIOMW
 Moonydj/ipuqIX9VBR6+u5yv7AecHCvkCQLRJg1ZebCQ7qg99iWoTFSs5abMRNo1PHwGP4pZ
 9eolhXzmDHXdLpFN5K4CiISjysfJgTQmYWYMHCU/LwPSoQN1AgYKmHrIwlaeJuWw9BXXtaYp
 gv2VwNZB4z+ptP9zO4xW8SCvf+akb0JFEysJA+zeitPuWNsWQnm76G/Vgfnc1Sqvu/4NxUko
 4eNc2hhaxjinZGmrh17IIfeLP2TdQFp+h2qyd9Oqw9meHpapyDFCuJkw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] openssl: upgrade 3.5.0 -> 3.5.1
Date: Fri, 11 Jul 2025 00:08:27 +0200
Message-Id: <20250710220827.2418121-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 22:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220129

From: Peter Marko <peter.marko@siemens.com>

Release information:
https://github.com/openssl/openssl/blob/openssl-3.5/NEWS.md#major-changes-between-openssl-350-and-openssl-351-1-jul-2025

Handles CVE-2025-4575.

Refresh patches.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../openssl/0001-Configure-do-not-tweak-mips-cflags.patch       | 2 +-
 .../openssl/{openssl_3.5.0.bb => openssl_3.5.1.bb}              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.0.bb => openssl_3.5.1.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
index 7043188973..cf5ff356ee 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
@@ -20,7 +20,7 @@ diff --git a/Configure b/Configure
 index fff97bd..5ee54c1 100755
 --- a/Configure
 +++ b/Configure
-@@ -1551,16 +1551,6 @@ if ($target =~ /^mingw/ && `$config{CC} --target-help 2>&1` =~ m/-mno-cygwin/m)
+@@ -1552,16 +1552,6 @@ if ($target =~ /^mingw/ && `$config{CC} --target-help 2>&1` =~ m/-mno-cygwin/m)
          push @{$config{shared_ldflag}}, "-mno-cygwin";
          }
  
diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.0.bb b/meta/recipes-connectivity/openssl/openssl_3.5.1.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.5.0.bb
rename to meta/recipes-connectivity/openssl/openssl_3.5.1.bb
index a7d08d5b86..7c40b6cf52 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.1.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "344d0a79f1a9b08029b0744e2cc401a43f9c90acd1044d09a530b4885a8e9fc0"
+SRC_URI[sha256sum] = "529043b15cffa5f36077a4d0af83f3de399807181d607441d734196d889b641f"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"

