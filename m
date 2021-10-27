Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B6CC433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 12:56:37 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.11192.1635339396453167265
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 05:56:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WL8OR6Vk;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id l186so2820362pge.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 05:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=ohfbJwamojPUr23+PlD+9EFhKRDTMDoi9ipJIstbP9U=;
        b=WL8OR6Vk2ufget3pZb6ita9+tFML/5azv7Xi0iZvR/zKFLpKRT9biEG/Nu5NFu0MmD
         Wpw8jW/xNDV81MfiXPp77EqqJZ7ZoYjMF0sOBpanN2yB/1MQz3AHdbOgKPYLapXL5YwD
         X/DsFyiU7AEnZtTJyGrL6N2v9Jr9+1G5DEI072d68ZEj3ziAY7/hENZNVdjTaWcuqo+x
         0ervEk62L/3AxNFeGzE8+uIcpGeeEEWoMoCYvJhKrYvk0bagSBV0eceof1Z2FCsUgzBw
         KbR7m1rc8raQduwa2YhR6O+rX3eSoj2JvWKMk2AaR0x5a3e6iiD/S1+YiucBMgENYfGY
         9onQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ohfbJwamojPUr23+PlD+9EFhKRDTMDoi9ipJIstbP9U=;
        b=n27eyqfD6HzfE/rvhUW0kbvRUfXl4nDhE2poK/RPfZpciyOFfE5bmHwmQoF4lEAELy
         e9eBwbj3g8pMf0wmbjgJHtaHIpvlhMOP6+Kj+9Hx/OtFZzldn/8tCVaVmVTUFkkxsYLR
         Qsw3YKvZacpcKPrL1vu7j/+M2K+g2qnwsUCXleqC/XfkCFWwYEtsAt10NXs/c3ujhnkQ
         OQxjGEFsjDFJVwn71BfwvXGZr8g7K0EMC2abOdvresXm+UCkGoU8rwxedj8gJOqNHLTm
         lM3wI9mkg9pQFbmmyMaTEsYs8Ejxv0SCJU9kMEc4nO9oi9n8JA7LevsiHD0k3rQdEPef
         hT1g==
X-Gm-Message-State: AOAM533VuxxCTzvijF7eWU784+Qf9SxNPHF0hgMR3nkf1KI7UHywf6aj
	PhFRbKZYxMiQEDPF/3MXX9bTK9nByBS4cg==
X-Google-Smtp-Source: 
 ABdhPJz/AnyR+qHyKWlzrt+1/+seySdhXnzSCsK4+eVmTMPo6mrMA0JCB6/0jtkEkVpiQZtLkyuclQ==
X-Received: by 2002:a63:6dc5:: with SMTP id
 i188mr21981628pgc.58.1635339395579;
        Wed, 27 Oct 2021 05:56:35 -0700 (PDT)
Received: from localhost.localdomain ([103.238.107.247])
        by smtp.gmail.com with ESMTPSA id
 f15sm29125478pfe.132.2021.10.27.05.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 05:56:35 -0700 (PDT)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [meta][dunfell][PATCH] curl: Whitelist CVE-2021-22897
Date: Wed, 27 Oct 2021 18:26:18 +0530
Message-Id: <20211027125618.1617-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 12:56:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157512

CVE-2021-22897 is affecting only Windows, hence whitelisting this CVE.
Link: https://security-tracker.debian.org/tracker/CVE-2021-22897
Link: https://ubuntu.com/security/CVE-2021-22897

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 meta/recipes-support/curl/curl_7.69.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index d7ffb2dc50..bc1b993e9e 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -34,6 +34,11 @@ SRC_URI[sha256sum] = "2ff5e5bd507adf6aa88ff4bbafd4c7af464867ffb688be93b9930717a5
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
 CVE_CHECK_WHITELIST = "CVE-2021-22922 CVE-2021-22923 CVE-2021-22926 CVE-22945"
 
+# As per link https://security-tracker.debian.org/tracker/CVE-2021-22897
+# and https://ubuntu.com/security/CVE-2021-22897
+# This CVE issue affects Windows only Hence whitelisting this CVE
+CVE_CHECK_WHITELIST += "CVE-2021-22897"
+
 inherit autotools pkgconfig binconfig multilib_header
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnutls libidn proxy threaded-resolver verbose zlib"
-- 
2.17.1


