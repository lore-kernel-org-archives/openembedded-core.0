Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4BA806B259
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:02:34 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id e49so187435eek.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=W8zIXoPKpsGShXZ3R++chMHFLfUuaUYOfw6l6LhMR0g=;
	b=mhp5HQEXLrElecm4+55g4iOvlV15eOotEoFWB2wIJg8REHRK1gtfZWSIY/oA01974q
	3NjkEczhX04tue8rEbp6bFJByYQ/gOAJifbdYvrUND/xqfHJcCE6lVQ4SicpBhD6/LJ8
	OP406BZIQdJqqR8o21xI2I0Vq3bwkYU8BVDQgzfRArhybwqjUARHlr+wSKT5u7P5H5zq
	BEMwDFcTmwUVB5+uscjYTpC31+1SPfMeRt78Y8kI1nffwdJ6zh2SRKwA33tWvOg8SkaF
	4P8aXfWUuOy0IMKgY2G+bi4gJGmifyydLfVqHNZDeVwCA/NI89+eu8ar+GTJC8TJ4um9
	u+cA==
X-Received: by 10.15.23.194 with SMTP id h42mr36686653eeu.123.1374667354765;
	Wed, 24 Jul 2013 05:02:34 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	c3sm65664953eev.3.2013.07.24.05.02.34 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:02:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:02:34 +0200
Message-Id: <cf3557c26f59e251eb210879e736448bf869700c.1374667312.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
References: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374667312.git.Martin.Jansa@gmail.com>
References: <cover.1374667312.git.Martin.Jansa@gmail.com>
Subject: [PATCH 12/18] patch: add PACKAGECONFIG for attr
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
X-List-Received-Date: Wed, 24 Jul 2013 12:02:34 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/patch/patch.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/patch/patch.inc b/meta/recipes-devtools/patch/patch.inc
index 332b97a..b49226a 100644
--- a/meta/recipes-devtools/patch/patch.inc
+++ b/meta/recipes-devtools/patch/patch.inc
@@ -9,5 +9,8 @@ S = "${WORKDIR}/patch-${PV}"
 
 inherit autotools update-alternatives
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[attr] = "--enable-xattr,--disable-xattr,attr"
+
 ALTERNATIVE_${PN} = "patch"
 ALTERNATIVE_PRIORITY = "100"
-- 
1.8.3.2


