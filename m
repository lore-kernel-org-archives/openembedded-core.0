Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web09.29012.1606537487943230304
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2020 20:24:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OE9XsPhC;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id k11so5799514pgq.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 20:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vkniehZJlI+sbtB0iX/rUNguxxvYyumU77CmB+n5g1A=;
        b=OE9XsPhC3C4rDicDUNC8GKicfbBRkXXcoRCbndgsGtjNfNP1bV19R2+w6oEXA/5AqK
         CeUf7CLiU/KdNWk4XZAb5EkOj8qWH16tsGLqLbNowo4qC1LVF28+aw4skwDFvX2RePMP
         jwS5/ma24a86SJIaFAwVmUeA/3Ck4u/Ea2oyVBx3h7L9cO2rE1aCJtrcP4QENZjmsKrz
         3bRqa+yXe6LKqls7WT1xekpBVqs5pnSPNOdlFfQksRb2nCvRDkyhLUdCCsp6+n1eYzsY
         +3t8TR2vjCRtqnGWROR79KYX+irWD6Njw2q2wXi3SMulffTzbCNoknJ2ketkkE6s8Uww
         L/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vkniehZJlI+sbtB0iX/rUNguxxvYyumU77CmB+n5g1A=;
        b=nSR/HlVaXBCK3ZT/sBI/mPVHA1UDogzbLXdJOy7MdF/X/cxwJ4Ew6aGlN1rNC87ciH
         2963Kqh6L+TGI/Ewc4NFP2wGcph2VNOgvpwMobgU0cR9aFsQJAkMXaJVr32Akcy+44fA
         kwhJCu0SxJ3O78nFtxarVGdvhP6PXrymrhuC8bC1w7vOCLE2L9mXXp/WW0BtNrrOgtV+
         3kf/yxfnG/cG/FBRT27wktBGaiLOkoWwhAV/iGy5JCI0Rx5N4O5EGlm7YGy7IuxGiVAn
         6b6+lxvmbtmZonFGHNGAeCLE3QAA0azYpBaSf1k/ue9L47YsaYcSS1sSSJMPckaBozsx
         oK7w==
X-Gm-Message-State: AOAM531wGCDNYFU54uEch0LlmYrORAwCK7VpEPjxoDdrPjR9J7nJs6PT
	84zDnVSXr/j/TQ4Q/GoHl+bJpQro5DGulA==
X-Google-Smtp-Source: ABdhPJyxOGLGGGH6bB2xGTOTncTBtWq9X1RfAtkfTBfle7TTyy25JFQn1pXgVpEQmwLTC+SOD+Caqw==
X-Received: by 2002:a05:6a00:225c:b029:18b:d208:a366 with SMTP id i28-20020a056a00225cb029018bd208a366mr9882917pfu.5.1606537487364;
        Fri, 27 Nov 2020 20:24:47 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:74ec:3128:f635:34a1])
        by smtp.gmail.com with ESMTPSA id b5sm12625076pjg.28.2020.11.27.20.24.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 20:24:46 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/18] python3-attrs: move from meta-python
Date: Fri, 27 Nov 2020 20:24:15 -0800
Message-Id: <1deec77168c68eed0b07aae5da98598cced0d452.1606536874.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
References: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

Classes Without Boilerplate

* Part of the dependency chain for pytest

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../python/python3-attrs_20.3.0.bb            | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-attrs_20.3.0.bb

diff --git a/meta/recipes-devtools/python/python3-attrs_20.3.0.bb b/meta/recipes-devtools/python/python3-attrs_20.3.0.bb
new file mode 100644
index 00000000000..55cfda71809
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-attrs_20.3.0.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Classes Without Boilerplate"
+HOMEPAGE = "http://www.attrs.org/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff"
+
+SRC_URI[sha256sum] = "832aa3cde19744e49938b91fea06d69ecb9e649c93ba974535d08ad92164f700"
+SRC_URI[md5sum] = "4fe38f89297b2b446d83190fce189f29"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN}_class-target += " \
+    ${PYTHON_PN}-crypt \
+    ${PYTHON_PN}-ctypes \
+"
+RDEPENDS_${PN}_class-nativesdk += " \
+    ${PYTHON_PN}-crypt \
+    ${PYTHON_PN}-ctypes \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0

