Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C4D7C3271E
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 06:32:46 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.74037.1720420361916177234
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Jul 2024 23:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=I4xVpoaG;
 spf=pass (domain: mvista.com, ip: 209.85.128.175, mailfrom: hprajapati@mvista.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6512866fa87so29124247b3.2
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Jul 2024 23:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1720420361; x=1721025161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hVvq3TNAjIUvdX0/HpGm5iQoqkb1XS/z/y0FK42RPTA=;
        b=I4xVpoaGAJpO20CBu/cVK0VeT3QMzaKIvhs0OEmIiU8ZWo8k+Kiy+X68IFgD89Un3q
         OVzwF7FvckRVqFQ/DzaQGALzzEr7L+dhvKVLe6VLI2Z1BnGGRlrJrXaL5ySjsvBKq9Yz
         X6g0WYaeBImH/DigzQlJulXGe5VK8ftnWzMcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720420361; x=1721025161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVvq3TNAjIUvdX0/HpGm5iQoqkb1XS/z/y0FK42RPTA=;
        b=gJnSARON9vGtNfqU5Ycg6ee2umiuPhp9qDeFex5jVTS8jG24JIUQTPt0WAfXTnW3Yt
         DeJ0kmI1ZmFvpMtaxgi52sl4DXAtQI/lfi1y1a+dBspsAHuzYW6Nbf1cW85rFZDrZoEl
         atXCrM+uhc3iueCbZzNDiPRC1y8hAgbuIVhB/9/9MrxolAyT5ivFPY3B3b376TBeldQ2
         0ZcwzwPCaqh5oVVcihWEOh/JFOSVFK1AVgBsFz1dZ/C+VyESNpFEDH61WEsdJc4Zh9PI
         bUZo81u1CARRLmu45nvaQL7lkaaJZlz+2Q9UQGAMUudt9ejdn1zBA3BI2lFeqf8UUmK/
         WyCQ==
X-Gm-Message-State: AOJu0YzZqPHGTtWpXepbMJsstq+Zljr/jM4o99SvOiy9U4cN/OPW2KTX
	m5RrJ+8AEDr9t9Zs0elWk4SUf5yu0yNpWu+oSM4cYTa1ihUqFdFNZnPFRQFCS1vmjjCrI0gXNRe
	e
X-Google-Smtp-Source: AGHT+IGyZ75hEVy9kIge3eNy+nd9VWlpTcjJlJ4gOEGaKza101VCmcFG8x+Er3eHfy+DL4Y06uXmoA==
X-Received: by 2002:a05:690c:6ac2:b0:62d:1eb6:87bf with SMTP id 00721157ae682-652d5335122mr111440017b3.5.1720420360448;
        Sun, 07 Jul 2024 23:32:40 -0700 (PDT)
Received: from MVIN00016.mvista.com ([150.129.170.238])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-651567822c2sm18709557b3.52.2024.07.07.23.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jul 2024 23:32:40 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>,
	Changqing Li <changqing.li@windriver.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [scarthgap][PATCH] ghostscript: upgrade 10.02.1 -> 10.03.1
Date: Mon,  8 Jul 2024 11:58:40 +0530
Message-Id: <20240708062838.225806-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jul 2024 06:32:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201627

avoid-host-contamination.patch refreshed for 10.03.1

Below patches are no longer needed as it's included in this upgrade.

1. CVE-2024-29510.patch
2. CVE-2024-33869-0001.patch
3. CVE-2024-33869-0002.patch
4. CVE-2024-33870.patch
5. CVE-2024-33871.patch
6. configure.ac-add-option-to-explicitly-disable-neon.patch

other patch release to address security bugs:
CVE-2024-29506
CVE-2024-29507
CVE-2024-29508
CVE-2024-29509
CVE-2024-29511

(From OE-Core rev: 9a424fbcdc0c792ff3b99bf0e8a5e380582f53bc)

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../ghostscript/CVE-2024-29510.patch          | 84 ----------------
 .../ghostscript/CVE-2024-33869-0001.patch     | 39 --------
 .../ghostscript/CVE-2024-33869-0002.patch     | 52 ----------
 .../ghostscript/CVE-2024-33870.patch          | 99 -------------------
 .../ghostscript/CVE-2024-33871.patch          | 43 --------
 .../avoid-host-contamination.patch            | 11 +--
 ...dd-option-to-explicitly-disable-neon.patch | 99 -------------------
 ...ript_10.02.1.bb => ghostscript_10.03.1.bb} |  8 +-
 8 files changed, 5 insertions(+), 430 deletions(-)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29510.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0001.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0002.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33870.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33871.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/configure.ac-add-option-to-explicitly-disable-neon.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_10.02.1.bb => ghostscript_10.03.1.bb} (88%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29510.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29510.patch
deleted file mode 100644
index 692d35157f..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29510.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 3b1735085ecef20b29e8db3416ab36de93e86d1f Mon Sep 17 00:00:00 2001
-From: Ken Sharp <Ken.Sharp@artifex.com>
-Date: Thu, 21 Mar 2024 09:01:15 +0000
-Subject: [PATCH 5/5] Uniprint device - prevent string configuration changes
- when SAFER
-
-Bug #707662
-
-We cannot sanitise the string arguments used by the Uniprint device
-because they can potentially include anything.
-
-This commit ensures that these strings are locked and cannot be
-changed by PostScript once SAFER is activated. Full configuration from
-the command line is still possible (see the *.upp files in lib).
-
-This addresses CVE-2024-29510
-
-CVE: CVE-2024-29510
-
-Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=3b1735085ecef20b29e]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- devices/gdevupd.c | 31 +++++++++++++++++++++++++++++++
- 1 file changed, 31 insertions(+)
-
-diff --git a/devices/gdevupd.c b/devices/gdevupd.c
-index 740dae0..a50571a 100644
---- a/devices/gdevupd.c
-+++ b/devices/gdevupd.c
-@@ -1887,6 +1887,16 @@ out on this copies.
-       if(!upd_strings[i]) continue;
-       UPD_PARAM_READ(param_read_string,upd_strings[i],value,udev->memory);
-       if(0 == code) {
-+        if (gs_is_path_control_active(udev->memory)) {
-+            if (strings[i].size != value.size)
-+              error = gs_error_invalidaccess;
-+            else {
-+                if (strings[i].data && memcmp(strings[i].data, value.data, strings[i].size) != 0)
-+                    error = gs_error_invalidaccess;
-+            }
-+            if (error < 0)
-+                goto exit;
-+        }
-          if(0 <= error) error |= UPD_PUT_STRINGS;
-          UPD_MM_DEL_PARAM(udev->memory, strings[i]);
-          if(!value.size) {
-@@ -1904,6 +1914,26 @@ out on this copies.
-       if(!upd_string_a[i]) continue;
-       UPD_PARAM_READ(param_read_string_array,upd_string_a[i],value,udev->memory);
-       if(0 == code) {
-+          if (gs_is_path_control_active(udev->memory)) {
-+              if (string_a[i].size != value.size)
-+                  error = gs_error_invalidaccess;
-+              else {
-+                  int loop;
-+                  for (loop = 0;loop < string_a[i].size;loop++) {
-+                      gs_param_string *tmp1 = (gs_param_string *)&(string_a[i].data[loop]);
-+                      gs_param_string *tmp2 = (gs_param_string *)&value.data[loop];
-+
-+                      if (tmp1->size != tmp2->size)
-+                          error = gs_error_invalidaccess;
-+                      else {
-+                          if (tmp1->data && memcmp(tmp1->data, tmp2->data, tmp1->size) != 0)
-+                              error = gs_error_invalidaccess;
-+                      }
-+                  }
-+              }
-+            if (error < 0)
-+                goto exit;
-+          }
-          if(0 <= error) error |= UPD_PUT_STRING_A;
-          UPD_MM_DEL_APARAM(udev->memory, string_a[i]);
-          if(!value.size) {
-@@ -2098,6 +2128,7 @@ transferred into the device-structure. In the case of "uniprint", this may
-       if(0 > code) error = code;
-    }
-
-+exit:
-    if(0 < error) { /* Actually something loaded without error */
-
-       if(!(upd = udev->upd)) {
---
-2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0001.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0001.patch
deleted file mode 100644
index 2f20c66ea3..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0001.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 5ae2e320d69a7d0973011796bd388cd5befa1a43 Mon Sep 17 00:00:00 2001
-From: Ken Sharp <Ken.Sharp@artifex.com>
-Date: Tue, 26 Mar 2024 12:02:57 +0000
-Subject: [PATCH 2/5] Bug #707691
-
-Part 1; when stripping a potential Current Working Dirctory specifier
-from a path, make certain it really is a CWD, and not simply large
-ebough to be a CWD.
-
-Reasons are in the bug thread, this is not (IMO) serious.
-
-This is part of the fix for CVE-2024-33869
-
-CVE: CVE-2024-33869
-
-Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=5ae2e320d69a7d0973]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- base/gpmisc.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/base/gpmisc.c b/base/gpmisc.c
-index c4a69b0..1d4d5d8 100644
---- a/base/gpmisc.c
-+++ b/base/gpmisc.c
-@@ -1164,8 +1164,8 @@ gp_validate_path_len(const gs_memory_t *mem,
-
-             continue;
-         }
--        else if (code < 0 && cdirstrl > 0 && prefix_len == 0 && buffer == bufferfull) {
--            buffer = bufferfull + cdirstrl + dirsepstrl;
-+        else if (code < 0 && cdirstrl > 0 && prefix_len == 0 && buffer == bufferfull
-+            && memcmp(buffer, cdirstr, cdirstrl) && !memcmp(buffer + cdirstrl, dirsepstr, dirsepstrl)) {
-             continue;
-         }
-         break;
---
-2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0002.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0002.patch
deleted file mode 100644
index 5dcbcca998..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0002.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From f5336e5b4154f515ac83bc5b9eba94302e6618d4 Mon Sep 17 00:00:00 2001
-From: Ken Sharp <Ken.Sharp@artifex.com>
-Date: Tue, 26 Mar 2024 12:07:18 +0000
-Subject: [PATCH 3/5] Bug 707691 part 2
-
-See bug thread for details
-
-This is the second part of the fix for CVE-2024-33869
-
-CVE: CVE-2024-33869
-
-Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=f5336e5b4154f515ac83]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- base/gpmisc.c | 21 +++++++++++++++++++++
- 1 file changed, 21 insertions(+)
-
-diff --git a/base/gpmisc.c b/base/gpmisc.c
-index 1d4d5d8..b0d5c71 100644
---- a/base/gpmisc.c
-+++ b/base/gpmisc.c
-@@ -1090,6 +1090,27 @@ gp_validate_path_len(const gs_memory_t *mem,
-         rlen = len;
-     }
-     else {
-+        char *test = (char *)path, *test1;
-+        uint tlen = len, slen;
-+
-+        /* Look for any pipe (%pipe% or '|' specifications between path separators
-+         * Reject any path spec which has a %pipe% or '|' anywhere except at the start.
-+         */
-+        while (tlen > 0) {
-+            if (test[0] == '|' || (tlen > 5 && memcmp(test, "%pipe", 5) == 0)) {
-+                code = gs_note_error(gs_error_invalidfileaccess);
-+                goto exit;
-+            }
-+            test1 = test;
-+            slen = search_separator((const char **)&test, path + len, test1, 1);
-+            if(slen == 0)
-+                break;
-+            test += slen;
-+            tlen -= test - test1;
-+            if (test >= path + len)
-+                break;
-+        }
-+
-         rlen = len+1;
-         bufferfull = (char *)gs_alloc_bytes(mem->thread_safe_memory, rlen + prefix_len, "gp_validate_path");
-         if (bufferfull == NULL)
---
-2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33870.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33870.patch
deleted file mode 100644
index 9c2b9dcfa2..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33870.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From 79aef19c685984dc3da2dc090450407d9fbcff80 Mon Sep 17 00:00:00 2001
-From: Ken Sharp <Ken.Sharp@artifex.com>
-Date: Tue, 26 Mar 2024 12:00:14 +0000
-Subject: [PATCH 1/5] Bug #707686
-
-See bug thread for details
-
-In addition to the noted bug; an error path (return from
-gp_file_name_reduce not successful) could elad to a memory leak as we
-did not free 'bufferfull'. Fix that too.
-
-This addresses CVE-2024-33870
-
-CVE: CVE-2024-33870
-
-Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=79aef19c685984dc]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- base/gpmisc.c | 36 ++++++++++++++++++++++++++++++++----
- 1 file changed, 32 insertions(+), 4 deletions(-)
-
-diff --git a/base/gpmisc.c b/base/gpmisc.c
-index 2b0064b..c4a69b0 100644
---- a/base/gpmisc.c
-+++ b/base/gpmisc.c
-@@ -1,4 +1,4 @@
--/* Copyright (C) 2001-2023 Artifex Software, Inc.
-+/* Copyright (C) 2001-2024 Artifex Software, Inc.
-    All Rights Reserved.
-
-    This software is provided AS-IS with no warranty, either express or
-@@ -1042,7 +1042,7 @@ gp_validate_path_len(const gs_memory_t *mem,
-                      const uint         len,
-                      const char        *mode)
- {
--    char *buffer, *bufferfull;
-+    char *buffer, *bufferfull = NULL;
-     uint rlen;
-     int code = 0;
-     const char *cdirstr = gp_file_name_current();
-@@ -1096,8 +1096,10 @@ gp_validate_path_len(const gs_memory_t *mem,
-             return gs_error_VMerror;
-
-         buffer = bufferfull + prefix_len;
--        if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) != gp_combine_success)
--            return gs_error_invalidfileaccess;
-+        if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) != gp_combine_success) {
-+            code = gs_note_error(gs_error_invalidfileaccess);
-+            goto exit;
-+        }
-         buffer[rlen] = 0;
-     }
-     while (1) {
-@@ -1132,9 +1134,34 @@ gp_validate_path_len(const gs_memory_t *mem,
-             code = gs_note_error(gs_error_invalidfileaccess);
-         }
-         if (code < 0 && prefix_len > 0 && buffer > bufferfull) {
-+            uint newlen = rlen + cdirstrl + dirsepstrl;
-+            char *newbuffer;
-+            int code;
-+
-             buffer = bufferfull;
-             memcpy(buffer, cdirstr, cdirstrl);
-             memcpy(buffer + cdirstrl, dirsepstr, dirsepstrl);
-+
-+            /* We've prepended a './' or similar for the current working directory. We need
-+             * to execute file_name_reduce on that, to eliminate any '../' or similar from
-+             * the (new) full path.
-+             */
-+            newbuffer = (char *)gs_alloc_bytes(mem->thread_safe_memory, newlen + 1, "gp_validate_path");
-+            if (newbuffer == NULL) {
-+                code = gs_note_error(gs_error_VMerror);
-+                goto exit;
-+            }
-+
-+            memcpy(newbuffer, buffer, rlen + cdirstrl + dirsepstrl);
-+            newbuffer[newlen] = 0x00;
-+
-+            code = gp_file_name_reduce(newbuffer, (uint)newlen, buffer, &newlen);
-+            gs_free_object(mem->thread_safe_memory, newbuffer, "gp_validate_path");
-+            if (code != gp_combine_success) {
-+                code = gs_note_error(gs_error_invalidfileaccess);
-+                goto exit;
-+            }
-+
-             continue;
-         }
-         else if (code < 0 && cdirstrl > 0 && prefix_len == 0 && buffer == bufferfull) {
-@@ -1153,6 +1180,7 @@ gp_validate_path_len(const gs_memory_t *mem,
-                                            gs_path_control_flag_is_scratch_file);
-     }
-
-+exit:
-     gs_free_object(mem->thread_safe_memory, bufferfull, "gp_validate_path");
- #ifdef EACCES
-     if (code == gs_error_invalidfileaccess)
---
-2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33871.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33871.patch
deleted file mode 100644
index abe6384997..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33871.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 7145885041bb52cc23964f0aa2aec1b1c82b5908 Mon Sep 17 00:00:00 2001
-From: Zdenek Hutyra <zhutyra@centrum.cz>
-Date: Mon, 22 Apr 2024 13:33:47 +0100
-Subject: [PATCH 4/5] OPVP device - prevent unsafe parameter change with SAFER
-
-Bug #707754 "OPVP device - Arbitrary code execution via custom Driver library"
-
-The "Driver" parameter for the "opvp"/"oprp" device specifies the name
-of a dynamic library and allows any library to be loaded.
-
-The patch does not allow changing this parameter after activating path
-control.
-
-This addresses CVE-2024-33871
-
-CVE: CVE-2024-33871
-
-Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=7145885041bb52cc2396]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- contrib/opvp/gdevopvp.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/contrib/opvp/gdevopvp.c b/contrib/opvp/gdevopvp.c
-index 74200cf..80eb23b 100644
---- a/contrib/opvp/gdevopvp.c
-+++ b/contrib/opvp/gdevopvp.c
-@@ -3456,6 +3456,12 @@ _put_params(gx_device *dev, gs_param_list *plist)
-     code = param_read_string(plist, pname, &vdps);
-     switch (code) {
-     case 0:
-+        if (gs_is_path_control_active(dev->memory)
-+            && (!opdev->globals.vectorDriver || strlen(opdev->globals.vectorDriver) != vdps.size
-+                || memcmp(opdev->globals.vectorDriver, vdps.data, vdps.size) != 0)) {
-+            param_signal_error(plist, pname, gs_error_invalidaccess);
-+            return_error(gs_error_invalidaccess);
-+        }
-         buff = realloc(buff, vdps.size + 1);
-         memcpy(buff, vdps.data, vdps.size);
-         buff[vdps.size] = 0;
---
-2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
index 15c7eb5a77..67f14bd368 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
@@ -1,7 +1,7 @@
-From 0ccbaa134093bf6afc79f2d20d061bca5a8754ed Mon Sep 17 00:00:00 2001
+From b36713c8f1ba0e5755b78845a433354a63663b1a Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Thu, 29 Mar 2018 16:02:05 +0800
-Subject: [PATCH 04/10] avoid host contamination
+Subject: [PATCH] avoid host contamination
 
 Remove hardcode path refer to host to avoid host contamination.
 
@@ -15,10 +15,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/devices/devs.mak b/devices/devs.mak
-index 846aa50..9570182 100644
+index 186f704..88ab8c9 100644
 --- a/devices/devs.mak
 +++ b/devices/devs.mak
-@@ -393,7 +393,7 @@ $(DEVOBJ)gdevxalt.$(OBJ) : $(DEVSRC)gdevxalt.c $(GDEVX) $(math__h) $(memory__h)\
+@@ -397,7 +397,7 @@ $(DEVOBJ)gdevxalt.$(OBJ) : $(DEVSRC)gdevxalt.c $(GDEVX) $(math__h) $(memory__h)\
  ### NON PORTABLE, ONLY UNIX WITH GCC SUPPORT
  
  $(DEVOBJ)X11.so : $(x11alt_) $(x11_) $(DEVS_MAK) $(MAKEDIRS)
@@ -27,6 +27,3 @@ index 846aa50..9570182 100644
  
  ###### --------------- Memory-buffered printer devices --------------- ######
  
--- 
-1.8.3.1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/configure.ac-add-option-to-explicitly-disable-neon.patch b/meta/recipes-extended/ghostscript/ghostscript/configure.ac-add-option-to-explicitly-disable-neon.patch
deleted file mode 100644
index 7873396045..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/configure.ac-add-option-to-explicitly-disable-neon.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From fd37229a17822c5ad21a369f670b8a6f6cc6b95b Mon Sep 17 00:00:00 2001
-From: Benjamin Bara <benjamin.bara@skidata.com>
-Date: Mon, 4 Sep 2023 12:16:39 +0200
-Subject: [PATCH] configure.ac: add option to explicitly disable neon
-
-Uncomment an already existing possibility to explicitly disable neon and
-use it on both implemented neon checks.
-
-Upstream-Status: Submitted [https://bugs.ghostscript.com/show_bug.cgi?id=707097]
-
-Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
----
- configure.ac | 52 +++++++++++++++++++++++++++++-----------------------
- 1 file changed, 29 insertions(+), 23 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 09d881dd1..62718e15e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -749,6 +749,33 @@ SUBCONFIG_OPTS="--build=$build --host=$host"
- #  SUBCONFIG_OPTS="$SUBCONFIG_OPTS --host=$host_alias"
- #fi
- 
-+dnl --------------------------------------------------
-+dnl Check for NEON support
-+dnl --------------------------------------------------
-+save_cflags=$CFLAGS
-+AC_MSG_CHECKING([neon support])
-+CFLAGS="$save_cflags $OPT_CFLAGS -mfpu=neon -mcpu=cortex-a53"
-+HAVE_NEON=""
-+AC_LINK_IFELSE(
-+  [AC_LANG_PROGRAM([#include "arm_neon.h"], [
-+  int32x4_t round = vdupq_n_s32(10);
-+  return(0);
-+  ])],
-+  [HAVE_NEON="-DHAVE_NEON"], [HAVE_NEON=""])
-+
-+AC_ARG_ENABLE([neon], AS_HELP_STRING([--disable-neon],
-+       [Do not use neon instrinsics]), [
-+             if test "x$enable_neon" = xno; then
-+                HAVE_NEON=""
-+             fi])
-+
-+if test "x$HAVE_NEON" != x; then
-+  AC_MSG_RESULT(yes)
-+else
-+  AC_MSG_RESULT(no)
-+fi
-+CFLAGS=$save_cflags
-+
- dnl --------------------------------------------------
- dnl Check for libraries
- dnl --------------------------------------------------
-@@ -971,11 +998,12 @@ if test x$with_tesseract != xno; then
-          [TESS_NEON="-mfpu=neon -mcpu=cortex-a53 -D__ARM_NEON__"],
-          [TESS_NEON=""])
- 
--        if test "x$TESS_NEON" != x; then
-+        if test "x$TESS_NEON" != x && test "x$enable_neon" != xno; then
-           AC_MSG_RESULT(yes)
-           TESS_CXXFLAGS="$TESS_CXXFLAGS -DHAVE_NEON"
-         else
-           AC_MSG_RESULT(no)
-+          TESS_NEON=""
-         fi
- 
-         CXXFLAGS="$save_cxxflags"
-@@ -2387,28 +2415,6 @@ if test x$WITH_CAL != x0; then
-     AC_MSG_RESULT(no)
-   fi
- 
--  AC_MSG_CHECKING([neon support])
--  CFLAGS="$save_cflags $OPT_CFLAGS -mfpu=neon -mcpu=cortex-a53"
--  HAVE_NEON=""
--  AC_LINK_IFELSE(
--    [AC_LANG_PROGRAM([#include "arm_neon.h"], [
--    int32x4_t round = vdupq_n_s32(10);
--    return(0);
--    ])],
--    [HAVE_NEON="-DHAVE_NEON"], [HAVE_NEON=""])
--
--  #AC_ARG_ENABLE([neon], AS_HELP_STRING([--disable-neon],
--  #       [Do not use neon instrinsics]), [
--  #             if test "x$enable_neon" = xno; then
--  #                HAVE_NEON=""
--  #             fi])
--
--  if test "x$HAVE_NEON" != x; then
--    AC_MSG_RESULT(yes)
--  else
--    AC_MSG_RESULT(no)
--  fi
--
-   #AC_SUBST(HAVE_SSE4_2)
-   #AC_SUBST(HAVE_NEON)
-   CFLAGS=$save_cflags
--- 
-2.34.1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.03.1.bb
similarity index 88%
rename from meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.03.1.bb
index db9481816a..0504f5244f 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.03.1.bb
@@ -25,15 +25,9 @@ def gs_verdir(v):
 SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs${@gs_verdir("${PV}")}/${BPN}-${PV}.tar.gz \
            file://ghostscript-9.16-Werror-return-type.patch \
            file://avoid-host-contamination.patch \
-           file://configure.ac-add-option-to-explicitly-disable-neon.patch \
-           file://CVE-2024-33870.patch \
-           file://CVE-2024-33869-0001.patch \
-           file://CVE-2024-33869-0002.patch \
-           file://CVE-2024-33871.patch \
-           file://CVE-2024-29510.patch \
            "
 
-SRC_URI[sha256sum] = "e429e4f5b01615a4f0f93a4128e8a1a4d932dff983b1774174c79c0630717ad9"
+SRC_URI[sha256sum] = "31cd01682ad23a801cc3bbc222a55f07c4ea3e068bdfb447792d54db21a2e8ad"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-- 
2.25.1


