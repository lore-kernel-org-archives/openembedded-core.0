Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.7449.1614915764627744091
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 19:42:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1253gWBn025110
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Mar 2021 19:42:38 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 4 Mar 2021 19:42:16 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Thu, 4 Mar 2021 19:42:16 -0800
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [dunfell][PATCH 0/1] Pull request (cover letter only)
Date: Fri, 5 Mar 2021 11:42:12 +0800
Message-ID: <20210305034212.5733-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Hi,

Please cherry pick a commit to fix Yocto #14152:

commit a5b9fa3c450af3beac5f1b68797a1d044091fbbe (HEAD -> dunfell)
Author: Chen Qi <Qi.Chen@windriver.com>
Date:   Fri Oct 16 12:58:56 2020 +0800

    cups: use /run instead /var/run in systemd's unit file

    /var/run has been deprecated by systemd, so use /run instead,
    as suggested by systemd.

    (From OE-Core rev: 6c3f56020da7a26c2daea73e39c2f324f1f597db)

    Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>


Chen Qi (1):
  cups: use /run instead /var/run in systemd's unit file

 meta/recipes-extended/cups/cups.inc | 1 +
 1 file changed, 1 insertion(+)

-- 
2.17.1

