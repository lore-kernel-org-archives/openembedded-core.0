Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0E940731C6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 21:34:16 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id a202so13617491oib.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 13:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vwx32vVTaQG7gruMd8oa2M7+3Nlvl7eo8iesHiXtX6Y=;
	b=IK1I2Qa66n0Ai0OLehaqT7Y1LXgyOCyVT3SU87fZirj6gP6R7zCHjueTAKGqBGSmAG
	ssMMwjJgqbyCXR8URYPwsUUE/PE6hQtLgbBCnTQmJcRBGfHyIgbBnnYSaDbNxB7iAG7A
	MqgLFalHcA/tyYLJzYZrQBQ84sZXiP5IOP6IZH4k8Ter9dc9p17u2ymvoTGN3wKF5bRh
	75oBmEiN+OS3MZkkfQXGwHt1QX4Xuay5qWCuYB6fNYf9kCDdeOhdDYJ0ltWCzic19wF2
	MDbEe+EDxM+nqV5g67dOh2KfHrFe59UjCRF3qNi1e6FN8brvMsL/cOuyKH6rfh5iCOI8
	odmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vwx32vVTaQG7gruMd8oa2M7+3Nlvl7eo8iesHiXtX6Y=;
	b=kpsGAO4xSn/6GiBA1JETyW6hvvlP831oNV8ZCy3CXT2SREyplMRNySObqaeeeJLqnj
	7peixWwLfM96MashScrcoVlG1vIJLS7BX/0g/mtwm52XIUYytDCyZDoWVU1R2yFFoh0l
	ilPMtTRxlPtz6H+NLP7Zu6SJhXyWh9elmtoy+fjJS4z/JM+64s/Sxb42x8O8V4YuM+9/
	Dhz1e35hCi9pRGFaqtzEk7J9ihpEs3+OABxvXQjMvoxO1Hoc76Ns2PsURaDS900qjoni
	v+DJ09KEH+zVmSPdFhVjR7XutHqWR87XQaLfeclBopv7+mHzgFn0fieRg3h9y3KY93pf
	IdKQ==
X-Gm-Message-State: ALoCoQk43zYWjvSBsczQgEhL+qJNtXEQlit9gMFqZXisatOXHXLmdM9lxVu1LVahXlcniwVYIOwieUFPHaQnHwEwX26nmzLOgA==
X-Received: by 10.202.172.80 with SMTP id v77mr19819282oie.18.1453152857222;
	Mon, 18 Jan 2016 13:34:17 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id v6sm5928816oer.10.2016.01.18.13.34.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Jan 2016 13:34:16 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jan 2016 13:33:49 -0800
Message-Id: <1453152832-12019-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453152832-12019-1-git-send-email-armccurdy@gmail.com>
References: <1453152832-12019-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 2/5] strace: fix --disable-aio configure option
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
X-List-Received-Date: Mon, 18 Jan 2016 21:34:18 -0000

Remove the original unconditional check for libaio.h,
since it's included in the newly added conditional check.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../strace/strace/strace-add-configure-options.patch       | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/strace/strace/strace-add-configure-options.patch b/meta/recipes-devtools/strace/strace/strace-add-configure-options.patch
index a3f8ec4..84b9f9c 100644
--- a/meta/recipes-devtools/strace/strace/strace-add-configure-options.patch
+++ b/meta/recipes-devtools/strace/strace/strace-add-configure-options.patch
@@ -12,7 +12,19 @@ diff --git a/configure.ac b/configure.ac
 index e73958c..9099370 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -745,6 +745,20 @@ if test "x$ac_cv_lib_dl_dladdr" = xyes;
+@@ -303,11 +303,6 @@ AC_CHECK_MEMBERS([struct sysinfo.totalhi
+ 
+ AC_CHECK_TYPES([struct flock64],,, [#include <fcntl.h>])
+ 
+-AC_CHECK_HEADERS([libaio.h], [
+-	AC_CHECK_MEMBERS([struct iocb.u.c.flags],,, [#include <libaio.h>])
+-	AC_CHECK_DECLS([IO_CMD_PWRITE, IO_CMD_PWRITEV],,, [#include <libaio.h>])
+-])
+-
+ AC_CHECK_HEADERS([linux/input.h], [
+ 	AC_CHECK_MEMBERS([struct input_absinfo.resolution],,, [#include <linux/input.h>])
+ ])
+@@ -745,6 +740,20 @@ if test "x$ac_cv_lib_dl_dladdr" = xyes;
  fi
  AC_SUBST(dl_LIBS)
  
-- 
1.9.1


