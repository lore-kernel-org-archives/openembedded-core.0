Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1F7876B339
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:02:32 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id e49so187839eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+72udi0izrkAUAkZJd5crx3UvMFJfnwDSsm+9m3mJ0s=;
	b=mIVv7WR9kzJoGvWNJFkjn9kgtbvOKe5860Z0WhSy9nJWdvKCNEpSyo79ql2S8G0p9t
	5TRjNIEPx0XWABNmDUt4BJ2nhD+TwqyxSKpnJU46FXed6Qp14kAJaRH1363iQ9E9ihgT
	LJMp1F/TmUAwZSDYu25Ye6i4X/WRynIZKqS64ItEh4ba6IM/2oVN6NWetkejEfkrwX9e
	IkzLHw+uNFDp4c7FESncXgG1mvhqvd5WVtrtW1S8qJbJpK+AJUude29DI2zVV6Cbtzlv
	jguTIJ/slyy6yVOPUwKB4y9IYlsVHSe60M6nwtV2E0kn7V4XxK7v+xs0deGzJjy90NS5
	497Q==
X-Received: by 10.15.10.132 with SMTP id g4mr18983124eet.38.1374667353488;
	Wed, 24 Jul 2013 05:02:33 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	i2sm65656691eeu.4.2013.07.24.05.02.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:02:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:02:33 +0200
Message-Id: <1168f5e02373d5b98ac24af9649c72c00df29b3a.1374667312.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
References: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374667312.git.Martin.Jansa@gmail.com>
References: <cover.1374667312.git.Martin.Jansa@gmail.com>
Subject: [PATCH 11/18] ltp: add acl, openssl dependency
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
X-List-Received-Date: Wed, 24 Jul 2013 12:02:33 -0000

* when it's not detected in sysroot it uses bundled version
* add explicit dependency to make it deterministic
* PACKAGECONFIG wasn't used because configure doesn't have an
  option to select which one should be used

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/ltp/ltp_20130503.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ltp/ltp_20130503.bb b/meta/recipes-extended/ltp/ltp_20130503.bb
index c00c647..387826d 100644
--- a/meta/recipes-extended/ltp/ltp_20130503.bb
+++ b/meta/recipes-extended/ltp/ltp_20130503.bb
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 		    file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		"
 
-DEPENDS = "attr libaio libcap"
+DEPENDS = "attr libaio libcap acl openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2"
 
-- 
1.8.3.2


