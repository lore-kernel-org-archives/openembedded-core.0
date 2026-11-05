Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30052.1793868220380212737
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=SesWOqvY;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so12805525e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868219; x=1794473019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Vv9C1PqSEcqFXQYG2g4MrXset82OMQvTM8yryw5VpY8=;
        b=SesWOqvYp0p5g9GSqoUG0qXHBn8O2lAccLBBCM2a6AzJo9lkPqRwCsBq//9dpZgf0e
         RGr7oBRGi6TGKoBmqrCramL26ag+IAodgDiYO+WOfOh9sZnbck6JRc7wiJ/aW6UQNdch
         i0KUVGa0OkuetL7WAl24oxTvB7Ke8ykZqsRiWwiTuE+pgYoD8Ww62hmoEDsWjH4cvEsq
         nLhUjv/cOhfCHH++nh9kix+dTfqx/PiUGkL2s1ldjR12sI5x7f4xMGzWYlwpW6/kEw5N
         Hcz0C3XLkwp1Y69bXPewVEY9iDXefHWdoKfP/LXftIghFN0uNwcx4ErndF3a5u3FVHvM
         zMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868219; x=1794473019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Vv9C1PqSEcqFXQYG2g4MrXset82OMQvTM8yryw5VpY8=;
        b=NbgQCIO3ouMPKVKxqmxLySuAN5vFEkbqMU5R35lKr1GmIVNPs+fGxipJsqdDqtLic+
         H89f/MHav3cDT1zeajkJF2hUpRKZ7wbtfDFO+tr23jG9PLREcnS7xLMH4+4JayV4sqUP
         TKJiku7fX7RGfmbWsPaRY4oe/ERShPOoE7wUMECdG6Se6pTXAFwr1K3qpYeklPSHiT00
         4yYnY6awGlFYzx/eEq7veJs3h8NX97aCkjGpnSuO89dtqjui0L9OXtQINVvjxtfaquRS
         ZDewchqsOD4cvly0hB089RukYnt7hm9VOldKufaoqN1QdH8YT8y5rc1ybWjtL+xwRlgc
         p+SQ==
X-Gm-Message-State: APuU4Z9EoCO0CtJ6FJdGn3SlaTbrCG5ZgKkghYJ1VO/95dTr7k8t5Lp1
	cGRGsu02DF77p9IFbseIU2BUarc4WjIYUc4+W9IEVp7tnqGV8Ajsm9Gvf7hd9ADb0u553LPOYtL
	7XGtFPh8=
X-Gm-Gg: AYBFou1YJgk6HzVXz2od6fUm1ORze7p6/i7qiJbbcrMbS5BXBh2aQIbgWS3P9LZNcju
	7MHCKG/pvyFiATiPJB17NRjqbLOu93zku/K3boyExoP1Uz9jejRx+dVAyHmb2sY6xUhapnyYKIP
	WEugSaRosPTxvlDcF6yIzjRsh608wnXj3vMBafx7MQwk5Y3JmkBFFhec/k4fWFYLMiL8+bPxDU8
	i3taxkuItEsL2LOuJPAiAmD44mZEaceFzofn0DzwjOcV+BlhQbQ9Vi68yRjPLjz/jOL7RkHouCj
	EtLwfeEg/E6CkP9Q5QJA9219z/0n1uI41hYxr98YRJdHRNTpyYJwoF1yGxjDe6BrQof1p/8z+i0
	Z7xkbuJSdlhPzu1ltNW26ZzH8PNH3tQdCwuaWspX573k3gWUKb6aAMZT6WM7I43iHE3BdYPRUKI
	/g0IaHSESJ14oIg1xq45YLXN0IeGm/lQEBPeh47ZMK0Zdmnb0aj4gsHyRhw+09AvhrAPLkACP/K
	UrQJD9hWdLVJSCDguzK8rRztowYscPEH03aP7MEZ84hXKGJ4rKgK6llIhHBnRzWiLcMImPxxJQ5
	b9rQt9qow87gmwzFQBUXinFoWMdfoPGKbJHycTG//dY8p4qBWGeqYXy2pDCftxjbKdusUsqX1Qt
	VFmgpSCbKdG1VBtHAuuchveqI5w6QaA==
X-Received: by 2002:a05:600c:e547:10b0:4ad:5e09:ae43 with SMTP id 5b1f17b1804b1-4ad5e09ae61mr208655155e9.29.1793868218576;
        Thu, 05 Nov 2026 00:43:38 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:38 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 03/60] stress-ng: Inherit pkgconfig
Date: Thu,  5 Nov 2026 09:42:22 +0100
Message-ID: <2fed7856a84db82ece00d0860a962769e96cd18c.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249462
Content-Type: text/plain; charset="utf-8"

From: Peter Kjellerstedt <pkj@axis.com>

The use of pkg-config was introduced in version 0.21.04.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/stress-ng/stress-ng_0.22.00.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.22.00.bb b/meta/recipes-extended/stress-ng/stress-ng_0.22.00.bb
index 5c68f813110..6ebd9741515 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.22.00.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.22.00.bb
@@ -15,7 +15,7 @@ RPROVIDES:${PN} = "stress"
 RREPLACES:${PN} = "stress"
 RCONFLICTS:${PN} = "stress"
 
-inherit bash-completion
+inherit bash-completion pkgconfig
 
 EXTRA_OEMAKE = "VERBOSE=1"
 
