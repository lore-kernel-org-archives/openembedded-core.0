Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F0AC27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 15:31:37 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.59979.1718638291421520202
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 08:31:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gfkLJOY6;
 spf=pass (domain: mvista.com, ip: 209.85.214.173, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f70509b811so31374515ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 08:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1718638290; x=1719243090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T7/MTDFiI7KLO+MTNpdpEHyUbdZqXSo8JiHiM5lz8PI=;
        b=gfkLJOY6enGrosLftgjEvvH/R5U8NeYoTrLmuxMMn7R0cEFPhyxxsYTqELLohbVkd8
         ZRdmR1eHFy2Nlk2IQ+aod/UVf42OCxjAf0h/7C5SmFa9u/jp/5pYDLrp4eBhSY58hqyE
         8wKpYXKlb3xHhM6kj8veedI6rC8pOSXG6ThCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718638290; x=1719243090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T7/MTDFiI7KLO+MTNpdpEHyUbdZqXSo8JiHiM5lz8PI=;
        b=SpqKLMvG1zlwEiJw/Ej1p8yEx9UWRp1fyR7kmg46aj9nmj88di5cEh3g0DXhvb3Q1B
         wwR5lLDcpWzIvtFqTpMMEwKPOs26I3Exzclz+GwGkR+f1uE2PD0ytCQt/BB2OZvDwaIR
         lGHeq5xztQHWsqQDa/pnj4ub7/5Wop/bfJcpo+mJCzidjA+qF+cuP1OU3O27n0L27gVF
         1AsI31dcTmYPYRVkgyB4cYzs13isjX42PF47pbvjNY39UR1lJk8BC5imgR+EHBJjn1Wg
         SibY7O79nGetRzKTKX0rgRpLGB2JqiruOSEvUa+lfYsmMQcbZT9NG/+1LUbISJerzYyD
         lgrw==
X-Gm-Message-State: AOJu0YxY8Gq3xB62RSAHE6QlduYcL22b9HjS8ap/JW21T0zs+0KymBQP
	DkAx7X/Ht2c3c/iXAFtvfYnw1VTGgN/zd2gbr+xI6k31h2BvPu/PZBACBh60voIYmzSnPw7xG5c
	Z
X-Google-Smtp-Source: AGHT+IGcDJIQltoNXAic2f6Rxct+7VpPYjkDnoNGKSEAZECrG39D7uapy9w4c8+5vZc3kRm39zgerg==
X-Received: by 2002:a17:903:1ca:b0:1f6:f984:f759 with SMTP id d9443c01a7336-1f8625d4047mr116569495ad.15.1718638290497;
        Mon, 17 Jun 2024 08:31:30 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([117.228.116.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e73ad7sm80210585ad.101.2024.06.17.08.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 08:31:30 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCH] libxml2: Upgrade 2.12.6 -> 2.12.8
Date: Mon, 17 Jun 2024 21:01:18 +0530
Message-Id: <20240617153118.8883-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 15:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200845

From: Siddharth Doshi <sdoshi@mvista.com>

CVE's Fixed by upgrade:
CVE-2024-34459 libxml2: buffer over-read in xmlHTMLPrintFileContext in xmllint.c

Other Changes between 2.12.6 -> 2.12.8
======================================
https://gitlab.gnome.org/GNOME/libxml2/-/blob/2.12/NEWS?ref_type=heads

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../libxml/{libxml2_2.12.6.bb => libxml2_2.12.8.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxml/{libxml2_2.12.6.bb => libxml2_2.12.8.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2_2.12.6.bb b/meta/recipes-core/libxml/libxml2_2.12.8.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.12.6.bb
rename to meta/recipes-core/libxml/libxml2_2.12.8.bb
index 14fcff7fa4..fb103f0273 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.6.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.8.bb
@@ -20,7 +20,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "889c593a881a3db5fdd96cc9318c87df34eb648edfc458272ad46fd607353fbb"
+SRC_URI[archive.sha256sum] = "43ad877b018bc63deb2468d71f95219c2fac196876ef36d1bee51d226173ec93"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
-- 
2.34.1


