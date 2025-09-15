Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88281CAC5B4
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:54:48 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.30924.1757937279693324054
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PK/TKnix;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Vn5vMzPB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101994d3a208e-5321408c-ad59-4f2c-aa1d-b16ef9a8f729-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937279;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vL3/sUuInr2SMnr0EkO8VTdTcHfxz/y/LE8B1rSO+QE=;
	b=PK/TKnixHfHR5Vd0TeAGKxBDuh2w3hhg2tzcdZP1ggrra6zH57zQi3zxmYVnM/8p
	GFbOQjKs2kk2b/NPvx3angI8OkK52btftsiI3x2H9M5p3lrvFo55CSi85v5Pz6ND1oF
	VaVQHVOlzdW6iP2CRW33WEcNbGjnBr6BJAt98Z48=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937279;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vL3/sUuInr2SMnr0EkO8VTdTcHfxz/y/LE8B1rSO+QE=;
	b=Vn5vMzPBP09/9LeVFCI7jePYfBfFH7VVMUgMmhn6qebKxz80QyXyE+jJbCa5uOZo
	gxsfCm84VgKXHBZfKG4VAstRxhiO9mh60oIVPfOGh+PIO63ItYNXWShkB0tmFKtF8KL
	qhTRu1MMnvhrQeeuYJ8brEIWWUmNCWprlIGtNUbo=
Content-Type: multipart/mixed; boundary="===============7188779487668690643=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.138.16 SUCCEEDED
Message-ID: <010101994d3a208e-5321408c-ad59-4f2c-aa1d-b16ef9a8f729-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223421

--===============7188779487668690643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.138.16* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.138.15-6.138.16.patch
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
From 3040fe6df499997cde8ccbf0ddff2e62c47bd29d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 08:02:48 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.138.15 -> 6.138.16

---
 ...n3-hypothesis_6.138.15.bb => python3-hypothesis_6.138.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.138.15.bb => python3-hypothesis_6.138.16.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.138.15.bb b/meta/recipes-devtools/python/python3-hypothesis_6.138.16.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.138.15.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.138.16.bb
index 508f125e43..7de2ed3cd2 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.138.15.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.138.16.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "6b0e1aa182eacde87110995a3543530d69ef411f642162a656efcd46c2823ad1"
+SRC_URI[sha256sum] = "08f9015dadc877ce5ca04752efc56df797238148a44d1c69db656ed29bfbbf73"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============7188779487668690643==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.138.15-6.138.16.patch"

RnJvbSAzMDQwZmU2ZGY0OTk5OTdjZGU4Y2NiZjBkZGZmMmU2MmM0N2JkMjlkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMDg6MDI6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xMzguMTUgLT4gNi4xMzguMTYKCi0tLQogLi4u
bjMtaHlwb3RoZXNpc182LjEzOC4xNS5iYiA9PiBweXRob24zLWh5cG90aGVzaXNfNi4xMzguMTYu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1oeXBvdGhlc2lz
XzYuMTM4LjE1LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjEzOC4xNi5iYn0gKDkxJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
c182LjEzOC4xNS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBv
dGhlc2lzXzYuMTM4LjE2LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTM4LjE1LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182
LjEzOC4xNi5iYgppbmRleCA1MDhmMTI1ZTQzLi43ZGUyZWQzY2QyIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjEzOC4xNS5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjEz
OC4xNi5iYgpAQCAtMTMsNyArMTMsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGZpbGU6Ly90ZXN0
X3JsZS5weSBcCiAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmIwZTFhYTE4MmVhY2Rl
ODcxMTA5OTVhMzU0MzUzMGQ2OWVmNDExZjY0MjE2MmE2NTZlZmNkNDZjMjgyM2FkMSIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICIwOGY5MDE1ZGFkYzg3N2NlNWNhMDQ3NTJlZmM1NmRmNzk3MjM4MTQ4
YTQ0ZDFjNjlkYjY1NmVkMjliZmJiZjczIgogCiBSREVQRU5EUzoke1BOfSArPSAiIFwKICAgICBw
eXRob24zLWF0dHJzIFwKLS0gCjIuNDcuMQoK

--===============7188779487668690643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.138.15 [default] to 6.138.16 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.138.15.tar.gz;downloadfilename=hypothesis-6.138.15.tar.gz file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.138.16.tar.gz;downloadfilename=hypothesis-6.138.16.tar.gz file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.138.15" to "6.138.16"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.138.15 [default] to 6.138.16 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.138.15" to "6.138.16"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.138.15 [default] to 6.138.16 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.138.15" to "6.138.16"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.138.15 [default] to 6.138.16 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.138.15" to "6.138.16"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.138.15 [default] to 6.138.16 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.138.15" to "6.138.16"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.138.15 [default] to 6.138.16 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.138.15" to "6.138.16"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.138.15 [default] to 6.138.16 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.138.15" to "6.138.16"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.138.15 [default] to 6.138.16 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.138.15" to "6.138.16"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.138.15 [default] to 6.138.16 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 3558273 to 3558610 (+0%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.138.15" to "6.138.16"
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.13/site-packages/hypothesis-6.138.15.dist-info moved to /usr/lib/python3.13/site-packages/hypothesis-6.138.16.dist-info

--===============7188779487668690643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.13/site-packages/hypothesis-6.138.15.dist-info moved to /usr/lib/python3.13/site-packages/hypothesis-6.138.16.dist-info

--===============7188779487668690643==--

