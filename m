Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.3790.1615345813711044029
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 19:10:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 12A3A1tB013641
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Mar 2021 19:10:06 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 9 Mar 2021 19:10:00 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Tue, 9 Mar 2021 19:10:00 -0800
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [dunfell][PATCH] cups: use /run instead /var/run in systemd's unit file
Date: Wed, 10 Mar 2021 11:09:56 +0800
Message-ID: <20210310030956.12275-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

/var/run has been deprecated by systemd, so use /run instead,
as suggested by systemd.

[Yocto #14152]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6c3f56020da7a26c2daea73e39c2f324f1f597db)
Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/cups/cups.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 12780cf702..acad3c98c1 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -54,6 +54,7 @@ EXTRA_OECONF = " \
                --enable-libusb \
                --with-system-groups=lpadmin \
                --with-cups-group=lp \
+               --with-domainsocket=/run/cups/cups.sock \
                DSOFLAGS='${LDFLAGS}' \
                "
 
-- 
2.17.1

