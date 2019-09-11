Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47])
	by mail.openembedded.org (Postfix) with ESMTP id 229E07F2A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 09:30:15 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id c12so15884647lfh.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 02:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4SkxER/J7UGejTzVJV339JhcfBwyk1JdmeHmuvQ0DVA=;
	b=ZjGX7YC/7eC+lKCrdObIWp808qdDe2YjXxO4LrIuFDUKfVhim7D45ybg0wQdaId6J/
	ltVAebxgpwiO0Y6qMUvCGyR/FnBjTB7NEB1XsfgBN+rewREiKhInFl6g7t4gJIRQXkZ+
	jCjRqiAC53RTY36sL/+rdGj7UdfEzHtYdTj+UbJvzvKqjb2SG7RR5dMF6+K15XzuUOlS
	VwObj2eWgbMkMUxa2NIQb+g7vnIek45Z8seBB7enlG7ud5hG0xv+wlcoYCKn0SmXhseH
	42dubaPYqT6NLCRNyTuPI6qkOT2hhhmVtIIkc7M3fyYAuJxy772RJpE7Oug70ERs4ZPN
	RbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4SkxER/J7UGejTzVJV339JhcfBwyk1JdmeHmuvQ0DVA=;
	b=cRTuT4ZI7t0X5GaqUJdZpWxhwKoCHLd653RJBLWapuGDbWk2KavQjcZsBHsdQXm+Gy
	0KKfchLGsSgVSbs0m9Wj2GIBW0aKTNVWK4ouv8CPCL3M3HiOFmrzzdyn43QZ5yxd6xxk
	+QUTQezXzVd8pxWJu36jlnAjjQUkvYq4iTjUapeJCk2rHn8NE7reccXrIAECo/z+IUCb
	tNidvCZCGBSa752uQDkdlMVmb/g+mH815cmfMfDBKvtk1/mGrsabVr6nf8jl906WXtsp
	2egUwDIdhJbtqMAW5yu4LYtW8PVdwsYRfdhog8gn5Rr3ja925YARHyDsxGsrh6sR4olA
	fp0Q==
X-Gm-Message-State: APjAAAXUhYa55sicONRuutltHMBwYYm7cf6/S4uTKBougndRamIYbxLH
	vqPRNGUBLFV12Dcq19YwnxcoV2FH
X-Google-Smtp-Source: APXvYqwXPNKR7vuze2tkVxQUr8EfE8SFJFDwKYINS++69psTtRj6x0kLIGDjfdpdt+CmAonOuvJfTg==
X-Received: by 2002:ac2:5633:: with SMTP id b19mr23311956lff.103.1568194215088;
	Wed, 11 Sep 2019 02:30:15 -0700 (PDT)
Received: from localhost.localdomain ([94.25.229.24])
	by smtp.gmail.com with ESMTPSA id
	t1sm4509306lji.101.2019.09.11.02.30.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Sep 2019 02:30:14 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2019 12:30:01 +0300
Message-Id: <20190911093001.7849-9-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190911093001.7849-1-dbaryshkov@gmail.com>
References: <20190911093001.7849-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH 9/9] systemd-boot.bbclass: use efi_*_populate_common
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Sep 2019 09:30:15 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Use common code form uefi.bbclass to populate efi directories.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/classes/systemd-boot.bbclass | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/meta/classes/systemd-boot.bbclass b/meta/classes/systemd-boot.bbclass
index ad565414a142..6594a2331f7d 100644
--- a/meta/classes/systemd-boot.bbclass
+++ b/meta/classes/systemd-boot.bbclass
@@ -16,16 +16,12 @@ inherit uefi
 inherit fs-uuid
 
 efi_populate() {
-        DEST=$1
+        efi_populate_common "$1" systemd
 
-        install -d ${DEST}${EFIDIR}
         # systemd-boot requires these paths for configuration files
         # they are not customizable so no point in new vars
         install -d ${DEST}/loader
         install -d ${DEST}/loader/entries
-        install -m 0644 ${DEPLOY_DIR_IMAGE}/systemd-${EFI_BOOT_IMAGE} ${DEST}${EFIDIR}/${EFI_BOOT_IMAGE}
-        EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
-        printf 'fs0:%s\%s\n' "$EFIPATH" "${EFI_BOOT_IMAGE}" >${DEST}/startup.nsh
         install -m 0644 ${SYSTEMD_BOOT_CFG} ${DEST}/loader/loader.conf
         for i in ${SYSTEMD_BOOT_ENTRIES}; do
             install -m 0644 ${i} ${DEST}/loader/entries
@@ -33,17 +29,9 @@ efi_populate() {
 }
 
 efi_iso_populate() {
-        iso_dir=$1
-        efi_populate $iso_dir
-        mkdir -p ${EFIIMGDIR}/${EFIDIR}
-        cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
+        efi_iso_populate_common "$1"
+
         cp -r $iso_dir/loader ${EFIIMGDIR}
-        cp $iso_dir/${KERNEL_IMAGETYPE} ${EFIIMGDIR}
-        EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
-        echo "fs0:${EFIPATH}\\${EFI_BOOT_IMAGE}" > ${EFIIMGDIR}/startup.nsh
-        if [ -f "$iso_dir/initrd" ] ; then
-            cp $iso_dir/initrd ${EFIIMGDIR}
-        fi
 }
 
 efi_hddimg_populate() {
-- 
2.23.0


