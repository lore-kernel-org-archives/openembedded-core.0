Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f171.google.com (unknown [209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3DD9465F99
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 12:23:07 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id 10so726198lbg.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 05:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=18WhijoeUrmU888F3wtx2H04cgN1fUeoA6TUT+8K+eI=;
	b=0C/PN6kmiUD1hXRw0Np1qF2DlRla7K8gxvfKsUsLczGwn3/zN7bS2Zgxiu47/flzDg
	DzESnYMYGxyULZil1S3BlG9/M7PWN/YeIc3GmCvtJFdURJytO7sk95bMhLolb2zvBbLK
	VR1sFYPviY4BKDwqqFMzxq0rNhbgBZaJcbsYyLcXmGrw5dQZgVTE7IT0LDGQLRdsOyXx
	LXq8W0QLPbvKHdaIArc4CSOmt/3Cgorqxqo7NuOqY9bfQM9UFVp2GwdSqO89tDUosrOD
	QCauIXi/SOUSii/oEyRVx9oZvhw4Xy49SiPdVjlzlHKP9JqANLBXuYQxrXVWnMs7rzPb
	bx0g==
X-Received: by 10.113.3.167 with SMTP id bx7mr1318993lbd.64.1400156587767;
	Thu, 15 May 2014 05:23:07 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id k8sm5904353lae.1.2014.05.15.05.23.06
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 May 2014 05:23:06 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 May 2014 14:23:36 +0200
Message-Id: <1400156616-11897-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <20140515121032.GD2433@jama>
References: <20140515121032.GD2433@jama>
Subject: [daisy][PATCHv2] lttng-modules: Add bio-bvec-iter.patch also for 2.3.3 version
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
X-List-Received-Date: Thu, 15 May 2014 12:23:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb b/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
index dd06546..4f18ddc 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
@@ -14,7 +14,8 @@ SRCREV = "eef112db0e63feff6cbf0a98cda9af607cefb377"
 PV = "2.3.3"
 
 SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.3 \
-           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
+           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
+           file://bio-bvec-iter.patch"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 export KERNEL_SRC="${STAGING_KERNEL_DIR}"
-- 
1.9.3


