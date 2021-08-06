Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.3850.1628251616004405785
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 05:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hXbUpMsf;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id b128so5463326wmb.4
        for <Openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 05:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lXYkJW9oG4U8tMkAOjQ/Z9NR//yPUHOjo+D1eouedMY=;
        b=hXbUpMsf1QuH/lAmZZ+dN7tIEVSOKSuaOZvcGtwqMfDQ3H0QiKDT/9ybLioETH5PK0
         6BoxYVn34mpLK+SgBVNB1X+Kn/1rBU87PDN0Rv2uETiIcdxc/T/WevgNCofu33m/hmi2
         SrewKZ6meD56reveiH3AC+3bfRzDLf1AyEI7CajaypZ8+8YPLsJlZDQE3WcmV5dPA10a
         T4Vh2QRt+PkUxtlff+8JyjU0nxhQ/Ud08YMJ6msSi286MUfXlewtp62tpG8u9b+/qDYd
         i4yTL587vwtENp7t8nV0BHbIBw6kpKYDXmjQoWqYFv0B7AC+6ixsFCzjQxbeOab5igiZ
         XH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lXYkJW9oG4U8tMkAOjQ/Z9NR//yPUHOjo+D1eouedMY=;
        b=dbsFJyFkKIx8kVUnEnWMwTQ7Umtf82jlbcYvWqzhZMJ9qKE0HMk0OB88Qaj0msRilF
         M7yqeKfoqcrjUSAZatvR53fUgNYOWFQkc+TeRXkbs2RdtRjAlVPjLzj2gRsz9pMdcBcz
         IvOPmfU/Q1vVs/vUNAcYpbWCyfDQfBKqhi2ZzfZkGmb5ZwIP4LfBUXXfv/u413mI9SUY
         XbOgThWJKawUMJxKeFVsZn60Qiq652qoV+iodGgdkD8LIfna0sNp57H+kqlA8FbOyGuh
         LmSCVq/rL3wPLchdDtmo1aZHdyKJ0Ps9aQJXpztw772adTh+oRzJY+YvrRArLLJylg6p
         ui0Q==
X-Gm-Message-State: AOAM532h6B80dohd2cCCeqEemW09S0v5HanTgkuseY/GSgyt1nTB+LqT
	UCuz6sBRZph47X6RmTc9bfD9csOvqOob4Jkh
X-Google-Smtp-Source: ABdhPJyrVvmEwlo5kAwDNTUJZnJ11YCb2WD0KgDOeFj75Lka7nTMtTJ5nEsyPMOeJZwjW7mD+WxKjA==
X-Received: by 2002:a05:600c:896:: with SMTP id l22mr20133756wmp.68.1628251614421;
        Fri, 06 Aug 2021 05:06:54 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([194.99.105.70])
        by smtp.gmail.com with ESMTPSA id n11sm11093049wrs.81.2021.08.06.05.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 05:06:54 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v4 7/7] MAINTAINERS: add overlayfs maintainer
Date: Fri,  6 Aug 2021 14:06:11 +0200
Message-Id: <20210806120611.124246-7-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210806120611.124246-1-uvv.mail@gmail.com>
References: <20210806120611.124246-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 MAINTAINERS.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS.md b/MAINTAINERS.md
index 2ddcde6878..36a9bde90c 100644
--- a/MAINTAINERS.md
+++ b/MAINTAINERS.md
@@ -40,6 +40,7 @@ Component/Subsystem Maintainers
 * opkg: Alex Stewart
 * devtool: Saul Wold
 * eSDK: Saul Wold
+* overlayfs: Vyacheslav Yurkov
 
 Maintainers needed
 ------------------
-- 
2.28.0

