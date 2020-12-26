Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.19292.1608974885789494288
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d7ymJ8im;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id h16so5557647edt.7
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xILJsms81cwHWYaejrw4vOelLinAsQg+7+aNJIvf7/s=;
        b=d7ymJ8imDv1AE0HFjwAysofP6y2cVxJk35dUk/8XNt+Yy1dIRBp7IZsU3BdWUZhue8
         /pGYUvrOKFsy/H6DnEIjoMznprpGRQAuuVHSRAtxd5DdV6AtfzNrWH4AdED2kyxQ9BxI
         bOhdLJv08t2uBWIfbvSzB+TpwgXqApY1IQMHfbRFO1LGITKQJUQTKbST9hdPWxkMgn8C
         z++wbGv05smuoJlOwGR2kXPzWWXG2HXxkTBvtxUxpB/rv7ZaYc/auPxU4CmEYgFEMiOW
         I2yo57koLLatD60kG+NgnKD+pxMq63xJE2gdzWOvA7JuLdZt3o/A+EBOAg9nowxdDF+J
         QwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xILJsms81cwHWYaejrw4vOelLinAsQg+7+aNJIvf7/s=;
        b=GygmpgdhYbpVdBNC8FkDy39+ciUnsjBqFjXqfaE+12RtcS2IoVd5nGv33Z2R+ETf2p
         zpk3xcKID8+eRqfTDexZhEU8eh7jKsixWYXB7HgQttTk12Xe86oB2c2pp2Ghhhw6+O0R
         jGx+4yZR/EpT+76hemMTPOwRmstzX814n0g5KE7mkfrPoiUa2I8nSvD96WMW39fvYOXA
         dY0fZdr69e1Z1RbFU3FXbRBFPd/TsYDnbtKu8d9iyrwDNRpDzIytCvO+hM9gbiLMWEJG
         EAa5FcmzyEp/i/irgTQNUpj6SJ71KKK2RU/tjpC/Dzby7UzPc2LJe+1093i1VYBPLh4B
         01oQ==
X-Gm-Message-State: AOAM532VT2KwxQEDVHmmo3lW0D/jCKsLKbKUOZxRvMxvrHNv+ehbClxn
	E1Og7jeX/P3OOX6t+0Fl4gRfO3QEcl4=
X-Google-Smtp-Source: ABdhPJwJvn7qe2qcNNQ6fbv53wNt4R9ZWKi0AJk/F/Vsmo+vGajhJ8MCFGY3lRv5OjRRZyhm228NPA==
X-Received: by 2002:a50:d553:: with SMTP id f19mr34103149edj.323.1608974884469;
        Sat, 26 Dec 2020 01:28:04 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:28:04 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 28/48] sysvinit: upgrade 2.97 -> 2.98
Date: Sat, 26 Dec 2020 10:27:12 +0100
Message-Id: <20201226092732.52323-28-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../sysvinit/{sysvinit_2.97.bb => sysvinit_2.98.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/sysvinit/{sysvinit_2.97.bb => sysvinit_2.98.bb} (97%)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.97.bb b/meta/recipes-core/sysvinit/sysvinit_2.98.bb
similarity index 97%
rename from meta/recipes-core/sysvinit/sysvinit_2.97.bb
rename to meta/recipes-core/sysvinit/sysvinit_2.98.bb
index 98916f7f19..fd39c61fb5 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.97.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.98.bb
@@ -21,7 +21,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.xz \
            file://bootlogd.init \
            file://01_bootlogd \
            "
-SRC_URI[sha256sum] = "2d5996857519bfd8634d2e1debabb3238fb38440f65fbfdc46420ee8bdf25110"
+SRC_URI[sha256sum] = "7b2c3ffaf19eaf1ca80268762f85f9e4eb8e3c973213d49f9802605b72caa7dc"
 
 S = "${WORKDIR}/sysvinit-${PV}"
 
-- 
2.29.2

