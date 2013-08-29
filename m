Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 012246BD57
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:02:05 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id k11so353507eaj.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=UAPqsc7DmAtNzZrzyFD1ESCRCSxaMKHpeJbFFfzWZFQ=;
	b=1JWGEn84Qxl3VFKLhNBZIuF6UFi8BZ7W99FqaQzGCVhlkk+Vrpe00WHE1fq+n2p2JT
	0Tlc4WjTnjGBK46nKPIDuRYrZBN6QjxaR5Bm6W/uIJZrnTgsqvx+VUAm/BrwyJ/fmVkT
	F8hcYlkn6piCIzARV7aGfcxzR59JucP/XRd+WdK2m6LaQhd7354bR1sijFphXq0ekWkx
	yUZCzpc7cWxnBoZ6jgIhQbWEzrVJFNjSe3kdNQ+OMeZe5ftttD5d4JDqfBfAOORVBSda
	5YZ07hO3GjBvMR1f4BmSrAiRHNKVS9fa/I+hy+6SHFS0LsSfo0/hJmE+k5OAeimChjiq
	dBjw==
X-Received: by 10.15.35.1 with SMTP id f1mr3749362eev.79.1377792126445;
	Thu, 29 Aug 2013 09:02:06 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h52sm47235908eez.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 09:02:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 18:02:56 +0200
Message-Id: <41430b92d8af25d1ca523f517e9f776e5b4a5e70.1377792006.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 09/20] tcl: Add dependency on zlib
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
X-List-Received-Date: Thu, 29 Aug 2013 16:02:06 -0000

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


