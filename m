Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RFykK-0001jj-V8
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Oct 2011 03:45:37 +0200
Received: by ywm39 with SMTP id 39so97930ywm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 18:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=wqU8BBs8Amq4/aRb6cUp4BDqvG6wq1Z0CakHXXRrVBo=;
	b=QZ5gUIJFUB4Ae4dVQmy2rivLVxXfCGcE4Kw5Ok38v0sTTXphP/fy/BR/RlQxzLv9+v
	+xbbrl2egwr727bKZUD0/Fxn5hi9GQmygVAbTOtiEBL4LkOlxDgOJaej8ALyE8VpFyM3
	vx0efkRh5zcf0usuBN8shRm5DbJnADXr6QhjY=
Received: by 10.68.21.74 with SMTP id t10mr1209341pbe.32.1318901987131;
	Mon, 17 Oct 2011 18:39:47 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id ji3sm1897253pbc.2.2011.10.17.18.39.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 18:39:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2011 18:39:26 -0700
Message-Id: <a6eb26a6bf83e44b0e7fbab9dcc4865f1a701dd3.1318901607.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <bb4834366391a733cbb331a52cae44f295bda2a1.1318901607.git.raj.khem@gmail.com>
References: <bb4834366391a733cbb331a52cae44f295bda2a1.1318901607.git.raj.khem@gmail.com>
In-Reply-To: <cover.1318901607.git.raj.khem@gmail.com>
References: <cover.1318901607.git.raj.khem@gmail.com>
Subject: [PATCH 2/3] gcc-4.6: Upgrade SRCREV to latest FSF 4.6 branch
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
X-List-Received-Date: Tue, 18 Oct 2011 01:45:37 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 8ca3174..0fb6287 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -18,7 +18,7 @@ PV = "4.6.1+svnr${SRCPV}"
 
 BINV = "4.6.2"
 
-SRCREV = 178924
+SRCREV = 180099
 BRANCH = "gcc-4_6-branch"
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.6' ], d)}"
 
-- 
1.7.5.4



