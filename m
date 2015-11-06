Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 82F8E76F58
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 08:47:25 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so92300119pac.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 00:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7eKZuS+7kgVvLsrKaKby13Auc8qrSSU8DUUBled/a+s=;
	b=Oht/PF2pid/0fGsAvQOs4148k3mdC5IRq5GGpvX/kSmpWli3CDxxJVz/hCOfMyP/aS
	ffkowbkMozNqdoShwl/zXyafK4J0Mzni4wzeFzdN8IZuMkBrYcGPQAB8oKfU7Mr5pPGf
	RXifRFsC/lcksvgUgLjrtt66+GuYGW6oTb0rAHmDZoB1EKVHi2A2RGdywY9iH2zQO4j6
	1pn7SdMFvCeiTq8xL4kHBYyTvK2ANto/ZJzGmQwFBVrZ3SHVdDk0QfzSyUyiLRCA84Ig
	YHFyH6mzgHyoi2pk4q7oAd1xQ8copsZjBoAMyMsq58r8uWJuloTFQkkdEaEx1aRJqTbc
	vCHg==
X-Received: by 10.66.122.145 with SMTP id ls17mr16415306pab.11.1446799645513; 
	Fri, 06 Nov 2015 00:47:25 -0800 (PST)
Received: from e6520.gateway.sonic.net
	(173-228-90-44.dsl.dynamic.fusionbroadband.com. [173.228.90.44])
	by smtp.gmail.com with ESMTPSA id
	yz3sm12533923pbb.37.2015.11.06.00.47.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Nov 2015 00:47:24 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 00:47:01 -0800
Message-Id: <1446799631-7037-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446799631-7037-1-git-send-email-armccurdy@gmail.com>
References: <1446799631-7037-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 01/11] busybox_git: Enable getopt applet
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
X-List-Received-Date: Fri, 06 Nov 2015 08:47:25 -0000

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


