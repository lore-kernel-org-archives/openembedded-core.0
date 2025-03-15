Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14BE9C36006
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:43 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.10336.1742048299778298302
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=iJRIJYkq;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=OnMhsScx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101959a2bd25f-0c2697c3-7b3b-47dd-818e-5ee9daa7a9ef-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048318;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6GEyfU/AkZuz1++OQk8yhn0E9dRJ0z3mhDcbMM1fnrk=;
	b=iJRIJYkqyddtgCrW84/0o0JxMFhx8kdkOEftLCk5t1GoCyn13EOhFZ3ht8n1JbJf
	aWDXeXPJA5eixldPZbvULkbYRszvNN8etRY1fK8jzfnPk0qUrrbxL/eQKppzn3g9xJn
	l2lL6jgY8ETBnJz3nh6tQ6m4S8OIydalGYjhdx7c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048318;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6GEyfU/AkZuz1++OQk8yhn0E9dRJ0z3mhDcbMM1fnrk=;
	b=OnMhsScx3CCNZYm3+PxcUzcByvbAS330P8E2I8ymy4uMiUmQcPFpAc1xYCzGi/w/
	jNiO911OEKEWgCoINFCinUCP6XEgRKuTD7DKJgd5PfThWmLmq1hRojTfby2jxJADgW7
	3C0j5nXTNjGxuEzAHBVpzhwBY79wevtWi9kDBfXU=
Content-Type: multipart/mixed; boundary="===============2355347498102860851=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcap: upgrading to 2.75 SUCCEEDED
Message-ID: <010101959a2bd25f-0c2697c3-7b3b-47dd-818e-5ee9daa7a9ef-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212974

--===============2355347498102860851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libcap* to *2.75* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libcap-upgrade-2.74-2.75.patch
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
From ed0d35a5485f11d615b58d325d73b34d2904d0cb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 14:08:25 +0000
Subject: [PATCH] libcap: upgrade 2.74 -> 2.75

---
 ...1-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch | 2 +-
 ...1-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch | 2 +-
 .../libcap/files/0002-tests-do-not-run-target-executables.patch | 2 +-
 meta/recipes-support/libcap/{libcap_2.74.bb => libcap_2.75.bb}  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.74.bb => libcap_2.75.bb} (96%)

diff --git a/meta/recipes-support/libcap/files/0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch b/meta/recipes-support/libcap/files/0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch
index c576351e81..4fa535c500 100644
--- a/meta/recipes-support/libcap/files/0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch
+++ b/meta/recipes-support/libcap/files/0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch
@@ -1,4 +1,4 @@
-From bda8da622bd3f4d8b0e577387e988ce364b917c4 Mon Sep 17 00:00:00 2001
+From 3b47c1f8d5255ac06e80a18fbd19c510aca50883 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 23 Jun 2016 16:26:43 +0800
 Subject: [PATCH] Ensure the XATTR_NAME_CAPS is defined when it is used
diff --git a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
index f2d11b2983..3267315d52 100644
--- a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
+++ b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
@@ -1,4 +1,4 @@
-From 1343e4ee17bb3f72e6b244706cacbeb16463c5d7 Mon Sep 17 00:00:00 2001
+From 2d2303884b29256ab7aad24016a9664f5589bd03 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 14 Oct 2021 15:57:36 +0800
 Subject: [PATCH] nativesdk-libcap: Raise the size of arrays containing dl
diff --git a/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch b/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
index 8cabed6342..504e2a6116 100644
--- a/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
+++ b/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
@@ -1,4 +1,4 @@
-From 5846ba594bedd66c8fd216cad6518f7be11b7a92 Mon Sep 17 00:00:00 2001
+From 1e49115dc88881c4d2448453a7ce9fa86fa83737 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 20 Dec 2019 16:54:05 +0100
 Subject: [PATCH] tests: do not run target executables
diff --git a/meta/recipes-support/libcap/libcap_2.74.bb b/meta/recipes-support/libcap/libcap_2.75.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.74.bb
rename to meta/recipes-support/libcap/libcap_2.75.bb
index 75019fd35f..12ce6cb3de 100644
--- a/meta/recipes-support/libcap/libcap_2.74.bb
+++ b/meta/recipes-support/libcap/libcap_2.75.bb
@@ -19,7 +19,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "eb85271f2893188644b6451cec8ce99f4541498f16ff9f84877c2fc872717714"
+SRC_URI[sha256sum] = "de4e7e064c9ba451d5234dd46e897d7c71c96a9ebf9a0c445bc04f4742d83632"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.44.1


--===============2355347498102860851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libcap: SRC_URI changed from "https://cdn.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.74.tar.xz file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch file://0002-tests-do-not-run-target-executables.patch" to "https://cdn.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.75.tar.xz file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch file://0002-tests-do-not-run-target-executables.patch"
packages/core2-64-poky-linux/libcap: PKGV changed from 2.74 [default] to 2.75 [default]
packages/core2-64-poky-linux/libcap: PV changed from "2.74" to "2.75"
packages/core2-64-poky-linux/libcap/libcap-bin: PKGV changed from 2.74 [default] to 2.75 [default]
packages/core2-64-poky-linux/libcap/libcap-bin: PV changed from "2.74" to "2.75"
packages/core2-64-poky-linux/libcap/libcap-dbg: FILELIST: removed "/usr/lib/.debug/libpsx.so.2.74 /usr/lib/.debug/libcap.so.2.74", added "/usr/lib/.debug/libpsx.so.2.75 /usr/lib/.debug/libcap.so.2.75"
packages/core2-64-poky-linux/libcap/libcap-dbg: PKGV changed from 2.74 [default] to 2.75 [default]
packages/core2-64-poky-linux/libcap/libcap-dbg: PV changed from "2.74" to "2.75"
packages/core2-64-poky-linux/libcap/libcap-dev: PKGV changed from 2.74 [default] to 2.75 [default]
packages/core2-64-poky-linux/libcap/libcap-dev: PV changed from "2.74" to "2.75"
packages/core2-64-poky-linux/libcap/libcap-doc: PKGV changed from 2.74 [default] to 2.75 [default]
packages/core2-64-poky-linux/libcap/libcap-doc: PV changed from "2.74" to "2.75"
packages/core2-64-poky-linux/libcap/libcap-locale: PKGV changed from 2.74 [default] to 2.75 [default]
packages/core2-64-poky-linux/libcap/libcap-locale: PV changed from "2.74" to "2.75"
packages/core2-64-poky-linux/libcap/libcap-src: PKGV changed from 2.74 [default] to 2.75 [default]
packages/core2-64-poky-linux/libcap/libcap-src: PKGSIZE changed from 227424 to 227410 (-0%)
packages/core2-64-poky-linux/libcap/libcap-src: PV changed from "2.74" to "2.75"
packages/core2-64-poky-linux/libcap/libcap-staticdev: PKGV changed from 2.74 [default] to 2.75 [default]
packages/core2-64-poky-linux/libcap/libcap-staticdev: PV changed from "2.74" to "2.75"
packages/core2-64-poky-linux/libcap/libcap: FILELIST: removed "/usr/lib/libcap.so.2.74 /usr/lib/libpsx.so.2.74", added "/usr/lib/libcap.so.2.75 /usr/lib/libpsx.so.2.75"
packages/core2-64-poky-linux/libcap/libcap: PKGV changed from 2.74 [default] to 2.75 [default]
packages/core2-64-poky-linux/libcap/libcap: PV changed from "2.74" to "2.75"
Changes to packages/core2-64-poky-linux/libcap (sysroot):
  /usr/lib/libcap.so.2 changed symlink target from libcap.so.2.74 to libcap.so.2.75
  /usr/lib/libpsx.so.2 changed symlink target from libpsx.so.2.74 to libpsx.so.2.75
  /usr/lib/libcap.so.2.74 moved to /usr/lib/libcap.so.2.75
  /usr/lib/libpsx.so.2.74 moved to /usr/lib/libpsx.so.2.75
Changes to packages/x86_64-linux/libcap-native (sysroot):
  /lib/libcap.so.2 changed symlink target from libcap.so.2.74 to libcap.so.2.75
  /usr/lib/libpsx.so.2 changed symlink target from libpsx.so.2.74 to libpsx.so.2.75
  /lib/libcap.so.2.74 moved to /lib/libcap.so.2.75
  /usr/lib/libpsx.so.2.74 moved to /usr/lib/libpsx.so.2.75

--===============2355347498102860851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libcap/libcap: FILELIST: removed "/usr/lib/libpsx.so.2.74 /usr/lib/libcap.so.2.74", added "/usr/lib/libpsx.so.2.75 /usr/lib/libcap.so.2.75"
Changes to packages/core2-64-poky-linux/libcap (sysroot):
  /usr/lib/libcap.so.2 changed symlink target from libcap.so.2.74 to libcap.so.2.75
  /usr/lib/libpsx.so.2 changed symlink target from libpsx.so.2.74 to libpsx.so.2.75
  /usr/lib/libcap.so.2.74 moved to /usr/lib/libcap.so.2.75
  /usr/lib/libpsx.so.2.74 moved to /usr/lib/libpsx.so.2.75
Changes to packages/x86_64-linux/libcap-native (sysroot):
  /lib/libcap.so.2 changed symlink target from libcap.so.2.74 to libcap.so.2.75
  /usr/lib/libpsx.so.2 changed symlink target from libpsx.so.2.74 to libpsx.so.2.75
  /lib/libcap.so.2.74 moved to /lib/libcap.so.2.75
  /usr/lib/libpsx.so.2.74 moved to /usr/lib/libpsx.so.2.75

--===============2355347498102860851==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libcap-upgrade-2.74-2.75.patch"

RnJvbSBlZDBkMzVhNTQ4NWYxMWQ2MTViNThkMzI1ZDczYjM0ZDI5MDRkMGNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMTQ6MDg6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJjYXA6IHVwZ3JhZGUgMi43NCAtPiAyLjc1CgotLS0KIC4uLjEtZW5zdXJlLXRoZS1YQVRUUl9O
QU1FX0NBUFMtaXMtZGVmaW5lZC13aGVuLWl0LWlzLXVzZS5wYXRjaCB8IDIgKy0KIC4uLjEtbmF0
aXZlc2RrLWxpYmNhcC1SYWlzZS10aGUtc2l6ZS1vZi1hcnJheXMtY29udGFpbmluZy5wYXRjaCB8
IDIgKy0KIC4uLi9saWJjYXAvZmlsZXMvMDAwMi10ZXN0cy1kby1ub3QtcnVuLXRhcmdldC1leGVj
dXRhYmxlcy5wYXRjaCB8IDIgKy0KIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC97bGliY2Fw
XzIuNzQuYmIgPT4gbGliY2FwXzIuNzUuYmJ9ICB8IDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0
L2xpYmNhcC97bGliY2FwXzIuNzQuYmIgPT4gbGliY2FwXzIuNzUuYmJ9ICg5NiUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwL2ZpbGVzLzAwMDEtZW5zdXJlLXRoZS1Y
QVRUUl9OQU1FX0NBUFMtaXMtZGVmaW5lZC13aGVuLWl0LWlzLXVzZS5wYXRjaCBiL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYmNhcC9maWxlcy8wMDAxLWVuc3VyZS10aGUtWEFUVFJfTkFNRV9DQVBT
LWlzLWRlZmluZWQtd2hlbi1pdC1pcy11c2UucGF0Y2gKaW5kZXggYzU3NjM1MWU4MS4uNGZhNTM1
YzUwMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwL2ZpbGVzLzAwMDEt
ZW5zdXJlLXRoZS1YQVRUUl9OQU1FX0NBUFMtaXMtZGVmaW5lZC13aGVuLWl0LWlzLXVzZS5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAvZmlsZXMvMDAwMS1lbnN1cmUtdGhl
LVhBVFRSX05BTUVfQ0FQUy1pcy1kZWZpbmVkLXdoZW4taXQtaXMtdXNlLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBiZGE4ZGE2MjJiZDNmNGQ4YjBlNTc3Mzg3ZTk4OGNlMzY0YjkxN2M0IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzYjQ3YzFmOGQ1MjU1YWMwNmU4MGExOGZiZDE5
YzUxMGFjYTUwODgzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm95IExpIDxyb25n
cWluZy5saUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVGh1LCAyMyBKdW4gMjAxNiAxNjoyNjo0MyAr
MDgwMAogU3ViamVjdDogW1BBVENIXSBFbnN1cmUgdGhlIFhBVFRSX05BTUVfQ0FQUyBpcyBkZWZp
bmVkIHdoZW4gaXQgaXMgdXNlZApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGli
Y2FwL2ZpbGVzLzAwMDEtbmF0aXZlc2RrLWxpYmNhcC1SYWlzZS10aGUtc2l6ZS1vZi1hcnJheXMt
Y29udGFpbmluZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC9maWxlcy8wMDAx
LW5hdGl2ZXNkay1saWJjYXAtUmFpc2UtdGhlLXNpemUtb2YtYXJyYXlzLWNvbnRhaW5pbmcucGF0
Y2gKaW5kZXggZjJkMTFiMjk4My4uMzI2NzMxNWQ1MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGliY2FwL2ZpbGVzLzAwMDEtbmF0aXZlc2RrLWxpYmNhcC1SYWlzZS10aGUtc2l6
ZS1vZi1hcnJheXMtY29udGFpbmluZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJjYXAvZmlsZXMvMDAwMS1uYXRpdmVzZGstbGliY2FwLVJhaXNlLXRoZS1zaXplLW9mLWFycmF5
cy1jb250YWluaW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxMzQzZTRlZTE3YmIzZjcy
ZTZiMjQ0NzA2Y2FjYmViMTY0NjNjNWQ3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAy
ZDIzMDM4ODRiMjkyNTZhYjdhYWQyNDAxNmE5NjY0ZjU1ODliZDAzIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0
ZTogVGh1LCAxNCBPY3QgMjAyMSAxNTo1NzozNiArMDgwMAogU3ViamVjdDogW1BBVENIXSBuYXRp
dmVzZGstbGliY2FwOiBSYWlzZSB0aGUgc2l6ZSBvZiBhcnJheXMgY29udGFpbmluZyBkbApkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwL2ZpbGVzLzAwMDItdGVzdHMtZG8t
bm90LXJ1bi10YXJnZXQtZXhlY3V0YWJsZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJjYXAvZmlsZXMvMDAwMi10ZXN0cy1kby1ub3QtcnVuLXRhcmdldC1leGVjdXRhYmxlcy5wYXRj
aAppbmRleCA4Y2FiZWQ2MzQyLi41MDRlMmE2MTE2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJjYXAvZmlsZXMvMDAwMi10ZXN0cy1kby1ub3QtcnVuLXRhcmdldC1leGVjdXRh
Ymxlcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAvZmlsZXMvMDAwMi10
ZXN0cy1kby1ub3QtcnVuLXRhcmdldC1leGVjdXRhYmxlcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gNTg0NmJhNTk0YmVkZDY2YzhmZDIxNmNhZDY1MThmN2JlMTFiN2E5MiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gMWU0OTExNWRjODg4ODFjNGQyNDQ4NDUzYTdjZTlmYTg2ZmE4
MzczNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxh
bGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogRnJpLCAyMCBEZWMgMjAxOSAxNjo1NDowNSAr
MDEwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0czogZG8gbm90IHJ1biB0YXJnZXQgZXhlY3V0YWJs
ZXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC9saWJjYXBfMi43NC5i
YiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC9saWJjYXBfMi43NS5iYgpzaW1pbGFyaXR5
IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAvbGliY2Fw
XzIuNzQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC9saWJjYXBfMi43
NS5iYgppbmRleCA3NTAxOWZkMzVmLi4xMmNlNmNiM2RlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9saWJjYXAvbGliY2FwXzIuNzQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvbGliY2FwL2xpYmNhcF8yLjc1LmJiCkBAIC0xOSw3ICsxOSw3IEBAIFNSQ19VUkkgPSAiJHtL
RVJORUxPUkdfTUlSUk9SfS9saW51eC9saWJzL3NlY3VyaXR5L2xpbnV4LXByaXZzLyR7QlBOfTIv
JHtCUE59LSR7CiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmVzZGsgPSAiIFwKICAgICAgICAg
ICAgZmlsZTovLzAwMDEtbmF0aXZlc2RrLWxpYmNhcC1SYWlzZS10aGUtc2l6ZS1vZi1hcnJheXMt
Y29udGFpbmluZy5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJl
Yjg1MjcxZjI4OTMxODg2NDRiNjQ1MWNlYzhjZTk5ZjQ1NDE0OThmMTZmZjlmODQ4NzdjMmZjODcy
NzE3NzE0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImRlNGU3ZTA2NGM5YmE0NTFkNTIzNGRkNDZl
ODk3ZDdjNzFjOTZhOWViZjlhMGM0NDViYzA0ZjQ3NDJkODM2MzIiCiAKIFVQU1RSRUFNX0NIRUNL
X1VSSSA9ICJodHRwczovL3d3dy5rZXJuZWwub3JnL3B1Yi9saW51eC9saWJzL3NlY3VyaXR5L2xp
bnV4LXByaXZzLyR7QlBOfTIvIgogCi0tIAoyLjQ0LjEKCg==

--===============2355347498102860851==--

