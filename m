Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOuqK-0002bu-7R
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 19:57:00 +0200
Received: by pbbrq2 with SMTP id rq2so3372519pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 10:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=6tw4V0aLyDaQrW3QCF0kxR24Gb2+XAAvQDyMpRPihyI=;
	b=tLUr451uxre0yYKMyudaDHEPgTSaQnsjLJVR0XSaDemcSyK3D72hOAQF2JWakoQT9Z
	aYBNx3lndNm64aK1DzyljRFy/jgZRjWtPPf20eBHhcVknTNuw6eqAOJYEnvvQoz/8FBj
	5pLQ80hQMbPf4eQWACkmDgYHpeYod1XkJcI9Zq0PRKJTq0dayXW1TOkG7lI3637O0sFG
	aJm4TyriBARNyFVWxKRbmq1lHd98tjYttFvTodnFxNLe/8kgSR2vukh1IzM8/pYCfrEb
	11EOkJAwHrkggrM7zVx4djknbHYhkzXx1xS7Ivpdyy2K+BlKVjKmm362jt6+gDPoY6lX
	Cw+A==
Received: by 10.68.200.68 with SMTP id jq4mr22314941pbc.42.1335808037254;
	Mon, 30 Apr 2012 10:47:17 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id sx8sm8239860pbc.53.2012.04.30.10.47.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Apr 2012 10:47:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2012 10:46:16 -0700
Message-Id: <392442de49633f6d0f3146fb5a86ad25e6c91015.1335807802.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1335807802.git.raj.khem@gmail.com>
References: <cover.1335807802.git.raj.khem@gmail.com>
Subject: [PATCH 01/10] uclibc-git: Update to latest git tip
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Apr 2012 17:57:00 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc_git.bb b/meta/recipes-core/uclibc/uclibc_git.bb
index 0088152..55e72ff 100644
--- a/meta/recipes-core/uclibc/uclibc_git.bb
+++ b/meta/recipes-core/uclibc/uclibc_git.bb
@@ -1,11 +1,11 @@
-SRCREV="eb72efd81e0d5be6c836c5a084cc65b9734f544d"
+SRCREV="7bad8cf68b6e2434686bd80182f4a5bc22004416"
 
 require uclibc.inc
 
 # We prefer a release version so DP -1 for this
 DEFAULT_PREFERENCE = "-1"
 
-PV = "0.9.32+0.9.33-rc0"
+PV = "0.9.33+git${SRCPV}"
 PR = "${INC_PR}.1"
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
-- 
1.7.5.4



