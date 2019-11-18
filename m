Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 460DE7FA37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 14:32:12 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id e6so19781858wrw.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 06:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9AITOXBWl78SYYr2kuS8tQeBoi6uw4yAEghPhRbxm70=;
	b=tNeBeDqCOy4qzrcZo89xOqBy6TKgll6MdUIx37iqwxKHdyFen7tXjLr0HwejFuXZfz
	pp23YMePxaZwXGYVlWRiUqRBo2zd1TzAJdGM5T9v+JKmiOYN/DBjgd/k4KAF/iFuwr95
	gVZSuq2wvX3cRPGHKDnhcbqO+IGNlkfIInE5qVaTKLc0VdkO8/8qKXmIsYHy5JTE9vKH
	diByFEwXYroq8xyoWiv65wbzTwczWhOjQZborMxA2OvFfNKhP8OLCtqTi8q/njF17M7j
	zQIeU0h/bP49WXrVZnEPioYwRLkW4PuQRyWxY15DrUmf0hmMB4cdxv/SCQTmYN2G79XN
	PkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9AITOXBWl78SYYr2kuS8tQeBoi6uw4yAEghPhRbxm70=;
	b=hY6iGWZacxSHY1uuVDHDXs68uEzuxHZQrM8R61LsU8R8j0i94MEXD7Kcde0C+h231Z
	jclpLKbdjijblijL8Z148eL/2Qoko+AHRt4wIwNcDtNssrbxDRzPqajf5IOZ5QAFPACx
	ToJ4RrD6Df2qNypZSRmsgGH90fQhIhFCdRDbAFHQ4kM5xCrObeWrSne/4OmnngydaQl5
	CRujDrMrBTSOquqU1y3HxRVsqEKfDtxqd8aw+P+hlSKNE6ltQZ06q9VRSwiDPmJ/GqjJ
	Y1KrPZLVlksk4UUp5ARIVGSXacafzW58kxAxQPzaqGlrMmb/vH2h+E175npxO4YSU/RM
	P/ug==
X-Gm-Message-State: APjAAAXdG1nc9SBQ6FmZLlYqVPaSekkWkoFc3QvagoaGXVBvJTx/TT+3
	cPnpte9fLfaa1gYr31q4aCj6yzc6
X-Google-Smtp-Source: APXvYqzW1onssm78z3kNUj0mbB3DHOsN2Y9nBWj8zyEOzLzk7p2zqLKtRElKS+6GqIdKcK6C53hZeQ==
X-Received: by 2002:adf:dc8d:: with SMTP id r13mr14235808wrj.391.1574087532405;
	Mon, 18 Nov 2019 06:32:12 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	f24sm20097324wmb.37.2019.11.18.06.32.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 06:32:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 15:28:52 +0100
Message-Id: <20191118142852.22981-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118142852.22981-1-alex.kanavin@gmail.com>
References: <20191118142852.22981-1-alex.kanavin@gmail.com>
Subject: [PATCH 13/13] man-pages: correct the SRC_URI
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
X-List-Received-Date: Mon, 18 Nov 2019 14:32:12 -0000

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


