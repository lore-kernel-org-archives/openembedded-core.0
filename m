Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258E2C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 19:51:37 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web09.2920.1643917896478582350
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=pJmOTf8z;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id u130so3118935pfc.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=acfMHpRl/DhPcBMJj+hgjbKjZiQo+ZcgGiy8E7ZBpHg=;
        b=pJmOTf8zXtW41AC7Sz3StTH3z5nV8+9OV4QLGIMe756r+dV9QBM3Z8TLKn1rtEtkAH
         VP3tHsKKwATirdhgevAdY3O4bO0Q2VMd3z/InND19N6TqDKRxH/OmUnLAVRZsVxtVDt7
         OjsIk2MmsIt8ZcwmBjwczq6d+22zoeryQwghB/2vsOJTz3PJJhfIcVluoHlH+ilxzfU0
         kKzkDDpjqoBH6Gs7y1KDRuZeNw+lXMT2WBRlJnBHipHK3zJidarRjuu/vUskIzygTVS8
         sPpsLWCKxEMTR2jUvy8d3nAtntZ9lf93kuPC1t+5r6OtWa4cUpXZoFf+qbF5mrQrLDN4
         XFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=acfMHpRl/DhPcBMJj+hgjbKjZiQo+ZcgGiy8E7ZBpHg=;
        b=QeGG5w5YsFDU0TBEHEy65CBXulehQSxrjC6fsUDM6I44jCAEiQk/rYdWzX5frI5dcN
         b/Z8ag8eI5vsomdo7TeffAHtc1xYcbpDWwBI8Oqnoni5cxRi+tGN46qVTfX6FAUdLY/d
         3FQcLD1AntYCtEzq/DzIDgvnbK6uw9ebUo/YO4lKG+YHuiFCBszc1VOLab7ayMbjVvq0
         YBIGlGCUciQFqde2Xo5V4HBoQr0NoATuihdqbbMkiMtuCWlpo7H7vTFcpI8b8jz7WltY
         LIS5tLKXAomvNuU0soFiEyxyRKu6DQsgWI9u6F9b4URFw4wLibx40qPzqPSeNmGgCQrM
         BF5A==
X-Gm-Message-State: AOAM53081AU2H1TXxgCB+DjXLRtY905v2oUXOFEcpqCdDq1VJMTOJ+f5
	1u7GJ58XKw94GW08HGreTPNAXP4VHn+NTNHV
X-Google-Smtp-Source: 
 ABdhPJxuEdK0RBvDHSdTO9XN+GQfvOhjJDm3WO+qWNPYpyxEPopyDtpmw4SrzWn5eaCN9KyEWbVMxQ==
X-Received: by 2002:a62:1715:: with SMTP id 21mr35155765pfx.59.1643917895404;
        Thu, 03 Feb 2022 11:51:35 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s4sm27762216pgg.80.2022.02.03.11.51.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 11:51:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/20] glib-2.0: Use specific BSD license variant
Date: Thu,  3 Feb 2022 09:50:39 -1000
Message-Id: 
 <746337ca6c89b116a314ebcf7169f6f88add0270.1643917717.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643917717.git.steve@sakoman.com>
References: <cover.1643917717.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 19:51:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161310

From: Joshua Watt <JPEWhacker@gmail.com>

Make the license more accurate by specifying the specific variant of BSD
license instead of the generic one. This helps with SPDX license
attribution as "BSD" is not a valid SPDX license.

(From OE-Core rev: 91cd1ef01a3f3883c04bac67af2672ec60e20fb8)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index c3ddf18387..1849a6e05c 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "https://developer.gnome.org/glib/"
 
 # pcre is under BSD;
 # docs/reference/COPYING is with a 'public domain'-like license!
-LICENSE = "LGPLv2.1+ & BSD & PD"
+LICENSE = "LGPLv2.1+ & BSD-3-Clause & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://glib/glib.h;beginline=4;endline=17;md5=b88abb7f3ad09607e71cb9d530155906 \
                     file://gmodule/COPYING;md5=4fbd65380cdd255951079008b364516c \
-- 
2.25.1


