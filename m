Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web09.12365.1624892827308041139
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 08:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=k+hvyaxF;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.46, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f46.google.com with SMTP id bc18-20020a0568201692b029024c6dbc2073so1751370oob.8
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 08:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/sUbIuVLS2PJQ4HM1nofDHatgL/eFEBFCDwYE+YCoso=;
        b=k+hvyaxFModVh//etR3fdN189Lvt2GSOyURFmEbsnfktnq1fz9HtMD82xvR6DkjaAk
         lSBQ2MSnLwbexVlN3UnjFMoPra7t8SkeamBLze0fDf8G00sGWLcnDZgDUhuOWhoY9ZUa
         xyAixlynxxDRmKUtY+U9WzQlv5d50jy57zJ06rkNTE2TQm6Y5weNLnI7dMKsb682DSMH
         OXJLbuhsXmcqtt9C8lB9FYorhmC/W5sjEig77/7pdeh0sQNj7wfak1GCUVTaPgz6uS4v
         VwhA2qBMuM81VtOyT4gOPR8oFaWJhrYB8rJXOl5lsej1hlaxFDqAZy/cxpwNIE9HQtaD
         6cng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/sUbIuVLS2PJQ4HM1nofDHatgL/eFEBFCDwYE+YCoso=;
        b=tGrDwGjZyQf5UNao8JcfonUPvcow2x20o9mY4RV4sCBEih5jh+kQeWIj174sBq6vOj
         ToQZMJDobJCWzpKfmAtUIrRvt43qO/i7s5BfqyUcoN+6P0GE6rqOP6V+HrlAlyHeh4iy
         oh2Hdqu0CW4zRpx9JRLkoqRcNO4nbrRsqForqcRdR68gZ1ux38AMVcMJWVLXmyjUNIyr
         +43YE2+Y5q8wSSgWChuMsbosGuWQQiUtYtLU5j+CH6GG9alSAqgVSw+mJX0TnCpwsbqk
         3XInpFccZD0L+VsFNx7fKzwdO1FUdh1j58jc4Av8vy3bbM5/R/dr+t9l5xsalMD5arCw
         YmrA==
X-Gm-Message-State: AOAM5314ZRVMnLsyXGNVeNnRsYdOOj/tW7TdbUyfGx0az64s0CGl3l+a
	f6zaSF9pfVlIZU4gDvqiKPCmaVKJrcESkrLgXqA=
X-Google-Smtp-Source: ABdhPJw9Q6ns6PmnK1J6j6TtEcs0XID6Hz7TlGMgjcueG7W2trmtP9G4LHNoVqAXDsnkJ4kqFHMOMw==
X-Received: by 2002:a4a:dc09:: with SMTP id p9mr19739944oov.27.1624892825955;
        Mon, 28 Jun 2021 08:07:05 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id c21sm2095892otp.8.2021.06.28.08.07.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 08:07:05 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/14] python3-ptest: add newly discovered missing rdeps
Date: Mon, 28 Jun 2021 05:05:31 -1000
Message-Id: <9423ad8f0f42d249c2fcb1b86ec9abb75854f011.1624892565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1624892565.git.steve@sakoman.com>
References: <cover.1624892565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@intel.com>

Making ptest images based on core-image-minimal uncovered quite a
few missing depenendcies from various recipes, here they are.

(From OE-Core rev: 2cda6242f2f0f6f9c6bdef72bbb271eab7e5e1f5)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Backport to Python 3.8.10 (only python3 portion of patch)
Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3_3.8.10.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.8.10.bb b/meta/recipes-devtools/python/python3_3.8.10.bb
index 91fbc672a1..ae32ccc40e 100644
--- a/meta/recipes-devtools/python/python3_3.8.10.bb
+++ b/meta/recipes-devtools/python/python3_3.8.10.bb
@@ -331,6 +331,7 @@ PACKAGES =+ "libpython3 libpython3-staticdev"
 FILES_libpython3 = "${libdir}/libpython*.so.*"
 FILES_libpython3-staticdev += "${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}-*/libpython${PYTHON_MAJMIN}.a"
 INSANE_SKIP_${PN}-dev += "dev-elf"
+INSANE_SKIP_${PN}-ptest += "dev-deps"
 
 # catch all the rest (unsorted)
 PACKAGES += "${PN}-misc"
@@ -346,7 +347,7 @@ FILES_${PN}-man = "${datadir}/man"
 # See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
 RDEPENDS_libpython3_append_libc-glibc = " libgcc"
 RDEPENDS_${PN}-ctypes_append_libc-glibc = " ${MLPREFIX}ldconfig"
-RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils sed"
+RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev unzip bzip2 libgcc tzdata-europe coreutils sed"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
 RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
 RDEPENDS_${PN}-dev = ""
-- 
2.25.1

