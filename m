Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD17ED10DD1
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:06:09 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.148766.1733047562398622652
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:06:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=J5ZHrv2X;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=0DgjmKhl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019381af3957-3d40f7a1-3275-4ff4-9d41-efc882e6ed0f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047564;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KXeSBqrjTYEwJOL3tfgGpEUIBVrCmA6+AAPq9TC5HOk=;
	b=J5ZHrv2XU76rA1NINIGBvnxVekEZUepxuUYpTdDgVCBpH6wkICYRAYLr4u5har2x
	NKCpxYLYDpNcDts1wbVO5/mq6UZHyLPJhuC8CGTtBF9astvMMAXDdzKZX2NMxiMiWxI
	K/08xHFjxjfA9x82YSUtDAAYL1uOrkb0B+9xHeog=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047564;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KXeSBqrjTYEwJOL3tfgGpEUIBVrCmA6+AAPq9TC5HOk=;
	b=0DgjmKhlOs/hpPiH+LizvRiwsheZ490dLp5pgUSylij75wQuI2H7mXzEOM+b7Ayi
	7MaDm8UYJMkskBtz/XQ+MzGYi4ecw9SiIpTCckFmMZAICOSY50ByfSUy1KKgDqNmYFd
	u0dTF5PvUSy+NZiB8sPeYuTjU/515PwCIYVF/hSU=
Content-Type: multipart/mixed; boundary="===============9067107686574409859=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pango: upgrading to 1.55.0 SUCCEEDED
Message-ID: <0101019381af3957-3d40f7a1-3275-4ff4-9d41-efc882e6ed0f-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:06:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208090

--===============9067107686574409859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pango* to *1.55.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pango-upgrade-1.54.0-1.55.0.patch
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
From f52c8083e70ec1d3205f811aed6067185dd68b27 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Dec 2024 08:05:22 +0000
Subject: [PATCH] pango: upgrade 1.54.0 -> 1.55.0

---
 .../recipes-graphics/pango/{pango_1.54.0.bb => pango_1.55.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.54.0.bb => pango_1.55.0.bb} (93%)

diff --git a/meta/recipes-graphics/pango/pango_1.54.0.bb b/meta/recipes-graphics/pango/pango_1.55.0.bb
similarity index 93%
rename from meta/recipes-graphics/pango/pango_1.54.0.bb
rename to meta/recipes-graphics/pango/pango_1.55.0.bb
index 31f3f3d27c..48f06c73d8 100644
--- a/meta/recipes-graphics/pango/pango_1.54.0.bb
+++ b/meta/recipes-graphics/pango/pango_1.55.0.bb
@@ -18,7 +18,7 @@ UPSTREAM_CHECK_REGEX = "pango-(?P<pver>\d+\.(?!9\d+)\d+\.\d+)"
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
 
-SRC_URI[archive.sha256sum] = "8a9eed75021ee734d7fc0fdf3a65c3bba51dfefe4ae51a9b414a60c70b2d1ed8"
+SRC_URI[archive.sha256sum] = "a2c17a8dc459a7267b8b167bb149d23ff473b6ff9d5972bee047807ee2220ccf"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.44.1


--===============9067107686574409859==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pango-upgrade-1.54.0-1.55.0.patch"

RnJvbSBmNTJjODA4M2U3MGVjMWQzMjA1ZjgxMWFlZDYwNjcxODVkZDY4YjI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBEZWMgMjAyNCAwODowNToyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBh
bmdvOiB1cGdyYWRlIDEuNTQuMCAtPiAxLjU1LjAKCi0tLQogLi4uL3JlY2lwZXMtZ3JhcGhpY3Mv
cGFuZ28ve3BhbmdvXzEuNTQuMC5iYiA9PiBwYW5nb18xLjU1LjAuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3BhbmdvL3twYW5nb18xLjU0LjAuYmIgPT4gcGFuZ29fMS41NS4wLmJifSAo
OTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9wYW5nby9wYW5nb18xLjU0
LjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGFuZ28vcGFuZ29fMS41NS4wLmJiCnNpbWls
YXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9wYW5nby9w
YW5nb18xLjU0LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9wYW5nby9wYW5n
b18xLjU1LjAuYmIKaW5kZXggMzFmM2YzZDI3Yy4uNDhmMDZjNzNkOCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3BhbmdvL3BhbmdvXzEuNTQuMC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvcGFuZ28vcGFuZ29fMS41NS4wLmJiCkBAIC0xOCw3ICsxOCw3IEBAIFVQU1RS
RUFNX0NIRUNLX1JFR0VYID0gInBhbmdvLSg/UDxwdmVyPlxkK1wuKD8hOVxkKylcZCtcLlxkKyki
CiBHSVJfTUVTT05fRU5BQkxFX0ZMQUcgPSAiZW5hYmxlZCIKIEdJUl9NRVNPTl9ESVNBQkxFX0ZM
QUcgPSAiZGlzYWJsZWQiCiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjhhOWVlZDc1
MDIxZWU3MzRkN2ZjMGZkZjNhNjVjM2JiYTUxZGZlZmU0YWU1MWE5YjQxNGE2MGM3MGIyZDFlZDgi
CitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJhMmMxN2E4ZGM0NTlhNzI2N2I4YjE2N2Ji
MTQ5ZDIzZmY0NzNiNmZmOWQ1OTcyYmVlMDQ3ODA3ZWUyMjIwY2NmIgogCiBERVBFTkRTID0gImds
aWItMi4wIGdsaWItMi4wLW5hdGl2ZSBmb250Y29uZmlnIGZyZWV0eXBlIHZpcnR1YWwvbGliaWNv
bnYgY2Fpcm8gaGFyZmJ1enogZnJpYmlkaSIKIAotLSAKMi40NC4xCgo=

--===============9067107686574409859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/pango/pango: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.5400.0 /usr/lib/libpangocairo-1.0.so.0.5400.0 /usr/lib/libpangoft2-1.0.so.0.5400.0 /usr/lib/libpango-1.0.so.0.5400.0", added "/usr/lib/libpangoxft-1.0.so.0.5500.0 /usr/lib/libpangocairo-1.0.so.0.5500.0 /usr/lib/libpangoft2-1.0.so.0.5500.0 /usr/lib/libpango-1.0.so.0.5500.0"
Changes to packages/core2-64-poky-linux/pango (sysroot):
  /usr/lib/libpango-1.0.so.0 changed symlink target from libpango-1.0.so.0.5400.0 to libpango-1.0.so.0.5500.0
  /usr/lib/libpangocairo-1.0.so.0 changed symlink target from libpangocairo-1.0.so.0.5400.0 to libpangocairo-1.0.so.0.5500.0
  /usr/lib/libpangoft2-1.0.so.0 changed symlink target from libpangoft2-1.0.so.0.5400.0 to libpangoft2-1.0.so.0.5500.0
  /usr/lib/libpangoxft-1.0.so.0 changed symlink target from libpangoxft-1.0.so.0.5400.0 to libpangoxft-1.0.so.0.5500.0
  /usr/lib/libpango-1.0.so.0.5400.0 moved to /usr/lib/libpango-1.0.so.0.5500.0
  /usr/lib/libpangocairo-1.0.so.0.5400.0 moved to /usr/lib/libpangocairo-1.0.so.0.5500.0
  /usr/lib/libpangoft2-1.0.so.0.5400.0 moved to /usr/lib/libpangoft2-1.0.so.0.5500.0
  /usr/lib/libpangoxft-1.0.so.0.5400.0 moved to /usr/lib/libpangoxft-1.0.so.0.5500.0

--===============9067107686574409859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/pango: PV changed from "1.54.0" to "1.55.0"
packages/core2-64-poky-linux/pango: SRC_URI changed from "https://download.gnome.org/sources//pango/1.54/pango-1.54.0.tar.xz;name=archive" to "https://download.gnome.org/sources//pango/1.55/pango-1.55.0.tar.xz;name=archive"
packages/core2-64-poky-linux/pango: PKGV changed from 1.54.0 [default] to 1.55.0 [default]
packages/core2-64-poky-linux/pango/pango-dbg: PV changed from "1.54.0" to "1.55.0"
packages/core2-64-poky-linux/pango/pango-dbg: PKGSIZE changed from 2200968 to 2211424 (+0%)
packages/core2-64-poky-linux/pango/pango-dbg: FILELIST: removed "/usr/lib/.debug/libpango-1.0.so.0.5400.0 /usr/lib/.debug/libpangocairo-1.0.so.0.5400.0 /usr/lib/.debug/libpangoft2-1.0.so.0.5400.0 /usr/lib/.debug/libpangoxft-1.0.so.0.5400.0", added "/usr/lib/.debug/libpangoft2-1.0.so.0.5500.0 /usr/lib/.debug/libpango-1.0.so.0.5500.0 /usr/lib/.debug/libpangoxft-1.0.so.0.5500.0 /usr/lib/.debug/libpangocairo-1.0.so.0.5500.0"
packages/core2-64-poky-linux/pango/pango-dbg: PKGV changed from 1.54.0 [default] to 1.55.0 [default]
packages/core2-64-poky-linux/pango/pango-dev: PV changed from "1.54.0" to "1.55.0"
packages/core2-64-poky-linux/pango/pango-dev: PKGSIZE changed from 1567695 to 1570177 (+0%)
packages/core2-64-poky-linux/pango/pango-dev: PKGV changed from 1.54.0 [default] to 1.55.0 [default]
packages/core2-64-poky-linux/pango/pango-doc: PV changed from "1.54.0" to "1.55.0"
packages/core2-64-poky-linux/pango/pango-doc: PKGV changed from 1.54.0 [default] to 1.55.0 [default]
packages/core2-64-poky-linux/pango/pango-locale: PV changed from "1.54.0" to "1.55.0"
packages/core2-64-poky-linux/pango/pango-locale: PKGV changed from 1.54.0 [default] to 1.55.0 [default]
packages/core2-64-poky-linux/pango/pango-src: PV changed from "1.54.0" to "1.55.0"
packages/core2-64-poky-linux/pango/pango-src: PKGSIZE changed from 2076363 to 2102336 (+1%)
packages/core2-64-poky-linux/pango/pango-src: PKGV changed from 1.54.0 [default] to 1.55.0 [default]
packages/core2-64-poky-linux/pango/pango-staticdev: PV changed from "1.54.0" to "1.55.0"
packages/core2-64-poky-linux/pango/pango-staticdev: PKGV changed from 1.54.0 [default] to 1.55.0 [default]
packages/core2-64-poky-linux/pango/pango: PV changed from "1.54.0" to "1.55.0"
packages/core2-64-poky-linux/pango/pango: PKGSIZE changed from 856051 to 868431 (+1%)
packages/core2-64-poky-linux/pango/pango: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.5400.0 /usr/lib/libpango-1.0.so.0.5400.0 /usr/lib/libpangocairo-1.0.so.0.5400.0 /usr/lib/libpangoft2-1.0.so.0.5400.0", added "/usr/lib/libpangoxft-1.0.so.0.5500.0 /usr/lib/libpangocairo-1.0.so.0.5500.0 /usr/lib/libpango-1.0.so.0.5500.0 /usr/lib/libpangoft2-1.0.so.0.5500.0"
packages/core2-64-poky-linux/pango/pango: PKGV changed from 1.54.0 [default] to 1.55.0 [default]
Changes to packages/core2-64-poky-linux/pango (sysroot):
  /usr/lib/libpango-1.0.so.0 changed symlink target from libpango-1.0.so.0.5400.0 to libpango-1.0.so.0.5500.0
  /usr/lib/libpangocairo-1.0.so.0 changed symlink target from libpangocairo-1.0.so.0.5400.0 to libpangocairo-1.0.so.0.5500.0
  /usr/lib/libpangoft2-1.0.so.0 changed symlink target from libpangoft2-1.0.so.0.5400.0 to libpangoft2-1.0.so.0.5500.0
  /usr/lib/libpangoxft-1.0.so.0 changed symlink target from libpangoxft-1.0.so.0.5400.0 to libpangoxft-1.0.so.0.5500.0
  /usr/lib/libpango-1.0.so.0.5400.0 moved to /usr/lib/libpango-1.0.so.0.5500.0
  /usr/lib/libpangocairo-1.0.so.0.5400.0 moved to /usr/lib/libpangocairo-1.0.so.0.5500.0
  /usr/lib/libpangoft2-1.0.so.0.5400.0 moved to /usr/lib/libpangoft2-1.0.so.0.5500.0
  /usr/lib/libpangoxft-1.0.so.0.5400.0 moved to /usr/lib/libpangoxft-1.0.so.0.5500.0

--===============9067107686574409859==--

