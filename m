Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A22CC3ABB2
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:33 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.1778.1746113612625078747
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=cO6czGgC;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=TRtqho5A;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101968c7b484e-768cbb3a-4b94-4a22-8ba8-d311488a944b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113612;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9DLqKdtYl78JHWSj5VPdeBl/QqANhkeSPeuTafjq748=;
	b=cO6czGgCuOR26l7DB65oX6rgrehgatxzJdLxbqu2tCdDWQVhc0200Y86/tpvnAas
	i+NXQ32CFE6iI18+SxnsFF+j28FgWlR3PKuoHPQf5SrefujSlgEcycnQptG5Gx3t0Om
	IlusaG3Ju779Tq0joqG7e4hwlUO5qBcJJ5UoobiY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113612;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9DLqKdtYl78JHWSj5VPdeBl/QqANhkeSPeuTafjq748=;
	b=TRtqho5A2k+Ju3bZoaBuERdeAr7XEumNXRRnwS+RmMllb6ENx5Hchjdj3TobP1Qt
	wuy+TLpyT/JdhpKcKNyLFMCL/vsw0xvFdcpGC/FevPK2GFYNbMOQM4xr8ZKxu2BAQQ4
	FYcwDqo2z4HK4XFPs9C6swPyP/5SDhkSLZ4cOjIA=
Content-Type: multipart/mixed; boundary="===============5827783577865203250=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libuv: upgrading to 1.51.0 SUCCEEDED
Message-ID: <010101968c7b484e-768cbb3a-4b94-4a22-8ba8-d311488a944b-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215785

--===============5827783577865203250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libuv* to *1.51.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libuv-upgrade-1.50.0-1.51.0.patch
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
From cbafeb4312e970a27f82ed4843641b15a8b420e2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 07:35:01 +0000
Subject: [PATCH] libuv: upgrade 1.50.0 -> 1.51.0

---
 .../libuv/{libuv_1.50.0.bb => libuv_1.51.0.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.50.0.bb => libuv_1.51.0.bb} (94%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.50.0.bb b/meta/recipes-connectivity/libuv/libuv_1.51.0.bb
similarity index 94%
rename from meta/recipes-connectivity/libuv/libuv_1.50.0.bb
rename to meta/recipes-connectivity/libuv/libuv_1.51.0.bb
index c5f4e9d3ac..bac82f2d8e 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.50.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.51.0.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=74b6f2f7818a4e3a80d03556f71b129b \
                     file://LICENSE-extra;md5=f9307417749e19bd1d6d68a394b49324"
 
-SRCREV = "8fb9cb919489a48880680a56efecff6a7dfb4504"
+SRCREV = "5152db2cbfeb5582e9c27c5ea1dba2cd9e10759b"
 SRC_URI = "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============5827783577865203250==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libuv-upgrade-1.50.0-1.51.0.patch"

RnJvbSBjYmFmZWI0MzEyZTk3MGEyN2Y4MmVkNDg0MzY0MWIxNWE4YjQyMGUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAwNzozNTowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnV2OiB1cGdyYWRlIDEuNTAuMCAtPiAxLjUxLjAKCi0tLQogLi4uL2xpYnV2L3tsaWJ1dl8xLjUw
LjAuYmIgPT4gbGlidXZfMS41MS4wLmJifSAgICAgICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9saWJ1di97bGlidXZfMS41MC4wLmJiID0+IGxpYnV2XzEuNTEuMC5i
Yn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYnV2L2xp
YnV2XzEuNTAuMC5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlidXYvbGlidXZfMS41
MS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvbGlidXYvbGlidXZfMS41MC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2xpYnV2L2xpYnV2XzEuNTEuMC5iYgppbmRleCBjNWY0ZTlkM2FjLi5iYWM4MmYy
ZDhlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYnV2L2xpYnV2XzEu
NTAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYnV2L2xpYnV2XzEuNTEu
MC5iYgpAQCAtNiw3ICs2LDcgQEAgTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9MSUNFTlNFO21kNT03NGI2ZjJmNzgxOGE0ZTNhODBkMDM1NTZmNzFiMTI5YiBcCiAg
ICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFLWV4dHJhO21kNT1mOTMwNzQxNzc0OWUx
OWJkMWQ2ZDY4YTM5NGI0OTMyNCIKIAotU1JDUkVWID0gIjhmYjljYjkxOTQ4OWE0ODg4MDY4MGE1
NmVmZWNmZjZhN2RmYjQ1MDQiCitTUkNSRVYgPSAiNTE1MmRiMmNiZmViNTU4MmU5YzI3YzVlYTFk
YmEyY2Q5ZTEwNzU5YiIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9saWJ1di9saWJ1di5n
aXQ7YnJhbmNoPXYxLng7cHJvdG9jb2w9aHR0cHMiCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdF
WCA9ICJ2KD9QPHB2ZXI+XGQrKFwuXGQrKSspIgogCi0tIAoyLjQ3LjEKCg==

--===============5827783577865203250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libuv: PV changed from "1.50.0" to "1.51.0"
packages/core2-64-poky-linux/libuv: PKGV changed from 1.50.0 [default] to 1.51.0 [default]
packages/core2-64-poky-linux/libuv/libuv-dbg: PV changed from "1.50.0" to "1.51.0"
packages/core2-64-poky-linux/libuv/libuv-dbg: PKGV changed from 1.50.0 [default] to 1.51.0 [default]
packages/core2-64-poky-linux/libuv/libuv-dbg: PKGSIZE changed from 779968 to 783408 (+0%)
packages/core2-64-poky-linux/libuv/libuv-dev: PV changed from "1.50.0" to "1.51.0"
packages/core2-64-poky-linux/libuv/libuv-dev: PKGV changed from 1.50.0 [default] to 1.51.0 [default]
packages/core2-64-poky-linux/libuv/libuv-dev: PKGSIZE changed from 109237 to 109506 (+0%)
packages/core2-64-poky-linux/libuv/libuv-doc: PV changed from "1.50.0" to "1.51.0"
packages/core2-64-poky-linux/libuv/libuv-doc: PKGV changed from 1.50.0 [default] to 1.51.0 [default]
packages/core2-64-poky-linux/libuv/libuv-locale: PV changed from "1.50.0" to "1.51.0"
packages/core2-64-poky-linux/libuv/libuv-locale: PKGV changed from 1.50.0 [default] to 1.51.0 [default]
packages/core2-64-poky-linux/libuv/libuv-src: PV changed from "1.50.0" to "1.51.0"
packages/core2-64-poky-linux/libuv/libuv-src: PKGV changed from 1.50.0 [default] to 1.51.0 [default]
packages/core2-64-poky-linux/libuv/libuv-staticdev: PV changed from "1.50.0" to "1.51.0"
packages/core2-64-poky-linux/libuv/libuv-staticdev: PKGV changed from 1.50.0 [default] to 1.51.0 [default]
packages/core2-64-poky-linux/libuv/libuv: PV changed from "1.50.0" to "1.51.0"
packages/core2-64-poky-linux/libuv/libuv: PKGV changed from 1.50.0 [default] to 1.51.0 [default]

--===============5827783577865203250==--

