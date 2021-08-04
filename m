Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.3338.1628040489120008040
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Aug 2021 18:28:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 04D0240BEC
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Aug 2021 01:28:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eSvPc99ZV6gE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Aug 2021 01:28:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EA4F340C32
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Aug 2021 01:28:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 09FE017464E;
	Tue,  3 Aug 2021 21:28:07 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH 2/2] convert-overrides.py: handle few more cases of overrides
Date: Tue,  3 Aug 2021 21:28:05 -0400
Message-Id: <1628040485-45946-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628040485-45946-1-git-send-email-denis@denix.org>
References: <1628040485-45946-1-git-send-email-denis@denix.org>

Add task-configure and few more supported values of TARGET_OS override.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 scripts/contrib/convert-overrides.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/convert-overrides.py b/scripts/contrib/convert-overrides.py
index 6505b18..23f63a2 100755
--- a/scripts/contrib/convert-overrides.py
+++ b/scripts/contrib/convert-overrides.py
@@ -36,9 +36,10 @@ vars = vars + ["mipsarch", "x86-x32", "mips16e", "microblaze", "e5500-64b", "mip
 vars = vars + ["class-native", "class-target", "class-cross-canadian", "class-cross", "class-devupstream"]
 vars = vars + ["tune-",  "pn-", "forcevariable"]
 vars = vars + ["libc-musl", "libc-glibc", "libc-newlib","libc-baremetal"]
-vars = vars + ["task-compile", "task-install", "task-clean", "task-image-qa", "task-rm_work", "task-image-complete", "task-populate-sdk"]
+vars = vars + ["task-configure", "task-compile", "task-install", "task-clean", "task-image-qa", "task-rm_work", "task-image-complete", "task-populate-sdk"]
 vars = vars + ["toolchain-clang", "mydistro", "nios2", "sdkmingw32", "overrideone", "overridetwo"]
 vars = vars + ["linux-gnux32", "linux-muslx32", "linux-gnun32", "mingw32", "poky", "darwin", "linuxstdbase"]
+vars = vars + ["linux", "linux-gnueabi", "elf", "eabi"]
 vars = vars + ["virtclass-multilib", "virtclass-mcextend"]
 
 # List of strings to treat as overrides but only with whitespace following or another override (more restricted matching).
@@ -121,7 +122,7 @@ def processfile(fn):
         pass
 
 ourname = os.path.basename(sys.argv[0])
-ourversion = "0.9.1"
+ourversion = "0.9.2"
 
 if os.path.isfile(sys.argv[1]):
     processfile(sys.argv[1])
-- 
2.7.4

