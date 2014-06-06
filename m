Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2FEAB6FDA5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 10:40:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s56AeU6R027975
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jun 2014 03:40:30 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 6 Jun 2014 03:40:29 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jun 2014 06:08:51 -0400
Message-ID: <9f8006d131293e3f9d73e469f677285f90690356.1402049266.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1402049266.git.liezhi.yang@windriver.com>
References: <cover.1402049266.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libgcrypt: fix do_configure failed
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
X-List-Received-Date: Fri, 06 Jun 2014 10:40:35 -0000
Content-Type: text/plain

Fixed:
rm: cannot remove `/path/libgcrypt-1.6.1/m4/*.m4': No such file or directory

We would meet this error if we stop the configure and run again.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/libgcrypt/libgcrypt.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index 8afa945..7d39e96 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -20,7 +20,7 @@ EXTRA_OECONF = "--disable-asm --with-capabilities"
 
 do_configure_prepend () {
 	# Else these could be used in prefernce to those in aclocal-copy
-	rm ${S}/m4/*.m4
+	rm -f ${S}/m4/*.m4
 }
 
 # libgcrypt.pc is added locally and thus installed here
-- 
1.7.10.4


