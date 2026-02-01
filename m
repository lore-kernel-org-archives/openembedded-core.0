Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4A82E65266
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:58 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29049.1769951564186798889
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=n3HYyQdM;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=JANmPhSN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019c1955bf3e-71ef5190-ba23-46f1-bee8-0ceec5f701bc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951576;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IwVq9BoSw+Ssc8YuJl17o4GeOuNS7NVGPGxEtQCaLK4=;
	b=n3HYyQdME4Z6id8KmgH65dDieRfXIjH61eWpO18/txOOwJiBVXty1MGp2HP4e8uX
	zYj+Tg8YJGEcQ/klZRE5lRG5jqTCxwgw8bA6iXi9tVwfTYaEHWa4u/HsCSPvb9U+FkW
	CyJ/O2a0NbM4hwbN+PYJRiP2LToW54mZvlotuYcs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951576;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IwVq9BoSw+Ssc8YuJl17o4GeOuNS7NVGPGxEtQCaLK4=;
	b=JANmPhSN1tR59h7q6MZo2Nn6I5EY5GZ3HoNN21ijuERiER5F+cEpsmrVve2aDkE4
	1dz667p/Bc7BI4QDt063eugHlaxaPcmoxDmG8ZfiG3tLdJcAD6h+Y4ESGc+Tp2CkYsi
	GEUiit0JIne43wLGQmZmF+flFEGEAyNyl3qTDuq4=
Content-Type: multipart/mixed; boundary="===============8394411871999547478=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] harfbuzz: upgrading to 12.3.2 SUCCEEDED
Message-ID: <0101019c1955bf3e-71ef5190-ba23-46f1-bee8-0ceec5f701bc-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230307

--===============8394411871999547478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *harfbuzz* to *12.3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-harfbuzz-upgrade-12.3.1-12.3.2.patch
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
From 5ae7c8200b5a7442f66e1126bbb336adb3a42248 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 11:19:28 +0000
Subject: [PATCH] harfbuzz: upgrade 12.3.1 -> 12.3.2

---
 .../harfbuzz/{harfbuzz_12.3.1.bb => harfbuzz_12.3.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_12.3.1.bb => harfbuzz_12.3.2.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_12.3.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb
index c22d6bd4b1..12bebc4bee 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "3ee7133f7f160b27bc34c058e147a559bb781c2b8208bc760db9fa9fa69cea07"
+SRC_URI[sha256sum] = "6f6db164359a2da5a84ef826615b448b33e6306067ad829d85d5b0bf936f1bb8"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.47.1


--===============8394411871999547478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61231.0", added "/usr/lib/libharfbuzz-icu.so.0.61232.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61231.0", added "/usr/lib/libharfbuzz-subset.so.0.61232.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.61231.0 /usr/lib/libharfbuzz.so.0.61231.0 /usr/lib/libharfbuzz-cairo.so.0.61231.0", added "/usr/lib/libharfbuzz-gobject.so.0.61232.0 /usr/lib/libharfbuzz.so.0.61232.0 /usr/lib/libharfbuzz-cairo.so.0.61232.0"
Changes to packages/x86-64-v3-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61231.0 to libharfbuzz-cairo.so.0.61232.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61231.0 to libharfbuzz-gobject.so.0.61232.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61231.0 to libharfbuzz-icu.so.0.61232.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61231.0 to libharfbuzz.so.0.61232.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61231.0 to libharfbuzz-subset.so.0.61232.0
  /usr/lib/libharfbuzz-cairo.so.0.61231.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61232.0
  /usr/lib/libharfbuzz-gobject.so.0.61231.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61232.0
  /usr/lib/libharfbuzz-icu.so.0.61231.0 moved to /usr/lib/libharfbuzz-icu.so.0.61232.0
  /usr/lib/libharfbuzz.so.0.61231.0 moved to /usr/lib/libharfbuzz.so.0.61232.0
  /usr/lib/libharfbuzz-subset.so.0.61231.0 moved to /usr/lib/libharfbuzz-subset.so.0.61232.0

--===============8394411871999547478==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-12.3.1-12.3.2.patch"

RnJvbSA1YWU3YzgyMDBiNWE3NDQyZjY2ZTExMjZiYmIzMzZhZGIzYTQyMjQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAxMToxOToyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGhh
cmZidXp6OiB1cGdyYWRlIDEyLjMuMSAtPiAxMi4zLjIKCi0tLQogLi4uL2hhcmZidXp6L3toYXJm
YnV6el8xMi4zLjEuYmIgPT4gaGFyZmJ1enpfMTIuMy4yLmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L3toYXJmYnV6el8xMi4zLjEuYmIgPT4gaGFyZmJ1enpf
MTIuMy4yLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJm
YnV6ei9oYXJmYnV6el8xMi4zLjEuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enov
aGFyZmJ1enpfMTIuMy4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el8xMi4zLjEuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el8xMi4zLjIuYmIKaW5kZXggYzIy
ZDZiZDRiMS4uMTJiZWJjNGJlZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hh
cmZidXp6L2hhcmZidXp6XzEyLjMuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFy
ZmJ1enovaGFyZmJ1enpfMTIuMy4yLmJiCkBAIC05LDcgKzksNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT1iOTg0MjliOGU4ZTNjMmE2N2NmZWYwMWU5OWU0ODkzZCBc
CiAgICAgICAgICAgICAgICAgICAgICIKIAogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0v
ZG93bmxvYWQvJHtQVn0vJHtCUE59LSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICIzZWU3MTMzZjdmMTYwYjI3YmMzNGMwNThlMTQ3YTU1OWJiNzgxYzJiODIwOGJjNzYwZGI5ZmE5
ZmE2OWNlYTA3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjZmNmRiMTY0MzU5YTJkYTVhODRlZjgy
NjYxNWI0NDhiMzNlNjMwNjA2N2FkODI5ZDg1ZDViMGJmOTM2ZjFiYjgiCiAKIERFUEVORFMgKz0g
ImdsaWItMi4wLW5hdGl2ZSIKIAotLSAKMi40Ny4xCgo=

--===============8394411871999547478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 12.3.1 [default] to 12.3.2 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "12.3.1" to "12.3.2"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 82463944 to 82463312 (-0%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/.debug/libharfbuzz-icu.so.0.61231.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61231.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61231.0 /usr/lib/.debug/libharfbuzz.so.0.61231.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61231.0", added "/usr/lib/.debug/libharfbuzz-gobject.so.0.61232.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61232.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61232.0 /usr/lib/.debug/libharfbuzz.so.0.61232.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61232.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 12.3.1 [default] to 12.3.2 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "12.3.1" to "12.3.2"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 12.3.1 [default] to 12.3.2 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "12.3.1" to "12.3.2"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 12.3.1 [default] to 12.3.2 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "12.3.1" to "12.3.2"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu-dev: PKGV changed from 12.3.1 [default] to 12.3.2 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu-dev: PV changed from "12.3.1" to "12.3.2"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61231.0", added "/usr/lib/libharfbuzz-icu.so.0.61232.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 12.3.1 [default] to 12.3.2 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "12.3.1" to "12.3.2"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 12.3.1 [default] to 12.3.2 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "12.3.1" to "12.3.2"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PKGSIZE changed from 5176623 to 5177058 (+0%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: FILELIST: directory renamed /usr/src/debug/harfbuzz/12.3.1/src -> /usr/src/debug/harfbuzz/12.3.2/src, directory renamed /usr/src/debug/harfbuzz/12.3.1/src/OT/Var/VARC -> /usr/src/debug/harfbuzz/12.3.2/src/OT/Var/VARC, directory renamed /usr/src/debug/harfbuzz/12.3.1/src/OT/Color/sbix -> /usr/src/debug/harfbuzz/12.3.2/src/OT/Color/sbix, directory renamed /usr/src/debug/harfbuzz/12.3.1/src/OT/glyf -> /usr/src/debug/harfbuzz/12.3.2/src/OT/glyf, directory renamed /usr/src/debug/harfbuzz/12.3.1/util -> /usr/src/debug/harfbuzz/12.3.2/util, directory renamed /usr/src/debug/harfbuzz/12.3.1/src/OT/Layout/GSUB -> /usr/src/debug/harfbuzz/12.3.2/src/OT/Layout/GSUB, directory renamed /usr/src/debug/harfbuzz/12.3.1/src/OT/name -> /usr/src/debug/harfbuzz/12.3.2/src/OT/name, directory renamed /usr/src/debug/harfbuzz/12.3.1/src/OT/Color/svg -> /usr/src/debug/harfbuzz/12.3.2/src/OT/Color/svg, directory renamed /usr/src/debug/harfbuzz/12.3.1/src/OT/L
 ayout/GPOS -> /usr/src/debug/harfbuzz/12.3.2/src/OT/Layout/GPOS, directory renamed /usr/src/debug/harfbuzz/12.3.1/src/OT/Color/CPAL -> /usr/src/debug/harfbuzz/12.3.2/src/OT/Color/CPAL, directory renamed /usr/src/debug/harfbuzz/12.3.1/src/OT/Color/COLR -> /usr/src/debug/harfbuzz/12.3.2/src/OT/Color/COLR, directory renamed /usr/src/debug/harfbuzz/12.3.1/src/OT/Color/CBDT -> /usr/src/debug/harfbuzz/12.3.2/src/OT/Color/CBDT, directory renamed /usr/src/debug/harfbuzz/12.3.1/src/OT/Layout -> /usr/src/debug/harfbuzz/12.3.2/src/OT/Layout, directory renamed /usr/src/debug/harfbuzz/12.3.1/src/graph -> /usr/src/debug/harfbuzz/12.3.2/src/graph, directory renamed /usr/src/debug/harfbuzz/12.3.1/src/OT/Layout/Common -> /usr/src/debug/harfbuzz/12.3.2/src/OT/Layout/Common, directory renamed /usr/src/debug/harfbuzz/12.3.1/src/OT/Layout/GDEF -> /usr/src/debug/harfbuzz/12.3.2/src/OT/Layout/GDEF
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 12.3.1 [default] to 12.3.2 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PV changed from "12.3.1" to "12.3.2"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 12.3.1 [default] to 12.3.2 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "12.3.1" to "12.3.2"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61231.0", added "/usr/lib/libharfbuzz-subset.so.0.61232.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 12.3.1 [default] to 12.3.2 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "12.3.1" to "12.3.2"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz-cairo.so.0.61231.0 /usr/lib/libharfbuzz.so.0.61231.0 /usr/lib/libharfbuzz-gobject.so.0.61231.0", added "/usr/lib/libharfbuzz.so.0.61232.0 /usr/lib/libharfbuzz-gobject.so.0.61232.0 /usr/lib/libharfbuzz-cairo.so.0.61232.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PKGV changed from 12.3.1 [default] to 12.3.2 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PV changed from "12.3.1" to "12.3.2"
packages/x86-64-v3-poky-linux/harfbuzz: SRC_URI changed from "https://github.com/harfbuzz/harfbuzz/releases//download/12.3.1/harfbuzz-12.3.1.tar.xz" to "https://github.com/harfbuzz/harfbuzz/releases//download/12.3.2/harfbuzz-12.3.2.tar.xz"
packages/x86-64-v3-poky-linux/harfbuzz: PKGV changed from 12.3.1 [default] to 12.3.2 [default]
packages/x86-64-v3-poky-linux/harfbuzz: PV changed from "12.3.1" to "12.3.2"
Changes to packages/x86-64-v3-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61231.0 to libharfbuzz-cairo.so.0.61232.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61231.0 to libharfbuzz-gobject.so.0.61232.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61231.0 to libharfbuzz-icu.so.0.61232.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61231.0 to libharfbuzz.so.0.61232.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61231.0 to libharfbuzz-subset.so.0.61232.0
  /usr/lib/libharfbuzz-cairo.so.0.61231.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61232.0
  /usr/lib/libharfbuzz-gobject.so.0.61231.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61232.0
  /usr/lib/libharfbuzz-icu.so.0.61231.0 moved to /usr/lib/libharfbuzz-icu.so.0.61232.0
  /usr/lib/libharfbuzz.so.0.61231.0 moved to /usr/lib/libharfbuzz.so.0.61232.0
  /usr/lib/libharfbuzz-subset.so.0.61231.0 moved to /usr/lib/libharfbuzz-subset.so.0.61232.0

--===============8394411871999547478==--

