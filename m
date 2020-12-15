Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web08.8315.1608021363336735215
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 00:36:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=jzC5G0Xt;
 spf=pass (domain: nathanrossi.com, ip: 209.85.214.181, mailfrom: nathan@nathanrossi.com)
Received: by mail-pl1-f181.google.com with SMTP id j1so10635944pld.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 00:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=date:message-id:from:to:cc:subject:content-transfer-encoding
         :mime-version;
        bh=UxVy3RLQxNFEQbdjq0b+FGKwfZGvGHsNPwJSPQqmTWA=;
        b=jzC5G0XtKufskYv8ERjCR/sPe0fog8eq9Ahj1sQozdNVmk2598nY8Bc4F28DcarcL+
         suquhEg29YhVu1Vlw7OLIKV3jRjUo/P7p6mOFXjQOCDCNBa8PxUTevv3nRC6tqdXTzmm
         ta1EPjOzey/dTFlTexS9GeiAxqZckXT65v0ZVD9hol+A0W3M9Rr9E6My24RDWIlGZ8BZ
         z5vaj0c+sD3xksOLZVNkd3lD3lL82sMsfmu7VPBGXzPfTKkj1AVZTRe+jdHrib+YChGM
         V330SwaTHcfGw1op0+WeqPoyertiSyiEoPkH5CoOsGn5V3NTCm7MX/xBysGVNlu2BXZy
         cZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:from:to:cc:subject
         :content-transfer-encoding:mime-version;
        bh=UxVy3RLQxNFEQbdjq0b+FGKwfZGvGHsNPwJSPQqmTWA=;
        b=ItdUvE9GSyVucM/fHypKHe1BIXyV6lKtm+31cQiNviFOaRY5gNt6UZPsfM40coE8zA
         9/Swyzo3MDSdR4ulyyWPvNmcJxMusyomRIzzdi2pdLRNwj194ol60v52Tp/oSB2//Xig
         1EFNhFUP/nfsgAhSRTV5RGaPRozHlUPq2zN+4Rtwme8oROoOch/FV8080/W0iQken7ga
         D1kARcE+cYan9tdSYpGn2gFJcq3c4n/D65V4wWbyiLM1LeBSD5B4c6bkc6pyTVpYkEmZ
         xCk/aalXUCeruMi3nWt2PmipX83Cu2e90n9RjEpE0VdRmQ8c8C3X/QnNkHd+Ql4MzJam
         VFpA==
X-Gm-Message-State: AOAM530VMw05aKmkgmXM7MN+P4ArZ5YWfF+WwMM7/mFh3dD7mdecT+WT
	4Iy7oR/cNXlLh65qm3CgAYHFmqapi+ka8MFu
X-Google-Smtp-Source: ABdhPJzs4uEKPbVVYCUOsfAE1Sh/68NvB0Gm5BWw4pcxTekF1G36Gua9wzCzMo2gtctr/UosAxR6Ww==
X-Received: by 2002:a17:90a:e7cb:: with SMTP id kb11mr26610134pjb.80.1608021362474;
        Tue, 15 Dec 2020 00:36:02 -0800 (PST)
Return-Path: <nathan@nathanrossi.com>
Received: from [127.0.1.1] (117-20-70-209.751446.bne.nbn.aussiebb.net. [117.20.70.209])
        by smtp.gmail.com with UTF8SMTPSA id r7sm20559620pjd.55.2020.12.15.00.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 00:36:01 -0800 (PST)
Date: Tue, 15 Dec 2020 08:35:57 +0000
Message-Id: <20201215083557.1361123-1-nathan@nathanrossi.com>
From: "Nathan Rossi" <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Cc: Nathan Rossi <nathan@nathanrossi.com>
Subject: [PATCH] which: add nativesdk to BBCLASSEXTEND
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-extended/which/which_2.21.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/which/which_2.21.bb b/meta/recipes-extended/which/which_2.21.bb
index fc9185061b..1da69c548e 100644
--- a/meta/recipes-extended/which/which_2.21.bb
+++ b/meta/recipes-extended/which/which_2.21.bb
@@ -33,3 +33,5 @@ ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE_${PN}-doc = "which.1"
 ALTERNATIVE_LINK_NAME[which.1] = "${mandir}/man1/which.1"
+
+BBCLASSEXTEND = "nativesdk"
---
2.29.2
