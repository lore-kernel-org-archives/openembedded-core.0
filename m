Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B76C61DD4
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 05:57:52 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.418.1787896670907591387
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 22:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XxGTtj0g;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Zz1cuNg7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a046f2274f-e0a8e855-4fb9-4b91-af87-9cde02546766-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787896670;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WhrTq8p5F831/W7QiaITghh4pd556fcVo5MnpH9nH3w=;
	b=XxGTtj0grsGLsl6nTX7W336aiTz26cwn51NzQ9xXSQFKvmxcwWka7hqTnRe7IkN3
	Hz1QkaQfXf/pj0awe7X9LfInZaPX28je2SRO2T3SC8jMUNoa6+D9UNMQ+3YNsEc/Cuf
	i9KsIE7OD57GFcOmyYCWcyAjUlD2IpEwVDrhiVtA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787896670;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WhrTq8p5F831/W7QiaITghh4pd556fcVo5MnpH9nH3w=;
	b=Zz1cuNg71NYWPgC8Bon0PflZVngQlTucoWQq7lHKJcBAoEfdsQjuyzcibk60uWTm
	EVv9QuNIQZyax6M1q7TpJRkBBooFm7vX8KmSS1tmIlwAz0KNJ7oYHollpn8m3rJFuQI
	nnjHJnV6hhXbZLF5aYbR7FQ18ZRnQ5BzyLUXgYZg=
Content-Type: multipart/mixed; boundary="===============4048597963448224335=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygobject: upgrading to 3.58.0 SUCCEEDED
Message-ID: <010101a046f2274f-e0a8e855-4fb9-4b91-af87-9cde02546766-000000@us-west-2.amazonses.com>
Date: Fri, 28 Aug 2026 05:57:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.28-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 05:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244509

--===============4048597963448224335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pygobject* to *3.58.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pygobject-upgrade-3.56.3-3.58.0.patch
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
From a39ebc2ef1afcbef45197ee0ef442c6aa636a6c9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 28 Aug 2026 05:45:17 +0000
Subject: [PATCH] python3-pygobject: upgrade 3.56.3 -> 3.58.0

Source: NEWS

3.58.0 - 2026-08-27
* Stable release

3.57.1 - 2026-08-14
-------------------

* Add extra checks around construction of object destroy notifier :mr:`560`
* `GLib.Pid` should be a number with a special `close` method :mr:`556`
* Use `PathLike` objects for `Gtk.Template` :mr:`555`
* Fast marshalling of `bytearray` to `GBytes` :mr:`558`
* Prevent crashes where `GValue` is `NULL` :mr:`559`

3.57.0 - 2026-07-20
-------------------

* doc: Update tutorial and examples :mr:`536` :mr:`537` :mr:`538`
* Fix potential buffer overflow errors where the C API exposes `GArray`'s :mr:`540` :mr:`550`
* gio: Support creating `GFile` child with slash operator, similar to `pathlib.Path` :mr:`539`
* Refactor memory management for marshaller cache :mr:`490` :mr:`517`
* Add missing msg argument to asyncio cancel() :mr:`541`
* Fix deprecation warning for register_object :mr:`542`
* Find libraries automatically on Windows :mr:`415`
* Fix crash when `user_data` is defined before callback :mr:`554`
* Avoid extraneous deprecation warnings :mr:`545`
* Support generic annotations on `Async` :mr:`547`
* fix: Simplify string prefix handling :mr:`548`
* doc: Use gobject-linter for linting GObject code :mr:`543` :mr:`551` :mr:`552`
---
 ...{python3-pygobject_3.56.3.bb => python3-pygobject_3.58.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.56.3.bb => python3-pygobject_3.58.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb b/meta/recipes-devtools/python/python3-pygobject_3.58.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pygobject_3.56.3.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.58.0.bb
index e246a2d451..7f5bec8f70 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.58.0.bb
@@ -19,7 +19,7 @@ DEPENDS += "python3 glib-2.0"
 GNOME_COMPRESS_TYPE = "gz"
 GNOMEBN = "pygobject"
 
-SRC_URI[archive.sha256sum] = "12760e4a0e3d04b6eb95e06f7a27e362c826d567ea613373a92c003b6c70d2d6"
+SRC_URI[archive.sha256sum] = "45068697de3ffe46840ca369705f23118b34db4f7deb63f6eff079a6734ddcca"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
-- 
2.47.1


--===============4048597963448224335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: FILELIST: directory renamed /usr/lib/python3.14/site-packages/PyGObject-3.56.3.dist-info -> /usr/lib/python3.14/site-packages/PyGObject-3.58.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.14/site-packages/PyGObject-3.56.3.dist-info moved to /usr/lib/python3.14/site-packages/PyGObject-3.58.0.dist-info
Changes to packages/x86_64-linux/python3-build-native (sysroot):
  /usr/lib/python3.14/site-packages/build-1.6.0.dist-info moved to /usr/lib/python3.14/site-packages/build-1.5.1.dist-info

--===============4048597963448224335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pygobject-changelog.txt"

Changelog for python3-pygobject: 3.56.3 -> 3.58.0
Source: NEWS

3.58.0 - 2026-08-27
* Stable release

3.57.1 - 2026-08-14
-------------------

* Add extra checks around construction of object destroy notifier :mr:`560`
* `GLib.Pid` should be a number with a special `close` method :mr:`556`
* Use `PathLike` objects for `Gtk.Template` :mr:`555`
* Fast marshalling of `bytearray` to `GBytes` :mr:`558`
* Prevent crashes where `GValue` is `NULL` :mr:`559`

3.57.0 - 2026-07-20
-------------------

* doc: Update tutorial and examples :mr:`536` :mr:`537` :mr:`538`
* Fix potential buffer overflow errors where the C API exposes `GArray`'s :mr:`540` :mr:`550`
* gio: Support creating `GFile` child with slash operator, similar to `pathlib.Path` :mr:`539`
* Refactor memory management for marshaller cache :mr:`490` :mr:`517`
* Add missing msg argument to asyncio cancel() :mr:`541`
* Fix deprecation warning for register_object :mr:`542`
* Find libraries automatically on Windows :mr:`415`
* Fix crash when `user_data` is defined before callback :mr:`554`
* Avoid extraneous deprecation warnings :mr:`545`
* Support generic annotations on `Async` :mr:`547`
* fix: Simplify string prefix handling :mr:`548`
* doc: Use gobject-linter for linting GObject code :mr:`543` :mr:`551` :mr:`552`

--===============4048597963448224335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pygobject: SRC_URI changed from "https://download.gnome.org/sources//pygobject/3.56/pygobject-3.56.3.tar.gz;name=archive" to "https://download.gnome.org/sources//pygobject/3.58/pygobject-3.58.0.tar.gz;name=archive"
packages/x86-64-v3-poky-linux/python3-pygobject: PV changed from "3.56.3" to "3.58.0"
packages/x86-64-v3-poky-linux/python3-pygobject: PKGV changed from 3.56.3 [default] to 3.58.0 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGSIZE changed from 1541344 to 1498784 (-3%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PV changed from "3.56.3" to "3.58.0"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGV changed from 3.56.3 [default] to 3.58.0 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: PKGSIZE changed from 30048 to 29900 (-0%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: PV changed from "3.56.3" to "3.58.0"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: PKGV changed from 3.56.3 [default] to 3.58.0 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-doc: PV changed from "3.56.3" to "3.58.0"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-doc: PKGV changed from 3.56.3 [default] to 3.58.0 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-locale: PV changed from "3.56.3" to "3.58.0"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-locale: PKGV changed from 3.56.3 [default] to 3.58.0 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PKGSIZE changed from 876209 to 852746 (-3%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PV changed from "3.56.3" to "3.58.0"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PKGV changed from 3.56.3 [default] to 3.58.0 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: FILELIST: removed "/usr/src/debug/python3-pygobject/3.56.3/gi/pygi-cache-object.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-marshal-cleanup.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-util.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-marshal-cleanup.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-util.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-boxed.h /usr/src/debug/python3-pygobject/3.56.3/gi/pyginterface.h /usr/src/debug/python3-pygobject/3.56.3/gi/pyginterface.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-boxed.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-cache-list.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-argument.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-argument.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-cache-closure.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygobject-types.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-cache-interface.c /usr/
 src/debug/python3-pygobject/3.56.3/gi/pygi-capi.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-ccallback.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-ccallback.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-capi.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-type.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-value.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-invoke.c /usr/src/debug/python3-pygobject/3.56.3/gi/gimodule.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-type.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-invoke.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-value.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-foreign-api.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-cache-hashtable.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygboxed.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-source.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-source.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygboxed.h /usr/src/debug/python3-pygobject
 /3.56.3/gi/pygobject-object.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-foreign.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygobject-object.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-foreign.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-resulttuple.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-struct.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-cache-basic.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-cache.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-struct.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-resulttuple.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-cache.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-signal-closure.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-foreign-types.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-signal-closure.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygobject-class.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-basictype.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-cache-enum.c /
 usr/src/debug/python3-pygobject/3.56.3/gi/pygi-basictype.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygflags.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-closure.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygflags.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-closure.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-cache-array.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-fundamental.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-fundamental.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-cache-private.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-info.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-info.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygenum.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygenum.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-cache-error.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-cache-struct.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygpointer.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygpointer.h /usr/src/de
 bug/python3-pygobject/3.56.3/gi/pygobject-props.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-invoke-state-struct.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygobject-props.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-error.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-foreign-cairo.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-property.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-error.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-property.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygobject.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygspawn.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygspawn.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-repository.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-async.c /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-repository.h /usr/src/debug/python3-pygobject/3.56.3/gi/pygi-async.h", added "/usr/src/debug/python3-pygobject/3.58.0/gi/pygi-cache-object.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-marsh
 al-cleanup.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-util.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-marshal-cleanup.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-util.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-boxed.h /usr/src/debug/python3-pygobject/3.58.0/gi/pyginterface.h /usr/src/debug/python3-pygobject/3.58.0/gi/pyginterface.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-boxed.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-cache-list.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-argument.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-argument.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-cache-closure.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygobject-types.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-cache-interface.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-capi.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-ccallback.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-ccallback.h /usr/src/debug/python3-pygobject/3.
 58.0/gi/pygi-capi.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-type.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-value.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-invoke.c /usr/src/debug/python3-pygobject/3.58.0/gi/gimodule.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-type.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-invoke.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-value.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-foreign-api.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-cache-hashtable.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygboxed.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-source.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-source.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygboxed.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygobject-object.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-foreign.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygobject-object.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-foreign
 .c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-resulttuple.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-struct.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-cache-basic.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-cache.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-struct.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-resulttuple.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-cache.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-signal-closure.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-foreign-types.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-signal-closure.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygobject-class.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-basictype.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-cache-enum.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-basictype.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygflags.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-closure.h /usr/src/debug/python3-pygobject/3
 .58.0/gi/pygflags.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-closure.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-cache-array.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-fundamental.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-fundamental.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-cache-private.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-info.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-info.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygenum.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygenum.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-cache-error.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-cache-struct.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygpointer.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygpointer.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygobject-props.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-invoke-state-struct.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygobject-props.h /usr/src/debug/python3-p
 ygobject/3.58.0/gi/pygi-error.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-foreign-cairo.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-property.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-error.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-property.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygobject.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-repository.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-async.c /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-repository.h /usr/src/debug/python3-pygobject/3.58.0/gi/pygi-async.h"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-staticdev: PV changed from "3.56.3" to "3.58.0"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-staticdev: PKGV changed from 3.56.3 [default] to 3.58.0 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PKGSIZE changed from 1149683 to 1149022 (-0%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PV changed from "3.56.3" to "3.58.0"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PKGV changed from 3.56.3 [default] to 3.58.0 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: FILELIST: directory renamed /usr/lib/python3.14/site-packages/PyGObject-3.56.3.dist-info -> /usr/lib/python3.14/site-packages/PyGObject-3.58.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.14/site-packages/PyGObject-3.56.3.dist-info moved to /usr/lib/python3.14/site-packages/PyGObject-3.58.0.dist-info
Changes to packages/x86_64-linux/python3-build-native (sysroot):
  /usr/lib/python3.14/site-packages/build-1.6.0.dist-info moved to /usr/lib/python3.14/site-packages/build-1.5.1.dist-info

--===============4048597963448224335==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pygobject-upgrade-3.56.3-3.58.0.patch"

RnJvbSBhMzllYmMyZWYxYWZjYmVmNDUxOTdlZTBlZjQ0MmM2YWE2MzZhNmM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjggQXVnIDIwMjYgMDU6NDU6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Z29iamVjdDogdXBncmFkZSAzLjU2LjMgLT4gMy41OC4wCgpTb3VyY2U6IE5FV1MK
CjMuNTguMCAtIDIwMjYtMDgtMjcKKiBTdGFibGUgcmVsZWFzZQoKMy41Ny4xIC0gMjAyNi0wOC0x
NAotLS0tLS0tLS0tLS0tLS0tLS0tCgoqIEFkZCBleHRyYSBjaGVja3MgYXJvdW5kIGNvbnN0cnVj
dGlvbiBvZiBvYmplY3QgZGVzdHJveSBub3RpZmllciA6bXI6YDU2MGAKKiBgR0xpYi5QaWRgIHNo
b3VsZCBiZSBhIG51bWJlciB3aXRoIGEgc3BlY2lhbCBgY2xvc2VgIG1ldGhvZCA6bXI6YDU1NmAK
KiBVc2UgYFBhdGhMaWtlYCBvYmplY3RzIGZvciBgR3RrLlRlbXBsYXRlYCA6bXI6YDU1NWAKKiBG
YXN0IG1hcnNoYWxsaW5nIG9mIGBieXRlYXJyYXlgIHRvIGBHQnl0ZXNgIDptcjpgNTU4YAoqIFBy
ZXZlbnQgY3Jhc2hlcyB3aGVyZSBgR1ZhbHVlYCBpcyBgTlVMTGAgOm1yOmA1NTlgCgozLjU3LjAg
LSAyMDI2LTA3LTIwCi0tLS0tLS0tLS0tLS0tLS0tLS0KCiogZG9jOiBVcGRhdGUgdHV0b3JpYWwg
YW5kIGV4YW1wbGVzIDptcjpgNTM2YCA6bXI6YDUzN2AgOm1yOmA1MzhgCiogRml4IHBvdGVudGlh
bCBidWZmZXIgb3ZlcmZsb3cgZXJyb3JzIHdoZXJlIHRoZSBDIEFQSSBleHBvc2VzIGBHQXJyYXlg
J3MgOm1yOmA1NDBgIDptcjpgNTUwYAoqIGdpbzogU3VwcG9ydCBjcmVhdGluZyBgR0ZpbGVgIGNo
aWxkIHdpdGggc2xhc2ggb3BlcmF0b3IsIHNpbWlsYXIgdG8gYHBhdGhsaWIuUGF0aGAgOm1yOmA1
MzlgCiogUmVmYWN0b3IgbWVtb3J5IG1hbmFnZW1lbnQgZm9yIG1hcnNoYWxsZXIgY2FjaGUgOm1y
OmA0OTBgIDptcjpgNTE3YAoqIEFkZCBtaXNzaW5nIG1zZyBhcmd1bWVudCB0byBhc3luY2lvIGNh
bmNlbCgpIDptcjpgNTQxYAoqIEZpeCBkZXByZWNhdGlvbiB3YXJuaW5nIGZvciByZWdpc3Rlcl9v
YmplY3QgOm1yOmA1NDJgCiogRmluZCBsaWJyYXJpZXMgYXV0b21hdGljYWxseSBvbiBXaW5kb3dz
IDptcjpgNDE1YAoqIEZpeCBjcmFzaCB3aGVuIGB1c2VyX2RhdGFgIGlzIGRlZmluZWQgYmVmb3Jl
IGNhbGxiYWNrIDptcjpgNTU0YAoqIEF2b2lkIGV4dHJhbmVvdXMgZGVwcmVjYXRpb24gd2Fybmlu
Z3MgOm1yOmA1NDVgCiogU3VwcG9ydCBnZW5lcmljIGFubm90YXRpb25zIG9uIGBBc3luY2AgOm1y
OmA1NDdgCiogZml4OiBTaW1wbGlmeSBzdHJpbmcgcHJlZml4IGhhbmRsaW5nIDptcjpgNTQ4YAoq
IGRvYzogVXNlIGdvYmplY3QtbGludGVyIGZvciBsaW50aW5nIEdPYmplY3QgY29kZSA6bXI6YDU0
M2AgOm1yOmA1NTFgIDptcjpgNTUyYAotLS0KIC4uLntweXRob24zLXB5Z29iamVjdF8zLjU2LjMu
YmIgPT4gcHl0aG9uMy1weWdvYmplY3RfMy41OC4wLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24ve3B5dGhvbjMtcHlnb2JqZWN0XzMuNTYuMy5iYiA9PiBweXRob24zLXB5Z29i
amVjdF8zLjU4LjAuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXB5Z29iamVjdF8zLjU2LjMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcHlnb2JqZWN0XzMuNTguMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkz
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlnb2Jq
ZWN0XzMuNTYuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXB5Z29iamVjdF8zLjU4LjAuYmIKaW5kZXggZTI0NmEyZDQ1MS4uN2Y1YmVjOGY3MCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Z29iamVjdF8z
LjU2LjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Z29i
amVjdF8zLjU4LjAuYmIKQEAgLTE5LDcgKzE5LDcgQEAgREVQRU5EUyArPSAicHl0aG9uMyBnbGli
LTIuMCIKIEdOT01FX0NPTVBSRVNTX1RZUEUgPSAiZ3oiCiBHTk9NRUJOID0gInB5Z29iamVjdCIK
IAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiMTI3NjBlNGEwZTNkMDRiNmViOTVlMDZm
N2EyN2UzNjJjODI2ZDU2N2VhNjEzMzczYTkyYzAwM2I2YzcwZDJkNiIKK1NSQ19VUklbYXJjaGl2
ZS5zaGEyNTZzdW1dID0gIjQ1MDY4Njk3ZGUzZmZlNDY4NDBjYTM2OTcwNWYyMzExOGIzNGRiNGY3
ZGViNjNmNmVmZjA3OWE2NzM0ZGRjY2EiCiAKIFMgPSAiJHtVTlBBQ0tESVJ9LyR7R05PTUVCTn0t
JHtQVn0iCiAKLS0gCjIuNDcuMQoK

--===============4048597963448224335==--

