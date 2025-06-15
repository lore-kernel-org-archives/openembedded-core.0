Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD276C83F18
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:15:05 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.8906.1749993303896622503
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=EmVX4udB;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Qc/4+qRT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019773baad31-6ceceb8a-1a10-487a-a78a-91db5f70bb53-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993303;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=84pYD9miI51I9hDq8zphUXJ26CQfrLp38RFEwBqnook=;
	b=EmVX4udBphDQ53fsOmL3x+GWVgsD6jWV443qDjNotkoCWifhzMI10CzcPL9Vtkkh
	D6ZF2gK9QdOZ6rIvMBVPraCLkRhetAHCPuHtg1dkUxIAFfBX6nh57wmRm+QO59rPOHS
	Pe/S+fojWI/CUVGLBSbTVWXXS7IyJcvrW20WaxIU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993303;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=84pYD9miI51I9hDq8zphUXJ26CQfrLp38RFEwBqnook=;
	b=Qc/4+qRTi3H0QRpqwtMUauuEQglceuVHAKpW+6eM2sohd6n6xtSj1diTxXPVKErU
	ocbvmDWk4gVBZp/Xn2xEaqzkbEc8UGqGJYq9erPxfbhHyvXYh2bXpkrEmrnX2qLiZcA
	aUg0dfFAwwIUBC/qcJOJhh2uWPmTDExgw1pn5DBM=
Content-Type: multipart/mixed; boundary="===============1825448400555580385=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hiago De Franco <hiago.franco@toradex.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwdata: upgrading to 0.396 SUCCEEDED
Message-ID: <0101019773baad31-6ceceb8a-1a10-487a-a78a-91db5f70bb53-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:15:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218739

--===============1825448400555580385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *hwdata* to *0.396* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwdata-upgrade-0.395-0.396.patch
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
From 45562fe32ee0ba77c4f0157f2523b2e39eb4940d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 12:59:01 +0000
Subject: [PATCH] hwdata: upgrade 0.395 -> 0.396

---
 .../recipes-support/hwdata/{hwdata_0.395.bb => hwdata_0.396.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.395.bb => hwdata_0.396.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.395.bb b/meta/recipes-support/hwdata/hwdata_0.396.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.395.bb
rename to meta/recipes-support/hwdata/hwdata_0.396.bb
index 73b846b181..291a4ef85d 100644
--- a/meta/recipes-support/hwdata/hwdata_0.395.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.396.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "95c1de6c4a0d40415867b29c0791480fb8ad3cdb"
+SRCREV = "736513dfc1d44c5fb48bead62af7e91c4e1d1dd2"
 
 S = "${WORKDIR}/git"
 
-- 
2.47.1


--===============1825448400555580385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/hwdata/hwdata-dbg: PKGV changed from 0.395 [default] to 0.396 [default]
packages/all-poky-linux/hwdata/hwdata-dbg: PV changed from "0.395" to "0.396"
packages/all-poky-linux/hwdata/hwdata-dev: PKGV changed from 0.395 [default] to 0.396 [default]
packages/all-poky-linux/hwdata/hwdata-dev: PV changed from "0.395" to "0.396"
packages/all-poky-linux/hwdata/hwdata-doc: PKGV changed from 0.395 [default] to 0.396 [default]
packages/all-poky-linux/hwdata/hwdata-doc: PV changed from "0.395" to "0.396"
packages/all-poky-linux/hwdata/hwdata-locale: PKGV changed from 0.395 [default] to 0.396 [default]
packages/all-poky-linux/hwdata/hwdata-locale: PV changed from "0.395" to "0.396"
packages/all-poky-linux/hwdata/hwdata-src: PKGV changed from 0.395 [default] to 0.396 [default]
packages/all-poky-linux/hwdata/hwdata-src: PV changed from "0.395" to "0.396"
packages/all-poky-linux/hwdata/hwdata-staticdev: PKGV changed from 0.395 [default] to 0.396 [default]
packages/all-poky-linux/hwdata/hwdata-staticdev: PV changed from "0.395" to "0.396"
packages/all-poky-linux/hwdata/hwdata: PKGV changed from 0.395 [default] to 0.396 [default]
packages/all-poky-linux/hwdata/hwdata: PV changed from "0.395" to "0.396"
packages/all-poky-linux/hwdata/hwdata: PKGSIZE changed from 9924813 to 9971277 (+0%)
packages/all-poky-linux/hwdata: PKGV changed from 0.395 [default] to 0.396 [default]
packages/all-poky-linux/hwdata: SRC_URI changed from "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.395" to "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.396"
packages/all-poky-linux/hwdata: PV changed from "0.395" to "0.396"

--===============1825448400555580385==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwdata-upgrade-0.395-0.396.patch"

RnJvbSA0NTU2MmZlMzJlZTBiYTc3YzRmMDE1N2YyNTIzYjJlMzllYjQ5NDBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMTI6NTk6MDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
d2RhdGE6IHVwZ3JhZGUgMC4zOTUgLT4gMC4zOTYKCi0tLQogLi4uL3JlY2lwZXMtc3VwcG9ydC9o
d2RhdGEve2h3ZGF0YV8wLjM5NS5iYiA9PiBod2RhdGFfMC4zOTYuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvaHdkYXRhL3tod2RhdGFfMC4zOTUuYmIgPT4gaHdkYXRhXzAuMzk2LmJifSAo
OTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC4z
OTUuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuMzk2LmJiCnNpbWls
YXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9o
d2RhdGFfMC4zOTUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2Rh
dGFfMC4zOTYuYmIKaW5kZXggNzNiODQ2YjE4MS4uMjkxYTRlZjg1ZCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0YV8wLjM5NS5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuMzk2LmJiCkBAIC04LDcgKzgsNyBAQCBMSUNFTlNF
ID0gIkdQTC0yLjAtb3ItbGF0ZXIgfCBYMTEiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFO21kNT0xNTU2NTQ3NzExZTgyNDY5OTJiOTk5ZWRkOTQ0NWE1NyIKIAogU1JDX1VSSSA9
ICJnaXQ6Ly9naXRodWIuY29tL3ZjcmhvbmVrLyR7QlBOfS5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90
b2NvbD1odHRwczt0YWc9diR7UFZ9IgotU1JDUkVWID0gIjk1YzFkZTZjNGEwZDQwNDE1ODY3YjI5
YzA3OTE0ODBmYjhhZDNjZGIiCitTUkNSRVYgPSAiNzM2NTEzZGZjMWQ0NGM1ZmI0OGJlYWQ2MmFm
N2U5MWM0ZTFkMWRkMiIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi40Ny4xCgo=

--===============1825448400555580385==--

