Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.2701.1589363366104074693
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 02:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 04D9nPfi003234
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 02:49:25 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Wed, 13 May 2020 02:49:24 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/6] fs-perms-persistent.txt: renamed from fs-perms-persistent-log.txt
Date: Wed, 13 May 2020 17:48:43 +0800
Message-ID: <20200513094847.14326-3-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513094847.14326-1-changqing.li@windriver.com>
References: <20200513094847.14326-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

since we use one variable VOLATILE_DIR to control the volatile,
rename the filename to make it common

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../{fs-perms-persistent-log.txt => fs-perms-persistent.txt}    | 2 --
 1 file changed, 2 deletions(-)
 rename meta/files/{fs-perms-persistent-log.txt => fs-perms-persistent.txt} (95%)

diff --git a/meta/files/fs-perms-persistent-log.txt b/meta/files/fs-perms-persistent.txt
similarity index 95%
rename from meta/files/fs-perms-persistent-log.txt
rename to meta/files/fs-perms-persistent.txt
index 3a7cf3ab94..9ca9571e6e 100644
--- a/meta/files/fs-perms-persistent-log.txt
+++ b/meta/files/fs-perms-persistent.txt
@@ -47,7 +47,6 @@ ${oldincludedir}	0755	root	root	true	0644	root	root
 # Links
 ${localstatedir}/run	link	/run
 ${localstatedir}/lock	link	/run/lock
-${localstatedir}/tmp	link	volatile/tmp
 
 /home				0755	root	root	false - - -
 /srv				0755	root	root	false - - -
@@ -57,7 +56,6 @@ ${localstatedir}/local		0755	root	root	false - - -
 # Special permissions from base-files
 # Set 1777
 /tmp				01777	root	root	false - - -
-${localstatedir}/volatile/tmp	01777	root	root	false - - -
 
 # Set 0700
 ${ROOT_HOME}			0700	root	root	false - - -
-- 
2.17.1

