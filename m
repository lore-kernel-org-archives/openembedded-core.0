Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id D2DAA73E3B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 00:47:27 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id i5so6649792pag.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 17:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S2J8JYyAlOnKDbxWjHG4ehlqqwArMEVbbTmF5WZfMRY=;
	b=d3PT9qTmZ+Tz7oMozJfq2mWuOvUar06IYeM56semOxy5z1XSwWgoBZy8i635uyfcud
	RqRg6ToZM6TILGTJ8Sw5ITAuQvRy9uxPb+MkntOvFZILTKoQl28TdcbT8K8UFQlpf1Md
	v6Nu4VK51u84MAkQJmbPC+oTxUM71SgRd8/zVURUYB0HcgARZHAa3V3SjhT8o05mlToB
	EJeCaLSZihpSl76L0PZxuKYrRtRusQTweSrKn+qeXRBwgxL7vCtGPxrMX589x61gs+6Q
	Bs3oNyz7TbWn8oND1HBtY5+Mey7kJbhEp189VTb2VKcaKRrRR27mfRYaZs+/0mLlNjA4
	2EKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=S2J8JYyAlOnKDbxWjHG4ehlqqwArMEVbbTmF5WZfMRY=;
	b=aN+o28i5WxjBSZs8BboowoHoqyIuiF+f/oAWv22bxQGc+PCslSBGJjwr7Xa4MVpsr+
	Gq++RU6Bzz4q9HraVCvwxQuM4QipH06LP+K8mox2YgU3JoJGxHYrGTPE4TBkPke3iOiP
	51LRB2a9ODh/gZuHsU2Jz2VrN05qQg4Y2qEH9bup/DA4OgU8w7HQnoQBjGJe9/wYIyvr
	fUIYhnWkHbwuyajGMtbB8ohYTC3iExZLhBxyaKohs0Je4IYC1Er20KoyMomv3haEU6Xc
	VKeALSitd0acgbqYeAwNj07ePZDFskRKFnmkelHvZSWt0/vwa72+WjvSQt3AIpiw6jeL
	CnWw==
X-Gm-Message-State: AOPr4FUt2a/58SNB1V31RYCMQKzwCduRRqbnnWTm+B2wM0AC4b47W0jXeI0xnVFAO4y/ig==
X-Received: by 10.66.184.40 with SMTP id er8mr16604632pac.134.1461804448364;
	Wed, 27 Apr 2016 17:47:28 -0700 (PDT)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id m12sm9636649pfi.5.2016.04.27.17.47.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Apr 2016 17:47:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2016 17:47:21 -0700
Message-Id: <1461804443-13094-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1461804443-13094-1-git-send-email-akuster808@gmail.com>
References: <1461804443-13094-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [master][krogoth][PATCH 2/4] busybox: Security Fix CVE-2016-2148
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
X-List-Received-Date: Thu, 28 Apr 2016 00:47:28 -0000

From: Armin Kuster <akuster@mvista.com>

busybox <= 1.24.2

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../busybox/busybox/CVE-2016-2148.patch            | 74 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.24.1.bb        |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2016-2148.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2016-2148.patch b/meta/recipes-core/busybox/busybox/CVE-2016-2148.patch
new file mode 100644
index 0000000..af04a7f
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2016-2148.patch
@@ -0,0 +1,74 @@
+From 352f79acbd759c14399e39baef21fc4ffe180ac2 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Fri, 26 Feb 2016 15:54:56 +0100
+Subject: [PATCH] udhcpc: fix OPTION_6RD parsing (could overflow its malloced
+ buffer)
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2016-2148
+https://git.busybox.net/busybox/commit/?id=352f79
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ networking/udhcp/common.c | 15 +++++++++++++--
+ networking/udhcp/dhcpc.c  |  4 ++--
+ 2 files changed, 15 insertions(+), 4 deletions(-)
+
+Index: busybox-1.23.2/networking/udhcp/common.c
+===================================================================
+--- busybox-1.23.2.orig/networking/udhcp/common.c
++++ busybox-1.23.2/networking/udhcp/common.c
+@@ -142,7 +142,7 @@ const char dhcp_option_strings[] ALIGN1
+  * udhcp_str2optset: to determine how many bytes to allocate.
+  * xmalloc_optname_optval: to estimate string length
+  * from binary option length: (option[LEN] / dhcp_option_lengths[opt_type])
+- * is the number of elements, multiply in by one element's string width
++ * is the number of elements, multiply it by one element's string width
+  * (len_of_option_as_string[opt_type]) and you know how wide string you need.
+  */
+ const uint8_t dhcp_option_lengths[] ALIGN1 = {
+@@ -162,7 +162,18 @@ const uint8_t dhcp_option_lengths[] ALIG
+ 	[OPTION_S32] =     4,
+ 	/* Just like OPTION_STRING, we use minimum length here */
+ 	[OPTION_STATIC_ROUTES] = 5,
+-	[OPTION_6RD] =    22,  /* ignored by udhcp_str2optset */
++	[OPTION_6RD] =    12,  /* ignored by udhcp_str2optset */
++	/* The above value was chosen as follows:
++	 * len_of_option_as_string[] for this option is >60: it's a string of the form
++	 * "32 128 ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff 255.255.255.255 ".
++	 * Each additional ipv4 address takes 4 bytes in binary option and appends
++	 * another "255.255.255.255 " 16-byte string. We can set [OPTION_6RD] = 4
++	 * but this severely overestimates string length: instead of 16 bytes,
++	 * it adds >60 for every 4 bytes in binary option.
++	 * We cheat and declare here that option is in units of 12 bytes.
++	 * This adds more than 60 bytes for every three ipv4 addresses - more than enough.
++	 * (Even 16 instead of 12 should work, but let's be paranoid).
++	 */
+ };
+ 
+ 
+Index: busybox-1.23.2/networking/udhcp/dhcpc.c
+===================================================================
+--- busybox-1.23.2.orig/networking/udhcp/dhcpc.c
++++ busybox-1.23.2/networking/udhcp/dhcpc.c
+@@ -103,7 +103,7 @@ static const uint8_t len_of_option_as_st
+ 	[OPTION_IP              ] = sizeof("255.255.255.255 "),
+ 	[OPTION_IP_PAIR         ] = sizeof("255.255.255.255 ") * 2,
+ 	[OPTION_STATIC_ROUTES   ] = sizeof("255.255.255.255/32 255.255.255.255 "),
+-	[OPTION_6RD             ] = sizeof("32 128 ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff 255.255.255.255 "),
++	[OPTION_6RD             ] = sizeof("132 128 ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff 255.255.255.255 "),
+ 	[OPTION_STRING          ] = 1,
+ 	[OPTION_STRING_HOST     ] = 1,
+ #if ENABLE_FEATURE_UDHCP_RFC3397
+@@ -214,7 +214,7 @@ static NOINLINE char *xmalloc_optname_op
+ 	type = optflag->flags & OPTION_TYPE_MASK;
+ 	optlen = dhcp_option_lengths[type];
+ 	upper_length = len_of_option_as_string[type]
+-		* ((unsigned)(len + optlen - 1) / (unsigned)optlen);
++		* ((unsigned)(len + optlen) / (unsigned)optlen);
+ 
+ 	dest = ret = xmalloc(upper_length + strlen(opt_name) + 2);
+ 	dest += sprintf(ret, "%s=", opt_name);
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index f699f99..61fc878 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -44,6 +44,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://rcS \
            file://rcK \
            file://runlevel \
+           file://CVE-2016-2148.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.3.5


