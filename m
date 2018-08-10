Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 07576745AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 01:32:13 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id a26-v6so3711533pfo.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Aug 2018 18:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=T3+m5ugfkO/0PX+mMlCmo4xrhiIyV7NocmcTEMtQhOc=;
	b=EmC/x9KdCLBcrYaBgl0+7Ii9z3wbkO0lSH4lGO4gUvbj0SpzCvvouPJYs17xQtQlZ3
	tPaBBXbzakSa07tibaYgX0BbryVjQ+ZJXLrKvzTympcEB0qywK6pGHHStcd2uLKeZc/c
	pY1HqOQxcvfoNwnSIar1GvJ3xQAxz7+k3gmrgRFwxmrTUfNjd/qHJ9tc5d2gOzaAzFcK
	FJQIYfZoqNuRKH5ekF/UNvLaWUgBdpJEKaNUafZv0ybOEQVUQjIrFrUT6fG8SScgKsFk
	Rm4A961PwYcJu7JfqRNAW/aFNZfCAJ/7AbDh0U2VAVEJfvuG/Tt576k0G+sN8k/xz6On
	XLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=T3+m5ugfkO/0PX+mMlCmo4xrhiIyV7NocmcTEMtQhOc=;
	b=XNNvEuwjbWlc55CpubvvmVAUeQvEc/7fD9t6Uia6lXbCFlFcF02mfziFaQMeQ9QXBs
	aSWXYmI9ZxxYHyu7PCiEEFP8FI3y+ABLWg33SwR4Ffw6+r039uMGD65/C6ZX7qM2bzIm
	QC7S00kqfFyYXrILJhYPecoS286qtsLo+OvXob/G2gZfOgrwdOpxcehInorTaZVBoe2Z
	CiJCMVtmbI6te9vZtMR/7FTNmgfwlFnW5zv2qOF++R5VqrLNI/UAaU7+5xoO4cXYSupH
	lRetO22B2iI4NGC0C116ceipy4tR5oq1Inyerq1wBHGNzMMmnM4jpbgwO+jyvtnQttpj
	8yVA==
X-Gm-Message-State: AOUpUlGgdTNi9BYztboH/mlW39BrcN+tvvmUlAVYXd7P0wMmQWzokFq4
	7ha4pMpFxmCnMmbcOYxmEUsdvvN2Dqc=
X-Google-Smtp-Source: AA+uWPyg7EQvspvl3on27WUKXPlS9Kv/M2juyBLH8OysCy8VK9RxaHD5ZRvLCwtXrPoG+i0DIELFpg==
X-Received: by 2002:a63:65c2:: with SMTP id
	z185-v6mr4239975pgb.276.1533864734739; 
	Thu, 09 Aug 2018 18:32:14 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	k125-v6sm9548071pgk.41.2018.08.09.18.32.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Aug 2018 18:32:12 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Aug 2018 18:32:01 -0700
Message-Id: <1533864721-4051-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] libjpeg-turbo: fix timezone of reproducible build timestamp
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
X-List-Received-Date: Fri, 10 Aug 2018 01:32:14 -0000

Avoids producing different build results in different timezones.
Uses UTC with SOURCE_DATE_EPOCH.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb
index 15353b5..6be6aa5 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb
@@ -46,7 +46,7 @@ DEBUG_OPTIMIZATION_append_armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb
 def get_build_time(d):
     if d.getVar('SOURCE_DATE_EPOCH') != None:
         import datetime
-        return " --with-build-date="+ datetime.datetime.fromtimestamp(float(d.getVar('SOURCE_DATE_EPOCH'))).strftime("%Y%m%d")
+        return " --with-build-date="+ datetime.datetime.utcfromtimestamp(float(d.getVar('SOURCE_DATE_EPOCH'))).strftime("%Y%m%d")
     return ""
 
 EXTRA_OECONF_append_class-target = "${@get_build_time(d)}"
-- 
2.7.4


