Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E8FCAC586
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:54 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.89815.1756850202844488946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=yeCCNcG7;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=iHvXN4JT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101990c6ead71-5f7fb198-a3dc-44cd-b25f-e33535c2d41c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850204;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PGTTozdJUsvejgpHKdE8QyMDhNSynafPiDhiTKu2Iqw=;
	b=yeCCNcG7vMqdZ1yZJSCeCp2gwPoo+mkQMEkrnEJz6SMRF2p0/Ifo6y+06J5m8vYw
	U4f1+E08/DQIiI4iLAycnLgbSN6vg3JZjOPbsQ87g6E7hDQKzkxy0YIJAQRpBdy7agq
	KgIYd4Msd/UGyzJN+mqMTg0dNEBsr0ByGWL8EJ6w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850204;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PGTTozdJUsvejgpHKdE8QyMDhNSynafPiDhiTKu2Iqw=;
	b=iHvXN4JTUOf7sMaYBxb9/L8SUHFkHR6RtMPHLAGO0kBXsHIUYLewHwdJDSW9tIJn
	DrNaCZovs4WHXM1bIL522m2wCR3911fRq6VZ8vnsARaNSLpvWvyO5BRZWdf4ffTgkDs
	nMHTBcVkoJ+0qstDhDXUmjn0QQPKQX7gYXA8xNtA=
Content-Type: multipart/mixed; boundary="===============6345674361499069264=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] enchant2: upgrading to 2.8.12 SUCCEEDED
Message-ID: <010101990c6ead71-5f7fb198-a3dc-44cd-b25f-e33535c2d41c-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222826

--===============6345674361499069264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *enchant2* to *2.8.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-enchant2-upgrade-2.8.10-2.8.12.patch
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
From 98f42c30c0bda2f8f6f549cd41903d02a7726a9c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 21:39:02 +0000
Subject: [PATCH] enchant2: upgrade 2.8.10 -> 2.8.12

---
 .../enchant/{enchant2_2.8.10.bb => enchant2_2.8.12.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.8.10.bb => enchant2_2.8.12.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.8.10.bb b/meta/recipes-support/enchant/enchant2_2.8.12.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.8.10.bb
rename to meta/recipes-support/enchant/enchant2_2.8.12.bb
index e2965e9e10..84f0156bca 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.10.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.12.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "6db791265ace652c63a6d24f376f4c562b742284d70d3ccb9e1ce8be45b288c9"
+SRC_URI[sha256sum] = "20e5fab2ca0f95ba9d1ef5052fe5b028e3e1d66d4cdea6b9adfcbd3e524c2a09"
 
 GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 
-- 
2.47.1


--===============6345674361499069264==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-enchant2-upgrade-2.8.10-2.8.12.patch"

RnJvbSA5OGY0MmMzMGMwYmRhMmY4ZjZmNTQ5Y2Q0MTkwM2QwMmE3NzI2YTljIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAyMTozOTowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVu
Y2hhbnQyOiB1cGdyYWRlIDIuOC4xMCAtPiAyLjguMTIKCi0tLQogLi4uL2VuY2hhbnQve2VuY2hh
bnQyXzIuOC4xMC5iYiA9PiBlbmNoYW50Ml8yLjguMTIuYmJ9ICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZW5jaGFudC97ZW5jaGFudDJfMi44LjEwLmJiID0+IGVuY2hhbnQyXzIu
OC4xMi5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50
L2VuY2hhbnQyXzIuOC4xMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2VuY2hhbnQvZW5jaGFu
dDJfMi44LjEyLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1zdXBwb3J0L2VuY2hhbnQvZW5jaGFudDJfMi44LjEwLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hhbnQyXzIuOC4xMi5iYgppbmRleCBlMjk2NWU5ZTEwLi44
NGYwMTU2YmNhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hh
bnQyXzIuOC4xMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hhbnQy
XzIuOC4xMi5iYgpAQCAtMTIsNyArMTIsNyBAQCBERVBFTkRTID0gImdsaWItMi4wIGdyb2ZmLW5h
dGl2ZSIKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBnaXRodWItcmVsZWFzZXMKIAogU1JD
X1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9L2VuY2hhbnQtJHtQVn0u
dGFyLmd6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjZkYjc5MTI2NWFjZTY1MmM2M2E2ZDI0ZjM3
NmY0YzU2MmI3NDIyODRkNzBkM2NjYjllMWNlOGJlNDViMjg4YzkiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMjBlNWZhYjJjYTBmOTViYTlkMWVmNTA1MmZlNWIwMjhlM2UxZDY2ZDRjZGVhNmI5YWRm
Y2JkM2U1MjRjMmEwOSIKIAogR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9y
cnRob21hcy9lbmNoYW50L3JlbGVhc2VzIgogCi0tIAoyLjQ3LjEKCg==

--===============6345674361499069264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: PKGSIZE changed from 442416 to 441896 (-0%)
packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: FILELIST: removed "/usr/lib/.debug/libenchant-2.so.2.8.10", added "/usr/lib/.debug/libenchant-2.so.2.8.12"
packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: PKGV changed from 2.8.10 [default] to 2.8.12 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: PV changed from "2.8.10" to "2.8.12"
packages/x86-64-v3-poky-linux/enchant2/enchant2-dev: PKGV changed from 2.8.10 [default] to 2.8.12 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-dev: PV changed from "2.8.10" to "2.8.12"
packages/x86-64-v3-poky-linux/enchant2/enchant2-doc: PKGV changed from 2.8.10 [default] to 2.8.12 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-doc: PV changed from "2.8.10" to "2.8.12"
packages/x86-64-v3-poky-linux/enchant2/enchant2-locale: PKGV changed from 2.8.10 [default] to 2.8.12 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-locale: PV changed from "2.8.10" to "2.8.12"
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: PKGSIZE changed from 460930 to 463783 (+1%)
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: PKGV changed from 2.8.10 [default] to 2.8.12 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: PV changed from "2.8.10" to "2.8.12"
packages/x86-64-v3-poky-linux/enchant2/enchant2-staticdev: PKGV changed from 2.8.10 [default] to 2.8.12 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-staticdev: PV changed from "2.8.10" to "2.8.12"
packages/x86-64-v3-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.8.10", added "/usr/lib/libenchant-2.so.2.8.12"
packages/x86-64-v3-poky-linux/enchant2/enchant2: PKGV changed from 2.8.10 [default] to 2.8.12 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2: PV changed from "2.8.10" to "2.8.12"
packages/x86-64-v3-poky-linux/enchant2: SRC_URI changed from "https://github.com/rrthomas/enchant/releases/download/v2.8.10/enchant-2.8.10.tar.gz" to "https://github.com/rrthomas/enchant/releases/download/v2.8.12/enchant-2.8.12.tar.gz"
packages/x86-64-v3-poky-linux/enchant2: PKGV changed from 2.8.10 [default] to 2.8.12 [default]
packages/x86-64-v3-poky-linux/enchant2: PV changed from "2.8.10" to "2.8.12"
Changes to packages/x86-64-v3-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.8.10 to libenchant-2.so.2.8.12
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.8.10 to libenchant-2.so.2.8.12
  /usr/lib/libenchant-2.so.2.8.10 moved to /usr/lib/libenchant-2.so.2.8.12

--===============6345674361499069264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.8.10", added "/usr/lib/libenchant-2.so.2.8.12"
Changes to packages/x86-64-v3-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.8.10 to libenchant-2.so.2.8.12
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.8.10 to libenchant-2.so.2.8.12
  /usr/lib/libenchant-2.so.2.8.10 moved to /usr/lib/libenchant-2.so.2.8.12

--===============6345674361499069264==--

