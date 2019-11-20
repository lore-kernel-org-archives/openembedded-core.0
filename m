Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7C7447CE27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 13:45:00 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id a15so28217971wrf.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 05:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9AITOXBWl78SYYr2kuS8tQeBoi6uw4yAEghPhRbxm70=;
	b=R0pvXrf+whWQJFS/zrfo2rxmZjhrg6Rt/5jUtFeTAGeuvI5aICRcOx5fh6vmNnkJRR
	FJiKukKv/xYNrxTwngj27wcnA+ok78FcRKdGMc/adTG75tuZk1rEQrEDnG5YB4yyRLyG
	0D+IoHYkum+IgAdCRAXpRjR0/il2wGyCGxj6pVwKTRk2jdyFof6rHGWdIYIvsYKMLXVQ
	ehoYrHTkq4oETVPkOx/bmvO+nSzRtq9He6cqVF+9668JjFfCj2HM7p40xOWve1Avn6lJ
	S6kxI407KvWhbMqxGRMqq5/biSc1NNlf+bpPYbCU2ziIe6aZDImZqrxEbylEM7Zk8vAC
	rWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9AITOXBWl78SYYr2kuS8tQeBoi6uw4yAEghPhRbxm70=;
	b=PIQR2QlRSpVpdG2CVcdKs/qCY3rBMNkk60j7zcY53LnmuhSZsL1GbzBv1NdF2XKHvK
	nKiPaTe7OdQQy73a+swFKd5mIYM6FPJiMv84aJnvrQoPVmyVkonFy+mDkEn0qoCGCjIc
	gDVqINOx522j3Ps3eA8j7gLw+1faOXCbc3e/3Y6c0CMvPwU0f5qJHjSJhjocXBpBAh5+
	gqr4FbBj/+JTWCwd4MunI6qvdB1u1tLls7T6snzJPfpEw962Mu4NQjlJZTGdyO0NCRyK
	imzRHD6H91dqtSFrSq7+oh7mS030NrRBIQjqiFZYXrqljnKN9K/GCRyHyskdeFgHTPf7
	QdDg==
X-Gm-Message-State: APjAAAVFpenHpVbUEMwqInpyS3lHnpmsFJKm26COn/WruKHIyHCbBT4g
	c1odWJGnzRRZGsohmI1NzBQ0MrVe
X-Google-Smtp-Source: APXvYqwLFDyi7f1xoo8lBhQraAthZAPdtTFaO37NYr0RrQn2fVK0k36CDMJu7dwALyg16njV+Ia/8Q==
X-Received: by 2002:a5d:638a:: with SMTP id p10mr3277841wru.336.1574257501018; 
	Wed, 20 Nov 2019 05:45:01 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	o189sm7031771wmo.23.2019.11.20.05.44.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 20 Nov 2019 05:45:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 14:44:45 +0100
Message-Id: <20191120134455.125118-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 01/11] man-pages: correct the SRC_URI
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
X-List-Received-Date: Wed, 20 Nov 2019 13:45:00 -0000

The homepage: https://www.kernel.org/doc/man-pages/download.html
specifies that the latest tarballs are published one level up
from where we currently take them.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/man-pages/man-pages_5.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/man-pages/man-pages_5.01.bb b/meta/recipes-extended/man-pages/man-pages_5.01.bb
index 28525f4ba7e..ea1249e4396 100644
--- a/meta/recipes-extended/man-pages/man-pages_5.01.bb
+++ b/meta/recipes-extended/man-pages/man-pages_5.01.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
 LICENSE = "GPLv2+"
 
 LIC_FILES_CHKSUM = "file://README;md5=794f701617cc03fe50c53257660d8ec4"
-SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
+SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
 
 SRC_URI[md5sum] = "38abead776a506109e128ab96bcbbe58"
 SRC_URI[sha256sum] = "070bef794c6826b3fb3965d1a2efdb46c25cb37c06c715987f88a50906cd5b6f"
-- 
2.17.1


