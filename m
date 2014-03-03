Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DE6F66F592
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 10:56:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s23AuEps001827
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Mar 2014 02:56:14 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 3 Mar 2014 02:56:14 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Mar 2014 18:55:58 +0800
Message-ID: <f199fec4be58f52db54e6daf2f3161e8b9f60a47.1393839207.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1393839207.git.hongxu.jia@windriver.com>
References: <cover.1393839207.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 2/2] bash: update build-tests.patch
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
X-List-Received-Date: Mon, 03 Mar 2014 10:56:14 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../bash/{bash-4.2 => bash}/build-tests.patch      | 33 +++++++++++++---------
 1 file changed, 20 insertions(+), 13 deletions(-)
 rename meta/recipes-extended/bash/{bash-4.2 => bash}/build-tests.patch (51%)

diff --git a/meta/recipes-extended/bash/bash-4.2/build-tests.patch b/meta/recipes-extended/bash/bash/build-tests.patch
similarity index 51%
rename from meta/recipes-extended/bash/bash-4.2/build-tests.patch
rename to meta/recipes-extended/bash/bash/build-tests.patch
index 0360881..73a81b6 100644
--- a/meta/recipes-extended/bash/bash-4.2/build-tests.patch
+++ b/meta/recipes-extended/bash/bash/build-tests.patch
@@ -1,29 +1,33 @@
 Add 'ptest' target to Makefile, to run tests without checking dependencies.
 
-Signed-off-by: Anders Roxell <anders.roxell@enea.com>
 Upstream-Status: Pending
+Signed-off-by: Anders Roxell <anders.roxell@enea.com>
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
-diff -uNr a/Makefile.in b/Makefile.in
---- a/Makefile.in	2012-11-06 08:40:07.552403063 +0100
-+++ b/Makefile.in	2012-11-06 11:13:36.958297555 +0100
-@@ -827,20 +827,34 @@
+ Makefile.in | 24 +++++++++++++++++++-----
+ 1 file changed, 19 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -848,20 +848,34 @@ maybe-clean:
  	fi
  
  recho$(EXEEXT):		$(SUPPORT_SRC)recho.c
--	@$(CC_FOR_BUILD) $(CCFLAGS_FOR_BUILD) -o $@ $(SUPPORT_SRC)recho.c ${LIBS_FOR_BUILD}
-+	@$(CC) $(CCFLAGS) -o $@ $<
+-	@$(CC_FOR_BUILD) $(CCFLAGS_FOR_BUILD) ${LDFLAGS_FOR_BUILD} -o $@ $(SUPPORT_SRC)recho.c ${LIBS_FOR_BUILD}
++	@$(CC) $(CCFLAGS) ${LDFLAGS} -o $@ $<
  
  zecho$(EXEEXT):		$(SUPPORT_SRC)zecho.c
--	@$(CC_FOR_BUILD) $(CCFLAGS_FOR_BUILD) -o $@ $(SUPPORT_SRC)zecho.c ${LIBS_FOR_BUILD}
-+	@$(CC) $(CCFLAGS) -o $@ $<
+-	@$(CC_FOR_BUILD) $(CCFLAGS_FOR_BUILD) ${LDFLAGS_FOR_BUILD} -o $@ $(SUPPORT_SRC)zecho.c ${LIBS_FOR_BUILD}
++	@$(CC) $(CCFLAGS) ${LDFLAGS} -o $@ $<
  
  printenv$(EXEEXT):	$(SUPPORT_SRC)printenv.c
--	@$(CC_FOR_BUILD) $(CCFLAGS_FOR_BUILD) -o $@ $(SUPPORT_SRC)printenv.c ${LIBS_FOR_BUILD}
-+	@$(CC) $(CCFLAGS) -o $@ $<
+-	@$(CC_FOR_BUILD) $(CCFLAGS_FOR_BUILD) ${LDFLAGS_FOR_BUILD} -o $@ $(SUPPORT_SRC)printenv.c ${LIBS_FOR_BUILD}
++	@$(CC) $(CCFLAGS) ${LDFLAGS} -o $@ $<
  
  xcase$(EXEEXT):	$(SUPPORT_SRC)xcase.c
--	@$(CC_FOR_BUILD) $(CCFLAGS_FOR_BUILD) -o $@ $(SUPPORT_SRC)xcase.c ${LIBS_FOR_BUILD}
-+	@$(CC) $(CCFLAGS) -o $@ $<
+-	@$(CC_FOR_BUILD) $(CCFLAGS_FOR_BUILD) ${LDFLAGS_FOR_BUILD} -o $@ $(SUPPORT_SRC)xcase.c ${LIBS_FOR_BUILD}
++	@$(CC) $(CCFLAGS) ${LDFLAGS} -o $@ $<
  
 -test tests check:	force $(Program) $(TESTS_SUPPORT)
 +test tests check:
@@ -46,3 +50,6 @@ diff -uNr a/Makefile.in b/Makefile.in
  	@( cd $(srcdir)/tests && \
  		PATH=$(BUILD_DIR)/tests:$$PATH THIS_SH=$(THIS_SH) $(SHELL) ${TESTSCRIPT} )
  
+-- 
+1.8.1.2
+
-- 
1.8.1.2


