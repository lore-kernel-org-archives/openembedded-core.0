Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SPFcE-0000im-Oa
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 18:07:50 +0200
Received: by mail-ob0-f175.google.com with SMTP id x4so5074723obh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2012 08:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=/KqvVFcbKVpGJGoPxno3p3mKA1MwWjcjB35NGr2T6tA=;
	b=N9aUaf6FdlOvHcchwHz1Ym78P5NgRU4ioXnkwi5dk6MY3pghJ9ImeVWPjsSSIB9FnQ
	yxvG+PskWfrj0nFUUGMqc84zxB2F8Wq+w84AmkUgvSeRrTCJI03KOwE7lnyyNnYnLjso
	99+7qUL20q3KtZkRtzTGT2IGI4tserboJHZHuu6Xw11DpEnlOCVythWMjv0KwvDi8kjA
	2bO5XqXGC52XScohoLJQwxJ2ZMqS0Jc5EaC6BeYH8203Qc6hA3dzei4jYD2aPM8emULl
	GwZL5/RaVSFs1D/D6XmcYr/Sm3j8ZPo/kgtNXFJoQ2h/Tbvk/8MElLZ/UDj35RCeZcus
	7mDA==
Received: by 10.182.5.164 with SMTP id t4mr34295618obt.1.1335887889351;
	Tue, 01 May 2012 08:58:09 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id h7sm16733267oeh.9.2012.05.01.08.58.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 May 2012 08:58:08 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 May 2012 10:58:24 -0500
Message-Id: <85eaaa64beba46e39b9d2e206472a135917bcc28.1335887732.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1335887732.git.kergoth@gmail.com>
References: <cover.1335887732.git.kergoth@gmail.com>
In-Reply-To: <cover.1335887732.git.kergoth@gmail.com>
References: <cover.1335887732.git.kergoth@gmail.com>
Subject: [PATCH 6/8] tclibc-eglibc: drop hardcoded locale-base-en-us/en-gb
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
X-List-Received-Date: Tue, 01 May 2012 16:07:50 -0000

This is handled by IMAGE_LINGUAS, so hardcoding it here is at best unnecessary
duplication.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/conf/distro/include/tclibc-eglibc.inc |   12 +++++-------
 1 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/tclibc-eglibc.inc b/meta/conf/distro/include/tclibc-eglibc.inc
index aed82d1..4f5607f 100644
--- a/meta/conf/distro/include/tclibc-eglibc.inc
+++ b/meta/conf/distro/include/tclibc-eglibc.inc
@@ -19,10 +19,10 @@ CXXFLAGS += "-fvisibility-inlines-hidden"
 
 LIBC_DEPENDENCIES = "libsegfault \
 		     eglibc \
-    		     eglibc-dbg \
-    		     eglibc-dev \
-    		     eglibc-utils \
-    		     eglibc-thread-db \
+		     eglibc-dbg \
+		     eglibc-dev \
+		     eglibc-utils \
+		     eglibc-thread-db \
 		     ${@get_libc_locales_dependencies(d)}"
 
 LIBC_LOCALE_DEPENDENCIES = "\
@@ -30,9 +30,7 @@ LIBC_LOCALE_DEPENDENCIES = "\
 	eglibc-gconv-ibm850 \
 	eglibc-gconv-cp1252 \
 	eglibc-gconv-iso8859-1 \
-	eglibc-gconv-iso8859-15 \
-	locale-base-en-us \
-	locale-base-en-gb"
+	eglibc-gconv-iso8859-15"
 
 def get_libc_locales_dependencies(d):
     if 'libc-locales' in (d.getVar('DISTRO_FEATURES', True) or '').split() :
-- 
1.7.7



