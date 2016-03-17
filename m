Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6F78E70149
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 05:18:36 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id u110so63171461qge.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 22:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=06TtHwhoJanyGeGOI4Iw31RxTYTZbrNq0SqEDnIj9mw=;
	b=ix0V316YUCeI5/sRacY9NMolBmumT7ZkUJrkVhBHN+zNm0xToGljg7izrvUWUDG2MW
	PGzFAIrUZvDStyqAajdKcAL6rSuZStT0cwimfQHuR0JcAD4K8+XEeNTzNfRbXZMW/UEh
	Tb4Fk5GFaaj8rfErVZtCidI5crP8c6ldZ5cHr9AOFEXNTOpuRZwRKUzNftcmfj9ByOaw
	G2aLj/Kvg4NiTTNg5Oa48MsFvD9P4t09y+K/5TS3tCa47tQjMctZOsB1G7QbL/2FcWGS
	JnXEAOd8X3qSITPAiUEaFrvjIzWQ7cjEzdkqkKwgXdEj7bhTKcm4TERSLfgemeVgi+Vb
	QERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=06TtHwhoJanyGeGOI4Iw31RxTYTZbrNq0SqEDnIj9mw=;
	b=duOjNSPaVooUcShBMe4lLgk+xF/4g4HQ0vIJ8YU97/pCN+geSXSJFLNf45g1UMKkT8
	Dd7IdfshWakkwYiI/WkZ0swvdFNdKrBisaYwPf6Dga0ivsSlzAZ6H9F4/HT5Cf4ZMxKt
	jOjE3jXGz9HouTdUeyfsqMs4M67O55Ji/vZXwu5OCBi5G0K7ZGSmI8vcssYdpVh9VUPp
	hy4QX7bILYmwv6DGkitDAebGLzSdty0yojfMEncNFjxL5hiap4HaX4+DMawXrsf2szIn
	5Qk1PYi16j19WIPpjo/1NHexnlSCA3p1YLRuRdwBlW1zTjh941U8gjRldQznM9fmB8H6
	PWyw==
X-Gm-Message-State: AD7BkJJATmxDobzLNHx0e86OfMoCnwHinMciI8AexBL8mXXAWD44arPUNKW4fbSq7j/wCw==
X-Received: by 10.140.128.21 with SMTP id 21mr4565623qha.59.1458191916978;
	Wed, 16 Mar 2016 22:18:36 -0700 (PDT)
Received: from eos.sys.comcast.net (a-96-118-179-133.sys.comcast.net.
	[96.118.179.133]) by smtp.gmail.com with ESMTPSA id
	i46sm2216771qgd.19.2016.03.16.22.18.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 Mar 2016 22:18:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 05:18:20 +0000
Message-Id: <b807b4837bfb7f579a075e107e9cd7cc297b654b.1458191793.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458191793.git.raj.khem@gmail.com>
References: <cover.1458191793.git.raj.khem@gmail.com>
In-Reply-To: <cover.1458191793.git.raj.khem@gmail.com>
References: <cover.1458191793.git.raj.khem@gmail.com>
Subject: [PATCH 4/6] socat: Access c_ispeed and c_ospeed via APIs
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
X-List-Received-Date: Thu, 17 Mar 2016 05:18:37 -0000

make it more portable across libc implementations

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Access-c_ispeed-and-c_ospeed-via-APIs.patch | 39 ++++++++++++++++++++++
 meta/recipes-connectivity/socat/socat_1.7.3.1.bb   |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-connectivity/socat/socat/0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch

diff --git a/meta/recipes-connectivity/socat/socat/0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch b/meta/recipes-connectivity/socat/socat/0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch
new file mode 100644
index 0000000..367b48f
--- /dev/null
+++ b/meta/recipes-connectivity/socat/socat/0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch
@@ -0,0 +1,39 @@
+From 545d3dec8c91d6074516ffcfa79323ddf9d83839 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 15 Mar 2016 21:36:02 +0000
+Subject: [PATCH] Access c_ispeed and c_ospeed via APIs
+
+Use cfsetispeed(), cfsetospeed(), cfgetispeed, and cfgetospeed()
+instead of operating on c_ispeed and c_ospeed termios structure
+members directly because they are not guaranteed to exist on all
+libc implementations
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ xioinitialize.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/xioinitialize.c b/xioinitialize.c
+index 9f50155..632ca4c 100644
+--- a/xioinitialize.c
++++ b/xioinitialize.c
+@@ -65,10 +65,10 @@ int xioinitialize(void) {
+ #if HAVE_TERMIOS_ISPEED && (ISPEED_OFFSET != -1) && (OSPEED_OFFSET != -1)
+ #if defined(ISPEED_OFFSET) && (ISPEED_OFFSET != -1)
+ #if defined(OSPEED_OFFSET) && (OSPEED_OFFSET != -1)
+-      tdata.termarg.c_ispeed = 0x56789abc;
+-      tdata.termarg.c_ospeed = 0x6789abcd;
+-      assert(tdata.termarg.c_ispeed == tdata.speeds[ISPEED_OFFSET]);
+-      assert(tdata.termarg.c_ospeed == tdata.speeds[OSPEED_OFFSET]);
++      cfsetispeed(&tdata.termarg, 0x56789abc);
++      cfsetospeed(&tdata.termarg, 0x6789abcd);
++      assert(cfgetispeed(&tdata.termarg) == tdata.speeds[ISPEED_OFFSET]);
++      assert(cfgetospeed(&tdata.termarg) == tdata.speeds[OSPEED_OFFSET]);
+ #endif
+ #endif
+ #endif
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/socat/socat_1.7.3.1.bb b/meta/recipes-connectivity/socat/socat_1.7.3.1.bb
index b9a8a2f..6da9a17 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.3.1.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.3.1.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://Makefile.in-fix-for-parallel-build.patch \
            file://0001-define-NETDB_INTERNAL-to-1-if-not-available.patch \
+           file://0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch \
 "
 
 SRC_URI[md5sum] = "334e46924f2b386299c9db2ac22bcd36"
-- 
1.9.1


