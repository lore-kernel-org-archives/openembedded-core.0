Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id D24567676B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Aug 2015 05:28:27 +0000 (UTC)
Received: by pabyb7 with SMTP id yb7so83184287pab.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Aug 2015 22:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=UiKAJFs2Il3NY/GvnhK7Et+hDFCEplZpMpyfb9t68Xo=;
	b=Uic6iXzj4F7hEmVfCP9pTnejcPyAOwkle4N2lWpIFpYFch9HeeVAeBilPAs40JNtGL
	gl+OV5tZjtXg5NVuwuw8M1XO97IxVSr7f6gPZX8JGKXNfkahseKlL5/Drpw7VcukjVi7
	t1wNKOD3R7siSi4VdsTo4fbTdekYDVd7wMKJA4zpMSj5rlrzLCgvYoAgzj4iwf9FrS2a
	uFGYAk5b9/NzuPcFkP7G3/bA9GRFUZHAeEn3B1imnsUmEHEnnboQnWa9jxhPSbKXjYvw
	Jp9k5KTvS92m2X4QFf3C+3ZfoeKolp156O0/iamRMC5QSiNc8TW2cDmqFsFtapGxypIA
	zaTw==
X-Received: by 10.66.120.75 with SMTP id la11mr12113324pab.14.1439098107362;
	Sat, 08 Aug 2015 22:28:27 -0700 (PDT)
Received: from localhost.localdomain ([223.196.115.131])
	by smtp.gmail.com with ESMTPSA id
	oh9sm15296257pbb.26.2015.08.08.22.28.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 08 Aug 2015 22:28:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Aug 2015 10:58:21 +0530
Message-Id: <1439098101-9400-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH] nettle: clean up license information
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
X-List-Received-Date: Sun, 09 Aug 2015 05:28:28 -0000

adding the license definitions on the few packages that
deviate from the overall package license.

based on http://www.lysator.liu.se/~nisse/nettle/nettle.html#Copyright
and spot checking files.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/nettle/nettle_2.7.1.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/recipes-support/nettle/nettle_2.7.1.bb
index f53afcc..f9d331f 100644
--- a/meta/recipes-support/nettle/nettle_2.7.1.bb
+++ b/meta/recipes-support/nettle/nettle_2.7.1.bb
@@ -2,6 +2,15 @@ SUMMARY = "A low level cryptographic library"
 HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
 SECTION = "libs"
 LICENSE = "LGPLv2.1 & GPLv2"
+
+LICENSE_${PN}-cast = "CC0"
+LICENSE_${PN}-gosthash = "MIT"
+
+# both public and GPL license listed
+LICENSE_${PN}-md2 = "CC0 & LGPLv2.1+"
+LICENSE_${PN}-md4 = "CC0 & LGPLv2.1+"
+
+
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://serpent-decrypt.c;beginline=53;endline=67;md5=bcfd4745d53ca57f82907089898e390d \
                     file://serpent-set-key.c;beginline=56;endline=70;md5=bcfd4745d53ca57f82907089898e390d"
-- 
2.3.5


