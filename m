Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 72D8E7CCA8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 06:57:12 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id f14so16615189wrg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 22:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=H+IyOP4e0JmlwqMUMdXCbMb0ggzewIUEs4+gEfNbQSI=;
	b=APxyAwQ/DgZORq9w/EzLo1oFCfLSVuptqqmJWSUkDLbU3lynsRdefobZnhhPNFCzSp
	y4kAPFdfILHYaD3GnrR5Ru+CPXt2MBIOiYmBaGqFAg95vGpE7AVyo7AIFnRkHe2oMdC4
	9fIQw18M9F2UfMAZCz5uSA5xrn65BILsnOB+Web/J8OIwp1UzKjCn+30vcPMCAB2fkGK
	ivepKnzNAuKygbyqwCf7gLYBWvDGQhyhD+xPAwQ4X6jxlSY1riNZ1wGHITdIKsIlrJ3p
	sbMihlxiBeAKWGwimyx2JxZVbRAI++KyKm516UNoUn4G65TOWAe9x4wHFsVburZJZNWR
	AWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=H+IyOP4e0JmlwqMUMdXCbMb0ggzewIUEs4+gEfNbQSI=;
	b=qQi6SBi3Oz1Je/bJ3JS0u/bBDnberrg7QECZOv1KdWCtzktwJnjOLqqKWaYVjqP4Jw
	w6BXdvzZhvKN3+NOT4VFnrd/3sufpIOj+rZS+neAv8GYrN7kN6tGGG/MFugDGP3bS7FW
	mZv0rvFrfqz7t0fdWhfFN8IYJtmRgtw/a4LjV8ZW8tdxxE2Aoeomkj9fHEFA1Jb9v/UZ
	brKl2IVNW1lxgGjiM79gFtEbMQpUWnQ7eCtX2F67abB5da12RBJX4KaopUGpTQQrAo7c
	An/79/i1MywaiO0JFjOhzYmiWFtU588mn/2r09hh9zMOsvbuTTX/Azz2s3+Nn7T7WL45
	1xug==
X-Gm-Message-State: APjAAAV487ZbsT577kke0H+0QVml8NH0CG7iBswn2nb6i0vjCvvKPM9J
	LbScE4ld4+T6PKZ8o3w9c6wjAyos
X-Google-Smtp-Source: APXvYqzr3DxraG61FdYV5ibw+JOrcNNGNlI3I5Lruo4U1ryG1ezyU6vOnwAR5YJPSrQE+6eMVW0Y8A==
X-Received: by 2002:a5d:6781:: with SMTP id v1mr1013379wru.167.1551250632810; 
	Tue, 26 Feb 2019 22:57:12 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id m189sm975124wmf.7.2019.02.26.22.57.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Feb 2019 22:57:12 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2019 06:57:09 +0000
Message-Id: <1551250629-14189-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] kernel-fitimage: Replace tabs with spaces in python
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
X-List-Received-Date: Wed, 27 Feb 2019 06:57:12 -0000

Fix:

  WARNING: python should use 4 spaces indentation, but found tabs in kernel-fitimage.bbclass, line 33

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 3adb1c94db77..2517d7574668 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -30,7 +30,7 @@ python __anonymous () {
         if image:
             d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
 
-	#check if there are any dtb providers
+        #check if there are any dtb providers
         providerdtb = d.getVar("PREFERRED_PROVIDER_virtual/dtb")
         if providerdtb:
             d.appendVarFlag('do_assemble_fitimage', 'depends', ' virtual/dtb:do_populate_sysroot')
-- 
2.7.4


