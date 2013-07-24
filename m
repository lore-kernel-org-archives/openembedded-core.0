Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 939ED6B321
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:02:22 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d49so186154eek.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=S2YpdSEm8jeucpLTK/qd26y8H3xwRYy6o7C1pq5UZuA=;
	b=nhypUHol70rBMDkBMoZ9qkWHnG/9dDvdr5gu7p5UVRXxC48ecmRaM9HBZRN4keTj2o
	E7rCCt6e7Knt4btUiVrJQoR0nNAKyUm5uZODH7/MiNn92ZLpPnGJt2pIbqqAhNxtkOfy
	u4pRVTJG4BHnbAKZ2CsZRJtzePPYDwcWRkWrKW9pdxmuDXrpEruPvaT1OqS9qreDg9ZZ
	37e0yLro+7nl6wlYFZLpLo+Vou9EK+mOueaqXm8iLouGUEI7vsQJ5QNqkzTL/xLgUULN
	21DEOGIO1pfjKWDGdVJQ0xTNcV+RoY+xN4BEyl+aJk7cUozWgdLW7S2rTsIOuKPlc8kD
	Qmig==
X-Received: by 10.15.90.139 with SMTP id q11mr37350928eez.137.1374667343055;
	Wed, 24 Jul 2013 05:02:23 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n5sm65619418eed.9.2013.07.24.05.02.22 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:02:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:02:26 +0200
Message-Id: <22d7e9b42b71bfdf64d6c9446628a8ad2365330b.1374667312.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
References: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374667312.git.Martin.Jansa@gmail.com>
References: <cover.1374667312.git.Martin.Jansa@gmail.com>
Subject: [PATCH 04/18] ccache: add zlib dependency
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
X-List-Received-Date: Wed, 24 Jul 2013 12:02:23 -0000

* when it's not detected in sysroot it uses bundled version
* add explicit dependency to make it deterministic
* PACKAGECONFIG wasn't used because configure doesn't have an
  option to select which one should be used

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/ccache/ccache.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/ccache/ccache.inc b/meta/recipes-devtools/ccache/ccache.inc
index 29ac409..087cb7d 100644
--- a/meta/recipes-devtools/ccache/ccache.inc
+++ b/meta/recipes-devtools/ccache/ccache.inc
@@ -7,6 +7,8 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 LICENSE = "GPLv3+"
 
+DEPENDS = "zlib"
+
 SRC_URI = "http://samba.org/ftp/ccache/ccache-${PV}.tar.xz"
 
 inherit autotools
-- 
1.8.3.2


