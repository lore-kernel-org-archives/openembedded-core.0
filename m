Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk [78.40.148.184])
 by mx.groups.io with SMTP id smtpd.web10.6810.1632483254353555350
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 04:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: codethink.co.uk, ip: 78.40.148.184, mailfrom: tom.pollard@codethink.co.uk)
Received: from cpc109023-salf6-2-0-cust777.10-2.cable.virginm.net ([82.29.243.10] helo=localhost.localdomain)
	by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1mTjSz-0001R7-NN; Fri, 24 Sep 2021 12:34:09 +0100
From: "Tom Pollard" <tom.pollard@codethink.co.uk>
To: openembedded-core@lists.openembedded.org
Cc: Tom Pollard <tom.pollard@codethink.co.uk>
Subject: [PATCH] bzip2: Update soname for libbz2 1.0.8
Date: Fri, 24 Sep 2021 12:33:52 +0100
Message-Id: <20210924113352.63175-1-tom.pollard@codethink.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set shared library name as libbz2.so.1.0.8, version in configure.ac
already synced via do_configure PV substitution.

Signed-off-by: Tom Pollard <tom.pollard@codethink.co.uk>
---
 meta/recipes-extended/bzip2/bzip2/Makefile.am | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bzip2/bzip2/Makefile.am b/meta/recipes-extended/bzip2/bzip2/Makefile.am
index 7338df03eb..d12d3a45e4 100644
--- a/meta/recipes-extended/bzip2/bzip2/Makefile.am
+++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am
@@ -1,6 +1,6 @@
 
 lib_LTLIBRARIES = libbz2.la
-libbz2_la_LDFLAGS = -version-info 1:6:0
+libbz2_la_LDFLAGS = -version-info 1:8:0
 
 libbz2_la_SOURCES = blocksort.c  \
                     huffman.c    \
-- 
2.30.2

