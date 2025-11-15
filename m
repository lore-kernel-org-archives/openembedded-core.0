Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC3FCED607
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:04 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12133.1763224737780450573
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=onGDh3bH;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=cW3/8Uue;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019a88625d55-4a96d8f6-3166-4871-b40d-6336e8ba7a5d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jH+SB3CvpaSI/ENA2Ja/lxO5VPa2l+gbzFzgFN+Saxw=;
	b=onGDh3bH8vaBd1wvW7S9a7K7kOVnwPbELoqDKl6ulo1KgDTaIub1klQkXrDLC7n9
	aWIpMthj3DdPLEtjEjAkHYZQXBila2jR9przQVkXz70FP5008oFzfY9gpAZ8uKirkVj
	qmRRLPCwNmVqx1bDdV1HleTwiShdUBX5e7gYbiRo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jH+SB3CvpaSI/ENA2Ja/lxO5VPa2l+gbzFzgFN+Saxw=;
	b=cW3/8Uue8YtHvof69S7jAI1oHU5ltRMRn06WUyrGsseqM5hhUGtoqlSrTcLlGXpl
	2HGLAI2KZwOD+zjGWI83BTjaHPIEULSPq8jOkDGEFClyUYGjo9IfPbJ4TaiL+Y4vRJh
	i6VxfRkdeLkUkK7lfDaMpXrzCg62+RrjeSGLemrg=
Content-Type: multipart/mixed; boundary="===============7791842012880053032=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] squashfs-tools: upgrading to 4.7.4 SUCCEEDED
Message-ID: <0101019a88625d55-4a96d8f6-3166-4871-b40d-6336e8ba7a5d-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226392

--===============7791842012880053032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *squashfs-tools* to *4.7.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-squashfs-tools-upgrade-4.7.2-4.7.4.patch
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
From 34163db5b40610087ed22753be9de79d958fd63c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 12:00:58 +0000
Subject: [PATCH] squashfs-tools: upgrade 4.7.2 -> 4.7.4

---
 .../{squashfs-tools_4.7.2.bb => squashfs-tools_4.7.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/squashfs-tools/{squashfs-tools_4.7.2.bb => squashfs-tools_4.7.4.bb} (96%)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.2.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.4.bb
similarity index 96%
rename from meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.2.bb
rename to meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.4.bb
index 8bca98f419..eb3974bcb5 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.2.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.4.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https;branch=master;tag=${PV}"
-SRCREV = "99d23a31b471433c51e9c145aeba2ab1536e34df"
+SRCREV = "bad1d213ab6df587d6fa0ef7286180fbf7b86167"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-- 
2.47.1


--===============7791842012880053032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/squashfs-tools: SRC_URI changed from "git://github.com/plougher/squashfs-tools.git;protocol=https;branch=master;tag=4.7.2" to "git://github.com/plougher/squashfs-tools.git;protocol=https;branch=master;tag=4.7.4"
packages/x86-64-v3-poky-linux/squashfs-tools: PKGV changed from 4.7.2 [default] to 4.7.4 [default]
packages/x86-64-v3-poky-linux/squashfs-tools: PV changed from "4.7.2" to "4.7.4"
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-dbg: PKGV changed from 4.7.2 [default] to 4.7.4 [default]
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-dbg: PKGSIZE changed from 1582472 to 1606008 (+1%)
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-dbg: PV changed from "4.7.2" to "4.7.4"
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-dev: PKGV changed from 4.7.2 [default] to 4.7.4 [default]
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-dev: PKGSIZE changed from 13493 to 13588 (+1%)
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-dev: PV changed from "4.7.2" to "4.7.4"
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-doc: PKGV changed from 4.7.2 [default] to 4.7.4 [default]
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-doc: PKGSIZE changed from 22944 to 23454 (+2%)
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-doc: PV changed from "4.7.2" to "4.7.4"
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-locale: PKGV changed from 4.7.2 [default] to 4.7.4 [default]
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-locale: PV changed from "4.7.2" to "4.7.4"
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-src: PKGV changed from 4.7.2 [default] to 4.7.4 [default]
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-src: PKGSIZE changed from 1088359 to 1102360 (+1%)
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-src: PV changed from "4.7.2" to "4.7.4"
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-staticdev: PKGV changed from 4.7.2 [default] to 4.7.4 [default]
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-staticdev: PV changed from "4.7.2" to "4.7.4"
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools: PKGV changed from 4.7.2 [default] to 4.7.4 [default]
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools: PKGSIZE changed from 554676 to 563060 (+2%)
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools: PV changed from "4.7.2" to "4.7.4"

--===============7791842012880053032==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-squashfs-tools-upgrade-4.7.2-4.7.4.patch"

RnJvbSAzNDE2M2RiNWI0MDYxMDA4N2VkMjI3NTNiZTlkZTc5ZDk1OGZkNjNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTI6MDA6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cXVhc2hmcy10b29sczogdXBncmFkZSA0LjcuMiAtPiA0LjcuNAoKLS0tCiAuLi4ve3NxdWFzaGZz
LXRvb2xzXzQuNy4yLmJiID0+IHNxdWFzaGZzLXRvb2xzXzQuNy40LmJifSAgICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3F1YXNoZnMtdG9vbHMve3NxdWFzaGZzLXRvb2xzXzQuNy4y
LmJiID0+IHNxdWFzaGZzLXRvb2xzXzQuNy40LmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9zcXVhc2hmcy10b29scy9zcXVhc2hmcy10b29sc180LjcuMi5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9zcXVhc2hmcy10b29scy9zcXVhc2hmcy10b29sc180Ljcu
NC5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvc3F1YXNoZnMtdG9vbHMvc3F1YXNoZnMtdG9vbHNfNC43LjIuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9zcXVhc2hmcy10b29scy9zcXVhc2hmcy10b29sc180LjcuNC5iYgpp
bmRleCA4YmNhOThmNDE5Li5lYjM5NzRiY2I1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvc3F1YXNoZnMtdG9vbHMvc3F1YXNoZnMtdG9vbHNfNC43LjIuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3NxdWFzaGZzLXRvb2xzL3NxdWFzaGZzLXRvb2xzXzQuNy40LmJiCkBA
IC02LDcgKzYsNyBAQCBMSUNFTlNFID0gIkdQTC0yLjAtb25seSIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PWIyMzRlZTRkNjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIgog
CiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vcGxvdWdoZXIvc3F1YXNoZnMtdG9vbHMuZ2l0
O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXI7dGFnPSR7UFZ9IgotU1JDUkVWID0gIjk5ZDIz
YTMxYjQ3MTQzM2M1MWU5YzE0NWFlYmEyYWIxNTM2ZTM0ZGYiCitTUkNSRVYgPSAiYmFkMWQyMTNh
YjZkZjU4N2Q2ZmEwZWY3Mjg2MTgwZmJmN2I4NjE2NyIKIAogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFH
UkVHRVggPSAiKD9QPHB2ZXI+KFxkKyhcLlxkKykrKSkiCiAKLS0gCjIuNDcuMQoK

--===============7791842012880053032==--

