Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B4AC3DA4A
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:33 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.8100.1739623336690658825
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Hqw5E9Vc;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=sM6cGnrt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019509a1acb3-bf6a3666-6fb8-48b1-9b85-68771f25542b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UNXDLo3cfGKBFX5hF87eeiT9PIbiVuPDKfg0PmpSm8Y=;
	b=Hqw5E9Vc+Lg1vK1sXOZvfqpR7zaw0sbSNPTMaNwLYqcl+Rdkf9fSfoZ31z6Ql8Pa
	+RS/FDjhr4M0xFQWObzWPIZQ3EVn3coAToI38ug8BgPgaVcdf2fBDvDlGBa1V5piuxm
	lK9rNB8fYgM5L4B3S88G7CnUmO+LjuVuFaH5ldUE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UNXDLo3cfGKBFX5hF87eeiT9PIbiVuPDKfg0PmpSm8Y=;
	b=sM6cGnrtgsNlhMxsTQBdJBGCpjuJ+hvGPwOu3adyeIhSyurqpsEA5tRhjSuW2goi
	E0FB0J9sLTXmFoeBvSptjlbl52iaYBkYDmkxZ8a6ojJFTzkVulCSPyMDuWJPkqACmOe
	pUH7xWQvJCT9hgMbnFQSIKO6DCLpdI12nto9Fy8Y=
Content-Type: multipart/mixed; boundary="===============3010427006358298415=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pango: upgrading to 1.56.1 SUCCEEDED
Message-ID: <0101019509a1acb3-bf6a3666-6fb8-48b1-9b85-68771f25542b-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211454

--===============3010427006358298415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pango* to *1.56.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pango-upgrade-1.55.5-1.56.1.patch
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
From c8b1fca88143043f4a2970c881f85826f970a767 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 09:39:35 +0000
Subject: [PATCH] pango: upgrade 1.55.5 -> 1.56.1

---
 .../recipes-graphics/pango/{pango_1.55.5.bb => pango_1.56.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.55.5.bb => pango_1.56.1.bb} (93%)

diff --git a/meta/recipes-graphics/pango/pango_1.55.5.bb b/meta/recipes-graphics/pango/pango_1.56.1.bb
similarity index 93%
rename from meta/recipes-graphics/pango/pango_1.55.5.bb
rename to meta/recipes-graphics/pango/pango_1.56.1.bb
index 6c7242274f..cb4d779a55 100644
--- a/meta/recipes-graphics/pango/pango_1.55.5.bb
+++ b/meta/recipes-graphics/pango/pango_1.56.1.bb
@@ -18,7 +18,7 @@ UPSTREAM_CHECK_REGEX = "pango-(?P<pver>\d+\.(?!9\d+)\d+\.\d+)"
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
 
-SRC_URI[archive.sha256sum] = "e396126ea08203cbd8ef12638e6222e2e1fd8aa9cac6743072fedc5f2d820dd8"
+SRC_URI[archive.sha256sum] = "426be66460c98b8378573e7f6b0b2ab450f6bb6d2ec7cecc33ae81178f246480"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.44.1


--===============3010427006358298415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/pango: PV changed from "1.55.5" to "1.56.1"
packages/core2-64-poky-linux/pango: SRC_URI changed from "https://download.gnome.org/sources//pango/1.55/pango-1.55.5.tar.xz;name=archive" to "https://download.gnome.org/sources//pango/1.56/pango-1.56.1.tar.xz;name=archive"
packages/core2-64-poky-linux/pango: PKGV changed from 1.55.5 [default] to 1.56.1 [default]
packages/core2-64-poky-linux/pango/pango-dbg: FILELIST: removed "/usr/lib/.debug/libpangocairo-1.0.so.0.5505.0 /usr/lib/.debug/libpangoft2-1.0.so.0.5505.0 /usr/lib/.debug/libpango-1.0.so.0.5505.0 /usr/lib/.debug/libpangoxft-1.0.so.0.5505.0", added "/usr/lib/.debug/libpango-1.0.so.0.5600.1 /usr/lib/.debug/libpangocairo-1.0.so.0.5600.1 /usr/lib/.debug/libpangoft2-1.0.so.0.5600.1 /usr/lib/.debug/libpangoxft-1.0.so.0.5600.1"
packages/core2-64-poky-linux/pango/pango-dbg: PV changed from "1.55.5" to "1.56.1"
packages/core2-64-poky-linux/pango/pango-dbg: PKGV changed from 1.55.5 [default] to 1.56.1 [default]
packages/core2-64-poky-linux/pango/pango-dbg: PKGSIZE changed from 2074520 to 2094904 (+1%)
packages/core2-64-poky-linux/pango/pango-dev: PV changed from "1.55.5" to "1.56.1"
packages/core2-64-poky-linux/pango/pango-dev: PKGV changed from 1.55.5 [default] to 1.56.1 [default]
packages/core2-64-poky-linux/pango/pango-dev: PKGSIZE changed from 1570177 to 1579072 (+1%)
packages/core2-64-poky-linux/pango/pango-doc: PV changed from "1.55.5" to "1.56.1"
packages/core2-64-poky-linux/pango/pango-doc: PKGV changed from 1.55.5 [default] to 1.56.1 [default]
packages/core2-64-poky-linux/pango/pango-locale: PV changed from "1.55.5" to "1.56.1"
packages/core2-64-poky-linux/pango/pango-locale: PKGV changed from 1.55.5 [default] to 1.56.1 [default]
packages/core2-64-poky-linux/pango/pango-src: PV changed from "1.55.5" to "1.56.1"
packages/core2-64-poky-linux/pango/pango-src: PKGV changed from 1.55.5 [default] to 1.56.1 [default]
packages/core2-64-poky-linux/pango/pango-src: PKGSIZE changed from 2100753 to 2114689 (+1%)
packages/core2-64-poky-linux/pango/pango-staticdev: PV changed from "1.55.5" to "1.56.1"
packages/core2-64-poky-linux/pango/pango-staticdev: PKGV changed from 1.55.5 [default] to 1.56.1 [default]
packages/core2-64-poky-linux/pango/pango: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.5505.0 /usr/lib/libpangoft2-1.0.so.0.5505.0 /usr/lib/libpangocairo-1.0.so.0.5505.0 /usr/lib/libpango-1.0.so.0.5505.0", added "/usr/lib/libpangocairo-1.0.so.0.5600.1 /usr/lib/libpangoxft-1.0.so.0.5600.1 /usr/lib/libpango-1.0.so.0.5600.1 /usr/lib/libpangoft2-1.0.so.0.5600.1"
packages/core2-64-poky-linux/pango/pango: PV changed from "1.55.5" to "1.56.1"
packages/core2-64-poky-linux/pango/pango: PKGV changed from 1.55.5 [default] to 1.56.1 [default]
packages/core2-64-poky-linux/pango/pango: PKGSIZE changed from 864335 to 868823 (+1%)
Changes to packages/core2-64-poky-linux/pango (sysroot):
  /usr/lib/libpango-1.0.so.0 changed symlink target from libpango-1.0.so.0.5505.0 to libpango-1.0.so.0.5600.1
  /usr/lib/libpangocairo-1.0.so.0 changed symlink target from libpangocairo-1.0.so.0.5505.0 to libpangocairo-1.0.so.0.5600.1
  /usr/lib/libpangoft2-1.0.so.0 changed symlink target from libpangoft2-1.0.so.0.5505.0 to libpangoft2-1.0.so.0.5600.1
  /usr/lib/libpangoxft-1.0.so.0 changed symlink target from libpangoxft-1.0.so.0.5505.0 to libpangoxft-1.0.so.0.5600.1
  /usr/lib/libpango-1.0.so.0.5505.0 moved to /usr/lib/libpango-1.0.so.0.5600.1
  /usr/lib/libpangocairo-1.0.so.0.5505.0 moved to /usr/lib/libpangocairo-1.0.so.0.5600.1
  /usr/lib/libpangoft2-1.0.so.0.5505.0 moved to /usr/lib/libpangoft2-1.0.so.0.5600.1
  /usr/lib/libpangoxft-1.0.so.0.5505.0 moved to /usr/lib/libpangoxft-1.0.so.0.5600.1

--===============3010427006358298415==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pango-upgrade-1.55.5-1.56.1.patch"

RnJvbSBjOGIxZmNhODgxNDMwNDNmNGEyOTcwYzg4MWY4NTgyNmY5NzBhNzY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMDk6Mzk6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
YW5nbzogdXBncmFkZSAxLjU1LjUgLT4gMS41Ni4xCgotLS0KIC4uLi9yZWNpcGVzLWdyYXBoaWNz
L3BhbmdvL3twYW5nb18xLjU1LjUuYmIgPT4gcGFuZ29fMS41Ni4xLmJifSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy9wYW5nby97cGFuZ29fMS41NS41LmJiID0+IHBhbmdvXzEuNTYuMS5iYn0g
KDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGFuZ28vcGFuZ29fMS41
NS41LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BhbmdvL3BhbmdvXzEuNTYuMS5iYgpzaW1p
bGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGFuZ28v
cGFuZ29fMS41NS41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGFuZ28vcGFu
Z29fMS41Ni4xLmJiCmluZGV4IDZjNzI0MjI3NGYuLmNiNGQ3NzlhNTUgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9wYW5nby9wYW5nb18xLjU1LjUuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3BhbmdvL3BhbmdvXzEuNTYuMS5iYgpAQCAtMTgsNyArMTgsNyBAQCBVUFNU
UkVBTV9DSEVDS19SRUdFWCA9ICJwYW5nby0oP1A8cHZlcj5cZCtcLig/ITlcZCspXGQrXC5cZCsp
IgogR0lSX01FU09OX0VOQUJMRV9GTEFHID0gImVuYWJsZWQiCiBHSVJfTUVTT05fRElTQUJMRV9G
TEFHID0gImRpc2FibGVkIgogCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJlMzk2MTI2
ZWEwODIwM2NiZDhlZjEyNjM4ZTYyMjJlMmUxZmQ4YWE5Y2FjNjc0MzA3MmZlZGM1ZjJkODIwZGQ4
IgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNDI2YmU2NjQ2MGM5OGI4Mzc4NTczZTdm
NmIwYjJhYjQ1MGY2YmI2ZDJlYzdjZWNjMzNhZTgxMTc4ZjI0NjQ4MCIKIAogREVQRU5EUyA9ICJn
bGliLTIuMCBnbGliLTIuMC1uYXRpdmUgZm9udGNvbmZpZyBmcmVldHlwZSB2aXJ0dWFsL2xpYmlj
b252IGNhaXJvIGhhcmZidXp6IGZyaWJpZGkiCiAKLS0gCjIuNDQuMQoK

--===============3010427006358298415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/pango/pango: FILELIST: removed "/usr/lib/libpangoft2-1.0.so.0.5505.0 /usr/lib/libpangoxft-1.0.so.0.5505.0 /usr/lib/libpango-1.0.so.0.5505.0 /usr/lib/libpangocairo-1.0.so.0.5505.0", added "/usr/lib/libpangocairo-1.0.so.0.5600.1 /usr/lib/libpangoxft-1.0.so.0.5600.1 /usr/lib/libpango-1.0.so.0.5600.1 /usr/lib/libpangoft2-1.0.so.0.5600.1"
Changes to packages/core2-64-poky-linux/pango (sysroot):
  /usr/lib/libpango-1.0.so.0 changed symlink target from libpango-1.0.so.0.5505.0 to libpango-1.0.so.0.5600.1
  /usr/lib/libpangocairo-1.0.so.0 changed symlink target from libpangocairo-1.0.so.0.5505.0 to libpangocairo-1.0.so.0.5600.1
  /usr/lib/libpangoft2-1.0.so.0 changed symlink target from libpangoft2-1.0.so.0.5505.0 to libpangoft2-1.0.so.0.5600.1
  /usr/lib/libpangoxft-1.0.so.0 changed symlink target from libpangoxft-1.0.so.0.5505.0 to libpangoxft-1.0.so.0.5600.1
  /usr/lib/libpango-1.0.so.0.5505.0 moved to /usr/lib/libpango-1.0.so.0.5600.1
  /usr/lib/libpangocairo-1.0.so.0.5505.0 moved to /usr/lib/libpangocairo-1.0.so.0.5600.1
  /usr/lib/libpangoft2-1.0.so.0.5505.0 moved to /usr/lib/libpangoft2-1.0.so.0.5600.1
  /usr/lib/libpangoxft-1.0.so.0.5505.0 moved to /usr/lib/libpangoxft-1.0.so.0.5600.1

--===============3010427006358298415==--

