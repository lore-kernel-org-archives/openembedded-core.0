Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 09321770C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 01:43:44 +0000 (UTC)
Received: by payp3 with SMTP id p3so22765444pay.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 18:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=b20VY2e3dBZef/L2V6vSYhf3YCXtkzwqBJTymaCZEAM=;
	b=BoAJ+Mziqy6VG2+beplkYDscCrnz/+5uj3vYv7AUHpBbndl+dTlepYSgByjnq24mas
	qqJ/Loe0gkM29KyXe/16OyB79cmGuACOKSfqF9tT2l3EcZaz9DGgDeJ584WJ1QNWL07N
	OHE8PTbxaQeJN/UKb25aJMFEajWqCc5R2FQCigd7lvt8fzsJ4QhwUGSHsYMXJEPlWJ1Z
	odm1S70lTAQop37X5I0hM333XRIK8LK1/iBcnkICsUSYnbyrflPjO71Z5xmzfmGzjINN
	sF2yiALESzleVXX2+K3jv7b49FeNS6wC4aZUcy+gCQNAAKuFp8aIE5a4Y6bOAaLJWHxt
	OAGQ==
X-Received: by 10.66.222.70 with SMTP id qk6mr7067964pac.68.1444873425320;
	Wed, 14 Oct 2015 18:43:45 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	z6sm11928971pbt.51.2015.10.14.18.43.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Oct 2015 18:43:44 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Oct 2015 18:43:14 -0700
Message-Id: <1444873403-21093-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1444873403-21093-1-git-send-email-armccurdy@gmail.com>
References: <1444873403-21093-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 02/11] busybox.inc: don't export EXTRA_OEMAKE
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
X-List-Received-Date: Thu, 15 Oct 2015 01:43:45 -0000

EXTRA_OEMAKE is private to OE and shouldn't be exported to
the busybox build.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 4d4709a..235bda2 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -17,7 +17,8 @@ BUSYBOX_SPLIT_SUID ?= "1"
 
 export EXTRA_CFLAGS = "${CFLAGS}"
 export EXTRA_LDFLAGS = "${LDFLAGS}"
-export EXTRA_OEMAKE += "'LD=${CCLD}'"
+
+EXTRA_OEMAKE += "'LD=${CCLD}'"
 
 PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
 
-- 
1.9.1


