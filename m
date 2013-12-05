Return-Path: <andrei@gherzan.ro>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4505E6DF6D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 09:01:58 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id k10so11223175eaj.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2013 01:01:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nTOzRHsHUvB1FdRVT9uurfLS0z+audHDYvRGUoBPl1Q=;
	b=me+xFXhvXBQ0v9m0pyza5/H4GtynAtBNfN41i5U1PDd/QP1Wy08R8vnigKw0+9ItyB
	cz4mU/GWBUpTBsK+plG6uLfrdy/ERI5W2ofQRYdim1irgb8uXShAsPVk5hii9ChUH93w
	BldQWDqPOIX/zl0B5jJT6ZyL8H9kqDgZ0lt+0VxkNUYAG5acDRzbesQH/kSn61iPBZdV
	QSnnWC3nRzHVdjAQFn343CpZF8uhS6+0N3Ue2W0TzRMupQugtEiFlQtUjWsX0T6OKXm5
	gYOyXw+WQnLqPo+ba8K9CrZmNw32wxz+1zQJa/9lM+KiKwSZweLBrl3HLMoPpT+T4zjp
	rD9Q==
X-Gm-Message-State: ALoCoQljZIiBF2E7qIeJaFMG9LX1p4nwqJdFZoU3zQ2k6NN3855X+2IFh8fjp/ZYvmo/++MUBvKJ
X-Received: by 10.14.110.134 with SMTP id u6mr11099343eeg.87.1386234117424;
	Thu, 05 Dec 2013 01:01:57 -0800 (PST)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPSA id l4sm67794147een.13.2013.12.05.01.01.56
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Dec 2013 01:01:57 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2013 11:01:41 +0200
Message-Id: <1386234101-21411-2-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1386234101-21411-1-git-send-email-andrei@gherzan.ro>
References: <1386234101-21411-1-git-send-email-andrei@gherzan.ro>
Subject: [PATCH V2][ 2/2] libav: Update to v0.8.9
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
X-List-Received-Date: Thu, 05 Dec 2013 09:01:58 -0000

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


