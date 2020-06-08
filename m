Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.25173.1591602497181749826
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MLmP7eLd;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id l12so13371981ejn.10
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mN+Hrje6Em/Y9QhRXSPdq+lNC441ag5pbgqGi7zbk+o=;
        b=MLmP7eLdfN6T+QADRFL+LVB+OuBFHkUBBZMowP+9u58gICcR5eLH2EqNMym+/V4rf7
         xQ8qdZmjBOvA5cnrPokY3dp7Rw5iXkF2fNWahwG6kCM6GRrcFY2obXIqSnFjcyiVRnOi
         fsBgWH09kE1eR5aTs3JhgsrFc2PTnEDIMWOCfuM5S8y3HEBhI1cOEn+3vwSEmNFB1ak8
         pGK31JkrHjD5AXBO7uxqo/+cse4NGsa+l5AGQpaTU8ElTPMSfyH7Zudn9KPGES9+yfJm
         ID1rXhuYEkYF3BQijPXmblc5oU/IgnuRm1UI1DPZ/vo6QBQWPKhURNqJCvrU0pvwSTd1
         PV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mN+Hrje6Em/Y9QhRXSPdq+lNC441ag5pbgqGi7zbk+o=;
        b=Wm13R7N4IDD68uqhecjsls0T1sY8IkvjBvK0ghdO7eAAle89Tz4hjVk3FaBjF0JsyX
         IvFlb8effjr6rS9Go3XS1+Ief8fHltDc0zbBaIIFcADyVTujIhSqELa1q+Pml5Mshvbx
         LWLXN/o932UNWyzXrBGNamZO/PACAeCJrC+EMquu28DTcoc0sk7EY34EMy3OLuVnraEQ
         sDyEs0s1HGi9KFR24Ney0sgVsvMXmOnjKGrFjw6BDc5hsD5CzPTSUf2h3zAwC3AzUApt
         IhBmhoRwFY4fTc71f/QX4uLQrcYTniHYrzgzVNyRV8SgtNeH49R3yegx+389/nabygx+
         hUUg==
X-Gm-Message-State: AOAM533szl5E9fJkPG/dDrZ0ajVDPqGOBYwX5S92evSI3LRKB+XbRfCJ
	+RfZLmGRQyxWo0o9XOsGPCN7lwAA4ro=
X-Google-Smtp-Source: ABdhPJxAvB04LRUT2YR6l+1t44lc/v6jxOmOCEmTuOjjwiI8IeuIGVYRNJ9wEJ6kbJbNsEy4JTrarw==
X-Received: by 2002:a17:906:6d3:: with SMTP id v19mr19413246ejb.306.1591602495526;
        Mon, 08 Jun 2020 00:48:15 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:14 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/42] createrepo-c: upgrade 0.15.10 -> 0.15.11
Date: Mon,  8 Jun 2020 09:46:20 +0200
Message-Id: <20200608074659.7051-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{createrepo-c_0.15.10.bb => createrepo-c_0.15.11.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.15.10.bb => createrepo-c_0.15.11.bb} (95%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.10.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.11.bb
similarity index 95%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.15.10.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.15.11.bb
index 13bfa21091..969894e448 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.10.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.11.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "9f3f3be6359d8f9b6b269e28d9ae1f279cc5f3aa"
+SRCREV = "ea3bcf302c1a071040e1a8b6ad77861c12a2ae99"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.2

