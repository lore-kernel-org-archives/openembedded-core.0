Return-Path: <gary.robertson@linaro.org>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 41DCA65D52
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Apr 2014 20:13:21 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id wn1so2170296obc.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Apr 2014 13:13:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nYAkofEwMPOjwKiOvkOQfu68dQYD6jOYefVM2ph46M0=;
	b=bJqESg3QVH8407cppf5Wy2b7yTC6y7DV2F2ZiZIJ4/9+59TOu7vkgiQ71IkCcFSv2v
	GdvHNhTE6iA55Z1HZOJuOZEcBaVdWrTBK7vywlqsyoleuP9QOX/7fWG8XuJGLnYhC+Xe
	t2buBg7+vn/riO3rNdI4AfhAdLo0inMle+TyBI3srYJkvjvIGXJlWTTONptkJuI9MGGc
	5ssECe6FTyralva3bf5LoczhMObp8Q5rcMp+dO9Fj+zqtuFwoGhfEECgT7j/dmKvY202
	JenT9oGqN7dyoBkJWXOcMpXSFuyWGj3YAQtPBiVOiA5NC3ysKbXKzdX8T+1uEVxTwsVL
	o6KA==
X-Gm-Message-State: ALoCoQnGTCjlQ3QPd6Lswp8DrD/BdcT9CyDz9wXW1HCFUH9wQpcXPLNypEeve7nlufib3DnD2jv1
X-Received: by 10.60.140.201 with SMTP id ri9mr52146oeb.74.1397852002871;
	Fri, 18 Apr 2014 13:13:22 -0700 (PDT)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114])
	by mx.google.com with ESMTPSA id l5sm54477420obh.15.2014.04.18.13.13.20
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 18 Apr 2014 13:13:22 -0700 (PDT)
From: gary.robertson@linaro.org
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Apr 2014 15:12:46 -0500
Message-Id: <1397851967-24110-2-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1397851967-24110-1-git-send-email-gary.robertson@linaro.org>
References: <1397851967-24110-1-git-send-email-gary.robertson@linaro.org>
Cc: mike.holmes@linaro.org, clark.williams@gmail.com
Subject: [PATCH] rt-tests: bump version 0.87 => 0.89
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
X-List-Received-Date: Fri, 18 Apr 2014 20:13:24 -0000

From: Anders Roxell <anders.roxell@linaro.org>

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
---
 meta/recipes-rt/rt-tests/rt-tests.inc              |    7 ++-----
 .../{rt-tests_0.87.bb => rt-tests_0.89.bb}         |    0
 2 files changed, 2 insertions(+), 5 deletions(-)
 rename meta/recipes-rt/rt-tests/{rt-tests_0.87.bb => rt-tests_0.89.bb} (100%)

diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 81f4f2b..1d876b0 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,10 +1,7 @@
-# Version v0.87
-SRCREV = "b0413ae5ed802004fb0c4af74a1757381fd2b91f"
+# Version v0.89
+SRCREV = "9164ec4db2645f52ffdd20e6d1b72bb0411ab40e"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git \
-           file://0001-rt-tests-Allow-for-user-specified-PYLIB.patch \
-           file://0002-rt-tests-Break-out-install_hwlatdetect.patch \
-           file://added-missing-dependencies.patch \
            file://hackbench-fix-error-check.patch \
 "
 
diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.87.bb b/meta/recipes-rt/rt-tests/rt-tests_0.89.bb
similarity index 100%
rename from meta/recipes-rt/rt-tests/rt-tests_0.87.bb
rename to meta/recipes-rt/rt-tests/rt-tests_0.89.bb
-- 
1.7.9.5


