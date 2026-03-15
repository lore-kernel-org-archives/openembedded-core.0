Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A8CEFCBD4
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:42:13 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28975.1773582120340123242
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=eHBC6gGQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kZEToC3e;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019cf1bb734e-c5aa0c38-4e4d-4bf5-bb7f-9739b5d350eb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582119;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RCYxvzHsysoe+P983RzwB841VftHdvBOWVxYB4OH1rM=;
	b=eHBC6gGQ0O0W3pR+LxO3Br19vbNK0D2zH5s4PNtbhgEpk4FYZTD5gO1bBUyeFtKo
	8SyxqGb3ylupBn+KyJcR0aXfcZ68NBEZvrrJLDz/8TJf7MfnqO22W3gT9YUhAF2UXzc
	fGXfWDzu83z1INDzLFlUJSIhAmFXcNjcTM81ThFc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582119;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RCYxvzHsysoe+P983RzwB841VftHdvBOWVxYB4OH1rM=;
	b=kZEToC3e3uzCiskC3qX88Q95kIJSXx6FiUhBnTYHT10WJIXCFRHYMvUBBk2WQ/dU
	1muBPgLJRLCoABSrpqSqcGfd/K5wSzeZiB12uFDUBoKDioKdCDM41BZMwjuN5RmNmCl
	Vdf/zDGNoko9EA9qLTcaTk+ytoACm6hdaJzAWgfk=
Content-Type: multipart/mixed; boundary="===============5187431227049793872=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] squashfs-tools: upgrading to 4.7.5 SUCCEEDED
Message-ID: <0101019cf1bb734e-c5aa0c38-4e4d-4bf5-bb7f-9739b5d350eb-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:41:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233155

--===============5187431227049793872==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *squashfs-tools* to *4.7.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-squashfs-tools-upgrade-4.7.4-4.7.5.patch
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
From f87ad7b0bdce50e021e9d19ead0d18d9b402317f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 09:02:18 +0000
Subject: [PATCH] squashfs-tools: upgrade 4.7.4 -> 4.7.5

---
 .../{squashfs-tools_4.7.4.bb => squashfs-tools_4.7.5.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/squashfs-tools/{squashfs-tools_4.7.4.bb => squashfs-tools_4.7.5.bb} (96%)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.4.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb
similarity index 96%
rename from meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.4.bb
rename to meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb
index eb3974bcb5..7741039fcf 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.4.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https;branch=master;tag=${PV}"
-SRCREV = "bad1d213ab6df587d6fa0ef7286180fbf7b86167"
+SRCREV = "708c59ae80853b0845017c33b42e56061cc546cd"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-- 
2.47.1


--===============5187431227049793872==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/squashfs-tools: SRC_URI changed from "git://github.com/plougher/squashfs-tools.git;protocol=https;branch=master;tag=4.7.4" to "git://github.com/plougher/squashfs-tools.git;protocol=https;branch=master;tag=4.7.5"
packages/x86-64-v3-poky-linux/squashfs-tools: PKGV changed from 4.7.4 [default] to 4.7.5 [default]
packages/x86-64-v3-poky-linux/squashfs-tools: PV changed from "4.7.4" to "4.7.5"
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-dbg: PKGSIZE changed from 1606896 to 1613272 (+0%)
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-dbg: PKGV changed from 4.7.4 [default] to 4.7.5 [default]
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-dbg: PV changed from "4.7.4" to "4.7.5"
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-dev: PKGV changed from 4.7.4 [default] to 4.7.5 [default]
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-dev: PV changed from "4.7.4" to "4.7.5"
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-doc: PKGSIZE changed from 23454 to 23616 (+1%)
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-doc: PKGV changed from 4.7.4 [default] to 4.7.5 [default]
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-doc: PV changed from "4.7.4" to "4.7.5"
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-locale: PKGV changed from 4.7.4 [default] to 4.7.5 [default]
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-locale: PV changed from "4.7.4" to "4.7.5"
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-src: FILELIST: directory renamed /usr/src/debug/squashfs-tools/4.7.4/squashfs-tools -> /usr/src/debug/squashfs-tools/4.7.5/squashfs-tools
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-src: PKGSIZE changed from 1102360 to 1109063 (+1%)
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-src: PKGV changed from 4.7.4 [default] to 4.7.5 [default]
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-src: PV changed from "4.7.4" to "4.7.5"
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-staticdev: PKGV changed from 4.7.4 [default] to 4.7.5 [default]
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools-staticdev: PV changed from "4.7.4" to "4.7.5"
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools: PKGSIZE changed from 563060 to 571252 (+1%)
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools: PKGV changed from 4.7.4 [default] to 4.7.5 [default]
packages/x86-64-v3-poky-linux/squashfs-tools/squashfs-tools: PV changed from "4.7.4" to "4.7.5"

--===============5187431227049793872==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-squashfs-tools-upgrade-4.7.4-4.7.5.patch"

RnJvbSBmODdhZDdiMGJkY2U1MGUwMjFlOWQxOWVhZDBkMThkOWI0MDIzMTdmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMDk6MDI6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cXVhc2hmcy10b29sczogdXBncmFkZSA0LjcuNCAtPiA0LjcuNQoKLS0tCiAuLi4ve3NxdWFzaGZz
LXRvb2xzXzQuNy40LmJiID0+IHNxdWFzaGZzLXRvb2xzXzQuNy41LmJifSAgICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3F1YXNoZnMtdG9vbHMve3NxdWFzaGZzLXRvb2xzXzQuNy40
LmJiID0+IHNxdWFzaGZzLXRvb2xzXzQuNy41LmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9zcXVhc2hmcy10b29scy9zcXVhc2hmcy10b29sc180LjcuNC5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9zcXVhc2hmcy10b29scy9zcXVhc2hmcy10b29sc180Ljcu
NS5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvc3F1YXNoZnMtdG9vbHMvc3F1YXNoZnMtdG9vbHNfNC43LjQuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9zcXVhc2hmcy10b29scy9zcXVhc2hmcy10b29sc180LjcuNS5iYgpp
bmRleCBlYjM5NzRiY2I1Li43NzQxMDM5ZmNmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvc3F1YXNoZnMtdG9vbHMvc3F1YXNoZnMtdG9vbHNfNC43LjQuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3NxdWFzaGZzLXRvb2xzL3NxdWFzaGZzLXRvb2xzXzQuNy41LmJiCkBA
IC02LDcgKzYsNyBAQCBMSUNFTlNFID0gIkdQTC0yLjAtb25seSIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PWIyMzRlZTRkNjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIgog
CiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vcGxvdWdoZXIvc3F1YXNoZnMtdG9vbHMuZ2l0
O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXI7dGFnPSR7UFZ9IgotU1JDUkVWID0gImJhZDFk
MjEzYWI2ZGY1ODdkNmZhMGVmNzI4NjE4MGZiZjdiODYxNjciCitTUkNSRVYgPSAiNzA4YzU5YWU4
MDg1M2IwODQ1MDE3YzMzYjQyZTU2MDYxY2M1NDZjZCIKIAogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFH
UkVHRVggPSAiKD9QPHB2ZXI+KFxkKyhcLlxkKykrKSkiCiAKLS0gCjIuNDcuMQoK

--===============5187431227049793872==--

