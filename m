Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id AF175607A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 12:44:35 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id n184so120047574wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 05:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=+JjVbZFIwVKKfX6Hoou6LFtowrgN9Smv6rjEq3WlsQ4=;
	b=0y6AAacCkRAFyMV8TUulCu7WU/0d0NSNDXw+tmHBi2SRS+j8iqAvNVtdSFPxKhXJlv
	vFojC9t+Tbucbnelf+vbjBR9kHN2Z6F3+ebb6Vt6UPefT2n0nyH2QvaITu4vOaQ9PZPS
	KmfepsWaCA6QQqARL22G3GPw7VXUrVdQ1Cl33bCWQBARPFj5aChNsaa8Q6da5j2IGkZh
	cVHwCUOK9Rr75BfTxO8F/AfpOGlTpaVKqQ/YRj8posh7/CSBMOvBAT0lvOIGVETodosb
	kFExPmtngwQA3NaWQ9fuBDsiXay1ooL+BzTyT8e8aTZjhJOfZPA1F8DH169tbT4PQIJb
	/Ojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+JjVbZFIwVKKfX6Hoou6LFtowrgN9Smv6rjEq3WlsQ4=;
	b=FAQcXM84D6qjISuteDZOllGAYgiJSYFJWbYx87czObJbK2hmq2feqag0cr2BAK4isP
	uolf9KPeY5CZwMa5X8RmherUAVSiybQ9W0+/ZUdN6IPNffSqrt/Q1iytTi2VATJU95ic
	pkvRBY+HBd32J3uE22u5csAhFJ1qw5nCXqj8ssE/MBcDzP7e3yM4T467SXXv+yfmWeAB
	/YBDEE/rl8sRoos4vecvnIEyV2krn5DopsOjS8akGZH5kd4kwF9viiHoBo34HwiMLEho
	ihVoKEQ047jkWHhQ2HAtc1U+u5nTrzjRnVljSrOjchsdXNkQ+dMtW/0APObsr2iYPS8p
	FdqQ==
X-Gm-Message-State: ALyK8tIDor3OD1JnFnVvrvD6x3XvbF8ENyFqzBucvS+MJ0ccb/Nrur8KE01uOUibUB118tmv
X-Received: by 10.28.218.149 with SMTP id r143mr4875009wmg.102.1465908275661; 
	Tue, 14 Jun 2016 05:44:35 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	s125sm3945304wms.14.2016.06.14.05.44.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Jun 2016 05:44:35 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2016 13:44:30 +0100
Message-Id: <1465908270-4251-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] classes/sdl: remove pointless class
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
X-List-Received-Date: Tue, 14 Jun 2016 12:44:36 -0000

This class exists purely to add a number of SDL dependencies, which should be
done directly in the recipe.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sdl.bbclass | 6 ------
 1 file changed, 6 deletions(-)
 delete mode 100644 meta/classes/sdl.bbclass

diff --git a/meta/classes/sdl.bbclass b/meta/classes/sdl.bbclass
deleted file mode 100644
index cc31288..0000000
--- a/meta/classes/sdl.bbclass
+++ /dev/null
@@ -1,6 +0,0 @@
-#
-# (C) Michael 'Mickey' Lauer <mickey@Vanille.de>
-#
-
-DEPENDS += "virtual/libsdl libsdl-mixer libsdl-image"
-SECTION = "x11/games"
-- 
2.8.0.rc3


