Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE2DC282C5
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 20:32:15 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.4273.1740774730085644685
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 12:32:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UFpwbuER;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: danismostlikely@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-855a7e3be0eso75528039f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 12:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740774729; x=1741379529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XUEw3joJYDHVdXmYXkMoE/aSYS3Bs4Lue8t33v9OVQY=;
        b=UFpwbuERrvpqVElwlGVDj8bFnPOQOk7ZPLbIGjq+QZozG08muoDrZGm59fEOU2x7+J
         YUx/9PyjstkDMwuJ8pcTR49eF6cUAUJxnbRWKEK+jsLFM8zFTUFfF5hcL8uUR2/b9MwK
         aPSPF7ybhRbaBX75o4Lh1kT0BxVN+BZvmKXYgx8ueHRfFk3zP4vAi6dhucY8g7XNO2ed
         pSPYgj9TEyOCYEK029b5twVwaj6xL/msh0mdoxrXZe92l3PwD1Y3HzohKgBDDEHx2RB7
         s+oJl+FxlJY0ouaRZ8TEgmNg4ClPSqLBTqEQplI9i94t/Z+G/INawYNExQXF/eM19lhi
         y20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740774729; x=1741379529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XUEw3joJYDHVdXmYXkMoE/aSYS3Bs4Lue8t33v9OVQY=;
        b=DunkSDRbyMIRGngBQf8V0bPSV7IRGhXv/WhIRVPzNP4lyIe7p+mgIX8MKRBCn6CVrl
         y2q8NOtn0MlemM6G9PUZzoWuogsZs7MH8OVipFjbkfMADCYjTfHKjrp4ZxAEcu6og4ZY
         IKxAy/Y9pbDid0NAy5jTCdNMFx/VZqovSVfbzaEfp8cdtYXDITBGGrt9H0LBhpFYJQCJ
         CDPC22qJLbfhyvBs+wNNADagYbKJg1t6igXB8Fd2LzPskBgoFfm0W9KTKQPQi/8/WwnM
         yEXpqkXAZ/5YsrgX86iL8qQlobpt7RJ78QWUpT2ggCvhzUTdYuca0nHhQskHB3QFzsGy
         De6w==
X-Gm-Message-State: AOJu0Ywoj7i0T1kNBf+fDiuhuddffxR8UKOL0Iq9q0nPtDDg/ok8kRL9
	dey/p8Zlj6oVUgpW4kM6y6mS0ASxfxQw6D2C7TBS7lVA5HEWtLhEhQEK+g==
X-Gm-Gg: ASbGncsSWkj3V/Wrh1hTqGA4GPyBX0QMiqf338JGPPUeTdOO5lIzjyyQbl+CwOYbDqp
	GbfvChAitu5DVPurEQuWiTndqodq8tEraS0cdgDx1uHFEiR2JvlP7QbxGSuYEVRU6BmPs8t5Fy3
	zg2uexH13Zu1nTr0v9tHCehOIvfam3WlnvFFsKOf5U4UKLegKN4OIHUKxuc6+VSTHl+IiP7e2uy
	pWYGJYRHC8uAx4mvLCDWiqqGN9HeadslTaxlOq3g7W2KOE68FYx4vq+Wx1QznU0g8QkkL3+R1Ue
	AHNgoC9WYlIMuZJcn3plcyO1cQkZZHw3UqMdtmDT5qr6TpQvY3wTd+tXUw==
X-Google-Smtp-Source: AGHT+IHn0wsK9myqqqmQFKAinRp5VaCb8HTM5/pwD9JVlf98k8GHojotvkaETTHM5vhjYHYdu5pjnw==
X-Received: by 2002:a05:6e02:b42:b0:3d1:a34b:4d01 with SMTP id e9e14a558f8ab-3d3e6e746b2mr50861505ab.8.1740774728846;
        Fri, 28 Feb 2025 12:32:08 -0800 (PST)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f061c718d6sm1049005173.65.2025.02.28.12.32.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 12:32:07 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glibc-locale: share source date epoch with glibc
Date: Fri, 28 Feb 2025 14:32:04 -0600
Message-ID: <20250228203206.1979714-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 20:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212076

From: Dan McGregor <dan.mcgregor@usask.ca>

Similar to [1], stash glibc's source date epoch file to be used by
the locale generation. This isn't used within the recipe itself,
but it does change the timestamps of the generated files to be
consistent with the main glibc packages. It also changes the
metadata in the resulting RPM to show the same build time as
glibc.

[1]: https://git.openembedded.org/openembedded-core/commit/?id=b996293b4c8ab7ff3ed852045d17290df29205df

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-core/glibc/glibc-collateral.inc | 14 ++++++++++++++
 meta/recipes-core/glibc/glibc-package.inc    |  5 +++++
 2 files changed, 19 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc-collateral.inc b/meta/recipes-core/glibc/glibc-collateral.inc
index 4f81f07da77..905e9338af4 100644
--- a/meta/recipes-core/glibc/glibc-collateral.inc
+++ b/meta/recipes-core/glibc/glibc-collateral.inc
@@ -10,3 +10,17 @@ do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 
 do_install[depends] += "virtual/${MLPREFIX}libc:do_stash_locale"
+
+do_deploy_source_date_epoch[depends] += "virtual/${MLPREFIX}libc:do_stash_locale"
+do_deploy_source_date_epoch () {
+    mkdir -p ${SDE_DEPLOYDIR} ${SDE_DIR}
+    if [ -e "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale/__source_date_epoch.txt" ]; then
+        echo "Deploying SDE from glibc stash -> ${SDE_DEPLOYDIR}."
+        cp -p ${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale/__source_date_epoch.txt \
+            ${SDE_DEPLOYDIR}/__source_date_epoch.txt
+        cp -p ${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale/__source_date_epoch.txt \
+            ${SDE_FILE}
+    else
+        echo "SDE_FILE not found!"
+    fi
+}
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 21f2200d19b..a6aee043453 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -215,6 +215,10 @@ do_stash_locale () {
 			cp ${D}${bindir}/$i $target/
 		fi
 	done
+
+	# Stash the source date epoch file so RPMs have the
+	# same build time.
+	cp -a "${SDE_FILE}" $dest/__source_date_epoch.txt
 }
 
 addtask do_stash_locale after do_install before do_populate_sysroot do_package
@@ -238,6 +242,7 @@ stash_locale_cleanup () {
 	for i in ${bashscripts}; do
 		rm -f $cleanupdir${bindir}/$i
 	done
+	rm -f $cleanupdir/__source_date_epoch.txt
 	rm -f $cleanupdir${bindir}/localedef
 	rm -rf $cleanupdir${datadir}/i18n
 	rm -rf $cleanupdir${libdir}/gconv
-- 
2.47.0


