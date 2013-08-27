Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3CD096BB96
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 17:16:32 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id z10so5127693pdj.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 10:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=/EsrOBhMS7KbHxLVNRR+QfJvHW2UrJhe8+o1et+vQ5g=;
	b=DdIqK1pokgVjaO1w0VtrR0POzE9AHv91cMKUCP8xR8mJUtLWHR7pjUuwgFwWU0U55N
	wZoyVRSJsA4YGqd9IF5i6Ek22dY2LcVJg12OF5o/JiUMKww5sU9FHHRnR+gaViKT3Tbn
	4A8w30exAd97SsQ0J6QfWCI7EDJ8AvDk7bV6UVg7TVPlXqnW1Jx/gPg+WfbcgKzDFhrT
	2G9RiufWRYpQrLZOangjhZFWXoQJEhFOMNbGEe0giA7DJOcIROOsp3u3PL5coq36fnwY
	opcSvcxIW+lQkRuRclAc5Xl8r6Vd9GOmDKyuxQmu25KbmQwoMuUMs81dT35RUdaq4aQM
	4S4w==
X-Received: by 10.66.251.1 with SMTP id zg1mr9945914pac.160.1377623793152;
	Tue, 27 Aug 2013 10:16:33 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id t9sm25769021pba.46.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 10:16:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2013 10:15:19 -0700
Message-Id: <646151f2b0abdcc90f0777789be3816047e1ba02.1377623208.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
References: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
In-Reply-To: <cover.1377623208.git.raj.khem@gmail.com>
References: <cover.1377623208.git.raj.khem@gmail.com>
Subject: [PATCH 20/20] python3_3.3.2.bb: Add liblzma to RDEPENDS for python3-misc
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
X-List-Received-Date: Tue, 27 Aug 2013 17:16:32 -0000

Fixes

and from test-dependencies.sh run there is undeterministic lzma
dependency:

WARN: packages/armv5te-oe-linux-gnueabi/python3/python3-misc/latest lost
dependency on  liblzma

Reported-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python3_3.3.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.3.2.bb b/meta/recipes-devtools/python/python3_3.3.2.bb
index 6ff32d8..d2c7e37 100644
--- a/meta/recipes-devtools/python/python3_3.3.2.bb
+++ b/meta/recipes-devtools/python/python3_3.3.2.bb
@@ -197,6 +197,7 @@ FILES_${PN}-dbg += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
 # catch all the rest (unsorted)
 PACKAGES += "${PN}-misc"
 FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN}"
+RDEPENDS_${PN}-misc = "liblzma"
 
 # catch manpage
 PACKAGES += "${PN}-man"
-- 
1.8.3.4


