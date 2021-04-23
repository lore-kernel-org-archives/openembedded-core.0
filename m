Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web09.25.1619208244343918974
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 13:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Fp7d+6Qd;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id o16so12147110plg.5
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 13:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L4+VuEZdJUsMXOnYYMRBbAj63LByjSl0Gd/JrHTiWRQ=;
        b=Fp7d+6QdqqrCrT0tmrDTwLylmrnIQGLMZRTShnawKI9/ytQEbsl+v1F6SZQrw6segt
         x0chmGdq4FJPgXQsvP5H5Ff8sEnwmczfnCBRudm6fR8t8dl2IBLYkKlPMhVSbpUhlRMe
         QhIkp6/xfC+58T1oK8z5haPgWEulBbMO1Alk+a/E1LSEHb/5CMUVedgzxKMCh2L800tb
         p5HdNqs4msKpiq9NIcX7SfcBa06zuBcBtJ8D8ENuzyPe4W20VYMCt7us2euJzQJ2YGjp
         soWi8RvYcdBJjrGJsXToejQrSyhZg4mzDTMuMOfxk3rHfsK/TZpCR6Sy635ofnyqU3jA
         gGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L4+VuEZdJUsMXOnYYMRBbAj63LByjSl0Gd/JrHTiWRQ=;
        b=NBD45I9jYobKVCLvy+Y0kM8yx1RRQRXG2b8BLTABTC7pbj1xnYTRf/o1AolpJN1SM7
         2hndkgsV4er8Wdhowd2mTC4oJEOvIxYAKW7xKwog4XZ/o/49LZxCtuWiQA+yqaE+og0r
         PwPoZ6qVZQgtZCmg1RXe42sFnh2NNrNWnn0tsTYVMxHH701uw/uugE3b0CqL8ZqIheCU
         fJtXwsvJQGO0wkTjXMMc8hteQRSfBDP7eKOJpRpt2QfiG7zWwmHIVHRMVYZCUSbkgd63
         lwsBCo/QJkJfUwtJn4jRYcbN4wmO5Gili4GaYEZ1JQZxIDWVrvHU8uauecng1WQMurJf
         r9Qw==
X-Gm-Message-State: AOAM531zZQVTZIoNq7ON9DCC1dlyXGStvmb9y3urYakgHayikoob8rs3
	897eH6OZS96XUmBEc8oegUoOZ8nWxmX1gw==
X-Google-Smtp-Source: ABdhPJxGvi5pITeGZ/65aipQnu9lgp4sqDkY+S5in1SEE1+3MvxfLLDl2izndXFMcDHJ5XER+CBfeg==
X-Received: by 2002:a17:90b:34c:: with SMTP id fh12mr6130045pjb.114.1619208243715;
        Fri, 23 Apr 2021 13:04:03 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id d132sm5201282pfd.136.2021.04.23.13.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 13:04:03 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3-markupsafe: Enable ptests
Date: Fri, 23 Apr 2021 13:03:57 -0700
Message-Id: <20210423200400.1108673-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423200400.1108673-1-raj.khem@gmail.com>
References: <20210423200400.1108673-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pytest is now in OE-Core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb b/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb
index 403a98a43f..cade4e0f51 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8
 
 PYPI_PACKAGE = "MarkupSafe"
 inherit pypi setuptools3
-# ptest disabled in OE-Core for now due to missing dependencies
+inherit ${@bb.utils.filter('DISTRO_FEATURES', 'ptest', d)}
 
 RDEPENDS_${PN} += "${PYTHON_PN}-stringold"
 
-- 
2.31.1

