Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 73F4279445
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 15:09:07 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id r69-v6so3133664oie.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 08:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=n9ZwKqLqAgt5/y7Fj39LSKcXINxxBk3Vqnvu33xZL24=;
	b=D7da2e/+4/EnKFPmaOfqKUzaqyCT8vVjC6xWF2hTezzovTy3kZLAzpOjU6EFKdcydY
	QuQSn109P36f8c7aPbGcL1+hCYdWzq8Xp+frP6VjALIbMtjpfxBoGFrgUae7Q1NZ3AKt
	aczBcNsWFwJw1QHWVFibL7wL05ChQAorzLNBK60grLVIOiySbUCZqLBqt6w4it5wpM54
	F7x10iL/nHt8QmBYVaW/STqQpKNmS1HakX1DflZ7B5GRAxfw+OddPdy75axpp9Pw+E2z
	s/fUg0syszTAjpNUMPe8lUCy4xBGg7PMAcg1NGEIvyKtfIp31/bdNDVcA6w4taW7JTeq
	8LtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=n9ZwKqLqAgt5/y7Fj39LSKcXINxxBk3Vqnvu33xZL24=;
	b=EnrzpfkuyDq83uKV0STrtDuXh7cdf0XLTvov89L8bznc8gM00UEKmElg7G02Mel0I3
	l3tQPZtNgbII7b67m+7PG5qcVwypZE9D8uQQYbfR5Cw9iB2MpSL3MkhJ0I8LfPl/BhJx
	beU8mkfbWn2pat3uAbOheTh0h19dvCKXYbjHV/nsEIRf9J9F/LL9WTDbAOaY/0VJG6EY
	JlMSc96kzbqeun9lUMrOHUaie2U8R9NcgGXvsxFU2quLm1YjF+RGdpvBh35s4ERn5Cuz
	A9PGlAvYMdeARXRp+HlTVs1h+4TaVOTVYjS8cSjrT4boOjrq8J0lVtiTIzQUpVz7dS+4
	2zcA==
X-Gm-Message-State: APzg51AabYQfRwaJKGMZWUaDzJKEzDMr8SDhjUWods04ILgy0VyzKyXd
	mAPe6q0JXU3PRL6aWfa2jYJKu9UL5ME=
X-Google-Smtp-Source: ANB0VdaxbFHkAE2RXnPXrHm3Clf8EMQ0OLxEy2veazFF9j90GbdsnR1NnibEV//QXmQgryB6LiIadQ==
X-Received: by 2002:aca:ac54:: with SMTP id v81-v6mr4115959oie.1.1534950548332;
	Wed, 22 Aug 2018 08:09:08 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	i132-v6sm1024281oif.20.2018.08.22.08.09.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 08:09:07 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 20:38:22 +0530
Message-Id: <1534950532-23850-4-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V3 04/34] libvorbis: CVE-2017-14160
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
X-List-Received-Date: Wed, 22 Aug 2018 15:09:07 -0000

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


