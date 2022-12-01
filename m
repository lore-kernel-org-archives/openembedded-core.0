Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D08C47089
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:27:52 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.44764.1669904847658381290
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:27:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=qnAAWMGY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id a9so1782618pld.7
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rhhr+0WiyB5MHPq/tJPataL68lK0Uo3H4P/2bAieuJs=;
        b=qnAAWMGYajK6OdPfdEJd06G+7g+6k3hg6liyClW2P/W+BHv7i7C3kAy0QGoNeSVCqs
         RfHsxARfEVMWSTYTXSmQ5tuOW+QH7nB729eBzQNABun0Fy9FLjKrJz10bTTNehIGXxtd
         mt1yFunySRqmE0bU+HznbIKJ7ZtTxVXLyIY8LwMHuSLKoYNTF+6nXumUeIlt1qYCy1I2
         k/4Rm+btke7ld58IgrRniw3LWyY+HGqcF8dsrG+9LkaP8y6wGC+c/U9AMI/MuoG4k4zo
         Pld9jzhri2MH2C86yQneTn0ePr33yyS0Xu0UmqLsUCrm+9VMe8fpl4J9k4Uvwl7o7PVI
         vjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rhhr+0WiyB5MHPq/tJPataL68lK0Uo3H4P/2bAieuJs=;
        b=e8STLP5yFuvAodNxml/c7CULEFiMOPGHu+WwABmJkO/Utn5HNFOJgfb7pNcm4tXlvT
         kLqCFtvarfhocPP2dNXm7+IvoCovJikP8yhIx45WhqCpn90bDI8DuGJm5Qxx7kSjHk2W
         /UvFNgeZLvHtODChZCUefh7Vt5d/ZxBEXX4DjJKAfWKstLms0B8Srbg01ecoUoJ7MES/
         4DfW0loHLBZBu+c9wGcihvaXflJbmuavTejExOu6Gd478ND05B77Txf2byaTur7YyJQq
         tkHWoQ7kEryVW7eXLhCCfW0XD+7OltxgJ+GQITO7l7USSsmTNTs9kagems0kchm49plX
         hfMA==
X-Gm-Message-State: ANoB5pnM3b+BjsbR7jgDNbObNLMyOCi702TqTq7yzWeGGEBAUI50wS1v
	QVkFUA6o/ehfsWdVCbKBKhUjvoUelX7IiA58Lls=
X-Google-Smtp-Source: AA0mqf6t/Qki2q8nUdyEhihMT8H/gUa44GRQwEMrhjoh+jB2HaPEp5tXYkGMZB4vdNk1qSNEvldhQg==
X-Received: by 2002:a17:90a:a60c:b0:213:2e97:5ea4 with SMTP id c12-20020a17090aa60c00b002132e975ea4mr76714511pjq.92.1669904870013;
        Thu, 01 Dec 2022 06:27:50 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id b14-20020a17090a6ace00b00218e8a0d7f0sm4908308pjm.22.2022.12.01.06.27.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:27:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/23] dbus: upgrade 1.14.0 -> 1.14.4
Date: Thu,  1 Dec 2022 04:27:05 -1000
Message-Id: <300216ca357ae58fbe52e49c76832b66f15c6c13.1669904703.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904703.git.steve@sakoman.com>
References: <cover.1669904703.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174097

From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>

License-Update: D-Bus changed to dbus.
1.14.4 has contians following CVEs, removing local patches:

CVE-2022-42012: 0001-dbus-marshal-byteswap-Byte-swap-Unix-fd-indexes-if-n.patch
[https://github.com/freedesktop/dbus/commit/3fb065b0752db1e298e4ada52cf4adc414f5e946]

CVE-2022-42011: 0001-dbus-marshal-validate-Validate-length-of-arrays-of-f.patch
[https://github.com/freedesktop/dbus/commit/b9e6a7523085a2cfceaffca7ba1ab4251f12a984]

CVE-2022-42010: 0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch
[https://github.com/freedesktop/dbus/commit/3e53a785dee8d1432156188a2c4260e4cbc78c4d]

Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...eswap-Byte-swap-Unix-fd-indexes-if-n.patch |  76 -----------
 ...idate-Check-brackets-in-signature-ne.patch | 119 ------------------
 ...idate-Validate-length-of-arrays-of-f.patch |  61 ---------
 .../dbus/{dbus_1.14.0.bb => dbus_1.14.4.bb}   |  10 +-
 4 files changed, 4 insertions(+), 262 deletions(-)
 delete mode 100644 meta/recipes-core/dbus/dbus/0001-dbus-marshal-byteswap-Byte-swap-Unix-fd-indexes-if-n.patch
 delete mode 100644 meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch
 delete mode 100644 meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Validate-length-of-arrays-of-f.patch
 rename meta/recipes-core/dbus/{dbus_1.14.0.bb => dbus_1.14.4.bb} (93%)

diff --git a/meta/recipes-core/dbus/dbus/0001-dbus-marshal-byteswap-Byte-swap-Unix-fd-indexes-if-n.patch b/meta/recipes-core/dbus/dbus/0001-dbus-marshal-byteswap-Byte-swap-Unix-fd-indexes-if-n.patch
deleted file mode 100644
index 47f4f1e0d3..0000000000
--- a/meta/recipes-core/dbus/dbus/0001-dbus-marshal-byteswap-Byte-swap-Unix-fd-indexes-if-n.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 3fb065b0752db1e298e4ada52cf4adc414f5e946 Mon Sep 17 00:00:00 2001
-From: Simon McVittie <smcv@collabora.com>
-Date: Fri, 30 Sep 2022 13:46:31 +0100
-Subject: [PATCH] dbus-marshal-byteswap: Byte-swap Unix fd indexes if needed
-
-When a D-Bus message includes attached file descriptors, the body of the
-message contains unsigned 32-bit indexes pointing into an out-of-band
-array of file descriptors. Some D-Bus APIs like GLib's GDBus refer to
-these indexes as "handles" for the associated fds (not to be confused
-with a Windows HANDLE, which is a kernel object).
-
-The assertion message removed by this commit is arguably correct up to
-a point: fd-passing is only reasonable on a local machine, and no known
-operating system allows processes of differing endianness even on a
-multi-endian ARM or PowerPC CPU, so it makes little sense for the sender
-to specify a byte-order that differs from the byte-order of the recipient.
-
-However, this doesn't account for the fact that a malicious sender
-doesn't have to restrict itself to only doing things that make sense.
-On a system with untrusted local users, a message sender could crash
-the system dbus-daemon (a denial of service) by sending a message in
-the opposite endianness that contains handles to file descriptors.
-
-Before this commit, if assertions are enabled, attempting to byteswap
-a fd index would cleanly crash the message recipient with an assertion
-failure. If assertions are disabled, attempting to byteswap a fd index
-would silently do nothing without advancing the pointer p, causing the
-message's type and the pointer into its contents to go out of sync, which
-can result in a subsequent crash (the crash demonstrated by fuzzing was
-a use-after-free, but other failure modes might be possible).
-
-In principle we could resolve this by rejecting wrong-endianness messages
-from a local sender, but it's actually simpler and less code to treat
-wrong-endianness messages as valid and byteswap them.
-
-Thanks: Evgeny Vereshchagin
-Fixes: ba7daa60 "unix-fd: add basic marshalling code for unix fds"
-Resolves: https://gitlab.freedesktop.org/dbus/dbus/-/issues/417
-Resolves: CVE-2022-42012
-
-Upstream-Status: Backport from [https://gitlab.freedesktop.org/dbus/dbus/-/commit/3fb065b0752db1e298e4ada52cf4adc414f5e946]
-
-Signed-off-by: Simon McVittie <smcv@collabora.com>
-(cherry picked from commit 236f16e444e88a984cf12b09225e0f8efa6c5b44)
-Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
----
- dbus/dbus-marshal-byteswap.c | 6 +-----
- 1 file changed, 1 insertion(+), 5 deletions(-)
-
-diff --git a/dbus/dbus-marshal-byteswap.c b/dbus/dbus-marshal-byteswap.c
-index 27695aaf..7104e9c6 100644
---- a/dbus/dbus-marshal-byteswap.c
-+++ b/dbus/dbus-marshal-byteswap.c
-@@ -61,6 +61,7 @@ byteswap_body_helper (DBusTypeReader       *reader,
-         case DBUS_TYPE_BOOLEAN:
-         case DBUS_TYPE_INT32:
-         case DBUS_TYPE_UINT32:
-+        case DBUS_TYPE_UNIX_FD:
-           {
-             p = _DBUS_ALIGN_ADDRESS (p, 4);
-             *((dbus_uint32_t*)p) = DBUS_UINT32_SWAP_LE_BE (*((dbus_uint32_t*)p));
-@@ -188,11 +189,6 @@ byteswap_body_helper (DBusTypeReader       *reader,
-           }
-           break;
- 
--        case DBUS_TYPE_UNIX_FD:
--          /* fds can only be passed on a local machine, so byte order must always match */
--          _dbus_assert_not_reached("attempted to byteswap unix fds which makes no sense");
--          break;
--
-         default:
-           _dbus_assert_not_reached ("invalid typecode in supposedly-validated signature");
-           break;
--- 
-2.34.1
-
diff --git a/meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch b/meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch
deleted file mode 100644
index f2e14fb8d5..0000000000
--- a/meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-From 3e53a785dee8d1432156188a2c4260e4cbc78c4d Mon Sep 17 00:00:00 2001
-From: Simon McVittie <smcv@collabora.com>
-Date: Tue, 13 Sep 2022 15:10:22 +0100
-Subject: [PATCH] dbus-marshal-validate: Check brackets in signature nest
- correctly
-
-In debug builds with assertions enabled, a signature with incorrectly
-nested `()` and `{}`, for example `a{i(u}` or `(a{ii)}`, could result
-in an assertion failure.
-
-In production builds without assertions enabled, a signature with
-incorrectly nested `()` and `{}` could potentially result in a crash
-or incorrect message parsing, although we do not have a concrete example
-of either of these failure modes.
-
-Thanks: Evgeny Vereshchagin
-Resolves: https://gitlab.freedesktop.org/dbus/dbus/-/issues/418
-Resolves: CVE-2022-42010
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/dbus/dbus/-/commit/3e53a785dee8d1432156188a2c4260e4cbc78c4d]
-
-Signed-off-by: Simon McVittie <smcv@collabora.com>
-(cherry picked from commit 9d07424e9011e3bbe535e83043d335f3093d2916)
-Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
----
- dbus/dbus-marshal-validate.c | 38 +++++++++++++++++++++++++++++++++++-
- 1 file changed, 37 insertions(+), 1 deletion(-)
-
-diff --git a/dbus/dbus-marshal-validate.c b/dbus/dbus-marshal-validate.c
-index 4d492f3f..ae68414d 100644
---- a/dbus/dbus-marshal-validate.c
-+++ b/dbus/dbus-marshal-validate.c
-@@ -62,6 +62,8 @@ _dbus_validate_signature_with_reason (const DBusString *type_str,
- 
-   int element_count;
-   DBusList *element_count_stack;
-+  char opened_brackets[DBUS_MAXIMUM_TYPE_RECURSION_DEPTH * 2 + 1] = { '\0' };
-+  char last_bracket;
- 
-   result = DBUS_VALID;
-   element_count_stack = NULL;
-@@ -93,6 +95,10 @@ _dbus_validate_signature_with_reason (const DBusString *type_str,
- 
-   while (p != end)
-     {
-+      _dbus_assert (struct_depth + dict_entry_depth >= 0);
-+      _dbus_assert (struct_depth + dict_entry_depth < _DBUS_N_ELEMENTS (opened_brackets));
-+      _dbus_assert (opened_brackets[struct_depth + dict_entry_depth] == '\0');
-+
-       switch (*p)
-         {
-         case DBUS_TYPE_BYTE:
-@@ -136,6 +142,10 @@ _dbus_validate_signature_with_reason (const DBusString *type_str,
-               goto out;
-             }
- 
-+          _dbus_assert (struct_depth + dict_entry_depth >= 1);
-+          _dbus_assert (struct_depth + dict_entry_depth < _DBUS_N_ELEMENTS (opened_brackets));
-+          _dbus_assert (opened_brackets[struct_depth + dict_entry_depth - 1] == '\0');
-+          opened_brackets[struct_depth + dict_entry_depth - 1] = DBUS_STRUCT_BEGIN_CHAR;
-           break;
- 
-         case DBUS_STRUCT_END_CHAR:
-@@ -151,9 +161,20 @@ _dbus_validate_signature_with_reason (const DBusString *type_str,
-               goto out;
-             }
- 
-+          _dbus_assert (struct_depth + dict_entry_depth >= 1);
-+          _dbus_assert (struct_depth + dict_entry_depth < _DBUS_N_ELEMENTS (opened_brackets));
-+          last_bracket = opened_brackets[struct_depth + dict_entry_depth - 1];
-+
-+          if (last_bracket != DBUS_STRUCT_BEGIN_CHAR)
-+            {
-+              result = DBUS_INVALID_STRUCT_ENDED_BUT_NOT_STARTED;
-+              goto out;
-+            }
-+
-           _dbus_list_pop_last (&element_count_stack);
- 
-           struct_depth -= 1;
-+          opened_brackets[struct_depth + dict_entry_depth] = '\0';
-           break;
- 
-         case DBUS_DICT_ENTRY_BEGIN_CHAR:
-@@ -178,6 +199,10 @@ _dbus_validate_signature_with_reason (const DBusString *type_str,
-               goto out;
-             }
- 
-+          _dbus_assert (struct_depth + dict_entry_depth >= 1);
-+          _dbus_assert (struct_depth + dict_entry_depth < _DBUS_N_ELEMENTS (opened_brackets));
-+          _dbus_assert (opened_brackets[struct_depth + dict_entry_depth - 1] == '\0');
-+          opened_brackets[struct_depth + dict_entry_depth - 1] = DBUS_DICT_ENTRY_BEGIN_CHAR;
-           break;
- 
-         case DBUS_DICT_ENTRY_END_CHAR:
-@@ -186,8 +211,19 @@ _dbus_validate_signature_with_reason (const DBusString *type_str,
-               result = DBUS_INVALID_DICT_ENTRY_ENDED_BUT_NOT_STARTED;
-               goto out;
-             }
--            
-+
-+          _dbus_assert (struct_depth + dict_entry_depth >= 1);
-+          _dbus_assert (struct_depth + dict_entry_depth < _DBUS_N_ELEMENTS (opened_brackets));
-+          last_bracket = opened_brackets[struct_depth + dict_entry_depth - 1];
-+
-+          if (last_bracket != DBUS_DICT_ENTRY_BEGIN_CHAR)
-+            {
-+              result = DBUS_INVALID_DICT_ENTRY_ENDED_BUT_NOT_STARTED;
-+              goto out;
-+            }
-+
-           dict_entry_depth -= 1;
-+          opened_brackets[struct_depth + dict_entry_depth] = '\0';
- 
-           element_count = 
-             _DBUS_POINTER_TO_INT (_dbus_list_pop_last (&element_count_stack));
--- 
-2.34.1
-
diff --git a/meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Validate-length-of-arrays-of-f.patch b/meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Validate-length-of-arrays-of-f.patch
deleted file mode 100644
index f953326f78..0000000000
--- a/meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Validate-length-of-arrays-of-f.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From b9e6a7523085a2cfceaffca7ba1ab4251f12a984 Mon Sep 17 00:00:00 2001
-From: Simon McVittie <smcv@collabora.com>
-Date: Mon, 12 Sep 2022 13:14:18 +0100
-Subject: [PATCH] dbus-marshal-validate: Validate length of arrays of
- fixed-length items
-
-This fast-path previously did not check that the array was made up
-of an integer number of items. This could lead to assertion failures
-and out-of-bounds accesses during subsequent message processing (which
-assumes that the message has already been validated), particularly after
-the addition of _dbus_header_remove_unknown_fields(), which makes it
-more likely that dbus-daemon will apply non-trivial edits to messages.
-
-Thanks: Evgeny Vereshchagin
-Fixes: e61f13cf "Bug 18064 - more efficient validation for fixed-size type arrays"
-Resolves: https://gitlab.freedesktop.org/dbus/dbus/-/issues/413
-Resolves: CVE-2022-42011
-
-Upstream-Status: Backport from
-[https://gitlab.freedesktop.org/dbus/dbus/-/commit/b9e6a7523085a2cfceaffca7ba1ab4251f12a984]
-
-Signed-off-by: Simon McVittie <smcv@collabora.com>
-(cherry picked from commit 079bbf16186e87fb0157adf8951f19864bc2ed69)
-Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
----
- dbus/dbus-marshal-validate.c | 13 ++++++++++++-
- 1 file changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/dbus/dbus-marshal-validate.c b/dbus/dbus-marshal-validate.c
-index ae68414d..7d0d6cf7 100644
---- a/dbus/dbus-marshal-validate.c
-+++ b/dbus/dbus-marshal-validate.c
-@@ -503,13 +503,24 @@ validate_body_helper (DBusTypeReader       *reader,
-                  */ 
-                 if (dbus_type_is_fixed (array_elem_type))
-                   {
-+                    /* Note that fixed-size types all have sizes equal to
-+                     * their alignments, so this is really the item size. */
-+                    alignment = _dbus_type_get_alignment (array_elem_type);
-+                    _dbus_assert (alignment == 1 || alignment == 2 ||
-+                                  alignment == 4 || alignment == 8);
-+
-+                    /* Because the alignment is a power of 2, this is
-+                     * equivalent to: (claimed_len % alignment) != 0,
-+                     * but avoids slower integer division */
-+                    if ((claimed_len & (alignment - 1)) != 0)
-+                      return DBUS_INVALID_ARRAY_LENGTH_INCORRECT;
-+
-                     /* bools need to be handled differently, because they can
-                      * have an invalid value
-                      */
-                     if (array_elem_type == DBUS_TYPE_BOOLEAN)
-                       {
-                         dbus_uint32_t v;
--                        alignment = _dbus_type_get_alignment (array_elem_type);
- 
-                         while (p < array_end)
-                           {
--- 
-2.34.1
-
diff --git a/meta/recipes-core/dbus/dbus_1.14.0.bb b/meta/recipes-core/dbus/dbus_1.14.4.bb
similarity index 93%
rename from meta/recipes-core/dbus/dbus_1.14.0.bb
rename to meta/recipes-core/dbus/dbus_1.14.4.bb
index 484629e987..9684f0c6e2 100644
--- a/meta/recipes-core/dbus/dbus_1.14.0.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.4.bb
@@ -6,19 +6,17 @@ SECTION = "base"
 inherit autotools pkgconfig gettext upstream-version-is-even ptest-gnome
 
 LICENSE = "AFL-2.1 | GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
-                    file://dbus/dbus.h;beginline=6;endline=20;md5=866739837ccd835350af94dccd6457d8"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6423dcd74d7be9715b0db247fd889da3 \
+                    file://dbus/dbus.h;beginline=6;endline=20;md5=866739837ccd835350af94dccd6457d8 \
+                    "
 
 SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
            file://run-ptest \
            file://tmpdir.patch \
            file://dbus-1.init \
-           file://0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch \
-           file://0001-dbus-marshal-validate-Validate-length-of-arrays-of-f.patch \
-           file://0001-dbus-marshal-byteswap-Byte-swap-Unix-fd-indexes-if-n.patch \
 "
 
-SRC_URI[sha256sum] = "ccd7cce37596e0a19558fd6648d1272ab43f011d80c8635aea8fd0bad58aebd4"
+SRC_URI[sha256sum] = "7c0f9b8e5ec0ff2479383e62c0084a3a29af99edf1514e9f659b81b30d4e353e"
 
 EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
-- 
2.25.1


