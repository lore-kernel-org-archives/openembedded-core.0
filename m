Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC69C0729B
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:12 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.8643.1698848703154130801
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PpsRaWgs;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=guTM1wZB;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.193, mailfrom: 0101018b8b460ccd-e5e0e1ea-d797-4192-bc1f-53b26cedd05b-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=g801Bd/fDEAgnOmSPt6hPMebRt0li/x4JFxktnTqxBg=;
	b=PpsRaWgsEap6znSrF7mCqLn/1l0SUqXGluIqXGnfDGWLsTjYZ75Y7nG2JZTswcfm
	tjr5ih9v93K+yXPaRxFA6TwofRK7aP56JX1vbzmv/p3286tMI0zHdYBGXGtt303ofwe
	JffoUCoMy5u70RSzQ65lmAudqvbMtxsAp7R4ZSyY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=g801Bd/fDEAgnOmSPt6hPMebRt0li/x4JFxktnTqxBg=;
	b=guTM1wZBZmatZQu3qU8BnKFsH8T+9PU+5ZPgdJOUwJqVpqAMKsyF0n/8sarU420/
	+V9D+G6f5vMffYAFvdvKT6x9HWncnXsV8BbEj9bKVPXPVbxwU/NG//s8BYOB4kiJUQk
	HZOvnNKlCq592yV4nYfiyZPfWySTe0WW0GC9orjk=
Content-Type: multipart/mixed; boundary="===============3415822576608063536=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.3.268.0 SUCCEEDED
Message-ID: <0101018b8b460ccd-e5e0e1ea-d797-4192-bc1f-53b26cedd05b-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190013

--===============3415822576608063536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-headers* to *1.3.268.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-headers-upgrade-1.3.261.1-1.3.268.0.patch
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
From bcc10be9900643c4163ded1d26e7c9885f07edc6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 13:08:22 +0000
Subject: [PATCH] vulkan-headers: upgrade 1.3.261.1 -> 1.3.268.0

---
 ...{vulkan-headers_1.3.261.1.bb => vulkan-headers_1.3.268.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.261.1.bb => vulkan-headers_1.3.268.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb
index 01eb14b9fb..c26a54360b 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "85c2334e92e215cce34e8e0ed8b2dce4700f4a50"
+SRCREV = "7b3466a1f47a9251ac1113efbe022ff016e2f95b"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============3415822576608063536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vulkan-headers: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/vulkan-headers: PV changed from "1.3.261.1" to "1.3.268.0"
Changes to packages/core2-64-poky-linux/vulkan-headers (sysroot):
  /usr/include/vulkan/vulkan_hpp_macros.hpp was added
  /usr/include/vulkan/vulkan_shared.hpp was added
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dbg: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dbg: PV changed from "1.3.261.1" to "1.3.268.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 13556354 to 13847115 (+2%)
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/include/vulkan/vulkan_hpp_macros.hpp /usr/include/vulkan/vulkan_shared.hpp"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.3.261.1" to "1.3.268.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-doc: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-doc: PV changed from "1.3.261.1" to "1.3.268.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-locale: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-locale: PV changed from "1.3.261.1" to "1.3.268.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-src: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-src: PV changed from "1.3.261.1" to "1.3.268.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-staticdev: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-staticdev: PV changed from "1.3.261.1" to "1.3.268.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 10546716 to 11675666 (+11%)
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.3.261.1" to "1.3.268.0"

--===============3415822576608063536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/vulkan-headers (sysroot):
  /usr/include/vulkan/vulkan_hpp_macros.hpp was added
  /usr/include/vulkan/vulkan_shared.hpp was added
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/include/vulkan/vulkan_shared.hpp /usr/include/vulkan/vulkan_hpp_macros.hpp"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 10546716 to 11675666 (+11%)

--===============3415822576608063536==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.3.261.1-1.3.268.0.patch"

RnJvbSBiY2MxMGJlOTkwMDY0M2M0MTYzZGVkMWQyNmU3Yzk4ODVmMDdlZGM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMzowODoyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi1oZWFkZXJzOiB1cGdyYWRlIDEuMy4yNjEuMSAtPiAxLjMuMjY4LjAKCi0tLQogLi4ue3Z1
bGthbi1oZWFkZXJzXzEuMy4yNjEuMS5iYiA9PiB2dWxrYW4taGVhZGVyc18xLjMuMjY4LjAuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLWhlYWRlcnNfMS4zLjI2
MS4xLmJiID0+IHZ1bGthbi1oZWFkZXJzXzEuMy4yNjguMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yNjEuMS5i
YiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLWhlYWRlcnNfMS4zLjI2OC4w
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy92dWxrYW4vdnVsa2FuLWhlYWRlcnNfMS4zLjI2MS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yNjguMC5iYgppbmRleCAwMWVi
MTRiOWZiLi5jMjZhNTQzNjBiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yNjEuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yNjguMC5iYgpAQCAtMTEsNyArMTEsNyBAQCBM
SUNFTlNFID0gIkFwYWNoZS0yLjAgJiBNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFLm1kO21kNT0xYmMzNTVkOGM0MTk2Zjc3NGM4Yjg3ZWQxYThkZDYyNSIKIFNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLUhlYWRlcnMuZ2l0O2JyYW5j
aD1tYWluO3Byb3RvY29sPWh0dHBzIgogCi1TUkNSRVYgPSAiODVjMjMzNGU5MmUyMTVjY2UzNGU4
ZTBlZDhiMmRjZTQ3MDBmNGE1MCIKK1NSQ1JFViA9ICI3YjM0NjZhMWY0N2E5MjUxYWMxMTEzZWZi
ZTAyMmZmMDE2ZTJmOTViIgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjM5LjIKCg==

--===============3415822576608063536==--

