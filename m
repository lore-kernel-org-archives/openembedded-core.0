Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web11.2797.1593155953554212976
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ESwMt52d;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id g20so5908380edm.4
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 00:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yVmSw+OoD9uhpMimzoQbME+/Z7I0RrVNJo/3JnwaDUY=;
        b=ESwMt52dI966JYm9FmyVdPYQkLB10oTdBYOH1Z3r/RD4mLSwy3tpqeDV1/g7nDzR7E
         q/ndqQFHSqP5Jo8x/D8OjRCsBBr+v8p3IvixSwn2UW8ZJHoOMqGZZm4zVxXkEGWlbI2Z
         ED9LqJfP40DWBHv0Yf5+n0+VldLyodSoW37ZQpcGRl9IKp0d9pdQfrvXhrgeCY1MP0OD
         hZtXrDBJoE+PeiRuuQ2+eS7N3ciusZz+0AfmSgY/LblTXVyAq9BZVQpGtVDJr3UXShfR
         DHZEzp+PXHtievPo36z5XyBLuVNUIZtF9DHMLjPMCeYa0mamOV8nT0sTiczRkC3apl7g
         05/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yVmSw+OoD9uhpMimzoQbME+/Z7I0RrVNJo/3JnwaDUY=;
        b=tg75uJ2H62IH6/3wvfdEsI89I/WlWAFmAWCI1d31xMFp41uzVRXRVQRCetGQBv2kta
         Q59mYzaG3MO9ZkJpmDWTrURKTDJmokrgCGgSw3UWWf/zULpFBwX4kn+dDOF7wqqOaq7k
         jUmeAvATYGjAce8z4zlGFicVLvxLstes5BCvWdqgLTogP4FzypwYGkSshZL65kVOTuPH
         kZkweE+/wWxzlnySkKYseSzaavKelkp97wvay5mDFUEMX3GT9i5Fn1znRzC8QxWj3TAP
         2tlwK6QgylW2bzixJXVLcaef6G4CqELBLPtXfmCWXMilsy05Le1onuheTHeKkQFRM0el
         QKYA==
X-Gm-Message-State: AOAM532brR3lumlFIoZpswDykZisuNIYhrns9NFI1eAczZkw42m8yKmY
	Ae0xI2ZGj5+pQvjj+id2DeTOBvQ7BTE=
X-Google-Smtp-Source: ABdhPJwwwkMCohPWCEJoJpKFWZ53ho5XBStcKI0UzZYGYun2PsKPg+qaPcJZgSzgOsVtmt5wtd9Hug==
X-Received: by 2002:aa7:cfc8:: with SMTP id r8mr2027724edy.125.1593155951130;
        Fri, 26 Jun 2020 00:19:11 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id p4sm20826194edj.64.2020.06.26.00.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:19:10 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/30] gst-examples: upstream releases are even numbered
Date: Fri, 26 Jun 2020 09:18:24 +0200
Message-Id: <20200626071844.29134-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626071844.29134-1-alex.kanavin@gmail.com>
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb
index cc7a7e78e2..e23d23d9ca 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb
@@ -15,6 +15,7 @@ S = "${WORKDIR}/git"
 
 inherit meson pkgconfig features_check
 
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.27.0

