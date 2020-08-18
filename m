Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.60687.1597729377502763238
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 22:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: li.zhou@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 07I5gpJb000528
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2020 22:42:52 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 17 Aug
 2020 22:42:27 -0700
From: "Li Zhou" <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] connman-conf: make connman-conf only available for qemuall
Date: Tue, 18 Aug 2020 13:41:41 +0800
Message-ID: <1597729301-189377-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Content-Type: text/plain

connman-conf is only for qemu machines, so use COMPATIBLE_MACHINE
to limit that it is only available for qemuall, or else it can be
built successfully without the package connman-conf generated.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 meta/recipes-connectivity/connman/connman-conf.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
index 9a519ec..3a6c525 100644
--- a/meta/recipes-connectivity/connman/connman-conf.bb
+++ b/meta/recipes-connectivity/connman/connman-conf.bb
@@ -34,3 +34,5 @@ do_install() {
 }
 
 SYSTEMD_SERVICE_${PN}_qemuall = "wired-connection.service"
+COMPATIBLE_MACHINE = "null"
+COMPATIBLE_MACHINE_qemuall = "${MACHINE}"
-- 
1.9.1

