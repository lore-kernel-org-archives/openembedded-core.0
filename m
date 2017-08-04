Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id E664172FB0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Aug 2017 02:56:56 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id x64so4237361wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Aug 2017 19:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KBye+B01q+FFVU+XqvLLT6vdIkyJCMKE4Z9T+6BmMm4=;
	b=kw3PBa859d9t3ATiCozM4t1YBJAwzbxMGjLVjHhwbSj6jCSUU3sQKuLs2kEL0gjQIV
	qdnvw9lD0No2c5zAqed8ZebDlnLToJJA0PqiTgHOzQ1wEdKIK0Fx/AC5vEoewPPVcOT0
	2c5A+v9+UungqwK7XW9B0Z61fKcILpe43kJwzD3JYRvov8ci6v0s+DvW95ek0q4+cJgK
	HR+idHNORmEeasVDUysFC320oymaedQnP/ahxgy24Xru8Y1O+5wMKKb5ovQdzx75/pNi
	Wni6yU++LujE/dwqIat8ru2gOIWm7KUKAvuUYtQgLARqj3jMPxlmdrdsQvrFc5x9ocsi
	MjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KBye+B01q+FFVU+XqvLLT6vdIkyJCMKE4Z9T+6BmMm4=;
	b=J//xcSsMU0L5dxw+eRJe3ypSzkgn7gzyimVCW9i7LybgDqDJbxA/aAF/1wHrkao0Cd
	BGft/c+zoDXROATY8Y2ExBgvrSZJL/CGL2B2a59ATeed1+Yj/b1xuLlZnoXgMPdLZaP/
	UYN4I9JF8Hy/MAK27rzK3Jzcd7oh8+Od6nD+RiWKa49cXlEF0JBF+lcsVUPuNH0MOGL5
	3fGtn38b2K+G7YpU4g4QWNIietWpTagbF8U9Ef9MOUA3ei9v72/075vC6aKMgcqR62JP
	zTbWhh3m+n3v+RV4dYSlX78UPaI6qhwx/NHFiRDmjkJHI4dV0bSnTL4nK+TRIGIREme4
	veLQ==
X-Gm-Message-State: AIVw110ug1Ilwhb8LTVHdbOv5avqZJr4gEbKDCj2I4adT2ur9IeMt95Y
	bQ7DUhk4seMjzDnO
X-Received: by 10.80.153.38 with SMTP id k35mr972107edb.63.1501815417394;
	Thu, 03 Aug 2017 19:56:57 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.201.186]) by smtp.gmail.com with ESMTPSA id
	b10sm1984131edl.74.2017.08.03.19.56.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Aug 2017 19:56:56 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Aug 2017 04:56:30 +0200
Message-Id: <1501815391-8192-4-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501815391-8192-1-git-send-email-liu.ming50@gmail.com>
References: <1501815391-8192-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH V2 3/4] qemux86-64.conf: set WKS_FILE_DEPENDS
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
X-List-Received-Date: Fri, 04 Aug 2017 02:56:57 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

To involve in a minimal set of dependencies required by directdisk.wks.

Drop do_image_wic depends varflags, it's not needed any more.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/conf/machine/qemux86-64.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 10189cb..8fb9fd5 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -30,4 +30,4 @@ MACHINE_FEATURES += "x86"
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
 
 WKS_FILE ?= "directdisk.wks"
-do_image_wic[depends] += "syslinux:do_populate_sysroot syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
+WKS_FILE_DEPENDS ?= "syslinux syslinux-native mtools-native dosfstools-native e2fsprogs-native parted-native"
-- 
2.7.4


