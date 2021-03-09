Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.7340.1615289801000418152
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 03:36:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IsDrpVVr;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: dorindabassey@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id d15so14855677wrv.5
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 03:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8YVvxDyCaGJMsgwS+Q0+BjBxHccOfu6aM8x61tPmA60=;
        b=IsDrpVVr++ZoqzzPYbUTpDPx8UGZ3vSWL8wRoYFzwfYnsxphaMX6X2C7X13zMmPQtC
         3Z9ioj45KL0ELw0FJeOOPxg0QJB6sRmdDY7puXUQPtSFEmRvBOdp6+cxNHe9w8Wr9Fau
         IXdbjp3kaRxfDaX6ejrcStNtZ+sHGHQIU0C7Utf6ng6OkGlnvCVBHlWNUQtMMLLZdagh
         QYj9qrrx9dGTAckIINHZ9Nwo1ZyIy9+446ONO43pEIXWcCSK12ddW9z44ZUJ0kl9KNFA
         J5Ke13h4NYzmZqS6LDyEqZX2sB677vuoJy3ofTPih9C2lBQoX+qWD/QgRLLJqCVx0PJt
         zPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8YVvxDyCaGJMsgwS+Q0+BjBxHccOfu6aM8x61tPmA60=;
        b=gi45cS2QSG7Z68VPNL2sYXUdlydu1DxZs7f5lldnx/qLNSmSquPBvpqPcQmjhdCHSd
         J33YfcN6sYVq8CI8Zhcsu5qjrWeGG9TZ1cviZ8xxSBETkxj1i5oCun9qO6/vAPIADds4
         C222UeGoU74DAwanT9pVHmFG+iK92a6EXgwW02koTKYUhUTWW5+RXAj7IzjRZnermNtG
         nnt68Qn6FuaK3kvw+YjSViSf1fMPRMvm2hNUWQ7eWaa3mv+w4iqCEODAqWVDbeV7GE2j
         n/JPcmWuZVvzyFYMGNFqfUfszyYlQJqNYCDU0PFm2M4L4pwcawBzEkLXJPCzOGXbqB+I
         xCQw==
X-Gm-Message-State: AOAM532vJFUd1vDhmR6BlaLHqBrCHi+bjpn1MM15dgPeC3F+n+wYUQKa
	eDSWanVMKZSQBlaum4bPxlER+l1cH/MDtA==
X-Google-Smtp-Source: ABdhPJzBmG3V+CkD/EQopNhOKSK1JlQK4isPBoybobQpntWd6rB57foJ0dtx+SKrrlV2IalVJhG3lg==
X-Received: by 2002:adf:9261:: with SMTP id 88mr27072927wrj.270.1615289799164;
        Tue, 09 Mar 2021 03:36:39 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from smtp.gmail.com. ([105.112.33.166])
        by smtp.gmail.com with ESMTPSA id x11sm3804289wme.9.2021.03.09.03.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 03:36:38 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH 4/5] meta/recipes-multimedia: Add HOMEPAGE / DESCRIPTION
Date: Tue,  9 Mar 2021 12:35:50 +0100
Message-Id: <20210309113551.13691-4-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210309113551.13691-1-dorindabassey@gmail.com>
References: <20210309113551.13691-1-dorindabassey@gmail.com>

Added missing HOMEPAGE and DESCRIPTION found using the test command
`oe-selftest -r distrodata.Distrodata.test_missing_homepg`

[YOCTO #13471]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb
index 23040ad73c..7c702ba95f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb
@@ -1,4 +1,5 @@
 SUMMARY = "VA-API support to GStreamer"
+HOMEPAGE = "https://gstreamer.freedesktop.org/"
 DESCRIPTION = "gstreamer-vaapi consists of a collection of VA-API \
 based plugins for GStreamer and helper libraries: `vaapidecode', \
 `vaapiconvert', and `vaapisink'."
-- 
2.17.1

