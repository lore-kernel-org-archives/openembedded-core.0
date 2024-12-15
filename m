Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D541EE77195
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 09:29:50 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.33340.1734254975608843039
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 01:29:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ayhrtcPD;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=wVk/JvfF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010193c9a70163-a927ffbe-32aa-439a-8544-eecbfeaf8509-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734254986;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3c+yxaGbUW9iluqm0hQqg4dA/PXb9kbiUG02P2lByoI=;
	b=ayhrtcPDOJqjtigCrYxtUt6VzV8uIPE3Lp/BKCewhGHvfg4S/h9z8M8Kq6LVvy3B
	h75IHx/iTIae1wNuNS/RJHThy7MwgJhP835RE1EDZ8e9zf00Ldfl5H8C+uVkUGxqY2/
	rvF/u8RBPv+m/xkj3u2SpjCUOBMd0WWKGolXGzNI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734254986;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3c+yxaGbUW9iluqm0hQqg4dA/PXb9kbiUG02P2lByoI=;
	b=wVk/JvfFstXJMyByqVWtOYpm+GHm/OHsZV3cy3EcfVyAt+ikaVSHmDSLPP1GnEKw
	1BltvD2LkWIfpNN9o4h4vmlv670GTVpXkidCu67uK0a8MX4o6kIKG+8jAd6rrXLo2jP
	DbLiiyc/+ArmRnlV9mGed03OMaN164YirsdQkdPQ=
Content-Type: multipart/mixed; boundary="===============5842854461309849430=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pango: upgrading to 1.55.5 SUCCEEDED
Message-ID: <01010193c9a70163-a927ffbe-32aa-439a-8544-eecbfeaf8509-000000@us-west-2.amazonses.com>
Date: Sun, 15 Dec 2024 09:29:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 09:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208729

--===============5842854461309849430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pango* to *1.55.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pango-upgrade-1.55.0-1.55.5.patch
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
From 75d029223ea823461c728a52ce7e3981b765d87d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Dec 2024 08:02:48 +0000
Subject: [PATCH] pango: upgrade 1.55.0 -> 1.55.5

---
 .../recipes-graphics/pango/{pango_1.55.0.bb => pango_1.55.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.55.0.bb => pango_1.55.5.bb} (93%)

diff --git a/meta/recipes-graphics/pango/pango_1.55.0.bb b/meta/recipes-graphics/pango/pango_1.55.5.bb
similarity index 93%
rename from meta/recipes-graphics/pango/pango_1.55.0.bb
rename to meta/recipes-graphics/pango/pango_1.55.5.bb
index 48f06c73d8..6c7242274f 100644
--- a/meta/recipes-graphics/pango/pango_1.55.0.bb
+++ b/meta/recipes-graphics/pango/pango_1.55.5.bb
@@ -18,7 +18,7 @@ UPSTREAM_CHECK_REGEX = "pango-(?P<pver>\d+\.(?!9\d+)\d+\.\d+)"
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
 
-SRC_URI[archive.sha256sum] = "a2c17a8dc459a7267b8b167bb149d23ff473b6ff9d5972bee047807ee2220ccf"
+SRC_URI[archive.sha256sum] = "e396126ea08203cbd8ef12638e6222e2e1fd8aa9cac6743072fedc5f2d820dd8"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.44.1


--===============5842854461309849430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/pango: PV changed from "1.55.0" to "1.55.5"
packages/core2-64-poky-linux/pango: PKGV changed from 1.55.0 [default] to 1.55.5 [default]
packages/core2-64-poky-linux/pango: SRC_URI changed from "https://download.gnome.org/sources//pango/1.55/pango-1.55.0.tar.xz;name=archive" to "https://download.gnome.org/sources//pango/1.55/pango-1.55.5.tar.xz;name=archive"
packages/core2-64-poky-linux/pango/pango-dbg: PV changed from "1.55.0" to "1.55.5"
packages/core2-64-poky-linux/pango/pango-dbg: PKGV changed from 1.55.0 [default] to 1.55.5 [default]
packages/core2-64-poky-linux/pango/pango-dbg: FILELIST: removed "/usr/lib/.debug/libpangoft2-1.0.so.0.5500.0 /usr/lib/.debug/libpango-1.0.so.0.5500.0 /usr/lib/.debug/libpangoxft-1.0.so.0.5500.0 /usr/lib/.debug/libpangocairo-1.0.so.0.5500.0", added "/usr/lib/.debug/libpango-1.0.so.0.5505.0 /usr/lib/.debug/libpangoft2-1.0.so.0.5505.0 /usr/lib/.debug/libpangoxft-1.0.so.0.5505.0 /usr/lib/.debug/libpangocairo-1.0.so.0.5505.0"
packages/core2-64-poky-linux/pango/pango-dbg: PKGSIZE changed from 2211424 to 2209576 (-0%)
packages/core2-64-poky-linux/pango/pango-dev: PV changed from "1.55.0" to "1.55.5"
packages/core2-64-poky-linux/pango/pango-dev: PKGV changed from 1.55.0 [default] to 1.55.5 [default]
packages/core2-64-poky-linux/pango/pango-doc: PV changed from "1.55.0" to "1.55.5"
packages/core2-64-poky-linux/pango/pango-doc: PKGV changed from 1.55.0 [default] to 1.55.5 [default]
packages/core2-64-poky-linux/pango/pango-locale: PV changed from "1.55.0" to "1.55.5"
packages/core2-64-poky-linux/pango/pango-locale: PKGV changed from 1.55.0 [default] to 1.55.5 [default]
packages/core2-64-poky-linux/pango/pango-src: PV changed from "1.55.0" to "1.55.5"
packages/core2-64-poky-linux/pango/pango-src: PKGV changed from 1.55.0 [default] to 1.55.5 [default]
packages/core2-64-poky-linux/pango/pango-src: PKGSIZE changed from 2102336 to 2100753 (-0%)
packages/core2-64-poky-linux/pango/pango-staticdev: PV changed from "1.55.0" to "1.55.5"
packages/core2-64-poky-linux/pango/pango-staticdev: PKGV changed from 1.55.0 [default] to 1.55.5 [default]
packages/core2-64-poky-linux/pango/pango: PV changed from "1.55.0" to "1.55.5"
packages/core2-64-poky-linux/pango/pango: PKGV changed from 1.55.0 [default] to 1.55.5 [default]
packages/core2-64-poky-linux/pango/pango: FILELIST: removed "/usr/lib/libpangocairo-1.0.so.0.5500.0 /usr/lib/libpangoxft-1.0.so.0.5500.0 /usr/lib/libpango-1.0.so.0.5500.0 /usr/lib/libpangoft2-1.0.so.0.5500.0", added "/usr/lib/libpangoxft-1.0.so.0.5505.0 /usr/lib/libpangoft2-1.0.so.0.5505.0 /usr/lib/libpangocairo-1.0.so.0.5505.0 /usr/lib/libpango-1.0.so.0.5505.0"
packages/core2-64-poky-linux/pango/pango: PKGSIZE changed from 868431 to 864335 (-0%)
Changes to packages/core2-64-poky-linux/pango (sysroot):
  /usr/lib/libpango-1.0.so.0 changed symlink target from libpango-1.0.so.0.5500.0 to libpango-1.0.so.0.5505.0
  /usr/lib/libpangocairo-1.0.so.0 changed symlink target from libpangocairo-1.0.so.0.5500.0 to libpangocairo-1.0.so.0.5505.0
  /usr/lib/libpangoft2-1.0.so.0 changed symlink target from libpangoft2-1.0.so.0.5500.0 to libpangoft2-1.0.so.0.5505.0
  /usr/lib/libpangoxft-1.0.so.0 changed symlink target from libpangoxft-1.0.so.0.5500.0 to libpangoxft-1.0.so.0.5505.0
  /usr/lib/libpango-1.0.so.0.5500.0 moved to /usr/lib/libpango-1.0.so.0.5505.0
  /usr/lib/libpangocairo-1.0.so.0.5500.0 moved to /usr/lib/libpangocairo-1.0.so.0.5505.0
  /usr/lib/libpangoft2-1.0.so.0.5500.0 moved to /usr/lib/libpangoft2-1.0.so.0.5505.0
  /usr/lib/libpangoxft-1.0.so.0.5500.0 moved to /usr/lib/libpangoxft-1.0.so.0.5505.0

--===============5842854461309849430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/pango/pango: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.5500.0 /usr/lib/libpangocairo-1.0.so.0.5500.0 /usr/lib/libpangoft2-1.0.so.0.5500.0 /usr/lib/libpango-1.0.so.0.5500.0", added "/usr/lib/libpangoft2-1.0.so.0.5505.0 /usr/lib/libpangocairo-1.0.so.0.5505.0 /usr/lib/libpango-1.0.so.0.5505.0 /usr/lib/libpangoxft-1.0.so.0.5505.0"
Changes to packages/core2-64-poky-linux/pango (sysroot):
  /usr/lib/libpango-1.0.so.0 changed symlink target from libpango-1.0.so.0.5500.0 to libpango-1.0.so.0.5505.0
  /usr/lib/libpangocairo-1.0.so.0 changed symlink target from libpangocairo-1.0.so.0.5500.0 to libpangocairo-1.0.so.0.5505.0
  /usr/lib/libpangoft2-1.0.so.0 changed symlink target from libpangoft2-1.0.so.0.5500.0 to libpangoft2-1.0.so.0.5505.0
  /usr/lib/libpangoxft-1.0.so.0 changed symlink target from libpangoxft-1.0.so.0.5500.0 to libpangoxft-1.0.so.0.5505.0
  /usr/lib/libpango-1.0.so.0.5500.0 moved to /usr/lib/libpango-1.0.so.0.5505.0
  /usr/lib/libpangocairo-1.0.so.0.5500.0 moved to /usr/lib/libpangocairo-1.0.so.0.5505.0
  /usr/lib/libpangoft2-1.0.so.0.5500.0 moved to /usr/lib/libpangoft2-1.0.so.0.5505.0
  /usr/lib/libpangoxft-1.0.so.0.5500.0 moved to /usr/lib/libpangoxft-1.0.so.0.5505.0

--===============5842854461309849430==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pango-upgrade-1.55.0-1.55.5.patch"

RnJvbSA3NWQwMjkyMjNlYTgyMzQ2MWM3MjhhNTJjZTdlMzk4MWI3NjVkODdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgRGVjIDIwMjQgMDg6MDI6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
YW5nbzogdXBncmFkZSAxLjU1LjAgLT4gMS41NS41CgotLS0KIC4uLi9yZWNpcGVzLWdyYXBoaWNz
L3BhbmdvL3twYW5nb18xLjU1LjAuYmIgPT4gcGFuZ29fMS41NS41LmJifSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy9wYW5nby97cGFuZ29fMS41NS4wLmJiID0+IHBhbmdvXzEuNTUuNS5iYn0g
KDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGFuZ28vcGFuZ29fMS41
NS4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BhbmdvL3BhbmdvXzEuNTUuNS5iYgpzaW1p
bGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGFuZ28v
cGFuZ29fMS41NS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGFuZ28vcGFu
Z29fMS41NS41LmJiCmluZGV4IDQ4ZjA2YzczZDguLjZjNzI0MjI3NGYgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9wYW5nby9wYW5nb18xLjU1LjAuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3BhbmdvL3BhbmdvXzEuNTUuNS5iYgpAQCAtMTgsNyArMTgsNyBAQCBVUFNU
UkVBTV9DSEVDS19SRUdFWCA9ICJwYW5nby0oP1A8cHZlcj5cZCtcLig/ITlcZCspXGQrXC5cZCsp
IgogR0lSX01FU09OX0VOQUJMRV9GTEFHID0gImVuYWJsZWQiCiBHSVJfTUVTT05fRElTQUJMRV9G
TEFHID0gImRpc2FibGVkIgogCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJhMmMxN2E4
ZGM0NTlhNzI2N2I4YjE2N2JiMTQ5ZDIzZmY0NzNiNmZmOWQ1OTcyYmVlMDQ3ODA3ZWUyMjIwY2Nm
IgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiZTM5NjEyNmVhMDgyMDNjYmQ4ZWYxMjYz
OGU2MjIyZTJlMWZkOGFhOWNhYzY3NDMwNzJmZWRjNWYyZDgyMGRkOCIKIAogREVQRU5EUyA9ICJn
bGliLTIuMCBnbGliLTIuMC1uYXRpdmUgZm9udGNvbmZpZyBmcmVldHlwZSB2aXJ0dWFsL2xpYmlj
b252IGNhaXJvIGhhcmZidXp6IGZyaWJpZGkiCiAKLS0gCjIuNDQuMQoK

--===============5842854461309849430==--

