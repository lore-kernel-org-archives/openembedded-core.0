Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.8254.1621599140578396362
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 May 2021 05:12:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c+BZLvUK;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id c10so8343085lfm.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 May 2021 05:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ttReFiQsUKWh6gexUa/ZQtmGOzJ/YjycQ66bQVirygs=;
        b=c+BZLvUKUBazgOktUcewVPUSF+8MN04oNfMUbQexW5IRRwQUiJ8mebNMMSciysZHnQ
         2UyBJR+yELgJ6D0m6xfoRAGadeUAQrtKUpZjHkWmrd93dDRer0ZGMiltnKjBwo4nf7/M
         ljHFiz5ekA/yFCH2AA6YlXTPi3kFKWBpKsbZLOCKbsoRlBykGotPRHJhmkh3A+e+vr+r
         kbgW5xGnMAMbXIXUWTLGrQwqVGVH+qT8vSFpVzWEfnd+JxsbhQKSiFVK0v1WC83x96Ma
         GP4kVP+iJ9RQ7Pn+LXletSsdzBG8NZ1pZpcN5VKxYOMveFiDTU+vyb6Oioq0EK2TBF0d
         /Wuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ttReFiQsUKWh6gexUa/ZQtmGOzJ/YjycQ66bQVirygs=;
        b=jlf34ODgrrbl7wFBYKnkXEh9YvvCKuEDWkmR0YWno2a8EGw5THF7KIQfWJPmdvpgcl
         x4J0eNmhsOhmSx4g9lKeFhHM/XIzrSyiZISO+CHogEkpg/Ym6dxOCzQ+D9E+Hvw4JIlT
         0oavrf4ftskFhCNtMglyM90Y1hHPUs25Qf67lUD+K8mkF4KBnAibW+rVTkwrMnGSomOr
         4aAOC7hQnOZ69u4hEd2UxuFejCB78jkIqxRpFex2dcI7CI6cHPpS8pjNd5UqaUP9LpIR
         7jhKMGLxIKFrHvSSPFbMEpbkLk+AqPNsV/LAsGrBg7HiVLHK98dMhVXIvhyc5gZ/aWLc
         cvfg==
X-Gm-Message-State: AOAM530Fa/0GzkSpmPrfnQSaonwPNiAFZsPoy5+oSwtvnCu7MhRorlka
	B83WSUNU5uJqvF9lHHTsoNNKX/qJJkw=
X-Google-Smtp-Source: ABdhPJxAWS+V4Z64C7BNpvre3r2BZUZSDGtc1gBxZURLmeFDis4gTqG4CtY8pcLtxu6WEo5fStHMSQ==
X-Received: by 2002:ac2:4316:: with SMTP id l22mr1917436lfh.625.1621599138601;
        Fri, 21 May 2021 05:12:18 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from localhost.localdomain (m90-129-203-26.cust.tele2.se. [90.129.203.26])
        by smtp.gmail.com with ESMTPSA id d16sm605013lfm.202.2021.05.21.05.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 05:12:18 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V2 0/1] RESEND
Date: Fri, 21 May 2021 14:12:13 +0200
Message-Id: <20210521121214.195955-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

Fixed a condition check issue

Ming Liu (1):
  kernel-fitimage.bbclass: fix a wrong conditional check

 meta/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.29.0

