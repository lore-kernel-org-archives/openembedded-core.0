Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD5BC83F1A
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 22:11:00 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.1243.1752185453829562618
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jul 2025 15:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=VtZybNNN;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20250710221051fc33d07476067fdbb9-p6n5tt@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250710221051fc33d07476067fdbb9
        for <openembedded-core@lists.openembedded.org>;
        Fri, 11 Jul 2025 00:10:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=pnqMx9QPUtSxk+EaUE7EFGSm8nbuiH06JfH+C3s9J2w=;
 b=VtZybNNNAw3/rESQFG3OoHsoqdjkCOoy3L72CWMrzM303grxeBjUYV36LnjBcRZLhhiJaE
 iA7wOLGBQz6v1dfW9hFoyetYl4/XlFkFtZrxjXUcjMd12FLYiR9PPE89OkEhr9Q2OkkxQ1/Z
 Pc7+wnBVxtH66F1BcRAszoz4OsLZKYuRM17ih3MNyh9ziOpTXtYy/5AXtVlvcQ0DOYld6Uvg
 dE26bqCQoNDiL9SGj2i8w98xq41rDkK3mJB8psPHX0MviW8fNG1vYluOaTA7ZM8vFBxSZ1s/
 DP6LkitogJ4EH/gS/ZDSSn45IIXiviGwbxW1nsa4Yl9eaAhhUjcVKwMA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] openssl: upgrade 3.0.16 -> 3.0.17
Date: Fri, 11 Jul 2025 00:10:03 +0200
Message-Id: <20250710221003.2418314-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 22:11:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220130

From: Peter Marko <peter.marko@siemens.com>

Release information:
https://github.com/openssl/openssl/blob/openssl-3.0/NEWS.md#major-changes-between-openssl-3016-and-openssl-3017-1-jul-2025

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../openssl/{openssl_3.0.16.bb => openssl_3.0.17.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.0.16.bb => openssl_3.0.17.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.16.bb b/meta/recipes-connectivity/openssl/openssl_3.0.17.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.0.16.bb
rename to meta/recipes-connectivity/openssl/openssl_3.0.17.bb
index a9fffd18ba4..5bc8801b98b 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.16.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.17.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "57e03c50feab5d31b152af2b764f10379aecd8ee92f16c985983ce4a99f7ef86"
+SRC_URI[sha256sum] = "dfdd77e4ea1b57ff3a6dbde6b0bdc3f31db5ac99e7fdd4eaf9e1fbb6ec2db8ce"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"

