Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.12883.1593514122786051553
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 03:48:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=lU8ycmEO;
 spf=pass (domain: burtonini.com, ip: 209.85.128.66, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f66.google.com with SMTP id g10so4257050wmc.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2020 03:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BgWMaJhBrnUVQV9DdpsRCiSoMKxo+bwPZ18U/lKDSJM=;
        b=lU8ycmEOrEf3ATAn/ZYrtS/5CnGrVotqPbberydt2LVitb0pBHkq8NDG60B/MOOxyb
         LXLEiTPl9C/9SfG4NQ1STzkdxwYdFtjGQK+xLuV4xLmkwkjS9ebf3yQMBfIE8f8atn8q
         UbeciwvvOJ/1RPLs3jKui7ZwYDyEKUKPsu3RCVlvzYyXaLJwuZSjoygINXfuRwcGX1FD
         AzousKE5D/M4E3CqvNo5rNWEfZkPmE/nRknho7eUgtxbG955snHDU9wZ9lqAdnkZu/xz
         i+20VOB5D2fBadsw5L++TppaCWVRtCiNBI6R5wNHg9Nlyrq81+I1BM6xmAxE81JFUXCl
         8//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BgWMaJhBrnUVQV9DdpsRCiSoMKxo+bwPZ18U/lKDSJM=;
        b=ZwLyxz/akl3o2dQ1exr1Y3uCJVvKiQSWVBoCgxFSZufTLuVLyhTeer2OMKWWFoccc/
         fgtLwE3Na5pcyoSHRLRFCacw2ArSVKTcimwjMO/Ig9K0SsNXyeNJBOs4FdYJG6qpgZWZ
         4XBmux2JUABu0i2yjUvYS23kUbHvCm+U91AknXp6bvR/x+1xGOQRYXf4JErD31A4lUuE
         rGFp2XP5emGwHxGyXdXh+BfuzsmdSlYgYWehYVCALROR23yTj5vsABsgQptKX4/ejGfz
         vD9E2n0g9ai+82qpkXZfeG88lIZSuvq3jA7rR7kGdQYULTP4ChW9Z+96wJpd9pYkNDDZ
         AFvw==
X-Gm-Message-State: AOAM5339dj5uHsImOOSE8JdbOt/u1i8KmSPsch4TO+NdIuS+nfZk1a6B
	7Rr5X2ougmMSfQ60+CDZX6zzVGI/8x0=
X-Google-Smtp-Source: ABdhPJza+LYZaQWAh+SZbK0vqHxlQlf5oai6kKjCCRNHNGpYtvDU/HoP42XRTJ2O923fsyNU2EFaUA==
X-Received: by 2002:a7b:c7c2:: with SMTP id z2mr20767989wmk.39.1593514120860;
        Tue, 30 Jun 2020 03:48:40 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id m4sm3086398wmi.48.2020.06.30.03.48.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 03:48:40 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] common-licenses: fix filename of BSD-2-Clause-Patent
Date: Tue, 30 Jun 2020 11:48:33 +0100
Message-Id: <20200630104833.1782789-1-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../{BSD-2-Clause-Patent.txt => BSD-2-Clause-Patent}              | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/files/common-licenses/{BSD-2-Clause-Patent.txt => BSD-2-Clause-Patent} (100%)

diff --git a/meta/files/common-licenses/BSD-2-Clause-Patent.txt b/meta/files/common-licenses/BSD-2-Clause-Patent
similarity index 100%
rename from meta/files/common-licenses/BSD-2-Clause-Patent.txt
rename to meta/files/common-licenses/BSD-2-Clause-Patent
-- 
2.26.2

