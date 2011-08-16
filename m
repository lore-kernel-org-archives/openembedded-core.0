Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QtSJT-0005W1-46
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 00:40:47 +0200
Received: by gxk3 with SMTP id 3so330253gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 15:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=NqwTL20/qaiQnIB/2vAuO0VQsDyL3eCkdP6LLZWw4EY=;
	b=TPx9tfHnuuT25J2d9cX79pAvth2JsUkHUCxH3/SqNSEiVpUZCw+WI85Y0FGzcMYKTc
	+36CJ8balO/paYf244gLh7I33fB1tczDqsxgZhMzDD1iOng7wOb1aR+161NfNCtUv8wH
	nCfa3WuG2ZEzeCTzhDxCc6YCbUn7wqGtduwS4=
Received: by 10.236.173.230 with SMTP id v66mr1030254yhl.100.1313534169116;
	Tue, 16 Aug 2011 15:36:09 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c63sm581513yhe.18.2011.08.16.15.36.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Aug 2011 15:36:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 15:35:49 -0700
Message-Id: <f7bc6c95f29c5de0e4c4e627417d303d72933c62.1313533911.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <fcafbb92c3e07d372066a36e6af2dc13f0a99a1f.1313533911.git.raj.khem@gmail.com>
References: <fcafbb92c3e07d372066a36e6af2dc13f0a99a1f.1313533911.git.raj.khem@gmail.com>
In-Reply-To: <cover.1313533911.git.raj.khem@gmail.com>
References: <cover.1313533911.git.raj.khem@gmail.com>
Subject: [PATCH 2/5] gcc-4.6: Use --with-linker-hash-style configure option
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Aug 2011 22:40:47 -0000

Depending upon what hash style is in use this uses
the right flag for setting the hash style type. This
fixes the QA errors about missing GNU hash style reported
in gcc-runtime build particularly libgcc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 0a148b4..fffb779 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r7"
+PR = "r8"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
@@ -90,6 +90,7 @@ EXTRA_OECONF_BASE = " --enable-lto \
 			--disable-bootstrap \
 			--disable-libgomp \
 			--disable-libmudflap \
+			--with-linker-hash-style=${LINKER_HASH_STYLE} \
 			--enable-cheaders=c_global "
 
 EXTRA_OECONF_INITIAL = "--disable-libmudflap \
-- 
1.7.5.4



