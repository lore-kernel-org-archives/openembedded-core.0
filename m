Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 058627210A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Nov 2014 20:15:55 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id l15so5682021wiw.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Nov 2014 12:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sn8rWdbj8ArbIr+R4KDOdhYyjDzubcV+uTrh7nNf4uk=;
	b=eJCVvgQuaVTu8dia2rwCr32kJLzaL7me7+6iY3wu12gwL28aLAsY5x1SRhoHvEfVRm
	dgRAw60VI4UQQrGMtK6h65tfec4fexcXxzXGGYmE9IIY7RF1Jb48uytGmQm/DWzM8Xdn
	2Rsja9Svj6SH7ScZBybY1MMq71d4aaxuD4WrMKad2L4H3e9RyHRKpvK7P7/nonvtvLe7
	t6Ofcx666GteNrYj8TNkLwKz7iQMKbkAbPCZwj9UqoKFjzKJsrKN2wlSIwjg8yX4fQyH
	5Vazcp0h/bFxYy4oStzPSZcHf1hzHiRFU1KelAWS67XqcF/1X75q1sDTTTAek9Ae4LER
	p4zA==
X-Received: by 10.180.14.165 with SMTP id q5mr19019281wic.0.1416082555638;
	Sat, 15 Nov 2014 12:15:55 -0800 (PST)
Received: from loki.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id s2sm8266290wia.3.2014.11.15.12.15.54
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Nov 2014 12:15:54 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Nov 2014 20:15:42 +0000
Message-Id: <1416082543-7559-3-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1416082543-7559-1-git-send-email-paul@paulbarker.me.uk>
References: <1416082543-7559-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH 2/3] opkg: Update patch status
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
X-List-Received-Date: Sat, 15 Nov 2014 20:15:58 -0000

Both patches against opkg have been accepted upstream with modifications and
will be included in the v0.3.0 release.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-devtools/opkg/opkg/add-exclude.patch           | 2 +-
 meta/recipes-devtools/opkg/opkg/no-install-recommends.patch | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg/add-exclude.patch b/meta/recipes-devtools/opkg/opkg/add-exclude.patch
index a10014d..48de923 100644
--- a/meta/recipes-devtools/opkg/opkg/add-exclude.patch
+++ b/meta/recipes-devtools/opkg/opkg/add-exclude.patch
@@ -15,7 +15,7 @@ so there is no need to free the data.
 v2: Use xmalloc instead of malloc and xrealloc instead of realloc. In opkg,
 these functions are guaranteed not to return NULL.
 
-Upstream-Status: Pending
+Upstream-Status: Accepted for v0.3.0 release with modifications
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 Signed-off-by: Jonathan Liu <net147@gmail.com>
diff --git a/meta/recipes-devtools/opkg/opkg/no-install-recommends.patch b/meta/recipes-devtools/opkg/opkg/no-install-recommends.patch
index b4aed9c..c2d244d 100644
--- a/meta/recipes-devtools/opkg/opkg/no-install-recommends.patch
+++ b/meta/recipes-devtools/opkg/opkg/no-install-recommends.patch
@@ -5,7 +5,7 @@ Subject: [PATCH 1/2] opkg-0.2.x: no-install-recommends
 
 Add the ability to not install ANY recommended packages.
 
-Upstream-Status: Pending
+Upstream-Status: Accepted for v0.3.0 release with modifications
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 ---
-- 
2.1.3


