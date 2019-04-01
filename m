Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
	[209.85.167.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6DF487D1E3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 22:47:17 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id v14so7510858lfi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 15:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=qXPP7A1Z7WJahE9egNcapcj7S5/C0qUxfXYQlhAr2Y4=;
	b=EAO0u43c9WUWsgxzxqEYGk2pQso6tzo+U8Z8Rx8W59KLZzR3zGfnku2Umz8CxhLIAx
	a8gtNNasLxt8Smw9nl1YAf5kvPFzZZbfbsF2tb5INSv7T29vUfX02T93gI/a6aeo/2Ji
	6vQaXLzOR/TarvvPSOER9llpDLinrr4nRlsDDx1gY+tbTWOLDIPuwsiO7T8b0pPsK/Lq
	qUL+Vu2yaZNaYVz45+f8ILp6dxRXHCCmXHHiLGy5aTGkgnxoVOqL2FC7jTZs3+FkDIZG
	ivA4mdCwvTJkPeE2D8D2/7vp+0RZg/QmvNQVGX/YaweeLV1Ds/lawskn7411Qtajy5Rf
	JvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qXPP7A1Z7WJahE9egNcapcj7S5/C0qUxfXYQlhAr2Y4=;
	b=kWG3T1MrqyTQ/yKYF496n+h7Lz4Ige0sKtn6Z9AdhwQ7AEdjBdf64gReE9T03MkUzt
	bhbnTmsCvf0zjbPJcOXQQJh1oPtUWD79U5Z6TfrPPKqeft54IS/4+SbHLeQHQQcS//AR
	BAaNjsHc+jmqmsO7nm4DsTsTTccEb1xWJsfCYnFDm/0dsn9/hTk0ximlbdgZSsA1DSdb
	XxICBi3M4oRxPu9CFteoKvzjFLD+mStoeuBPhXlRp+Deqd1JYqkYIqcqd5Jr67tNFAv9
	QCVdNgdhzTBWUHOY2p+y+vbzuO25Vw9kaZuAd0Nqi8kgLdLRsL+rkEXZcWp4lwpdFygA
	NH/w==
X-Gm-Message-State: APjAAAXy+raTrrKUC50V3tsiHEmZfPH/5coOXu81zjHkIpQuDIyRSNIM
	DqfwEh70De8tzEZPhHAC1umwbfilQnM=
X-Google-Smtp-Source: APXvYqxuW6YtmpRRqlJkw3vgXACYVGIhK0C7IZjsMUNAs40lY6cp6NQT+HjSbamr1Q81vrOzG2sqIg==
X-Received: by 2002:a19:c784:: with SMTP id x126mr15430356lff.91.1554158837518;
	Mon, 01 Apr 2019 15:47:17 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	e18sm2428545ljb.12.2019.04.01.15.47.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 15:47:16 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Apr 2019 00:47:15 +0200
Message-Id: <20190401224715.13609-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libsolv: update to 0.7.4
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
X-List-Received-Date: Mon, 01 Apr 2019 22:47:17 -0000

Removed patch has been upstreammed.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...y-disfavor-recommends-if-there-are-a.patch | 33 -------------------
 .../{libsolv_0.7.3.bb => libsolv_0.7.4.bb}    |  7 ++--
 2 files changed, 3 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-extended/libsolv/libsolv/0001-solver_solve-only-disfavor-recommends-if-there-are-a.patch
 rename meta/recipes-extended/libsolv/{libsolv_0.7.3.bb => libsolv_0.7.4.bb} (79%)

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-solver_solve-only-disfavor-recommends-if-there-are-a.patch b/meta/recipes-extended/libsolv/libsolv/0001-solver_solve-only-disfavor-recommends-if-there-are-a.patch
deleted file mode 100644
index 139613a0ad..0000000000
--- a/meta/recipes-extended/libsolv/libsolv/0001-solver_solve-only-disfavor-recommends-if-there-are-a.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 19d7cc87adba92d31d5fafdf7db00920d24a96a6 Mon Sep 17 00:00:00 2001
-From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
-Date: Wed, 6 Feb 2019 13:24:04 -0600
-Subject: [PATCH] solver_solve: only disfavor recommends if there are any
-
-In a repo that have pkg 'a' and 'b' available, and 'b' is disfavored,
-but 'a' doesn't recommend 'b', libsolv segfaults on
-solver_addrecommendsrules, since solv->recommendsruleq is null. Only
-call solver_addrecommendsrules if there are recommends rules.
-
-Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
-
-Upstream-Status: Accepted
----
- src/solver.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/solver.c b/src/solver.c
-index a80090d19..ad78327a8 100644
---- a/src/solver.c
-+++ b/src/solver.c
-@@ -3920,7 +3920,7 @@ solver_solve(Solver *solv, Queue *job)
-   else
-     solv->yumobsrules = solv->yumobsrules_end = solv->nrules;
- 
--  if (solv->havedisfavored && solv->strongrecommends)
-+  if (solv->havedisfavored && solv->strongrecommends && solv->recommendsruleq)
-     solver_addrecommendsrules(solv);
-   else
-     solv->recommendsrules = solv->recommendsrules_end = solv->nrules;
--- 
-2.20.1
-
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.3.bb b/meta/recipes-extended/libsolv/libsolv_0.7.4.bb
similarity index 79%
rename from meta/recipes-extended/libsolv/libsolv_0.7.3.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.4.bb
index 3fe6f2c20a..f3927a887f 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.3.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.4.bb
@@ -7,11 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 
 DEPENDS = "expat zlib"
 
-SRC_URI = "git://github.com/openSUSE/libsolv.git \
-           file://0001-solver_solve-only-disfavor-recommends-if-there-are-a.patch \
-"
+SRC_URI = "git://github.com/openSUSE/libsolv.git"
+
+SRCREV = "51fc3b1214aa9677e972712fa1ce6916e438751f"
 
-SRCREV = "dc7d0f1c3113f2c8217563166906bef3eb5d1ee1"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


