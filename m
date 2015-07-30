Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 69F407639E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 14:41:58 +0000 (UTC)
Received: by lbbud7 with SMTP id ud7so24612474lbb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 07:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=dgKZDVEcaVtJOdanVnE4ISDsR+/RVy+uRtNK4v2Gl1c=;
	b=ijdxeKqyFf51Y2T5zS3dBERD7/BmAzyD4hpKf3DtT+xDPtwNGo9ZuJsQs6fychJ80T
	SpscXnWT3+WfoWuJuOytvgGO3VThf0pX9BMCvkJVS0esikx+NQkW+uJboxFrWI1n0JcZ
	KX44yXCS/iywYJ8+UMAKLt0pUPqjGtX9VxbQBjiw+S8urRaeQkncL2Hi6ORwKDe4P+/b
	ASVyRgHXEnCOQvGs42/HxL/7aohdkjetkl/TkDEBO/B30EQ9rsHc+Sq5Z3iscACig0j4
	pOu/SMX7YZ98pXss1FpH56CLJS5vX2fi2EqwZTFbOjaauprjuqgCIQjfWYxrIh4XhzFK
	dgSg==
X-Received: by 10.152.18.194 with SMTP id y2mr44070871lad.5.1438267316743;
	Thu, 30 Jul 2015 07:41:56 -0700 (PDT)
Received: from umbar.auriga.ru (cl-1614.mbx-01.si.sixxs.net.
	[2001:15c0:65ff:64d::2])
	by smtp.gmail.com with ESMTPSA id y10sm294416laj.26.2015.07.30.07.41.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Jul 2015 07:41:55 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 17:41:48 +0300
Message-Id: <1438267308-27294-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.4.6
Subject: [PATCH] python-native: add dependency on gtk-doc-stub-native
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
X-List-Received-Date: Thu, 30 Jul 2015 14:41:58 -0000

python-native uses gtk-doc in ctypes module. However as it is a
dependency in the subdirectory (subproject), it is not possible to use
gtk-doc class directly, so just add a missing dependency.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-devtools/python/python-native_2.7.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-native_2.7.9.bb b/meta/recipes-devtools/python/python-native_2.7.9.bb
index 34f5c29..62fbf34 100644
--- a/meta/recipes-devtools/python/python-native_2.7.9.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.9.bb
@@ -1,7 +1,7 @@
 require python.inc
 
 EXTRANATIVEPATH += "bzip2-native"
-DEPENDS = "openssl-native bzip2-replacement-native zlib-native readline-native sqlite3-native"
+DEPENDS = "openssl-native bzip2-replacement-native zlib-native readline-native sqlite3-native gtk-doc-stub-native"
 PR = "${INC_PR}.1"
 
 SRC_URI += "\
-- 
2.4.6


