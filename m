Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4032.1793242760874968805
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 19:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=I8QZzJC8;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ragaprasanth@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso4335a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 19:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793242760; x=1793847560; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9xtQCataNJ8xD6PWfok55BlOm6cRbRFB70XorJG9tMs=;
        b=I8QZzJC8Wf2lnbdJMokTmtYaJNYHuH6WlwyEUEPFoaFKJf+Z+FnGRUOTGh/rdd0tms
         ePu9pgHp1unVODROYxmX9rnVYaAC3bwfvlowYTk+51W2CWlGaiTQw2XrrJULe6HvTGNj
         iRERAAU1ByrpClvmJ59241BEzR9+DccSIm6/UbOZYQ+XkMy060Z1F4ogEtTNRfdBXg74
         x0M3ONs0mK1UdIVtqscjO6bMkTQ1MfQC6XlUZKe+SNz1gAyFDTMcGk5Pdsm92waiHH17
         DLun4Qry5P+F3feaTI3guecwW6iUqg6Rb00yuLcrHd9r2eD/Z2UOFTFVXVOMCgc5jWsI
         5etg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793242760; x=1793847560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9xtQCataNJ8xD6PWfok55BlOm6cRbRFB70XorJG9tMs=;
        b=CEp7i1P1A/2xkxsgS8I4vN73JhbYT5Dw/dFw0+cY0yknGy2PlPLCBpP/es53L8Jgjr
         TOC6HWQj7po4TMxLT+TPhe0hdgVhxv6KCKbiAQpygO5f8up6nfbML3Bul9sAHVpH9QH9
         06f9zODG/peWz8L2v8liZjryGZCY4cEMfMDqJPTVIdfi9ojsjmHr/FrdoeypgXpAw3sj
         r5sVmKntNrvAzLCFJB5lGKVLSQfOTyi4l8s3Cc4VVG1sKpsu58WA3kb5EOtuu5VLeSEu
         hxBq1BB4D//Vc5m8qTqfYKrLfNqWsvEC+IIcM92v3mLO3t6slotxZbrsAc1VjE9JRpjA
         tuhg==
X-Gm-Message-State: AFq9FYJvUlMYph0Df4MJfmUDRh056pVxXd0PhYtnYMiy+z1wZJv+BH3N
	g6hXtE0iHSVQd0JcETObRbNU9pu7Etd7XHyc+iRQOOSAmCG977krFLT9Zv9Q7Jjw
X-Gm-Gg: AYBFou2ZpxdWOBcC+CRrnU8JTheGru8uklj4d0rHlSutiuwCY7SLzd05llwarSrSSfB
	reKV9tGVQ9u6jTkNkOjOk/xfVs/Xs7eB03vDCgWOa64VGXJZeKX300xFPU7hbU5hFFjBH0gDBDz
	ayr/jdqYTdz804nn+z9bGMS3fY+y0ZDQ80Dhxn8jBsBEYa7HT12k5h4cbbT+ynRNMUg19zVtMNs
	3RA+Csuhn7oi3Uf+sNRTHfndbhoT2ZNY8dfZH/yopLW2wMd3d9Ovloa6zME4WpuEXU1wmBG3fWS
	jeICuyDnVIrX9X2gV/gpaHJF2puizx7QCN5iDN1c1yVwcKKocnyL7OKqEZSWfsPau5dKVn1Flys
	ApmSKYV4ssnOc2UN23F5pbgAwwRmWFoQcA5iecX0NVlEYpkuj0I3M4YnfssuIOxHLR+gPoQp7sC
	aQ8nSF6mxMxoR42OMSE6uBLWde+TNGWovFTkdEPbVu/cEHpVf5ywT5hZJEzx3nwmuRIkibxZqH8
	VB4qhPqmgMVrAdiohGQ4gf9v8BjbDPZtSXS7FIUZkHbQb7FdWo4r3mH301DJySilEq040pWVhzz
	+uGd0KVmwSc0IgIFdmFIE5aVmtVMJQ+R5qgeAs6/vbWMGPur6Zc+1dTfLejn/nAK
X-Received: by 2002:a17:90b:1805:b0:3ac:9176:e836 with SMTP id 98e67ed59e1d1-3ae57f9abf3mr2910474a91.21.1793242760017;
        Wed, 28 Oct 2026 19:59:20 -0700 (PDT)
Return-Path: <ragaprasanth@gmail.com>
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e84be81sm1959728a91.13.2026.10.28.19.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 19:59:19 -0700 (PDT)
From: "prasanth" <ragaprasanth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	Prasanth R <ragaprasanth@gmail.com>,
	Prasanth R <prasanth.r@lineo.co.jp>
Subject: [PATCH] kernel-grub.bbclass: use KERNEL_PACKAGE_NAME for the image packages
Date: Thu, 29 Oct 2026 11:59:10 +0900
Message-Id: <20261029025910.2113983-1-ragaprasanth@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 06:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248902
Content-Type: text/plain; charset="utf-8"

kernel-grub adds its scriptlets to kernel-image-<type>, but kernel.bbclass
names these packages ${KERNEL_PACKAGE_NAME}-image-<type>. With another
KERNEL_PACKAGE_NAME the scriptlets go to a package that does not exist,
so they never run and the GRUB menu is not updated on a kernel upgrade.

Use KERNEL_PACKAGE_NAME, as kernel.bbclass and linux-dummy.bbclass do.

AI-Generated: Uses Claude
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---

Notes:
    Checked with bitbake -e: with KERNEL_PACKAGE_NAME set, the GRUB
    scriptlets were set on kernel-image-<type>, which is not in PACKAGES. With this
    patch they are on <KERNEL_PACKAGE_NAME>-image-<type>; the default is unchanged.

 meta/classes-recipe/kernel-grub.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel-grub.bbclass b/meta/classes-recipe/kernel-grub.bbclass
index 2325e635e1..7c6abc5b4f 100644
--- a/meta/classes-recipe/kernel-grub.bbclass
+++ b/meta/classes-recipe/kernel-grub.bbclass
@@ -98,6 +98,7 @@ python __anonymous () {
 	fi
 '''
 
+    kname = d.getVar('KERNEL_PACKAGE_NAME') or "kernel"
     imagetypes = d.getVar('KERNEL_IMAGETYPES')
     imagetypes = re.sub(r'\.gz$', '', imagetypes)
 
@@ -105,7 +106,7 @@ python __anonymous () {
         typelower = type.lower()
         preinst_append = preinst.replace('KERNEL_IMAGETYPE', type)
         postinst_prepend = postinst.replace('KERNEL_IMAGETYPE', type)
-        d.setVar('pkg_preinst:kernel-image-' + typelower + ':append', preinst_append)
-        d.setVar('pkg_postinst:kernel-image-' + typelower + ':prepend', postinst_prepend)
+        d.setVar('pkg_preinst:%s-image-%s:append' % (kname, typelower), preinst_append)
+        d.setVar('pkg_postinst:%s-image-%s:prepend' % (kname, typelower), postinst_prepend)
 }
 
-- 
2.34.1

