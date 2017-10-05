Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id D59D2719C4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 03:48:24 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l10so6328208wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Oct 2017 20:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=TeZuyh8Bfd+rNg9Y4EmRaj2+2OsFOi59BCFwY0oUK04=;
	b=TV7Yt2wDe74ZsL1V7bVMzMuLHApSE8EphkAWJ2C4aO+opdYWxrD4gD3wAhrlOHNpPK
	aR/nrXVHWJ4zACuWlf2WS/Jd2UUHzDKUqSM4KM0Coh8jsp9hhhTpbtWh4Rwq/w+sXAbg
	8wzjwxSCGbU7FTs97Lj7eH8ySXxKv1KfdBu5tPEbgKpUDAxUUzPKZKTfG8MTpeRhcsej
	CPFdqJyNFmEUhBUgESuQkbxdINUrOl+m4KkcM8FBd+/d6tKSd5Wic/SRsaVqkyh68WxV
	KhqhhcpQp8pNL07iaAVN4TAiUiOaPPlZTJp8PeUaTh59mMZB3geCG/8dpchVRGWkZ0mM
	jjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TeZuyh8Bfd+rNg9Y4EmRaj2+2OsFOi59BCFwY0oUK04=;
	b=iEx5GJFMbArJkE2ONmUtodz1w6MghQjoHESRzbpZUavgWuUACC044t9H1+JIR4lvAh
	7p4YfHivm/HXN5Q6datBZXuwRfto7WflrajRlvbBE5mKL82E5Jdwqa2u9qCZpWkIZH91
	2fc+YU2dZu3TMKpWGI6EpKBKILuqmVxpKk9Y5CCEJM11cilbkrvbcEpV8j2CJUUX62jq
	8rHOIx/ViqyhVLCCJsLF585xIGjhyAmDnXtneP0oXCgvTj6m497qhysf6hJQBytJQbr8
	INYgw4fIZ/snu5xmgXXqDe+JlE+vXFMts7oMpydi6efSLvjBoh3hC7pkgUqjsoyaix8s
	FsnA==
X-Gm-Message-State: AHPjjUhEKDkxifhIyjh/9ofZaLvKpA8uWZehbjkOZX1mwTkDsNSzpyBA
	q443UrdS/Kjoaso43nnTUG/fafH9
X-Google-Smtp-Source: AOwi7QCJIk6peOB1+OC5BAHVgO49Y2HpYssHfglCzKIxrKSH4MNSA/Zus2a9O++aSEGyuiq8TT7Isw==
X-Received: by 10.80.188.5 with SMTP id j5mr31267035edh.249.1507175305401;
	Wed, 04 Oct 2017 20:48:25 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([223.104.101.67]) by smtp.gmail.com with ESMTPSA id
	f27sm13145097edj.82.2017.10.04.20.48.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Oct 2017 20:48:24 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Oct 2017 05:48:06 +0200
Message-Id: <1507175286-8225-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] argp-standalone: set ALLOW_EMPTY to PN
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
X-List-Received-Date: Thu, 05 Oct 2017 03:48:25 -0000

From: Ming Liu <liu.ming50@gmail.com>

This ensures argp-standalone-staticdev package could be installed
correctly(depending on argp-standalone) if it's being required during
SDK population.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-support/argp-standalone/argp-standalone_1.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb b/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
index bd0cfdf..1242e31 100644
--- a/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
+++ b/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
@@ -19,6 +19,8 @@ inherit autotools
 
 CFLAGS += "-fPIC -U__OPTIMIZE__"
 
+ALLOW_EMPTY_${PN} = "1"
+
 do_install() {
 	install -D -m 0644 ${B}/libargp.a ${D}${libdir}/libargp.a
 	install -D -m 0644 ${S}/argp.h ${D}${includedir}/argp.h
-- 
2.7.4


