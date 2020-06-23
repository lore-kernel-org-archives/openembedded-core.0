Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.9367.1592875577397980723
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 18:26:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 05N1QD1Y001103
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Mon, 22 Jun 2020 18:26:13 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Mon, 22 Jun 2020
 18:25:50 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH] libmodulemd: switch branch master -> main
Date: Tue, 23 Jun 2020 09:25:49 +0800
Message-ID: <20200623012549.36428-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain

Upstream delete branch master, and convert it to main

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/libmodulemd/libmodulemd_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
index fda01b8ad8..10204acf23 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "C Library for manipulating module metadata files"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=25a3927bff3ee4f5b21bcb0ed3fcd6bb"
 
-SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https \
+SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=main \
            file://0001-modulemd-generate-the-manpage-only-if-the-feature-is.patch \
            "
 
-- 
2.18.2

