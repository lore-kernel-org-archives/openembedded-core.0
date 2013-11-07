Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id CFD446D6E6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 06:03:16 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz1so114487pad.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Nov 2013 22:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7NNz1qlZTLVkt+gSza2h3Bp12fysF4jMsjZF+Z+uasI=;
	b=fiYzrTQ+EbSz3EhGtTjK6bKCsmj/tEICzNelzjWrdW1FbdzkpXojlmrFR8V8zFecdU
	FDKM496uB9nOp44VLWJ+QirBg9e0cP5Y3yntAjb+2RH9CxOWrALvQi20nTUhJz5T4AD0
	7TPd26K13tOp8/TwIhx5nXoCp5lLCKclDZqcZ3WCPQ8mGalwpjvYXP7xcMzV1SukOJkV
	4OC7pzmdxLEZ788ga3U5dVwlxB9f06kEkRLqmHp52T/yQpowPQ4tGKrIKvPfUj6egPPR
	6q1Wfh/OhCFR4G+DfJx8WOI/jT8R54MU0RK3rPuyNxw+mr81w8N4ThaKzIS0DgylD46C
	SxAQ==
X-Received: by 10.68.211.233 with SMTP id nf9mr7165982pbc.85.1383804198702;
	Wed, 06 Nov 2013 22:03:18 -0800 (PST)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id b3sm2338962pbu.38.2013.11.06.22.03.17
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 06 Nov 2013 22:03:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2013 22:02:31 -0800
Message-Id: <1383804151-21756-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] Revert "glib-2.0: Specify libiconv when building on uclibc"
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
X-List-Received-Date: Thu, 07 Nov 2013 06:03:17 -0000

This reverts commit 38b6c4df7c215ed7fd6be107fbc2527e66791e2e.

Its not needed anymore after upgrade to 2.38

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.38.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.38.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.38.1.bb
index 3e874d7..f9966e7 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.38.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.38.1.bb
@@ -45,7 +45,6 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = "\
             eglibc-charmap-invariant \
             eglibc-localedata-translit-cjk-variants \
            "
-EXTRA_OECONF_append_class-target_libc-uclibc = " --with-libiconv=gnu"
 
 do_configure_prepend() {
 	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
-- 
1.8.3.2


