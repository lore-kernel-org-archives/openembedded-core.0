Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.10080.1620227974329132825
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IjtG7qFO;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id c22so2495825edn.7
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IYYg6W5pCHGmwad/Gmjion+4Vy1FpdcrE8URSeuwMNo=;
        b=IjtG7qFOr751fIXDjiz8C2b/4biue90WEdx8dqS1gj1lFCy7VCDLQO3O/xH8Y33xhU
         1n+BBG2hQhOK+C10fnMmm5YzEBbbn2k/l+wyqB5ELZVp+HFkmwDilhMyg5Xe0PcT6/0S
         P+GOzANUJrF8t7d6gpHEKuEdIDTs1nYzwY/kG9wRuc2RSsSiVA920bywRTj1aWIAGfHV
         iIxCbrv2LoGZUCSnjb5LbbH70Ww12uJnDCjb95C2W36U6NR+cWExdhm7l8tnLYkNhFhf
         ap98Jc4dk0MZpHGgD69dXg+ItFuXPlphLDLTyvEITN0r5+oJKx3KRRhyt9H8avSc8J4p
         Q/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IYYg6W5pCHGmwad/Gmjion+4Vy1FpdcrE8URSeuwMNo=;
        b=GggwMJjWLD2SPwWOfTB7tlUrcFM0BMrrCSJL8B7miNx5CgkGGIOQZ0CwdyMuGgkJgj
         L0ikL+Dwyfn/hIB2GcCIEE7Eljby8UaqYuaQOLK+pCEtU0Vb0lk0/8SN+rbfa9DJhEME
         cImnzZm4344yUVyxX7HlyUt1QMpWdXszo/O6m5FOKFEB43ddLIvRSA42P0xKEEMiGooF
         0DlusFg5YoVELzzavr05omXKeCSj95/oW4AAj8toEJSIZLRUCx6FCKAbrJFzlY+nwvlw
         WYBV+Pz0gkh0nxz2aNAK/6KRd26R8FS8I2ggVbPuRy/+hCfMWucXVve7kcMjoBrM821j
         KZlA==
X-Gm-Message-State: AOAM531c7Yz65UTbfz/bpjEwYpSD/Yd00AEa0+rO8M6ciUnqpV4Jhgo8
	o3DcW/5sLOBJh8p2uOSaoJlby5cPCNnieg==
X-Google-Smtp-Source: ABdhPJyqx0uYH2SrQ4oq6parJ0cKhK4GctR+nC4nBnHQW62KbbbeNVppPbkIUMA1eDnP7oGtK5iB9g==
X-Received: by 2002:a05:6402:268f:: with SMTP id w15mr24047301edd.321.1620227972989;
        Wed, 05 May 2021 08:19:32 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:32 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 47/61] python3-importlib-metadata: upgrade 3.4.0 -> 3.10.1
Date: Wed,  5 May 2021 17:18:36 +0200
Message-Id: <20210505151850.660512-47-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...b-metadata_3.4.0.bb => python3-importlib-metadata_3.10.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_3.4.0.bb => python3-importlib-metadata_3.10.1.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_3.4.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_3.10.1.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_3.4.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_3.10.1.bb
index 81f24e55c2..af46a8ccc9 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_3.4.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_3.10.1.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "fa5daa4477a7414ae34e95942e4dd07f62adf589143c875c133c1e53c4eff38d"
+SRC_URI[sha256sum] = "c9356b657de65c53744046fa8f7358afe0714a1af7d570c00c3835c2d724a7c1"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.31.1

