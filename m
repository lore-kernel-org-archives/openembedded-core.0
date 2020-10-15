Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.11308.1602766233896617973
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 05:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A4D+gqsc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id 13so3066597wmf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 05:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZdJ29CG4JcxXBM53XkR56dAoL4fhcQ4bY+cJrcbw8eY=;
        b=A4D+gqscFWcwXJkit8D0ZtkDnJdStiUTAT+JXhazMi9FhyH6df6dMhoQRDKfV1cSDL
         9he658LC05OVFAyXy808DF5wloIF1BQ0TxiDYBegUHQjQuTnbdSKT8hRhifvIzIFMvuu
         Wfn/meQeE1u6adoMbSMltkv6O53wC6vh5dQbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZdJ29CG4JcxXBM53XkR56dAoL4fhcQ4bY+cJrcbw8eY=;
        b=IWyTMi3iA8xQrdtWqZHex4ubCm4HFSI1F5L4nxosJwUDvLjfQOPaBQzyFsXk5vBHJ4
         n65uP7bHsW2Qh9vozbPtozVp0hgbuiflmYTaG+L7TWRzqNhhPHl46wK74fcvd6shNdSD
         9SJKKjLAjy3GAKgYHYzh1eCD8974NQNGEvx+mRv6XOuxV1CtDz2jJcF1sqtPmK01fQcQ
         u8u1eNCogAvleis4CiwTUChzfSpscXOB2H8rGaX72wki769deo8Db5Ddj76MbuBXiClf
         ZYt2xMYU8uu8+4hnWjLnI2OlimDl94Fav+XC5Z0S2sl0b5nK8jpm004KujAYRDkd1G9N
         eQqg==
X-Gm-Message-State: AOAM532JPbqR5kCnTBX/64N89GCbRTHdN5bTfcEAmjui163+4gUvbJ7/
	UYf48XVlbPM3SsUPkTIC9DGr+9/yoRxHWQ==
X-Google-Smtp-Source: ABdhPJx8KMkg9kRB5/W7iHk21kc4elQjnlGQREfRj/BWwazaf2x0nQah/x8jDEpdk3Akye1M8PpQLg==
X-Received: by 2002:a1c:4056:: with SMTP id n83mr3883516wma.186.1602766232155;
        Thu, 15 Oct 2020 05:50:32 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7d78:e5d6:b970:ac7f])
        by smtp.gmail.com with ESMTPSA id n2sm4280799wrt.82.2020.10.15.05.50.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 05:50:31 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] layer.conf: Switch to gatesgarth only in preparation for release
Date: Thu, 15 Oct 2020 13:50:31 +0100
Message-Id: <20201015125031.3493510-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the core layer release series to gatesgarth in readiness for release.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 75d2ee004e4..1c3bef7ea3e 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILE_COLLECTIONS += "core"
 BBFILE_PATTERN_core = "^${LAYERDIR}/"
 BBFILE_PRIORITY_core = "5"
 
-LAYERSERIES_CORENAMES = "dunfell gatesgarth"
+LAYERSERIES_CORENAMES = "gatesgarth"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
-- 
2.25.1

