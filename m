Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93FCEEFCBDF
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:41:58 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28796.1773582114739051237
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=W3S0k2ou;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ga2ljrtS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019cf1bb68c8-e613e00f-35a1-48ec-b09d-525724ddd21e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582117;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=opeBcPP7LciItRrdEgaEDiW7gDEBIYV43Xhvkm9JNaU=;
	b=W3S0k2ouOCpR1NA3Woqy1O6JiW+VwI9/o7sSbC1UYBG5zJwj8pHc5xpf4FShjUzs
	nc3PMURDhUgWama2REyJRo01JTHEeSTuNwb58y6E4hs/zjG6GjFla34Qbdz3zIinM19
	V7l4J7OgxqObD8mNunE/d6+dlIqEPMR9wcicTKO8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582117;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=opeBcPP7LciItRrdEgaEDiW7gDEBIYV43Xhvkm9JNaU=;
	b=ga2ljrtSoo8MaCOxGk1v+KQwKxgCPv5HV9A/4aFVTmLF3Jmibm03Uzqj6SICivnV
	5iO1K4fa7Ef5xda7PcGN2m+wRE3lvs4R+cBxu0tyRw51qpJIlfET41vuMN3YV6eyOmI
	Y4mY+mDAi0no2RbDsRIwE8gog3MR3phzfJZgqMYg=
Content-Type: multipart/mixed; boundary="===============6958914276235593339=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygobject: upgrading to 3.56.1 SUCCEEDED
Message-ID: <0101019cf1bb68c8-e613e00f-35a1-48ec-b09d-525724ddd21e-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:41:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233141

--===============6958914276235593339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pygobject* to *3.56.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pygobject-upgrade-3.54.5-3.56.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From be2703e61fa12f2e7e4cf76f414be7653deceb72 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 08:16:51 +0000
Subject: [PATCH] python3-pygobject: upgrade 3.54.5 -> 3.56.1

---
 .../python/python3-pygobject/semicolon.patch  | 31 -------------------
 ..._3.54.5.bb => python3-pygobject_3.56.1.bb} |  4 +--
 2 files changed, 1 insertion(+), 34 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pygobject/semicolon.patch
 rename meta/recipes-devtools/python/{python3-pygobject_3.54.5.bb => python3-pygobject_3.56.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pygobject/semicolon.patch b/meta/recipes-devtools/python/python3-pygobject/semicolon.patch
deleted file mode 100644
index 54828d7707..0000000000
--- a/meta/recipes-devtools/python/python3-pygobject/semicolon.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From d00ad09688e9dcc42020949e276741d3ae58c10d Mon Sep 17 00:00:00 2001
-From: Dan Yeaw <dan@yeaw.me>
-Date: Mon, 13 Oct 2025 21:45:22 -0400
-Subject: [PATCH] Fix syntax error for missing ;
-
-This fixes a compile error with older GCC, for example GCC 10 on Debian 11:
-
-  gi/pygi-resulttuple.c:337:1: error: label at end of compound statement
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- gi/pygi-resulttuple.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gi/pygi-resulttuple.c b/gi/pygi-resulttuple.c
-index 8b793e4d0..4d892e94d 100644
---- a/gi/pygi-resulttuple.c
-+++ b/gi/pygi-resulttuple.c
-@@ -335,7 +335,7 @@ resulttuple_dealloc (PyObject *self)
-     Py_TYPE (self)->tp_free (self);
- 
- done:
--    CPy_TRASHCAN_END (self)
-+    CPy_TRASHCAN_END (self);
- }
- #endif
- 
--- 
-GitLab
-
diff --git a/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb b/meta/recipes-devtools/python/python3-pygobject_3.56.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pygobject_3.54.5.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.56.1.bb
index 8eb0f9fa6b..c17df1a9d1 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.56.1.bb
@@ -19,9 +19,7 @@ DEPENDS += "python3 glib-2.0"
 GNOME_COMPRESS_TYPE = "gz"
 GNOMEBN = "pygobject"
 
-SRC_URI += "file://semicolon.patch"
-
-SRC_URI[archive.sha256sum] = "b6656f6348f5245606cf15ea48c384c7f05156c75ead206c1b246c80a22fb585"
+SRC_URI[archive.sha256sum] = "2ec1cc8c55c7ffeebb97e58a9bba7aa1e74611f1173628084685446804a8881a"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
-- 
2.47.1


--===============6958914276235593339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pygobject: PV changed from "3.54.5" to "3.56.1"
packages/x86-64-v3-poky-linux/python3-pygobject: SRC_URI changed from "https://download.gnome.org/sources//pygobject/3.54/pygobject-3.54.5.tar.gz;name=archive file://semicolon.patch" to "https://download.gnome.org/sources//pygobject/3.56/pygobject-3.56.1.tar.gz;name=archive"
packages/x86-64-v3-poky-linux/python3-pygobject: PKGV changed from 3.54.5 [default] to 3.56.1 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PV changed from "3.54.5" to "3.56.1"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGSIZE changed from 1540904 to 1493512 (-3%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGV changed from 3.54.5 [default] to 3.56.1 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: PV changed from "3.54.5" to "3.56.1"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: PKGSIZE changed from 28308 to 30048 (+6%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: PKGV changed from 3.54.5 [default] to 3.56.1 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: FILELIST: added "/usr/include/pygobject-3.0/pygobject-types.h"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-doc: PV changed from "3.54.5" to "3.56.1"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-doc: PKGV changed from 3.54.5 [default] to 3.56.1 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-locale: PV changed from "3.54.5" to "3.56.1"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-locale: PKGV changed from 3.54.5 [default] to 3.56.1 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PV changed from "3.54.5" to "3.56.1"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PKGSIZE changed from 927182 to 872743 (-6%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PKGV changed from 3.54.5 [default] to 3.56.1 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: FILELIST: removed "/usr/src/debug/python3-pygobject/3.54.5/gi/pygi-foreign-cairo.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-hashtable.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-hashtable.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-error.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-closure.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygoptiongroup.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-closure.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-error.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygoptiongroup.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-marshal-cleanup.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-marshal-cleanup.h /usr/src/debug/python3-pygobject/3.54.5/gi/pyginterface.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-boxed.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-boxed.h /usr/src/debug/python3-pygobject/3.54.5/gi/pyginterface.h /usr/src/debug/p
 ython3-pygobject/3.54.5/gi/pygi-foreign-api.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-repository.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygflags.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-ccallback.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-repository.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-ccallback.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygflags.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-struct-marshal.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-struct-marshal.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygenum.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygenum.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygspawn.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygspawn.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-fundamental.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-cache.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-fundamental.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-cache.c /usr/src/debug/python
 3-pygobject/3.54.5/gi/pygi-invoke-state-struct.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygobject.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-foreign.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-array.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-foreign.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-array.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-object.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-object.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-list.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-list.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-value.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-argument.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-value.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-argument.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-enum-marshal.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-enum-marshal.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygpointer.c /usr/src/debug/python3-pygobj
 ect/3.54.5/gi/pygi-basictype.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-basictype.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygpointer.h /usr/src/debug/python3-pygobject/3.54.5/gi/gimodule.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-source.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-util.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-type.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-util.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-source.c /usr/src/debug/python3-pygobject/3.54.5/gi/gimodule.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-type.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-resulttuple.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygoptioncontext.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-resulttuple.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygoptioncontext.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-async.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-info.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-a
 sync.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-info.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygboxed.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygboxed.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-signal-closure.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-signal-closure.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-invoke.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-struct.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygobject-object.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-invoke.c /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-struct.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygobject-object.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-property.h /usr/src/debug/python3-pygobject/3.54.5/gi/pygi-property.c", added "/usr/src/debug/python3-pygobject/3.56.1/gi/pygi-foreign-cairo.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-cache-private.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-error.c /usr/src/debug/python3-pygobject/3
 .56.1/gi/pygi-closure.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-closure.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-error.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-cache-basic.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-marshal-cleanup.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-marshal-cleanup.h /usr/src/debug/python3-pygobject/3.56.1/gi/pyginterface.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-boxed.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-boxed.h /usr/src/debug/python3-pygobject/3.56.1/gi/pyginterface.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-foreign-api.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-cache-closure.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-repository.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygflags.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-ccallback.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-repository.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-ccallback.h /usr/src/debug/
 python3-pygobject/3.56.1/gi/pygflags.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-cache-struct.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygenum.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-capi.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-capi.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygenum.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygspawn.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-cache-hashtable.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygspawn.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-fundamental.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-cache.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-fundamental.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-cache.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-invoke-state-struct.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygobject.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-cache-list.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-foreign.h /usr/src/debug/python3-py
 gobject/3.56.1/gi/pygi-foreign.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-cache-interface.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-value.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-argument.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-value.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-argument.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-cache-object.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygpointer.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-basictype.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-basictype.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygpointer.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygobject-class.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-foreign-types.h /usr/src/debug/python3-pygobject/3.56.1/gi/gimodule.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-source.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-util.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-type.c /usr/src/debug/python3-pygo
 bject/3.56.1/gi/pygi-util.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-source.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-type.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-resulttuple.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygobject-props.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-cache-array.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-cache-error.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygobject-props.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-resulttuple.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-async.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-info.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-async.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-info.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygboxed.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygboxed.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-signal-closure.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygobject-types.h /usr/src/debug/python3-pygobjec
 t/3.56.1/gi/pygi-signal-closure.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-invoke.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-struct.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygobject-object.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-invoke.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-struct.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygobject-object.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-property.h /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-property.c /usr/src/debug/python3-pygobject/3.56.1/gi/pygi-cache-enum.c"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-staticdev: PV changed from "3.54.5" to "3.56.1"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-staticdev: PKGV changed from 3.54.5 [default] to 3.56.1 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PV changed from "3.54.5" to "3.56.1"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PKGSIZE changed from 1136875 to 1129171 (-1%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PKGV changed from 3.54.5 [default] to 3.56.1 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: FILELIST: directory renamed /usr/lib/python3.14/site-packages/PyGObject-3.54.5.dist-info -> /usr/lib/python3.14/site-packages/PyGObject-3.56.1.dist-info, removed "/usr/lib/python3.14/site-packages/gi/__pycache__/_option.cpython-314.pyc /usr/lib/python3.14/site-packages/pygtkcompat/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/pygtkcompat/pygtkcompat.py /usr/lib/python3.14/site-packages/gi/_option.py /usr/lib/python3.14/site-packages/pygtkcompat/__pycache__/pygtkcompat.cpython-314.pyc /usr/lib/python3.14/site-packages/gi/__pycache__/pygtkcompat.cpython-314.pyc /usr/lib/python3.14/site-packages/gi/pygtkcompat.py /usr/lib/python3.14/site-packages/pygtkcompat/__init__.py", added "/usr/lib/python3.14/site-packages/gi/overrides/__pycache__/GLibUnix.cpython-314.pyc /usr/lib/python3.14/site-packages/gi/overrides/GLibUnix.py"
Changes to packages/x86-64-v3-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.14/site-packages/PyGObject-3.54.5.dist-info moved to /usr/lib/python3.14/site-packages/PyGObject-3.56.1.dist-info
  /usr/include/pygobject-3.0/pygobject-types.h was added
  /usr/lib/python3.14/site-packages/gi/overrides/GLibUnix.py was added
  /usr/lib/python3.14/site-packages/gi/overrides/__pycache__/GLibUnix.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/gi/_option.py was removed
  /usr/lib/python3.14/site-packages/gi/__pycache__/_option.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/gi/__pycache__/pygtkcompat.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/gi/pygtkcompat.py was removed
  /usr/lib/python3.14/site-packages/pygtkcompat was removed
  /usr/lib/python3.14/site-packages/pygtkcompat/__init__.py was removed
  /usr/lib/python3.14/site-packages/pygtkcompat/__pycache__ was removed
  /usr/lib/python3.14/site-packages/pygtkcompat/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pygtkcompat/__pycache__/pygtkcompat.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pygtkcompat/pygtkcompat.py was removed

--===============6958914276235593339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: FILELIST: added "/usr/include/pygobject-3.0/pygobject-types.h"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: FILELIST: directory renamed /usr/lib/python3.14/site-packages/PyGObject-3.54.5.dist-info -> /usr/lib/python3.14/site-packages/PyGObject-3.56.1.dist-info, removed "/usr/lib/python3.14/site-packages/gi/__pycache__/_option.cpython-314.pyc /usr/lib/python3.14/site-packages/pygtkcompat/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/gi/_option.py /usr/lib/python3.14/site-packages/gi/__pycache__/pygtkcompat.cpython-314.pyc /usr/lib/python3.14/site-packages/pygtkcompat/__pycache__/pygtkcompat.cpython-314.pyc /usr/lib/python3.14/site-packages/gi/pygtkcompat.py /usr/lib/python3.14/site-packages/pygtkcompat/pygtkcompat.py /usr/lib/python3.14/site-packages/pygtkcompat/__init__.py", added "/usr/lib/python3.14/site-packages/gi/overrides/GLibUnix.py /usr/lib/python3.14/site-packages/gi/overrides/__pycache__/GLibUnix.cpython-314.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.14/site-packages/PyGObject-3.54.5.dist-info moved to /usr/lib/python3.14/site-packages/PyGObject-3.56.1.dist-info
  /usr/include/pygobject-3.0/pygobject-types.h was added
  /usr/lib/python3.14/site-packages/gi/overrides/GLibUnix.py was added
  /usr/lib/python3.14/site-packages/gi/overrides/__pycache__/GLibUnix.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/gi/_option.py was removed
  /usr/lib/python3.14/site-packages/gi/__pycache__/_option.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/gi/__pycache__/pygtkcompat.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/gi/pygtkcompat.py was removed
  /usr/lib/python3.14/site-packages/pygtkcompat was removed
  /usr/lib/python3.14/site-packages/pygtkcompat/__init__.py was removed
  /usr/lib/python3.14/site-packages/pygtkcompat/__pycache__ was removed
  /usr/lib/python3.14/site-packages/pygtkcompat/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pygtkcompat/__pycache__/pygtkcompat.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pygtkcompat/pygtkcompat.py was removed

--===============6958914276235593339==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pygobject-upgrade-3.54.5-3.56.1.patch"

RnJvbSBiZTI3MDNlNjFmYTEyZjJlN2U0Y2Y3NmY0MTRiZTc2NTNkZWNlYjcyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMDg6MTY6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Z29iamVjdDogdXBncmFkZSAzLjU0LjUgLT4gMy41Ni4xCgotLS0KIC4uLi9weXRo
b24vcHl0aG9uMy1weWdvYmplY3Qvc2VtaWNvbG9uLnBhdGNoICB8IDMxIC0tLS0tLS0tLS0tLS0t
LS0tLS0KIC4uLl8zLjU0LjUuYmIgPT4gcHl0aG9uMy1weWdvYmplY3RfMy41Ni4xLmJifSB8ICA0
ICstLQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMzQgZGVsZXRpb25zKC0pCiBk
ZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5
Z29iamVjdC9zZW1pY29sb24ucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3tweXRob24zLXB5Z29iamVjdF8zLjU0LjUuYmIgPT4gcHl0aG9uMy1weWdvYmplY3RfMy41
Ni4xLmJifSAoOTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1weWdvYmplY3Qvc2VtaWNvbG9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXB5Z29iamVjdC9zZW1pY29sb24ucGF0Y2gKZGVsZXRlZCBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDU0ODI4ZDc3MDcuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Z29iamVjdC9zZW1pY29sb24ucGF0Y2gKKysrIC9k
ZXYvbnVsbApAQCAtMSwzMSArMCwwIEBACi1Gcm9tIGQwMGFkMDk2ODhlOWRjYzQyMDIwOTQ5ZTI3
Njc0MWQzYWU1OGMxMGQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBEYW4gWWVhdyA8
ZGFuQHllYXcubWU+Ci1EYXRlOiBNb24sIDEzIE9jdCAyMDI1IDIxOjQ1OjIyIC0wNDAwCi1TdWJq
ZWN0OiBbUEFUQ0hdIEZpeCBzeW50YXggZXJyb3IgZm9yIG1pc3NpbmcgOwotCi1UaGlzIGZpeGVz
IGEgY29tcGlsZSBlcnJvciB3aXRoIG9sZGVyIEdDQywgZm9yIGV4YW1wbGUgR0NDIDEwIG9uIERl
YmlhbiAxMToKLQotICBnaS9weWdpLXJlc3VsdHR1cGxlLmM6MzM3OjE6IGVycm9yOiBsYWJlbCBh
dCBlbmQgb2YgY29tcG91bmQgc3RhdGVtZW50Ci0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQK
LVNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgotLS0tCi0g
Z2kvcHlnaS1yZXN1bHR0dXBsZS5jIHwgMiArLQotIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvZ2kvcHlnaS1yZXN1bHR0dXBsZS5j
IGIvZ2kvcHlnaS1yZXN1bHR0dXBsZS5jCi1pbmRleCA4Yjc5M2U0ZDAuLjRkODkyZTk0ZCAxMDA2
NDQKLS0tLSBhL2dpL3B5Z2ktcmVzdWx0dHVwbGUuYwotKysrIGIvZ2kvcHlnaS1yZXN1bHR0dXBs
ZS5jCi1AQCAtMzM1LDcgKzMzNSw3IEBAIHJlc3VsdHR1cGxlX2RlYWxsb2MgKFB5T2JqZWN0ICpz
ZWxmKQotICAgICBQeV9UWVBFIChzZWxmKS0+dHBfZnJlZSAoc2VsZik7Ci0gCi0gZG9uZToKLS0g
ICAgQ1B5X1RSQVNIQ0FOX0VORCAoc2VsZikKLSsgICAgQ1B5X1RSQVNIQ0FOX0VORCAoc2VsZik7
Ci0gfQotICNlbmRpZgotIAotLS0gCi1HaXRMYWIKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Z29iamVjdF8zLjU0LjUuYmIgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlnb2JqZWN0XzMuNTYuMS5iYgpzaW1pbGFyaXR5
IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcHlnb2JqZWN0XzMuNTQuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXB5Z29iamVjdF8zLjU2LjEuYmIKaW5kZXggOGViMGY5ZmE2Yi4uYzE3ZGYx
YTlkMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5
Z29iamVjdF8zLjU0LjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXB5Z29iamVjdF8zLjU2LjEuYmIKQEAgLTE5LDkgKzE5LDcgQEAgREVQRU5EUyArPSAicHl0
aG9uMyBnbGliLTIuMCIKIEdOT01FX0NPTVBSRVNTX1RZUEUgPSAiZ3oiCiBHTk9NRUJOID0gInB5
Z29iamVjdCIKIAotU1JDX1VSSSArPSAiZmlsZTovL3NlbWljb2xvbi5wYXRjaCIKLQotU1JDX1VS
SVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiYjY2NTZmNjM0OGY1MjQ1NjA2Y2YxNWVhNDhjMzg0Yzdm
MDUxNTZjNzVlYWQyMDZjMWIyNDZjODBhMjJmYjU4NSIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZz
dW1dID0gIjJlYzFjYzhjNTVjN2ZmZWViYjk3ZTU4YTliYmE3YWExZTc0NjExZjExNzM2MjgwODQ2
ODU0NDY4MDRhODg4MWEiCiAKIFMgPSAiJHtVTlBBQ0tESVJ9LyR7R05PTUVCTn0tJHtQVn0iCiAK
LS0gCjIuNDcuMQoK

--===============6958914276235593339==--

