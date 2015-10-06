Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id BFEF276F56
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Oct 2015 03:19:42 +0000 (UTC)
Received: by ioiz6 with SMTP id z6so207611921ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Oct 2015 20:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7eKZuS+7kgVvLsrKaKby13Auc8qrSSU8DUUBled/a+s=;
	b=HfSzWDhM6wptbeT3RgNtr7suW+NGJ9AEtDT0WZCGS3ZFneTDBGGFnu34P6wFnLzZ/p
	duljnIpgcB4Sp/n2kYnCdK0YrcbPhs6yffLtzWznZCzh014n0+MadVrKTbIccbXG6HSW
	7EMcZ+1EtBH+j7MuEqMN/ATzenmMbE63nf+dxb4J87onZIukXEz4KXvYWWUC8lIyF/Ad
	NlXUf3nqH/NRT21n/m4IlqlvRnCVAxlJpYGdFFxS/w3egOjU6nFJWw+TQOzGyXZNuatZ
	IorheL2HBKCuTjZ36AaqBDAuxZCEhFkd4M2U7cO2xk0iUKowsIaqqGTTcUO6MlIEY0dp
	wMAA==
X-Received: by 10.107.30.12 with SMTP id e12mr31942176ioe.57.1444101582574;
	Mon, 05 Oct 2015 20:19:42 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id bc4sm6094425igb.2.2015.10.05.20.19.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Oct 2015 20:19:41 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Oct 2015 20:19:22 -0700
Message-Id: <1444101568-16639-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1444101568-16639-1-git-send-email-armccurdy@gmail.com>
References: <1444101568-16639-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/7] busybox_git: Enable getopt applet
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
X-List-Received-Date: Tue, 06 Oct 2015 03:19:42 -0000

Keep git recipe in sync with 1.23.2:

  http://git.openembedded.org/openembedded-core/commit/?id=10c2c484d5916ad476ad7717c3629f6684f01e6d

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index ade72f4..ed1c0a8 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -41,6 +41,7 @@ SRC_URI = "git://busybox.net/busybox.git \
            file://mount-via-label.cfg \
            file://sha1sum.cfg \
            file://sha256sum.cfg \
+           file://getopts.cfg \
 "
 
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
-- 
1.9.1


