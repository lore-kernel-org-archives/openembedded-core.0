Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7ED89731CB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 11:26:42 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id g17so72786564wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2016 04:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=hHQ26y45el3XeZKkF/WXAn7JNB0hUOQeXi8YhqPifUM=;
	b=q/wE+PGFyMQqSXRNxHoLyt1dCajYuLiRI42qeWEtvQXI2orwYUaj4XtaoYq6ZJUDfZ
	kt7qsy6npT6ffQUE4Uyv04Vwu8eduSUwzXsSKbUf0guX6M4j407Zl3AQtWHdjeVa7VNP
	rFiVzvBnF62Cdi8P+CKFWPah8W9nrntwjkIMOnqdbpuYbTDl8tsd6UAnfmO9rAiKsIin
	nsMdXYz7WsfitggXnHfLFm2GrlseGENMu0sNRVU7UJoIOcS5afMPR1PQyeuOucdlM0+k
	McARQVIKO3YVnQK+z5yrah0Vu4mTk5ZYgAlpu5eOjtMBS6dlhWHp7ABBo8z3HpIv4L5f
	sdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=hHQ26y45el3XeZKkF/WXAn7JNB0hUOQeXi8YhqPifUM=;
	b=WJd6+zAGhLYuslig7rVRMoiNfQTl2ZMRcsul2LA/YekugXDBc/yx6kI0S0YRoFABqw
	GqE1TPuk0zknVK9aI4qk9y5dMjH0PxGvuMt1DGQE95rCwIe6N47kcyNZh1nC6J0YDH5Y
	oOgamGewL8dZGo+bVEd6hkWVp4MANCSYiaibXcvnJfcOCSGPpbnfBLybgo9GICIIZ51u
	54yBa3UvpKOfnRiv3LkoPzGgx5U0I5tGz6eece6Uhkug7J2okMgK/OVELX0dRDIXef39
	fAR36ztfKKs71x8Rs9xxZNRrcw3J4CWWGMggmBqpByKBudhZpHBOXpg03tUHyEpy6cOq
	Rm7Q==
X-Gm-Message-State: AOPr4FVJiZrX3GyXoIzgIilrGkCeBvwaVKx7mXr/Q2iXwJSvAPz0g5nk6VZSdMjEUMLmaqgc
X-Received: by 10.28.169.69 with SMTP id s66mr8673803wme.83.1462534002768;
	Fri, 06 May 2016 04:26:42 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	i4sm14516971wjj.49.2016.05.06.04.26.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 May 2016 04:26:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 May 2016 12:26:40 +0100
Message-Id: <1462534000-18539-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] bitbake.conf: add default for IMAGE_FSTYPES_DEBUGFS
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
X-List-Received-Date: Fri, 06 May 2016 11:26:48 -0000

If debug filesystem generation is enabled but this isn't assigned then the
generation code throws exceptions.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1c4175f..8e02e91 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -713,6 +713,7 @@ require conf/sanity.conf
 DL_DIR ?= "${TOPDIR}/downloads"
 SSTATE_DIR ?= "${TOPDIR}/sstate-cache"
 IMAGE_FSTYPES ?= "tar.gz"
+IMAGE_FSTYPES_DEBUGFS ?= "${IMAGE_FSTYPES}"
 
 INITRAMFS_FSTYPES ?= "cpio.gz"
 # The maximum size in Kbytes for the generated initramfs image size.
-- 
2.8.0.rc3


