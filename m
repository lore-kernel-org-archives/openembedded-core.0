Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id D9F196FFAB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 16:05:46 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id t190so16199584pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 09:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fVw/lipaFlz7tWvWkAreNC8XR+fLf7XrlLfG0UhD8sw=;
	b=MmtiM6ygMAgB+aSpAs4MzCvj9aFfDU+w9/b+PJuI0pW0afSveI89KP2SZTIYbi1Jmz
	UxstWHcHYz/lgjgOypmgsCFQSk9l89ClB+VOFSzGCHqs5Ux5GmV+Hso+IPJIXf5NCCVX
	f62r3nOTR6zvbo2sp/ia8MQB5w5kD9ddfuPoegh2u9LGC/3jYnCvg3sJBNxfyokA6Iih
	DKVgXC+52q97BCsVowBfCF4l/3DUMFNxYmiKJGJrEcz+uheEAM7f4/BSrb19Id98vp+D
	57VkJXD4IRsPb2zYmVNCnckCa2WVTPlRf5o1L8kDpoqTK5yiUVMijXXZxZGn8JgTyjw9
	hSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fVw/lipaFlz7tWvWkAreNC8XR+fLf7XrlLfG0UhD8sw=;
	b=Yrt+uIVBeDVaWeJLnIJsy0uCEEnUX/70CQa2C+t/9/aSG5CBQWUliDP5B5dc7mjMPQ
	JGxX4VjswezdO+aJ40eqdBEdherS4rwt+t26eGUXtLggg2VFs4ArNGmXjH0D6Cv7JZk4
	HGoTZnJ1Y5wicNTRtxqw/Du4hoOrwMpBDoUGRFKZuztnNlilk8FQXg6Kq6M3Tx9s9YZ2
	llQ5KHYa2Hl72z/h2onRRxK4vSmL3FJwPmTgyROyNELDtodlsZyA0r5YPXTBO4a2881H
	fWq2xrUCJrPk6hUYxoa0kL50FWmHKOz7J31efZLT+PbEfrirc2Ymsx9tDpi/4PZnLBtX
	0SAw==
X-Gm-Message-State: ALyK8tKizLQYqgZ0CF8fgb7ltJyAM3uHEwKAbzvurYMj4YPWLn5C2ZI4fkMtG7CqaQi9cQ==
X-Received: by 10.98.15.212 with SMTP id 81mr34539228pfp.110.1467043546823;
	Mon, 27 Jun 2016 09:05:46 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id 64sm633520pfj.96.2016.06.27.09.05.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Jun 2016 09:05:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Mon, 27 Jun 2016 09:05:38 -0700
Message-Id: <1467043538-18722-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1467043538-18722-1-git-send-email-akuster808@gmail.com>
References: <1467043538-18722-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH] build summary: add TCMODE to build summary
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
X-List-Received-Date: Mon, 27 Jun 2016 16:05:47 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index c68e476..017dbbf 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -650,7 +650,7 @@ PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
 
 # Pre-build configuration output
 BUILDCFG_HEADER = "Build Configuration:"
-BUILDCFG_VARS = "BB_VERSION BUILD_SYS NATIVELSBSTRING TARGET_SYS MACHINE DISTRO DISTRO_VERSION TUNE_FEATURES TARGET_FPU GCC_VERSION"
+BUILDCFG_VARS = "BB_VERSION BUILD_SYS NATIVELSBSTRING TARGET_SYS MACHINE DISTRO DISTRO_VERSION TUNE_FEATURES TARGET_FPU GCC_VERSION TCMODE"
 BUILDCFG_VARS[type] = "list"
 BUILDCFG_NEEDEDVARS = "TARGET_ARCH TARGET_OS"
 BUILDCFG_NEEDEDVARS[type] = "list"
-- 
2.3.5


