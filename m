Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id D582C76988
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:38 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id n128so142176090pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=23z1uyB3MAS7KlBlPErpOUAsLhJfpN2wS/HlRH9G1bk=;
	b=IPbhqC6nURb8qt6jSKJG7wpsUZji6Pb4heL+3MmpnZ2IS/HVwuA1Dmsvo4BWbl0J2e
	/ITWzl3+2AVYukqGoSbNo53Re0q36rWegNhU3nKGYjK2d5ADMuq0LJAD75o4PBFEAJEy
	nRPvmmLN6qPY7FaMGnM4qx9uZGDvVATwh/i1uoczsijga2ctn6pXtaIIj8htjmKSkMOv
	FHneAzLnH6Ff+LQcV/cLNZ/26dvpI9+qqF8OTfGgf5lFGPnDVOg9b+ixg/aJdBgnZihA
	9sPeZdDeBLsyrr4PpLf+sH85BazpBPbuDJZKQQX/LU6840J7WlRj3SAv/CmdaHkAN+lM
	bZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=23z1uyB3MAS7KlBlPErpOUAsLhJfpN2wS/HlRH9G1bk=;
	b=iaWhyytVopzfkKj1yiQ4sVII+Ls7zmvv8xSWi4EJrCTMuGL+jKPp+/u9Wx3/HaAGjP
	pYs8aG+i98PVtIsKwtnVmzGp0kbkF3VvgeCfkaXrdp0P0WRd7YwAYATBDXV/D3uhJjOA
	fTGYWcsIKvVKulWkkz7FYmpQvgnbij9FcIhFa+GyfePHqTUpFfnMS6riHH0iknqRbs6c
	3Qv9btKwd1A2V9Z6SyuoaShlQyLXrP615sartiocj3GSPHOtY6b5mC9ngE7WDcANiUKy
	1Z1/32f//eI7UW7Aer17eRV7IcgoJvQs7YaRUSSLPaDKYLs8B7VNtp0rXB7Nb6TSDdmG
	KSkg==
X-Gm-Message-State: ALoCoQlL4nxybjfBU7NViePEI8d6M0aSUzJw0FA9LOEenFRRetnQLtJw3HFiO1QLv3TmB+Imdzxyz+n5Tz49UrTS5AbszyTfOA==
X-Received: by 10.98.86.67 with SMTP id k64mr28962103pfb.50.1453030659292;
	Sun, 17 Jan 2016 03:37:39 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:16 -0800
Message-Id: <aba25858cb060e82f164a17ac7475a2b7cbaf929.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 43/73] chkconfig: Avoid using caddr_t
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Jan 2016 11:37:39 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../chkconfig/chkconfig/replace_caddr_t.patch      | 33 ++++++++++++++++++++++
 .../recipes-extended/chkconfig/chkconfig_1.3.58.bb |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/chkconfig/chkconfig/replace_caddr_t.patch

diff --git a/meta/recipes-extended/chkconfig/chkconfig/replace_caddr_t.patch b/meta/recipes-extended/chkconfig/chkconfig/replace_caddr_t.patch
new file mode 100644
index 0000000..96d1938
--- /dev/null
+++ b/meta/recipes-extended/chkconfig/chkconfig/replace_caddr_t.patch
@@ -0,0 +1,33 @@
+caddr_t is a legacy BSD type which was rejected by the POSIX standard.
+Use void * instead.
+
+sys/unitstd.h is not needed and moreover its not available on all C library
+implementations e.g. musl
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: chkconfig-1.3.58/alternatives.c
+===================================================================
+--- chkconfig-1.3.58.orig/alternatives.c
++++ chkconfig-1.3.58/alternatives.c
+@@ -22,7 +22,6 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <sys/stat.h>
+-#include <sys/unistd.h>
+ #include <unistd.h>
+ 
+ #define	FLAGS_TEST	(1 << 0)
+Index: chkconfig-1.3.58/leveldb.c
+===================================================================
+--- chkconfig-1.3.58.orig/leveldb.c
++++ chkconfig-1.3.58/leveldb.c
+@@ -442,7 +442,7 @@ int parseServiceInfo(int fd, char * name
+     fstat(fd, &sb);
+ 
+     bufstart = mmap(NULL, sb.st_size, PROT_READ, MAP_SHARED, fd, 0);
+-    if (bufstart == ((caddr_t) -1)) {
++    if (bufstart == ((void*) -1)) {
+ 	close(fd);
+ 	return -1;
+     }
diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
index 488847a..e839026 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
@@ -16,7 +16,9 @@ PROVIDES += "virtual/update-alternatives"
 
 PR = "r7"
 
-SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${BPN}-${PV}.tar.bz2"
+SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${BPN}-${PV}.tar.bz2 \
+           file://replace_caddr_t.patch \
+          "
 
 SRC_URI[md5sum] = "c2039ca67f2749fe0c06ef7c6f8ee246"
 SRC_URI[sha256sum] = "18b497d25b2cada955c72810e45fcad8280d105f17cf45e2970f18271211de68"
-- 
2.7.0


