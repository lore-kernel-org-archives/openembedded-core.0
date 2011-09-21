Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R6Rnz-0001Wz-DX
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 20:45:59 +0200
Received: by eya25 with SMTP id 25so1988646eya.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 11:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=9kKDLO4aP3aa0g8BbiEsXbmU8YqQohoH/QCONMaJlQ8=;
	b=cV6xiHsNvdZqHLRVKH1UlOSCJE7IcVYOU/Q+dfF5s3m5hh1sc5q6MKrRhRBGnE9Iqx
	hRtJNLjd90cMfYP5yqwURcWhiaNE2eNKgpjCfgz74tSB5CU5ePZDRkWlZz+5WyT8Xvn9
	sSqvZfi8rM4PEYGNlLrsXDJ1frxPj/pI4mB88=
Received: by 10.204.156.156 with SMTP id x28mr842736bkw.108.1316630440102;
	Wed, 21 Sep 2011 11:40:40 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id t16sm5806554bkv.11.2011.09.21.11.40.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 11:40:38 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2011 22:40:01 +0400
Message-Id: <1316630404-10336-14-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
References: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 14/17] e2fsprogs: include devtools scripts
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
X-List-Received-Date: Wed, 21 Sep 2011 18:45:59 -0000

Some scripts are necessary to develop programs with libcom_err and
libss. Include those into e2fsprogs-dev package.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../e2fsprogs/e2fsprogs_1.41.14.bb                 |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb
index ea0782d..1fca7b9 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb
@@ -1,6 +1,6 @@
 require e2fsprogs.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI += "file://quotefix.patch \
             file://acinclude.m4"
@@ -51,5 +51,6 @@ FILES_libcomerr = "${libdir}/libcom_err.so.*"
 FILES_libss = "${libdir}/libss.so.*"
 FILES_libe2p = "${libdir}/libe2p.so.*"
 FILES_libext2fs = "${libdir}/e2initrd_helper ${libdir}/libext2fs.so.*"
+FILES_${PN}-dev += "${datadir}/*/*.awk ${datadir}/*/*.sed"
 
 BBCLASSEXTEND = "native"
-- 
1.7.2.5



