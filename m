Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5BAF96AC15
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 20:50:58 +0000 (UTC)
Received: by igcsj18 with SMTP id sj18so244859945igc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jul 2015 13:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Fkfo4qU7TNUW5gGfGteheL3jmfwG69SITmCwXuBTyaE=;
	b=jeU+Fqsrh9aLJl5fUweSVkTs4mD+lIx41aNQSQjl9cJXT2lra5b34Ywfi4UwuFIs6D
	NAAC4QthjBmNlJzwdqTmWTr3y0C46Zr83Qc2sUcGlik2nA+HrbLNyubsZpGvN/YkPcc+
	O9p8KgtQCuKz/FWiJXh016KghHjUJuQPrSSiovGFLoPTkmyVoi2qUqCbi9NCB//GfHNb
	q3LKPB7JVOO1pJjq2FRAfhZWIBPqDpL+zCg7hsrF06vGfTMll/ddWNn/lALzpmAl3xn8
	aOBS0eI/6jboxSLm/N1jbdSI8AsI8IovqZQSoM5QD9IIr1LSFX47/Z2S//obeTVhHVbJ
	Hdgw==
X-Received: by 10.43.24.134 with SMTP id re6mr36738062icb.74.1436215859325;
	Mon, 06 Jul 2015 13:50:59 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id c41sm13182955iod.8.2015.07.06.13.50.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Jul 2015 13:50:58 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jul 2015 13:50:08 -0700
Message-Id: <1436215810-23722-12-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1436215810-23722-1-git-send-email-armccurdy@gmail.com>
References: <1436215810-23722-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 11/13] valgrind: fix typo in valgrind-remove-rpath.patch
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
X-List-Received-Date: Mon, 06 Jul 2015 20:50:59 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind/valgrind-remove-rpath.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/valgrind-remove-rpath.patch b/meta/recipes-devtools/valgrind/valgrind/valgrind-remove-rpath.patch
index 07a2726..f72e9ca 100644
--- a/meta/recipes-devtools/valgrind/valgrind/valgrind-remove-rpath.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/valgrind-remove-rpath.patch
@@ -1,5 +1,5 @@
 
-Upstream-Status: Inapporpiate [embedded config]
+Upstream-Status: Inappropriate [embedded config]
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
 Index: valgrind-3.10.0/none/tests/Makefile.am
-- 
1.9.1


