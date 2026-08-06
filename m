Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 502C1C5AC67
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 06:24:25 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13883.1785997456994989038
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 23:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=jIKigFd1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gx3wdZSK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019fd5be7c79-8c374c7d-8bc0-4b1d-a21c-747f60ac4fe3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785997458;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KfdqfDv9Go4qXGkkxmMGhb1Pg4oxK7yvLEmNGwEzMfU=;
	b=jIKigFd1YN3DJzIUlnEkJgS1FwiIXHfMm8tDE01DY2kakW0MO39E1g70x1gqPnHK
	A37a41meF6WmdGxcOq3F/WVHeuy8LpAAwgVjbW9emkIBqhLY7JgIuK00skzc5M/C3Dz
	F36wR3zGhkH2fnNi5ZC1ppN3dH83+gO1TvMxAzGo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785997458;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KfdqfDv9Go4qXGkkxmMGhb1Pg4oxK7yvLEmNGwEzMfU=;
	b=gx3wdZSKV105RWExk/P9AF/OAy+KcjtRl5ezoH3cpBlVrLBxy31LDjZcQqeLdvBD
	ShserJm9aApX9QwSkCV8WVGAx/GkDCmhD2A0QbKiseW+etaZMxV3XqfgZviVfFDXsAB
	Gr3iE+uNpQUvSiJ5xFUanP93oFQcAIIUgsxe1onQ=
Content-Type: multipart/mixed; boundary="===============4406626369522333311=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pango: upgrading to 1.58.2 SUCCEEDED
Message-ID: <0101019fd5be7c79-8c374c7d-8bc0-4b1d-a21c-747f60ac4fe3-000000@us-west-2.amazonses.com>
Date: Thu, 6 Aug 2026 06:24:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.06-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 06:24:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242910

--===============4406626369522333311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pango* to *1.58.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pango-upgrade-1.58.0-1.58.2.patch
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
From c21aecfb7cd742eeaca18865fb6e6a1c6bb4a155 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 6 Aug 2026 05:59:26 +0000
Subject: [PATCH] pango: upgrade 1.58.0 -> 1.58.2

Source: NEWS

Overview of changes in 1.58.2, 05-08-2026
=========================================

* No changes

Overview of changes in 1.58.1, 03-08-2026
=========================================

* Require harfbuzz 11
* Require glib 2.88
* CoreText: Support variations
* CoreText: Support font features from descriptions
* Renderer: Keep over/under/through lines in sync
* Fixes for undefined behavior
---
 .../recipes-graphics/pango/{pango_1.58.0.bb => pango_1.58.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.58.0.bb => pango_1.58.2.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.58.0.bb b/meta/recipes-graphics/pango/pango_1.58.2.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.58.0.bb
rename to meta/recipes-graphics/pango/pango_1.58.2.bb
index 6e1aebad1d..9eafc9636c 100644
--- a/meta/recipes-graphics/pango/pango_1.58.0.bb
+++ b/meta/recipes-graphics/pango/pango_1.58.2.bb
@@ -18,7 +18,7 @@ UPSTREAM_CHECK_REGEX = "pango-(?P<pver>\d+\.(?!9\d+)\d+\.\d+)"
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
 
-SRC_URI[archive.sha256sum] = "bc5bad6213ad4886a47d1e80292fd850b64159b50db67917a43d9ea80ee2298a"
+SRC_URI[archive.sha256sum] = "342385b6ca3b7c73455d7c80a13b7dbe4489e00bc3bd4c5bd6ed4dce421e374a"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 DEPENDS += "${@' python3-docutils-native' if d.getVar('GIDOCGEN_ENABLED') == 'True' else ''}"
-- 
2.47.1


--===============4406626369522333311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/pango/pango: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.5800.0 /usr/lib/libpango-1.0.so.0.5800.0 /usr/lib/libpangoft2-1.0.so.0.5800.0 /usr/lib/libpangocairo-1.0.so.0.5800.0", added "/usr/lib/libpangoft2-1.0.so.0.5800.2 /usr/lib/libpango-1.0.so.0.5800.2 /usr/lib/libpangoxft-1.0.so.0.5800.2 /usr/lib/libpangocairo-1.0.so.0.5800.2"
Changes to packages/x86-64-v3-poky-linux/pango (sysroot):
  /usr/lib/libpango-1.0.so.0 changed symlink target from libpango-1.0.so.0.5800.0 to libpango-1.0.so.0.5800.2
  /usr/lib/libpangocairo-1.0.so.0 changed symlink target from libpangocairo-1.0.so.0.5800.0 to libpangocairo-1.0.so.0.5800.2
  /usr/lib/libpangoft2-1.0.so.0 changed symlink target from libpangoft2-1.0.so.0.5800.0 to libpangoft2-1.0.so.0.5800.2
  /usr/lib/libpangoxft-1.0.so.0 changed symlink target from libpangoxft-1.0.so.0.5800.0 to libpangoxft-1.0.so.0.5800.2
  /usr/lib/libpango-1.0.so.0.5800.0 moved to /usr/lib/libpango-1.0.so.0.5800.2
  /usr/lib/libpangocairo-1.0.so.0.5800.0 moved to /usr/lib/libpangocairo-1.0.so.0.5800.2
  /usr/lib/libpangoft2-1.0.so.0.5800.0 moved to /usr/lib/libpangoft2-1.0.so.0.5800.2
  /usr/lib/libpangoxft-1.0.so.0.5800.0 moved to /usr/lib/libpangoxft-1.0.so.0.5800.2

--===============4406626369522333311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/pango: PKGV changed from 1.58.0 [default] to 1.58.2 [default]
packages/x86-64-v3-poky-linux/pango: SRC_URI changed from "https://download.gnome.org/sources//pango/1.58/pango-1.58.0.tar.xz;name=archive" to "https://download.gnome.org/sources//pango/1.58/pango-1.58.2.tar.xz;name=archive"
packages/x86-64-v3-poky-linux/pango: PV changed from "1.58.0" to "1.58.2"
packages/x86-64-v3-poky-linux/pango/pango-dbg: PKGV changed from 1.58.0 [default] to 1.58.2 [default]
packages/x86-64-v3-poky-linux/pango/pango-dbg: FILELIST: removed "/usr/lib/.debug/libpango-1.0.so.0.5800.0 /usr/lib/.debug/libpangoxft-1.0.so.0.5800.0 /usr/lib/.debug/libpangoft2-1.0.so.0.5800.0 /usr/lib/.debug/libpangocairo-1.0.so.0.5800.0", added "/usr/lib/.debug/libpangoxft-1.0.so.0.5800.2 /usr/lib/.debug/libpango-1.0.so.0.5800.2 /usr/lib/.debug/libpangocairo-1.0.so.0.5800.2 /usr/lib/.debug/libpangoft2-1.0.so.0.5800.2"
packages/x86-64-v3-poky-linux/pango/pango-dbg: PKGSIZE changed from 2380304 to 2392008 (+0%)
packages/x86-64-v3-poky-linux/pango/pango-dbg: PV changed from "1.58.0" to "1.58.2"
packages/x86-64-v3-poky-linux/pango/pango-dev: PKGV changed from 1.58.0 [default] to 1.58.2 [default]
packages/x86-64-v3-poky-linux/pango/pango-dev: PKGSIZE changed from 1610688 to 1610697 (+0%)
packages/x86-64-v3-poky-linux/pango/pango-dev: PV changed from "1.58.0" to "1.58.2"
packages/x86-64-v3-poky-linux/pango/pango-doc: PKGV changed from 1.58.0 [default] to 1.58.2 [default]
packages/x86-64-v3-poky-linux/pango/pango-doc: PV changed from "1.58.0" to "1.58.2"
packages/x86-64-v3-poky-linux/pango/pango-locale: PKGV changed from 1.58.0 [default] to 1.58.2 [default]
packages/x86-64-v3-poky-linux/pango/pango-locale: PV changed from "1.58.0" to "1.58.2"
packages/x86-64-v3-poky-linux/pango/pango-src: PKGV changed from 1.58.0 [default] to 1.58.2 [default]
packages/x86-64-v3-poky-linux/pango/pango-src: FILELIST: directory renamed /usr/src/debug/pango/1.58.0/utils -> /usr/src/debug/pango/1.58.2/utils, directory renamed /usr/src/debug/pango/1.58.0/pango/json -> /usr/src/debug/pango/1.58.2/pango/json, directory renamed /usr/src/debug/pango/1.58.0/pango -> /usr/src/debug/pango/1.58.2/pango
packages/x86-64-v3-poky-linux/pango/pango-src: PKGSIZE changed from 2180341 to 2181210 (+0%)
packages/x86-64-v3-poky-linux/pango/pango-src: PV changed from "1.58.0" to "1.58.2"
packages/x86-64-v3-poky-linux/pango/pango-staticdev: PKGV changed from 1.58.0 [default] to 1.58.2 [default]
packages/x86-64-v3-poky-linux/pango/pango-staticdev: PV changed from "1.58.0" to "1.58.2"
packages/x86-64-v3-poky-linux/pango/pango: PKGV changed from 1.58.0 [default] to 1.58.2 [default]
packages/x86-64-v3-poky-linux/pango/pango: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.5800.0 /usr/lib/libpango-1.0.so.0.5800.0 /usr/lib/libpangoft2-1.0.so.0.5800.0 /usr/lib/libpangocairo-1.0.so.0.5800.0", added "/usr/lib/libpangoxft-1.0.so.0.5800.2 /usr/lib/libpango-1.0.so.0.5800.2 /usr/lib/libpangoft2-1.0.so.0.5800.2 /usr/lib/libpangocairo-1.0.so.0.5800.2"
packages/x86-64-v3-poky-linux/pango/pango: PKGSIZE changed from 904047 to 908143 (+0%)
packages/x86-64-v3-poky-linux/pango/pango: PV changed from "1.58.0" to "1.58.2"
Changes to packages/x86-64-v3-poky-linux/pango (sysroot):
  /usr/lib/libpango-1.0.so.0 changed symlink target from libpango-1.0.so.0.5800.0 to libpango-1.0.so.0.5800.2
  /usr/lib/libpangocairo-1.0.so.0 changed symlink target from libpangocairo-1.0.so.0.5800.0 to libpangocairo-1.0.so.0.5800.2
  /usr/lib/libpangoft2-1.0.so.0 changed symlink target from libpangoft2-1.0.so.0.5800.0 to libpangoft2-1.0.so.0.5800.2
  /usr/lib/libpangoxft-1.0.so.0 changed symlink target from libpangoxft-1.0.so.0.5800.0 to libpangoxft-1.0.so.0.5800.2
  /usr/lib/libpango-1.0.so.0.5800.0 moved to /usr/lib/libpango-1.0.so.0.5800.2
  /usr/lib/libpangocairo-1.0.so.0.5800.0 moved to /usr/lib/libpangocairo-1.0.so.0.5800.2
  /usr/lib/libpangoft2-1.0.so.0.5800.0 moved to /usr/lib/libpangoft2-1.0.so.0.5800.2
  /usr/lib/libpangoxft-1.0.so.0.5800.0 moved to /usr/lib/libpangoxft-1.0.so.0.5800.2

--===============4406626369522333311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="pango-changelog.txt"

Changelog for pango: 1.58.0 -> 1.58.2
Source: NEWS

Overview of changes in 1.58.2, 05-08-2026
=========================================

* No changes

Overview of changes in 1.58.1, 03-08-2026
=========================================

* Require harfbuzz 11
* Require glib 2.88
* CoreText: Support variations
* CoreText: Support font features from descriptions
* Renderer: Keep over/under/through lines in sync
* Fixes for undefined behavior

--===============4406626369522333311==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pango-upgrade-1.58.0-1.58.2.patch"

RnJvbSBjMjFhZWNmYjdjZDc0MmVlYWNhMTg4NjVmYjZlNmExYzZiYjRhMTU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgNiBBdWcgMjAyNiAwNTo1OToyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBh
bmdvOiB1cGdyYWRlIDEuNTguMCAtPiAxLjU4LjIKClNvdXJjZTogTkVXUwoKT3ZlcnZpZXcgb2Yg
Y2hhbmdlcyBpbiAxLjU4LjIsIDA1LTA4LTIwMjYKPT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0KCiogTm8gY2hhbmdlcwoKT3ZlcnZpZXcgb2YgY2hhbmdlcyBpbiAxLjU4
LjEsIDAzLTA4LTIwMjYKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0K
CiogUmVxdWlyZSBoYXJmYnV6eiAxMQoqIFJlcXVpcmUgZ2xpYiAyLjg4CiogQ29yZVRleHQ6IFN1
cHBvcnQgdmFyaWF0aW9ucwoqIENvcmVUZXh0OiBTdXBwb3J0IGZvbnQgZmVhdHVyZXMgZnJvbSBk
ZXNjcmlwdGlvbnMKKiBSZW5kZXJlcjogS2VlcCBvdmVyL3VuZGVyL3Rocm91Z2ggbGluZXMgaW4g
c3luYwoqIEZpeGVzIGZvciB1bmRlZmluZWQgYmVoYXZpb3IKLS0tCiAuLi4vcmVjaXBlcy1ncmFw
aGljcy9wYW5nby97cGFuZ29fMS41OC4wLmJiID0+IHBhbmdvXzEuNTguMi5iYn0gfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvcGFuZ28ve3BhbmdvXzEuNTguMC5iYiA9PiBwYW5nb18xLjU4LjIu
YmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BhbmdvL3Bhbmdv
XzEuNTguMC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9wYW5nby9wYW5nb18xLjU4LjIuYmIK
c2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Bh
bmdvL3BhbmdvXzEuNTguMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Bhbmdv
L3BhbmdvXzEuNTguMi5iYgppbmRleCA2ZTFhZWJhZDFkLi45ZWFmYzk2MzZjIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGFuZ28vcGFuZ29fMS41OC4wLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9wYW5nby9wYW5nb18xLjU4LjIuYmIKQEAgLTE4LDcgKzE4LDcgQEAg
VVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicGFuZ28tKD9QPHB2ZXI+XGQrXC4oPyE5XGQrKVxkK1wu
XGQrKSIKIEdJUl9NRVNPTl9FTkFCTEVfRkxBRyA9ICJlbmFibGVkIgogR0lSX01FU09OX0RJU0FC
TEVfRkxBRyA9ICJkaXNhYmxlZCIKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiYmM1
YmFkNjIxM2FkNDg4NmE0N2QxZTgwMjkyZmQ4NTBiNjQxNTliNTBkYjY3OTE3YTQzZDllYTgwZWUy
Mjk4YSIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjM0MjM4NWI2Y2EzYjdjNzM0NTVk
N2M4MGExM2I3ZGJlNDQ4OWUwMGJjM2JkNGM1YmQ2ZWQ0ZGNlNDIxZTM3NGEiCiAKIERFUEVORFMg
PSAiZ2xpYi0yLjAgZ2xpYi0yLjAtbmF0aXZlIGZvbnRjb25maWcgZnJlZXR5cGUgdmlydHVhbC9s
aWJpY29udiBjYWlybyBoYXJmYnV6eiBmcmliaWRpIgogREVQRU5EUyArPSAiJHtAJyBweXRob24z
LWRvY3V0aWxzLW5hdGl2ZScgaWYgZC5nZXRWYXIoJ0dJRE9DR0VOX0VOQUJMRUQnKSA9PSAnVHJ1
ZScgZWxzZSAnJ30iCi0tIAoyLjQ3LjEKCg==

--===============4406626369522333311==--

