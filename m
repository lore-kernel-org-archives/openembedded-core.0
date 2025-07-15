Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E08BC87FCA
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:56:02 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.12500.1752594953342874318
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=2JTtGDdy;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=TGQyUUvq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101980eccc348-f4965139-5906-4c43-97e7-9e10efb7ff9e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594957;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QHlmVbMvjwsh4nOoj15jaVungpydDeIcUmSysOg2Fzc=;
	b=2JTtGDdyMzmNr3y7yWVTU6lAaCQD6ZgoI5hKIUd9stgWI6GtmfwtEQzPDSNah08A
	7s8BysyjigxG8FKG0F525qBUVon0lEqkhoKzfecdTPbH0MH8UxV/z/IdE33vGhQftgx
	gXEwriVZx7V3jG4uCqwVlcqm0CDAAkJ2a68BMN8w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594957;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QHlmVbMvjwsh4nOoj15jaVungpydDeIcUmSysOg2Fzc=;
	b=TGQyUUvquKdvfaf7bMTN1Cig5zPZkgKYYAU+iDVuZkIA02yDfTHupOrOMD+/7s/e
	fRIKpHF92CTXwGt7eftZT0dTBnSZNIG3naEuCXC2qTmbS/XGTe+HLp0KyjyYZLnise9
	rK4pq9fhw7xuhvVWbai/mJQ1WbDEIyy3/j113tIo=
Content-Type: multipart/mixed; boundary="===============5492354200637278971=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] taglib: upgrading to 2.1.1 SUCCEEDED
Message-ID: <010101980eccc348-f4965139-5906-4c43-97e7-9e10efb7ff9e-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:56:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220402

--===============5492354200637278971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *taglib* to *2.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-taglib-upgrade-2.1-2.1.1.patch
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
From 166e4b2c12719a401eacfe3a16d878169ee420ca Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 15:53:19 +0000
Subject: [PATCH] taglib: upgrade 2.1 -> 2.1.1

---
 meta/recipes-support/taglib/{taglib_2.1.bb => taglib_2.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/taglib/{taglib_2.1.bb => taglib_2.1.1.bb} (95%)

diff --git a/meta/recipes-support/taglib/taglib_2.1.bb b/meta/recipes-support/taglib/taglib_2.1.1.bb
similarity index 95%
rename from meta/recipes-support/taglib/taglib_2.1.bb
rename to meta/recipes-support/taglib/taglib_2.1.1.bb
index a337af74d0..6b700578b8 100644
--- a/meta/recipes-support/taglib/taglib_2.1.bb
+++ b/meta/recipes-support/taglib/taglib_2.1.1.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib utfcpp"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "95b788b39eaebab41f7e6d1c1d05ceee01a5d1225e4b6d11ed8976e96ba90b0c"
+SRC_URI[sha256sum] = "3716d31f7c83cbf17b67c8cf44dd82b2a2f17e6780472287a16823e70305ddba"
 
 UPSTREAM_CHECK_URI = "https://taglib.org/"
 UPSTREAM_CHECK_REGEX = "taglib-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.47.1


--===============5492354200637278971==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-taglib-upgrade-2.1-2.1.1.patch"

RnJvbSAxNjZlNGIyYzEyNzE5YTQwMWVhY2ZlM2ExNmQ4NzgxNjllZTQyMGNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMTU6NTM6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
YWdsaWI6IHVwZ3JhZGUgMi4xIC0+IDIuMS4xCgotLS0KIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3Rh
Z2xpYi97dGFnbGliXzIuMS5iYiA9PiB0YWdsaWJfMi4xLjEuYmJ9IHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LXN1cHBvcnQvdGFnbGliL3t0YWdsaWJfMi4xLmJiID0+IHRhZ2xpYl8yLjEuMS5iYn0gKDk1JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC90YWdsaWIvdGFnbGliXzIuMS5iYiBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L3RhZ2xpYi90YWdsaWJfMi4xLjEuYmIKc2ltaWxhcml0eSBp
bmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvdGFnbGliL3RhZ2xpYl8y
LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3RhZ2xpYi90YWdsaWJfMi4xLjEu
YmIKaW5kZXggYTMzN2FmNzRkMC4uNmI3MDA1NzhiOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvdGFnbGliL3RhZ2xpYl8yLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
dGFnbGliL3RhZ2xpYl8yLjEuMS5iYgpAQCAtMTEsNyArMTEsNyBAQCBERVBFTkRTID0gInpsaWIg
dXRmY3BwIgogCiBTUkNfVVJJID0gImh0dHA6Ly90YWdsaWIuZ2l0aHViLmlvL3JlbGVhc2VzLyR7
QlB9LnRhci5neiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjk1Yjc4OGIzOWVhZWJhYjQxZjdl
NmQxYzFkMDVjZWVlMDFhNWQxMjI1ZTRiNmQxMWVkODk3NmU5NmJhOTBiMGMiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiMzcxNmQzMWY3YzgzY2JmMTdiNjdjOGNmNDRkZDgyYjJhMmYxN2U2NzgwNDcy
Mjg3YTE2ODIzZTcwMzA1ZGRiYSIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vdGFn
bGliLm9yZy8iCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJ0YWdsaWItKD9QPHB2ZXI+XGQrKFwu
XGQrKSspXC50YXIiCi0tIAoyLjQ3LjEKCg==

--===============5492354200637278971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/taglib: PV changed from "2.1" to "2.1.1"
packages/core2-64-poky-linux/taglib: PKGV changed from 2.1 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/taglib: SRC_URI changed from "http://taglib.github.io/releases/taglib-2.1.tar.gz" to "http://taglib.github.io/releases/taglib-2.1.1.tar.gz"
Changes to packages/core2-64-poky-linux/taglib (sysroot):
  /usr/lib/libtag_c.so.2 changed symlink target from libtag_c.so.2.1.0 to libtag_c.so.2.1.1
  /usr/lib/libtag.so.2 changed symlink target from libtag.so.2.1.0 to libtag.so.2.1.1
  /usr/lib/libtag_c.so.2.1.0 moved to /usr/lib/libtag_c.so.2.1.1
  /usr/lib/libtag.so.2.1.0 moved to /usr/lib/libtag.so.2.1.1
packages/core2-64-poky-linux/taglib/taglib-c: FILELIST: removed "/usr/lib/libtag_c.so.2.1.0", added "/usr/lib/libtag_c.so.2.1.1"
packages/core2-64-poky-linux/taglib/taglib-c: PV changed from "2.1" to "2.1.1"
packages/core2-64-poky-linux/taglib/taglib-c: PKGV changed from 2.1 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/taglib/taglib-dbg: FILELIST: removed "/usr/lib/.debug/libtag.so.2.1.0 /usr/lib/.debug/libtag_c.so.2.1.0", added "/usr/lib/.debug/libtag.so.2.1.1 /usr/lib/.debug/libtag_c.so.2.1.1"
packages/core2-64-poky-linux/taglib/taglib-dbg: PV changed from "2.1" to "2.1.1"
packages/core2-64-poky-linux/taglib/taglib-dbg: PKGSIZE changed from 23323792 to 23354064 (+0%)
packages/core2-64-poky-linux/taglib/taglib-dbg: PKGV changed from 2.1 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/taglib/taglib-dev: PV changed from "2.1" to "2.1.1"
packages/core2-64-poky-linux/taglib/taglib-dev: PKGSIZE changed from 765443 to 765468 (+0%)
packages/core2-64-poky-linux/taglib/taglib-dev: PKGV changed from 2.1 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/taglib/taglib-doc: PV changed from "2.1" to "2.1.1"
packages/core2-64-poky-linux/taglib/taglib-doc: PKGV changed from 2.1 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/taglib/taglib-locale: PV changed from "2.1" to "2.1.1"
packages/core2-64-poky-linux/taglib/taglib-locale: PKGV changed from 2.1 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/taglib/taglib-src: PV changed from "2.1" to "2.1.1"
packages/core2-64-poky-linux/taglib/taglib-src: PKGSIZE changed from 1691935 to 1694390 (+0%)
packages/core2-64-poky-linux/taglib/taglib-src: PKGV changed from 2.1 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/taglib/taglib-staticdev: PV changed from "2.1" to "2.1.1"
packages/core2-64-poky-linux/taglib/taglib-staticdev: PKGV changed from 2.1 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/taglib/taglib: FILELIST: removed "/usr/lib/libtag.so.2.1.0", added "/usr/lib/libtag.so.2.1.1"
packages/core2-64-poky-linux/taglib/taglib: PV changed from "2.1" to "2.1.1"
packages/core2-64-poky-linux/taglib/taglib: PKGV changed from 2.1 [default] to 2.1.1 [default]

--===============5492354200637278971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/taglib (sysroot):
  /usr/lib/libtag_c.so.2 changed symlink target from libtag_c.so.2.1.0 to libtag_c.so.2.1.1
  /usr/lib/libtag.so.2 changed symlink target from libtag.so.2.1.0 to libtag.so.2.1.1
  /usr/lib/libtag_c.so.2.1.0 moved to /usr/lib/libtag_c.so.2.1.1
  /usr/lib/libtag.so.2.1.0 moved to /usr/lib/libtag.so.2.1.1
packages/core2-64-poky-linux/taglib/taglib-c: FILELIST: removed "/usr/lib/libtag_c.so.2.1.0", added "/usr/lib/libtag_c.so.2.1.1"
packages/core2-64-poky-linux/taglib/taglib: FILELIST: removed "/usr/lib/libtag.so.2.1.0", added "/usr/lib/libtag.so.2.1.1"

--===============5492354200637278971==--

