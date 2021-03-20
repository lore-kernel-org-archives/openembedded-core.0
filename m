Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.6533.1616261495564975395
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Mar 2021 10:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=VS0P5xIY;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: anbelski@linux.microsoft.com)
Received: from anbelski-lsg-linux-yocto-1.irsgb21fvobu5fvmalxug44hib.xx.internal.cloudapp.net (unknown [52.247.218.173])
	by linux.microsoft.com (Postfix) with ESMTPSA id B8D75208FDC5
	for <openembedded-core@lists.openembedded.org>; Sat, 20 Mar 2021 10:31:34 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B8D75208FDC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1616261494;
	bh=gXP74uueZpS2ddbmLf9fQO/IOh42kAMJ9MaKTEGfvFc=;
	h=From:To:Subject:Date:From;
	b=VS0P5xIYFV3PFZSJRHQGsELI6Rt1pf2PzdNCynTDZ0JRQQHmgEsmtcpxjlkjMx/gc
	 Oaz8lmwxmz5peYRcHFU8BgvHbt8nkk8ww/lD5gG6a7eGukgsrbqz+8rpzuiIHzyQ9d
	 +hUlNDVeCmckXL9u5x+H/MTrBTN5xyHxth5F4JWU=
From: "Anatol Belski" <anbelski@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH] glibc: Pull latest 2.32 HEAD
Date: Sat, 20 Mar 2021 17:31:24 +0000
Message-Id: <20210320173124.890-1-anbelski@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1

New commits:

$ git log --format="%h %s" df31c7ca927242d5d4eee97f93a01e23ff47e332..f84949f1c4bbf20e6a1d9a5859cf012cde060ede
f84949f1c4 powerpc64: Workaround sigtramp vdso return call
5e43566f0f nscd: Fix double free in netgroupcache [BZ #27462]

Note also that additionally CVE-2021-3326 has been whitelisted as it was
already present in the previous state.

Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.32.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 586b2e207e..84d199bb1d 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.32/master"
 PV = "2.32"
-SRCREV_glibc ?= "760e1d287825fa91d4d5a0cc921340c740d803e2"
+SRCREV_glibc ?= "44b395932961a29825da4ad025124a6760858d9c"
 SRCREV_localedef ?= "bd644c9e6f3e20c5504da1488448173c69c56c28"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc_2.32.bb b/meta/recipes-core/glibc/glibc_2.32.bb
index e4fe9b87b5..03aea52508 100644
--- a/meta/recipes-core/glibc/glibc_2.32.bb
+++ b/meta/recipes-core/glibc/glibc_2.32.bb
@@ -2,7 +2,7 @@ require glibc.inc
 require glibc-version.inc
 
 # whitelist CVE's with fixes in latest release/2.32/master branch
-CVE_CHECK_WHITELIST += "CVE-2019-25013 CVE-2020-10029 CVE-2020-27618"
+CVE_CHECK_WHITELIST += "CVE-2019-25013 CVE-2020-10029 CVE-2020-27618 CVE-2021-27645 CVE-2021-3326"
 
 DEPENDS += "gperf-native bison-native make-native"
 
-- 
2.17.1

