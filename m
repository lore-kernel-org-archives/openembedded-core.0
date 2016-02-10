Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id EB32D73179
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 22:18:26 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id fl4so6574336pad.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 14:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=lGtuRpiADfvSXfO0/FgP0u70FFg/ybYmSSrwI8Cr26c=;
	b=hyb18831nAd4F/KfYiCjZUrz7YZcySjRsiLN6Auh59TaUzQk/aKSDg30/f07actZkx
	omJI98Emb8pJSnJMn3W8E6ajOQQov3pyY8esaQHBHsOsEecO+5zEa1hYaEAqxA6Fi83n
	t+XzyK9cMtA3oH+Z5DCnXjm8v6NCd8JqQq3ecPFuLHfuVDv48I9Og4YDjJHPQbvX1IZH
	PcYoTLUDE5HHMproGJYBsZSGz/USiDDEuYPUSEGP1htJ/zM9swNnBHLmLsgyHevSFyv4
	ZahooA7V3fZYkXxmhdLn4aHte1u/7lK14jsO8FFNkzfFMV7n+QjHAj38j3Oc4mrQurLO
	j0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=lGtuRpiADfvSXfO0/FgP0u70FFg/ybYmSSrwI8Cr26c=;
	b=ACkNtQjApjC/QliuU3h+lNSrJY+JLp4fzQk63szFEM5ScF/ydPAFXmf8OvfYlFHWB9
	UOMhXzFqvKjCcOaE40m4J1reRgu7/a7fSMz40dhqiRUA1o9q3fTUHFzCq2joeLnM4By+
	SgYUk2WfyxTe7f7IlNiiXRFAjhkq+hc0STTB96CTfS5dWGZ1KylMsjnik4wSONJtYHuv
	+kPRt4xHuCidX8d6Zi20t1Pj+gS45jdoXAcAZbzSX/4b1Zu7tFVfqbBYtIVcpslf2QiW
	XbOeiXr6rLJWHlBpZ4v/lyxhoCCitIoTE3rGr0D7ursRlBls3PjW45HKcfuVrxrts/gC
	EGwg==
X-Gm-Message-State: AG10YOS0WoxY7Tai4tkaS9qcnxs4uoRUVCns4fR48f8WsCM2PxxNlWU99Lr3z3PD2cdaqg==
X-Received: by 10.66.102.40 with SMTP id fl8mr61678957pab.136.1455142707564;
	Wed, 10 Feb 2016 14:18:27 -0800 (PST)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id
	144sm7395057pfa.83.2016.02.10.14.18.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 14:18:25 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 14:18:24 -0800
Message-Id: <1455142704-24229-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [master][PATCH] libbsd: Security fix and update 0.8.2
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
X-List-Received-Date: Wed, 10 Feb 2016 22:18:28 -0000

From: Armin Kuster <akuster@mvista.com>

This update includes:
CVE-2016-2090 Heap buffer overflow in fgetwln function of libbsd

libbsd 0.8.1 and earlier contains a buffer overflow in the function
fgetwln(). An if checks if it is necessary to reallocate memory in the
target buffer. However this check is off by one, therefore an out of
bounds write happens.

Upstream has released version 0.8.2 to fix this.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/libbsd/{libbsd_0.8.1.bb => libbsd_0.8.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libbsd/{libbsd_0.8.1.bb => libbsd_0.8.2.bb} (91%)

diff --git a/meta/recipes-support/libbsd/libbsd_0.8.1.bb b/meta/recipes-support/libbsd/libbsd_0.8.2.bb
similarity index 91%
rename from meta/recipes-support/libbsd/libbsd_0.8.1.bb
rename to meta/recipes-support/libbsd/libbsd_0.8.2.bb
index 45420d5..3335386 100644
--- a/meta/recipes-support/libbsd/libbsd_0.8.1.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.8.2.bb
@@ -37,7 +37,7 @@ SRC_URI = " \
     http://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
 "
 
-SRC_URI[md5sum] = "f3daff0283af6e30f25d68be2deac4ef"
-SRC_URI[sha256sum] = "adbc8781ad720bce939b689f38a9f0247732a36792147a7c28027c393c2af9b0"
+SRC_URI[md5sum] = "cdee252ccff978b50ad2336278c506c9"
+SRC_URI[sha256sum] = "b2f644cae94a6e2fe109449c20ad79a0f6ee4faec2205b07eefa0020565e250a"
 
 inherit autotools pkgconfig
-- 
2.3.5


