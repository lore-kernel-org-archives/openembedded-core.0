Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.11564.1621204371641969450
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 15:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QIXw3zTX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id i17so4434539wrq.11
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 15:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=g12EGBHCfT0k+CCLoefiDkUdjq2n/bnpPMp3kVWZh50=;
        b=QIXw3zTXZFOKSgGUk0QthRe0qqfWdys+lNBliDBfJMRsskrduV/6FfexVc/beuz895
         N6HW9ezF7wsEE5hSW9ee1ypK2Azh6kPATNhxn77/AwYGoL4VrVOjTpmzba3hRkGCIyQb
         9gYHIquhFrmM+jdDawcMwTpIrQ9RK+Qa6TskI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g12EGBHCfT0k+CCLoefiDkUdjq2n/bnpPMp3kVWZh50=;
        b=YXPqQshZMaCJ2VYlkWX/IxchE9D+5CxFtUdF1fDe4ZOwW0w3oidWJOip0P7it/3XYS
         6sP7R6mP4yqnMFJnZ4yjTljok8ULOz0T9lUj7VwGvB4LmKg6CsTpChROBqNmA7mQuxxZ
         MCwyaXqmkxPAI+ufaVOA+DxzDO5tRHxjxHijo7ss3YOO3+wpfa7WDQmDArfRVtFuQvdW
         bLKBlNA6/NhvHwvqATpuyqGJbZWkKMUFNEhlwe73RcKaNzUrWQcFE/DqatjsICJzV4Xe
         Rih0qigJMSJa56udmW7pPUi3XSkwtMe5PdTh0mAX3HWFmDMcNcm+dz1IEc2pdiwXl+jq
         VfYw==
X-Gm-Message-State: AOAM531FrOdHlkZNCPkbwJ72LHUJrTXuFr8UudMwjKysp29YFF652SXx
	a2nwRE7sze9upDRX0oHYrEtEuDDOcbKYhw==
X-Google-Smtp-Source: ABdhPJzDvBl7Fnnq/IvVKk1SrSGEXh+EfzIUklRBC/WZgAjR7AwYY0gq2FX4iwcJwmEDTChGigKp8A==
X-Received: by 2002:a5d:4fce:: with SMTP id h14mr25709663wrw.239.1621204370232;
        Sun, 16 May 2021 15:32:50 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f8sm11621759wmg.43.2021.05.16.15.32.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:32:50 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/27] python3-git: upgrade 3.1.14 -> 3.1.17
Date: Sun, 16 May 2021 23:32:24 +0100
Message-Id: <20210516223247.2401235-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-git_3.1.14.bb => python3-git_3.1.17.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.14.bb => python3-git_3.1.17.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.14.bb b/meta/recipes-devtools/python/python3-git_3.1.17.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.14.bb
rename to meta/recipes-devtools/python/python3-git_3.1.17.bb
index 911c8f14873..009cac66092 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.14.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.17.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "be27633e7509e58391f10207cd32b2a6cf5b908f92d9cd30da2e514e1137af61"
+SRC_URI[sha256sum] = "ee24bdc93dce357630764db659edaf6b8d664d4ff5447ccfeedd2dc5c253f41e"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.30.2

