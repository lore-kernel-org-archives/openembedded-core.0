Return-Path: <net147@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 35F38759D5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 03:10:54 +0000 (UTC)
Received: by pablk4 with SMTP id lk4so63486227pab.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Sep 2015 20:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=R90g92pJcOnOHtr+WLrIObz06+ByqkZW9qRSGgz+y2A=;
	b=UH4I9h4ZHBBRXbCguRVFhQS3akB0KimH0EFmKdVp5ufFs29qhWi+8NOvGNB2dUdECo
	m3o59NaS60cKMyxsMt10s8JOQFfF7F/pMbM/qLIfEAM1jtcn2boBPI7jaD2GEnQYkAX6
	sZVuwQO7995MDOvI1tT+deYIIXN/ZC9Tb2sBys8pvcnkC/vwCu0eEUuGjm664wNfbw8d
	/b4ZY22JRrGviam2oUPnVWBWDOMQyk8IUgVKwdelZgZxAySDGjXadoqo3NukKtz1M8gX
	c8yLp3/x5S2kygjiF5DKv/Ut6qNyo1BFVN6d0MqDeXXdPX0nX/LGhdNALoHiFc4AsynW
	9bog==
X-Received: by 10.66.160.194 with SMTP id xm2mr23204781pab.111.1443409854757; 
	Sun, 27 Sep 2015 20:10:54 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	pi9sm16076246pbb.96.2015.09.27.20.10.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Sep 2015 20:10:53 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Sep 2015 13:10:22 +1000
Message-Id: <1443409822-19333-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.5.3
Subject: [PATCH] systemd: add PACKAGECONFIG for qrencode
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
X-List-Received-Date: Mon, 28 Sep 2015 03:10:58 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/systemd/systemd_225.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
index ef8d297..0ad6378 100644
--- a/meta/recipes-core/systemd/systemd_225.bb
+++ b/meta/recipes-core/systemd/systemd_225.bb
@@ -87,6 +87,7 @@ PACKAGECONFIG[iptc] = "--enable-libiptc,--disable-libiptc,iptables"
 PACKAGECONFIG[ldconfig] = "--enable-ldconfig,--disable-ldconfig,,"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 PACKAGECONFIG[valgrind] = "ac_cv_header_valgrind_memcheck_h=yes ac_cv_header_valgrind_valgrind_h=yes ,ac_cv_header_valgrind_memcheck_h=no ac_cv_header_valgrind_valgrind_h=no ,valgrind"
+PACKAGECONFIG[qrencode] = "--enable-qrencode,--disable-qrencode,qrencode"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_KILL=${base_bindir}/kill"
 CACHED_CONFIGUREVARS += "ac_cv_path_KMOD=${base_bindir}/kmod"
-- 
2.5.3


