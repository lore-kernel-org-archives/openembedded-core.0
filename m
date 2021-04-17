Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web09.3008.1618690922365179792
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Apr 2021 13:22:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=Mpm1iLaZ;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.173, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f173.google.com with SMTP id o16so34892173ljp.3
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Apr 2021 13:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XQezuMoch3pSBx2uYWnAg4iqgWyxMOWopvG7q6Cfxe0=;
        b=Mpm1iLaZM3fsuM5qB8RQIrXSP2rXdfPF/UjaxuxuJl9mcXQS1VXWwAmzUPq7AtTBzg
         83WtLKXIrrmXA80VZ94pFrjlko3vWBPk+eB50AfKuEfNb8c2gOPeO69hdNr2zy9iDg6T
         fXtL7OwwPev7y4tH2Ya2oGl4Kwgvz7ueem57JHlizs5T+0+GWclGA6yqN4OTNquXlwa+
         dXpVfKzJgpCtL83n+zVA2uS5Bl00Pbq4PoOqHb/RvPjLm0YOuoNuQqUyCVsP6JEaQNL4
         xpIeuMINuumQ1lJ/rqG0J7n2IlIBREa13k0Zn5B7mGdyYirdxR0ofoL69WdDaj+1vng4
         i1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XQezuMoch3pSBx2uYWnAg4iqgWyxMOWopvG7q6Cfxe0=;
        b=Wyzs0ETWsvsQezmYTt0jDOF/A+RfRVfYxZhBZKD9mOw1XKAabgXnjgvkIa7A4k4ROD
         wCG4aMzmgQ/Wykmb4lZ9660UPzpcZ9WgwHWDRhHT9FzlJXJR02fHsDuODKk6JDycssVn
         5K/Wv+sdsSVje2OVGsrG2rsGbc6+X4L3o3leK4LEPbCkcH48v60XaPX59PvDu21juCz2
         OaHMOJbNHCM/hKJbVeZ4Y/a2ucKpBG5Q7RsUuTRxYr11AI0o7IGSdxC/y702C0U8LUFs
         w7I60TX/ivTS7MMT0TYpNEhShPGdZwS0HG5c9zmKyaJJ4USe0/KCcFOoA1ffgaJ59nx1
         YIJA==
X-Gm-Message-State: AOAM531F/tmkQcFVCOzDcuLGkzUo0jZTfDpJrMOnU352NzmiQAxn3Nbv
	Sbwz4U76isnMUS1mTBXlMMY28ab8viYtxEdC
X-Google-Smtp-Source: ABdhPJyRoHgxxRwtIjqyoG21z6oc85Om6iVhUmotMsl19bM0jCwOuvvwbOgfoiqmuJqXBwJR5OCuZA==
X-Received: by 2002:a2e:8886:: with SMTP id k6mr6456883lji.292.1618690920429;
        Sat, 17 Apr 2021 13:22:00 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id 5sm327742lfy.15.2021.04.17.13.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 13:22:00 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-setuptools: update to 56.0.0
Date: Sat, 17 Apr 2021 22:21:58 +0200
Message-Id: <20210417202158.355301-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...ython3-setuptools_54.1.1.bb => python3-setuptools_56.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools_54.1.1.bb => python3-setuptools_56.0.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_54.1.1.bb b/meta/recipes-devtools/python/python3-setuptools_56.0.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_54.1.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_56.0.0.bb
index 74264a3814..07a82ad21b 100644
--- a/meta/recipes-devtools/python/python3-setuptools_54.1.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_56.0.0.bb
@@ -10,7 +10,7 @@ SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "1ce82798848a978696465866bb3aaab356003c42d6143e1111fcf069ac838274"
+SRC_URI[sha256sum] = "08a1c0f99455307c48690f00d5c2ac2c1ccfab04df00454fef854ec145b81302"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.25.1

