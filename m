Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D26E37DE82
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 06:33:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5P6XXLW016349
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 23:33:49 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Mon, 24 Jun 2019 23:33:44 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Jun 2019 14:45:37 +0800
Message-ID: <e6bbd4b8638ad2c20ab9f121a2afb4fb95843898.1561445112.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1561445112.git.Qi.Chen@windriver.com>
References: <cover.1561445112.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] target-sdk-provides-dummy: add libperl.so.5 64bit
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
X-List-Received-Date: Tue, 25 Jun 2019 06:33:58 -0000
Content-Type: text/plain

With postgresql added to IMAGE_INSTALL, we will get the following
error when building for 64bit BSPs.

  Problem: package postgresql-11.3-r0.corei7_64 requires libperl.so.5()(64bit), but none of the providers can be installed

A previous patch has added libperl.so.5 to DUMMY_PROVIDES, but this
is not enough. Because for 64bit BSP, it should also provide libperl.so.5()(64bit).

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/meta/target-sdk-provides-dummy.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
index b5e8c0f..c33cb80 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -47,6 +47,7 @@ DUMMYPROVIDES = "\
     /usr/bin/env \
     /usr/bin/perl \
     libperl.so.5 \
+    libperl.so.5()(64bit) \
     pkgconfig \
     pkgconfig-dev \
     pkgconfig-src \
-- 
1.9.1


