Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.10825.1607444024000612541
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 08:13:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IDdsTzio;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id q75so2863758wme.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 08:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cePCRctLIxVDiehBZa4HmPMpl+gQWubKg7kwfyk84RM=;
        b=IDdsTziokUz5N+9RtMiAgHhA7fsfAzCSf+JjZvNtxpRZYp0tB65tV0g7y6VitDHL0L
         MOVh3cgO/hbr3TIrWMRkjCQLW9myy7Q76FpBQ2gjQUyQWZgMmFVoHdEPa+JD73VzJz2Y
         N3tb+2qq+5+wge4x0/QW30dp56Rpjji7QCv2f7VQ6qPFN4HDwT5Hza0uhyraxyBFCL4B
         OrDN4zzb91qiqE5wHei6gUB3QsXFlSN2BwLt7lLKdweqc45gOp6CHRrOduJNbLBicQEY
         i3i0KnFvCRZ8F3tZ1oXgRamVrMmL2INuABj84vX/io55fHr59mUrUk/h0zW7S0G+u+c9
         cCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cePCRctLIxVDiehBZa4HmPMpl+gQWubKg7kwfyk84RM=;
        b=e9uOcyErmEtsbAA9hUWM3QC/ZI/MZCf/p0llUXqvt0wUtZONSPaB9G5saETIPuO/8I
         yr9nB+8Xlt6IQdRyt6sTgCPpLtAATuX7CgRGXTgxBcF8UyKKRONC2/AaawSZhECXjoRU
         c80wyzDM4loGdBO1qwWETLQL8H2g/Z0Eu2GejMYCzUOLiGz5cYfxgwMo8f+r+TjCxBbv
         qgTYK7xdGDSJyKDwtBEKST1K9g1/hP/f7avSmAZWdELbbbD1NEgSUFa3ILAWwpO/yjYh
         UrZMeusdcUYQrjcpF2KYPxrhLCehdbxE1fxd7pd64hMVTJ9L7uInSWQVE3BMShwS0vSx
         qIcg==
X-Gm-Message-State: AOAM531MCjbDyI3NoO8agu0mKlR5ofGWj7uC+Isf7yneLw3NM5mSW8tG
	vC05cxCigJpQo6RW3ejCIAGwh0negj4=
X-Google-Smtp-Source: ABdhPJy4nhIEiysE59+VfvTd0IcUyjQMslGOH1A8v+9XsxnzB+QI73Iw5CcxzCNe73K+mgCkFp+zWQ==
X-Received: by 2002:a1c:4604:: with SMTP id t4mr4348951wma.17.1607444022392;
        Tue, 08 Dec 2020 08:13:42 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id 35sm15232307wrf.9.2020.12.08.08.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 08:13:40 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2 7/8] gstreamer1.0-plugins-bad: transcode plugin external deps is always present
Date: Tue,  8 Dec 2020 16:12:56 +0000
Message-Id: <20201208161257.949716-7-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201208161257.949716-1-quaresma.jose@gmail.com>
References: <20201208161257.949716-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

it only needs gstreamer-pbutils-1.0 from gst-plugins-base

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb                 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
index 9c8fea1f41..d37a223254 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
@@ -92,6 +92,7 @@ EXTRA_OEMESON += " \
     -Dfbdev=enabled \
     -Dipcpipeline=enabled \
     -Dshm=enabled \
+    -Dtranscode=enabled \
     -Dandroidmedia=disabled \
     -Dapplemedia=disabled \
     -Davtp=disabled \
-- 
2.29.2

