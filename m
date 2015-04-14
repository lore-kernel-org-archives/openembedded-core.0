Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A9BC273D44
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 09:07:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3E97GnQ009779
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 02:07:16 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 14 Apr 2015 02:07:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Apr 2015 02:07:14 -0700
Message-ID: <90cb4cd9c55a3517fcce387b9df8f6647ea36a13.1429002381.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429002381.git.liezhi.yang@windriver.com>
References: <cover.1429002381.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] webkit-gtk: ANGLE doesn't build with bison 3
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
X-List-Received-Date: Tue, 14 Apr 2015 09:07:16 -0000
Content-Type: text/plain

From: Chong Lu <Chong.Lu@windriver.com>

Use %lex-param to set YYLEX_PARAM.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 ...bkit-gtk-ANGLE-doesn-t-build-with-bison-3.patch |   26 ++++++++++++++++++++
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb       |    1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/files/webkit-gtk-ANGLE-doesn-t-build-with-bison-3.patch

diff --git a/meta/recipes-sato/webkit/files/webkit-gtk-ANGLE-doesn-t-build-with-bison-3.patch b/meta/recipes-sato/webkit/files/webkit-gtk-ANGLE-doesn-t-build-with-bison-3.patch
new file mode 100644
index 0000000..e7e9083
--- /dev/null
+++ b/meta/recipes-sato/webkit/files/webkit-gtk-ANGLE-doesn-t-build-with-bison-3.patch
@@ -0,0 +1,26 @@
+webkit-gtk: ANGLE doesn't build with bison 3
+
+Use %lex-param to set YYLEX_PARAM.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ Source/ThirdParty/ANGLE/src/compiler/glslang.y | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Source/ThirdParty/ANGLE/src/compiler/glslang.y b/Source/ThirdParty/ANGLE/src/compiler/glslang.y
+index ec1a85c..15723cc 100644
+--- a/Source/ThirdParty/ANGLE/src/compiler/glslang.y
++++ b/Source/ThirdParty/ANGLE/src/compiler/glslang.y
+@@ -32,6 +32,7 @@ WHICH GENERATES THE GLSL ES PARSER (glslang_tab.cpp AND glslang_tab.h).
+ %expect 1 /* One shift reduce conflict because of if | else */
+ %pure-parser
+ %parse-param {TParseContext* context}
++%lex-param {YYLEX_PARAM}
+ 
+ %union {
+     struct {
+-- 
+1.9.1
+
diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
index 15c73cf..3f19c2d 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
@@ -26,6 +26,7 @@ SRC_URI = "\
   file://obsolete_automake_macros.patch \
   file://0001-Enable-mips64-build.patch \
   file://aarch64.patch \
+  file://webkit-gtk-ANGLE-doesn-t-build-with-bison-3.patch \
  "
 
 SRC_URI[md5sum] = "dcbf9d5e2e6391f857c29a57528b32a6"
-- 
1.7.9.5


