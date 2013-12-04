Return-Path: <andrei@gherzan.ro>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 460C76D88C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 18:47:03 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id d10so10783521eaj.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 10:47:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nTOzRHsHUvB1FdRVT9uurfLS0z+audHDYvRGUoBPl1Q=;
	b=HvZJ/atcaHWSmAPd/8VG/SsfS5QE5gYHBk93mJZUoe7ytlK6CLnunuwdSfxuWW/8X9
	Oz6/dRNLqH83bro+coxra3derA1P6HaxPRjSuMqCyLlKnR/oaQcKF6LOuJL76Ip2J6/j
	UYSjsc1IgJ8Tn3p46DVXewZMY6XIlkFsCIEMwpzaUFNSBhRwmrvAdlA1FC/m8JGnl7mu
	kM8f4w1ihCOHlVLB8AVgxHUK7iAjYEatNWYpI7rRJpVRrV4a1BJAOVkeY4PPHYxAWnbU
	JHWkdO4bofD1N2Bqd6Z3UqvsN0UQd8JB259yvYC6sBT7xt6fcK8sdu7rfKzeyP2O4i2E
	4Kkg==
X-Gm-Message-State: ALoCoQkI4GJflTgk4RVXCmnTpnssfBBqu5f+1wiB6IvVOYRXBWTx/YrfENgJ8MD4/r6PSDeUWNR3
X-Received: by 10.14.101.4 with SMTP id a4mr76779187eeg.28.1386182822496;
	Wed, 04 Dec 2013 10:47:02 -0800 (PST)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPSA id
	o47sm97653978eem.21.2013.12.04.10.47.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2013 10:47:02 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2013 20:46:51 +0200
Message-Id: <1386182811-3588-2-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1386182811-3588-1-git-send-email-andrei@gherzan.ro>
References: <1386182811-3588-1-git-send-email-andrei@gherzan.ro>
Subject: [PATCH 2/2] libav: Update to v0.8.9
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
X-List-Received-Date: Wed, 04 Dec 2013 18:47:04 -0000

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../0001-configure-enable-pic-for-AArch64.patch                   | 0
 meta/recipes-multimedia/libav/{libav_0.8.8.bb => libav_0.8.9.bb}  | 8 +++-----
 2 files changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-multimedia/libav/{libav-0.8.8 => libav-0.8.9}/0001-configure-enable-pic-for-AArch64.patch (100%)
 rename meta/recipes-multimedia/libav/{libav_0.8.8.bb => libav_0.8.9.bb} (69%)

diff --git a/meta/recipes-multimedia/libav/libav-0.8.8/0001-configure-enable-pic-for-AArch64.patch b/meta/recipes-multimedia/libav/libav-0.8.9/0001-configure-enable-pic-for-AArch64.patch
similarity index 100%
rename from meta/recipes-multimedia/libav/libav-0.8.8/0001-configure-enable-pic-for-AArch64.patch
rename to meta/recipes-multimedia/libav/libav-0.8.9/0001-configure-enable-pic-for-AArch64.patch
diff --git a/meta/recipes-multimedia/libav/libav_0.8.8.bb b/meta/recipes-multimedia/libav/libav_0.8.9.bb
similarity index 69%
rename from meta/recipes-multimedia/libav/libav_0.8.8.bb
rename to meta/recipes-multimedia/libav/libav_0.8.9.bb
index 9cb4cf2..065a6d2 100644
--- a/meta/recipes-multimedia/libav/libav_0.8.8.bb
+++ b/meta/recipes-multimedia/libav/libav_0.8.9.bb
@@ -1,10 +1,10 @@
 require libav.inc
 
-SRC_URI = "http://libav.org/releases/libav-0.8.8.tar.xz \
+SRC_URI = "http://libav.org/releases/libav-0.8.9.tar.xz \
            file://0001-configure-enable-pic-for-AArch64.patch"
 
-SRC_URI[md5sum] = "34b8f1279a04466386ed67731197efe3"
-SRC_URI[sha256sum] = "e95cf618eb6239177a62c46f15e840c37e02e8308baf94912fc5910ff4aacbf2"
+SRC_URI[md5sum] = "7c0e5743cd5c4d4b1bcafd02a2e82e09"
+SRC_URI[sha256sum] = "4f5181164e4007d5b0013bb3cc5e3b7393ab71ac286319c714b7697e2784f77f"
 
 LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
@@ -14,5 +14,3 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 EXTRA_OECONF += " \
     --enable-postproc \
 "
-
-
-- 
1.8.1.4


