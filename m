Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0CEDCD342E
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:38 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15613.1777645533763619911
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=k8Y2kfdl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=YZ3ovAlf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019de3ee4072-f34492da-73dc-48f6-a3b9-642e7e0285de-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tkoeAQMiROlY7jXueuv+KAnhqML8FEs2Rfg0gT/C5yk=;
	b=k8Y2kfdlmVjq8W+jhLena6k1bfcFzeeGsK5gMNvc/f6PGWd7BxhhaBcJ7uMebayP
	L2qJs+PVVnnIYsOjMCXiIn3yToTlsdYmo35+jEadmMr7OK3I7t2OhVC1/VJ0MX5mNic
	moP8hMCm+BBdnssknAZZ5slvFmjTrPYM/guGebdk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tkoeAQMiROlY7jXueuv+KAnhqML8FEs2Rfg0gT/C5yk=;
	b=YZ3ovAlf/iDbrxRD9XrOUxTKoGt/sL5h8VE81pSsN+UcU74d7h1i/tbddV7UK8Hr
	WRbs1Qt+npfhd3gWpyk9Iq2R86dNRblhCoYlN/blAT0dJdRa2T98c8+C84Dl1USt+s+
	B00Nbmbn+O/f9puSb4K2FTRALL7OBtyVeFu3nXgs=
Content-Type: multipart/mixed; boundary="===============2842356405739589678=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ttyrun: upgrading to 2.42.0 SUCCEEDED
Message-ID: <0101019de3ee4072-f34492da-73dc-48f6-a3b9-642e7e0285de-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236219

--===============2842356405739589678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ttyrun* to *2.42.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ttyrun-upgrade-2.41.0-2.42.0.patch
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
From 01ef154aff92f045703a498036acf210d9a9c0b7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 07:09:05 +0000
Subject: [PATCH] ttyrun: upgrade 2.41.0 -> 2.42.0

---
 meta/recipes-core/ttyrun/{ttyrun_2.41.0.bb => ttyrun_2.42.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.41.0.bb => ttyrun_2.42.0.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.41.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.42.0.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.41.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.42.0.bb
index 59dfab7122..811a4da70a 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.41.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.42.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "5e07b30bdf67623e7a6d3850e26208b642d416d7"
+SRCREV = "997343f8417ab0af0ceb869e7a34b23cae3061e3"
 
 CVE_PRODUCT = "s390-tools"
 
-- 
2.47.1


--===============2842356405739589678==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ttyrun-upgrade-2.41.0-2.42.0.patch"

RnJvbSAwMWVmMTU0YWZmOTJmMDQ1NzAzYTQ5ODAzNmFjZjIxMGQ5YTljMGI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwNzowOTowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHR0
eXJ1bjogdXBncmFkZSAyLjQxLjAgLT4gMi40Mi4wCgotLS0KIG1ldGEvcmVjaXBlcy1jb3JlL3R0
eXJ1bi97dHR5cnVuXzIuNDEuMC5iYiA9PiB0dHlydW5fMi40Mi4wLmJifSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1jb3JlL3R0eXJ1bi97dHR5cnVuXzIuNDEuMC5iYiA9PiB0dHlydW5fMi40Mi4wLmJifSAo
OTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5fMi40MS4w
LmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvdHR5cnVuL3R0eXJ1bl8yLjQyLjAuYmIKc2ltaWxhcml0
eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvdHR5cnVuL3R0eXJ1bl8y
LjQxLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5fMi40Mi4w
LmJiCmluZGV4IDU5ZGZhYjcxMjIuLjgxMWE0ZGE3MGEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb3JlL3R0eXJ1bi90dHlydW5fMi40MS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3R0
eXJ1bi90dHlydW5fMi40Mi4wLmJiCkBAIC03LDcgKzcsNyBAQCBMSUNFTlNFID0gIk1JVCIKIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWY1MTE4ZjE2N2IwNTViZmQ3YzM0
NTA4MDNmMTg0N2FmIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vaWJtLXMzOTAtbGlu
dXgvczM5MC10b29scztwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyO3RhZz12JHtQVn0iCi1T
UkNSRVYgPSAiNWUwN2IzMGJkZjY3NjIzZTdhNmQzODUwZTI2MjA4YjY0MmQ0MTZkNyIKK1NSQ1JF
ViA9ICI5OTczNDNmODQxN2FiMGFmMGNlYjg2OWU3YTM0YjIzY2FlMzA2MWUzIgogCiBDVkVfUFJP
RFVDVCA9ICJzMzkwLXRvb2xzIgogCi0tIAoyLjQ3LjEKCg==

--===============2842356405739589678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ttyrun: PV changed from "2.41.0" to "2.42.0"
packages/x86-64-v3-poky-linux/ttyrun: PKGV changed from 2.41.0 [default] to 2.42.0 [default]
packages/x86-64-v3-poky-linux/ttyrun: SRC_URI changed from "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v2.41.0" to "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v2.42.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dbg: PV changed from "2.41.0" to "2.42.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dbg: PKGV changed from 2.41.0 [default] to 2.42.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dev: PV changed from "2.41.0" to "2.42.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dev: PKGV changed from 2.41.0 [default] to 2.42.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-doc: PV changed from "2.41.0" to "2.42.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-doc: PKGV changed from 2.41.0 [default] to 2.42.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-locale: PV changed from "2.41.0" to "2.42.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-locale: PKGV changed from 2.41.0 [default] to 2.42.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-src: PV changed from "2.41.0" to "2.42.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-src: PKGV changed from 2.41.0 [default] to 2.42.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-src: FILELIST: directory renamed /usr/src/debug/ttyrun/2.41.0/iucvterm/src -> /usr/src/debug/ttyrun/2.42.0/iucvterm/src
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-staticdev: PV changed from "2.41.0" to "2.42.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-staticdev: PKGV changed from 2.41.0 [default] to 2.42.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun: PV changed from "2.41.0" to "2.42.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun: PKGV changed from 2.41.0 [default] to 2.42.0 [default]

--===============2842356405739589678==--

