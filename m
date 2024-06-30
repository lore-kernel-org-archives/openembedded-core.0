Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B88C9C3065B
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:08:18 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web11.4359.1719778093518587692
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EffCIb4i;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.177, mailfrom: steve@sakoman.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-375dbfde049so10357555ab.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778092; x=1720382892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/ujgxfXsh3BGxISPR8+NxUWaBAr6W5y+1tKlBuC+nY=;
        b=EffCIb4ifWovC4i8iWlhzwzYC/7AmirmeXjGbsilfFCo1Mn0MTk/zu8EncaEYNmwsB
         Hd6OkoWOCEsvPqH1kbMC6hg/yp07NRyZI+rYVYwYfwRFjOfzZ8GbapsNpYTGixJLEtKt
         Vuc8DzUwW7ttFRFmI8eWis4iyyYBiGQKsePtW3pHHT3ZKZS0/foy+5+7uNNBI9AnQ03I
         rHI70F7JV2c740DinDkzesHU0im6Y1kVJ8BwPrD4+FgcErnc/qLCOk4xO2Q7nTj2Y9CX
         tiFq5I9+bzw4mA+IM9bBvsvfGm3rSWupa+tYa6C8jksxCZNWNatp19BQCWf/4N8dg/nK
         W0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778092; x=1720382892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/ujgxfXsh3BGxISPR8+NxUWaBAr6W5y+1tKlBuC+nY=;
        b=WMAEDmzcsMLP9qM2FwirT4mi+4wUel/Fys8mEXbah0s+47s2u+H7CmiBFH4f+ga2bg
         IbfLvWdoYBRVwGysBvUDaDZylgBXLKi86c+B7LIbk9fqrrVl35Tb5wVHlUMS/FgikqMY
         efZmEjs4VddGUoENk664Qc4MRPiqdMAx/NHlNNZ4dNBiUmzdD6AbLnlmBpjlN00fDcuK
         Uv8WZKbrnjWfSbSzbZ6mPO17IyfCqdbhW6z41ppCGyPrHXgJ2G8AEORxe76MnAym/ujF
         i3/3BTwb3PgSvJQn8s4yfky842g3zHyEHUHdg5IXxhJ/7P1lrnqtQKzAOHQ5iicDb2lH
         krHg==
X-Gm-Message-State: AOJu0YwY9ujfteVLvF2T6k2yyUinz34wRVURKIX3naWrOPC2TvnpQ6EF
	s/mv7+jCIHLBADsFCKDoz9zfw6bjmJ3rY+Ny0/98gTJpTdH2ScgPJv6MuTmk+RKPOZgBujC/735
	Z3to=
X-Google-Smtp-Source: AGHT+IEztkiZSOKnGkWuw+QezMkKe43K06nc0heD1S7bPF774pBzPGIs6F2EEAfdd+krGuTiV1WqCQ==
X-Received: by 2002:a05:6e02:1fe4:b0:375:9c7e:d04 with SMTP id e9e14a558f8ab-37cd169a25bmr54828185ab.10.1719778092633;
        Sun, 30 Jun 2024 13:08:12 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.08.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:08:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/35] linux-yocto/6.6: update CVE exclusions (6.6.25)
Date: Sun, 30 Jun 2024 13:07:24 -0700
Message-Id: <0deabc190dfee2717f1c11a466825e051063adcb.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719777887.git.steve@sakoman.com>
References: <cover.1719777887.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:08:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201249

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 25Feb24
        Date: Sun, 25 Feb 2024 07:03:08 -0500

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 70bf42cc53f04bf8137092dfc175cb57001dbb16)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.6.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
index 133cab88a3..4a7086a84b 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-04-04 03:23:25.421265+00:00 for version 6.6.24
+# Generated at 2024-04-09 14:35:54.393486+00:00 for version 6.6.25
 
 python check_kernel_cve_status_version() {
-    this_version = "6.6.24"
+    this_version = "6.6.25"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.34.1


