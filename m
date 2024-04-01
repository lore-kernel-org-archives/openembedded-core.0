Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62D6CD13A3
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:30 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.44650.1711994602193361546
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QkF5rxt9;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=VqT9Ep6W;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018e9ad4804a-d8b3949f-9965-43de-a6a7-e468357117d8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VgW2IuS6gxrfiVoMoq8je5Jg1fIWeObn3Iig/KmN5pw=;
	b=QkF5rxt9bbRM4IQY2Z/wqFOy6UCGRkFX48fXmcoIwC166yUvhcEViPg6GIGEhKMW
	96d55HgeKDDRYSvQVVrZp3zTrPYVHPxgN/m3dRAfRjDKCUc5VjR4/3RZWcsWnxhfbgU
	8f/xxpuHPW0AO2oLszcsmjpei6QXGOyYE6KWGoUw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VgW2IuS6gxrfiVoMoq8je5Jg1fIWeObn3Iig/KmN5pw=;
	b=VqT9Ep6W1nYzM9daSm3LL+ug0tUqJVSEUsCCV++N4JVgxBveHVznSu/TA7HFLnXx
	NQj38bdXZkjd2eCdvue/k1srtysPphnisQu7wg3HyI+W1dv2eqET5cIeNpx/7hZXop6
	H3klZixySr5RpIexWwWo2qcHfTzfDZ9+WktxQ3To=
Content-Type: multipart/mixed; boundary="===============7557935758371107981=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-referencing: upgrading to 0.34.0 SUCCEEDED
Message-ID: <0101018e9ad4804a-d8b3949f-9965-43de-a6a7-e468357117d8-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197742

--===============7557935758371107981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-referencing* to *0.34.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-referencing-upgrade-0.33.0-0.34.0.patch
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
From 9f056118d665c4bca4f64df627f413169e4d09fb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 09:20:35 +0000
Subject: [PATCH] python3-referencing: upgrade 0.33.0 -> 0.34.0

---
 ...hon3-referencing_0.33.0.bb => python3-referencing_0.34.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-referencing_0.33.0.bb => python3-referencing_0.34.0.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-referencing_0.33.0.bb b/meta/recipes-devtools/python/python3-referencing_0.34.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-referencing_0.33.0.bb
rename to meta/recipes-devtools/python/python3-referencing_0.34.0.bb
index 5b50932264..9388fca376 100644
--- a/meta/recipes-devtools/python/python3-referencing_0.33.0.bb
+++ b/meta/recipes-devtools/python/python3-referencing_0.34.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/python-jsonschema/referencing"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=93eb9740964b59e9ba30281255b044e2"
 
-SRC_URI[sha256sum] = "c775fedf74bc0f9189c2a3be1c12fd03e8c23f4d371dce795df44e06c5b412f7"
+SRC_URI[sha256sum] = "5773bd84ef41799a5a8ca72dc34590c041eb01bf9aa02632b4a973fb0181a844"
 
 inherit pypi python_hatchling
 
-- 
2.42.0


--===============7557935758371107981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-referencing (sysroot):
  /usr/lib/python3.12/site-packages/referencing-0.33.0.dist-info moved to /usr/lib/python3.12/site-packages/referencing-0.34.0.dist-info

--===============7557935758371107981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-referencing: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/referencing/referencing-0.33.0.tar.gz;downloadfilename=referencing-0.33.0.tar.gz" to "https://files.pythonhosted.org/packages/source/r/referencing/referencing-0.34.0.tar.gz;downloadfilename=referencing-0.34.0.tar.gz"
packages/core2-64-poky-linux/python3-referencing: PKGV changed from 0.33.0 [default] to 0.34.0 [default]
packages/core2-64-poky-linux/python3-referencing: PV changed from "0.33.0" to "0.34.0"
packages/core2-64-poky-linux/python3-referencing/python3-referencing-dbg: PKGV changed from 0.33.0 [default] to 0.34.0 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing-dbg: PV changed from "0.33.0" to "0.34.0"
packages/core2-64-poky-linux/python3-referencing/python3-referencing-dev: PKGV changed from 0.33.0 [default] to 0.34.0 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing-dev: PV changed from "0.33.0" to "0.34.0"
packages/core2-64-poky-linux/python3-referencing/python3-referencing-doc: PKGV changed from 0.33.0 [default] to 0.34.0 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing-doc: PV changed from "0.33.0" to "0.34.0"
packages/core2-64-poky-linux/python3-referencing/python3-referencing-locale: PKGV changed from 0.33.0 [default] to 0.34.0 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing-locale: PV changed from "0.33.0" to "0.34.0"
packages/core2-64-poky-linux/python3-referencing/python3-referencing-src: PKGV changed from 0.33.0 [default] to 0.34.0 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing-src: PV changed from "0.33.0" to "0.34.0"
packages/core2-64-poky-linux/python3-referencing/python3-referencing-staticdev: PKGV changed from 0.33.0 [default] to 0.34.0 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing-staticdev: PV changed from "0.33.0" to "0.34.0"
packages/core2-64-poky-linux/python3-referencing/python3-referencing: PKGSIZE changed from 262544 to 262904 (+0%)
packages/core2-64-poky-linux/python3-referencing/python3-referencing: PKGV changed from 0.33.0 [default] to 0.34.0 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing: PV changed from "0.33.0" to "0.34.0"
Changes to packages/core2-64-poky-linux/python3-referencing (sysroot):
  /usr/lib/python3.12/site-packages/referencing-0.33.0.dist-info moved to /usr/lib/python3.12/site-packages/referencing-0.34.0.dist-info

--===============7557935758371107981==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-referencing-upgrade-0.33.0-0.34.0.patch"

RnJvbSA5ZjA1NjExOGQ2NjVjNGJjYTRmNjRkZjYyN2Y0MTMxNjllNGQwOWZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwOToyMDozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcmVmZXJlbmNpbmc6IHVwZ3JhZGUgMC4zMy4wIC0+IDAuMzQuMAoKLS0tCiAuLi5ob24z
LXJlZmVyZW5jaW5nXzAuMzMuMC5iYiA9PiBweXRob24zLXJlZmVyZW5jaW5nXzAuMzQuMC5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXJlZmVyZW5jaW5nXzAu
MzMuMC5iYiA9PiBweXRob24zLXJlZmVyZW5jaW5nXzAuMzQuMC5iYn0gKDgxJSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmVmZXJlbmNpbmdfMC4z
My4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJlZmVyZW5jaW5n
XzAuMzQuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDgxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmVmZXJlbmNpbmdfMC4zMy4wLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmVmZXJlbmNpbmdfMC4zNC4wLmJi
CmluZGV4IDViNTA5MzIyNjQuLjkzODhmY2EzNzYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1yZWZlcmVuY2luZ18wLjMzLjAuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJlZmVyZW5jaW5nXzAuMzQuMC5iYgpAQCAt
Myw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5dGhvbi1qc29uc2No
ZW1hL3JlZmVyZW5jaW5nIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9DT1BZSU5HO21kNT05M2ViOTc0MDk2NGI1OWU5YmEzMDI4MTI1NWIwNDRlMiIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gImM3NzVmZWRmNzRiYzBmOTE4OWMyYTNiZTFjMTJmZDAzZThjMjNm
NGQzNzFkY2U3OTVkZjQ0ZTA2YzViNDEyZjciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTc3M2Jk
ODRlZjQxNzk5YTVhOGNhNzJkYzM0NTkwYzA0MWViMDFiZjlhYTAyNjMyYjRhOTczZmIwMTgxYTg0
NCIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIAotLSAKMi40Mi4wCgo=

--===============7557935758371107981==--

