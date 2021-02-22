Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
 by mx.groups.io with SMTP id smtpd.web11.36559.1614009065074793989
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 07:51:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.28, mailfrom: andrej.valek@siemens.com)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 11MFp1iN021218
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Feb 2021 16:51:01 +0100
Received: from dev.vm6.ccp.siemens.com ([144.145.220.53])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id 11MFp1A7027641;
	Mon, 22 Feb 2021 16:51:01 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id DCBFE9508F2;
	Mon, 22 Feb 2021 16:51:00 +0100 (CET)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: richard.purdie@linuxfoundation.org,
        openembedded-core@lists.openembedded.org
Cc: open.source@oleksandr-kravchuk.com, alex.kanavin@gmail.com,
        Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH] busybox: search stable versions for AUH
Date: Mon, 22 Feb 2021 16:49:56 +0100
Message-Id: <20210222154956.27267-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/recipes-core/busybox/busybox.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 47fcb59302..253168e2b9 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -13,6 +13,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb \
 
 SECTION = "base"
 
+UPSTREAM_CHECK_URI = "https://busybox.net/"
+UPSTREAM_CHECK_REGEX = "BusyBox\ (?P<pver>\d+\.\d+\.\d+)\ \(stable\)"
+
 # Whether to split the suid apps into a seperate binary
 BUSYBOX_SPLIT_SUID ?= "1"
 
-- 
2.11.0

