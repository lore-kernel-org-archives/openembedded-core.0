Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web08.2240.1607975709862523608
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 11:55:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t/JEb1hs;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id t37so13337687pga.7
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 11:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+a1rmeCdkscmWIOLckLzoCL0lNtncbn1wuPDwQ8xfR8=;
        b=t/JEb1hsUjXtjFiCyICwioKNqwNcu75OzyUpSza1SjN7/QD+0MBMCDPX5WjmM9HK7S
         n1au/UDE3MoN0PqjkCxsGKv3FPnfE/ZwQkakRgDt2Yy8fBWruj01jTa1UNx2oXmX5/l9
         Gk0IL+cd5oU3cncFh2CT5cmlkMdMNIBLE4DqovDa2MWn3+gODOBcS1uT20ombQhVF5+F
         7ScFdMipXhHh/PxwRrsK8JccUdaPQwx70cO7d1Acoiiio5wQTXN6xYLFVxkh2DaJeoM1
         TKf1rlT1YALza8Ml1Fg4Q85x5qZ6S3oqtleWm1JXWUC0MV6iscY0oiQtjrITJA3tw8cU
         iZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+a1rmeCdkscmWIOLckLzoCL0lNtncbn1wuPDwQ8xfR8=;
        b=SZ+keX7OTpX2zFQk4+UTvUxGzgjjIE0gdnN4C8PIqfWh8GEGG5dQORcBn5YJdAMGpH
         l5NCrG7xlPeQMaL2Dg7DbNRsncmbLucbBqKLN65uQwyx/jDMemgeiwYaVeKTvb/75RTP
         oN/EjFwOG/qC0/j9PDbWLGZcy5/g84l0ep9+6p8R44MZdI9TMmPOfxXBF7EXyFSuaNc/
         s1kb1SC+YOQcb9gcbVmIaRFuc/LKLxhSOImLk9fVCN2d7lPNjtYGy7gaw5WaykjGkNEc
         m06+2IILmhC4el2UK9KJ9jjK0ZM5y3Ws/66t0kDms1YxSfa8L007t0SBrVPSeULYTQWZ
         CNRw==
X-Gm-Message-State: AOAM531jfLCw2nZc8THDX2IjjyWwuWwPH+KfCytECvB5FUXBgQH2RWI2
	zA4qupH0wD2SAlr+w8TFEwIjgTblLz7iog==
X-Google-Smtp-Source: ABdhPJxAPO19Z9+WjlstrOCQMrvocmHQMLBkRGCcAO0ed5H6rgKDhjqiqgVnQDpSxZGK4a8Rz6dU+g==
X-Received: by 2002:aa7:91cd:0:b029:19d:b10c:7f89 with SMTP id z13-20020aa791cd0000b029019db10c7f89mr25341208pfa.43.1607975708669;
        Mon, 14 Dec 2020 11:55:08 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:8d6d:2a16:706b:382])
        by smtp.gmail.com with ESMTPSA id h20sm20069688pgv.23.2020.12.14.11.55.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 11:55:08 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] python3-packaging: upgrade
Date: Mon, 14 Dec 2020 11:54:50 -0800
Message-Id: <cover.1607975468.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

This was built and tested on top of current master-next.

The following changes since commit 647066acbd15e4489cbbbde3165c7980aee1e91c:

  wic-image-minimal: only depend on syslinux on x86 targets (2020-12-14 13:37:21 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib timo/python3-packaging-20.8
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=timo/python3-packaging-20.8

Tim Orling (1):
  python3-packaging: upgrade 20.4 -> 20.8

 .../{python3-packaging_20.4.bb => python3-packaging_20.8.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-packaging_20.4.bb => python3-packaging_20.8.bb} (71%)

-- 
2.25.0

