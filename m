Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3626A6BC7A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 20:00:58 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id r76so4381397lja.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2019 13:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=QTQL89zFJ863xt8e9ndfbMYTmVuu/NuaNJjqIH3IxxU=;
	b=EFfGAoNw5R3TLG+Y73xWnkVWYJxURBVIc8zPl5qA1a6lBUhnQTFhzFMfVlkD09soAM
	rbmJe+2WgdhaVqdsvwrwQ2cxNrQoKJhZtOFr/FZcQw9Nq/bD1yMzSBxgbTuCMA/ygbWs
	r5uh5IWp/DNK2ggQGGQT8tQGJxBebDSBuRa86RlZQuswR3m2SnrqbjD+hzY4XfriO1MM
	S+cIUbVWn0cPT5xbLhOigD8at0SwlIQdJ9xnBmCQ5CNjK/DJnp7SRh8GPvgytYQeJZzI
	TtZnlFAV6m0Y1yWPB/3YrSRYHppA6xM1cuI0UBIYwrHDO13EeGSlIHEFtwGyvEi23U83
	u8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QTQL89zFJ863xt8e9ndfbMYTmVuu/NuaNJjqIH3IxxU=;
	b=CiD8aEycrIjW9C3NBThFuT65rakS3CRm7dnusM8onPp/97NPJ0CCtzYrStiFO7s5LX
	q4oh/6izqp6EDK/ffwYfue04qHytxDpM/UfuVaVSDL+rVad0g66ow1EnPuEsI46SnKlS
	ICIN5+3CJ5Wr1Frw74S1xBYjUiwxJ08xI93tz8vIQmaKLnMCtsgSoU1IpRwyjJXziN7f
	kmK62sqzOJsY8uWfIj81uWeK7dWXlA0SF4mlqFu9T11RyNj3znCNE1Z169PXeYKseJMI
	+shYXxxR/jczibRJYh1gMaMEbzcYr37sungWZ5zDfc5pmNrJb0TTX1PutpocwkkIYlMs
	hOow==
X-Gm-Message-State: APjAAAVcc6UlIl0YIbptoWH98qQ+w9KBVRxmcQz39lJFnDCbtyyiHfhc
	YRcxj+mFxON3klpyuDB5uBPKzcfTXLg=
X-Google-Smtp-Source: APXvYqy7ygcf6mFdUN0ruir/1UaaWaxKyu1z+29ClF4YKo1SLeHZP7w4OBORcoTPwvXWr38N0dFfhw==
X-Received: by 2002:a2e:82cb:: with SMTP id n11mr18504038ljh.183.1557259259368;
	Tue, 07 May 2019 13:00:59 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	s17sm2402734lfb.66.2019.05.07.13.00.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 13:00:58 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2019 22:00:56 +0200
Message-Id: <20190507200056.18766-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] mmc-utils: update to latest revision
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
X-List-Received-Date: Tue, 07 May 2019 20:00:59 -0000

Removed patch is not appropriate anymore.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...rncpy-with-memmove-on-overlapping-me.patch | 36 -------------------
 meta/recipes-devtools/mmc/mmc-utils_git.bb    |  8 ++---
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-devtools/mmc/mmc-utils/0001-lsmmc-replace-strncpy-with-memmove-on-overlapping-me.patch

diff --git a/meta/recipes-devtools/mmc/mmc-utils/0001-lsmmc-replace-strncpy-with-memmove-on-overlapping-me.patch b/meta/recipes-devtools/mmc/mmc-utils/0001-lsmmc-replace-strncpy-with-memmove-on-overlapping-me.patch
deleted file mode 100644
index 62e25fde9b..0000000000
--- a/meta/recipes-devtools/mmc/mmc-utils/0001-lsmmc-replace-strncpy-with-memmove-on-overlapping-me.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 175ac0f362bf6121c3537e2f1760ad41c8f81367 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 29 Mar 2018 01:04:57 -0700
-Subject: [PATCH] lsmmc: replace strncpy with memmove on overlapping memory
- copy
-
-here source and destination addresses are overlapping so using memmove is
-going to be more efficient.
-
-Additionally, the bounded size for copy is overflowing for first copy
-
-In function 'strncpy',
-    inlined from 'read_file' at lsmmc.c:356:3:
-/mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/mmc-utils/0.1-r0/recipe-sysroot/usr/include/bits/string_fortified.h:106:10: error: '__builtin_strncpy' accessing 4096 bytes at offsets 0 and 1 overlaps 4095 bytes at offset 1 [-Werror=restrict]
-   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__dest));
-          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10314723/]
- lsmmc.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lsmmc.c b/lsmmc.c
-index c4faa00..bcb854d 100644
---- a/lsmmc.c
-+++ b/lsmmc.c
-@@ -353,7 +353,7 @@ char *read_file(char *name)
- 		line[strlen(line) - 1] = '\0';
- 
- 	while (isspace(line[0]))
--		strncpy(&line[0], &line[1], sizeof(line));
-+		memmove(&line[0], &line[1], sizeof(line)-1);
- 
- 	return strdup(line);
- }
diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 37a4755234..69b230e54e 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -4,13 +4,9 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "b4fe0c8c0e57a74c01755fa9362703b60d7ee49d"
+SRCREV = "aef913e31b659462fe6b9320d241676cba97f67b"
 
-PV = "0.1"
-
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${SRCBRANCH} \
-           file://0001-lsmmc-replace-strncpy-with-memmove-on-overlapping-me.patch \
-           "
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${SRCBRANCH}"
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


