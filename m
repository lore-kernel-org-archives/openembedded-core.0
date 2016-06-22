Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id EE21D731DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 15:30:05 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id t190so4344498pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 08:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=PV34RVuTqLsVcEo9xb9vnttybTeSxfVMuIoAGYm9bIg=;
	b=lQ8fskExuNqTwq0y3f2rn01jPry4+fL1k10FXsG8ol/gz+jXegDUtX6+bQ+zUeBh9y
	N5iEIEeMmzxHVhU8G9grmo0txRNjqaFXnL3bfXwWSPwubyk3eoLvvym0/3qVlbhdOnA2
	wTNm0Z4j81NWaSNXCxjp867/NP8GyEXEEOcbekRHy65VTqFXmFnm1Z6mAS7a1/Q6yRrh
	W3nLcRqsaHXXDHpe++eLMTUV/o2t5tca6ktMscou8gJA0u2RreMEZSpNhzLK37FSY8jN
	r/Ul7OF7Bm4Bytsx1qhMeCoPOOEvBihXHtR1TkdwYqCzv3iPmWMC8RNNdheKmeVTQnKk
	Tpzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PV34RVuTqLsVcEo9xb9vnttybTeSxfVMuIoAGYm9bIg=;
	b=Uaq39QmlPG33kCYo8GlZFZ26KWU94MxU8W8+3PbqvF4woJme4WKCucctxCUrDmDYc0
	Ip9D4+G+ZtpEh65eATia5CGXpniq1fOzWbeCczXujPzqZCliXvrUcnZCyo/9sUf8XnP1
	VlixW2QhnVF3M1SGcjRO6aJGfMJyWw3tXiO5smKFCPqaAhMt7yPcE3vEBa2pt252akSD
	2tnOYg1vcDKtkrNpnBuyplf11aiszshFhj8jAGELSDyabDbJ6CLl8GrZWksKeGSzpZ8v
	t6c8p1CSU+DUuFOd3YqcPG7VHugl2GLGVOc8tOjEJab/2VPtbYJhkgM0lzCLZgo/GVli
	iGMg==
X-Gm-Message-State: ALyK8tI41cbEEy9Rgn46zF78Epn7375LxuRfLubWq/T4pGAg8ObBzUNk25dV0MZHnvafOA==
X-Received: by 10.98.56.86 with SMTP id f83mr35410120pfa.83.1466609405862;
	Wed, 22 Jun 2016 08:30:05 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id qc16sm811450pab.1.2016.06.22.08.30.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Jun 2016 08:30:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Wed, 22 Jun 2016 08:29:58 -0700
Message-Id: <1466609398-17634-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1466609398-17634-1-git-send-email-akuster808@gmail.com>
References: <1466609398-17634-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/2] build summary: add TCLIBC being used
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
X-List-Received-Date: Wed, 22 Jun 2016 15:30:07 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 7132922..c575f55 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -650,7 +650,7 @@ PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
 
 # Pre-build configuration output
 BUILDCFG_HEADER = "Build Configuration:"
-BUILDCFG_VARS = "BB_VERSION BUILD_SYS NATIVELSBSTRING TARGET_SYS MACHINE DISTRO DISTRO_VERSION TUNE_FEATURES TARGET_FPU GCC_VERSION"
+BUILDCFG_VARS = "BB_VERSION BUILD_SYS NATIVELSBSTRING TARGET_SYS MACHINE DISTRO DISTRO_VERSION TUNE_FEATURES TARGET_FPU GCC_VERSION TCLIBC"
 BUILDCFG_VARS[type] = "list"
 BUILDCFG_NEEDEDVARS = "TARGET_ARCH TARGET_OS"
 BUILDCFG_NEEDEDVARS[type] = "list"
-- 
2.3.5


