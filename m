Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0040CCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 08:40:08 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.10965.1760690406659901589
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 01:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WpHidSdj;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b3d80891c6cso496709066b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 01:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760690405; x=1761295205; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wYWJ3+HfpN3N+SyWxUfQr3I7SlVwUYaRUooB2IqfQY0=;
        b=WpHidSdjuwRCBL6CXQPVfOF3921qCyOIvALF83VLnFIZyrZHhAFgCRTBXi3XAOaTXQ
         1V8PARYZUXoe9uFKWmQiO3xECwCUFwZT/gNPUw11e9VgRjwNQfs/dth0gKHjr6A/PZ5u
         +uNlgUhn1h/8TmJDjIpfQilmCQvoWLG2kQ2ZfCPKHon4DQoA7sddldQsMQkNxofn/x6U
         rpur4PMnHpvFKEYhypHa5b0jgbqLmcxnlBFkXPznaAxi6TIwgCjhSzvTJdcVcZ8r8yPu
         IRgVB5VLyepGgrnjBI7/uN9xinZl1I+zoQV/RbIesL8ud1mlP9f5CTSuCxA0kdGzCpqP
         bsuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760690405; x=1761295205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wYWJ3+HfpN3N+SyWxUfQr3I7SlVwUYaRUooB2IqfQY0=;
        b=DOFR3NdJGkC2n9mI8hqZTwA4tc/MhT6LgxRMdy8RXBSADkjl48TCd7BgCNVc6ATmly
         54JJzExNo6S+4fpjwJMyatfTWtiVtPfAU/NDG9Cax/6El0zIdtn0qZMpWgNTZLQhkbfl
         K6eZ4ESTblifWbLPPVbDvgwzHHz4oXNpU8PbycE006CNSl+lnzu3DOQlAS97L3i/lYn3
         Z7oOeSf8Jdk+pi7AaWhb8pnWaqmmZwlKpRmBFw6kNBMjPTifwdmzpuVO2xOXldygSPVh
         LkSgjRz2oD4w/Hukq4VM6U/zUqAukYC1DNQZluhifDwyefBeKaSh5gFYIejraf8eGZmz
         KyEQ==
X-Gm-Message-State: AOJu0YynD3wtbqfuVRzRFoY8jYY9tKjzzz91pwbwCCKzjykaZL8wnoYq
	vAKc/hSM24ktuinjENXfe0i4/hiS6SeMDN/Do3Lh95uEw2RaZy787Hcwi8Dd3TXW
X-Gm-Gg: ASbGnctJuihnaTyeYY8NVzgphAOVI8uRpGNyyhbaVBS288pMJelQy6+9/yZEZe7foL/
	VYel5CnajxRBPUkkyfkqjaSgUeUOSdyJ4Vl/4HlqMbugO1HOMF73Kmvtnn5wNnUPEo4N3GJMRiq
	CFFHimJi+rVJ5JA7IPvY0IB7PQwaz47WdlSvQZljc8vM2oM9qecZkJ9tc2DXI+f95GH5n8HO7v9
	Q+XhXi1Ca3X+ZmFUsw4h95jedWq3hhvmq3mdn6gyOf8/ZfGU5Q1bd+XF0g/ZjX7/DEdb2JDVL4R
	DX8AuzWg2KvGr71FA+W6g64CK3H26Loh1e2O5Yz9MDm3k84BD3dz3uEvhgC1kOQmXLRVFU+jL0a
	erScFk1Plw7BFd+fCj2qYtadUv+gimQvL/CV/0LvAj8/hlo9EaGjPFWdV9xW79ZQ4SgnEbx0Dbm
	tBv81sVfKKI5ZCQ7SwDxoD2A==
X-Google-Smtp-Source: AGHT+IF3Rza8T27huos39S2odFzCcJMK4L/perHtT2rEa6JIKl68m6z1QPiHzVkk5KZPBuPStvpdiQ==
X-Received: by 2002:a17:907:c718:b0:b53:f93f:bf59 with SMTP id a640c23a62f3a-b60552bdca5mr780630166b.29.1760690404521;
        Fri, 17 Oct 2025 01:40:04 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cb9b5f552sm759478766b.20.2025.10.17.01.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 01:40:04 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Ryan Eatmon <reatmon@ti.com>,
	Ross Burton <ross.burton@arm.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] linux-firmware: Fix removing unlicensed firmware if compression is used
Date: Fri, 17 Oct 2025 10:40:01 +0200
Message-ID: <20251017084001.797642-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 08:40:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225001

If FIRMWARE_COMPRESSION is set, the newly added code to remove
unlicensed firmware fails with:

| Remove unlicensed firmware: acenic/tg1.bin
| rm: cannot remove '.../work/all-oe-linux/linux-firmware/20250917/image/usr/lib/firmware/acenic/tg1.bin': No such file or directory

This is because the code does not consider that the file may be
compressed.

Fix it by factoring out the code to construct the compressed file
name suffix from do_install:append() into a python function and
also use it for the actual file names listed in REMOVE_UNLICENSED.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../linux-firmware/linux-firmware_20251011.bb    | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20251011.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20251011.bb
index a9e8935f93..bb40c68670 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20251011.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20251011.bb
@@ -472,6 +472,14 @@ def fw_compr_suffix(d):
         compr = 'zst'
     return '-' + compr
 
+def fw_compr_file_suffix(d):
+    compr = d.getVar('FIRMWARE_COMPRESSION')
+    if compr == '':
+        return ''
+    if compr == 'zstd':
+        compr = 'zst'
+    return '.' + compr
+
 do_compile() {
 	:
 }
@@ -489,7 +497,7 @@ do_install() {
         # Remove all unlicensed firmware
         for file in ${REMOVE_UNLICENSED}; do
                 echo "Remove unlicensed firmware: $file"
-                rm ${D}${nonarch_base_libdir}/firmware/$file
+                rm ${D}${nonarch_base_libdir}/firmware/$file${@fw_compr_file_suffix(d)}
                 path_to_file=$(dirname $file)
                 while [ "${path_to_file}" != "." ]; do
                         num_files=$(ls -A1 ${D}${nonarch_base_libdir}/firmware/$path_to_file | wc -l)
@@ -1386,11 +1394,7 @@ FILES:${PN}-sd8897 = " \
 do_install:append() {
     # The kernel 5.6.x driver still uses the old name, provide a symlink for
     # older kernels
-    COMPR=$(echo ${@fw_compr_suffix(d)} | tr -d '-')
-    if [ -n "$COMPR" ]; then
-        COMPR=".$COMPR"
-    fi
-    ln -fs sdsd8997_combo_v4.bin$COMPR ${D}${nonarch_base_libdir}/firmware/mrvl/sd8997_uapsta.bin$COMPR
+    ln -fs sdsd8997_combo_v4.bin${@fw_compr_file_suffix(d)} ${D}${nonarch_base_libdir}/firmware/mrvl/sd8997_uapsta.bin${@fw_compr_file_suffix(d)}
 }
 FILES:${PN}-sd8997 = " \
   ${nonarch_base_libdir}/firmware/mrvl/sd8997_uapsta.bin* \
-- 
2.51.0


