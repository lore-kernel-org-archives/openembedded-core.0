Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 153C4C64E92
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:48 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.10862.1648900078471361997
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Apr 2022 04:47:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=qVY+AEY6;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.49, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f49.google.com with SMTP id h7so9268750lfl.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Apr 2022 04:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fEXgRzoHafB0OXW6Ux1D9+WK47hftb+9xcuSHXnRFN4=;
        b=qVY+AEY6cvK4jjspcDI8n4V2b/DwJCPAFjebPbasEDC0sFMjm2G4xXS2FMTTro2Fjv
         Iqd8kJSnUbQ66Sd3YAAWSPHFWE33RW4ObPPInMr+/wUeFNENeFKpCADNG1uGsorpKw4g
         H9AUpl8diUwmq6ihm+Is+drtlT+k4nKQZLQU8WZol5Sz45b4LnWfUw8BZjM67XlamLX7
         MWWSVudRsAAPVB7mm4Iwts0/gLTMI/7QMB4Pe/wwYz7JSxbYOu6Stls64F+IQ0tspQTc
         u8SINrGM0cHnV8Z92JLsOEGyTWHMEI0CkK1rqno38FvOkdnlD0EMk0Tc7Mn3U4YKPXqz
         tjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fEXgRzoHafB0OXW6Ux1D9+WK47hftb+9xcuSHXnRFN4=;
        b=FSIfsjSTxGjzP+PWLHRpYYDf/XALI0MxzWuiwc+eRgEb772AzJLZu80RM/+pDIBw8Q
         R/lw6ipJgDgj8c3O0rTb0gQhdqhE5GTl7xtIRV3UPlS5X6wVD6z/EYOxYIRCYPJRWVSL
         Exy32vK/fr35NBXOlhBfPr6RWqZYFtJkysDB13xEzZm8RrR81cw2ALT48UdAxZoWJj+2
         EJtVkMT0djBgceDlFbSfD0L3LaTqgGTuoaUI1y9DoGXRxRepQwGYMB3lzL18dp0W3ib8
         H13lTgDL+v3OS37J8Dhv/QV2G6NiW2Lz/jR66KyU4dYAX2N3fIIEIsM0lV0FQgCY1r/L
         pgDg==
X-Gm-Message-State: AOAM531lCHoo9pcohXKuRWur29K54K0GUJnFuWmU9K7gDgfdXr1rFZoN
	Z/kA9uurENx71XzTTha12YaR4MtsmXeMvyHH
X-Google-Smtp-Source: 
 ABdhPJx+ep/Pfu04+8CHybJ6omnTtq1JKTKRLZ59RZZ5ESWqqFvjLcnXXjEYuV3CG3UsMxINOM5nwQ==
X-Received: by 2002:a05:6512:1112:b0:44a:4096:39b0 with SMTP id
 l18-20020a056512111200b0044a409639b0mr16832716lfg.35.1648900076108;
        Sat, 02 Apr 2022 04:47:56 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 p17-20020a19f111000000b0044a6522f9acsm504056lfh.135.2022.04.02.04.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 04:47:55 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] tzdata: update to 2022a
Date: Sat,  2 Apr 2022 13:47:53 +0200
Message-Id: <20220402114753.2560766-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163957

---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 43d14d7f12..cdd1a2ac3c 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2021e"
+PV = "2022a"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,6 +14,6 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "584666393a5424d13d27ec01183da17703273664742e049d4f62f62dab631775"
-SRC_URI[tzdata.sha256sum] = "07ec42b737d0d3c6be9c337f8abb5f00554a0f9cc4fcf01a703d69403b6bb2b1"
+SRC_URI[tzcode.sha256sum] = "f8575e7e33be9ee265df2081092526b81c80abac3f4a04399ae9d4d91cdadac7"
+SRC_URI[tzdata.sha256sum] = "ef7fffd9f4f50f4f58328b35022a32a5a056b245c5cb3d6791dddb342f871664"
 
-- 
2.25.1


