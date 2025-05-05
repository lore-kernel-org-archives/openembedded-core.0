Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF7D0C3ABB0
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 09:06:35 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.46256.1746435985811329379
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 02:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HVU06gs4;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-af50f56b862so2827791a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 02:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746435985; x=1747040785; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JV//MsubayP8a2k4/bbRdSNjAVXtZ2pXGF7m5/BjpNI=;
        b=HVU06gs4Ja3VsQtiVrpMVpPCDwc0jOZKyzCHaFG+709umcdO4Duhh+8e3FZ/LTB1CQ
         Tt7V1zJ6pE4UlOI9e861TRScXALkIv487e79viZfizSFHU+QgXxAumy2ZX1DrVbGWNxD
         leqUgfT1gcqiXk50rIiXLuiLraqiN9NeS9xnv+AXVMrYw7Ri30YQI6EPAOR4R01yYHyp
         m4e/GMTKMfTNneVJ3xxYDXX25XdM5Kr+WbC1arQLZ8NtFTyFfv0XIREnxQTwjuVM4RW3
         jwrRrGheBJnPRZXWkXSa1u4FNd+MZmhivrNm3GAz6fV5DoVtE0DWHqkM7vN8FC3kVQE4
         HGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746435985; x=1747040785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JV//MsubayP8a2k4/bbRdSNjAVXtZ2pXGF7m5/BjpNI=;
        b=RhIe0Dp6U8jqkxxVOL9/RHJOx4QS+wkBn6DVkkYVc37JJveefb3haV1yyMfee0f17W
         U3nxkutFfT5XLDtAkKR3numlpx4Wzo9+OBCCII8BSz2AuiHrZhAmCQHo0p8y1iafzRiz
         /4SNyKSMWwAA0CzjapR0tV7YzsMxhmz/2PcFPd/D22p3gk+XgcO79DpaaFXdDRJ/h6M3
         GtjH9Io7+2wWj0WhISPa3VRab+cNEOH70uabzqsbbPM3AfNPe53B1xLSOzOLurPu78Zg
         sjSzqQLZOp5Wx+aNLGEZSdXPSCizXCtS6Ch7lH1nQ9OkeE4rzTMxRmLamSfXieKF1pB0
         aTJA==
X-Gm-Message-State: AOJu0YzGfMWcw+LUYzbepauta/G8yZy0tch7Oh+TMvnXj5ZbqycWbU4X
	RbfNe6n2I2KX6/rAcy1QgFgnqTOAxnawoB3UU7UYQHOG8YTcqCOmbmmzzA==
X-Gm-Gg: ASbGncuYWCe3UyofhOfwqTClRcFwq8MXaVvvc01z3JBCoO9KkbqGo0KyUmY4xZ8WqNi
	qoroYmXaHX4p2B5N1Amq2VhMwWtqrgTdQAenCmMUV0XkYXVcmLMpe4PR8y2L94lkaulBI/ikQjp
	0QQhY7ZpjKeN/TuFKRLyX7Kr7OMJR1rbVc5S3LxXok4+GmxHzqRGdw739udXFVu+RhWsTaZg6D6
	OmZ9bHrf7nCONVevH3J+ppSgTmgQIeomf4JlFS1U93YimCLMseeAhfM7aQ7eaCScCts7wOZwkbz
	T/YLdEpK3ZIttD9slM04t6lYZiRpz69UJVtlG77PsgbenGv+y0Dx
X-Google-Smtp-Source: AGHT+IHmfvmDhIZO2OxZJ9FJrQxyZwRLEXQd4CId9WxT7tLU2p1Mmpu28BLSeiaWUgFBZYZbJe6/HA==
X-Received: by 2002:a17:90b:2e0e:b0:2ee:f80c:6889 with SMTP id 98e67ed59e1d1-30a61a49181mr11435039a91.33.1746435984895;
        Mon, 05 May 2025 02:06:24 -0700 (PDT)
Received: from MVIN00210.. ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e152290efsm49698595ad.190.2025.05.05.02.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 02:06:24 -0700 (PDT)
From: Ashish Mishra <emailaddress.ashish@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: henning@itconsulting-heinold.de,
	otavio@ossystems.com.br,
	Ashish Mishra <emailaddress.ashish@gmail.com>
Subject: [meta-java][PATCH 2/4] Updates the SRC_URI for xml-commons-resolver recipe
Date: Mon,  5 May 2025 14:36:11 +0530
Message-ID: <20250505090613.818330-3-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250505090613.818330-1-emailaddress.ashish@gmail.com>
References: <20250505090613.818330-1-emailaddress.ashish@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 09:06:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215998

Signed-off-by: Ashish Mishra <emailaddress.ashish@gmail.com>
---
 recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb b/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
index 0fafcea..790b2e7 100644
--- a/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
+++ b/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
@@ -4,7 +4,7 @@ LICENSE = "Apache-2.0"
 PR = "r1"
 LIC_FILES_CHKSUM = "file://LICENSE.resolver.txt;md5=d229da563da18fe5d58cd95a6467d584"
 
-SRC_URI = "http://archive.apache.org/dist/xml/commons/xml-commons-resolver-${PV}.tar.gz"
+SRC_URI = "https://archive.apache.org/dist/xml/commons/binaries/xml-commons-resolver-${PV}.tar.gz"
 
 inherit java-library
 

