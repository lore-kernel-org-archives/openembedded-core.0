Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.1216.1604335793848438876
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CKPQs/nt;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id cw8so6240154ejb.8
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YFLum/pXjtMjLwg35VONlgAIMfz4c1/o+1auNhbTMxA=;
        b=CKPQs/ntazH1Ju/dU75qC7424iErFj+lotk2+CfYp+DIxS4sOWixAcVlO4F3AbKRtd
         TbMY0kXvtn3boiIgBvau33DVaA+GfNtxH5Sl/7vH/qEW0FhQtfEpdl2KGFvu//m9EVAf
         EGBkmu37Cj92vS86iLmdjTZkD8KbkewpHUWlWQcvGLyzGSQUxa/DixoLthfOeNHREsAh
         YQw7oL3qsdqmDxzQmwmD2yo8149qeX1qPutZr60G4bEjLEsQIoFppyzKARG3+ySlec5n
         OYIAxe6xtDlk5uvCYMC90YPAoO2MWTnLazCjq6woFBJVkZoV/g46rf9gU/QPkKAcrvjy
         sSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YFLum/pXjtMjLwg35VONlgAIMfz4c1/o+1auNhbTMxA=;
        b=TbE1TjHowxg2Jg7PO08uqEsrbmbS/4E+TsTo18FPGdnObZL1TG0jvMlOM+RKyCixa9
         5iMtgiiVJJ70pFmL0n1BdpbyIc5bwlCmOH6WR0VDHPr3jJO+SXSOya4f/GyQfD1be3eB
         LQyxvSteWsFkD28LV1f0oa7LH63zivInJsXCelqniQKMGUx5AZP93T4XtqJlpDWHPbzz
         rzgUjRSuHFIm8jE3Yq15/Us75yEtrh23NnWxzIQ9TIY9aHCbZhyWsBUEZQUIvXqRY0Zj
         h/cYL5GCbS9ihX99DYGSCzEhcAHHSJz//znHoecyHBMmv0Ghades1HKwDT0zai639OzZ
         j3YA==
X-Gm-Message-State: AOAM533eUOAwHB6jegBG6sgWI9UVPrnh44zsVT1mafLYq7YL4qyAY2FJ
	XFXmhMcycAaKf3aHF8AoAo7l03woCDrTWA==
X-Google-Smtp-Source: ABdhPJxX/2C1EH9WjA+rENqlmg2sDVDb50cjEO07oOSHBvJ7zNMW36GrqPGdnzNSiqemKU5e0x3nRg==
X-Received: by 2002:a17:906:1158:: with SMTP id i24mr15665157eja.304.1604335792181;
        Mon, 02 Nov 2020 08:49:52 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:51 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 39/80] openssh: upgrade 8.3p1 -> 8.4p1
Date: Mon,  2 Nov 2020 17:48:26 +0100
Message-Id: <20201102164907.27572-39-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../openssh/{openssh_8.3p1.bb => openssh_8.4p1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssh/{openssh_8.3p1.bb => openssh_8.4p1.bb} (98%)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.3p1.bb b/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
similarity index 98%
rename from meta/recipes-connectivity/openssh/openssh_8.3p1.bb
rename to meta/recipes-connectivity/openssh/openssh_8.4p1.bb
index e007328704..720b238e71 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
            "
-SRC_URI[sha256sum] = "f2befbe0472fe7eb75d23340eb17531cb6b3aac24075e2066b41f814e12387b2"
+SRC_URI[sha256sum] = "5a01d22e407eb1c05ba8a8f7c654d388a13e9f226e4ed33bd38748dafa1d2b24"
 
 PAM_SRC_URI = "file://sshd"
 
-- 
2.29.0

