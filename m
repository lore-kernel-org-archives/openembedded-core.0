Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1THReF-00077C-9s
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 05:53:55 +0200
Received: by pbbro12 with SMTP id ro12so4592314pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 20:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=2nFj6kZC3vR1gt4ak1LRx0cWW4NGQ8wfXPgFRZsd2X8=;
	b=HZ9R8Q4HmxjwLG5L5PXZfdUOy1u4hP5Y6FdzVBugkJvyUn6h4Q4lCK2wLSLbX7IIeF
	XsI6wYpHkDXkHx5sEIL/g36nvmZ6mkc7MMY84sDjg0W3CEFSnmBzN70TM8zk5sDZpsl+
	ifUl0B8ukjzN7hD3z7jfIjRDTWnUAWSLoy9/K8IY0VE8TsDJks/jex6JAnarKc0mxHWa
	94FrUDikowaRTGOX4ecizyuL3365nZzXQVYVacQ+Hr+mK+j5lrFpYNm9pA6g2SyKY9XL
	YGIlTX2iH7AqgEFeGulLUkzV1S+FR6+SnSXvTxEYfJ+siIpxZkGLLG3Ky2fuP0WlbKPz
	oDQA==
Received: by 10.68.225.199 with SMTP id rm7mr17026867pbc.150.1348803662121;
	Thu, 27 Sep 2012 20:41:02 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id s10sm4781602paz.11.2012.09.27.20.40.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Sep 2012 20:41:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2012 20:40:43 -0700
Message-Id: <1348803644-20961-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1348803644-20961-1-git-send-email-raj.khem@gmail.com>
References: <1348803644-20961-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH] flex,bison: Add nativesdk variants
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Sep 2012 03:53:55 -0000

It is needed in some SDKs that we ship own
version of lex/yacc for sdk host

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/bison/bison_2.5.1.bb |    2 +-
 meta/recipes-devtools/flex/flex_2.5.35.bb  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/bison/bison_2.5.1.bb b/meta/recipes-devtools/bison/bison_2.5.1.bb
index d53c1d6..47b4a6c 100644
--- a/meta/recipes-devtools/bison/bison_2.5.1.bb
+++ b/meta/recipes-devtools/bison/bison_2.5.1.bb
@@ -33,4 +33,4 @@ do_install_append_virtclass-native() {
 		BISON_PKGDATADIR=${STAGING_DATADIR_NATIVE}/bison
 }
 #bison-native encodes the staging M4 path
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/flex/flex_2.5.35.bb b/meta/recipes-devtools/flex/flex_2.5.35.bb
index 7419f10..2218c91 100644
--- a/meta/recipes-devtools/flex/flex_2.5.35.bb
+++ b/meta/recipes-devtools/flex/flex_2.5.35.bb
@@ -2,7 +2,7 @@ require flex.inc
 PR = "r3"
 LICENSE="BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e4742cf92e89040b39486a6219b68067"
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI += "file://avoid-FORTIFY-warnings.patch \
             file://int-is-not-the-same-size-as-size_t.patch"
-- 
1.7.9.5



