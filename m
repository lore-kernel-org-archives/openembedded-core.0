Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.2626.1589495187482122234
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 15:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kynetics-com.20150623.gappssmtp.com header.s=20150623 header.b=aknzJMVK;
 spf=neutral (domain: kynetics.com, ip: 209.85.221.49, mailfrom: diego.rondini@kynetics.com)
Received: by mail-wr1-f49.google.com with SMTP id v12so855525wrp.12
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 15:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XWNCYhwsxwMf0QieDu7rZQRaXeYiBapPb3Nnms/MS9Q=;
        b=aknzJMVKDTGtm8a3k/NV40x5xFstlECB153jheHEx2vPE+stH7R8vbgj/BZ10PHD8W
         K0Axh5of4W/DPg1YYTQdiOT1kKBLj4SjnYmxpMzP6V/cTflM3dJ8uw+39hSOufu/xD8G
         E4gdGFhdFqLJaZLUvEm4H7oLG1A+3Xm79ajatDdO+dVjYWBucms+o+DEteBka6R5cwNy
         AUCSFEO3AkPIXz3SJLwGawHr022TMTSXV+gOGpCiAPRQCGSwq+ZlrR4Nn9Kj2ejgWpd5
         //7ycy5w+/BCk9FilL3DhxVb4Asw3Du/vjbi4mR0jrVFJMVPVdVf0UNhwhwg+2haVYw+
         p+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XWNCYhwsxwMf0QieDu7rZQRaXeYiBapPb3Nnms/MS9Q=;
        b=lMlpq46FdwXo1oOxXOofbNI6iglkXkEGBp4rRlMrF4xnsBbqTGHBLZA84aSkyX7GV+
         P4DG9/iU56dHGVVtJJ7osYMcOIE+c/GDWbtukLolTPcJTtoJEbOfal+ZFWcL8G3baW7p
         rKx2W2Znd3E7CHq4oS+ZnaPBtWCrqEWsskT4wBB+XlIUNVdDMuV2eM6BbWVBdoF2Hz0K
         WoIKhNDnWqF33gBOxNvc2dYs8wE6eNaOST0plaK4fwfNAC26+1XNhqkcN+sQmj1lIM/T
         vJ/5zznmN6S4qAs96WiVmcX9IBVw3XS7XY3Ttc8IcpTQLIGVPMxdqUE/1aslh7p3snlu
         a05g==
X-Gm-Message-State: AOAM530yVbBpxz9DtOHO+w3C5QG7cx7ZbHOcxHvoryJppb7TLrbXXO8l
	J4cEN0W8CP0/veDLMvOS1OA8tWO5Png=
X-Google-Smtp-Source: ABdhPJyPpStWWq/LT0kdSYNBGHNRAhJqaBeEvzQD2TvYWS0ZoAVeucmtDcD1ft1v/gdKTfb7aFxqQw==
X-Received: by 2002:adf:dc86:: with SMTP id r6mr633911wrj.45.1589495185827;
        Thu, 14 May 2020 15:26:25 -0700 (PDT)
Return-Path: <diego.rondini@kynetics.com>
Received: from localhost.lan (mob-2-41-210-190.net.vodafone.it. [2.41.210.190])
        by smtp.gmail.com with ESMTPSA id j1sm554573wrm.40.2020.05.14.15.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 15:26:25 -0700 (PDT)
From: "Diego" <diego.rondini@kynetics.com>
To: openembedded-core@lists.openembedded.org
Cc: Diego Rondini <diego.rondini@kynetics.com>
Subject: [PATCH v2] bmap-tools: update development snapshot revision
Date: Fri, 15 May 2020 00:26:14 +0200
Message-Id: <20200514222614.31365-1-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update from a previous development snapshot to the latest development snapshot
that includes, among other improvements, support for zstd compression format.

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
Changes in v2:
- clarify in the commit message that we are just updating from a previous snapshot, not from a release
---
 meta/recipes-support/bmap-tools/bmap-tools_3.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
index 7c4db85b32..694c5f09be 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/intel/${BPN}"
 
-SRCREV = "db7087b883bf52cbff063ad17a41cc1cbb85104d"
+SRCREV = "a17f0e3ff8669dd3b1c44a741ae4f8162155faed"
 S = "${WORKDIR}/git"
 PV .= "+git${SRCPV}"
 
-- 
2.21.3

