Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 64A5B7EE93
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:25:49 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id i189so16130084pfg.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+v5zUZh7rDXQQBfLM5OjpUeVfZfqH+T6+fE2ZIVxDSw=;
	b=I0pLbKjYxZf870nnoOIuOrUqDs9OEMauuQfOgX6zaL2j6m3WRP+3EHK0PuOpJEer+9
	Eyokr8I8AU+1O8wOB4YSLrt2VhfkOIGcSDEqMjalweyKpZYJPEI/uj99gb8jK7Sd4O4p
	n6H7muY61JEshPQYMQ5UTEr+RK4zkugYAUpyuKmxqCnZwothiOvQ3a0tW9GZbS8FdsYU
	7T/5WGi2yZ28Q5DYhzWJWDgZIcBI9Q6RlWPpQHhDFDbfJ/zt8iqqfjbA3xCjTy0bojwL
	y82VwWNctCMse1cuUIJa/iErKObzQVhJta3yi9sRE8hNu8jGk7+rnBO7IFWzv64ZULuG
	7jDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+v5zUZh7rDXQQBfLM5OjpUeVfZfqH+T6+fE2ZIVxDSw=;
	b=tXVckYZVqR+VC7Mu/WCY0KgqvNvEwAWy8gc3j4P9Rn72sPAfrt6cjJW7WfbCRd3V3z
	gHW0JuaEaPBXBDJJz1soVL0eIKkPyQ3ysvwC2hWo2fF96MqKR2UhEVgBBktWLTh7NJvN
	ed9pXEjmx9wjw0kevGBLY0XMyXefSEDh5AX9F0OqeJmu5tZScdqW8RwffggzXC7h70ox
	TBCYQMxZ/92RHLQVzzvyh9d+6l6PTDAxtsuekEKkVaxkADkTcGrFbDZfyUrsaxjUfWe/
	kJjU14ZloVZriURUVStA2TmKfYhkEJLPOGpNglNv6DVimqmIiI3jhPW/eswUAQ3dBtEu
	F3cQ==
X-Gm-Message-State: APjAAAWWK0A1fEZRPrBzFOCDRWHV+9bQ8H3P1VPejVIxx5nCLf4MHOrR
	t5l4INHVHzwoZi5fmlaOAAvbfXPC
X-Google-Smtp-Source: APXvYqzDg436CQzGdKrGFuiperAsyZtDuJbxVgr+2ml0Kp8wyoIeYNUC4APBmHtCj8dod4W0DX4Kow==
X-Received: by 2002:a63:b919:: with SMTP id z25mr66214236pge.201.1563719150095;
	Sun, 21 Jul 2019 07:25:50 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	a3sm28807750pfc.70.2019.07.21.07.25.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:25:49 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:25:16 -0700
Message-Id: <950a60c0e4183037a807031ddc9167b1a81a5348.1563719003.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563719003.git.akuster808@gmail.com>
References: <cover.1563719003.git.akuster808@gmail.com>
Subject: [thud] 27/30] glibc: backport CVE fixes
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
X-List-Received-Date: Sun, 21 Jul 2019 14:25:49 -0000

From: Ross Burton <ross.burton@intel.com>

Backport the fixes for several CVEs from the 2.28 stable branch:
- CVE-2016-10739
- CVE-2018-19591

Signed-off-by: Ross Burton <ross.burton@intel.com>
[Dropped CVE-2019-9169 as its in my contrib already]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/glibc/glibc/CVE-2016-10739.patch | 232 +++++++++++++++++++++
 meta/recipes-core/glibc/glibc/CVE-2018-19591.patch |  48 +++++
 meta/recipes-core/glibc/glibc_2.28.bb              |   2 +
 3 files changed, 282 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2016-10739.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2018-19591.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2016-10739.patch b/meta/recipes-core/glibc/glibc/CVE-2016-10739.patch
new file mode 100644
index 0000000..7eb55d6
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2016-10739.patch
@@ -0,0 +1,232 @@
+CVE: CVE-2016-10739
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 8e92ca5dd7a7e38a4dddf1ebc4e1e8f0cb27e4aa Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Mon, 21 Jan 2019 08:59:42 +0100
+Subject: [PATCH] resolv: Reformat inet_addr, inet_aton to GNU style
+
+(cherry picked from commit 5e30b8ef0758763effa115634e0ed7d8938e4bc0)
+---
+ ChangeLog          |   5 ++
+ resolv/inet_addr.c | 192 ++++++++++++++++++++++++++++-------------------------
+ 2 files changed, 106 insertions(+), 91 deletions(-)
+
+diff --git a/resolv/inet_addr.c b/resolv/inet_addr.c
+index 022f7ea084..32f58b0e13 100644
+--- a/resolv/inet_addr.c
++++ b/resolv/inet_addr.c
+@@ -1,3 +1,21 @@
++/* Legacy IPv4 text-to-address functions.
++   Copyright (C) 2019 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
+ /*
+  * Copyright (c) 1983, 1990, 1993
+  *    The Regents of the University of California.  All rights reserved.
+@@ -78,105 +96,97 @@
+ #include <limits.h>
+ #include <errno.h>
+ 
+-/*
+- * Ascii internet address interpretation routine.
+- * The value returned is in network order.
+- */
++/* ASCII IPv4 Internet address interpretation routine.  The value
++   returned is in network order.  */
+ in_addr_t
+-__inet_addr(const char *cp) {
+-	struct in_addr val;
++__inet_addr (const char *cp)
++{
++  struct in_addr val;
+ 
+-	if (__inet_aton(cp, &val))
+-		return (val.s_addr);
+-	return (INADDR_NONE);
++  if (__inet_aton (cp, &val))
++    return val.s_addr;
++  return INADDR_NONE;
+ }
+ weak_alias (__inet_addr, inet_addr)
+ 
+-/*
+- * Check whether "cp" is a valid ascii representation
+- * of an Internet address and convert to a binary address.
+- * Returns 1 if the address is valid, 0 if not.
+- * This replaces inet_addr, the return value from which
+- * cannot distinguish between failure and a local broadcast address.
+- */
++/* Check whether "cp" is a valid ASCII representation of an IPv4
++   Internet address and convert it to a binary address.  Returns 1 if
++   the address is valid, 0 if not.  This replaces inet_addr, the
++   return value from which cannot distinguish between failure and a
++   local broadcast address.  */
+ int
+-__inet_aton(const char *cp, struct in_addr *addr)
++__inet_aton (const char *cp, struct in_addr *addr)
+ {
+-	static const in_addr_t max[4] = { 0xffffffff, 0xffffff, 0xffff, 0xff };
+-	in_addr_t val;
+-	char c;
+-	union iaddr {
+-	  uint8_t bytes[4];
+-	  uint32_t word;
+-	} res;
+-	uint8_t *pp = res.bytes;
+-	int digit;
+-
+-	int saved_errno = errno;
+-	__set_errno (0);
+-
+-	res.word = 0;
+-
+-	c = *cp;
+-	for (;;) {
+-		/*
+-		 * Collect number up to ``.''.
+-		 * Values are specified as for C:
+-		 * 0x=hex, 0=octal, isdigit=decimal.
+-		 */
+-		if (!isdigit(c))
+-			goto ret_0;
+-		{
+-			char *endp;
+-			unsigned long ul = strtoul (cp, (char **) &endp, 0);
+-			if (ul == ULONG_MAX && errno == ERANGE)
+-				goto ret_0;
+-			if (ul > 0xfffffffful)
+-				goto ret_0;
+-			val = ul;
+-			digit = cp != endp;
+-			cp = endp;
+-		}
+-		c = *cp;
+-		if (c == '.') {
+-			/*
+-			 * Internet format:
+-			 *	a.b.c.d
+-			 *	a.b.c	(with c treated as 16 bits)
+-			 *	a.b	(with b treated as 24 bits)
+-			 */
+-			if (pp > res.bytes + 2 || val > 0xff)
+-				goto ret_0;
+-			*pp++ = val;
+-			c = *++cp;
+-		} else
+-			break;
+-	}
+-	/*
+-	 * Check for trailing characters.
+-	 */
+-	if (c != '\0' && (!isascii(c) || !isspace(c)))
+-		goto ret_0;
+-	/*
+-	 * Did we get a valid digit?
+-	 */
+-	if (!digit)
+-		goto ret_0;
+-
+-	/* Check whether the last part is in its limits depending on
+-	   the number of parts in total.  */
+-	if (val > max[pp - res.bytes])
++  static const in_addr_t max[4] = { 0xffffffff, 0xffffff, 0xffff, 0xff };
++  in_addr_t val;
++  char c;
++  union iaddr
++  {
++    uint8_t bytes[4];
++    uint32_t word;
++  } res;
++  uint8_t *pp = res.bytes;
++  int digit;
++
++  int saved_errno = errno;
++  __set_errno (0);
++
++  res.word = 0;
++
++  c = *cp;
++  for (;;)
++    {
++      /* Collect number up to ``.''.  Values are specified as for C:
++	 0x=hex, 0=octal, isdigit=decimal.  */
++      if (!isdigit (c))
++	goto ret_0;
++      {
++	char *endp;
++	unsigned long ul = strtoul (cp, &endp, 0);
++	if (ul == ULONG_MAX && errno == ERANGE)
+ 	  goto ret_0;
+-
+-	if (addr != NULL)
+-		addr->s_addr = res.word | htonl (val);
+-
+-	__set_errno (saved_errno);
+-	return (1);
+-
+-ret_0:
+-	__set_errno (saved_errno);
+-	return (0);
++	if (ul > 0xfffffffful)
++	  goto ret_0;
++	val = ul;
++	digit = cp != endp;
++	cp = endp;
++      }
++      c = *cp;
++      if (c == '.')
++	{
++	  /* Internet format:
++	     a.b.c.d
++	     a.b.c	(with c treated as 16 bits)
++	     a.b	(with b treated as 24 bits).  */
++	  if (pp > res.bytes + 2 || val > 0xff)
++	    goto ret_0;
++	  *pp++ = val;
++	  c = *++cp;
++	}
++      else
++	break;
++    }
++  /* Check for trailing characters.  */
++  if (c != '\0' && (!isascii (c) || !isspace (c)))
++    goto ret_0;
++  /*  Did we get a valid digit?  */
++  if (!digit)
++    goto ret_0;
++
++  /* Check whether the last part is in its limits depending on the
++     number of parts in total.  */
++  if (val > max[pp - res.bytes])
++    goto ret_0;
++
++  if (addr != NULL)
++    addr->s_addr = res.word | htonl (val);
++
++  __set_errno (saved_errno);
++  return 1;
++
++ ret_0:
++  __set_errno (saved_errno);
++  return 0;
+ }
+ weak_alias (__inet_aton, inet_aton)
+ libc_hidden_def (__inet_aton)
+-- 
+2.11.0
diff --git a/meta/recipes-core/glibc/glibc/CVE-2018-19591.patch b/meta/recipes-core/glibc/glibc/CVE-2018-19591.patch
new file mode 100644
index 0000000..9c78a3d
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2018-19591.patch
@@ -0,0 +1,48 @@
+CVE: CVE-2018-19591
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From ce6ba630dbc96f49eb1f30366aa62261df4792f9 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Tue, 27 Nov 2018 16:12:43 +0100
+Subject: [PATCH] CVE-2018-19591: if_nametoindex: Fix descriptor for overlong
+ name [BZ #23927]
+
+(cherry picked from commit d527c860f5a3f0ed687bd03f0cb464612dc23408)
+---
+ ChangeLog                          |  7 +++++++
+ NEWS                               |  6 ++++++
+ sysdeps/unix/sysv/linux/if_index.c | 11 ++++++-----
+ 3 files changed, 19 insertions(+), 5 deletions(-)
+
+diff --git a/sysdeps/unix/sysv/linux/if_index.c b/sysdeps/unix/sysv/linux/if_index.c
+index e3d08982d9..782fc5e175 100644
+--- a/sysdeps/unix/sysv/linux/if_index.c
++++ b/sysdeps/unix/sysv/linux/if_index.c
+@@ -38,11 +38,6 @@ __if_nametoindex (const char *ifname)
+   return 0;
+ #else
+   struct ifreq ifr;
+-  int fd = __opensock ();
+-
+-  if (fd < 0)
+-    return 0;
+-
+   if (strlen (ifname) >= IFNAMSIZ)
+     {
+       __set_errno (ENODEV);
+@@ -50,6 +45,12 @@ __if_nametoindex (const char *ifname)
+     }
+ 
+   strncpy (ifr.ifr_name, ifname, sizeof (ifr.ifr_name));
++
++  int fd = __opensock ();
++
++  if (fd < 0)
++    return 0;
++
+   if (__ioctl (fd, SIOCGIFINDEX, &ifr) < 0)
+     {
+       int saved_errno = errno;
+-- 
+2.11.0
diff --git a/meta/recipes-core/glibc/glibc_2.28.bb b/meta/recipes-core/glibc/glibc_2.28.bb
index 1bcec3e..0839fa1 100644
--- a/meta/recipes-core/glibc/glibc_2.28.bb
+++ b/meta/recipes-core/glibc/glibc_2.28.bb
@@ -48,6 +48,8 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0033-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
            file://0034-inject-file-assembly-directives.patch \
            file://CVE-2019-9169.patch \
+           file://CVE-2016-10739.patch \
+           file://CVE-2018-19591.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.7.4


