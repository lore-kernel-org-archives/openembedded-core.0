Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.239.1592452451761255349
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 20:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=M4DJaN/2;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 2CA0020B4782; Wed, 17 Jun 2020 20:54:11 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2CA0020B4782
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1592452451;
	bh=NH1UuD3bCqOISEGh0J6uwtDp3EJjvTsJa54ddq2zGMM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=M4DJaN/2vr+FD+P9ZN9F1W6iEIErPQzwNzX7hrGccuuwv5plWgsD5FVu7qtpHYarY
	 NGuWorhpoCp0uu+BPf2yqf8bbHKUP5RNyKuuzy4r0KxF/z9p3AfiIN+fzPTThHebCN
	 OIasheF6jFA1mTTf14eZzgJXU68H32CTHE10Iikg=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] shadow-sysroot: drop unused SRC_URI checksums
Date: Wed, 17 Jun 2020 20:54:03 -0700
Message-Id: <b60b29f185417a4888ff6a1871cfd459e77f14f5.1592452323.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1592452323.git.paul.eggleton@linux.microsoft.com>
References: <cover.1592452323.git.paul.eggleton@linux.microsoft.com>

This recipe only fetches local files, so there's no need for a checksum.
These have been present for some time and nobody noticed.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.microsoft.com>
---
 meta/recipes-extended/shadow/shadow-sysroot_4.6.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
index 79fc8b8..a8c1539 100644
--- a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
+++ b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
@@ -14,9 +14,6 @@ PR = "r3"
 # can add custom users/groups for recipes that use inherit useradd.
 SRC_URI = "file://login.defs_shadow-sysroot"
 
-SRC_URI[md5sum] = "b8608d8294ac88974f27b20f991c0e79"
-SRC_URI[sha256sum] = "633f5bb4ea0c88c55f3642c97f9d25cbef74f82e0b4cf8d54e7ad6f9f9caa778"
-
 S = "${WORKDIR}"
 
 do_install() {
-- 
1.8.3.1

