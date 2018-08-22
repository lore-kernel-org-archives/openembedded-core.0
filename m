Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id DAAE079093
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:17:16 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id q204-v6so2460036oig.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=n9ZwKqLqAgt5/y7Fj39LSKcXINxxBk3Vqnvu33xZL24=;
	b=1D6cTZNmCUpHjpdYkAPLBFsrTBx4L7hYqDTdSaZNQvM1cqW2o6Z0IvmRXl9giJZN/f
	QBcsz0qRK4om8QHkSy8iG5DA9CQ1JbMehffzuxPyUdt4OQUbNXaOcaWU8lQSl5QGN7oD
	gc7zJoygwlQu3LAQ6FcM8BHn6SzfZ7UvCDxxVGp8dJszx6R5c7Q3xDG5vqRMy7Xwzzdq
	aA8LSAoDK1RwLEMeqZYJmHBmDmuQbhoqGdvp6NWObIuvPcJy+TJYgjvzQWMpqwViDMy3
	LujqQfgTKVwOKwtzuUT8XciSFBZAx1+gMLbtoOVVDAZ1cJd4eesd+k9uEElJ3+b7L+Cc
	8rUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=n9ZwKqLqAgt5/y7Fj39LSKcXINxxBk3Vqnvu33xZL24=;
	b=CmRfHxn4i+7AmzWThHyU89hdlcgf91FJomKqvJ0e/gCMetFViXSpJI60gBTUqJnoku
	/5XeIWvI61gimBV97FiqkyIO572vo/c7VuCfQ+vB9oT6biZAB5t1yTA6Wnq53vMSSvKO
	fYKTCetquGFecUQDa2S8QJBv51pN2jMKTFO+bqRTcSh+bRhuX8/AMjARBoVmjmmKPtm7
	my42ckjZgg+KoJkpa4TAvuyBAXi48CSWeM9F+IcplFt5Nh2QxXZ4kUhb9N8lqTy3jGK3
	JfbiakgSuJG2jtLpR48obJ5Qnr2MHonISAzg2RT/bAEIQQFJE/ARwJE/BKog9vOrBTz/
	v7EA==
X-Gm-Message-State: APzg51AHT4aAP8be8y5As3s5bVrpeTYyRm52PoEd5/zypnIZc+krFTUk
	W+4TotKS+aGjuun7y19QMqigpRJFfQ0=
X-Google-Smtp-Source: ANB0VdY+aiGxPEYTAy7OAj8Kc7ljSby02EY0zscWXYiTISyTDIOgnqSfVkcuSxzg61aBJjOUa7QbhA==
X-Received: by 2002:aca:c00b:: with SMTP id
	q11-v6mr3259633oif.330.1534936637742; 
	Wed, 22 Aug 2018 04:17:17 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	v5-v6sm694446oix.36.2018.08.22.04.17.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:17:17 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:46:38 +0530
Message-Id: <1534936615-11658-2-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936615-11658-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936615-11658-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [SUMO][PATCH 02/19] libvorbis: CVE-2017-14160
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
X-List-Received-Date: Wed, 22 Aug 2018 11:17:17 -0000

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


