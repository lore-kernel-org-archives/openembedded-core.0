Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tjf6M-0003m5-16
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Dec 2012 00:55:34 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so2447079pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 15:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+hHrAyi2wCWbLJiPgoJdzZP58pvxTKAx9Qk8uYtdzRI=;
	b=ivrsOfm+u/c/yGm1greN+am3PgSjJZy+b14o5ZuT9exEjc2DiNALaaL7p8x1DpeWYQ
	6N+niyFRmoj2Y05pmdRxg6pif1qsUPUZboH6FOK7lLhkWf3OKPmeDcejsOIio3SBc0Wm
	7X16jN2ya7j/TloVwNQb8J4prxqOApF6tJXw3PiPR5rDS1aVMallEAThX1NnQbhFsiOB
	aESxtOUd9xIJFxB1aqZhXabBvViRWbQv6or/c0vpdopgTH7h17UqtygyuEFJ+XCOkYu8
	jNuKgLg6K/8zeZ8PgZWeePU0bgCiTQ+WEkQICn5E5FzAPcafYMzeGUWtnsNiuv1TEyiw
	oFYQ==
Received: by 10.66.79.163 with SMTP id k3mr19966702pax.60.1355528456586;
	Fri, 14 Dec 2012 15:40:56 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id kb3sm3673603pbc.27.2012.12.14.15.40.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 15:40:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Dec 2012 00:40:42 +0100
Message-Id: <6f66c4d3bf4444f3dac8a2f1dc325609c7eec7fc.1355475937.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355475937.git.Martin.Jansa@gmail.com>
References: <cover.1355475937.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355475937.git.Martin.Jansa@gmail.com>
References: <cover.1355475937.git.Martin.Jansa@gmail.com>
Subject: [PATCH 04/10] bitbake.conf: exclude DATETIME var dependency from IMAGE_NAME
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
X-List-Received-Date: Fri, 14 Dec 2012 23:55:34 -0000

* resolves ERROR shown when bitbake -S is used for image:
  ERROR: Bitbake's cached basehash does not match the one we just generated
  (/OE/oe-core/openembedded-core/meta/recipes-core/images/core-image-minimal.bb.do_rootfs)!
  ERROR: The mismatched hashes were 8c35cdf8a5d09c03941f081dd9f6d8dc and b5d6e2e5952770557c48c5779ddb73fc

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index be3bfc2..578c29f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -407,6 +407,7 @@ STAGING_KERNEL_DIR = "${STAGING_DIR_HOST}/usr/src/kernel"
 IMAGE_ROOTFS = "${WORKDIR}/rootfs"
 IMAGE_BASENAME = "${PN}"
 IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}-${DATETIME}"
+IMAGE_NAME[vardepsexclude] += "DATETIME"
 IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
 
 # This option allows for a percentage overage of the actual image size rather than a
-- 
1.8.0.2



