Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.32440.1620657103161433334
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 07:31:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=m1YhEaqc;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.169, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f169.google.com with SMTP id i81so15973968oif.6
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 07:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BYlTHcbhECVjvrGt4cqTT+PnV4gyHCMX1Qp6vgoYv7o=;
        b=m1YhEaqcTNruiYQaYG9dGWH5KRA6BRim1Wez28zclE+XajYgQDbqIi+TEQMNCFNg1R
         nZ/zU7eMVPRG35TXc7EZjWtAZRkkpMcq5CcHYl/I+zCON0mjb57S3y+PFn8CicLZ9yIX
         /mf2O0Knx8fjAapzRq9doMHoJHFAPy4ezXycUn3REqn/QE+6Y1B5DlbwVTzGcIXMrMo6
         oP/v+U6XH6xoUlivCeBy+356ygp3+6K/B2hrPudC2Woma1xCv5EQjt8+Ewcs10oSIK9t
         1Y4PdrWTUGaWBSVnbaauHLOobZ82KhT8argnNsKnsFthTW7UieKPi+OkBLZYYRd9On+a
         3eGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BYlTHcbhECVjvrGt4cqTT+PnV4gyHCMX1Qp6vgoYv7o=;
        b=e2Lds/gG5luH4w1Go2dcOMsTtLKJVkGObISBmteDWrQ7rvWgbyOfCP3z8QbZJxsJan
         0UHgFIrUoB670/GYb4ti8Vt/1AXG8LYOPcSegeSUrPhCQWMfID6gUFPHyVsTpOOcS87p
         wDjWF6Tv1aG/jx8aYj94/UI07fyUDBq94wSI++oNrfGqyY+Nwy+yEZWwSAL3cLuqkVgd
         5InJWHEWwoX3XgD1at80TNlH9kGc1Mymat3sLXhC7NeJpG4ldasconEBxirReVTliHz9
         G3+vAvrpITJObHjqrKH9NFTkWc8wghAeBJNKuKPgQjdGka9h0aFudXTVO3Zg/t1bGQ6w
         MSIg==
X-Gm-Message-State: AOAM532XKVI1sjLh1lkUyhsDXanW2WMK3mLRandIOCTmSGrbkYgyr7kK
	y+NoeeGpUF8D1k7GCKlPvSXLHX0JWSMSC3kLMus=
X-Google-Smtp-Source: ABdhPJxc/01A5bGuXf2KnbaloRm/2LE5wY6M3hneJMsEzizHMSwoUnLFTF70/hKEJLSL3drrNZ61nQ==
X-Received: by 2002:aca:355:: with SMTP id 82mr26147570oid.155.1620657102066;
        Mon, 10 May 2021 07:31:42 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id g16sm2661309oof.43.2021.05.10.07.31.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 07:31:41 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 23/25] ovmf: update to 202005
Date: Mon, 10 May 2021 04:29:05 -1000
Message-Id: <28f6c91b8ba917f873db01fa7280085454b57066.1620656333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620656333.git.steve@sakoman.com>
References: <cover.1620656333.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f8bf6b5f9aedcc4490008000250e69f74529db75)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index c089627822..91c1b6ba14 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -19,8 +19,8 @@ SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https \
            file://0001-ovmf-Update-to-latest.patch \
         "
 
-PV = "edk2-stable202002"
-SRCREV = "4c0f6e349d32cf27a7104ddd3e729d6ebc88ea70"
+PV = "edk2-stable202005"
+SRCREV = "ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>edk2-stable.*)"
 
 inherit deploy
-- 
2.25.1

