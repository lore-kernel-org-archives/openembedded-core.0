Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
 by mx.groups.io with SMTP id smtpd.web10.38349.1601912337613393084
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2020 08:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K0Wb7agx;
 spf=pass (domain: gmail.com, ip: 209.85.167.194, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f194.google.com with SMTP id c13so9111440oiy.6
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2020 08:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=78NrQwbCJDhrkDJLty2RUbeNO7RAMu5fJklAFpGfhoY=;
        b=K0Wb7agxL2+CH0I1CkcGwgjkMj7NDo8rVspbHfd8mBobPK051Rl7fm5VgCS8mtJJys
         WCwl8MzxN5nxnq2ahtmwCfpNgnmc/oOhTq2yFex9ObXxY3j0sL1WD0ZsuQItHOWBzQGZ
         ZBvHq2Plm/CsSRrXADSUbsfScEG5dc4z+ya5hQc3dYVsIfrNwvTYMdeqzE3rRDUUGpGm
         TwMEhwJmtpUx5E8A8/ic4QVSY+LX3tOhz26zlAYxXEWwsGyV11cxU6uf2RK/nWR+5HC7
         rdIHTowi/+lpVrGu6BUj8betJ6VZKTiza++cGPOxAQXeJysvsNxHyrzH+sCaKZw9JXfO
         h6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=78NrQwbCJDhrkDJLty2RUbeNO7RAMu5fJklAFpGfhoY=;
        b=Z8sU6nzLQ1TF6LXGFE4iwZB+WxqRJg0Q+nR9CGc4tCSYBPOCKYR//YA10MUSUr46ee
         71gNamFJ2/fgg3Y30xN4mL+Z/Vosu/77z4hk7fG3gZ9sIBzk9rRcAEeKbTxNlqzoKKP3
         iNcAySu0HYarrjQgXrYKDnIQ14SZG2YCigVqPqT0jAXugPyQ/uJgSv75tUkhRLh0zq8T
         aG0M5QFrGNspxY4sS2DGhAvxQLtdVfoRl2zedWwdeEav3tpLCQOGS+QtMvOaDzHtkvGQ
         skjUonhtC5IRMMWU6QzLrKxCTSdm1Rh23aFGX1hqD3+nklz4udUHbK5oF0nYiZ2i+ml2
         sy9w==
X-Gm-Message-State: AOAM5327wpfyPadoux5BWH/KwNlSZ3uRbZxFnKtDUa6BWnFstGpHfi0V
	9fdq4Ng4lTfuSWRgP3+WbcEeQGJ+H0g=
X-Google-Smtp-Source: ABdhPJzRFu7T74qh98/qrU/TYAHvK5J6cCwQaqpzW08zvW/Ym8mLAJN6WehlfODdhmsDdbUUdHp2sw==
X-Received: by 2002:aca:654b:: with SMTP id j11mr104751oiw.77.1601912335101;
        Mon, 05 Oct 2020 08:38:55 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id k51sm7037otc.46.2020.10.05.08.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 08:38:54 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/sanity: Bump minimum python version to 3.5
Date: Mon,  5 Oct 2020 10:38:51 -0500
Message-Id: <20201005153851.3905-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bumps the minimum python version to 3.5 to match bitbake and the test
matrix

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/sanity.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index e021b9d240..0eee89d71c 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -769,8 +769,8 @@ def check_sanity_everybuild(status, d):
 
     # Check the Python version, we now have a minimum of Python 3.4
     import sys
-    if sys.hexversion < 0x03040000:
-        status.addresult('The system requires at least Python 3.4 to run. Please update your Python interpreter.\n')
+    if sys.hexversion < 0x030500F0:
+        status.addresult('The system requires at least Python 3.5 to run. Please update your Python interpreter.\n')
 
     # Check the bitbake version meets minimum requirements
     from distutils.version import LooseVersion
-- 
2.28.0

