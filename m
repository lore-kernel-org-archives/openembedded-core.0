Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5832.1793254171026400790
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 23:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Ub54OkWZ;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-369f33df08eso3311667eec.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 23:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793254170; x=1793858970; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9xtQCataNJ8xD6PWfok55BlOm6cRbRFB70XorJG9tMs=;
        b=Ub54OkWZ87fwo8jhb+i8WWN+e/Ljw7IPMizFaZqTb1mTDmKaH2CMdM1hcyHUXW3QjI
         0m9m28p1sRxbN1LHA20UrPkSIYqbjGYuGKyFhWbc0JgotYd7HvQkVi5BoNVkT74nyFjH
         21lWNtGEWpsEjAqBKl+yqn7RVRPLWrV9z0xkkwAQ9ZilS0a1ylegGPn5srW3y3PFLYa9
         AtUMDzXWLhj1jz0YE29hprf5lQwYQ8LkubOlpuAW9+cdCOsX7dPwhYcq/UKnsoAnSZGh
         jxkaR/qY9c2wFNxyyy0IepTdyeitcfzShcEyiBjEh/kbr6sIyiHSHz1zvBc+z9vt8vEe
         vDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793254170; x=1793858970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9xtQCataNJ8xD6PWfok55BlOm6cRbRFB70XorJG9tMs=;
        b=US5VpIxDCJmPTI8wJFbDPCmADiqcIXnRSj5SGJ0xQhofK9H/g4l6P/KtX18611dJQZ
         R1Cc95WJnpEKKZHZxEt/MQQBIgCACptLhVLa+C7l+mwHejQD+wIVwYsdmSNzZgQHu1cV
         hD11MfTYZm/BE+nBgfHk2xOqwm75oa5xPZQr5SKC8cSFzlYTCzOEwd/wtP1NmIAZI+6r
         cwXdrviTyBJDcsykeA3PbCmPI9Pt/LConUqYpsv5oLzOix5WjW0lIsvK8bv0ehkqTl0e
         +XYfLwLkCmx87ymroTq0CWSxBQb8rf94VpfL59XSK7Qz+TLtL4ji8CNKwqjFmN60Bnsh
         VHzg==
X-Gm-Message-State: AFq9FYJ8XEO9ohfAbEVoVrDhZsCIgczT+6vNyKJtlfvD6hnXDPQ1IHIh
	tScHfg6G7sbAoi6cunwgEI3lqlkfia8dyqauxTNeZ6xuwhCiHmmeKMhw0EOW3atN
X-Gm-Gg: AYBFou1XcomYZM52hRTVFTlqCFWw+KjuUbuR94su8AXlW6nliLJUJ59rJMacmB1KIhd
	77M8N8lHN07+RCKmDQRV921zWo99zPmxk2qI/JcAMOHGra1G1MNXSwuuLVMAefZqCcyZM9Qllne
	FxmzQbWB0XQNNFG5DjAA3YvIK4XYfKvN2JJMjgoEjcI8XcUrJGt8NUDB2E6EHC/HKiJH3Xwxk6Q
	ZSlQwadGqeWr84NeyGZuSxEPH5SEbWRs8d4TB3AZ8uZl7T4/grhWJO15euGT71sLwujZEtG45Ip
	+6d7yu0J96Nsvnz572A3RyZkJTzDrRvDMracp8K2iSj1cZ+n+UMULn/vInhx7oA8C51UFnw0ScQ
	YN8B8xz904rWu52QAyBTHqO7kmA54wr2hXD4LtJI5PsHoBw37N8kUSPzjKlZe+noktRyTQODroc
	qbSFvf9qhbM5hwZkcDnJjhr6MQGq+uNIhxnzCa7rFDaioogKZuZhW1WsancVio0wDwlICVdOhm/
	lMf38dvBtudIgXbvXZ8wQP2Peq5PgFdqzbpZxLYw0UHxfRdR49vN2KSsAyATIsDGzcKJbYg49LJ
	BGub2Yo2lASA8WPnExT57O7ybIprjnG5cG9Ia5Ga0Twl8a+DBsuEpP5mAOLtf/KRgwfMTOQ6haI
	JFwaWQXjh0g==
X-Received: by 2002:a05:7022:ed0a:b0:144:eb46:be0 with SMTP id a92af1059eb24-1a6ced912f1mr6292946c88.13.1793254170143;
        Wed, 28 Oct 2026 23:09:30 -0700 (PDT)
Return-Path: <ragaprasanth@gmail.com>
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75c814aa1sm20662912c88.7.2026.10.28.23.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:09:29 -0700 (PDT)
From: Prasanth R <ragaprasanth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	Prasanth R <ragaprasanth@gmail.com>
Subject: [PATCH] kernel-grub.bbclass: use KERNEL_PACKAGE_NAME for the image packages
Date: Thu, 29 Oct 2026 15:09:13 +0900
Message-Id: <20261029060913.1586484-1-ragaprasanth@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 06:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248900
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

