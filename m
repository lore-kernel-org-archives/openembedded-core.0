Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web09.10494.1628177710662825302
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=gIjQnrts;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.176, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f176.google.com with SMTP id w6so7853052oiv.11
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hUHhtbR33JR76WTusVJOzXUCcaYeZuXWMweD0G8ZhcI=;
        b=gIjQnrtsOGQn2JX3BupXqZ298odNX/vTvHiiycQ7Um/NzJIEAGEH3hM8xH8XplpN78
         GkIbJmuPIMlz7rWbtJz1Vx/bm5Sqi9IqlOPnLXsJGGsAZY9RFL64ET8vPK5C8byDnKr9
         6cl44sHHY7nninYbdvO9/dnrp1OBQcXYlvpGW9khZpseKOttv9Ve65+ksZ4JQhQiPCUU
         qorhYOkdrCg1xW6W2snoNYk8IITzu3xRuSlXSgqH1IfWsmktKL0w6nLUTMGItkUGbbJ1
         m9HnZECYRlg++kyS5D2O2buBfn5j1CmUKx7c5nlzDBqyKYPNaIhlVmDRyoeD3wi0nUDu
         ZLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hUHhtbR33JR76WTusVJOzXUCcaYeZuXWMweD0G8ZhcI=;
        b=FZl6cni9zLKRGrZ92kcyk2IEhtLfUyHCoJ/td0MmcDfZ5nzrryCvrsGRGCGLS5egeu
         7UDyfJpGN0B5upt2C8Lvz4oPQaKYsu0soIRGM+rN03WPwa+V/Mye1RG14BruruiXjcJL
         WL0FFaxm/i1Smc8qkp1cit6dGsuPE+4WCH+f4VTEgYZV2B8IqE2jRuaPcr3h3/WwII4r
         47rn+pJHnOwj5Y71H21N3ZccMD3zZIufdy380AGFgj8Qt57SITOCCOCUKRDVTdfEdJcm
         Z0o/D/agDbmrixLDKkHH9T9a6bily2oKcYyWpPDeg1CP5g4KgP+8TnPvxq8Bdrttv699
         5UkA==
X-Gm-Message-State: AOAM530x95dhmrPmSSyiW9Y0zux1GuQWdQkMHAdw6ktwp4A6tV+KfTgX
	x+wHH9ju27agJhGtN6RWtvoA9bGSB0o+U84x
X-Google-Smtp-Source: ABdhPJypBiVuRhBMs/zJ+TAwSDFAB4zLUxzpBqIec22zoNPmlifxzFz64gfL1Vfis+TO4CFf4xqvdw==
X-Received: by 2002:aca:3e06:: with SMTP id l6mr2272199oia.177.1628177709629;
        Thu, 05 Aug 2021 08:35:09 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.35.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:35:09 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/33] gstreamer: ignore CVE-2021-3497, CVE-2021-3498, and CVE-2021-3522
Date: Thu,  5 Aug 2021 05:33:40 -1000
Message-Id: <55140153e66f13a2d8a673a48f6c21e293415e56.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CPE entries for gst-plugins-* are listed as gstreamer issues
so we need to ignore the false hits for the CVEs we've patched
in plugins recipes

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
index 7afe56cd7b..a516fabdaf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
@@ -74,4 +74,13 @@ FILES_${PN}-dbg += "${datadir}/gdb ${datadir}/gstreamer-1.0/gdb"
 
 CVE_PRODUCT = "gstreamer"
 
+# CPE entries for gst-plugins-base are listed as gstreamer issues
+# so we need to ignore the false hits
+CVE_CHECK_WHITELIST += "CVE-2021-3522"
+
+# CPE entries for gst-plugins-good are listed as gstreamer issues
+# so we need to ignore the false hits
+CVE_CHECK_WHITELIST += "CVE-2021-3497"
+CVE_CHECK_WHITELIST += "CVE-2021-3498"
+
 require gstreamer1.0-ptest.inc
-- 
2.25.1

