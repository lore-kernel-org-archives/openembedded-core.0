Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0EF4C3ABB0
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 09:06:25 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.46255.1746435982822584889
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 02:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Niip1FyT;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22c33ac23edso44113075ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 02:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746435982; x=1747040782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPCtOIhn/D8U4BVvlfV7hpWlYPOYFyCFv4cHsvumpbI=;
        b=Niip1FyTWTdH0j1jJMoDz3QeO5CqpoAxwRshIDLMOR1qIyPba6NHuT8q0x/+6nUO0K
         xaYKW3si9FwHv16o/yAJJk1Y2OP12R/Y+KIflfngi24hxf0RrJvKMt9w8rdao1Z7/hua
         jsvFdjamX8gP6hORfPziMl3GMpJz3CV/usYdN1NwVfPPJ2lEI6qolDpLc610I8U/X3kE
         FMZP3HyLNQS+DYHAa/AJVI3M7Fa810d5asJqHOGooLNX5J8jytA7paae7LTAv/SY8wuk
         KBBnZQniK3eU/bxI49SKf8xbUcn5GsZwi5C3CE5OaQe13nUtwyCowKLglZcBevvqr3cA
         6iMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746435982; x=1747040782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPCtOIhn/D8U4BVvlfV7hpWlYPOYFyCFv4cHsvumpbI=;
        b=tp4BcMzyWnvNe7bP4XJoQzRXGSKnSUnEaEx2ibJbl50/FIaFZi00Ie4NOSh8nuvW/v
         ygLvbzJLKYO8iVaEOAfZJ613qsV+lsuxFkIQbDQP9hzZht/JTUZTddGaWb5RNzbkTp/A
         SCFffkH9aJHp9Bh2BNL4uvV80NvpygzuQiOrvQlLWBUFU4ky+0mjdgEa9t9958CAzWxI
         WEGYcuhmpSxUGOV7x+93kbC1q1GdZHhHBF4/kRh4IZUhKXJIu7lhMvFvkjiy/6tFRwgg
         Igyv4/CISY5NM44qh5V5t1dDCJfYbGMyqZUrMKV67FP8dNhY1s6Yl+uz3ePItRdJvBNr
         WphA==
X-Gm-Message-State: AOJu0YxkVzNsyUFGnCbRrZ21lfhaoXmdXvfNnAG+0t9guDXIYp83Cfpn
	bUH/29/V9sV3o1rsix1P186WCDhIAk29Go4gER2oLoerKovLqPbIu+OSXQ==
X-Gm-Gg: ASbGncup+307NjAHf7ySa8i4rhxXFEk8aGLuXJ8CPYGz+4y1fUbujTAcu3zvnZngNh6
	8Gh7r554k1zy0BMG2xR3IVWYmfpxlI0hAWm3D5cuyT7IJYbl+j3q53HXv4AU3Z9d9z/FU5BRXOe
	/aVnqLgqM186aEymsXuqKqxFACFdXPqbZ2v3gxqL2VqMXDaHpvSA5dSmjDiNHip6kNLUFNc5X/z
	fwgUHcnd1/IytNb1iYvFYcrDgbLvZtqILrsmEKhcqCDIOURmqNNXBxbNwOgqpAZA3azVi3tSVRH
	BB0a1czS3AaiZWBo4CtiiCWP8WjjorfAhAwUpiXcbsVxffZsHFvL
X-Google-Smtp-Source: AGHT+IFtc4Dw8xlz7dVE8G0DT1qYhEt0x49nodCivgRL3zmBODdfXrFxLu0HTk3qyyh2IO4I6xiTuA==
X-Received: by 2002:a17:903:230d:b0:224:826:279e with SMTP id d9443c01a7336-22e1eaa2e2emr87255735ad.50.1746435981957;
        Mon, 05 May 2025 02:06:21 -0700 (PDT)
Received: from MVIN00210.. ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e152290efsm49698595ad.190.2025.05.05.02.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 02:06:21 -0700 (PDT)
From: Ashish Mishra <emailaddress.ashish@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: henning@itconsulting-heinold.de,
	otavio@ossystems.com.br,
	Ashish Mishra <emailaddress.ashish@gmail.com>
Subject: [meta-java][PATCH 1/4] Updates the SRC_URI for xalan-j recipe
Date: Mon,  5 May 2025 14:36:10 +0530
Message-ID: <20250505090613.818330-2-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250505090613.818330-1-emailaddress.ashish@gmail.com>
References: <20250505090613.818330-1-emailaddress.ashish@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 09:06:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215997

Signed-off-by: Ashish Mishra <emailaddress.ashish@gmail.com>
---
 recipes-core/xalan-j/xalan-j_2.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/xalan-j/xalan-j_2.7.1.bb b/recipes-core/xalan-j/xalan-j_2.7.1.bb
index 5e72a34..a1f4ea2 100644
--- a/recipes-core/xalan-j/xalan-j_2.7.1.bb
+++ b/recipes-core/xalan-j/xalan-j_2.7.1.bb
@@ -12,7 +12,7 @@ PR = "r2"
 DEPENDS = "xerces-j regexp jlex cup jaxp1.3 bcel"
 
 SRC_URI = "\
-	http://archive.apache.org/dist/xml/${BPN}/${BPN}_2_7_1-src.tar.gz;name=archive \
+	https://archive.apache.org/dist/xml/xalan-j/source/${BPN}_2_7_1-src.tar.gz;name=archive \
 	https://dlcdn.apache.org/commons/bsf/source/bsf-src-2.4.0.tar.gz;name=bsf \
 	"
 

