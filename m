Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SRv9x-0000rz-VU
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 02:53:42 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so7395440pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2012 17:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=5WdHbctrCEJltVvYtodcBlC+MR+RpHOxxFb2Aceq8eo=;
	b=fKt/xV63skpiqz8Gz9CsyaIEdETLTexHz5kY0pOLYkZxUN7GNy5UnCPJ0gL8Poh8/z
	AEQY2b5cGzwMPQn6mQ8yl/YC7BMsss+aQQC69FFrqYmcjpENfUGQhI3qbs9fiK9Fpufc
	BCZBvfiQFox80g4j5CohYY2JziJkVJClpeVES+g/sA/IuTSIsNRKAu/mVvTijB7mPVBJ
	5jY6u5a4bZCxLyR2LWaiNkQKcB3Ynli92BNJNvkBKYtCYQBkGks340gP5h6hPaWgG67o
	tQZiNUs6L+5aImG+C3I5SgOVgctRqvWZUe0/Yc8co8yO679agWf9GRESCYXZbPMtNd2Z
	XDpQ==
Received: by 10.68.130.199 with SMTP id og7mr2984587pbb.91.1336524231663;
	Tue, 08 May 2012 17:43:51 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id pq1sm4069862pbc.7.2012.05.08.17.43.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 May 2012 17:43:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2012 17:43:35 -0700
Message-Id: <fa8d138dc96a622f36b8783457c375186a84e411.1336524034.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1336524034.git.raj.khem@gmail.com>
References: <cover.1336524034.git.raj.khem@gmail.com>
Subject: [PATCH 1/2] uclibc.inc: uclibc rtld does support GNU_HASH
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
X-List-Received-Date: Wed, 09 May 2012 00:53:42 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index f5b6bf7..55ab0c9 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -88,7 +88,8 @@ RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
 # uclibc does not really have libsegfault but then using the one from glibc is also not
 # going to work. So we pretend that we have it to make bitbake not pull other recipes
 # to satisfy this dependency for the images/tasks
-RPROVIDES_uclibc += "libsegfault"
+
+RPROVIDES_uclibc += "libsegfault rtld(GNU_HASH)"
 
 SRC_URI = "\
         http://www.uclibc.org/downloads/uClibc-${PV}.tar.bz2;name=uClibc-${PV} \
-- 
1.7.5.4



