Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id E6EC26CD26
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Oct 2013 12:23:12 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so2308329eek.34
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Oct 2013 05:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=UAPqsc7DmAtNzZrzyFD1ESCRCSxaMKHpeJbFFfzWZFQ=;
	b=cSq04+g8Rf6QUVeqtbDGohjEb6T3OUiNTvv3UJzxSHEDFXvmpPP/Dsc4V1ks7ldF9G
	L11DaHqByuLhh+XJVlJ2z0ieV2M4T5newwe1wc+ToBWiRHEkSZailG0qAI7CLj9ig5kb
	a6YacaiqjQJVk4p8K2mhb1Hx5NuWFxJzzChCeBgVnuqcEddK3nqFaYr6wVXWXSoqubaR
	RakiM5tkxJqiwPou7i7NcwVYlsaUHjkAZNMaZ6zmAhkjHrsQtqVWvwlG9VT84Sup1DwQ
	Gl0y4eHEmOMBSdDYwHo97FdDBeamKd7T8JgmF1itfL5fx0mDEFaNgwn7IycMh0KVMArm
	+LCA==
X-Received: by 10.14.177.199 with SMTP id d47mr30233275eem.14.1380975794523;
	Sat, 05 Oct 2013 05:23:14 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m54sm39230900eex.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 05 Oct 2013 05:23:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Oct 2013 14:23:05 +0200
Message-Id: <1a3cec99f7fc6786f02a6fc44c6d33811f2d2db6.1380975568.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 08/14] tcl: Add dependency on zlib
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
X-List-Received-Date: Sat, 05 Oct 2013 12:23:13 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/tcltk/tcl_8.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.0.bb b/meta/recipes-devtools/tcltk/tcl_8.6.0.bb
index 7273182..8d4df30 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.0.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Tool Command Language"
 LICENSE = "BSD-3-Clause"
 SECTION = "devel/tcltk"
 HOMEPAGE = "http://tcl.sourceforge.net"
-DEPENDS = "tcl-native"
+DEPENDS = "tcl-native zlib"
 LIC_FILES_CHKSUM = "file://../license.terms;md5=3c6f62c07835353e36f0db550ccfb65a \
     file://../compat/license.terms;md5=3c6f62c07835353e36f0db550ccfb65a \
     file://../library/license.terms;md5=3c6f62c07835353e36f0db550ccfb65a \
-- 
1.8.3.2


