Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7F0FB7F8AB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 21:44:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47739K4036z8t
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 22:44:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572990293;
	bh=F3E2Scz1DoGlyVgcF43wBF08SI09WQ6qXeMK4bHjixM=;
	h=From:To:Subject:Date:From;
	b=WEkKLLQkC9RPZXWa+/RW3xynq6sThhpW63ezlWyhxnw1jgxqJ2QYVIaoJfDWLb6s+
	1SIuaqxoPLI5GacpP+O4X+Omud3k8vDYd/PsOU6D5oG4m00RTEktnkNeRqfnBmwnYC
	56EpXTABLXKb/SutjjE79d06X9X+1IQEb1X8/PCNj/pLA2D2eheh1C9L3k8C8g6JNk
	pQTHupA+PbSuAJ23ku32I0LEh9xDoHiKw8E55R22CfI5MDVurrt2SaNLWs+QENAKAI
	Nuxij4SGz6VGTtNNLnyT328I3YyKlnquuu5XFnBgtGpTT643Xc8zQzy33/WyS5e80K
	cMPp36w+hnO78Rv899ZQwMN2yEyDX3O0+HEAS979tJWoUHP64ngHW1MjSNjY/BQVHP
	2CvFkx+Nf/h+SHqHBPTx9s4fXS9+irzQ3cZCptOdSwEfoc6pRQHu5UDJbCO0u5r0Qv
	l03OKN+uMODqHMLk0iKIcM+6y6GXQ/ltzyKRTm0dzty8Y+PaC9ja3RdPJZvHmbLcIH
	mutSdiuPWsLe3uLKiXvZIeIvb1ZuiT/i+05adXgxIeb7CHEzpQWsnTAD1njW+f1zem
	uDPqeGSPw/+V5OovziuQJHW6M7GPldZhwmMsX3AWaHfV6YGfXTJUCPDIU2IZ9ytHNl
	oeoTrIT8KB0GbcpETg76lJoc=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 23:44:46 +0200
Message-Id: <20191105214448.2511-10-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] python3: Upgrade 3.7.4 -> 3.7.5
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
X-List-Received-Date: Tue, 05 Nov 2019 21:44:53 -0000

3.7.5 also includes the fixes for CVE-2019-16056 and CVE-2019-16935.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...Do-not-hardcode-lib-as-location-for-site-packages-an.patch | 2 +-
 ...python3-use-cc_basename-to-replace-CC-for-checking-c.patch | 2 +-
 .../python/{python3_3.7.4.bb => python3_3.7.5.bb}             | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.7.4.bb => python3_3.7.5.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch b/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
index 661f52d01f..ea75262c4f 100644
--- a/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
+++ b/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
@@ -70,7 +70,7 @@ index 6e81b2f..671a20e 100644
  
  Programs/python.o: $(srcdir)/Programs/python.c
 @@ -856,7 +857,7 @@ regen-opcode:
- Python/compile.o Python/symtable.o Python/ast_unparse.o Python/ast.o: $(srcdir)/Include/graminit.h $(srcdir)/Include/Python-ast.h
+ Python/compile.o Python/symtable.o Python/ast_unparse.o Python/ast.o Python/future.o Parser/parsetok.o: $(srcdir)/Include/graminit.h $(srcdir)/Include/Python-ast.h
  
  Python/getplatform.o: $(srcdir)/Python/getplatform.c
 -		$(CC) -c $(PY_CORE_CFLAGS) -DPLATFORM='"$(MACHDEP)"' -o $@ $(srcdir)/Python/getplatform.c
diff --git a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
index 5735954628..a0ea897f4e 100644
--- a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
+++ b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
@@ -63,7 +63,7 @@ index a7de901..4a3681f 100644
 +  case $cc_basename in
      *clang*)
        AC_SUBST(LLVM_AR)
-       AC_PATH_TARGET_TOOL(LLVM_AR, llvm-ar, '', ${llvm_path})
+       AC_PATH_TOOL(LLVM_AR, llvm-ar, '', ${llvm_path})
 @@ -1426,7 +1427,7 @@ then
    fi
  fi
diff --git a/meta/recipes-devtools/python/python3_3.7.4.bb b/meta/recipes-devtools/python/python3_3.7.5.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.7.4.bb
rename to meta/recipes-devtools/python/python3_3.7.5.bb
index af3c3259c2..30d4bedef2 100644
--- a/meta/recipes-devtools/python/python3_3.7.4.bb
+++ b/meta/recipes-devtools/python/python3_3.7.5.bb
@@ -32,8 +32,8 @@ SRC_URI_append_class-nativesdk = " \
            file://0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch \
            "
 
-SRC_URI[md5sum] = "d33e4aae66097051c2eca45ee3604803"
-SRC_URI[sha256sum] = "fb799134b868199930b75f26678f18932214042639cd52b16da7fd134cd9b13f"
+SRC_URI[md5sum] = "08ed8030b1183107c48f2092e79a87e2"
+SRC_URI[sha256sum] = "e85a76ea9f3d6c485ec1780fca4e500725a4a7bbc63c78ebc44170de9b619d94"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.17.1


