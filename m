Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.62028.1629327919143594777
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 16:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 17IN5HQT001817
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 16:05:18 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 18 Aug 2021 16:05:17 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 18 Aug 2021 16:05:16 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] glibc: update to HEAD of release/2.34/master branch
Date: Wed, 18 Aug 2021 19:05:09 -0400
Message-ID: <20210818230509.38342-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update glibc to head of release/2.34/master branch to
to include fixes, includes fix for CVE-2021-38604:

Changelog:
glibc.git$ git log --oneline ae37d06c7d127817ba43850f0f898b793d42aea7...
7c987a5ccb (HEAD, origin/release/2.34/master) librt: add test (bug 28213)
7947430322 librt: fix NULL pointer dereference (bug 28213)
31902ae639 Linux: Fix fcntl, ioctl, prctl redirects for _TIME_BITS=64 (bug 28182)
9995d0588f iconv_charmap: Close output file when done
7ff4da3dc2 copy_and_spawn_sgid: Avoid double calls to close()
a5bd2e10e0 gaiconf_init: Avoid double-free in label and precedence lists
3a48da47a9 gconv_parseconfdir: Fix memory leak
0b03996304 ldconfig: avoid leak on empty paths in config file

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 281df7ecda..c53b53f114 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.34/master"
 PV = "2.34"
-SRCREV_glibc ?= "ae37d06c7d127817ba43850f0f898b793d42aea7"
+SRCREV_glibc ?= "7c987a5ccb31df80456d53a094e47f81310f549b"
 SRCREV_localedef ?= "95c0221703ad970a52445e9eaf91c4aff35eebef"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.32.0

