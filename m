Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA0A1C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:21:33 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.36978.1698996086178304526
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="126798706"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="126798706"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:21:23 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C5C5AD6479
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:21:21 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0B272D88CF
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:21:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 491BC20050190;
	Fri,  3 Nov 2023 16:21:20 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] glib-2.0: upgrade 2.78.0 -> 2.78.1
Date: Fri,  3 Nov 2023 15:20:44 +0800
Message-Id: <1698996044-30548-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27974.005
X-TMASE-Result: 10--5.872300-10.000000
X-TMASE-MatchedRID: ZsQmnj20Xtajz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuY5nVpihxiw//q
	b9sK3pliGf9KswubdQcUiswfGFEULIRiOzyn0C74tTItyDGGxTgxVUWGXs3C811OAfq6beiurLa
	ELwoCkYueJUkbyP5FFeecyabUP289/sernTRzvzBURfNbW2avkNiPDVCot+tGjhBDYLFALmKGPn
	eCOFgqRGFGvkqxLFFvqtUqXOAtfIQfWcrcti/voPhmLfH/1YU7HLMdyB+LKtxaer+1iaJkEHMIa
	paDo9OKHK04IfWmyexMNbrUuyXyo+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQsqhS
	zMv5WaYr1HXXKXjaxc7+YiJeggxyjbTGlrIUcFndCok3ibXlQX0tCKdnhB589yM15V5aWpj6C0e
	Ps7A07Xi4XEoPXecxbc5df4QvWS7QufK2MDPUnz+EyQmy7Y5MDU200KQsH4g=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190120

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* Fix truncating files when "g_file_set_contents_full()" is called without
  "G_FILE_SET_CONTENTS_CONSISTENT"

* Fix "-Dlibelf=disabled" on Linux

* Bugs fixed:
  - #3105 NetworkManager 1.44.0 crashes repeatedly with glib 2.78.0
  - #3111 gsubprocess-testprog.c: build error with cygwin (sys/ptrace.h: No such
    file or directory)
  - #3116 gio clears modification time in microseconds when setting with
    "set_modification_date_time"
  - #3120 Build of glib 2.78.0 ignores -Dlibelf=disabled
  - #3128 glib-2.78.0 fails at gio/tests/gsubprocess.p/gsubprocess.c.o
  - #3130 Segfault when creating GIO GPropertyAction without properties
  - #3144 "g_file_set_contents_full()" doesn't truncate the file (without
    "G_FILE_SET_CONTENTS_CONSISTENT")
  - !3576 guniprop.c: Avoid creating (temporarily) out-of-bounds pointers
  - !3579 Fixes for integer cast warnings when targeting CHERI
  - !3580 Fix test_find_program on FreeBSD
  - !3589 gconstructor.h: Ensure [c|d]tor prototypes are present for MSVC
  - !3594 Fix gutils-user-database test on macOS
  - !3596 Add value annotation to G_TYPE_FUNDAMENTAL_MAX
  - !3601 meson: Fix Windows build with PCRE2 as sibling subproject
  - !3604 Backport !3589 "gconstructor.h: Ensure [c|d]tor prototypes are present
    for MSVC" to glib-2-78
  - !3608 Backport !3587 "glocalfileinfo: Preserve microseconds for
    access/modify times" to glib-2-78
  - !3609 Backport !3607 "Make sure the "GTask" is freed on a graceful
    disconnect" to glib-2-78
  - !3614 Backport !3582 "Buffer needs to be aligned correctly to receive
    linux_dirent64." to glib-2-78
  - !3616 Backport !3590 "gtestutils.h: Fix warning with -Wsign-conversion
    caused by g_assert_cmpint" to glib-2-78
  - !3619 Backport !3617 "tests: Drop unnecessary include from gsubprocess-
    testprog.c" to glib-2-78
  - !3622 Backport !3621 "wakeup: do single read when using eventfd()" to
    glib-2-78
  - !3625 Backport !3624 "wakeup: Fix g_wakeup_acknowledge if signal comes in"
    to glib-2-78
  - !3644 Backport !3633 "Use g_task_return in task threads" to glib-2-78
  - !3649 Backport !3648 "build: Fix -Dlibelf=disabled on Linux" to glib-2-78
  - !3659 Backport !3650 "gfileutils: Add a missing ftruncate() call when
    writing files" to glib-2-78

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../glib-2.0/{glib-2.0_2.78.0.bb => glib-2.0_2.78.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.78.0.bb => glib-2.0_2.78.1.bb} (96%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb
similarity index 96%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb
index 500e4e873e..a490262112 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb
@@ -19,7 +19,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[sha256sum] = "44eaab8b720877ce303c5540b657b126f12dc94972d9880b52959f43fb537b30"
+SRC_URI[sha256sum] = "915bc3d0f8507d650ead3832e2f8fb670fce59aac4d7754a7dab6f1e6fed78b2"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.34.1


