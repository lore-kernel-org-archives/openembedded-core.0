Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SuiZc-00022x-1d
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 13:19:12 +0200
Received: by bkcik5 with SMTP id ik5so1346595bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 04:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=iwyAhvw0AitLpwcMTYPr1YxyTNKxy8AIWfZHccon6w0=;
	b=CILC9nIX079oAzCFp/b5QRGHRUY5KLoOQeUpV7m0+3oJ0ayjq2yF684VJ7caCoYqgi
	0Ht8IgvSY+NnzZ4qi5/gqgCgB5nrVhM6/BbDtRpyYZIlEgeJjJFa8HFcFk8tsCJdv+j+
	PS9ZXs6cvKG4U/UVqxRhXzNMg0u9WUTee5R0JUJBfQYcZxKVcrsjsaVeshKxaTgDBt7V
	qIxXXtSVk4IzTOJ/fIzw+o/gmzrf330Rnq6T1IZlmZUbjN96V/4bZLzAN2sdMbh+hdQq
	1UFHnqxz0+MKAfvAPG57YYq/WqWF/6YN0rbcEEaDuxXAGvZWoVBxxmOrZMwDoCso6ULJ
	J09g==
Received: by 10.205.132.12 with SMTP id hs12mr812159bkc.47.1343387260330;
	Fri, 27 Jul 2012 04:07:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id hs2sm771445bkc.1.2012.07.27.04.07.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jul 2012 04:07:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2012 13:07:43 +0200
Message-Id: <1343387263-18792-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <20120727110521.GH3621@jama.jama.net>
References: <20120727110521.GH3621@jama.jama.net>
Subject: [PATCH] ppp: bump PR to rebuild against libpcap1 instead libpcap
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
X-List-Received-Date: Fri, 27 Jul 2012 11:19:12 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-connectivity/ppp/ppp_2.4.5.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
index 587871a..6af4e98 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77
                     file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8 \
                     file://pppd/tdb.c;beginline=1;endline=27;md5=4ca3a9991b011038d085d6675ae7c4e6 \
                     file://chat/chat.c;beginline=1;endline=15;md5=0d374b8545ee5c62d7aff1acbd38add2"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
            file://makefile.patch \
-- 
1.7.8.6



