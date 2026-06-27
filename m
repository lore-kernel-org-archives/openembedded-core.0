Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32DE8C43602
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 06:08:04 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50709.1782540478959811811
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 23:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aM3SVF+w;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=i7+kcJDB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019f07b12610-4577a03a-385e-4f0f-be4c-89b79d822d81-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782540478;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TWi4/OxKrjklPKncOrdvviWip5w3fU27Hw1yEfeCkuk=;
	b=aM3SVF+wTSCpx9tcXcxC/2AVcG+F9OcnvsN69GPESAAldAJciWP+7EiasLm5JUVA
	fe/wq1q5LMFHPb0kwHNxotkz6skTF9uLrNbHo9ja7sXyHegT0WrnZ/Y1CTknGj+p9IJ
	5kq0KVRLO+oVvE/yIOWUx6zBxuDrtO/VTFl8d2IU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782540478;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TWi4/OxKrjklPKncOrdvviWip5w3fU27Hw1yEfeCkuk=;
	b=i7+kcJDBnuZJ+bxa8Mj1U1Z/8JoqquI7Wc80GvJCOJ3Ylrfp4y+HeP6IsAeNObx8
	UDOi0210cfBhze/6acmXXseMFpDknW4CaXMaYELtW1wcyhCvlwwwATKr9crCwXijRV5
	RMRMWp98HtUdBci2nyf4CXzEBgO2ubHBztq8j7CY=
Content-Type: multipart/mixed; boundary="===============5103431747878651326=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pango: upgrading to 1.58.0 SUCCEEDED
Message-ID: <0101019f07b12610-4577a03a-385e-4f0f-be4c-89b79d822d81-000000@us-west-2.amazonses.com>
Date: Sat, 27 Jun 2026 06:07:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.27-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 06:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239682

--===============5103431747878651326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pango* to *1.58.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pango-upgrade-1.57.1-1.58.0.patch
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
From 4e626c48890ccf042179e7c4eb6f2f87807ae8ef Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 27 Jun 2026 05:51:56 +0000
Subject: [PATCH] pango: upgrade 1.57.1 -> 1.58.0

---
 .../recipes-graphics/pango/{pango_1.57.1.bb => pango_1.58.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.57.1.bb => pango_1.58.0.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.57.1.bb b/meta/recipes-graphics/pango/pango_1.58.0.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.57.1.bb
rename to meta/recipes-graphics/pango/pango_1.58.0.bb
index a9129dad4c..6e1aebad1d 100644
--- a/meta/recipes-graphics/pango/pango_1.57.1.bb
+++ b/meta/recipes-graphics/pango/pango_1.58.0.bb
@@ -18,7 +18,7 @@ UPSTREAM_CHECK_REGEX = "pango-(?P<pver>\d+\.(?!9\d+)\d+\.\d+)"
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
 
-SRC_URI[archive.sha256sum] = "e65d6d117080dc3aeeb7d8b4b3b518f7383aa2e6cfce23117c623cd624764c2f"
+SRC_URI[archive.sha256sum] = "bc5bad6213ad4886a47d1e80292fd850b64159b50db67917a43d9ea80ee2298a"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 DEPENDS += "${@' python3-docutils-native' if d.getVar('GIDOCGEN_ENABLED') == 'True' else ''}"
-- 
2.47.1


--===============5103431747878651326==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pango-upgrade-1.57.1-1.58.0.patch"

RnJvbSA0ZTYyNmM0ODg5MGNjZjA0MjE3OWU3YzRlYjZmMmY4NzgwN2FlOGVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjcgSnVuIDIwMjYgMDU6NTE6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
YW5nbzogdXBncmFkZSAxLjU3LjEgLT4gMS41OC4wCgotLS0KIC4uLi9yZWNpcGVzLWdyYXBoaWNz
L3BhbmdvL3twYW5nb18xLjU3LjEuYmIgPT4gcGFuZ29fMS41OC4wLmJifSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy9wYW5nby97cGFuZ29fMS41Ny4xLmJiID0+IHBhbmdvXzEuNTguMC5iYn0g
KDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGFuZ28vcGFuZ29fMS41
Ny4xLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BhbmdvL3BhbmdvXzEuNTguMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGFuZ28v
cGFuZ29fMS41Ny4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGFuZ28vcGFu
Z29fMS41OC4wLmJiCmluZGV4IGE5MTI5ZGFkNGMuLjZlMWFlYmFkMWQgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9wYW5nby9wYW5nb18xLjU3LjEuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3BhbmdvL3BhbmdvXzEuNTguMC5iYgpAQCAtMTgsNyArMTgsNyBAQCBVUFNU
UkVBTV9DSEVDS19SRUdFWCA9ICJwYW5nby0oP1A8cHZlcj5cZCtcLig/ITlcZCspXGQrXC5cZCsp
IgogR0lSX01FU09OX0VOQUJMRV9GTEFHID0gImVuYWJsZWQiCiBHSVJfTUVTT05fRElTQUJMRV9G
TEFHID0gImRpc2FibGVkIgogCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJlNjVkNmQx
MTcwODBkYzNhZWViN2Q4YjRiM2I1MThmNzM4M2FhMmU2Y2ZjZTIzMTE3YzYyM2NkNjI0NzY0YzJm
IgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiYmM1YmFkNjIxM2FkNDg4NmE0N2QxZTgw
MjkyZmQ4NTBiNjQxNTliNTBkYjY3OTE3YTQzZDllYTgwZWUyMjk4YSIKIAogREVQRU5EUyA9ICJn
bGliLTIuMCBnbGliLTIuMC1uYXRpdmUgZm9udGNvbmZpZyBmcmVldHlwZSB2aXJ0dWFsL2xpYmlj
b252IGNhaXJvIGhhcmZidXp6IGZyaWJpZGkiCiBERVBFTkRTICs9ICIke0AnIHB5dGhvbjMtZG9j
dXRpbHMtbmF0aXZlJyBpZiBkLmdldFZhcignR0lET0NHRU5fRU5BQkxFRCcpID09ICdUcnVlJyBl
bHNlICcnfSIKLS0gCjIuNDcuMQoK

--===============5103431747878651326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/pango: PV changed from "1.57.1" to "1.58.0"
packages/x86-64-v3-poky-linux/pango: PKGV changed from 1.57.1 [default] to 1.58.0 [default]
packages/x86-64-v3-poky-linux/pango: SRC_URI changed from "https://download.gnome.org/sources//pango/1.57/pango-1.57.1.tar.xz;name=archive" to "https://download.gnome.org/sources//pango/1.58/pango-1.58.0.tar.xz;name=archive"
packages/x86-64-v3-poky-linux/pango/pango-dbg: FILELIST: removed "/usr/lib/.debug/libpangoxft-1.0.so.0.5701.0 /usr/lib/.debug/libpango-1.0.so.0.5701.0 /usr/lib/.debug/libpangoft2-1.0.so.0.5701.0 /usr/lib/.debug/libpangocairo-1.0.so.0.5701.0", added "/usr/lib/.debug/libpango-1.0.so.0.5800.0 /usr/lib/.debug/libpangoxft-1.0.so.0.5800.0 /usr/lib/.debug/libpangocairo-1.0.so.0.5800.0 /usr/lib/.debug/libpangoft2-1.0.so.0.5800.0"
packages/x86-64-v3-poky-linux/pango/pango-dbg: PV changed from "1.57.1" to "1.58.0"
packages/x86-64-v3-poky-linux/pango/pango-dbg: PKGSIZE changed from 2367528 to 2380312 (+1%)
packages/x86-64-v3-poky-linux/pango/pango-dbg: PKGV changed from 1.57.1 [default] to 1.58.0 [default]
packages/x86-64-v3-poky-linux/pango/pango-dev: PV changed from "1.57.1" to "1.58.0"
packages/x86-64-v3-poky-linux/pango/pango-dev: PKGSIZE changed from 1588642 to 1610688 (+1%)
packages/x86-64-v3-poky-linux/pango/pango-dev: PKGV changed from 1.57.1 [default] to 1.58.0 [default]
packages/x86-64-v3-poky-linux/pango/pango-doc: PV changed from "1.57.1" to "1.58.0"
packages/x86-64-v3-poky-linux/pango/pango-doc: PKGV changed from 1.57.1 [default] to 1.58.0 [default]
packages/x86-64-v3-poky-linux/pango/pango-locale: PV changed from "1.57.1" to "1.58.0"
packages/x86-64-v3-poky-linux/pango/pango-locale: PKGV changed from 1.57.1 [default] to 1.58.0 [default]
packages/x86-64-v3-poky-linux/pango/pango-src: FILELIST: directory renamed /usr/src/debug/pango/1.57.1/pango -> /usr/src/debug/pango/1.58.0/pango, directory renamed /usr/src/debug/pango/1.57.1/pango/json -> /usr/src/debug/pango/1.58.0/pango/json, directory renamed /usr/src/debug/pango/1.57.1/utils -> /usr/src/debug/pango/1.58.0/utils
packages/x86-64-v3-poky-linux/pango/pango-src: PV changed from "1.57.1" to "1.58.0"
packages/x86-64-v3-poky-linux/pango/pango-src: PKGSIZE changed from 2162499 to 2180341 (+1%)
packages/x86-64-v3-poky-linux/pango/pango-src: PKGV changed from 1.57.1 [default] to 1.58.0 [default]
packages/x86-64-v3-poky-linux/pango/pango-staticdev: PV changed from "1.57.1" to "1.58.0"
packages/x86-64-v3-poky-linux/pango/pango-staticdev: PKGV changed from 1.57.1 [default] to 1.58.0 [default]
packages/x86-64-v3-poky-linux/pango/pango: FILELIST: removed "/usr/lib/libpangoft2-1.0.so.0.5701.0 /usr/lib/libpango-1.0.so.0.5701.0 /usr/lib/libpangoxft-1.0.so.0.5701.0 /usr/lib/libpangocairo-1.0.so.0.5701.0", added "/usr/lib/libpangocairo-1.0.so.0.5800.0 /usr/lib/libpangoxft-1.0.so.0.5800.0 /usr/lib/libpangoft2-1.0.so.0.5800.0 /usr/lib/libpango-1.0.so.0.5800.0"
packages/x86-64-v3-poky-linux/pango/pango: PV changed from "1.57.1" to "1.58.0"
packages/x86-64-v3-poky-linux/pango/pango: PKGSIZE changed from 902079 to 904047 (+0%)
packages/x86-64-v3-poky-linux/pango/pango: PKGV changed from 1.57.1 [default] to 1.58.0 [default]
Changes to packages/x86-64-v3-poky-linux/pango (sysroot):
  /usr/lib/libpango-1.0.so.0 changed symlink target from libpango-1.0.so.0.5701.0 to libpango-1.0.so.0.5800.0
  /usr/lib/libpangocairo-1.0.so.0 changed symlink target from libpangocairo-1.0.so.0.5701.0 to libpangocairo-1.0.so.0.5800.0
  /usr/lib/libpangoft2-1.0.so.0 changed symlink target from libpangoft2-1.0.so.0.5701.0 to libpangoft2-1.0.so.0.5800.0
  /usr/lib/libpangoxft-1.0.so.0 changed symlink target from libpangoxft-1.0.so.0.5701.0 to libpangoxft-1.0.so.0.5800.0
  /usr/lib/libpango-1.0.so.0.5701.0 moved to /usr/lib/libpango-1.0.so.0.5800.0
  /usr/lib/libpangocairo-1.0.so.0.5701.0 moved to /usr/lib/libpangocairo-1.0.so.0.5800.0
  /usr/lib/libpangoft2-1.0.so.0.5701.0 moved to /usr/lib/libpangoft2-1.0.so.0.5800.0
  /usr/lib/libpangoxft-1.0.so.0.5701.0 moved to /usr/lib/libpangoxft-1.0.so.0.5800.0
Changes to packages/x86_64-linux/pkgconf-native (sysroot):
  /usr/lib/libpkgconf.so changed symlink target from libpkgconf.so.8.0.0 to libpkgconf.so.7.0.0
  /usr/lib/libpkgconf.so.8.0.0 moved to /usr/lib/libpkgconf.so.7.0.0
  /usr/lib/libpkgconf.so.8 moved to /usr/lib/libpkgconf.so.7
  /usr/bin/spdxtool was removed

--===============5103431747878651326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/pango/pango: FILELIST: removed "/usr/lib/libpangocairo-1.0.so.0.5701.0 /usr/lib/libpangoft2-1.0.so.0.5701.0 /usr/lib/libpangoxft-1.0.so.0.5701.0 /usr/lib/libpango-1.0.so.0.5701.0", added "/usr/lib/libpangoxft-1.0.so.0.5800.0 /usr/lib/libpango-1.0.so.0.5800.0 /usr/lib/libpangoft2-1.0.so.0.5800.0 /usr/lib/libpangocairo-1.0.so.0.5800.0"
Changes to packages/x86-64-v3-poky-linux/pango (sysroot):
  /usr/lib/libpango-1.0.so.0 changed symlink target from libpango-1.0.so.0.5701.0 to libpango-1.0.so.0.5800.0
  /usr/lib/libpangocairo-1.0.so.0 changed symlink target from libpangocairo-1.0.so.0.5701.0 to libpangocairo-1.0.so.0.5800.0
  /usr/lib/libpangoft2-1.0.so.0 changed symlink target from libpangoft2-1.0.so.0.5701.0 to libpangoft2-1.0.so.0.5800.0
  /usr/lib/libpangoxft-1.0.so.0 changed symlink target from libpangoxft-1.0.so.0.5701.0 to libpangoxft-1.0.so.0.5800.0
  /usr/lib/libpango-1.0.so.0.5701.0 moved to /usr/lib/libpango-1.0.so.0.5800.0
  /usr/lib/libpangocairo-1.0.so.0.5701.0 moved to /usr/lib/libpangocairo-1.0.so.0.5800.0
  /usr/lib/libpangoft2-1.0.so.0.5701.0 moved to /usr/lib/libpangoft2-1.0.so.0.5800.0
  /usr/lib/libpangoxft-1.0.so.0.5701.0 moved to /usr/lib/libpangoxft-1.0.so.0.5800.0
Changes to packages/x86_64-linux/pkgconf-native (sysroot):
  /usr/lib/libpkgconf.so changed symlink target from libpkgconf.so.8.0.0 to libpkgconf.so.7.0.0
  /usr/lib/libpkgconf.so.8.0.0 moved to /usr/lib/libpkgconf.so.7.0.0
  /usr/lib/libpkgconf.so.8 moved to /usr/lib/libpkgconf.so.7
  /usr/bin/spdxtool was removed

--===============5103431747878651326==--

