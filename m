Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web12.9842.1620227975008096557
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KnY5W0/I;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id bf4so2476294edb.11
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nLbecUDPMbdpUJWQgIshutAU7akvHzOVLn+D4iKDj0c=;
        b=KnY5W0/IMIZK9alvof1PUf92yeh5rCo0txHHSSoejqTB+m2El7aI8hTmiCB56jsVtA
         pXbThxxlcblLVNnLaKLmIV/slfzpWw7OciGWqO+s2r0Mx8qrnV0h+xU4cPmBdGuBU6wJ
         /Q6bEiYpkUlrGVA3bPLMIQ8pN4DzMnPH5mtbVlcxCDuX5hpVU2GITyj6cYwvG/7HjV0P
         FlG2uDYAA8q3q6k6kb3CzGbvZcYOBCFZyZ7nuW3LQa53D5ZJ7FhC8y83O8cEm491AFCs
         M/C0u+/dLI5W7BmuWvwo7B3BCmQZp/PD9+E/WGe/s2zmhVeEKKH2f6be2035K3mtGSTg
         EvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nLbecUDPMbdpUJWQgIshutAU7akvHzOVLn+D4iKDj0c=;
        b=qpaai7jMkf+WjEsbwRysIsiOzJvV23nD8j52mC7o1RWuXQXMsW852tSpQWQjZYty0S
         xv3C0XVsiICb6VRZeUBzyQoC7YSkcukl0AiGXWlgXbjdBZ9un49xZ2aDOsYoPkpbeWi7
         ZOg1470uXkpZRGstJtePzMCU2BtXSKMoojgVAxlHUucLl2KqLCuQNw+++Jf0mZNaYjum
         7IA1br0tEMby9ltISpeOwK7Cy2sOdS+bNYbvUZu1z9k2PpNY3Zi/WFsiyPqxvHdfmyDY
         4LS9xaog6gdHthgiLFsZ7Knqjv5BOuJMW6WxGCVwCzxz5mkN2alxF/v/jTm0WavAIqM9
         I8Bw==
X-Gm-Message-State: AOAM533APRkzwS/JRCjO+RN+S4lKbLJRwcwr5M+jmyKJmLXc71QREZ4l
	ksm4v0TXWyrO/AZ+6yRQAu1JkRPOMpe5EQ==
X-Google-Smtp-Source: ABdhPJzDyH6IwTZ7sPL2ulB9STPBXhqKV+VoHJ2qd9WgH9N0BwvvLsNd9JeelVSrG4+bQIPXzOJxjg==
X-Received: by 2002:aa7:da95:: with SMTP id q21mr29183819eds.255.1620227973657;
        Wed, 05 May 2021 08:19:33 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:33 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 48/61] python3-pytest: upgrade 6.2.2 -> 6.2.3
Date: Wed,  5 May 2021 17:18:37 +0200
Message-Id: <20210505151850.660512-48-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../python/{python3-pytest_6.2.2.bb => python3-pytest_6.2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_6.2.2.bb => python3-pytest_6.2.3.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pytest_6.2.2.bb b/meta/recipes-devtools/python/python3-pytest_6.2.3.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pytest_6.2.2.bb
rename to meta/recipes-devtools/python/python3-pytest_6.2.3.bb
index d221cbcd7f..7fb7baf188 100644
--- a/meta/recipes-devtools/python/python3-pytest_6.2.2.bb
+++ b/meta/recipes-devtools/python/python3-pytest_6.2.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
 
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch "
 
-SRC_URI[sha256sum] = "9d1edf9e7d0b84d72ea3dbcdfd22b35fb543a5e8f2a60092dd578936bf63d7f9"
+SRC_URI[sha256sum] = "671238a46e4df0f3498d1c3270e5deb9b32d25134c99b7d75370a68cfbe9b634"
 
 inherit update-alternatives pypi setuptools3
 
-- 
2.31.1

