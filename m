Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f53.google.com (mail-pb0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4E6556E938
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 03:33:05 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id md12so7083770pbc.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 19:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=WJMpw+qNJ23eYMsC5h6zZiijLXRYUxvDV8Xnrc5X6LM=;
	b=IijcnWuF/Zbv5/cbzdxs/2DIk57MydowozPIUbPqi9PE2TV42xZBP+XneRV2w+kQVS
	yabIWjJvMzvXNMA2klztA5iR33fjnMLauH/gWFxIVhYfgj0CegDp6mkAl1RH4i+VP44N
	fQJzzfNHyafhJHMmRrihP+AjrHexGfEymmFaqxSwinXT1IgxB1pc18QAoTKMZ+06F1Qh
	STa4IRP1XKqupC9Qdl+IQyRAlELcRJlnwvH/yHHJtLZn6eK0iqCeZrXCEkZOLwN6fSF5
	ocQzesvuFRMO9bHPv/VeiYYlfQZffMLE130G/ICbK65QTBGKmeN3pffuZzCBZFExiDax
	Al7Q==
X-Received: by 10.66.139.100 with SMTP id qx4mr13014055pab.141.1392089586640; 
	Mon, 10 Feb 2014 19:33:06 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	nv7sm47591469pbc.31.2014.02.10.19.33.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Feb 2014 19:33:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Feb 2014 19:33:36 -0800
Message-Id: <3ef9cfedc7386604766b3b96c177afa5caa2b165.1392089446.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <d26f2923a8f23a7fed4f22bdc6aaa178d39a5add.1392089446.git.raj.khem@gmail.com>
References: <d26f2923a8f23a7fed4f22bdc6aaa178d39a5add.1392089446.git.raj.khem@gmail.com>
In-Reply-To: <cover.1392089446.git.raj.khem@gmail.com>
References: <cover.1392089446.git.raj.khem@gmail.com>
Subject: [PATCH 2/3] libmicrohttpd: add recipe
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
X-List-Received-Date: Tue, 11 Feb 2014 03:33:05 -0000

libmicrohttpd is needed by systemd-journald-gatewayd

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libmicrohttpd/libmicrohttpd_0.9.33.bb            |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb
new file mode 100644
index 0000000..d56af76
--- /dev/null
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb
@@ -0,0 +1,18 @@
+# Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "A small C library that is supposed to make it easy to run an HTTP server as part of another application"
+HOMEPAGE = "http://www.gnu.org/software/libmicrohttpd/"
+LICENSE = "LGPL-2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9331186f4f80db7da0e724bdd6554ee5"
+SECTION = "net"
+DEPENDS = "gnutls libgcrypt"
+
+SRC_URI = "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "013b10f9de1cda5448b29c81305354a3"
+SRC_URI[sha256sum] = "d9587e8497548f820650cd607daf3615ea3272435779378983032c570f1cd559"
+
+inherit autotools
+EXTRA_OECONF += "--disable-dependency-tracking --enable-largefile \
+                 --enable-curl --enable-messages --with-pic"
+
-- 
1.7.10.4


