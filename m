Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9F13660761
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 21:13:18 +0000 (UTC)
Received: by pacej9 with SMTP id ej9so16810643pac.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Dec 2015 13:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ebn68jRcbNDkL2289zXnFsMebtprtV0CNLLqu1U05zQ=;
	b=a1TL8hkolsFvLRu0XmUL+bneYj5GHcZgA9mGaBJS734iIqHH5YBKpxs3Od+TeFDS3M
	+v+Ts9ua1X4WIYABiwh4PTgDe1J+uD5RAR1meGqq3QyYe5SWf3m9venkyQMGhOXvwVeq
	Ew8PU8bFswYtU4UmYq9AqP8BOQ30l/ZN/lSxHu2OTFHoEzi/aC+X15n8Jpo3OQHt7T71
	KNFhi4rtDzIuvzkaqlt3vqZ1cRbafhoKcTQY1pkLk/yYCbkBVxHkeylr8eI9+msx19uz
	ipof1g7iRx0jCYbJIVzvePLtlv/gxh9NkpzbSa40RU0nCfpjpZdDR8ckr+Trc5ql17YE
	t4UA==
X-Received: by 10.66.55.105 with SMTP id r9mr102952251pap.137.1449004399500;
	Tue, 01 Dec 2015 13:13:19 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	132sm16717999pfc.63.2015.12.01.13.13.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Dec 2015 13:13:17 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Dec 2015 13:13:03 -0800
Message-Id: <1449004383-13762-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] linux-libc-headers.inc: remove '-e MAKEFLAGS=' from EXTRA_OEMAKE
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
X-List-Received-Date: Tue, 01 Dec 2015 21:13:22 -0000

These OE default make flags are not required for KBuild packages.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 566bc1e..ba1bea5 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -49,6 +49,9 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v${HEADER_FETCH_VER}/linux-${PV}.tar
 
 S = "${WORKDIR}/linux-${PV}"
 
+# For the kernel, we don't want the '-e MAKEFLAGS=' in EXTRA_OEMAKE.
+EXTRA_OEMAKE = ""
+
 do_configure() {
 	oe_runmake allnoconfig
 }
-- 
1.9.1


