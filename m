Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id BD04A6B8C0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:23:22 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b10so185389eae.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Cox7+Ok7tCfjvDRJoxNtCdain9V5716yp/IjJ/f5lOc=;
	b=oi0wJD/4wdmVeA+cHRUPmZhNgqPhTgLK6UVAuAKqMigN6ce+IP3QyagSICk7ZmLAGa
	T9+bnH0JUi5eXn4lC4N9koncVWS0eJJ/GJjKb0SLDolgcfRyN0sprIe9ei9Gf0GVo1xo
	eZtuNrnnBENLSemRlphbi5wte4eAQDq2Qoe1c7eXvTXqKXdxNDRuUzJp2qwFVeFdRph1
	N8MHwRW4PNoG0ApS1HnQrCTHIE41tvDzczJCOx79O+L0o283gALno5AFTDLw27VsfAEM
	8T8ELF30CgYcUYRCnbpAh5dWbUwrS1yfWUJUop/CsfdGo1ox2QsOskCTOcdnsDS6AFMH
	oPyA==
X-Received: by 10.14.4.1 with SMTP id 1mr3306384eei.21.1376551403214;
	Thu, 15 Aug 2013 00:23:23 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k7sm81983253eeg.13.2013.08.15.00.23.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:23:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:35 +0200
Message-Id: <bac3c72d343a43e612c8155a137617b744e232d3.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 24/33] ltp: add acl, openssl dependency
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
X-List-Received-Date: Thu, 15 Aug 2013 07:23:23 -0000

* when it's not detected in sysroot it uses bundled version
* add explicit dependency to make it deterministic
* PACKAGECONFIG wasn't used because configure doesn't have an
  option to select which one should be used

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/ltp/ltp_20120903.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ltp/ltp_20120903.bb b/meta/recipes-extended/ltp/ltp_20120903.bb
index 87c45b0..522757d 100644
--- a/meta/recipes-extended/ltp/ltp_20120903.bb
+++ b/meta/recipes-extended/ltp/ltp_20120903.bb
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 		    file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		"
 
-DEPENDS = "attr libaio libcap"
+DEPENDS = "attr libaio libcap acl openssl"
 
 PR = "r2"
 
-- 
1.8.3.2


