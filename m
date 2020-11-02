Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.1208.1604335778340481311
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ChaQIFN2;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id e18so3870240edy.6
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dGkvsT2tfbWwvjWKkLS9YxqHAwB01KDRFq+kh2WoISo=;
        b=ChaQIFN2t+9vz1EnFj/4PedeatHtMRzEgveUBGQR3rV5F8N3OcXUALAzqiyp6iXuxX
         hnD4jS4p+HrmRMwEfZ9GxS31HWDY5P1+nl4Sdq+5ifbgUeuV1GdOgAh5JMuRZQj3qVf6
         jhMlvd8RN3e6zTHVSYLW3UEIRtZ+oxveTPdXNpiBBe7FrY+iD9tTr2D3ZT5n11xONdHL
         PUPMSZCR3+Y3fFSM/V0hswAKHFVfsgj6o2Q7wZ50kPIKX+V+0H63B2NXRcP/VkdaQwoR
         4iYBE00wrGSeJHYGiOFA1vrpSI1T0UWpaLrm93rIH2jjlnHNckcGdapRytc6npj0MY0B
         iTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dGkvsT2tfbWwvjWKkLS9YxqHAwB01KDRFq+kh2WoISo=;
        b=A+cxAtyZo4bGa6Ry5ZicPlKV834dcXkPHsZOATzNw/sqgXtWkw7lu3BbZ0jOZoAekg
         H4sTgfr8tSkO437eVyOQTRd93kueMgw6/8PBCrUGLo1v6HLSGgavaZFv3akBIGtzZ5UJ
         71q7SiuIznhNuvEKr2OTItVeXG2RKAail0KcRYEdQVuW8Ro/3W+h9gOYlKmsaq0Y5iul
         bqU+scBMMZADykMuqrp7CrQZxrJsVSO1LeZyHVmDtPUoUS4WJBZkx7UHW3Eg+p16vQpO
         1nISk8J5iJp0V0wWb4Pft82wjO254eBbrhMJv8rJq/rrqHMh06TCnyridgJxaOxOocN0
         KYuA==
X-Gm-Message-State: AOAM532uM5BucfKfBbOaD0ACRDpnF7TLqElbsdbYd6ZXkgzghp+b739u
	s7+ycrQTJNUh79TEbpATa73gFgjefYfQOQ==
X-Google-Smtp-Source: ABdhPJwYWcpKG3NExhlKZjt44jBE82FoR9I8LOd72C3kUJ6ay7PzoUUxAG2QgY9GAXmZisK+gZghsw==
X-Received: by 2002:a50:8245:: with SMTP id 63mr17651930edf.133.1604335776754;
        Mon, 02 Nov 2020 08:49:36 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:36 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 22/80] expat: upgrade 2.2.9 -> 2.2.10
Date: Mon,  2 Nov 2020 17:48:09 +0100
Message-Id: <20201102164907.27572-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: copyright years
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/expat/{expat_2.2.9.bb => expat_2.2.10.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-core/expat/{expat_2.2.9.bb => expat_2.2.10.bb} (77%)

diff --git a/meta/recipes-core/expat/expat_2.2.9.bb b/meta/recipes-core/expat/expat_2.2.10.bb
similarity index 77%
rename from meta/recipes-core/expat/expat_2.2.9.bb
rename to meta/recipes-core/expat/expat_2.2.10.bb
index f477f99baf..fa263775b3 100644
--- a/meta/recipes-core/expat/expat_2.2.9.bb
+++ b/meta/recipes-core/expat/expat_2.2.10.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://expat.sourceforge.net/"
 SECTION = "libs"
 LICENSE = "MIT"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=5b8620d98e49772d95fc1d291c26aa79"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9e2ce3b3c4c0f2670883a23bbd7c37a9"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
            file://libtool-tag.patch \
@@ -12,8 +12,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
 	   file://0001-Add-output-of-tests-result.patch \
 	  "
 
-SRC_URI[md5sum] = "875a2c2ff3e8eb9e5a5cd62db2033ab5"
-SRC_URI[sha256sum] = "f1063084dc4302a427dabcca499c8312b3a32a29b7d2506653ecc8f950a9a237"
+SRC_URI[sha256sum] = "b2c160f1b60e92da69de8e12333096aeb0c3bf692d41c60794de278af72135a5"
 
 EXTRA_OECMAKE_class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.29.0

