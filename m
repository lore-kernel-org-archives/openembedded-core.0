Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web09.4144.1619143886611376733
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 19:11:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=itSGLbmi;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id m11so33081015pfc.11
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 19:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fQ8gg3P4R71w6n7lZh/UxsD80OhanJ4Fjyn4v5Awl5s=;
        b=itSGLbmi9+sUYyNr/ffjwF0WYgNXfGn1rgVPz+1NDKrEIImK0dtfcXBt/C27Xj8chj
         5Yv9CouG+QOJznLz6/eaf3dmb+TAJdxYFg5Ge/vpf0I+pnovCRBcxg4AHhLk9pTYMq8/
         Gssxugoq9yqyBKynpsarmISQIpdKrk7ug1WlAN9UaB5kaH1kkMbt4gicz14/shP8mVhx
         J4dknOF2zugttsb1eJDFL9WLT5WTA2xRn1Ktoj8OdjsKfEPzst0zESLwHIhvL+GbYT4l
         QCuy5NelxkMDX+GSKebP+aQMtin699YAFH80MMb0I/tZ8qz0tl2/QvyqcRcIUnB9Pi9Y
         yvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fQ8gg3P4R71w6n7lZh/UxsD80OhanJ4Fjyn4v5Awl5s=;
        b=cttMJioJF+vbm1PCIu2cLziH+6ii5b1pKHinvawMVaZllc+2vj5YRAY+BZk+ucq232
         JqleBwLvLp+qc+TJiPaITYyy4d+ilRdWfK4OzabmJsVmI7u+KBIBf5dCt+MVaf8lOW1O
         uP0lCxjJtFx0arsMsiQyU8Ava6AMDTGsHAYVq8V2+uRgL7muexYY4swvNx/iY54dwYW3
         n2vs3ZbtVbbGngw2OdhZyNBPdLOkwMjMFz1rkN9MqkvZ07TlkJ7OJmdJQxkXGyXse6uw
         Cv91pw+N6LajeMXP6vuK+1NKs2wj67zChozk04DeCeNHLEmdyo/Fa+UEVYpIYBBfrigQ
         jjRQ==
X-Gm-Message-State: AOAM532nGIjcvHpdSamyD643OFJe4YT6KAPMlkn2gH/a8vRBhxDvIvyN
	7q5YpZ3pv9AnaNBUqKombnP//Lds29e+Ig==
X-Google-Smtp-Source: ABdhPJw4RzkPE7PWPY+J0MP7pNf6obpa8/umVL43QymBhXj1SWFGlL0T+ObU7je1HxIB/Zh4NCbwSw==
X-Received: by 2002:aa7:814e:0:b029:20e:f3fa:2900 with SMTP id d14-20020aa7814e0000b029020ef3fa2900mr1742037pfn.62.1619143885909;
        Thu, 22 Apr 2021 19:11:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id w134sm3321771pfd.173.2021.04.22.19.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 19:11:25 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] python3-docutils: Upgrade to 0.17.1
Date: Thu, 22 Apr 2021 19:11:23 -0700
Message-Id: <20210423021123.3732767-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was in meta-python for a while so merge the changes here
and  upgrade, once applied, delete from meta-python

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Detect file rename

 ...docutils_0.16.bb => python3-docutils_0.17.1.bb} | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/python/{python3-docutils_0.16.bb => python3-docutils_0.17.1.bb} (25%)

diff --git a/meta/recipes-devtools/python/python3-docutils_0.16.bb b/meta/recipes-devtools/python/python3-docutils_0.17.1.bb
similarity index 25%
rename from meta/recipes-devtools/python/python3-docutils_0.16.bb
rename to meta/recipes-devtools/python/python3-docutils_0.17.1.bb
index 50547a1b0c..54a809847f 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.16.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.17.1.bb
@@ -1,17 +1,11 @@
-SUMMARY = "Text processing system for documentation"
+SUMMARY = "Docutils is a modular system for processing documentation into useful formats"
 HOMEPAGE = "http://docutils.sourceforge.net"
 SECTION = "devel/python"
 LICENSE = "PSF & BSD-2-Clause & GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7a4646907ab9083c826280b19e103106"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=836a1950177996968a49ff477a4a61c4"
 
-DEPENDS = "python3"
+SRC_URI[sha256sum] = "686577d2e4c32380bb50cbb22f575ed742d58168cee37e99117a854bcd88f125"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/docutils/docutils-${PV}.tar.gz"
-SRC_URI[md5sum] = "9ccb6f332e23360f964de72c8ea5f0ed"
-SRC_URI[sha256sum] = "7d4e999cca74a52611773a42912088078363a30912e8822f7a3d38043b767573"
-
-S = "${WORKDIR}/docutils-${PV}"
-
-inherit distutils3
+inherit pypi setuptools3
 
 BBCLASSEXTEND = "native"
-- 
2.31.1

