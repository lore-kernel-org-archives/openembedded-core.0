Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 52BA665DEC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 23:06:51 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id r10so6259661pdi.20
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 16:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=QRDQTE6G+RyA0hWa4lkHJ3OrTq5Y3gXbdOl/apaXESQ=;
	b=BGqkoI8nuptIsR25yy7mWPxWv8D3lNuZC8JZTezE3xNiey4B+4Yw3e4Ien5L5ldarg
	gX3p4YcAvmQ13kBDmvEeUEV5YUdC5oaKppK+iExsmX0G30a4vPnOyeTxgBuUSVoZycdX
	IAwwy1KR61+yfMV0GOSkSlLdTqDDoIlEJpMtz+Bt3Moep4q5F5IHBaSBdClA1sI5CR0e
	iL4Xcg7TAsIP3dAlX37oCN/xgW1S5gDBZOJEMGav0f6LnSbzLmIbKipVx1fbp3NhYH+x
	KKqB/Qk4daCrTXh/c3S+r29TfIqPgWAuSKwbNvUGnW/AkOOoKJiHXZXSpuGNUxcD3FPm
	xeFg==
X-Received: by 10.70.44.70 with SMTP id c6mr28407690pdm.75.1408316812345;
	Sun, 17 Aug 2014 16:06:52 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	ak1sm14320642pbc.58.2014.08.17.16.06.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Aug 2014 16:06:51 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Aug 2014 16:06:48 -0700
Message-Id: <1408316808-13486-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v3] nettle: update nettle to version 3.0
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
X-List-Received-Date: Sun, 17 Aug 2014 23:06:53 -0000

With this update, LGPLv3 or GPLv3 where  added to many files.
Each supported algorithms govern which license they want.
Many are stated as  "ether v2 or v3 or both in parallel".
Update license to be v2 or LGPLv3 or GPLv3.

The previous verion had one GPLv3 file so the license was incorrect.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../nettle/{nettle_2.7.1.bb => nettle_3.0.bb}             | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)
 rename meta/recipes-support/nettle/{nettle_2.7.1.bb => nettle_3.0.bb} (53%)

diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/recipes-support/nettle/nettle_3.0.bb
similarity index 53%
rename from meta/recipes-support/nettle/nettle_2.7.1.bb
rename to meta/recipes-support/nettle/nettle_3.0.bb
index f53afcc..a54317f 100644
--- a/meta/recipes-support/nettle/nettle_2.7.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.0.bb
@@ -1,17 +1,18 @@
 SUMMARY = "A low level cryptographic library"
 HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
 SECTION = "libs"
-LICENSE = "LGPLv2.1 & GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://serpent-decrypt.c;beginline=53;endline=67;md5=bcfd4745d53ca57f82907089898e390d \
-                    file://serpent-set-key.c;beginline=56;endline=70;md5=bcfd4745d53ca57f82907089898e390d"
-
+LICENSE = "LGPLv2.1 & GPLv2 | LGPLv3 | GPLv3"
+LIC_FILES_CHKSUM = "file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263\
+                    file://COPYING.LESSERv3;md5=6a6a8e020838b23406c81b19c1d46df6\
+                    file://COPYINGv3;md5=11cc2d3ee574f9d6b7ee797bdce4d423\
+                    file://serpent-decrypt.c;beginline=53;endline=67;md5=a4ccbeb343203d3586661f45c1cab577 \
+                    file://serpent-set-key.c;beginline=56;endline=70;md5=150b0ea44cdfb712a83331bff566e9a8"
 DEPENDS += "gmp"
 
 SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "003d5147911317931dd453520eb234a5"
-SRC_URI[sha256sum] = "bc71ebd43435537d767799e414fce88e521b7278d48c860651216e1fc6555b40"
+SRC_URI[md5sum] = "f64b1bf1e774b7ae6e507318e340250e"
+SRC_URI[sha256sum] = "9651c0bd2326eb737d0ed9eb403444712407c01a25b0fe813432ef31bebcd913"
 
 EXTRA_OECONF = "--disable-openssl"
 
-- 
1.9.1


