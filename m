Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A3EAB71633
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 21:58:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0ELwltb018763
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 13:58:48 -0800 (PST)
Received: from yow-ovp2.wrs.com (128.224.56.99) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 Jan 2015 13:58:47 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jan 2015 16:58:38 -0500
Message-ID: <1421272718-20434-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH] packagegroup-self-hosted: package all of Python
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
X-List-Received-Date: Wed, 14 Jan 2015 21:58:50 -0000
Content-Type: text/plain

Based on commit 745dfbc869fd593d1b92e2bc9c01d589ab21ade3
"buildtools-tarball: package all of Python", we do the same here
for packagegroup-self-hosted.

The switch to the fetcher where it added BeautifulSoup revealed
a shortcoming in the python packaged for the self hosting (missing
htmlentitydefs).  Here we fix it in the same way as what was done
for buildtools-tarball and include python-modules vs. all the
individual little chunks.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 .../packagegroups/packagegroup-self-hosted.bb      | 28 +---------------------
 1 file changed, 1 insertion(+), 27 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index f95ce77fd2d5..af57fac0adf6 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -154,37 +154,11 @@ RDEPENDS_packagegroup-self-hosted-extended = "\
     perl-pod \
     ${PTH} \
     python \
-    python-compile \
     python-compiler \
-    python-compression \
-    python-core \
-    python-curses \
-    python-datetime \
-    python-difflib \
-    python-distutils \
-    python-elementtree \
-    python-email \
-    python-fcntl \
     python-git \
-    python-json \
-    python-logging \
     python-misc \
-    python-mmap \
-    python-multiprocessing \
-    python-netclient \
-    python-netserver \
-    python-pickle \
-    python-pkgutil \
-    python-pprint \
-    python-re \
+    python-modules \
     python-rpm \
-    python-shell \
-    python-sqlite3 \
-    python-subprocess \
-    python-textutils \
-    python-unittest \
-    python-unixadmin \
-    python-xmlrpc \
     quota \
     readline \
     rpm \
-- 
2.1.0


