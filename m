Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7B3A06B316
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:02:38 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id c13so193579eek.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=plsJhT40rwXLoGWOyZkUdoD/Ua81nw4bF6MA5eR893Y=;
	b=0xA+Vztz1/eOUm7d82T8R8GlKae2W1d8cbOtXvmHpZbgPS6K2rOPWZLgCHSi1yDczc
	mC3Q2QikKw7XQi1gXZ+Bo/P5gvYk3JshhVdBPmnkGCWJ17kJpOf/zlN87Hs3vvfMBc+7
	hOaEjuZ27QnmxV1UbrV/ZBOkvDFTFvjUcpeJGwIabF+pmSkragWl63pQjN37vsUqwgkQ
	6/z3KNi9yxKt3iwWSv6HOLTwp8c2fyZPo0r+IHy07/ApEwtAB1TFzn8eeoZvlt2yvgKZ
	BcekdDex6/J+E2eYrvUaArgajN5+sfx7RNzmzJ97dxrF2tA6xi+tL/FAueuYMBF3Xt+U
	9GYg==
X-Received: by 10.15.33.132 with SMTP id c4mr37712737eev.12.1374667358959;
	Wed, 24 Jul 2013 05:02:38 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	c3sm65665348eev.3.2013.07.24.05.02.38 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:02:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:02:37 +0200
Message-Id: <8ad16685c921eb35800987d7e7571f4c500cb8a9.1374667312.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
References: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374667312.git.Martin.Jansa@gmail.com>
References: <cover.1374667312.git.Martin.Jansa@gmail.com>
Subject: [PATCH 15/18] sudo: add PACKAGECONFIG for zlib
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
X-List-Received-Date: Wed, 24 Jul 2013 12:02:38 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/sudo/sudo.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 9dcb677..ef2367a 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -13,6 +13,9 @@ LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=d25a8240ca6decdecb9990789e593130 \
 
 inherit autotools
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib"
+
 EXTRA_OECONF = "--with-editor=/bin/vi --with-env-editor"
 
 do_configure_prepend () {
-- 
1.8.3.2


