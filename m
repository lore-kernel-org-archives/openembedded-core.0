Return-Path: <naresh.bhat@linaro.org>
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 71CEF7387A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2015 15:46:43 +0000 (UTC)
Received: by yhoc41 with SMTP id c41so1993872yho.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2015 07:46:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=p82Jx7I5Mz9pAJfB7WCMBil9xf4ljDPaSu6We+70lA0=;
	b=SBrpwmm437ryzGlr6dIvy6l5jg6U6eWvxx8rciS2wOUNos1R2Q5q/T6FbJREGdVGNh
	9sF/a6tuW0Ly6/gJLBunVxbztD7Jyzf2xlnFmugFCRGHiuh8Qnd+k+yE0IVGo2e/Et+u
	J5P6Ksqe5GqW3jrREGc5Jpve/h7+QV7wGEd1+cF2GCZ9eF6hv82HxgXGF3Z0YS15d924
	FzPK/08JYdeIzqbEuu5lc1y9KWVV6c3pi66OsM67vwqRbVtvPWA+pbo6hmTz9GfOt6DT
	K9W77H2g2df+1gnT24G9m43daeC/gWG2xgkShwbP7QFAqLMrLtp54XJgcG8QLOP8RBdp
	XOuw==
X-Gm-Message-State: ALoCoQnI7Y9abAwxD/oVNd928khA7T8e5u3TNqxVRyjnKiCcRXFJf9gzZaWqAwZQBLg13i4+ILt3
X-Received: by 10.236.53.69 with SMTP id f45mr30952493yhc.12.1425397604638;
	Tue, 03 Mar 2015 07:46:44 -0800 (PST)
Received: from Latitude-E6430.caveonetworks.com ([111.93.218.67])
	by mx.google.com with ESMTPSA id n22sm831796yho.1.2015.03.03.07.46.41
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Mar 2015 07:46:43 -0800 (PST)
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Mar 2015 21:16:21 +0530
Message-Id: <1425397584-5154-2-git-send-email-naresh.bhat@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1425397584-5154-1-git-send-email-naresh.bhat@linaro.org>
References: <1425397584-5154-1-git-send-email-naresh.bhat@linaro.org>
Cc: Matt Fleming <matt.fleming@intel.com>
Subject: [OE-core Yocto PATCH 1/4] grub-efi: Add to support to install grubaa64 efi
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
X-List-Received-Date: Tue, 03 Mar 2015 15:46:48 -0000

Add to support to install grubaa64.efi binary for aarch64

Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
Signed-off-by: Matt Fleming <matt.fleming@intel.com>
---
 meta/classes/grub-efi.bbclass |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 47bd35e..455dc8d 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -37,6 +37,9 @@ efi_populate() {
 	if [ "${TARGET_ARCH}" = "x86_64" ]; then
 		GRUB_IMAGE="bootx64.efi"
 	fi
+	if [ "${TARGET_ARCH}" = "aarch64" ]; then
+                GRUB_IMAGE="grubaa64.efi"
+        fi
 	install -m 0644 ${DEPLOY_DIR_IMAGE}/${GRUB_IMAGE} ${DEST}${EFIDIR}
 
 	install -m 0644 ${GRUBCFG} ${DEST}${EFIDIR}
-- 
1.7.9.5


