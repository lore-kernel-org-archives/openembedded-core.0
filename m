Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 95D6C6C4C0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Dec 2018 10:37:37 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id x10so11559792wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2018 02:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ecdvXmUyK5G6s445l4TUSGgSu7Xgqf9ynBXfiie+tdw=;
	b=DOUKJUgAIN59ZY1689XKtcALAQww0jt7JbCkUKNzf5lzlY6NdpQLOIJBU6qbCTA08X
	8x5t8oZ3QIoUmzkb5HF2Uj37WOc4K+OGB8lSYwx32ntxBFq6R2HSKjRRzaaf7XPHc1Dq
	hdPbTIbp1geELjQ5r4WXUppc+92fu14hoI47DKq5to0E5odNYoIN8FmRZLzSn4g0BwjB
	QfbUSAxZVZZrP9p38lM2+w03L9Dnu8+UiJlPhvFHm1RCzrdnzJP80r/H+ByVc1O1z6RI
	xvdC5mR0XwIue0xdIF967k/gfQgMi2A8ra725o6WkoICm/FWMn6IFOmuZRwPBxipm0qR
	k7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ecdvXmUyK5G6s445l4TUSGgSu7Xgqf9ynBXfiie+tdw=;
	b=sK2a6ir/r6ZPYpkZkAv8PKspGv6XECBmMmb2zMV+n2mku50wvUoEKLdskkUpGjquMG
	oW/+tFR8OBR2FAeH5Jh7FMj26a9R+o7poIT85HpE0fkQzxYPYEgePzFVBxm+rAwZ2aGQ
	eG5AHHXBdOmP+Nee5095dYOEchfUi33igw1m2yqTjNPEnm4cuxflXp7AVHx/WbsOzfIx
	IQXDQwqpC7iibuX1YZBrHZCLs5LmzDRbz9IzdQU7btxiHVKSCx+k3O0k//j8prwsNv+f
	J2MU+wja1p8xpuu/0FGYqbPNHgh/QQp1luWyHnUswWnibuE5+1Mc/HEjMe7woH9J5DJM
	oJig==
X-Gm-Message-State: AA+aEWaXOXLwF2VEYjUdOsp0cEwWZ3ndU54dzPpKThJtRgyjLgxbcdeZ
	ylopmVS5KDXIkvrxtpybHdXfsPMqMyc=
X-Google-Smtp-Source: AFSGD/Xn/OKoldHRFz82Co0ijUY/Or8GBmXzu+aR0/zuK9n1KgFpeExjMejRm55eU8laPd+ML6H84g==
X-Received: by 2002:adf:dcd0:: with SMTP id x16mr13077044wrm.143.1543833457764;
	Mon, 03 Dec 2018 02:37:37 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id p5sm5432244wmh.16.2018.12.03.02.37.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Dec 2018 02:37:36 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Dec 2018 10:37:34 +0000
Message-Id: <20181203103734.8347-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] cpio: update patch to merged version
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
X-List-Received-Date: Mon, 03 Dec 2018 10:37:37 -0000

The segfault on append was fixed upstream with a different patch, so apply that
instead.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../cpio-2.12/0001-Fix-segfault-with-append.patch  | 100 +++++++--------------
 1 file changed, 32 insertions(+), 68 deletions(-)

diff --git a/meta/recipes-extended/cpio/cpio-2.12/0001-Fix-segfault-with-append.patch b/meta/recipes-extended/cpio/cpio-2.12/0001-Fix-segfault-with-append.patch
index 2043c890cde..ec8b303c43a 100644
--- a/meta/recipes-extended/cpio/cpio-2.12/0001-Fix-segfault-with-append.patch
+++ b/meta/recipes-extended/cpio/cpio-2.12/0001-Fix-segfault-with-append.patch
@@ -1,87 +1,51 @@
-Upstream-Status: Submitted [bugs-cpio]
+Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-From 3f0bd5a40ad0ceaee78c74a52a7166ed7f08db81 Mon Sep 17 00:00:00 2001
-From: Pavel Raiskup <praiskup@redhat.com>
-Date: Thu, 29 Nov 2018 07:03:48 +0100
-Subject: [PATCH] Fix segfault with --append
+From 32d95fe0c90c59352a0ce3102fc9866cbfb0f629 Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Sat, 1 Dec 2018 11:40:02 +0200
+Subject: [PATCH] Fix sigfault when appending to archive
 
-The --append mode combines both process_copy_in() and
-process_copy_out() methods, each of them working with different
-(local) file_hdr->c_name buffers.  So ensure that
-cpio_set_c_name() isn't using the same static variable for
-maintaining length of different buffers.
+Bug reported by Ross Burton. See
+<http://lists.gnu.org/archive/html/bug-cpio/2018-11/msg00000.html>
 
-Complements d36ec5f4e93130efb24fb9.  Thanks to Ross Burton.
-
-* src/copyin.c (process_copy_in): Always initialize file_hdr.
-* src/copyout.c (process_copy_out): Likewise.
-* src/cpiohdr.h (cpio_file_stat): Add c_name_buflen variable.
-* src/util.c (cpio_set_c_name): Use file_hdr->c_name_buflen.
+* src/util.c: Keep static copy of the buffer pointer; always
+assign it to file_hdr->c_name. Use x2realloc for memory management.
 ---
- src/copyin.c  | 1 +
- src/copyout.c | 1 +
- src/cpiohdr.h | 1 +
- src/util.c    | 3 ++-
- 4 files changed, 5 insertions(+), 1 deletion(-)
+ src/util.c | 17 ++++-------------
+ 1 file changed, 4 insertions(+), 13 deletions(-)
 
-diff --git a/src/copyin.c b/src/copyin.c
-index ba887ae..767c2f8 100644
---- a/src/copyin.c
-+++ b/src/copyin.c
-@@ -1213,6 +1213,7 @@ process_copy_in ()
- 
-   newdir_umask = umask (0);     /* Reset umask to preserve modes of
- 				   created files  */
-+  memset (&file_hdr, 0, sizeof (struct cpio_file_stat));
-   
-   /* Initialize the copy in.  */
-   if (pattern_file_name)
-diff --git a/src/copyout.c b/src/copyout.c
-index 7532dac..fb890cb 100644
---- a/src/copyout.c
-+++ b/src/copyout.c
-@@ -594,6 +594,7 @@ process_copy_out ()
- 
-   /* Initialize the copy out.  */
-   ds_init (&input_name, 128);
-+  memset (&file_hdr, 0, sizeof (struct cpio_file_stat));
-   file_hdr.c_magic = 070707;
- 
-   /* Check whether the output file might be a tape.  */
-diff --git a/src/cpiohdr.h b/src/cpiohdr.h
-index 588135b..cf64f3e 100644
---- a/src/cpiohdr.h
-+++ b/src/cpiohdr.h
-@@ -127,6 +127,7 @@ struct cpio_file_stat /* Internal representation of a CPIO header */
-   uint32_t c_chksum;
-   char *c_name;
-   char *c_tar_linkname;
-+  size_t c_name_buflen;
- };
- 
- void cpio_set_c_name(struct cpio_file_stat *file_hdr, char *name);
 diff --git a/src/util.c b/src/util.c
-index 10486dc..1256469 100644
+index 10486dc..4e49124 100644
 --- a/src/util.c
 +++ b/src/util.c
-@@ -1413,7 +1413,7 @@ set_file_times (int fd,
+@@ -1413,22 +1413,13 @@ set_file_times (int fd,
  void
  cpio_set_c_name (struct cpio_file_stat *file_hdr, char *name)
  {
--  static size_t buflen = 0;
-+  size_t buflen = file_hdr->c_name_buflen;
++  static char *buf = NULL;
+   static size_t buflen = 0;
    size_t len = strlen (name) + 1;
  
-   if (buflen == 0)
-@@ -1430,6 +1430,7 @@ cpio_set_c_name (struct cpio_file_stat *file_hdr, char *name)
-     }
- 
+-  if (buflen == 0)
+-    {
+-      buflen = len;
+-      if (buflen < 32)
+-        buflen = 32;
+-      file_hdr->c_name = xmalloc (buflen);
+-    }
+-  else if (buflen < len)
+-    {
+-      buflen = len;
+-      file_hdr->c_name = xrealloc (file_hdr->c_name, buflen);
+-    }
+-
++  while (buflen < len)
++    buf = x2realloc (buf, &buflen);
++  file_hdr->c_name = buf;
    file_hdr->c_namesize = len;
-+  file_hdr->c_name_buflen = buflen;
    memmove (file_hdr->c_name, name, len);
  }
- 
 -- 
-2.11.0
+2.18.0
 
-- 
2.11.0


