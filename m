Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC79C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 15:36:46 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web08.12494.1639409805622739720
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 07:36:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=bj8kU16G;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id b11so11407569pld.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 07:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NZqHBnxjLmaSXbGEVwYftdUC0yinLNXoPPKdV66NP00=;
        b=bj8kU16GATdeKiJBtBTMxuV3IZog0YF5+6F5F0Js2Ir/4sGvp84n9mPypv4qzqnpZW
         Cgoo8f7L4jZSlol49biTKNrZf1kCrZNybVqsnao6QOnV8WPzbyt7X4iJvST6UsL4ITVy
         o48XZtKQcNbqT2qgGkIUH+U/IR0fYL8xfg5109KLIVUdD3daKeNwnpTNvcPX0Wo51Hf+
         uH0ZrSpO7sy6wgm9p9xBDDzkZv6J5Yk/aolA7ZmZnvLE2QkoBaaQrEtslPU96PFGcxjk
         RzDyVd1Ae5P/qHDPFSxbbexPc3nuoQnFtlKVGQTjP1WA6bgusRPO/Z36A95dlL1TnJqS
         VgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NZqHBnxjLmaSXbGEVwYftdUC0yinLNXoPPKdV66NP00=;
        b=Kea/7aBwxa9DxGSficcjGogokjiWtnS3npWZ9HjMNy1vbsJX28rNiCiJ3Y+Ti4kARp
         +49rPFIpYBmSg6tefhlXXnd82cct39KMJu3d6eQ6CYrOrhYLVDOKzXaChWcFflTVbbpq
         9aZqSF+wsFB7qFqRjXhiiu0pZArmER+LVMENHkSD3U3XOkXZRGC7BtOEu1xY27CWcxuh
         kdtoPWVkkxnoVyoRKvEiUUyRWjuGhX/QUz/qrhR3poct8quVgzjGBdXham2GXlQNy5fc
         Qc4w0a//l8S2l/sa7nD9wjl29Ba2aaSx1uvw7dab5qhFbTXrGDK3oAUSCix5w7l5Dar5
         yiJg==
X-Gm-Message-State: AOAM53399Pi8i/Mh3BJ0zUKKT4hF29W7wTve96Fa1uO7p7GhF8ug3q2w
	s7vFXCT9wRwLbIHT2aTczhDMm8/Ap+xLRaSg
X-Google-Smtp-Source: 
 ABdhPJxvvDFhoHhwXJLu5PkKW1CCmkbOsnajHE8bLALwjC8m6ihtHHaeWd/YEw4HGgysYq3/zd5Pfw==
X-Received: by 2002:a17:90b:3b8c:: with SMTP id
 pc12mr44746854pjb.9.1639409804453;
        Mon, 13 Dec 2021 07:36:44 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y28sm12850297pfa.208.2021.12.13.07.36.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 07:36:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/10] cve-extra-exclusions: add db CVEs to
 exclusion list
Date: Mon, 13 Dec 2021 05:36:19 -1000
Message-Id: 
 <15ccac9307a8a3a69ea7e9e611688dbb63df32aa.1639409496.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639409496.git.steve@sakoman.com>
References: <cover.1639409496.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 15:36:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159644

Since Oracle relicensed bdb, the open source community is slowly but surely replacing bdb with
supported and open source friendly alternatives. As a result these CVEs are unlikely to ever be fixed.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 679fc70f907fb221f4541ebf30c1610e937209b7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/cve-extra-exclusions.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index a6f52b5de7..e02a4d1fde 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -44,7 +44,14 @@ CVE_CHECK_WHITELIST += "CVE-2010-4756"
 # exposing this interface in an exploitable way
 CVE_CHECK_WHITELIST += "CVE-2020-29509 CVE-2020-29511"
 
-
+# db
+# Since Oracle relicensed bdb, the open source community is slowly but surely replacing bdb with
+# supported and open source friendly alternatives. As a result these CVEs are unlikely to ever be fixed.
+CVE_CHECK_WHITELIST += "CVE-2015-2583 CVE-2015-2624 CVE-2015-2626 CVE-2015-2640 CVE-2015-2654 \
+CVE-2015-2656 CVE-2015-4754 CVE-2015-4764 CVE-2015-4774 CVE-2015-4775 CVE-2015-4776 CVE-2015-4777 \
+CVE-2015-4778 CVE-2015-4779 CVE-2015-4780 CVE-2015-4781 CVE-2015-4782 CVE-2015-4783 CVE-2015-4784 \
+CVE-2015-4785 CVE-2015-4786 CVE-2015-4787 CVE-2015-4788 CVE-2015-4789 CVE-2015-4790 CVE-2016-0682 \
+CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418 CVE-2020-2981"
 
 #### CPE update pending ####
 
-- 
2.25.1


