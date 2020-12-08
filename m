Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.10781.1607444022019027212
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 08:13:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IaNGSedz;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id a3so2840828wmb.5
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 08:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SbA/8a5a8I8qwefGbKZBIbFrPv0bL8RBffAb9Kks59U=;
        b=IaNGSedzUMCAGNZ6LtQEtYvdiAgoooXNIzj2I6p5XHazcaWsM78tpwOc3TvNfwgvWB
         WieTWx1NF8K3bAb7tymWmmT097TuJC6bHIEZH+279lWt6EoyQx/EYegarRrmJG0GAPAE
         HbrKt67mDEvAVBOoeBc2QbRAkzctw4f2a01Ajhhw8Xyc9+uOvGJvfVvFpuPrFUPcBhaQ
         h0Oiite3TDfVeiElGcRNnbcQ2nS+R7G4pbXaK2Ql2Xmy5rCmWzGNnnh3DKIScpCtn0SQ
         +bnBlYxFHuGb1rySIQv8hIEUW3llTbpmVGPI6ha+VKiGWb51u7mYj+0UOqhB0dbRJXLo
         XMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SbA/8a5a8I8qwefGbKZBIbFrPv0bL8RBffAb9Kks59U=;
        b=G/1MXor2biyiV0DtHWp3881ei5hhxbiL0FfgD89JUpgsoZHbzB5rzdIMof8ttZs+kE
         rDtVQmR0BbD7twX0/SM/kn2gfFrhP5goTJQdmGZEhLXONSRMs6dWOy4C5nsapSVU2sYl
         Nja65NVg7CeDxSruof9ZP51tSPABoOLK+aYClCXiDGfMwnpDo/RkbHq67CaFzSx6rlOL
         qEbKdHbBP93ZN3FqiEV1mx99mBfvpJcS3ornkbeAKJ11SMdtG0z3d4NfrxNdZwghXR94
         YmLqBLF4qpimglCh1oAEsjEr5sQRpmFXTHjSXfGbUzWuNj77RSw8uC994QLUit5c2ulw
         mOfQ==
X-Gm-Message-State: AOAM530oMzPveM5aXF+Foz7Fp1elOvI3mc2SJ8TdtVI5NXErLT/JHJXz
	an7UbBZujMc8ZY58TLpL5Ytn0Z/9yBc=
X-Google-Smtp-Source: ABdhPJxeRRdjEDBPd1zhFzTktVmYJBojqktT7UShXKpi+FvDh9EGUxwlfIR5a5XjQpMqENx/e3pM3w==
X-Received: by 2002:a1c:e142:: with SMTP id y63mr4677542wmg.28.1607444019991;
        Tue, 08 Dec 2020 08:13:39 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id 35sm15232307wrf.9.2020.12.08.08.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 08:13:39 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2 6/8] gstreamer1.0-plugins-bad: netsim plugin don't have external deps
Date: Tue,  8 Dec 2020 16:12:55 +0000
Message-Id: <20201208161257.949716-6-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201208161257.949716-1-quaresma.jose@gmail.com>
References: <20201208161257.949716-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb                 | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
index adddceb799..9c8fea1f41 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
@@ -91,7 +91,6 @@ EXTRA_OEMESON += " \
     -Ddvb=enabled \
     -Dfbdev=enabled \
     -Dipcpipeline=enabled \
-    -Dnetsim=enabled \
     -Dshm=enabled \
     -Dandroidmedia=disabled \
     -Dapplemedia=disabled \
-- 
2.29.2

