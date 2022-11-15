Return-Path: <pdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E90C4332F
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 12:51:25 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.5129.1668516676005584946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 04:51:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=RVn7uQeo;
 spf=pass (domain: mvista.com, ip: 209.85.216.52, mailfrom: pdoshi@mvista.com)
Received: by mail-pj1-f52.google.com with SMTP id u8-20020a17090a5e4800b002106dcdd4a0so16834357pji.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 04:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NotJYldOC8YRoEyupi0ws7Md/PcDkHCmVB2X0617nT4=;
        b=RVn7uQeosjx8ysftg6/BzYZ9ooaG0SIVYDcu4KZOK4WmMjBUSTm0WGiQ/UvQPaLkUi
         eZuoBfLvKdY9NgP9EKK7yhbA9+pz3EMpDpZ6ltbF/djVBz/DBZkV69lVh3/tY85Ou71A
         cF7XzdqX0ZRccjdOh5j6KlAKnGVsLj1j16qBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NotJYldOC8YRoEyupi0ws7Md/PcDkHCmVB2X0617nT4=;
        b=JO9BUSWp0uPM0+pH7DdFuCxX4uxT6uJzTuiclSM1vler4osXat58+OxA7gvxTbhYc5
         qtlRoAkrM0B64D4LhsUKTK1uRRzZozI5fWqdM8zr70m2P3rH/8SpndADOhCapZZRK1U1
         J94Rgts8u3w4P6LI41nljiBbhx+HFN+rgWD1FPeXLd589YM1THDaacMxrfxKLN5DrSHg
         4p/igQQZ+RpJWVJTk7QtL4M4hyR0LpcxQsxD3fDPJmkGw3ugNDn+uAEzb4IuWnDaTEdg
         NdxQyDN2tWY4Z2kEaKYovHrF6z3T1R5UFV7lHnrxCXWLH3b83DblfALVO5QpuyR2kM0r
         Q5ig==
X-Gm-Message-State: ANoB5pl5PtOob7af1iiH2eP+OQmJF/01AMUr+sCGfaKftuEj/HdYnyfV
	QRB+TDQg935e6kvJ2KiA3hclOn7oo5J+lA==
X-Google-Smtp-Source: AA0mqf6M764/5AFNCjRBb0pNhz6Hrz2ZCexD7jwQhMc3UhKqYk4xKpme2cxZ2vXu5cIzzh3CTPnMiw==
X-Received: by 2002:a17:902:6acc:b0:186:a687:e077 with SMTP id i12-20020a1709026acc00b00186a687e077mr4091132plt.26.1668516675117;
        Tue, 15 Nov 2022 04:51:15 -0800 (PST)
Received: from logan.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id s10-20020a17090a764a00b0020ad26fa65dsm8229643pjl.56.2022.11.15.04.51.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Nov 2022 04:51:14 -0800 (PST)
From: pdoshi@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Priyal Doshi <pdoshi@mvista.com>
Subject: [OE-core][PATCH v2] tzdata: update to 2022f
Date: Tue, 15 Nov 2022 18:20:08 +0530
Message-Id: <1668516608-3322-1-git-send-email-pdoshi@mvista.com>
X-Mailer: git-send-email 2.7.4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 12:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173278

From: Priyal Doshi <pdoshi@mvista.com>

Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index d3c78e9..c4cdb77 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2022d"
+PV = "2022f"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,6 +14,6 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "d644ba0f938899374ea8cb554e35fb4afa0f7bd7b716c61777cd00500b8759e0"
-SRC_URI[tzdata.sha256sum] = "6ecdbee27fa43dcfa49f3d4fd8bb1dfef54c90da1abcd82c9abcf2dc4f321de0"
+SRC_URI[tzcode.sha256sum] = "e4543e90f84f91fa82809ea98930052fdbc13880c8a623ee3a4eaa42f8a64c15"
+SRC_URI[tzdata.sha256sum] = "9990d71f675d212567b931fe8aae1cab7027f89fefb8a79d808a6933a67af000"
 
-- 
2.7.4


