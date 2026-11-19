Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.85.1795101867309085923
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=i48emOJs;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso18162675e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 07:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795101865; x=1795706665; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jFW9ZCLS91hlr/I2RcFRvj+Nn/Vx91/ee63pKbz3teo=;
        b=i48emOJsf03umx5ZFbo8/ETVnaXYIRDwO2Jm4Giqi+3+N/q+snDvER2B+rL+Mw290u
         Wpt4bkjhMXbAis58J9GKbPDVn2Ap/ROkbq3ydOrtU9k80u1I1F8NtSxs74BUk+/HJjph
         5Hv0cQcFhWYt7N5K4I7lcVDLQk/6+7oT/JEk9+k9+h9OToeSi+rmhRfnYPyuta5/qNNZ
         1Bskt6XMnQqBALgbPGpPOWCoD43btRlg05mRj+G6jeXYCLLi2U2hCvhJtnz8Guy289rQ
         Rt/heocYYQjpJA7p6Ccukh7WjwB/aVNL5SA8wHoqgfaMg4sKE8M6qjOV7QBR6VV19wcY
         srdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101865; x=1795706665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jFW9ZCLS91hlr/I2RcFRvj+Nn/Vx91/ee63pKbz3teo=;
        b=RFnS7QyTs6XqSDNsZeGbqG7gCdHn6u9nuOEe6KYqn9sgXeWy6vIpCYNbUql8ZMLi/d
         A8Rcz+FAo8otDRDhyLEfltNNjQbckUdj60qNSa+kXiNb88Wr+v1C9FK6Zs5+MYnpQUTy
         1jWka8wVQSKP6AckYcUdVljWZSPRBhni4vyO9xK43uqOPPu3G26UjZzTcyrdQ+zpfcCS
         dvq7U/tALu2xO/zjzOg78zlW0YhUSzYPfXE4usR3W9+LVjilwiDc18pGuis3GB1tY/e3
         xgPq3wYs1ttHhvViLZqBq0Mxb2PqP+iabZGjmI1CFTfgdp6d3D0ScaPNk1MhphdXGVMi
         EU1g==
X-Gm-Message-State: APuU4Z/gz0yvMOZzOzMNQVFT0y8MQT1NgSR8jNa2yeKes8Ychv7HJFZz
	Rqcy9vZtKW1LTm0rezICiDZUvcXt8GHpfYzldj/nHsNRRWSr6AnX/phN7m2kEJsW9P6RzXG4hxb
	D4U8HG/c=
X-Gm-Gg: AYBFou2NHnyehLbICoWXsQ1TX86HD2f/BSJrs8DaiWxxVeXeCu31FPMN6D/trh5SoOv
	JQvLsf6V79NvxUKELijHrU49p7HxXEHDODluJ8gGX2IAkHfSMOczM6UDqddYcR09+R+0rysTpO4
	gvEBtVaPw68Gyzpcg89fRlMkQyebR5GNzKkDosHqDeVZE9U4LGBDxUgNElZ8Ck9ZWbgg6xUELIP
	/3THUj/NSN9fTCdY1NIB0+RS6Xz4aSlo+FTlpMBWleJyeQgb7lg7QT00TujHwg4rFrZC1sxWLqe
	SDvtE6ZmLQmr9MzGuXiOEcZMK+Q2q9tkqFv1nETuNCR+bJoUi9vXtJk6prCg/14iLWKFsedLxQk
	60m0yUjG1nBE1Ya+PA7bK43mTTzt1lu2prGUXUsGpqI+bEQLfwzGNHuPtDkDomstHbvze/aKGee
	JS0v/TqxOQ5Xa6ReN1/0DgmxSmXhFmfJSBWWerKr6djj9QklhzdWySmcJ1p3dT9SXAlWclFefiL
	rwzfo4L4Z5OWh2EYm5ZrwgaNs/fwVNy+n101M4Vvx/6De+AnHvBTxxE1SJCfC49dYZkxJC1DvFG
	swgfTj4Bny1/IwSd+duhMjQ5DRnq4iFuRdrBj3k293EW6KrXP62ed+//HfjjvAoB90N2YmlbpO4
	sxbuas7O6MHGzt9UKnxGgsOUIQB0UWtnT/w8DZs5c8Ix06u0ujOX7RQE=
X-Received: by 2002:a05:600c:4e11:b0:4bb:6c71:b269 with SMTP id 5b1f17b1804b1-4bb7da42cf5mr124157315e9.28.1795101865072;
        Thu, 19 Nov 2026 07:24:25 -0800 (PST)
Return-Path: <fabien.thomas@smile.fr>
Received: from FRSMI25-GIGUE ([2a01:e0a:8cc:5b00:2270:efa7:7aaf:bcdc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm4222275e9.5.2026.11.19.07.24.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:24:24 -0800 (PST)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/19] glibc: patch CVE-2026-86805 and CVE-2026-95818
Date: Thu, 19 Nov 2026 16:22:35 +0100
Message-ID: <23fb396367e061f1c803bace04b3140e852abc72.1795101267.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795101267.git.fabien.thomas@smile.fr>
References: <cover.1795101267.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 15:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250692
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch [1] which is [2] backported to 2.41 (oldest release still
receiving security updates) which is mentioned in [3] and [4].

On request, all testing code was removed from the patch.

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=629565b0c91dc326ac622b05982f21a374cd03c4
[2] https://sourceware.org/git/?p=glibc.git;a=commit;h=ed0c137b97eb940b4b64981e84ed806d3276edd9
[3] https://security-tracker.debian.org/tracker/CVE-2026-86805
[4] https://security-tracker.debian.org/tracker/CVE-2026-95818

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Bastien Jauny <bastien.jauny@smile.fr>
---
 .../0049-CVE-2026-86805-CVE-2026-95818.patch  | 267 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
 2 files changed, 268 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0049-CVE-2026-86805-CVE-2026-95818.patch

diff --git a/meta/recipes-core/glibc/glibc/0049-CVE-2026-86805-CVE-2026-95818.patch b/meta/recipes-core/glibc/glibc/0049-CVE-2026-86805-CVE-2026-95818.patch
new file mode 100644
index 0000000000..dde4f8b901
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0049-CVE-2026-86805-CVE-2026-95818.patch
@@ -0,0 +1,267 @@
+From 629565b0c91dc326ac622b05982f21a374cd03c4 Mon Sep 17 00:00:00 2001
+From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Date: Mon, 17 Aug 2026 15:15:32 -0300
+Subject: [PATCH] elf: Open the normalized $ORIGIN rpath in AT_SECURE programs
+ (BZ 34360)
+
+For AT_SECURE programs the loader honors $ORIGIN in DT_RPATH only when the
+expansion is rooted in a trusted directory, but it validated the lexically
+normalized path while opening the raw expansion.  As "a/b/../c" only names
+"a/c" when "b" is not a symlink, an attacker who controls a component of
+$ORIGIN -- e.g. by hard-linking the setuid binary into an attacker-owned
+directory -- can make the opened path escape the trusted directory even
+though the check passed, loading an attacker-controlled object.
+
+Normalize the expansion in place and open that, so the path that is opened
+is exactly the path that was validated.  _dl_normalize_path rewrites the
+string in place without ever advancing its write cursor past its read
+cursor or appending, so it stays within the original storage.
+
+Add elf/tst-origin-secure as a regression test.
+
+Reviewed-by: Florian Weimer <fweimer@redhat.com>
+(cherry picked from commit ed0c137b97eb940b4b64981e84ed806d3276edd9)
+
+CVE: CVE-2026-86805
+CVE: CVE-2026-95818
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=629565b0c91dc326ac622b05982f21a374cd03c4]
+Omit the regression tests and their test harness prerequisites from this backport.
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ elf/dl-load.c           |  74 +++++++++----------------
+ elf/dl-path-normalize.h | 118 ++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 143 insertions(+), 49 deletions(-)
+ create mode 100644 elf/dl-path-normalize.h
+
+diff --git a/elf/dl-load.c b/elf/dl-load.c
+index 7b21f1dffa..0d141a61c1 100644
+--- a/elf/dl-load.c
++++ b/elf/dl-load.c
+@@ -32,6 +32,7 @@
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ #include <gnu/lib-names.h>
++#include <dl-path-normalize.h>
+ 
+ /* Type for the buffer we put the ELF header and hopefully the program
+    header.  This buffer does not really have to be too large.  In most
+@@ -124,54 +125,24 @@ static const size_t system_dirs_len[] =
+ };
+ #define nsystem_dirs_len array_length (system_dirs_len)
+ 
++/* Return true if the normalized path NPATH of length NLEN is rooted in one of
++   the trusted system directories.  The system_dirs entries carry a trailing
++   '/'; NPATH matches an entry when it shares the entry's leading component
++   sequence and then either ends or continues with '/'.  For instance,
++   "/lib64" and "/lib64/x" match "/lib64/" but "/lib64x" does not.  */
+ static bool
+-is_trusted_path_normalize (const char *path, size_t len)
++path_is_trusted (const char *npath, size_t nlen)
+ {
+-  if (len == 0)
+-    return false;
+-
+-  char *npath = (char *) alloca (len + 2);
+-  char *wnp = npath;
+-  while (*path != '\0')
+-    {
+-      if (path[0] == '/')
+-	{
+-	  if (path[1] == '.')
+-	    {
+-	      if (path[2] == '.' && (path[3] == '/' || path[3] == '\0'))
+-		{
+-		  while (wnp > npath && *--wnp != '/')
+-		    ;
+-		  path += 3;
+-		  continue;
+-		}
+-	      else if (path[2] == '/' || path[2] == '\0')
+-		{
+-		  path += 2;
+-		  continue;
+-		}
+-	    }
+-
+-	  if (wnp > npath && wnp[-1] == '/')
+-	    {
+-	      ++path;
+-	      continue;
+-	    }
+-	}
+-
+-      *wnp++ = *path++;
+-    }
+-
+-  if (wnp == npath || wnp[-1] != '/')
+-    *wnp++ = '/';
+-
+   const char *trun = system_dirs;
+ 
+   for (size_t idx = 0; idx < nsystem_dirs_len; ++idx)
+     {
+-      if (wnp - npath >= system_dirs_len[idx]
+-	  && memcmp (trun, npath, system_dirs_len[idx]) == 0)
+-	/* Found it.  */
++      /* Compare against the entry without its trailing '/'.  */
++      size_t dirlen = system_dirs_len[idx] - 1;
++
++      if (nlen >= dirlen
++	  && memcmp (trun, npath, dirlen) == 0
++	  && (npath[dirlen] == '/' || npath[dirlen] == '\0'))
+ 	return true;
+ 
+       trun += system_dirs_len[idx] + 1;
+@@ -361,16 +332,21 @@ _dl_dst_substitute (struct link_map *l, const char *input, char *result)
+      checked for trust, the authors of the binaries themselves are
+      trusted to have designed this correctly.  Only $ORIGIN is tested in
+      this way because it may be manipulated in some ways with hard
+-     links.  */
+-  if (__glibc_unlikely (check_for_trusted)
+-      && !is_trusted_path_normalize (result, wp - result))
+-    {
+-      *result = '\0';
+-      return result;
+-    }
++     links.
++
++     _dl_normalize_path replaces the expansion with its normalized form
++     in place, so that the path that is opened is exactly the path that
++     was validated.  */
+ 
+   *wp = '\0';
+ 
++  if (__glibc_unlikely (check_for_trusted))
++    {
++      size_t nlen = _dl_normalize_path (result);
++      if (!path_is_trusted (result, nlen))
++	*result = '\0';
++    }
++
+   return result;
+ }
+ 
+diff --git a/elf/dl-path-normalize.h b/elf/dl-path-normalize.h
+new file mode 100644
+index 0000000000..ca4b14698c
+--- /dev/null
++++ b/elf/dl-path-normalize.h
+@@ -0,0 +1,118 @@
++/* In-place lexical path normalization for the dynamic loader.
++   Copyright (C) 2026 Free Software Foundation, Inc.
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
++   <https://www.gnu.org/licenses/>.  */
++
++#ifndef _DL_PATH_NORMALIZE_H
++#define _DL_PATH_NORMALIZE_H
++
++#include <stddef.h>
++#include <string.h>
++
++/* Lexically normalize the null-terminated PATH in place and return the
++   length of the result (excluding the terminating NUL byte):
++
++   - Runs of '/' are collapsed to a single '/'.
++
++   - "." components are removed.
++
++   - A ".." component removes the preceding component if there is one and it
++     is not itself a preserved "..".  In an absolute path a surplus ".." at
++     the root is dropped ("/../a" normalizes to "/a"), in a relative path
++     leading ".." components are preserved ("../a" stays "../a", "a/../../b"
++     normalizes to "../b").
++
++   - The result has no trailing '/' except for the root path "/" itself
++     ("/a/" normalizes to "/a").
++
++   - The result is empty if and only if every component cancels or is removed
++     ("", ".", "a/.." all normalize to "").
++
++   The PATH is written in place, and the internal write cursor never runs
++   ahead of the read cursor.  Only bytes within the strlen (PATH) + 1 storage
++   are accessed.  */
++static inline size_t
++_dl_normalize_path (char *path)
++{
++  /* The root '/' of an absolute path is not removed.  */
++  char *pstart = path + (path[0] == '/');
++  const char *rnp = pstart;
++  char *wnp = pstart;
++  /* End of the prefix a ".." may not remove.  Either the root '/', or, for
++     relative paths, the original start of the string extended by any
++     preserved leading ".." components.  */
++  char *limit = pstart;
++
++  while (*rnp != '\0')
++    {
++      /* Collapse consecutive separators.  */
++      if (*rnp == '/')
++	{
++	  ++rnp;
++	  continue;
++	}
++
++      /* [RNP, REND) is the next input component.  */
++      const char *rend = rnp;
++      while (*rend != '\0' && *rend != '/')
++	++rend;
++      size_t clen = rend - rnp;
++
++      /* Drop '.' component.  */
++      if (clen == 1 && rnp[0] == '.')
++	;
++      else if (clen == 2 && rnp[0] == '.' && rnp[1] == '.')
++	{
++	  if (wnp > limit)
++	    {
++	      /* Remove the last component along with the '/' separating it
++		 from its predecessor (the root '/' of an absolute path is
++		 retained).  */
++	      while (wnp > limit && wnp[-1] != '/')
++		--wnp;
++	      if (wnp > pstart)
++		--wnp;
++	    }
++	  else if (pstart == path)
++	    {
++	      /* No component is left and the original path is relative:
++		 keep the unresolvable ".." (it becomes part of the
++		 preserved prefix).  */
++	      if (wnp > pstart)
++		*wnp++ = '/';
++	      *wnp++ = '.';
++	      *wnp++ = '.';
++	      limit = wnp;
++	    }
++	  /* Otherwise the path is absolute and the surplus ".." at the
++	     root is dropped ("/../a" normalizes to "/a").  */
++	}
++      else
++	{
++	  if (wnp > pstart)
++	    *wnp++ = '/';
++	  memmove (wnp, rnp, clen);
++	  wnp += clen;
++	}
++
++      rnp = rend;
++    }
++
++  *wnp = '\0';
++  return wnp - path;
++}
++
++#endif /* _DL_PATH_NORMALIZE_H */
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index 09ac0fc53f..1598249b7b 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -77,6 +77,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0042-CVE-2026-8674.patch \
            file://0047-CVE-2026-89092.patch \
            file://0048-CVE-2026-97399.patch \
+           file://0049-CVE-2026-86805-CVE-2026-95818.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
