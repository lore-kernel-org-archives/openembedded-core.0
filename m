Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5471C54E71
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:12 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1241.1710522012037922254
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cWXpJZsh;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=s4IRb+1J;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018e430e8ef9-21ba271a-5f53-482a-9320-612ccf36a552-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522011;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xu0BXGu/R9+9IbMewR7yZwkYqPVG4+ouVBq8DfJ4wYo=;
	b=cWXpJZsh/l5Zz7uhW4wNC7QChiIb6enSzjJyxWcCOJ5MOo5Ebs4RnFgDK4jCNYmO
	8TL3GJhOjVoqaXisxTeZG6nXgfXglSgX3ruXNJaivx+Q/JvPwBdNfETwiOpOguhQJNR
	mrwj/J583Ko3Q1QJvE8jTMMCJ+VeGH+F3+CwoOYY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522011;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xu0BXGu/R9+9IbMewR7yZwkYqPVG4+ouVBq8DfJ4wYo=;
	b=s4IRb+1JPKwpSCdFmdWAvELndRpl6hvtxU0KhFRDAR4GOTZvxC5/Mh6I2ckndQ2h
	z3T6o8mZZs1uoaFpPpv8ep3GYaMvgWL5go0u9HAHifxvpzNEy69ZgN8rhqFJutek6QT
	Bj32+EnzgotZry4FmzYJGSABx7VwtG8knClAVrCQ=
Content-Type: multipart/mixed; boundary="===============1928431110558162622=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygobject: upgrading to 3.48.1 SUCCEEDED
Message-ID: <0101018e430e8ef9-21ba271a-5f53-482a-9320-612ccf36a552-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197169

--===============1928431110558162622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pygobject* to *3.48.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pygobject-upgrade-3.46.0-3.48.1.patch
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
From 54333a9e52bfbe46cc765ba573316f4633a7b947 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 08:51:51 +0000
Subject: [PATCH] python3-pygobject: upgrade 3.46.0 -> 3.48.1

---
 ...{python3-pygobject_3.46.0.bb => python3-pygobject_3.48.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.46.0.bb => python3-pygobject_3.48.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.46.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.48.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pygobject_3.46.0.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.48.1.bb
index 73a393051a..4754e41c04 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.46.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.48.1.bb
@@ -19,7 +19,7 @@ DEPENDS += "python3 glib-2.0"
 SRCNAME="pygobject"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "426008b2dad548c9af1c7b03b59df0440fde5c33f38fb5406b103a43d653cafc"
+SRC_URI[sha256sum] = "3a0a2c0c0f25931b5840649c54834b9e58a63148d37fa9f6308887b7027e15c2"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.42.0


--===============1928431110558162622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pygobject: PV changed from "3.46.0" to "3.48.1"
packages/core2-64-poky-linux/python3-pygobject: PKGV changed from 3.46.0 [default] to 3.48.1 [default]
packages/core2-64-poky-linux/python3-pygobject: SRC_URI changed from "http://ftp.gnome.org/pub/GNOME/sources/pygobject/3.46/pygobject-3.46.0.tar.xz" to "http://ftp.gnome.org/pub/GNOME/sources/pygobject/3.48/pygobject-3.48.1.tar.xz"
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGSIZE changed from 1359536 to 1378008 (+1%)
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-dbg: PV changed from "3.46.0" to "3.48.1"
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGV changed from 3.46.0 [default] to 3.48.1 [default]
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-dev: PV changed from "3.46.0" to "3.48.1"
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-dev: PKGV changed from 3.46.0 [default] to 3.48.1 [default]
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-doc: PV changed from "3.46.0" to "3.48.1"
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-doc: PKGV changed from 3.46.0 [default] to 3.48.1 [default]
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-locale: PV changed from "3.46.0" to "3.48.1"
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-locale: PKGV changed from 3.46.0 [default] to 3.48.1 [default]
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-src: PKGSIZE changed from 925592 to 939776 (+2%)
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-src: FILELIST: removed "/usr/src/debug/python3-pygobject/3.46.0/gi/pygi-hashtable.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-hashtable.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-enum-marshal.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-enum-marshal.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-value.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygspawn.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-value.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygobject.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygspawn.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-array.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygoptiongroup.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-array.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygoptiongroup.c /usr/src/debug/python3-pygobject/3.46.0/gi/pyginterface.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-repository.c /usr/src/debug/python3-pygobject/3.46
 .0/gi/pygi-repository.h /usr/src/debug/python3-pygobject/3.46.0/gi/pyginterface.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-list.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-list.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-foreign-cairo.c /usr/src/debug/python3-pygobject/3.46.0/gi/gimodule.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygflags.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygpointer.c /usr/src/debug/python3-pygobject/3.46.0/gi/gimodule.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygpointer.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygflags.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-cache.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-argument.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygoptioncontext.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-cache.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-argument.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygoptioncontext.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-foreign.c /
 usr/src/debug/python3-pygobject/3.46.0/gi/pygi-invoke-state-struct.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-foreign.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-struct-marshal.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-property.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-property.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-struct-marshal.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygenum.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygenum.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-info.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-info.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-closure.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-foreign-api.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-closure.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-invoke.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-struct.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-invoke.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-struct.h 
 /usr/src/debug/python3-pygobject/3.46.0/gi/pygobject-object.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygobject-object.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-resulttuple.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-resulttuple.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-boxed.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-boxed.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-type.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-type.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-ccallback.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-basictype.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-ccallback.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-basictype.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-object.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-object.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygboxed.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-util.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-error.c /usr/src
 /debug/python3-pygobject/3.46.0/gi/pygboxed.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-util.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-error.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygparamspec.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygparamspec.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-source.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-source.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-signal-closure.h /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-signal-closure.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-marshal-cleanup.c /usr/src/debug/python3-pygobject/3.46.0/gi/pygi-marshal-cleanup.h", added "/usr/src/debug/python3-pygobject/3.48.1/gi/pygi-hashtable.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-hashtable.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-enum-marshal.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-enum-marshal.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-value.c /usr/src/debug/python3-pygobject/3.48
 .1/gi/pygspawn.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-value.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygobject.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygspawn.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-array.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygoptiongroup.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-array.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygoptiongroup.c /usr/src/debug/python3-pygobject/3.48.1/gi/pyginterface.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-repository.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-repository.h /usr/src/debug/python3-pygobject/3.48.1/gi/pyginterface.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-list.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-list.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-foreign-cairo.c /usr/src/debug/python3-pygobject/3.48.1/gi/gimodule.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygflags.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygpointer.c /usr/sr
 c/debug/python3-pygobject/3.48.1/gi/pygpointer.h /usr/src/debug/python3-pygobject/3.48.1/gi/gimodule.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygflags.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-cache.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-argument.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygoptioncontext.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-cache.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-argument.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygoptioncontext.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-foreign.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-invoke-state-struct.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-foreign.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-struct-marshal.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-property.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-property.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-struct-marshal.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygenum.c
  /usr/src/debug/python3-pygobject/3.48.1/gi/pygenum.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-info.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-info.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-closure.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-foreign-api.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-closure.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-invoke.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-struct.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-invoke.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-struct.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygobject-object.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygobject-object.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-resulttuple.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-resulttuple.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-boxed.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-boxed.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-type.h /usr/src/deb
 ug/python3-pygobject/3.48.1/gi/pygi-type.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-ccallback.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-basictype.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-ccallback.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-basictype.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-object.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-fundamental.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-object.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-fundamental.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygboxed.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-util.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-error.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygboxed.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-util.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-error.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygparamspec.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygparamspec.h /usr/src/debug/python3-pygobje
 ct/3.48.1/gi/pygi-source.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-source.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-signal-closure.h /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-signal-closure.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-marshal-cleanup.c /usr/src/debug/python3-pygobject/3.48.1/gi/pygi-marshal-cleanup.h"
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-src: PV changed from "3.46.0" to "3.48.1"
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-src: PKGV changed from 3.46.0 [default] to 3.48.1 [default]
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-staticdev: PV changed from "3.46.0" to "3.48.1"
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject-staticdev: PKGV changed from 3.46.0 [default] to 3.48.1 [default]
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject: PKGSIZE changed from 1066816 to 1077887 (+1%)
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject: FILELIST: removed "/usr/lib/python3.12/site-packages/PyGObject-3.46.0.egg-info", added "/usr/lib/python3.12/site-packages/PyGObject-3.48.1.egg-info"
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject: PV changed from "3.46.0" to "3.48.1"
packages/core2-64-poky-linux/python3-pygobject/python3-pygobject: PKGV changed from 3.46.0 [default] to 3.48.1 [default]
Changes to packages/core2-64-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.12/site-packages/PyGObject-3.46.0.egg-info moved to /usr/lib/python3.12/site-packages/PyGObject-3.48.1.egg-info

--===============1928431110558162622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pygobject/python3-pygobject: FILELIST: removed "/usr/lib/python3.12/site-packages/PyGObject-3.46.0.egg-info", added "/usr/lib/python3.12/site-packages/PyGObject-3.48.1.egg-info"
Changes to packages/core2-64-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.12/site-packages/PyGObject-3.46.0.egg-info moved to /usr/lib/python3.12/site-packages/PyGObject-3.48.1.egg-info

--===============1928431110558162622==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pygobject-upgrade-3.46.0-3.48.1.patch"

RnJvbSA1NDMzM2E5ZTUyYmZiZTQ2Y2M3NjViYTU3MzMxNmY0NjMzYTdiOTQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMDg6NTE6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Z29iamVjdDogdXBncmFkZSAzLjQ2LjAgLT4gMy40OC4xCgotLS0KIC4uLntweXRo
b24zLXB5Z29iamVjdF8zLjQ2LjAuYmIgPT4gcHl0aG9uMy1weWdvYmplY3RfMy40OC4xLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHlnb2JqZWN0XzMuNDYu
MC5iYiA9PiBweXRob24zLXB5Z29iamVjdF8zLjQ4LjEuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Z29iamVjdF8zLjQ2LjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlnb2JqZWN0XzMuNDguMS5i
YgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHlnb2JqZWN0XzMuNDYuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Z29iamVjdF8zLjQ4LjEuYmIKaW5kZXggNzNhMzkz
MDUxYS4uNDc1NGU0MWMwNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXB5Z29iamVjdF8zLjQ2LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXB5Z29iamVjdF8zLjQ4LjEuYmIKQEAgLTE5LDcgKzE5LDcgQEAgREVQ
RU5EUyArPSAicHl0aG9uMyBnbGliLTIuMCIKIFNSQ05BTUU9InB5Z29iamVjdCIKIAogU1JDX1VS
SSA9ICJodHRwOi8vZnRwLmdub21lLm9yZy9wdWIvR05PTUUvc291cmNlcy8ke1NSQ05BTUV9LyR7
QGdub21lX3ZlcmRpcigiJHtQVn0iKX0vJHtTUkNOQU1FfS0ke1BWfS50YXIueHoiCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNDI2MDA4YjJkYWQ1NDhjOWFmMWM3YjAzYjU5ZGYwNDQwZmRlNWMzM2Yz
OGZiNTQwNmIxMDNhNDNkNjUzY2FmYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzYTBhMmMwYzBm
MjU5MzFiNTg0MDY0OWM1NDgzNGI5ZTU4YTYzMTQ4ZDM3ZmE5ZjYzMDg4ODdiNzAyN2UxNWMyIgog
CiBTID0gIiR7V09SS0RJUn0vJHtTUkNOQU1FfS0ke1BWfSIKIAotLSAKMi40Mi4wCgo=

--===============1928431110558162622==--

