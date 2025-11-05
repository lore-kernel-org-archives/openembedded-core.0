Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3786CD13D2
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:23 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2353.1762384576266000481
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=qH10TuJj;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=QTo4J2wx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019a564e82a3-e3df88c7-f25f-444b-a615-5bcf176024b3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384577;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ln1fSfxQ1CzR7j96pIu1Is9yfbbSFz9REP2jailccsw=;
	b=qH10TuJjgGvCMKDF82esZeNH20B6prs4m7IL8i0PFBm1DEQ8qVL5kFg5JSx1sefX
	8heorcWXIE8SGBh3D/+EDQ+o89c0QDF+utTiA1jv6UjgHSGt9Fbxbncgl8Zx38c4KlH
	uBq6AEtlf5X7RPwO1DIL+Q6U8zpBGre2zhi9xrfY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384577;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ln1fSfxQ1CzR7j96pIu1Is9yfbbSFz9REP2jailccsw=;
	b=QTo4J2wxgUQQ3/qQOgH24cziSAPDxIaCQ6RjtL0kKB+w38ksDtCnzXArjkhvYhxQ
	GJXwnDaNSrfXyET2TKKfhhLrwd521N9T+zshuNRHfRI2loh5uTAPeTMFs6380xzSFLX
	p5Kk6UVE+X3ZSQF3huCjXHnlP0C++ZqSzWVWz59E=
Content-Type: multipart/mixed; boundary="===============4765716611945962889=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ttyrun: upgrading to 2.39.0 SUCCEEDED
Message-ID: <0101019a564e82a3-e3df88c7-f25f-444b-a615-5bcf176024b3-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225803

--===============4765716611945962889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ttyrun* to *2.39.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ttyrun-upgrade-2.38.0-2.39.0.patch
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
From 960a224ced2feb7787e894b1c6f7026d5b791c31 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 15:27:44 +0000
Subject: [PATCH] ttyrun: upgrade 2.38.0 -> 2.39.0

---
 meta/recipes-core/ttyrun/{ttyrun_2.38.0.bb => ttyrun_2.39.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.38.0.bb => ttyrun_2.39.0.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.38.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.39.0.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.38.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.39.0.bb
index 90380e51ea..c7ca8f3ec3 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.38.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.39.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "660bab6e68fded26b2117e1dcec0844549a22fed"
+SRCREV = "940ce6790021816f280fab66f443e4721d527833"
 
 CVE_PRODUCT = "s390-tools"
 
-- 
2.47.1


--===============4765716611945962889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ttyrun: SRC_URI changed from "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v2.38.0" to "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v2.39.0"
packages/x86-64-v3-poky-linux/ttyrun: PKGV changed from 2.38.0 [default] to 2.39.0 [default]
packages/x86-64-v3-poky-linux/ttyrun: PV changed from "2.38.0" to "2.39.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dbg: PKGV changed from 2.38.0 [default] to 2.39.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dbg: PV changed from "2.38.0" to "2.39.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dev: PKGV changed from 2.38.0 [default] to 2.39.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dev: PV changed from "2.38.0" to "2.39.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-doc: PKGV changed from 2.38.0 [default] to 2.39.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-doc: PV changed from "2.38.0" to "2.39.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-locale: PKGV changed from 2.38.0 [default] to 2.39.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-locale: PV changed from "2.38.0" to "2.39.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-src: PKGV changed from 2.38.0 [default] to 2.39.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-src: PV changed from "2.38.0" to "2.39.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-staticdev: PKGV changed from 2.38.0 [default] to 2.39.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-staticdev: PV changed from "2.38.0" to "2.39.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun: PKGV changed from 2.38.0 [default] to 2.39.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun: PV changed from "2.38.0" to "2.39.0"

--===============4765716611945962889==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ttyrun-upgrade-2.38.0-2.39.0.patch"

RnJvbSA5NjBhMjI0Y2VkMmZlYjc3ODdlODk0YjFjNmY3MDI2ZDViNzkxYzMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNToyNzo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHR0
eXJ1bjogdXBncmFkZSAyLjM4LjAgLT4gMi4zOS4wCgotLS0KIG1ldGEvcmVjaXBlcy1jb3JlL3R0
eXJ1bi97dHR5cnVuXzIuMzguMC5iYiA9PiB0dHlydW5fMi4zOS4wLmJifSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1jb3JlL3R0eXJ1bi97dHR5cnVuXzIuMzguMC5iYiA9PiB0dHlydW5fMi4zOS4wLmJifSAo
OTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5fMi4zOC4w
LmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvdHR5cnVuL3R0eXJ1bl8yLjM5LjAuYmIKc2ltaWxhcml0
eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvdHR5cnVuL3R0eXJ1bl8y
LjM4LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5fMi4zOS4w
LmJiCmluZGV4IDkwMzgwZTUxZWEuLmM3Y2E4ZjNlYzMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb3JlL3R0eXJ1bi90dHlydW5fMi4zOC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3R0
eXJ1bi90dHlydW5fMi4zOS4wLmJiCkBAIC03LDcgKzcsNyBAQCBMSUNFTlNFID0gIk1JVCIKIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWY1MTE4ZjE2N2IwNTViZmQ3YzM0
NTA4MDNmMTg0N2FmIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vaWJtLXMzOTAtbGlu
dXgvczM5MC10b29scztwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyO3RhZz12JHtQVn0iCi1T
UkNSRVYgPSAiNjYwYmFiNmU2OGZkZWQyNmIyMTE3ZTFkY2VjMDg0NDU0OWEyMmZlZCIKK1NSQ1JF
ViA9ICI5NDBjZTY3OTAwMjE4MTZmMjgwZmFiNjZmNDQzZTQ3MjFkNTI3ODMzIgogCiBDVkVfUFJP
RFVDVCA9ICJzMzkwLXRvb2xzIgogCi0tIAoyLjQ3LjEKCg==

--===============4765716611945962889==--

