Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.541.1621532675686924280
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 10:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g8WznaLw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id c14so16738696wrx.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 10:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GdvdlwpGwZRr5Tc0azeO4loSLLcP77NaXgxanny8I4w=;
        b=g8WznaLwN1R1haRbzBNjvW9G4sDmGpHJ0h5AM67/4f9ynzX/HgGJd4CNcKe8u1aUgf
         NsU/9al70GbZ6tT2Sgk1J7GMNWi2yq+ofty+NLF4UPkUhnn55W/FzbIPvdMg9fgzFXui
         vxeShYeB0myCjBSqhLkUc4qqo2dRBmY3F5yI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GdvdlwpGwZRr5Tc0azeO4loSLLcP77NaXgxanny8I4w=;
        b=fJTHSoHbD6m51N6V2Y3yonf6ANQLbGM0/i56usZvCn/e5CxF3vJuMkEZSgiVDaLuGb
         B44Gh/fX+5xoKJd5bob0zPXYazG9bDF9XNsV69osMdO+hdBzRY7GMr2klfH/4MzYVWZ5
         z//8zHIrFwi42BE7McwrFmD7ad7gInBxNjXqFmw2LycTFIT4uOEbnvMHUNvrKfVbOAnT
         1CGS6ZnkuVA8XvCAEBgE2TE8hZiTYz51fbPaheM5ltv3JCYiAk6Q036ZIwnDXR2YCpm4
         ttMPqYOCMxJXgm71nXVVMQ8NNp1K1bQ7/5qlX85T4B+umCJ5CdEmMzy8b2CwsUZFVEqB
         Cmlg==
X-Gm-Message-State: AOAM532TUuQzly6eQOMj6EZegTcJ2zAGBLju9v12hmiu5yxlH77Eyxlm
	pjDQ/SkYZEskahuK2CGYO6JBfTFRl6848A==
X-Google-Smtp-Source: ABdhPJwXclb7oVX7uhbNqPL/kSXQesSLNxOmuuSTWMILUtmkGleXsIkuDYGuOHXH3d+mVl7B5ULwsg==
X-Received: by 2002:a05:6000:504:: with SMTP id a4mr5570027wrf.51.1621532673941;
        Thu, 20 May 2021 10:44:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:56da:83e7:85fe:8f81])
        by smtp.gmail.com with ESMTPSA id f6sm4574991wru.72.2021.05.20.10.44.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 10:44:33 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] grub: Exclude CVE-2019-14865 from cve-check
Date: Thu, 20 May 2021 18:44:32 +0100
Message-Id: <20210520174433.2523177-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CVE only applies to RHEL.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/grub/grub2.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index f0fa86b1823..3c6b434c2d5 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -34,6 +34,9 @@ CVE_CHECK_WHITELIST += "\
     CVE-2020-25632 CVE-2020-25647 CVE-2020-27749 CVE-2020-27779 \
     CVE-2021-3418 CVE-2021-20225 CVE-2021-20233"
 
+# Applies only to RHEL
+CVE_CHECK_WHITELIST += "CVE-2019-14865"
+
 S = "${WORKDIR}/grub-${REALPV}"
 
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/grub"
-- 
2.30.2

