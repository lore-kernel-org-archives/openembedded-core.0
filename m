Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96160CD4846
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:48 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2368.1762384583580536215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=wAJqR36Z;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Dc1o7GLi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019a564ed054-b326c1bb-0d7b-4858-896b-6008725164cf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384597;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EpbI9H+bX1pzQsSjUEs4F+hQdz2QNRoDNDKvITj90Ck=;
	b=wAJqR36ZH3IpYPzngvC9UDfjtmWKwFXxD2ZRy4W0Qgpx56zHlxfOAILrRCwqT/1E
	i1qVUv9SFvZsBvs+UZi/tAJhXPm60RYdv+M7Cz7z0oPwO0kFxlHBRtK9WJ/uU9FOUoh
	SSSR0awCqL1Bb3aTTOn8D0BvIulrV+mSgkI3FgUs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384597;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EpbI9H+bX1pzQsSjUEs4F+hQdz2QNRoDNDKvITj90Ck=;
	b=Dc1o7GLiC8LfP4xis3VrBgPGsIuVAi+BS62l8A+yEIUxTPp4pFtNz1qcq+ld4zbN
	dFG84NAnEE4zEYAiKFFwDz+b2lXp9p0mfMfG4dR83PNR0oNTZeUUlLW1/laXV7aK9T+
	wSv6YRhCREkM2OwC3VOjZUZFfDvmxGlPkepwu0CE=
Content-Type: multipart/mixed; boundary="===============6657375335846182961=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libnotify: upgrading to 0.8.7 SUCCEEDED
Message-ID: <0101019a564ed054-b326c1bb-0d7b-4858-896b-6008725164cf-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225875

--===============6657375335846182961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libnotify* to *0.8.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libnotify-upgrade-0.8.6-0.8.7.patch
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
From d6de716004181873ca82abf15cb8cf4d4ee9a3a0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 20:04:44 +0000
Subject: [PATCH] libnotify: upgrade 0.8.6 -> 0.8.7

---
 .../libnotify/{libnotify_0.8.6.bb => libnotify_0.8.7.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libnotify/{libnotify_0.8.6.bb => libnotify_0.8.7.bb} (93%)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb b/meta/recipes-gnome/libnotify/libnotify_0.8.7.bb
similarity index 93%
rename from meta/recipes-gnome/libnotify/libnotify_0.8.6.bb
rename to meta/recipes-gnome/libnotify/libnotify_0.8.7.bb
index 6ff7ee4be1..1bea8ae319 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.8.7.bb
@@ -20,7 +20,7 @@ inherit gnomebase gi-docgen features_check gobject-introspection
 # depends on gtk+3 if tests are enabled
 ANY_OF_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'tests', '${GTK3DISTROFEATURES}', '', d)}"
 
-SRC_URI[archive.sha256sum] = "c5540aaefb60e1d63b1c587c05f2284ebe72ece7d0c0e5e4a778cfd5844b6b58"
+SRC_URI[archive.sha256sum] = "4be15202ec4184fce1ac15997ece5530d2be32fe9573875aeb10e3b573858748"
 
 EXTRA_OEMESON = "-Dman=false"
 
-- 
2.47.1


--===============6657375335846182961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libnotify: SRC_URI changed from "https://download.gnome.org/sources//libnotify/0.8/libnotify-0.8.6.tar.xz;name=archive" to "https://download.gnome.org/sources//libnotify/0.8/libnotify-0.8.7.tar.xz;name=archive"
packages/x86-64-v3-poky-linux/libnotify: PKGV changed from 0.8.6 [default] to 0.8.7 [default]
packages/x86-64-v3-poky-linux/libnotify: PV changed from "0.8.6" to "0.8.7"
packages/x86-64-v3-poky-linux/libnotify/libnotify-dbg: PKGV changed from 0.8.6 [default] to 0.8.7 [default]
packages/x86-64-v3-poky-linux/libnotify/libnotify-dbg: PKGSIZE changed from 158448 to 170720 (+8%)
packages/x86-64-v3-poky-linux/libnotify/libnotify-dbg: PV changed from "0.8.6" to "0.8.7"
packages/x86-64-v3-poky-linux/libnotify/libnotify-dev: PKGV changed from 0.8.6 [default] to 0.8.7 [default]
packages/x86-64-v3-poky-linux/libnotify/libnotify-dev: PKGSIZE changed from 70863 to 72549 (+2%)
packages/x86-64-v3-poky-linux/libnotify/libnotify-dev: PV changed from "0.8.6" to "0.8.7"
packages/x86-64-v3-poky-linux/libnotify/libnotify-doc: PKGV changed from 0.8.6 [default] to 0.8.7 [default]
packages/x86-64-v3-poky-linux/libnotify/libnotify-doc: PV changed from "0.8.6" to "0.8.7"
packages/x86-64-v3-poky-linux/libnotify/libnotify-locale: PKGV changed from 0.8.6 [default] to 0.8.7 [default]
packages/x86-64-v3-poky-linux/libnotify/libnotify-locale: PV changed from "0.8.6" to "0.8.7"
packages/x86-64-v3-poky-linux/libnotify/libnotify-src: PKGV changed from 0.8.6 [default] to 0.8.7 [default]
packages/x86-64-v3-poky-linux/libnotify/libnotify-src: PV changed from "0.8.6" to "0.8.7"
packages/x86-64-v3-poky-linux/libnotify/libnotify-staticdev: PKGV changed from 0.8.6 [default] to 0.8.7 [default]
packages/x86-64-v3-poky-linux/libnotify/libnotify-staticdev: PV changed from "0.8.6" to "0.8.7"
packages/x86-64-v3-poky-linux/libnotify/libnotify: PKGV changed from 0.8.6 [default] to 0.8.7 [default]
packages/x86-64-v3-poky-linux/libnotify/libnotify: PKGSIZE changed from 83342 to 83502 (+0%)
packages/x86-64-v3-poky-linux/libnotify/libnotify: PV changed from "0.8.6" to "0.8.7"

--===============6657375335846182961==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libnotify-upgrade-0.8.6-0.8.7.patch"

RnJvbSBkNmRlNzE2MDA0MTgxODczY2E4MmFiZjE1Y2I4Y2Y0ZDRlZTlhM2EwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAyMDowNDo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Ym5vdGlmeTogdXBncmFkZSAwLjguNiAtPiAwLjguNwoKLS0tCiAuLi4vbGlibm90aWZ5L3tsaWJu
b3RpZnlfMC44LjYuYmIgPT4gbGlibm90aWZ5XzAuOC43LmJifSAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ25vbWUvbGlibm90aWZ5L3tsaWJub3RpZnlfMC44LjYuYmIgPT4gbGlibm90aWZ5XzAu
OC43LmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJub3RpZnkv
bGlibm90aWZ5XzAuOC42LmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYm5vdGlmeS9saWJub3Rp
ZnlfMC44LjcuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWdub21lL2xpYm5vdGlmeS9saWJub3RpZnlfMC44LjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1nbm9tZS9saWJub3RpZnkvbGlibm90aWZ5XzAuOC43LmJiCmluZGV4IDZmZjdlZTRiZTEuLjFi
ZWE4YWUzMTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJub3RpZnkvbGlibm90
aWZ5XzAuOC42LmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJub3RpZnkvbGlibm90aWZ5
XzAuOC43LmJiCkBAIC0yMCw3ICsyMCw3IEBAIGluaGVyaXQgZ25vbWViYXNlIGdpLWRvY2dlbiBm
ZWF0dXJlc19jaGVjayBnb2JqZWN0LWludHJvc3BlY3Rpb24KICMgZGVwZW5kcyBvbiBndGsrMyBp
ZiB0ZXN0cyBhcmUgZW5hYmxlZAogQU5ZX09GX0RJU1RST19GRUFUVVJFUyA9ICIke0BiYi51dGls
cy5jb250YWlucygnUEFDS0FHRUNPTkZJRycsICd0ZXN0cycsICcke0dUSzNESVNUUk9GRUFUVVJF
U30nLCAnJywgZCl9IgogCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJjNTU0MGFhZWZi
NjBlMWQ2M2IxYzU4N2MwNWYyMjg0ZWJlNzJlY2U3ZDBjMGU1ZTRhNzc4Y2ZkNTg0NGI2YjU4Igor
U1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNGJlMTUyMDJlYzQxODRmY2UxYWMxNTk5N2Vj
ZTU1MzBkMmJlMzJmZTk1NzM4NzVhZWIxMGUzYjU3Mzg1ODc0OCIKIAogRVhUUkFfT0VNRVNPTiA9
ICItRG1hbj1mYWxzZSIKIAotLSAKMi40Ny4xCgo=

--===============6657375335846182961==--

