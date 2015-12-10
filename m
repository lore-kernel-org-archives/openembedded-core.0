Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD0673183
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:47:13 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id w144so24575696wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=LYCCK1gYjK6lxlbEwLrO9scaMzMR8D4P3K7vACQFJGE=;
	b=Vo62D1giPbYsIi828uxxX2Dq2FHy+F8Zr6xcOTcZm8g3U+8qRvkgmC8jI/eF2my8u3
	u/jjuxOQzm4hSDscH9eWzr18uylpn9woW+uEvHkm3s08GQeN/U4LX06SoC0VsO4QOvHP
	DUewGLHyGWOzCyPGPAykjuRyiSUja1K21q6/aGACz8VumIJAWwUYsAm5g1vgzLunELoj
	mmMGjG2rPpFZEgjpLjY57RJE+JSYSJ776uF4lru4MDMDhOEYtHYvJnO9MMl0mqsH46lC
	ONm5n0kVS2znsTx1Bvi2/VDdG86Phj8U2NSKVWdMsHK9ySB223EcI2fxzQ3s8OvmmN/K
	nC8Q==
X-Received: by 10.28.213.72 with SMTP id m69mr19585447wmg.101.1449755234504;
	Thu, 10 Dec 2015 05:47:14 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	kj3sm12470915wjb.19.2015.12.10.05.47.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:47:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:39 +0100
Message-Id: <aff277ae23c033ab2337bde789328c1bb111134c.1449754344.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
Subject: [PATCH][master][RESEND 02/15] tune-cortexr4.inc: fix PACKAGE_EXTRA_ARCHS
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
X-List-Received-Date: Thu, 10 Dec 2015 13:47:14 -0000

* PACKAGE_ARCHS were missing TUNE_PKGARCH armv7rt2-vfp because thumb is enabled
  in TUNE_FEATURES

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/tune-cortexr4.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-cortexr4.inc b/meta/conf/machine/include/tune-cortexr4.inc
index a04573c..177d2d5 100644
--- a/meta/conf/machine/include/tune-cortexr4.inc
+++ b/meta/conf/machine/include/tune-cortexr4.inc
@@ -11,4 +11,4 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7r', ' -march=armv7-r
 AVAILTUNES += "cortexr4"
 ARMPKGARCH_tune-cortexr4 = "armv7r"
 TUNE_FEATURES_tune-cortexr4 = "armv7r vfp cortexr4 arm thumb"
-PACKAGE_EXTRA_ARCHS_tune-cortexr4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7r-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexr4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7r-vfp armv7rt2-vfp"
-- 
2.6.3


