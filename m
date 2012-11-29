Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TeDVs-0006NS-EB
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 00:27:30 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so5816649eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 15:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Q9jrVeWH0+nb1Ucb3bvfpireUHWmLXRJ6RxFXu+awGc=;
	b=hvWPZF3iFpTqv61QDTeSE+k1CcE6Kad9sOe03Q6RkCYFxYLxiV88TbYsZ1Z5QMcYq3
	pAuJ2yq2TtiVF9J+bi5vtMKpWiyLbNWIar5mk0YXEP6HsCBKR/e61F+h2WfZG6FafaEz
	k+GwcIF3qNV/Pc8hI/NUN0WGb/GzFRzfgf0CCXELFpyGj96AiYuz9Cb6utL4ulNoH5yk
	5YQQUovv9eS02rYAvWfhGpG6ilJkXcPa02UVi0Mj6FTYxNr4Zu3RLGnHqJr9Iarorpny
	ugJdIX3Js+0GjjL6nMALL+msYtBEJrEGlzAIzUR+Bt2GG3dx6LIOBS/SK+RJe7mRe350
	7YAw==
Received: by 10.14.203.2 with SMTP id e2mr87108621eeo.20.1354230788395;
	Thu, 29 Nov 2012 15:13:08 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 43sm6704801eed.10.2012.11.29.15.13.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Nov 2012 15:13:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2012 00:12:34 +0100
Message-Id: <c72488b779d6fe10baff82689d6939993859befe.1354230112.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354230112.git.Martin.Jansa@gmail.com>
References: <cover.1354230112.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354230112.git.Martin.Jansa@gmail.com>
References: <cover.1354230112.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/8] arch-armv5: fix missing thumb TUNE_FEATURE in armv5t-vfp and following tunes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Nov 2012 23:27:33 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv5.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc
index 5ed56bc..c6d4fc1 100644
--- a/meta/conf/machine/include/arm/arch-armv5.inc
+++ b/meta/conf/machine/include/arm/arch-armv5.inc
@@ -25,8 +25,8 @@ ARMPKGARCH_tune-armv5-vfp ?= "armv5"
 ARMPKGARCH_tune-armv5t-vfp ?= "armv5"
 ARMPKGARCH_tune-armv5hf-vfp ?= "armv5"
 ARMPKGARCH_tune-armv5thf-vfp ?= "armv5"
-TUNE_FEATURES_tune-armv5-vfp ?= "armv5 vfp"
-TUNE_FEATURES_tune-armv5t-vfp ?= "armv5 vfp"
+TUNE_FEATURES_tune-armv5-vfp ?= "${TUNE_FEATURES_tune-armv5} vfp"
+TUNE_FEATURES_tune-armv5t-vfp ?= "${TUNE_FEATURES_tune-armv5t} vfp"
 TUNE_FEATURES_tune-armv5hf-vfp ?= "${TUNE_FEATURES_tune-armv5-vfp} callconvention-hard"
 TUNE_FEATURES_tune-armv5thf-vfp ?= "${TUNE_FEATURES_tune-armv5t-vfp} callconvention-hard"
 PACKAGE_EXTRA_ARCHS_tune-armv5-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5} armv5-vfp"
-- 
1.8.0



