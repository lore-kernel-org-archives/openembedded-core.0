Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.2476.1600758173410616011
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2020 00:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 08M72qqY012976
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2020 00:02:52 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Tue, 22 Sep 2020 00:02:36 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] systemd: disable xdg-autostart generator by default
Date: Tue, 22 Sep 2020 15:02:32 +0800
Message-ID: <20200922070233.31752-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

xdg-autostart generator is an opt-in feature which is imported by commit:

470c58ba45 systemd: Upgrade v245.6 -> v246

The generator outputs unexpect log info on terminal when log in a image
which includes an X desktop such as Xfce. So add an package config and
disable it by default.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/systemd/systemd_246.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_246.2.bb b/meta/recipes-core/systemd/systemd_246.2.bb
index 238cd4741f..e555a5718a 100644
--- a/meta/recipes-core/systemd/systemd_246.2.bb
+++ b/meta/recipes-core/systemd/systemd_246.2.bb
@@ -185,6 +185,7 @@ PACKAGECONFIG[userdb] = "-Duserdb=true,-Duserdb=false"
 PACKAGECONFIG[utmp] = "-Dutmp=true,-Dutmp=false"
 PACKAGECONFIG[valgrind] = "-DVALGRIND=1,,valgrind"
 PACKAGECONFIG[vconsole] = "-Dvconsole=true,-Dvconsole=false,,${PN}-vconsole-setup"
+PACKAGECONFIG[xdg-autostart] = "-Dxdg-autostart=true,-Dxdg-autostart=false"
 # Verify keymaps on locale change
 PACKAGECONFIG[xkbcommon] = "-Dxkbcommon=true,-Dxkbcommon=false,libxkbcommon"
 PACKAGECONFIG[xz] = "-Dxz=true,-Dxz=false,xz"
-- 
2.17.1

