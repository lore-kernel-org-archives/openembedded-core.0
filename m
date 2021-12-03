Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5DFC433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 18:21:27 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.15182.1638555687010238847
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:21:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=VPzJjJDk;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id i12so3653229pfd.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=RrDqPF7dk0YPOV3L/YC5t4VE5k8J84HHH3N/4Hbjub8=;
        b=VPzJjJDkKYjR+L54p2OLlI5vGEhRqrErnQiLD64nmZNGL/cxGV3u/GvKuTSTGkAJMY
         7ZIzr2uF7LovYiA2j7VZL5yRAkNEA416rm7rU/QEUxqHphplp35OJdCNBpXDSBkdCEJU
         b+UMzO+Qxh66GWt2PyHE+s8JgZbaVIvpRqbH6AHo5pgUMY9vzqgKbJDJXkwmNMxC0U+t
         7UGXui1FzJZ4AUyPgYlh++7+qmwNwY6ZwU3A5ur0qiu8Cw5tCI3ybgYt8qbdqRuY0vEC
         GkzVPdXTxprLj/mxpBCWTiJvUPqjRicD25DESJp2AxlwVQRzpKEmHtdDqCaMv2je++gU
         ISjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RrDqPF7dk0YPOV3L/YC5t4VE5k8J84HHH3N/4Hbjub8=;
        b=sXZbYX2IjLy/XBxQ/YVx6Rioo0DS3VNYqelWDAmcXKxxp1ZgvJELgZOFXkB4I/siuB
         eir8K5kXbwVTow8mDOBPuSelqbmOGq0RoqgeiIGno1OYPTh5ifC0cGGDc/B62ZQg0K12
         Vo+2V4JNnQAQ6iQi3KTJdhIi2+aavGcYf5jkZ0pBfrjLNZHMDAHcJNuTYkurcjeYgga5
         gMjdJnGjBKgwfoAQupodKAlRUBQuZimdKk+GWZST0I4REUWSFhIbUuKh3h5meynEoBMX
         s4rnziDVq9YretJ2siPqC0Q30sWNCAVOvv8poBkhkueq0hN5wwThytkzbpOEMeMEKHEy
         737A==
X-Gm-Message-State: AOAM5316qqAZWhr7rJqyWePgAdbvu5iEW2RDRBUh781/xWrRAnKNSeqb
	DDgc776UMknhEBNrQredZjqlEvImWg2vvtWHlOE=
X-Google-Smtp-Source: 
 ABdhPJyYHK+OIX9ErWhEOUeQpeMchtci7Bs/D6LsN9bM7oz61f4yx2YcHuNq6FzZqGpFsKIWhPEjiw==
X-Received: by 2002:a65:4cc7:: with SMTP id n7mr5708100pgt.179.1638555685483;
        Fri, 03 Dec 2021 10:21:25 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 130sm3959753pfu.13.2021.12.03.10.21.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 10:21:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/18] cve-extra-exclusions: add db CVEs to
 exclusion list
Date: Fri,  3 Dec 2021 08:18:48 -1000
Message-Id: 
 <2a157263e5632146b28fb3c0678c18c21f357d34.1638555254.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638555254.git.steve@sakoman.com>
References: <cover.1638555254.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 18:21:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159128

Since Oracle relicensed bdb, the open source community is slowly but surely replacing bdb with
supported and open source friendly alternatives. As a result these CVEs are unlikely to ever be fixed.

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


