Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5F4616D5A0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2013 13:52:22 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g15so1113602eak.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2013 05:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oa+i5tu0w3SmO0kLD9Q+s3ux41BCZiks5eVJpMm3Vlo=;
	b=p+HScYgZ0c4NqVIr/C0CPWAms8JqHXj9TlGi8yT79Z0pZivxXydRvrN0kw/EFBCmow
	Sw+o/fogBePXdjisK+/7nfSsG1tDs7NSy71jBGn1eNyo372ElGWKZfQ77GJUYAyBvnCm
	OsS4+EhL2QHqJ51YDN/NN8UVdBVecDaEtl0v17aLSfsq529TAncmd/S8kSHlfBqd3asC
	IPgn0alGAWVuv68eSQLAdfZXoMIcBfTAEQ/oKWf8QOuppk9pXj4A2e/391YafcenGT6f
	A5Lgnnz/ColInFTlMkmrzUIcSYjixM2eoy8sEzeOGKbF0MY42hPjYb0f3V9dlqGbo2mo
	acZw==
X-Received: by 10.15.43.140 with SMTP id x12mr4579406eev.4.1384696343913;
	Sun, 17 Nov 2013 05:52:23 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id a45sm10331606eem.6.2013.11.17.05.52.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Nov 2013 05:52:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Nov 2013 14:52:14 +0100
Message-Id: <1384696338-5390-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1384696338-5390-1-git-send-email-Martin.Jansa@gmail.com>
References: <1383307932-4041-1-git-send-email-Martin.Jansa@gmail.com>
	<1384696338-5390-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 3/7] xuser-account: Drop allarch inherit
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
X-List-Received-Date: Sun, 17 Nov 2013 13:52:22 -0000

* has build time dependency on TUNE_PKGARCH recipes:
  bitbake-diffsigs sstate-diff/1383303628/*/all*/xuser-account/*do_configure*
  Hash for dependent task base-passwd_3.5.26.bb.do_populate_sysroot changed from 09b3168865b6212269d4e5512a963b9e to ffa22dc51e42a164a7392ec719151629
  Hash for dependent task shadow_4.1.4.3.bb.do_populate_sysroot changed from f426f0c93b2d341050b2547804645314 to 89bdbb151f8c200553c9a74e89504457
  Hash for dependent task shadow-sysroot_4.1.4.3.bb.do_populate_sysroot changed from c42103fe54ac5109eab8de4fb0eb9a75 to f83f628e766fdbd49eb2a44cf6134339

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/user-creation/xuser-account_0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/user-creation/xuser-account_0.1.bb b/meta/recipes-support/user-creation/xuser-account_0.1.bb
index 58e8139..f9b8ccd 100644
--- a/meta/recipes-support/user-creation/xuser-account_0.1.bb
+++ b/meta/recipes-support/user-creation/xuser-account_0.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 
 SRC_URI = ""
 
-inherit allarch useradd
+inherit useradd
 
 do_configure() {
     :
-- 
1.8.4.3


