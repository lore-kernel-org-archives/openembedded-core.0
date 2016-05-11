Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 45A0A731EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:11 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id gh9so4054233pac.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=CBCEh5t0vyjZUx8G3NlpeGzOOEzYfjWrQnw/dQ9xIzI=;
	b=T2Hc1GzQxLC/z0CXr7cCGDfgy3lCP7Its7odRemsGtNEmjmwajbCo4/tSLdkKxAw5G
	OfVpf8s2wvPNlWQY8YFAz8WO5F1mpAG1okFggC+iI7uQsCAEHCQ8kKT6klWgZwEVoNmJ
	8beNCpC9oA4UVvjy/t/NksGu3Hr/ygCtVqXGTXoLhT/XALafcrx+5tX7Vf/B5BJQn9oh
	WTb6KBxUiNgHQ5Dgxyxo7xJHOph38dbr4aJhFRrHBTw4LHixCRmddV+WAhUopy4PYd8R
	dNEy+4lXqweoduf8nlTRIvgGIBPIB3SYabO5H1nD9BI8xo7VWZJDCgB6pQ5m5tkcoYEI
	rS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=CBCEh5t0vyjZUx8G3NlpeGzOOEzYfjWrQnw/dQ9xIzI=;
	b=Jzms6jGy3y8c402ixqJ+J5Ny+SjqP30VylptXZg+rLI8qY2lzDAWQzxVnBr4SrpzkC
	rcZJ91tiG/gu5LGWTJgLRoVgGhDgKvxMWw+6oni0RjRlT6D80CDR0qJLLOkLA56Kl3fu
	F9rgrPXrssytY1wE+/pECcoWLyf+uzbefIYci5X/gf7AfAMeikiGB4RvrKQAkC9tfAbm
	0VOBMBqG2NirDUFYQuYvNw1oRwyv5KTaL9sOdFne3VFZ/S3iW3qYR0XxpnKTkHc/q4VL
	GnfffXaik0Vac5FMYH+BxkLMXIuUYVVf2oT5jTyKNDQNmTQAk2oT96XF8XR3BekFvEs1
	OPQg==
X-Gm-Message-State: AOPr4FUehS+1gi83Z/DcF6Byu31n1aJuQlMhq1oOEI4ONR7YdfvunM7t5LcAnjBcjPFPUg==
X-Received: by 10.66.78.104 with SMTP id a8mr6855753pax.88.1462988173029;
	Wed, 11 May 2016 10:36:13 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:23 -0700
Message-Id: <794f2e0d0822cf5660ce66139cd1777ed4fbecfc.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 20/42] grub_git: Upgrade to latest tip
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
X-List-Received-Date: Wed, 11 May 2016 17:36:12 -0000

Gets past the gcc6 issues seen on aarch64
| make[3]: *** [cmp.mod] Error 1
| build-grub-module-verifier: error: unsupported relocation 0x113.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/grub/grub_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
index 8f8c5ed..7a900d0 100644
--- a/meta/recipes-bsp/grub/grub_git.bb
+++ b/meta/recipes-bsp/grub/grub_git.bb
@@ -8,7 +8,7 @@ DEFAULT_PREFERENCE_arm = "1"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/grub-git:"
 
 PV = "2.00+${SRCPV}"
-SRCREV = "b95e92678882f56056c64ae29092bc9cf129905f"
+SRCREV = "7a5b301e3adb8e054288518a325135a1883c1c6c"
 SRC_URI = "git://git.savannah.gnu.org/grub.git \
            file://0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch \
            file://autogen.sh-exclude-pc.patch \
-- 
2.8.2


