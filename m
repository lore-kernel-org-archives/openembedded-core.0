Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 26374793D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:36:12 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id z185-v6so2703052oia.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=n9ZwKqLqAgt5/y7Fj39LSKcXINxxBk3Vqnvu33xZL24=;
	b=EHQ9ryBqzsryRwBIAGQdYxFjQxcj7gx4Kb6eW5a5tcT1uYh4UL6v7e+wHc6si3uV6f
	YJZKftFx+5z5pKg5xhPzdgCMWHKLRurOVCBBFtn0U4NGusntG80hEBexBzkwcn/7b5ic
	AhzcDQYefY4szM3qIPAsdMdER+MSB3ogGYxmFA+Lw6ozChZ1+nqqKuy74bdCT8AcYdr3
	Gz5e5ITk8C44V0OrfSb5W0k0kAA+QdpZrTzHYg8H0TXef/PltWG1pTipjES/I/EsxOw2
	0ieTCT8IfgoXLkg4wsukK2zEwQg75hpJCexuzfs4LXyuX/cT5XAyP4DCIjASXdL/bIbo
	6ZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=n9ZwKqLqAgt5/y7Fj39LSKcXINxxBk3Vqnvu33xZL24=;
	b=ondqHHQkMI/hkGPrNgQcO3dA8i9f31hbc2z0W+0/UoA6O6ZSs3jyEggxPlRoayUYNx
	QQTbPVmF8Dt6+olSjNMvqhxV3cVhDzuFILYdDwZ1JsQPJbfJmhFjxQPNywmMcj9+qY0E
	xl0tO8ybS5x/jQ39HRA8nTfGZWiVUn+2cQ6GEeYCUfXpjxahGyGA8sROMsENDrIqUJMA
	UsFnFXyTofi0h//nkFijZ65GNLrGPAoKhFQUGGOEEEljqktephfftFPwjIjp8BV9Nlbr
	3xOdMisVLwGP+1W7yGlxj9VWjQuF2yhCbclXEnkJAV6i/RNnaQBy9+gbSz2tPsg89XMV
	tfZA==
X-Gm-Message-State: APzg51BiEX4nkJMoHt5chUDXlWSEp+CRUGIPu/m1k/gLK7JU5DfeuYNR
	74Lb+3LBUFqiCWeb1AnYb/N/j6BCvLs=
X-Google-Smtp-Source: ANB0VdZ9n7BoRNlDhd0eNh8MG8emsZ84Do6oPLvcq5Rk4JNAaNfhPMVbn25+FGqXZwuCCdj19u5BeA==
X-Received: by 2002:aca:4fcd:: with SMTP id
	d196-v6mr2661151oib.51.1534944971765; 
	Wed, 22 Aug 2018 06:36:11 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	h186-v6sm3746773oib.55.2018.08.22.06.36.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:36:11 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 19:05:10 +0530
Message-Id: <1534944940-21566-4-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V2 04/34] libvorbis: CVE-2017-14160
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
X-List-Received-Date: Wed, 22 Aug 2018 13:36:12 -0000

CVE-2017-14160: fix bounds check on very low sample rates.

Affects libvorbis = 1.3.5

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../libvorbis/libvorbis/CVE-2017-14160.patch       | 33 ++++++++++++++++++++++
 .../libvorbis/libvorbis_1.3.5.bb                   |  2 ++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14160.patch

diff --git a/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14160.patch b/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14160.patch
new file mode 100644
index 0000000..5f304aa
--- /dev/null
+++ b/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14160.patch
@@ -0,0 +1,33 @@
+From 018ca26dece618457dd13585cad52941193c4a25 Mon Sep 17 00:00:00 2001
+From: Thomas Daede <daede003@umn.edu>
+Date: Wed, 9 May 2018 14:56:59 -0700
+Subject: [PATCH] CVE-2017-14160: fix bounds check on very low sample rates.
+
+CVE: CVE-2017-14160
+CVE: CVE-2018-10393
+Upstream-Status: Backport [https://gitlab.xiph.org/xiph/vorbis/commit/018ca26dece618457dd13585cad52941193c4a25]
+
+Signed-off-by: Thomas Daede <daede003@umn.edu>
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ lib/psy.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/psy.c b/lib/psy.c
+index 422c6f1..1310123 100644
+--- a/lib/psy.c
++++ b/lib/psy.c
+@@ -602,8 +602,9 @@ static void bark_noise_hybridmp(int n,const long *b,
+   for (i = 0, x = 0.f;; i++, x += 1.f) {
+ 
+     lo = b[i] >> 16;
+-    if( lo>=0 ) break;
+     hi = b[i] & 0xffff;
++    if( lo>=0 ) break;
++    if( hi>=n ) break;
+ 
+     tN = N[hi] + N[-lo];
+     tX = X[hi] - X[-lo];
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
index 20f887c..1a49e59 100644
--- a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
+++ b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
@@ -9,12 +9,14 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7d2c487d2fc7dd3e3c7c465a5b7f6217 \
                     file://include/vorbis/vorbisenc.h;beginline=1;endline=11;md5=d1c1d138863d6315131193d4046d81cb"
 DEPENDS = "libogg"
+PR = "r1"
 
 SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.xz \
            file://0001-configure-Check-for-clang.patch \
            file://CVE-2017-14633.patch \
            file://CVE-2017-14632.patch \
            file://CVE-2018-5146.patch \
+           file://CVE-2017-14160.patch \
           "
 SRC_URI[md5sum] = "28cb28097c07a735d6af56e598e1c90f"
 SRC_URI[sha256sum] = "54f94a9527ff0a88477be0a71c0bab09a4c3febe0ed878b24824906cd4b0e1d1"
-- 
2.7.4


