Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B9E7CCF2E3
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 06:03:02 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28525.1792389776854618629
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2026 23:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=qCQrXUGi;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jhA4Q4RQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a152c182e3-68896e45-bef0-4d6c-8c82-7032eb0ccadf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792389776;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=w3DLBAzx/fWoMpmrD2WnpVucuUc751oA2OoIRmMuJPo=;
	b=qCQrXUGiFVz40Rt8Wyu+Aj5keozBTgK4hIcLMjlMOmrGY64nI8ncMiC9lKmKNB13
	u4aovWHFCEWH8FLIK46My37oPMQRHRFsW/2XWolo7nVefOpkaOibN+/ubJUP9udzm2C
	AACT0JBb3b/10Oz7vZ8pO3F/UgdTy0C9wCYGxrFI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792389776;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=w3DLBAzx/fWoMpmrD2WnpVucuUc751oA2OoIRmMuJPo=;
	b=jhA4Q4RQlVVc8k12tqhMrZsaAbwEoeBXCUdCrhi4p8i2uxRQL9o/CGSg94E5VYIe
	VAS7FjIJRXAStYfABTOJqoTZEZJeaIETU4MD541EmCYrsMhzl5ZAQzBSJ/wwgDOH6ik
	fmr9VJv/fiTZT+UdV8w3bqG84x1KW8E/XILmGhQE=
Content-Type: multipart/mixed; boundary="===============6692635372512901660=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Sumanth Gavini <sumanth.gavini@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] less: upgrading to 710 SUCCEEDED
Message-ID: <010101a152c182e3-68896e45-bef0-4d6c-8c82-7032eb0ccadf-000000@us-west-2.amazonses.com>
Date: Mon, 19 Oct 2026 06:02:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.19-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 06:03:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248126

--===============6692635372512901660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *less* to *710* has Succeeded.

Next steps:
    - apply the patch: git am 0001-less-upgrade-704-710.patch
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
From 3dbebea02d6f1b7ef8a15578d2b370f20567dcaf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 19 Oct 2026 05:48:03 +0000
Subject: [PATCH] less: upgrade 704 -> 710

======================================================================
Major changes between "less" versions 704 and 710
---
 meta/recipes-extended/less/{less_704.bb => less_710.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/less/{less_704.bb => less_710.bb} (94%)

diff --git a/meta/recipes-extended/less/less_704.bb b/meta/recipes-extended/less/less_710.bb
similarity index 94%
rename from meta/recipes-extended/less/less_704.bb
rename to meta/recipes-extended/less/less_710.bb
index dc841a9ae6..f3f5ebd6a1 100644
--- a/meta/recipes-extended/less/less_704.bb
+++ b/meta/recipes-extended/less/less_710.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "20a0b0a2bb2525fa53c7eee9beb854b4c9cf172eabb209af7020743547bfe9fb"
+SRC_URI[sha256sum] = "d1008fb78dcae1323ddab664bcb352a61f022b1b131bd8018548e021d975ec7a"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.47.1


--===============6692635372512901660==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-less-upgrade-704-710.patch"

RnJvbSAzZGJlYmVhMDJkNmYxYjdlZjhhMTU1NzhkMmIzNzBmMjA1NjdkY2FmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTkgT2N0IDIwMjYgMDU6NDg6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
ZXNzOiB1cGdyYWRlIDcwNCAtPiA3MTAKCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KTWFqb3IgY2hhbmdlcyBiZXR3
ZWVuICJsZXNzIiB2ZXJzaW9ucyA3MDQgYW5kIDcxMAotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRl
ZC9sZXNzL3tsZXNzXzcwNC5iYiA9PiBsZXNzXzcxMC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvbGVzcy97bGVzc183MDQuYmIgPT4gbGVzc183MTAuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xlc3MvbGVzc183MDQuYmIgYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvbGVzcy9sZXNzXzcxMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGVzcy9sZXNzXzcwNC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2xlc3MvbGVzc183MTAuYmIKaW5kZXggZGM4NDFhOWFlNi4uZjNmNWVi
ZDZhMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xlc3MvbGVzc183MDQuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xlc3MvbGVzc183MTAuYmIKQEAgLTI5LDcgKzI5
LDcgQEAgU1JDX1VSSSA9ICJodHRwOi8vd3d3LmdyZWVud29vZHNvZnR3YXJlLmNvbS8ke0JQTn0v
JHtCUE59LSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAg
ICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyMGEwYjBhMmJiMjUyNWZhNTNjN2Vl
ZTliZWI4NTRiNGM5Y2YxNzJlYWJiMjA5YWY3MDIwNzQzNTQ3YmZlOWZiIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gImQxMDA4ZmI3OGRjYWUxMzIzZGRhYjY2NGJjYjM1MmE2MWYwMjJiMWIxMzFiZDgw
MTg1NDhlMDIxZDk3NWVjN2EiCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwOi8vd3d3Lmdy
ZWVud29vZHNvZnR3YXJlLmNvbS9sZXNzL2Rvd25sb2FkLmh0bWwiCiAKLS0gCjIuNDcuMQoK

--===============6692635372512901660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/less/less-dev: RRECOMMENDS: removed "update-alternatives-opkg-dev"
packages/x86-64-v3-poky-linux/less/less-doc: FILELIST: removed "/usr/share/man/man1/lesskey.1", added "/usr/share/man/man5/lesskey.5"
packages/x86-64-v3-poky-linux/less/less-ptest: FILELIST: added "/usr/lib/less/ptest/lt/osc8-hilite.lt"
packages/x86-64-v3-poky-linux/less/less: FILELIST: removed "/usr/bin/lesskey /usr/libexec/lessecho /usr/bin/less.less", added "/usr/libexec/lessecho_t /usr/bin/less_t"
packages/x86-64-v3-poky-linux/less/less: RDEPENDS: removed all items "update-alternatives-opkg"
packages/x86-64-v3-poky-linux/less/less: pkg_postinst cleared:
  @@ -1,3 +0,0 @@
  -#!/bin/sh
  -set -e
  -	update-alternatives --install /usr/bin/less less /usr/bin/less.less 100
  --
packages/x86-64-v3-poky-linux/less/less: pkg_prerm cleared:
  @@ -1,3 +0,0 @@
  -#!/bin/sh
  -set -e
  -	update-alternatives --remove  less /usr/bin/less.less
  --

--===============6692635372512901660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="less-changelog.txt"

======================================================================
Major changes between "less" versions 704 and 710

--===============6692635372512901660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/less: PV changed from "704" to "710"
packages/x86-64-v3-poky-linux/less: SRC_URI changed from "http://www.greenwoodsoftware.com/less/less-704.tar.gz file://run-ptest" to "http://www.greenwoodsoftware.com/less/less-710.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/less: PKGV changed from 704 [default] to 710 [default]
packages/x86-64-v3-poky-linux/less/less-dbg: FILELIST: removed "/usr/bin/.debug/lesskey /usr/bin/.debug/less.less /usr/libexec/.debug/lessecho", added "/usr/libexec/.debug/lessecho_t /usr/bin/.debug/less_t"
packages/x86-64-v3-poky-linux/less/less-dbg: PKGSIZE changed from 982408 to 1024616 (+4%)
packages/x86-64-v3-poky-linux/less/less-dbg: PV changed from "704" to "710"
packages/x86-64-v3-poky-linux/less/less-dbg: PKGV changed from 704 [default] to 710 [default]
packages/x86-64-v3-poky-linux/less/less-dev: RRECOMMENDS: removed "update-alternatives-opkg-dev"
packages/x86-64-v3-poky-linux/less/less-dev: PV changed from "704" to "710"
packages/x86-64-v3-poky-linux/less/less-dev: PKGV changed from 704 [default] to 710 [default]
packages/x86-64-v3-poky-linux/less/less-doc: FILELIST: removed "/usr/share/man/man1/lesskey.1", added "/usr/share/man/man5/lesskey.5"
packages/x86-64-v3-poky-linux/less/less-doc: PKGSIZE changed from 131257 to 135750 (+3%)
packages/x86-64-v3-poky-linux/less/less-doc: PV changed from "704" to "710"
packages/x86-64-v3-poky-linux/less/less-doc: PKGV changed from 704 [default] to 710 [default]
packages/x86-64-v3-poky-linux/less/less-locale: PV changed from "704" to "710"
packages/x86-64-v3-poky-linux/less/less-locale: PKGV changed from 704 [default] to 710 [default]
packages/x86-64-v3-poky-linux/less/less-ptest: FILELIST: added "/usr/lib/less/ptest/lt/osc8-hilite.lt"
packages/x86-64-v3-poky-linux/less/less-ptest: PKGSIZE changed from 11603240 to 11927302 (+3%)
packages/x86-64-v3-poky-linux/less/less-ptest: PV changed from "704" to "710"
packages/x86-64-v3-poky-linux/less/less-ptest: PKGV changed from 704 [default] to 710 [default]
packages/x86-64-v3-poky-linux/less/less-src: FILELIST: directory renamed /usr/src/debug/less/704/lesstest -> /usr/src/debug/less/710/lesstest, removed "/usr/src/debug/less/704/jump.c /usr/src/debug/less/704/evar.c /usr/src/debug/less/704/lessecho.c /usr/src/debug/less/704/ttyin.c /usr/src/debug/less/704/edit.c /usr/src/debug/less/704/cvt.c /usr/src/debug/less/704/ch.c /usr/src/debug/less/704/line.c /usr/src/debug/less/704/lesskey.h /usr/src/debug/less/704/funcs.h /usr/src/debug/less/704/search.c /usr/src/debug/less/704/input.c /usr/src/debug/less/704/lesskey.c /usr/src/debug/less/704/filename.c /usr/src/debug/less/704/forwback.c /usr/src/debug/less/704/linenum.c /usr/src/debug/less/704/lsystem.c /usr/src/debug/less/704/less.h /usr/src/debug/less/704/os.c /usr/src/debug/less/704/help.c /usr/src/debug/less/704/position.c /usr/src/debug/less/704/decode.c /usr/src/debug/less/704/option.h /usr/src/debug/less/704/option.c /usr/src/debug/less/704/ifile.c /usr/src/debug/less/704/screen.c /us
 r/src/debug/less/704/mark.c /usr/src/debug/less/704/xbuf.h /usr/src/debug/less/704/main.c /usr/src/debug/less/704/opttbl.c /usr/src/debug/less/704/xbuf.c /usr/src/debug/less/704/brac.c /usr/src/debug/less/704/charset.c /usr/src/debug/less/704/command.c /usr/src/debug/less/704/lang.h /usr/src/debug/less/704/tags.c /usr/src/debug/less/704/version.c /usr/src/debug/less/704/lesskey_parse.c /usr/src/debug/less/704/pattern.c /usr/src/debug/less/704/signal.c /usr/src/debug/less/704/prompt.c /usr/src/debug/less/704/cmdbuf.c /usr/src/debug/less/704/output.c /usr/src/debug/less/704/optfunc.c", added "/usr/src/debug/less/710/jump.c /usr/src/debug/less/710/evar.c /usr/src/debug/less/710/lessecho.c /usr/src/debug/less/710/ttyin.c /usr/src/debug/less/710/edit.c /usr/src/debug/less/710/cvt.c /usr/src/debug/less/710/ch.c /usr/src/debug/less/710/line.c /usr/src/debug/less/710/lesskey.h /usr/src/debug/less/710/funcs.h /usr/src/debug/less/710/search.c /usr/src/debug/less/710/input.c /usr/src/debug/les
 s/710/linenum.c /usr/src/debug/less/710/filename.c /usr/src/debug/less/710/forwback.c /usr/src/debug/less/710/lsystem.c /usr/src/debug/less/710/less.h /usr/src/debug/less/710/os.c /usr/src/debug/less/710/help.c /usr/src/debug/less/710/position.c /usr/src/debug/less/710/decode.c /usr/src/debug/less/710/option.h /usr/src/debug/less/710/option.c /usr/src/debug/less/710/ifile.c /usr/src/debug/less/710/screen.c /usr/src/debug/less/710/mark.c /usr/src/debug/less/710/xbuf.h /usr/src/debug/less/710/main.c /usr/src/debug/less/710/opttbl.c /usr/src/debug/less/710/xbuf.c /usr/src/debug/less/710/brac.c /usr/src/debug/less/710/charset.c /usr/src/debug/less/710/command.c /usr/src/debug/less/710/lang.h /usr/src/debug/less/710/tags.c /usr/src/debug/less/710/version.c /usr/src/debug/less/710/lesskey_parse.c /usr/src/debug/less/710/pattern.c /usr/src/debug/less/710/signal.c /usr/src/debug/less/710/prompt.c /usr/src/debug/less/710/cmdbuf.c /usr/src/debug/less/710/output.c /usr/src/debug/less/710/lmsg.
 h /usr/src/debug/less/710/optfunc.c /usr/src/debug/less/710/lmsg.c"
packages/x86-64-v3-poky-linux/less/less-src: PKGSIZE changed from 940404 to 955595 (+2%)
packages/x86-64-v3-poky-linux/less/less-src: PV changed from "704" to "710"
packages/x86-64-v3-poky-linux/less/less-src: PKGV changed from 704 [default] to 710 [default]
packages/x86-64-v3-poky-linux/less/less-staticdev: PV changed from "704" to "710"
packages/x86-64-v3-poky-linux/less/less-staticdev: PKGV changed from 704 [default] to 710 [default]
packages/x86-64-v3-poky-linux/less/less: RDEPENDS: removed all items "update-alternatives-opkg"
packages/x86-64-v3-poky-linux/less/less: FILELIST: removed "/usr/bin/less.less /usr/libexec/lessecho /usr/bin/lesskey", added "/usr/bin/less_t /usr/libexec/lessecho_t"
packages/x86-64-v3-poky-linux/less/less: PKGSIZE changed from 317987 to 328211 (+3%)
packages/x86-64-v3-poky-linux/less/less: PV changed from "704" to "710"
packages/x86-64-v3-poky-linux/less/less: PKGV changed from 704 [default] to 710 [default]
packages/x86-64-v3-poky-linux/less/less: pkg_postinst cleared:
  @@ -1,3 +0,0 @@
  -#!/bin/sh
  -set -e
  -	update-alternatives --install /usr/bin/less less /usr/bin/less.less 100
  --
packages/x86-64-v3-poky-linux/less/less: pkg_prerm cleared:
  @@ -1,3 +0,0 @@
  -#!/bin/sh
  -set -e
  -	update-alternatives --remove  less /usr/bin/less.less
  --

--===============6692635372512901660==--

