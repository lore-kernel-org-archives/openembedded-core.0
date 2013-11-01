Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 342B8615AB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 12:12:01 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id e50so1962021eek.18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2013 05:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=JPm9ClIUB7akaveBqSNPV9xIYt6EC/BqHAvSNU2X+Po=;
	b=yt4XyfjCTkL1LF24NDjnDW9UCcSHjUVS9hQN4erhv7kWELYg1HINi31i3tG8YU6JPQ
	M1eVW3EM2una99IEyyt0ja+gStq1yyeBzCQbHC5pb75e60R5XuWizg8H+gS7jdX+Ueus
	bmpzcXpn4p/ADWoQUBShL3gKe9BbxVhrsiXr5ULxB3d0Mb7rWMms6qq4oPjRuqBZWI/Z
	84a9DU2rolRHR7elSlytXY5Z8vspatMCWjEMXd9zYRsQjGjvhAjhLuR9ZdLn7odL5ONx
	8kYLV1SZFvfcUU1yIur70+fNBz14wy2crRqOLzSOIhnlXmrKzkLOOi1IiCtnWy8zNsRH
	dXUA==
X-Received: by 10.14.115.133 with SMTP id e5mr2764446eeh.27.1383307922610;
	Fri, 01 Nov 2013 05:12:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id e13sm7047416eeu.4.2013.11.01.05.12.01
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Nov 2013 05:12:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Nov 2013 13:12:02 +0100
Message-Id: <1383307922-2493-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.2
Subject: [PATCH] xuser-account: Drop allarch inherit
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
X-List-Received-Date: Fri, 01 Nov 2013 12:12:03 -0000

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
1.8.4.2


