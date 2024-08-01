Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B69DC49EA1
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:24 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.75756.1722536831226096985
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=eQ9J56Fi;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=XxXJ3jeP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101910f3233f3-6cc0276f-06f1-4b63-872d-5da58aa1ab0b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536834;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sQz4cZ05eID22xDkBIvykj6hTMoeA5ETn961TS0INg0=;
	b=eQ9J56FiiHxwtBZCvnoLN1N5gjqIBH2KaUFrin6TEOAdh0Glx0xS2xpTsWr0vX3F
	iaExVdPzkzoS75lbdSPHaI3kZjcQtMzfloG42qGp6hFzpvCbbSKz09wKFEJrUC8DbCw
	780NQQQV1Y1k1MAZpVA7wrxFGApYDeBmv6gDnIFI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536834;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sQz4cZ05eID22xDkBIvykj6hTMoeA5ETn961TS0INg0=;
	b=XxXJ3jePp/5GE+igpD3GkZZ75bHgn3/UHwgF9J739VLpwTD2ZpXglliWR3F4/d0c
	rsFRIRf9PXDhm5M7OWtcKy20S/FTvmzsFSVmukvdZt20ax04oCKyNeuQusMr98KxpGk
	cRrNsEl6QNnVwRddKSrpA4qz/vVQUlXjHTnLS12w=
Content-Type: multipart/mixed; boundary="===============6810432859734505462=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-volk: upgrading to 1.3.290.0 SUCCEEDED
Message-ID: <010101910f3233f3-6cc0276f-06f1-4b63-872d-5da58aa1ab0b-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202853

--===============6810432859734505462==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-volk* to *1.3.290.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-volk-upgrade-1.3.283.0-1.3.290.0.patch
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
From 6a28903792f8f21a3b7df58723a855f029e8827a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 14:46:45 +0000
Subject: [PATCH] vulkan-volk: upgrade 1.3.283.0 -> 1.3.290.0

---
 .../{vulkan-volk_1.3.283.0.bb => vulkan-volk_1.3.290.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-volk_1.3.283.0.bb => vulkan-volk_1.3.290.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.3.283.0.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.3.290.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-volk_1.3.283.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-volk_1.3.290.0.bb
index 5485aa0b0d..e1bad6a96d 100644
--- a/meta/recipes-graphics/vulkan/vulkan-volk_1.3.283.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.3.290.0.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=12e6af3a0e2a5e5dbf7796aa82b64626"
 
 SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https"
-SRCREV = "3a8068a57417940cf2bf9d837a7bb60d015ca2f1"
+SRCREV = "466085407d5d2f50583fd663c1d65f93a7709d3e"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.0


--===============6810432859734505462==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-volk-upgrade-1.3.283.0-1.3.290.0.patch"

RnJvbSA2YTI4OTAzNzkyZjhmMjFhM2I3ZGY1ODcyM2E4NTVmMDI5ZTg4MjdhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxNDo0Njo0NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi12b2xrOiB1cGdyYWRlIDEuMy4yODMuMCAtPiAxLjMuMjkwLjAKCi0tLQogLi4uL3t2dWxr
YW4tdm9sa18xLjMuMjgzLjAuYmIgPT4gdnVsa2FuLXZvbGtfMS4zLjI5MC4wLmJifSAgICAgIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLXZvbGtfMS4zLjI4My4wLmJi
ID0+IHZ1bGthbi12b2xrXzEuMy4yOTAuMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12b2xrXzEuMy4yODMuMC5iYiBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXZvbGtfMS4zLjI5MC4wLmJiCnNpbWlsYXJpdHkg
aW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2Fu
LXZvbGtfMS4zLjI4My4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2Fu
L3Z1bGthbi12b2xrXzEuMy4yOTAuMC5iYgppbmRleCA1NDg1YWEwYjBkLi5lMWJhZDZhOTZkIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12b2xrXzEuMy4y
ODMuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12b2xrXzEu
My4yOTAuMC5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UubWQ7bWQ1PTEyZTZhZjNhMGUyYTVlNWRiZjc3OTZhYTgy
YjY0NjI2IgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vemV1eC92b2xrLmdpdDticmFu
Y2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIgotU1JDUkVWID0gIjNhODA2OGE1NzQxNzk0MGNmMmJm
OWQ4MzdhN2JiNjBkMDE1Y2EyZjEiCitTUkNSRVYgPSAiNDY2MDg1NDA3ZDVkMmY1MDU4M2ZkNjYz
YzFkNjVmOTNhNzcwOWQzZSIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi40NC4wCgo=

--===============6810432859734505462==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vulkan-volk: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/vulkan-volk: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dbg: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dbg: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dev: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dev: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-doc: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-doc: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-locale: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-locale: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-src: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-src: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-staticdev: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-staticdev: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk: PV changed from "1.3.283.0" to "1.3.290.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk: PKGV changed from 1.3.283.0 [default] to 1.3.290.0 [default]

--===============6810432859734505462==--

