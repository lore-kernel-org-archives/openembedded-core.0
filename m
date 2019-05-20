Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 56FE67E07D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 18:58:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4577Tf2mgsz54
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 20:58:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558378726;
	bh=jNMruVKq9S0lckLCQYM0dyqHPvQt59IuH/928rA7rEs=;
	h=From:To:Subject:Date:From;
	b=jMwkHd0vmx27FVH8TuLInvxzVLZ7HdPxNatRbdjd52OdyLDw7UJPq1dsQTMbW6YMr
	v1QITzRE9DCl7v6N/Lxw3xferMg4TY9Pp8/pA55sgyP/R4OiAaNrmJjhB2+X7w3ajy
	4tMFw+C/J0kBfuP5uoed4jkcApi6RwofxGwdohMt0ZIlRfqmYLcrmd8mFaRMYTeaYW
	ePw99xCCY/ravG4cOGeEnrDPKLEzmHNHgd45KrN+7OXXXwqV2Siy48OPhBs9i3K2VN
	G9I0lW//tn2x0FK5eEY4ugibt6KK9lkRDGeCgeqzbWmIZ+kvm0dfYn46e99yVbN5Og
	IYeTM3IGntAHzm4LTlIhsG4Ea3lQr5UxR5UHkMdNpbhMAkUQKdGZj/1k7FHkodU1Se
	0y9RPyJByROvIIOMBPxCsMO048987psXZCY/bvjv3zvNPjPGxhGd7o8/JSNA1bEp3S
	Gro4p9EgzC1y/iFcOHrhgZvHN3EgYCkoxhl122wP6GOAbovvAFPbarXAJDA6Qcb+jv
	0wIsstsyuC3tr9nYJKtCK7iwRMK3Esmh1HikaRBw3JJE9F0HRWHwhEx3ls8/JQ0abp
	Hkmx9RAUetLFFD3BDeJPVLBR+uQkxqYJobBP6hbj4AeYmqxrmQxG8xMsgK6g7LfWbO
	t8rF3h9BFqs1ZujCBmLvuY6M=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 21:58:45 +0300
Message-Id: <20190520185845.17979-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] dropbear: update to 2019.78
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
X-List-Received-Date: Mon, 20 May 2019 18:58:46 -0000

From: Andrej Valek <andrej.valek@siemens.com>

The only change is a regression fix:
- Fix dbclient regression in 2019.77. After exiting the terminal would be left
  in a bad state. Reported by Ryan Woodsmall

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-core/dropbear/dropbear_2019.77.bb | 4 ----
 meta/recipes-core/dropbear/dropbear_2019.78.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2019.77.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2019.78.bb

diff --git a/meta/recipes-core/dropbear/dropbear_2019.77.bb b/meta/recipes-core/dropbear/dropbear_2019.77.bb
deleted file mode 100644
index d2a71ba647..0000000000
--- a/meta/recipes-core/dropbear/dropbear_2019.77.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require dropbear.inc
-
-SRC_URI[md5sum] = "5d4f0256c5d13820b0a3eaadb1a0bc1a"
-SRC_URI[sha256sum] = "d91f78ebe633be1d071fd1b7e5535b9693794048b019e9f4bea257e1992b458d"
diff --git a/meta/recipes-core/dropbear/dropbear_2019.78.bb b/meta/recipes-core/dropbear/dropbear_2019.78.bb
new file mode 100644
index 0000000000..d2cd8161bf
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear_2019.78.bb
@@ -0,0 +1,4 @@
+require dropbear.inc
+
+SRC_URI[md5sum] = "a972c85ed678ad0fdcb7844e1294fb54"
+SRC_URI[sha256sum] = "525965971272270995364a0eb01f35180d793182e63dd0b0c3eb0292291644a4"
-- 
2.17.1


