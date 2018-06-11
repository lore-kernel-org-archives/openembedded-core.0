Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9877878C1F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 17:22:57 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id g20-v6so12721259plq.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 10:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=BmclQoMr2xTt4Al97SHBzs/ps9SK9tsGwV28kILdZxQ=;
	b=ZzxzyJBjcbK63mXjuL3V8YGRBqGbG2GFfgixJkvj8gZZZ1Ipsc8ZNwHnI5SyNTichb
	+uTEBvjT60z53q7CIbBT6loJQkdysUimZt7xxlUzCssP7iF5ei+6+Yhq/XY3X4SpnVJ+
	/hSu7ILpEp0XKGBMSZSrpgnCP0gxKtrTDgr+ZnJ4Ar7PEFNtoKCfdG3wWPU8SVEaxpxQ
	tC1NcnyX3sllFg5QS3kARtXl4r90rYSmhCbzRvFhw/HFDAi8jgmDkteaTfFlE2h3R+7Q
	v9DdbVA7ewIOkNL+jsnVXxHQwLtpuG1bReYnWrz3q+8pgWaRW87DnDh09jX+J2BJEbui
	B3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=BmclQoMr2xTt4Al97SHBzs/ps9SK9tsGwV28kILdZxQ=;
	b=Zyo9F+jwkguqe00IqKN7EEqqpjiGa+APjViDO94DwzbbvEkXc342JnOryEfh5mCqFY
	re4/MZlhLCiOvcz4saLkjdiGw/gYJ0bkj3C1eQY6/6Uz1riR+ZReQjOsQFIJNzzgxx40
	QXxRAlufjKxOzZFzZDyac3A/+UKAxjRmyPMC0pq/JUHozzeUozVgDIg1UkpaFMfofT7X
	bfo2XcdQLO0GtPBToZm6T+pbNgWc/dFwr8u4x3mNYKg+9BIXrINQoEOPOQljlWe3JH4q
	9LpE0/ZGNXGR5wU2PWKR5XFC/1cXCKcgl3vT4fN9mV+W3zQMZCo/pHtaMf8Ckds18OnU
	1f1A==
X-Gm-Message-State: APt69E0K5+RpK2+38YP9aDkaupiz2agA5g1eW52R960oe1lUmRKDKCbK
	EWNSkhRGGxY7pXyhqt9Fq4U=
X-Google-Smtp-Source: ADUXVKKU3zJTgOHhP20KToE4/ICJ5UMvialItjG8q3t4Prgglwf+REO2AWZ7KmTRoyIY+v86l5RcIA==
X-Received: by 2002:a17:902:7688:: with SMTP id
	m8-v6mr117122pll.54.1528737778888; 
	Mon, 11 Jun 2018 10:22:58 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:3dc0:dfd2:694f:63cf])
	by smtp.gmail.com with ESMTPSA id
	a18-v6sm96346167pfn.117.2018.06.11.10.22.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Jun 2018 10:22:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 11 Jun 2018 10:22:57 -0700
Message-Id: <1528737777-11279-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] popt: update SRC_URI
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
X-List-Received-Date: Mon, 11 Jun 2018 17:22:57 -0000

It appears the rpm5.org has been down for some time, switch to fossies

WARNING: popt-native-1.16-r3 do_fetch: Failed to fetch URL http://rpm5.org/files/popt/popt-1.16.tar.gz, attempting MIRRORS if available

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/popt/popt_1.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/popt/popt_1.16.bb b/meta/recipes-support/popt/popt_1.16.bb
index 478288f..377d108 100644
--- a/meta/recipes-support/popt/popt_1.16.bb
+++ b/meta/recipes-support/popt/popt_1.16.bb
@@ -8,7 +8,7 @@ PR = "r3"
 
 DEPENDS = "virtual/libiconv"
 
-SRC_URI = "http://rpm5.org/files/popt/popt-${PV}.tar.gz \
+SRC_URI = "https://fossies.org/linux/misc/popt-${PV}.tar.gz \
            file://pkgconfig_fix.patch \
            file://popt_fix_for_automake-1.12.patch \
            file://disable_tests.patch \
-- 
2.7.4


