Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CADFC6D432
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 07:12:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9T7COWn013624
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 00:12:24 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 29 Oct 2013 00:12:24 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Oct 2013 15:12:17 +0800
Message-ID: <548b09ddfcece72635432730e110ad8aac1b802b.1383030558.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1383030558.git.hongxu.jia@windriver.com>
References: <cover.1383030558.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] coreutils: support command arch
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
X-List-Received-Date: Tue, 29 Oct 2013 07:12:23 -0000
Content-Type: text/plain

The "arch" is removed in util-linux 2.23, but some old
software and devs look for arch:
http://lists.gnu.org/archive/html/bug-coreutils/2007-06/msg00010.html

Use coreutils version.
[YOCTO #5404]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/coreutils/coreutils_8.21.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.21.bb b/meta/recipes-core/coreutils/coreutils_8.21.bb
index da14303..e672ab1 100644
--- a/meta/recipes-core/coreutils/coreutils_8.21.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.21.bb
@@ -23,6 +23,7 @@ SRC_URI[md5sum] = "065ba41828644eca5dd8163446de5d64"
 SRC_URI[sha256sum] = "adaa44bdab3fa5eb352e80d8a31fdbf957b78653d0c2cd30d63e161444288e18"
 
 EXTRA_OECONF_class-native = "--without-gmp"
+EXTRA_OECONF_class-target = "--enable-install-program=arch"
 
 # acl is not a default feature
 #
@@ -39,7 +40,7 @@ bindir_progs = "basename chcon cksum comm csplit cut dir dircolors dirname du \
                 join link logname md5sum mkfifo nice nl nohup nproc od paste pathchk \
                 pinky pr printenv printf ptx readlink realpath runcon seq sha1sum sha224sum sha256sum \
                 sha384sum sha512sum shred shuf sort split stat stdbuf sum tac tail tee test timeout\
-                tr truncate tsort tty unexpand uniq unlink uptime users vdir wc who whoami yes"
+                tr truncate tsort tty unexpand uniq unlink uptime users vdir wc who whoami yes arch"
 
 # hostname gets a special treatment and is not included in this
 base_bindir_progs = "cat chgrp chmod chown cp date dd echo false kill ln ls mkdir \
-- 
1.8.1.2


