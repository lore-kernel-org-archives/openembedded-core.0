Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3739.1793405758171530284
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=oFvlI200;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so7692545e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405756; x=1794010556; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLhNWUoTNHVLsYRDxLZPPKaO+w+TJPNGXT3tbkXdYbA=;
        b=oFvlI200WkxYeNaP8gqj69/rsP0aBbe8oBhBsDpZGPT+ec8ZnCkH9qU810F/c4b/bG
         TYqxEJHcwC1PoCpoNuy7bCdQBwWFaBuFiRU3Vk5Gv8omSBysmlS/jWuSfpgve7RNS8le
         839aR1C+Bbh6eeymeCfLSW4o5AB1G7kiUaOhWmEE4CyO5sahhkP2qYTvMWc/cL863IkD
         FyoZ1NbS27ybodD8mXwRNAPS3VcUjaxMllhKP7dhQsJOBJ+FZrfNehXHWz9daAWWJh7v
         eMW89wHh7xQ/YCgt0rJS0MgQycEpgyYOKnOrTULo+0eDrz1OFTy77kmw2kSAUpZ1ciPh
         TUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405756; x=1794010556;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MLhNWUoTNHVLsYRDxLZPPKaO+w+TJPNGXT3tbkXdYbA=;
        b=Mm4e8Q6UIh4OEr1TXcvtNcv7QCqhRuN9LrjsW7/wE1FabqU0V+Ad2/krhw+qNCTnk6
         WIC00UIPXypvnqiDVbLKYzKP2dfsGETTLsGPF2e4or6xDGAj4/Bf98PpC0wbvD9m5Yqi
         wCQJqnGmQq1x1sEI/QwqwY8A0AwLx3hiTgPfcaYoI0yYQ4z1tsBokMrVCXDpSUd6NHGx
         HTwvNoK9uEMBtDQIuLzjRT7Em+Eg9WJLwD8P5Fh+kv0kXHVsbfTjcqeso4zbw5jgj/bV
         Un3Sog4ZBkDq/dO6knRd4EmsWEzUkHItB0YWikj4jetSyhikPG4u6vodZgghNLSc0HeH
         tySQ==
X-Gm-Message-State: AFq9FYLFEWL3KNpnFXF4OLZFcAUreL3czsho6tKtJIdnKL7t5MoUOP8Z
	RUOnAM3/svLQFrFem/kUHSXZ9aiR1WXYcFymN0dJmM5g9TsbBSAN9st+3DUD2aCgkgjfJgaW1Kt
	uSAP/pM4=
X-Gm-Gg: AYBFou0CJati4p5oGAYTxo2uPv0kJOZuEnGFfgE/sycyPsvc3fpbXg/cYX+UhIUkyE4
	KcsXA+L3WkLfSkZPmPfcS3LxWt5N8396rqNeIPaK8eY8/H3xthxVJWY3VupVDdeINfXLm0hTXge
	2N20CjSf4eo4f2UnLfKmyuUiG6j43VnlA9DMCRUOdiGq8JwQDaBzq4LdzPrJpc+iAza8WlF97gG
	0Ns6SLCcdVCcQd4x2ZRn71l4RLpsaOpm3On2xcqZ/dWh04gXDETpocx/6mocjs3sanst0qRgVz3
	D0YIc53eCVyE5e/0OiSqx+dcwDgVB8ctH9PSswlY4xqkmtKfmJEhkB0acg2h8GwuvkdvU9c2CTI
	6hZRGNo/zeC5JK+28XIDFE6D47ORnZEe7o4cBf9GVOgn2m8dnlwXXn130lRajOFj9Exki0oWtXY
	ww+LEl/oM8VowfFZaW3e7iiVoMSvUWh+2QSqwOm9IW1M0Vlf5Q/br5GWqVU4lHrd7IrLgopK2qq
	wvXrUpbGuWBZIUq43PQvizz5qFqYbxZzoXktx4z957TK7vysvJYeLwBK4SV3OPEKdjepfmnWlk4
	67K5G+1W8IIrRpaDPb6DXzM0Jj/vnBybpLaxPvAFIpTPUAo3L+f+azBFr6EaIohYen77iS79JHl
	89H1p3qlR3vF1erRx7OncCow+JlMJ
X-Received: by 2002:a05:600c:818e:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-4ac1932aa2amr87699335e9.34.1793405756329;
        Fri, 30 Oct 2026 17:15:56 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.15.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:15:55 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 23/55] glibc: patch CVE-2026-6791
Date: Sat, 31 Oct 2026 01:14:44 +0100
Message-ID: <e8175e93b8d351560a52817e044b775679452c18.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249098
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE from 2.41 branch (oldest release
still receiving security updates).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: fixed a 3.41 -> 2.41 typo in branch name]
---
 .../glibc/glibc/0033-CVE-2026-6791.patch      | 364 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
 2 files changed, 365 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0033-CVE-2026-6791.patch

diff --git a/meta/recipes-core/glibc/glibc/0033-CVE-2026-6791.patch b/meta/recipes-core/glibc/glibc/0033-CVE-2026-6791.patch
new file mode 100644
index 00000000000..83294df46e8
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0033-CVE-2026-6791.patch
@@ -0,0 +1,364 @@
+From 965b580070b8184b0dd390800d9194291a600e67 Mon Sep 17 00:00:00 2001
+From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Date: Tue, 14 Apr 2026 10:50:37 -0300
+Subject: [PATCH] posix: Fix stack overflow in wordexp tilde expansion (BZ
+ 34091, CVE-2026-6791)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The parse_tilde function previously used strndupa to allocate memory
+for the parsed username on the stack, and since the input is
+user-defined, this can lead to a stack overflow.
+
+This patch fixes the issue by replacing strndupa with scratch_buffer,
+by reusing the buffer used in the __getpwnam_r call.
+
+The new “tst-wordexp-tilde.c” test is a test-container to avoid using
+system-defined NSS modules.
+
+Checked on x86_64-linux-gnu and i686-linux-gnu.
+
+(cherry picked from commit 07c24f35392b727e6100d33edfdf811a6c68c218)
+
+CVE: CVE-2026-6791
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=965b580070b8184b0dd390800d9194291a600e67]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ posix/Makefile                                |   1 +
+ posix/tst-wordexp-tilde.c                     | 244 ++++++++++++++++++
+ posix/tst-wordexp-tilde.root/etc/group        |   1 +
+ .../tst-wordexp-tilde.root/etc/nsswitch.conf  |   3 +
+ posix/tst-wordexp-tilde.root/etc/passwd       |   1 +
+ posix/wordexp.c                               |  24 +-
+ 6 files changed, 268 insertions(+), 6 deletions(-)
+ create mode 100644 posix/tst-wordexp-tilde.c
+ create mode 100644 posix/tst-wordexp-tilde.root/etc/group
+ create mode 100644 posix/tst-wordexp-tilde.root/etc/nsswitch.conf
+ create mode 100644 posix/tst-wordexp-tilde.root/etc/passwd
+
+diff --git a/posix/Makefile b/posix/Makefile
+index 9360bc7ff8..c2c05b3973 100644
+--- a/posix/Makefile
++++ b/posix/Makefile
+@@ -354,6 +354,7 @@ tests-internal := \
+ tests-container := \
+   bug-ga2 \
+   tst-vfork3 \
++  tst-wordexp-tilde \
+   # tests-container
+ 
+ tests-time64 := \
+diff --git a/posix/tst-wordexp-tilde.c b/posix/tst-wordexp-tilde.c
+new file mode 100644
+index 0000000000..1661603681
+--- /dev/null
++++ b/posix/tst-wordexp-tilde.c
+@@ -0,0 +1,244 @@
++/* Test wordexp tilde expansion with large usernames (BZ 34091).
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
++#include <pwd.h>
++#include <stdio.h>
++#include <string.h>
++#include <wordexp.h>
++#include <stdlib.h>
++#include <sys/resource.h>
++
++#include <support/check.h>
++#include <support/support.h>
++#include <support/xunistd.h>
++#include <support/namespace.h>
++
++typedef void (*func_callback_t)(void);
++
++static void
++subprocess_small_stack (void *closure)
++{
++  struct rlimit rl;
++  TEST_COMPARE (getrlimit (RLIMIT_STACK, &rl), 0);
++  rl.rlim_cur = 512 * 1024;
++  TEST_COMPARE (setrlimit (RLIMIT_STACK, &rl), 0);
++
++  func_callback_t func_test = closure;
++  func_test ();
++}
++
++/* Build a string "~<padding>/tail" where <padding> is LEN bytes of the
++   character CH.  The caller must free the result.  */
++static char *
++make_tilde_input (char ch, size_t len, const char *tail)
++{
++  /* ~  +  len  +  /  +  tail  +  \0 */
++  size_t taillen = tail != NULL ? strlen (tail) : 0;
++  size_t total = 1 + len + 1 + taillen + 1;
++  char *buf = xmalloc (total);
++  buf[0] = '~';
++  memset (buf + 1, ch, len);
++  buf[1 + len] = '/';
++  if (tail != NULL)
++    memcpy (buf + 1 + len + 1, tail, taillen);
++  buf[total - 1] = '\0';
++  return buf;
++}
++
++/* Test 1: A very long username must not crash.  The username will not match
++   any real user, so wordexp returns ~<long>/rest.  */
++static void
++test_long_username (void)
++{
++  printf ("info: test_long_username_no_crash\n");
++
++  static const char REST[] = "rest";
++
++  /* 1 MiB username — well beyond any reasonable stack frame.  */
++  const size_t long_len = 1024 * 1024;
++  char *input = make_tilde_input ('A', long_len, REST);
++
++  wordexp_t we = { 0 };
++  int ret = wordexp (input, &we, 0);
++  /* The (non-existent) username is invalid, so wordexp falls back to
++     literal output: ~AAA…/rest.  */
++  TEST_COMPARE (ret, 0);
++  TEST_COMPARE (we.we_wordc, 1);
++
++  /* Verify prefix: '~' followed by long_len 'A's.  */
++  const char *result = we.we_wordv[0];
++  TEST_COMPARE (result[0], '~');
++  TEST_COMPARE (strlen (result),
++	        1 /* ~ */ + long_len + sizeof (REST));
++  for (size_t j = 1; j <= long_len; j++)
++    if (result[j] != 'A')
++      {
++	printf ("  mismatch at position %zu: expected 'A', got '%c'\n",
++		j, result[j]);
++	support_record_failure ();
++	break;
++      }
++  /* Verify the tail after the username.  */
++  TEST_COMPARE_STRING (result + 1 + long_len, "/rest");
++
++  wordfree (&we);
++  free (input);
++}
++
++/* Test 2: A username that just exceeds the default scratch_buffer inline
++   size (1024 bytes) exercises the scratch_buffer_set_array_size growth path
++   without being excessively large.  */
++static void
++test_scratch_buffer_growth (void)
++{
++  printf ("info: test_scratch_buffer_growth\n");
++
++  const size_t len = 2048;
++  char *input = make_tilde_input ('x', len, NULL);
++
++  wordexp_t we = { 0 };
++  int ret = wordexp (input, &we, 0);
++  TEST_COMPARE (ret, 0);
++  TEST_COMPARE (we.we_wordc, 1);
++
++  /* ~xxx…/ — the trailing slash makes a separate empty component, but
++     wordexp merges it into the single token ~xxx…/.  */
++  const char *result = we.we_wordv[0];
++  TEST_COMPARE (result[0], '~');
++  for (size_t j = 1; j <= len; j++)
++    if (result[j] != 'x')
++      {
++	printf ("  mismatch at position %zu\n", j);
++	support_record_failure ();
++	break;
++      }
++  TEST_COMPARE (result[1 + len], '/');
++
++  wordfree (&we);
++  free (input);
++}
++
++/* Test 3: ~root still resolves to the correct home directory through the
++   __getpwnam_r path.  */
++static void
++test_known_user (void)
++{
++  printf ("info: test_known_user\n");
++
++  /* Look up root's home directory for comparison.  */
++  struct passwd *pw = getpwnam ("root");
++  if (pw == NULL || pw->pw_dir == NULL)
++    {
++      printf ("  SKIP: cannot look up root\n");
++      return;
++    }
++
++  char *expected = xasprintf ("%s/file", pw->pw_dir);
++
++  wordexp_t we = { 0 };
++  TEST_COMPARE (wordexp ("~root/file", &we, 0), 0);
++  TEST_COMPARE (we.we_wordc, 1);
++  TEST_COMPARE_STRING (we.we_wordv[0], expected);
++
++  wordfree (&we);
++  free (expected);
++}
++
++/* Test 4: Bare tilde expands to $HOME.  */
++static void
++test_bare_tilde (void)
++{
++  printf ("info: test_bare_tilde\n");
++
++  const char *home = getenv ("HOME");
++  if (home == NULL)
++    {
++      printf ("  SKIP: HOME is not set\n");
++      return;
++    }
++
++  wordexp_t we = { 0 };
++  TEST_COMPARE (wordexp ("~", &we, 0), 0);
++  TEST_COMPARE (we.we_wordc, 1);
++  TEST_COMPARE_STRING (we.we_wordv[0], home);
++
++  wordfree (&we);
++}
++
++/* Test 5: Short non-existent username falls back to literal ~username output,
++   exercising the invalid-login-name path.  */
++static void
++test_unknown_user (void)
++{
++  printf ("info: test_unknown_user\n");
++
++  /* Pick a username that is extremely unlikely to exist.  */
++  wordexp_t we = { 0 };
++  TEST_COMPARE (wordexp ("~no_such_user_xyzzy42", &we, 0), 0);
++  TEST_COMPARE (we.we_wordc, 1);
++  TEST_COMPARE_STRING (we.we_wordv[0], "~no_such_user_xyzzy42");
++
++  wordfree (&we);
++}
++
++/* Test 6: Tilde with username and WRDE_APPEND — exercises parse_tilde's
++   interaction with the WRDE_APPEND word list.  */
++static void
++test_tilde_with_append (void)
++{
++  printf ("info: test_tilde_with_append\n");
++
++  const char *home = getenv ("HOME");
++  if (home == NULL)
++    {
++      printf ("  SKIP: HOME is not set\n");
++      return;
++    }
++
++  wordexp_t we = { 0 };
++  TEST_COMPARE (wordexp ("first", &we, 0), 0);
++
++  TEST_COMPARE (wordexp ("~/path", &we, WRDE_APPEND), 0);
++  TEST_COMPARE (we.we_wordc, 2);
++  TEST_COMPARE_STRING (we.we_wordv[0], "first");
++
++  char *expected = xasprintf ("%s/path", home);
++  TEST_COMPARE_STRING (we.we_wordv[1], expected);
++
++  wordfree (&we);
++  free (expected);
++}
++
++static int
++do_test (void)
++{
++  test_known_user ();
++  test_bare_tilde ();
++  test_unknown_user ();
++  test_tilde_with_append ();
++
++  support_isolate_in_subprocess (subprocess_small_stack,
++				 test_long_username);
++
++  support_isolate_in_subprocess (subprocess_small_stack,
++				 test_scratch_buffer_growth);
++
++  return 0;
++}
++
++#include <support/test-driver.c>
+diff --git a/posix/tst-wordexp-tilde.root/etc/group b/posix/tst-wordexp-tilde.root/etc/group
+new file mode 100644
+index 0000000000..1dbf9013ee
+--- /dev/null
++++ b/posix/tst-wordexp-tilde.root/etc/group
+@@ -0,0 +1 @@
++root:x:0:
+diff --git a/posix/tst-wordexp-tilde.root/etc/nsswitch.conf b/posix/tst-wordexp-tilde.root/etc/nsswitch.conf
+new file mode 100644
+index 0000000000..098a8d5938
+--- /dev/null
++++ b/posix/tst-wordexp-tilde.root/etc/nsswitch.conf
+@@ -0,0 +1,3 @@
++passwd: files
++group:  files
++shadow: files
+diff --git a/posix/tst-wordexp-tilde.root/etc/passwd b/posix/tst-wordexp-tilde.root/etc/passwd
+new file mode 100644
+index 0000000000..eb85a552ad
+--- /dev/null
++++ b/posix/tst-wordexp-tilde.root/etc/passwd
+@@ -0,0 +1 @@
++root:x:0:0:root:/root:/bin/sh
+diff --git a/posix/wordexp.c b/posix/wordexp.c
+index 9df4bb7424..731d1650e9 100644
+--- a/posix/wordexp.c
++++ b/posix/wordexp.c
+@@ -335,17 +335,29 @@ parse_tilde (char **word, size_t *word_length, size_t *max_length,
+   else
+     {
+       /* Look up user name in database to get home directory */
+-      char *user = strndupa (&words[1 + *offset], i - (1 + *offset));
+-      struct passwd pwd, *tpwd;
+-      int result;
++      size_t userlen = i - (1 + *offset);
++      /* tmpbuf contains both the user and the __getpwnam_r working area.  */
+       struct scratch_buffer tmpbuf;
+       scratch_buffer_init (&tmpbuf);
++      if (!scratch_buffer_set_array_size (&tmpbuf, userlen + 1, 1))
++	return WRDE_NOSPACE;
++      char *user = tmpbuf.data;
++      memcpy (user, &words[1 + *offset], userlen);
++      user[userlen] = '\0';
+ 
+-      while ((result = __getpwnam_r (user, &pwd, tmpbuf.data, tmpbuf.length,
++      struct passwd pwd, *tpwd;
++      int result;
++      while ((result = __getpwnam_r (user,
++				     &pwd,
++				     tmpbuf.data + userlen + 1,
++				     tmpbuf.length - userlen - 1,
+ 				     &tpwd)) != 0
+ 	     && errno == ERANGE)
+-	if (!scratch_buffer_grow (&tmpbuf))
+-	  return WRDE_NOSPACE;
++	{
++	  if (!scratch_buffer_grow_preserve (&tmpbuf))
++	    return WRDE_NOSPACE;
++	  user = tmpbuf.data;
++	}
+ 
+       if (result == 0 && tpwd != NULL && pwd.pw_dir)
+ 	*word = w_addstr (*word, word_length, max_length, pwd.pw_dir);
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index e62d941fdde..26aa6fb275e 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -65,6 +65,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0030-CVE-2026-6238-0006.patch \
            file://0031-CVE-2026-5928.patch \
            file://0032-CVE-2026-5450.patch \
+           file://0033-CVE-2026-6791.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
